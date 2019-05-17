Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C941D7DFC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 21:49:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y3so8196222wmm.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 14:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JGBRJuxiJQXKWvV1ZBnSQJuv5dxLPV9p+MGDXhNMwwM=;
	b=fPm5W0kLjt08sxtFnS6SOy+yvHqVLp5GLC55qJRR2Lsq2EGIPgTNB5cDYScesddWK+
	mzE24L1jYhdd4b/TMZEtQFDTMPv+dJIbFsa/A+EbfMWp3n8+WqVWeL3uqUrkuxZGq9Uk
	CO2uj89VRyoWSSw6MspIFNe3jcy/qlyxwgOswa8ENSJoOh1mRLU2hO9+jGDhPrPFMXVV
	s+Zbo6sBSYZ4syL98St5BhZ6ORQgPDHnVhLxNBMuUg0NhgMm5Y/keAy+pbOgpxlFjkX+
	Utjlsyqk7eA/RY0L/23rUoa4EIVx7GxUYt6xmV/CmBjVtMhwUCaJIylD10tO1Lj3qD8f
	Q/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JGBRJuxiJQXKWvV1ZBnSQJuv5dxLPV9p+MGDXhNMwwM=;
	b=DQJZ7UNpOKlTvGY9SxIhLVW22BYEDiWFQO7eheJV1gHv/nyzL04CqiYyO4DdH6s+2g
	BZ78R5U3S6s8AaqPLXPEuA9Vubh/1dnnLCYB7kClkDPes470n+2Kla+7Sdqb4fMNVHWN
	9vFyUNAcJ2y3z7hbOUl8aDFfmfEMB3132nBW3gnkS/Lto9Au4edeptf2nPPeqKIZSokZ
	GOaPFlfxOh9bKEmsTsDscmmQehqwaHYPQczTTIXpL3uw5y30tZ3bFvcEg4c2jHHl/3mU
	Sdo+MTXZrM6fzBE2+n5y1gDpbgSAINKJIkFEKwvCvlMTijkcY7OawMCsVpbiNUnDd+Tp
	537w==
X-Gm-Message-State: APjAAAUx5jXr00ZzSCnqD2G9IgeVoOnRcPD1p9i2qAoyDu0yj2MeGG2s
	mhx9aAX61dYZAnH3u5tl0RG7PKny
X-Google-Smtp-Source: APXvYqzqi7BKcd7CAxZ9g4C03Zg1Mv5L0XSYoo+fIdE8R7QfQ/lXqTOfatp8+ichIqyDYT5hHzp6lQ==
X-Received: by 2002:a1c:a695:: with SMTP id p143mr3826940wme.128.1558129760378;
	Fri, 17 May 2019 14:49:20 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j28sm1534084wrd.64.2019.05.17.14.49.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 14:49:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 May 2019 21:49:19 +0000
Message-Id: <20190517214919.32222-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] triggerhappy: fix issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2019 21:49:21 -0000

* using PN instead of BPN in S causes all tasks to fail:
  make: *** No targets specified and no makefile found.  Stop.
* using github archives is bad, because they are regenerated from time to time
  with different checksums
* set PV, because this isn't exactly 0.5.0, because of the debian changes
  mostly the systemd support
* fix indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ggerhappy_0.5.0.bb => triggerhappy_git.bb} | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-extended/triggerhappy/{triggerhappy_0.5.0.bb => triggerhappy_git.bb} (73%)

diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
similarity index 73%
rename from meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb
rename to meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 037ce063e1..24df750e01 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://github.com/wertarbyte/triggerhappy"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/wertarbyte/triggerhappy/archive/debian/0.5.0-1.tar.gz"
+# matches debian/0.5.0-1 tag
+SRCREV = "44a173195986d0d853316cb02a58785ded66c12b"
+PV = "0.5.0+git${SRCPV}"
+SRC_URI = "git://github.com/wertarbyte/${BPN}.git;branch=debian"
 
-SRC_URI[md5sum] = "77f90a18c775e47c4c5e9e08987ca32f"
-SRC_URI[sha256sum] = "9150bafbf7f2de7d57e6cc154676c33da98dc11ac6442e1ca57e5dce82bd4292"
-
-S = "${WORKDIR}/${PN}-debian-${PV}-1"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
@@ -21,12 +21,12 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_SERVICE_${PN} = "triggerhappy.service triggerhappy.socket"
 
 FILES_${PN} = "\
-${sbindir}/thd \
-${sbindir}/th-cmd \
-${sysconfdir}/triggerhappy/triggers.d \
-${nonarch_base_libdir}/udev/rules.d/80-triggerhappy.rules \
-${sysconfdir}/init.d/triggerhappy \
-${systemd_unitdir}/system \
+    ${sbindir}/thd \
+    ${sbindir}/th-cmd \
+    ${sysconfdir}/triggerhappy/triggers.d \
+    ${nonarch_base_libdir}/udev/rules.d/80-triggerhappy.rules \
+    ${sysconfdir}/init.d/triggerhappy \
+    ${systemd_unitdir}/system \
 "
 CONFFILES_${PN} = "${sysconfdir}/udev/rules.d/80-triggerhappy.rules"
 
-- 
2.17.1


