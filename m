Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.4881.1587694064607048417
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 19:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03O27D5r000664
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 19:07:33 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 23 Apr
 2020 19:07:15 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] netkit-telnet: fix CVE-2020-10188
Date: Fri, 24 Apr 2020 10:07:13 +0800
Message-ID: <20200424020713.16627-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2020-10188

Patch from Fedora:
https://src.fedoraproject.org/rpms/telnet/raw/master/f/telnet-0.17-overflow-exploit.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../netkit-telnet/files/CVE-2020-10188.patch  | 112 ++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb       |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE-2020-10188.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2020-10188.patch b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2020-10188.patch
new file mode 100644
index 000000000..d21c60274
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2020-10188.patch
@@ -0,0 +1,112 @@
+From 6ab007dbb1958371abff2eaaad2b26da89b3c74e Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 24 Apr 2020 09:43:44 +0800
+Subject: [PATCH] telnetd/utility.c: fix CVE-2020-10188
+
+Upstream-Status: Backport
+[Fedora: https://src.fedoraproject.org/rpms/telnet/raw/master/f/telnet-0.17-overflow-exploit.patch]
+
+CVE: CVE-2020-10188
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ telnetd/utility.c | 32 +++++++++++++++++++++-----------
+ 1 file changed, 21 insertions(+), 11 deletions(-)
+
+diff --git a/telnetd/utility.c b/telnetd/utility.c
+index 75314cb..b9a46a6 100644
+--- a/telnetd/utility.c
++++ b/telnetd/utility.c
+@@ -169,31 +169,38 @@ void 	ptyflush(void)
+  */
+ static
+ char *
+-nextitem(char *current)
++nextitem(char *current, const char *endp)
+ {
++    if (current >= endp) {
++        return NULL;
++    }
+     if ((*current&0xff) != IAC) {
+ 	return current+1;
+     }
++    if (current+1 >= endp) {
++        return NULL;
++    }
+     switch (*(current+1)&0xff) {
+     case DO:
+     case DONT:
+     case WILL:
+     case WONT:
+-	return current+3;
++	return current+3 <= endp ? current+3 : NULL;
+     case SB:		/* loop forever looking for the SE */
+ 	{
+ 	    register char *look = current+2;
+ 
+-	    for (;;) {
++	    while (look < endp) {
+ 		if ((*look++&0xff) == IAC) {
+-		    if ((*look++&0xff) == SE) {
++		    if (look < endp && (*look++&0xff) == SE) {
+ 			return look;
+ 		    }
+ 		}
+ 	    }
++	    return NULL;
+ 	}
+     default:
+-	return current+2;
++	return current+2 <= endp ? current+2 : NULL;
+     }
+ }  /* end of nextitem */
+ 
+@@ -219,7 +226,7 @@ void netclear(void)
+     register char *thisitem, *next;
+     char *good;
+ #define	wewant(p)	((nfrontp > p) && ((*p&0xff) == IAC) && \
+-				((*(p+1)&0xff) != EC) && ((*(p+1)&0xff) != EL))
++				(nfrontp > p+1 && (((*(p+1)&0xff) != EC) && ((*(p+1)&0xff) != EL))))
+ 
+ #if	defined(ENCRYPT)
+     thisitem = nclearto > netobuf ? nclearto : netobuf;
+@@ -227,7 +234,7 @@ void netclear(void)
+     thisitem = netobuf;
+ #endif
+ 
+-    while ((next = nextitem(thisitem)) <= nbackp) {
++    while ((next = nextitem(thisitem, nbackp)) != NULL && next <= nbackp) {
+ 	thisitem = next;
+     }
+ 
+@@ -239,20 +246,23 @@ void netclear(void)
+     good = netobuf;	/* where the good bytes go */
+ #endif
+ 
+-    while (nfrontp > thisitem) {
++    while (thisitem != NULL && nfrontp > thisitem) {
+ 	if (wewant(thisitem)) {
+ 	    int length;
+ 
+ 	    next = thisitem;
+ 	    do {
+-		next = nextitem(next);
+-	    } while (wewant(next) && (nfrontp > next));
++		next = nextitem(next, nfrontp);
++	    } while (next != NULL && wewant(next) && (nfrontp > next));
++	    if (next == NULL) {
++		next = nfrontp;
++	    }
+ 	    length = next-thisitem;
+ 	    bcopy(thisitem, good, length);
+ 	    good += length;
+ 	    thisitem = next;
+ 	} else {
+-	    thisitem = nextitem(thisitem);
++	    thisitem = nextitem(thisitem, nfrontp);
+ 	}
+     }
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index ffd3b48e8..0e92add63 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar.gz \
            file://cross-compile.patch \
            file://0001-telnet-telnetd-Fix-print-format-strings.patch \
            file://0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch \
+           file://CVE-2020-10188.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
-- 
2.17.1

