Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194C3C531D0
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 21:11:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24854.1771535480474219541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 13:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=McRIcq4M;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43626796202so1312229f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 13:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771535479; x=1772140279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgKc45sUBdbk2aBI9s6Fx6/ou5uCsE4FJLyzp0kPrj0=;
        b=McRIcq4M2VW/gIuu2HEsweD+17cAgKcOWlqsCeW6Ksfe8L17oIAkD/QrsfFO1nIhle
         yG+0urGoVhbqzupUHv4kyEGnmYm+41vl0JTWOsiMOcoKHgDV63y5Nzv+zaEDgkV4AdUT
         Ob5+2Wvrtu0KI+ts4+ApBqag6uK75s69pCuV064j4wgS/QYzwlwOIYVBktHMtRt/MV7R
         ZwfcRF7CY0pEElLCKTJxI9gTsHgcO3X1HuDsQuXGxCdarqzSCdf1Rgr7wsGG06ouYFx6
         s1apEDu2DIpZ4w62Vs/njtj9JzVL7HtU+4S9sOMpm4wozMatjbHxei1OQYHDA1wx2lZP
         WG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771535479; x=1772140279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgKc45sUBdbk2aBI9s6Fx6/ou5uCsE4FJLyzp0kPrj0=;
        b=ulp1AHzjvDYaoAkMsI3gl88T2VK6zSuB31MCYXlBSopomSXzRy2fkRHsyb/XF2jjpU
         Pf+tVPT1NM82dPOwm8uGHoVYGhZiCmtTDNqn6PyqNx32scPqdmmC8ldyIwBN2hmRWvZ2
         z/UuOQuQxEVVHtWzMRdXu32xpA4dkcD96XDmiZ3aK6SRlqX5GxxRMmmIfoJEJiRueJ/b
         wB+xlJn1HX3AWGB/h5D51S7OMahKfHm0nldrSb6SsAkn23CWFBdABTcsChq3s+wZnlc8
         fa3zELQvIq72BcasoEuXs5gOEKDf0EM8OCgD0L9MyKZ13frCRQBFuDCeuV5JUmEyLmec
         rLVg==
X-Gm-Message-State: AOJu0YwZykBC6cOgonfDTmv7KvgNc/ihsd6f6EQwsQAIHWuemgZPtBLU
	TrDpAS1pQNWwYMtf9rQYegaCmZiqmmwf2QVNi1L28C+ArBmq9UGO38lDJfcLng==
X-Gm-Gg: AZuq6aIwWX3i71xWJ6O46w9Q9a9yiaamV6E+gDKycPhfRl4UX2vDfv7Htgm7kA0oRvr
	8rfSl3ums076ORvjreh67SE/D+FwvIXPwWvp0CeuIlo8etKr8Jv1WxfSeNeN5/sIWK9x193rBgQ
	FGFf7hgKT2Qpz+pWEKsYfnvXsDB3iAGSKuyjZjWzqDjUJ6AxmCfWzH7ebkLl4QbnaB2VrGmqrz9
	PHiSfSc6ogLio+//qLZiMvl03kxaHfeYz0DTZl4ewPNSjkJqcrrvWWmnpUSqVo906Swa9/UPjo+
	DhTMvCQ1+sub3pTJ6tJs/mhUKLdCcBefLeEkLBnj5rrCsRPlojiElaIpH77FukJSTLBLkk/qnIh
	URl80N1h2jl+oljewLSyto5xUV7pOTkV1MKD05f4GmwQSRAtxAC4Jx0wXgz5jMT5K4coQTutdO0
	pnRZo6vnSAmVbfmC7kBe5O
X-Received: by 2002:a05:6000:2510:b0:430:f3fb:35fa with SMTP id ffacd0b85a97d-43958e5d65emr11782746f8f.57.1771535478432;
        Thu, 19 Feb 2026 13:11:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm17773434f8f.36.2026.02.19.13.11.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:11:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] cfengine: remove SKIP_RECIPE tag
Date: Thu, 19 Feb 2026 22:11:16 +0100
Message-ID: <20260219211117.604149-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 21:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124515

The recipe compiles fine with OpenSSL 3, compatibility has been added in
version 3.20.

While here, fix some broken PACKAGECONFIGs too.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
index de20f585b0..5fd5279d7d 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
@@ -10,13 +10,10 @@ its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
 
 HOMEPAGE = "http://cfengine.com"
 
-SKIP_RECIPE[cfengine] ?= "Needs porting to openssl 3.x"
-
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
 
 DEPENDS += "attr tokyocabinet bison-native libxml2"
-#RDEPENDS:cfengine += "attr tokyocabinet bison-native libxml2"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-community-${PV}.tar.gz \
            file://0001-Fixed-with-libxml2-no-case-in-configure.ac.patch \
@@ -31,6 +28,7 @@ export EXPLICIT_VERSION = "${PV}"
 SYSTEMD_SERVICE:${PN} = "cfengine3.service cf-apache.service cf-hub.service cf-postgres.service \
                          cf-runalerts.service cf-execd.service \
                          cf-monitord.service  cf-serverd.service \
+                         cf-reactor.service \
 "
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
@@ -38,7 +36,7 @@ PACKAGECONFIG ??= "libpcre openssl \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
 "
 PACKAGECONFIG[libxml2] = "--with-libxml2=yes,--with-libxml2=no,libxml2,"
-PACKAGECONFIG[mysql] = "--with-mysql=yes,--with-mysql=no,mysql,"
+PACKAGECONFIG[mysql] = "--with-mysql=yes,--with-mysql=no,mariadb,"
 PACKAGECONFIG[postgresql] = "--with-postgresql=yes,--with-postgresql=no,postgresql,"
 PACKAGECONFIG[acl] = "--with-libacl=yes,--with-libacl=no,acl,"
 PACKAGECONFIG[libvirt] = "--with-libvirt=yes,--with-libvirt=no,libvirt,"
@@ -50,6 +48,8 @@ PACKAGECONFIG[systemd] = "--with-systemd-service=${systemd_system_unitdir},--wit
 PACKAGECONFIG[libcurl] = "--with-libcurl,--without-libcurl,curl,"
 
 EXTRA_OECONF = "hw_cv_func_va_copy=yes --with-init-script=${sysconfdir}/init.d --with-tokyocabinet"
+CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'mysql', '-I${STAGING_INCDIR}/mysql', '', d)}"
+CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'libxml2', '-I${STAGING_INCDIR}/libxml2', '', d)}"
 
 do_install:append() {
     install -d ${D}${localstatedir}/${BPN}/bin

