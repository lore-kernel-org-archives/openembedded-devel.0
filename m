Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6EAB861625
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 05:25:37 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fz6so1423304pac.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 22:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Tofto7z2qm4Sq+1HOW802FJIsJ7wQgGzDH4DWRGZGyk=;
	b=me7OdpcS9/j+rXoWqflxpXMlUaCXkeveIVyr5KUuRX+JC9SUXpM/O2Z2irOmz2NtId
	DJ3xFZ/YKiys8flLKHB/tQLCqMoJQNWbyr9Be/APu0pCl8WAwdtylaPG3QbNQ9XVPxdi
	DgvHJXvWshuEK8p5Up5yK1K8kc3TqDwe9wE8An2D5ALfNWCJwqtHQJUMV2YFXFw8FiGq
	IZZaNt/QS4LIylu8cw+Ip0UQDzeNcY+RsYKwt7W0XrtAAPATE7Mi/8pVc+efBeXrA0jP
	qk7cxUI6yU0lQh5RPbBOED9YVkHRqbfx6HdaifktbuMYfZVrA6cc1AGSetXQC2ueSBzP
	gyUg==
X-Received: by 10.68.190.197 with SMTP id gs5mr7183537pbc.90.1378358739339;
	Wed, 04 Sep 2013 22:25:39 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ha10sm32969017pbc.23.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 22:25:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Sep 2013 22:24:17 -0700
Message-Id: <1378358657-12195-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][meta-networking][PATCH] atftp, libuio: Update the SRC_URI to match upstream sf.net change
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
X-List-Received-Date: Thu, 05 Sep 2013 05:25:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/atftp/atftp_git.bb | 2 +-
 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index 0bef7a6..6156bb1 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 SRCREV = "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
 
-SRC_URI = "git://atftp.git.sourceforge.net/gitroot/atftp/atftp \
+SRC_URI = "git://git.code.sf.net/p/atftp/code \
            file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
            file://atftpd-0.7_unprotected_assignments_crash.patch \
            file://atftpd.init \
diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
index c16bbd3..48e2930 100644
--- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -3,11 +3,11 @@ SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI = "git://libuio.git.sourceforge.net/gitroot/libuio/libuio"
+SRC_URI = "git://git.code.sf.net/p/libuio/code"
 
 inherit autotools
 
-SRCREV = "e1e0e4fa28838b3115e215c9553905fe630ca145"
+SRCREV = "ed4f07ea147ac403c28105ab44d01bbf524d36f9"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4


