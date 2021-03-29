Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.630.1617056147959980741
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 15:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53098 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lR0Aj-00CrJ9-NV
	for openembedded-devel@lists.openembedded.org; Mon, 29 Mar 2021 18:15:46 -0400
Date: Mon, 29 Mar 2021 18:15:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] packagegroups: delete superfluous "PROVIDES" lines
Message-ID: <92f38f92-478f-d867-d8d-278f5a43248@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


There is no need for PROVIDES lines in packagegroups, so delete them
as has already been done in oe-core.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
index 8a8a8dbe2..c899e83bb 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
@@ -2,7 +2,6 @@ SUMMARY = "Meta-filesystem packagegroups"

 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-filesystems \
     packagegroup-meta-filesystems-support \
diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
index 2955baea2..97a60930a 100644
--- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
+++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
@@ -2,7 +2,6 @@ SUMMARY = "Meta-initramfs packagegroups"

 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-initramfs \
     packagegroup-meta-initramfs-devtools \
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index c4be1b5ce..e2ef18262 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -2,7 +2,6 @@ SUMMARY = "Meta-multimedia packagegroups"

 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-multimedia \
     packagegroup-meta-multimedia-connectivity \
diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 231d8d4da..48a7bc056 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -2,7 +2,6 @@ SUMMARY = "Meta-networking packagegroups"

 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-networking \
     packagegroup-meta-networking-connectivity \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c717d45e5..c9ab261dd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -3,7 +3,6 @@ SUMMARY = "Meta-oe ptest packagegroups"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = "\
     packagegroup-meta-oe \
     packagegroup-meta-oe-benchmarks \
diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
index 3fa56d439..e390e8bbd 100644
--- a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
@@ -2,7 +2,6 @@ SUMMARY = "Meta-perl packagegroup"

 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = "\
     packagegroup-meta-perl \
     packagegroup-meta-perl-extended \
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e84bf225e..adaffd1a7 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -2,7 +2,6 @@ SUMMARY = "Meta-python ptest packagegroups"

 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-python3 \
 '
diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index 2fa5bc4a9..d4e8aae54 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -2,7 +2,6 @@ SUMMARY = "Meta-webserver packagegroups"

 inherit packagegroup

-PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-webserver \
     packagegroup-meta-webserver-http \

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
