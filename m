Return-Path: <max.oss.09@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id B03817E659
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 13:30:08 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p15so23530091eds.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2019 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ERHMtCZL/duqD3fnaB3mpEBcTBeOx8mAa7AV5JlEtXg=;
	b=u+DucmngDj3qR59rfk+4/Pj50pE63oWKcCd9E1W/6nWNfSi1avsIN+aUJlqgQypb1B
	p9XvGfgQ+fThnIDFUSTq9x5fzH+zbJvTI2JMXpftsJ2CuJvgjA4jCpTu36WiL+Xu8jzm
	+ui3z2x3v5R6kjtV1BHJU2yMCckHBHGkDXdZo2cnyiZO70JWZjJgsPf9eFy7/lGus+m4
	GS3OtDStjWIk3njfOgb8T6uLrsI1Cu+L/1Stc5fFpchtc74SvKMARHubxmnfWCZNXCLA
	aVCWf1sHUOT66murncXEs5FK0xwliqJZ/KPOqyQtm+RIO1AmzRFk/ppf5KIh8sGmctbe
	SvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ERHMtCZL/duqD3fnaB3mpEBcTBeOx8mAa7AV5JlEtXg=;
	b=ZSdgIHi8NPOVgcoOnG4W+XkWc2tZ2AkQ/JMzKZ2EaPwbHXcJqJzDxxNawNeIVKCTps
	mpL4IxjY1ck/16QksQFYLEZQLNbtiNKKGb/kJOKliM84V33sXj77140w1Y7rc6rZlUSH
	DCuu2GBFeikHG8W9AekUteNjfJwoKT8lUdhkvVy+J5+1RFBXQPPY11HPfDgJdy8ZOmoO
	lw5Erj1QBX2nCMCJ1p4C4F2/177V60DWJR/P9REPxv2tW06ora+dzeNuMqhbXPZzbXZ7
	a20DrN3OU60QQUnDey7Awite03hAVhFc85USXldB/1Xs+koQEQTYWiryhT8/V0PWvj0C
	Pbjg==
X-Gm-Message-State: APjAAAWnLqMdnxUtUcfp6p5qESvb/SpVygLbSoTICgLula6U2olZ6mHC
	WrKMKcwMpa5YL/uAaOMFdIiUN9EY
X-Google-Smtp-Source: APXvYqy409ES1JzqXDKKEsB8hmVHkrjeMXYSNIj5BC6EAru5mHvL332Br3wJMLkPST3NkjUZsof0Mw==
X-Received: by 2002:a17:906:a394:: with SMTP id
	k20mr22460954ejz.46.1561987809284; 
	Mon, 01 Jul 2019 06:30:09 -0700 (PDT)
Received: from linuxdev2.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	z40sm3686288edb.61.2019.07.01.06.30.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Jul 2019 06:30:08 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 15:29:11 +0200
Message-Id: <20190701132911.19209-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] joe: update to 4.6
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
X-List-Received-Date: Mon, 01 Jul 2019 13:30:08 -0000

The licence changed to GPLv2.
The fix from 0001-adjust-signature-of-main.patch is applied upstream.

joe 3.1 segfaults on aarch64, the update fixes this.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../joe/joe/0001-adjust-signature-of-main.patch    | 30 ----------------------
 .../recipes-support/joe/{joe_3.1.bb => joe_4.6.bb} | 14 +++++-----
 2 files changed, 6 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch
 rename meta-oe/recipes-support/joe/{joe_3.1.bb => joe_4.6.bb} (41%)

diff --git a/meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch b/meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch
deleted file mode 100644
index 00f48e8a2..000000000
--- a/meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 27e4639254f2b2eb7d04790bd8cf16ecfcbac1c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Oct 2016 01:07:16 +0000
-Subject: [PATCH] adjust signature of main()
-
-clang complains about the types of main() function
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/main.c b/main.c
-index 81ba543..ee7506c 100644
---- a/main.c
-+++ b/main.c
-@@ -159,7 +159,7 @@ extern int breakflg;
- 
- unsigned char **mainenv;
- 
--int main(int argc, unsigned char **argv, unsigned char **envv)
-+int main(int argc, char **argv, char **envv)
- {
- 	CAP *cap;
- 	unsigned char *s;
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/joe/joe_3.1.bb b/meta-oe/recipes-support/joe/joe_4.6.bb
similarity index 41%
rename from meta-oe/recipes-support/joe/joe_3.1.bb
rename to meta-oe/recipes-support/joe/joe_4.6.bb
index 1ad355b5a..b79e028f3 100644
--- a/meta-oe/recipes-support/joe/joe_3.1.bb
+++ b/meta-oe/recipes-support/joe/joe_4.6.bb
@@ -1,17 +1,15 @@
 SECTION = "console/utils"
 SUMMARY = "Console text editor with good functionality, good choice for vi-haters"
 HOMEPAGE = "http://joe-editor.sourceforge.net/"
-LICENSE = "GPLv1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=da10ed7cf8038981c580e11c1d3e8fb6"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz \
-           file://0001-adjust-signature-of-main.patch \
-           "
+SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
 
 PACKAGECONFIG ??= "curses"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-terminfo"
 
-inherit autotools
+inherit autotools-brokensep
 
-SRC_URI[md5sum] = "2a6ef018870fca9b7df85401994fb0e0"
-SRC_URI[sha256sum] = "252390e4bc687957f09f334095904c8cc53b39c7b663ed47861ae1d11aef5946"
+SRC_URI[md5sum] = "9017484e6116830d846678b625ea5c43"
+SRC_URI[sha256sum] = "495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de"
-- 
2.13.6


