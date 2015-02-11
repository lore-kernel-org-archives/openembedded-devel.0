Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id CDF99732E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:48:16 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u56so2519881wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 02:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z2kI54UIxBmVVt7x8ESkCtoOB0q3/gi/81acQnDzEvg=;
	b=WDYoYAmydE6iss1OJk9dMcHKH4vGWxLugmg2sDvsYvimrtO7+hEhHZgW6xxOxqAX+R
	OzYo0hm2hjzTpik4vHhuSPRUaRf98xycc+C497ekmr7oc8PFf1+NPDw8T1cTKcbFFd7u
	AwJTAHqJC3peAsiNAI4h7vl+anM9E/KwA5CX0ahritioq0NiR410nOmwqA7UmC8rVB/i
	F36Nl0YUPCIHQ9r6Eoy98MGC9Rx71IeGrR2GuzOMe0MpwQnpO5/wvzz46nUbD9lIm78d
	LY0/i5lkDFlEgBtpTGMGsao0n2sXZTGPfERVHp5zr8rSn9a3X26buiufH0+KsSTamMZG
	uQQg==
X-Received: by 10.180.88.193 with SMTP id bi1mr54614475wib.70.1423651697505;
	Wed, 11 Feb 2015 02:48:17 -0800 (PST)
Received: from localhost.localdomain (pD9F9B63C.dip0.t-ipconnect.de.
	[217.249.182.60])
	by mx.google.com with ESMTPSA id hn2sm747230wjc.5.2015.02.11.02.48.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Feb 2015 02:48:16 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Feb 2015 11:47:57 +0100
Message-Id: <1423651677-15387-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Subject: [meta-oe][PATCH] stunnel: Update to 5.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 10:48:25 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-support/stunnel/stunnel_4.56.bb            | 17 -----------------
 .../recipes-support/stunnel/stunnel_5.10.bb            | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.bb
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.10.bb

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
deleted file mode 100644
index 74f2234..0000000
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Program for providing universal TLS/SSL tunneling service"
-DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
-DEPENDS = "openssl zlib tcp-wrappers"
-
-RDEPENDS_${PN} += "perl"
-
-SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
-SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
-
-inherit autotools
-
-EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
new file mode 100644
index 0000000..0feacc1
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Program for providing universal TLS/SSL tunneling service"
+DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=866cdc7459d91e092b174388fab8d283"
+
+DEPENDS = "openssl zlib tcp-wrappers"
+
+RDEPENDS_${PN} += "perl"
+
+SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "a0edda805eb7d6ea600a230fb0979ea1"
+SRC_URI[sha256sum] = "032bfc1854f8a0b9e452343c36ec6b52c7e0daef0863423c6b13a61a7c92eb23"
+
+inherit autotools
+
+EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
\ No newline at end of file
-- 
1.8.1.rc3


