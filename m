Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web12.7077.1595284051341806477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 15:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=lDkvWP/D;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: jpitti@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3898; q=dns/txt; s=iport;
  t=1595284051; x=1596493651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nRvSJ5RsefpKwNCDDexGu0Un1hze0KgqeFYfkUKB9wU=;
  b=lDkvWP/DHnfss90T50pE1ljqcka9jXCqOSTyM9rT27izxalNScFNqBSU
   lZtkW85b5HXX0MRgQ4tLcxQhVV1tuD9a6zvguk2i8sbMBw6ouRnZt9CPh
   1+yAfFbxzSQVqkivMDueE1UbuW9eDghhN8Czs+XaE44ECkszWo9RvF7Z4
   Q=;
X-IronPort-AV: E=Sophos;i="5.75,375,1589241600"; 
   d="scan'208";a="709946266"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 20 Jul 2020 22:27:30 +0000
Received: from sjc-ads-2033.cisco.com (sjc-ads-2033.cisco.com [171.70.61.221])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 06KMRUGS015939;
	Mon, 20 Jul 2020 22:27:30 GMT
Received: by sjc-ads-2033.cisco.com (Postfix, from userid 396877)
	id 038DDD03; Mon, 20 Jul 2020 15:27:29 -0700 (PDT)
From: "Julius Hemanth Pitti" <jpitti@cisco.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: xe-linux-external@cisco.com, Julius Hemanth Pitti <jpitti@cisco.com>
Subject: [meta-oe][PATCH] netkit-telnetd: Fix buffer overflow in netoprintf
Date: Mon, 20 Jul 2020 15:19:46 -0700
Message-Id: <20200720221946.33011-1-jpitti@cisco.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.70.61.221, sjc-ads-2033.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Content-Transfer-Encoding: 8bit

netoprintf() was not handling a case where
return value of vsnprintf is greater than
"size"(2nd argument), results in buffer overflow
while adjusting "nfrontp" pointer to point
beyond "netobuf" buffer.

Here is one such case where "nfrontp"
crossed boundaries of "netobuf", and
pointing to another global variable.

(gdb) p &netobuf[8255]
$5 = 0x55c93afe8b1f <netobuf+8255> ""
(gdb) p nfrontp
$6 = 0x55c93afe8c20 <terminaltype> "\377"
(gdb) p &terminaltype
$7 = (char **) 0x55c93afe8c20 <terminaltype>
(gdb)

This resulted in crash of telnetd service
with segmentation fault.

Signed-off-by: Julius Hemanth Pitti <jpitti@cisco.com>
---
 ....c-Fix-buffer-overflow-in-netoprintf.patch | 56 +++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
new file mode 100644
index 000000000..8f983e40a
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
@@ -0,0 +1,56 @@
+From 9c81c8e5bc7782e8ae12c078615abc3c896059f2 Mon Sep 17 00:00:00 2001
+From: Julius Hemanth Pitti <jpitti@cisco.com>
+Date: Tue, 14 Jul 2020 22:34:19 -0700
+Subject: [PATCH] telnetd/utility.c: Fix buffer overflow in netoprintf
+
+As per man page of vsnprintf, when formated
+string size is greater than "size"(2nd argument),
+then vsnprintf returns size of formated string,
+not "size"(2nd argument).
+
+netoprintf() was not handling a case where
+return value of vsnprintf is greater than
+"size"(2nd argument), results in buffer overflow
+while adjusting "nfrontp" pointer to point
+beyond "netobuf" buffer.
+
+Here is one such case where "nfrontp"
+crossed boundaries of "netobuf", and
+pointing to another global variable.
+
+(gdb) p &netobuf[8255]
+$5 = 0x55c93afe8b1f <netobuf+8255> ""
+(gdb) p nfrontp
+$6 = 0x55c93afe8c20 <terminaltype> "\377"
+(gdb) p &terminaltype
+$7 = (char **) 0x55c93afe8c20 <terminaltype>
+(gdb)
+
+This resulted in crash of telnetd service
+with segmentation fault.
+
+Though this is DoS security bug, I couldn't
+find any CVE ID for this.
+
+Upstream-Status: Pending
+
+Signed-off-by: Julius Hemanth Pitti <jpitti@cisco.com>
+---
+ telnetd/utility.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/telnetd/utility.c b/telnetd/utility.c
+index b9a46a6..4811f14 100644
+--- a/telnetd/utility.c
++++ b/telnetd/utility.c
+@@ -66,7 +66,7 @@ netoprintf(const char *fmt, ...)
+       len = vsnprintf(nfrontp, maxsize, fmt, ap);
+       va_end(ap);
+ 
+-      if (len<0 || len==maxsize) {
++      if (len<0 || len>=maxsize) {
+ 	 /* didn't fit */
+ 	 netflush();
+       }
+--
+2.19.1
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 0e92add63..08dd532b6 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar.gz \
            file://0001-telnet-telnetd-Fix-print-format-strings.patch \
            file://0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch \
            file://CVE-2020-10188.patch \
+           file://0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
-- 
2.19.1

