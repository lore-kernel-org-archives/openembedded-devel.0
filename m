Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 486AE771D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 11:03:50 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id c200so70016922wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5vucQvMUYsg4Ei7w/Yq74ldqTMRaUq4Sdy4qspO1vx8=;
	b=GQhMVxPg2fzOVk/lpfu/cdCSqsT2x/t3eQnKpDK6UFSF5XKqlPCTAwnn6JLMHqmGBe
	EoxV8w6cwnzQWBjU7ACL7DNVsUkhWy0xM24VT+BXqDhJBh7EZ7Myxw8BDsna6OSqPeG7
	U4Aub2D9CIQ3M030XL2ax3BFBN7hW25Z7vvUrOFZuvl42178HFMS2vw0CAbGlMj9pMvw
	dlu29/g3ACYC5ZXEaeLFpcqRwOZXqfntTewaI65RrkKlSNTjPzagnTWcz3/oyMTzIdBs
	ViAEOAA5hMhLaSlBhBvq6szohG+A9hC4LqlpBlShp8xmc7qnj6060gloOX9J/J0DEub6
	IGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5vucQvMUYsg4Ei7w/Yq74ldqTMRaUq4Sdy4qspO1vx8=;
	b=JdRVeygGr20Yb0+if2KBpYIEaKZNZIWJm+YrAn9ltU6Clrjbo9VLF3qNmr8JFzTErL
	PJyBfam2YVp8is+9OdOs/q5rADCkau8mvz8Qm6HdBM/vSsBulu+rtZunN0jha6yk5so1
	tGF2PdJGGydJ9HMa+6gN0ZyqLdxHHFqodG5xBUEShM+XDyvp5BdCdsyJFbyjrAGKj/Vb
	/DP0717UkY1DWFyPpxTbrivvAd2jCz8W8u+4dOkRlng2GUwX8kIPDtxAITESSJur/w4U
	f+AJduUrjvrDg5LOtaZd6TAESQUd8SiJm2Bg1oAyrGpj0PDL+4eu/CAauJVIfo9cyXRE
	wf4w==
X-Gm-Message-State: AG10YOSTD1TotdyTrhhMwzwPWtTAfYfXXyF20CMXJdRgPtZZ3Lesh7OI88UJkV1STPl98g==
X-Received: by 10.28.63.85 with SMTP id m82mr9134984wma.55.1455879831288;
	Fri, 19 Feb 2016 03:03:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w62sm7110728wmg.21.2016.02.19.03.03.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 03:03:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 12:04:16 +0100
Message-Id: <1455879859-3401-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][WIP-for-5.7][meta-qt5 1/4] qmake5_base: use remove-libtool bbclass
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
X-List-Received-Date: Fri, 19 Feb 2016 11:03:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_base.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 5b2633b..c2a8498 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -47,7 +47,7 @@ OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/wayland-scanner"
 # this one needs to be exported, because qmake reads it from shell env
 export QT_CONF_PATH = "${WORKDIR}/qt.conf"
 
-inherit qmake5_paths
+inherit qmake5_paths remove-libtool
 
 do_generate_qt_config_file() {
     cat > ${QT_CONF_PATH} <<EOF
@@ -168,7 +168,6 @@ qmake5_base_nativesdk_do_install() {
     find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
-    find "${D}" -ignore_readdir_race -name "*.la" -delete
 }
 
 qmake5_base_do_install() {
@@ -176,7 +175,6 @@ qmake5_base_do_install() {
     find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
-    find "${D}" -ignore_readdir_race -name "*.la" -delete
 
     # everything except HostData and HostBinaries is prefixed with sysroot value,
     # but we cannot remove sysroot override, because that's useful for pkg-config etc
-- 
2.7.1


