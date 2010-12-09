Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQX8F-0004Zi-TK
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 04:25:24 +0100
Received: by yxd5 with SMTP id 5so1149243yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Dec 2010 19:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=kPGMu+HXdb2DEIt+bFfbOSsaaJ7iq/0kfj7D1NU3ErA=;
	b=Kt0Mds9IsfBkwVSTzahMKOkXVfVohrBv6dG6BllYLSnBbHIwgelzC1qCkIMEfv0tTX
	HlzuCoMvMtaTc+gmKJU0F4+KHSGB1PHWwtHj1ESBFg3DouuOCJpn3sbz+aHT5qGNV+Bv
	byZy4xEdxBtPd1kDichCuD7J0G5GBApdLfr8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XlCBKsl2X9afioLsByf+nZ3geXG0IQxvSozm9eeB9QqQN5U3q0KZW+mzA3E6eLOg9E
	MX85c97t8aoXVdRqnCIqE3aXGktVV7Qh0eAUsYodf84IahGOua7VNjx2wn51lKpDtm5G
	sbVOkzH9HIGKZzLdmhcTpsWiGZhxNOxjeG1b0=
Received: by 10.90.61.2 with SMTP id j2mr12562063aga.205.1291865032965;
	Wed, 08 Dec 2010 19:23:52 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 54sm842905yhl.32.2010.12.08.19.23.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Dec 2010 19:23:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 19:23:17 -0800
Message-Id: <1291864997-30025-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, SPF_PASS, UPPERCASE_50_75 autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] minimal.conf: Prefer libtool 2.4 with sysroot support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Dec 2010 03:25:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal.conf |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 5b92a36..451d010 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -102,13 +102,20 @@ require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
 
 PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
-PREFERRED_QT_VERSION ?= "4.7.1"
+PREFERRED_QT_VERSION                 ?= "4.7.1"
+PREFERRED_LIBTOOL_VERSION            ?= "2.4"
+LIBTOOL_HAS_SYSROOT                  ?= "yes"
 PREFERRED_VERSION_qt4-tools-native = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded-gles = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-x11-free = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-x11-free-gles = "${PREFERRED_QT_VERSION}"
+PREFERRED_VERSION_libtool = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-cross = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-native = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-sdk = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-nativesdk = "${PREFERRED_LIBTOOL_VERSION}"
 
 #############################################################################
 # CONTENTS
-- 
1.7.0.4



