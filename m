Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.3039.1599324969792885487
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FmF/s7eR;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id a8so2570163plm.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AZG17uf79ReWj2wqD3rj7fHf1SZsh8LGxjnZyZcONcw=;
        b=FmF/s7eR0nX+q2ZDziEB9YNnfTjquh7s40ckZmcMzqtGJMNV0XfBgj9L3uneQFjZHp
         gyKBGx6pWDFwhDEkdtUPqtIZTPdSczJWi5B7cromu86A6OmQLybBSN86QUFwO5rKy/bL
         7l6NFUw9JoNkQgDCs5uqfZfgEgAn7cpD4zAKoz9Lr7HZftZZP8/y7ibVp5DH203k50rU
         HRvEBsBP11sG0iSh2N4sfkXTHwsNbm/VJRK/9fb0V1sFJN3xcotSqFMp0zzmUbEuI1Ca
         whI8xnA1FU2elS9YK0tyNWv6BrI5neqtIaM75QHK50uSqVcdUxzW1zoHXItzP0Bm/1jE
         GvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AZG17uf79ReWj2wqD3rj7fHf1SZsh8LGxjnZyZcONcw=;
        b=i7umXZSLiPiXmoQxKcWNmDFHLrHjysU+hAZSsk60nqqcTf3Jwx/0DOYXvlfS+MTV02
         Srs3JDPLXSVu8j2WJQz3uig4XfgA3mKisYFO8fiWF2EhFsyyx/+fxbHi2UvSwe6xImNN
         udW3/m4ed2Ggn7gtAec5ovX2K/m7cfdzKDy9Z9QSf8QFiyEDLdcwHaGAUAi/XCc+ij5M
         ef+26mGrRbfIpvNvtHRYtJp/MvqgPO0TBW1NCWwridItOqzmZLqYDnsUVl35TxageM6M
         V2qx4+xuaFeBE3WYzkKTmMKfObTTGNOdY3zKqR4N1C6NFvbnARVczwjAJDwIPYjmRpE8
         oW4A==
X-Gm-Message-State: AOAM532b8FMuUmSn2N9KxanGxCjXNAqnQAkCJGMuFBJdbHhbU46meQQw
	fTA5OrC4r5YhdVHvMklScNnaqk58vn0=
X-Google-Smtp-Source: ABdhPJyC+Ta+CnT5175eOcioEFGO6M4LWBi38FoKUF8h95JLNnBL7ij52XMBBaomZtPOGEqeUbU3iw==
X-Received: by 2002:a17:902:a985:: with SMTP id bh5mr13512604plb.175.1599324969118;
        Sat, 05 Sep 2020 09:56:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:08 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/20] netkit-telnetd: Fix buffer overflow in netoprintf
Date: Sat,  5 Sep 2020 09:55:46 -0700
Message-Id: <b4be735fdb1bbc97e147739c217ad5b62e74fa61.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Julius Hemanth Pitti <jpitti@cisco.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 232b82afd405c526f822294509e1d32388544ed4)
[appears to be CVE-2020-10188]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ....c-Fix-buffer-overflow-in-netoprintf.patch | 56 +++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
new file mode 100644
index 0000000000..8f983e40ab
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
index 0e92add633..08dd532b62 100644
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
2.17.1

