Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.8891.1589649812176474359
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 10:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:43034 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ja0X4-00HFoA-5H
	for openembedded-devel@lists.openembedded.org; Sat, 16 May 2020 13:23:31 -0400
Date: Sat, 16 May 2020 13:23:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] meta-python: delete superfluous python-mako.inc
Message-ID: <alpine.LFD.2.21.2005161320580.16966@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

The actual python-mako recipe is in OE, and apparently this .inc file
is historical cruft left over after py2 recipes were moved into their
own layer.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-python/recipes-devtools/python/python-mako.inc b/meta-python/recipes-devtools/python/python-mako.inc
deleted file mode 100644
index abcbb8841..000000000
--- a/meta-python/recipes-devtools/python/python-mako.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "A super-fast templating language that borrows the best ideas from the existing templating languages"
-HOMEPAGE = "http://www.makotemplates.org/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=df7e6c7c82990acf0228a55e00d29bc9"
-
-PYPI_PACKAGE = "Mako"
-
-inherit pypi
-
-SRC_URI[md5sum] = "6c3f2da0b74af529a4c4a537d0848bf2"
-SRC_URI[sha256sum] = "a36919599a9b7dc5d86a7a8988f23a9a3a3d083070023bab23d64f7f1d1e0a4b"
-
-RDEPENDS_${PN} = " \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
