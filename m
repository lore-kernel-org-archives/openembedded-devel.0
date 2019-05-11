Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8837DE97
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 11:32:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a12so10418715wrn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Pv431PJfiT+kZzTFOJ51a7uPpQYQ02Icc8LRB1ovyNg=;
	b=RcRdKMmOVVe620+cwKmr1s1ZL0OSQXVj+sV4tSwxjXvGKytq1YbaXDJLdPnzV2Q263
	21qOcGME1gEAn27a/Wahjkzw9H4G2G0XiiAqd9IBXR/u7pLD91sWcMpFH7WS0TSLVIyI
	lEFmQmWyoLVrTxABc3MmoHkF6iShFzxot7QsvjNoiJagM2Oj2OQcOKd87R4NhX4q6suT
	Bn+pLCMuRwW9oxSqyIsf9mycFueUDE8hlq2FKu7mOD/zsfGHAsxtBDVbkH12YYYLQ2qO
	jnxnGWVaGmazG5aINLjP79zymKyhfFvFNbim9BziXfGz8cPEJxktwq0iMAeJ84MJfocM
	tjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pv431PJfiT+kZzTFOJ51a7uPpQYQ02Icc8LRB1ovyNg=;
	b=Hj4GSIAIr9MdzKGZr1+LLBvxpB1ozQd6jJvXPnTF5UUHfoECokq2/E8dp02JAWBy5M
	CI2HesT22kFG+VmtbP5SNRCTIcXK2nMq1l6L1H/BgfzeqFyg2RBIENmcSXnSCv8uv6F4
	CdWSzfjkylWBLdP1BEpQF3XOoCMHDBWfFH1ca1GZGqfyFMRMu6EmbMlDPSB0TSLV5e5o
	AFMEaqf2pBp+wwAmNS1nB5jLobQm2iJT2ZXcdlwfoiRPKp/atjcYQJN0gLp+rIcgQz8j
	ZW2gS/dlod7rdQJt+HaX9EwSvBgv7ypYcciV3Lohju1wQzgI1IhcfWyQ/XVv7HoCQoUZ
	piNw==
X-Gm-Message-State: APjAAAUDUoVQRD5erslTQHfo1DufHEZooQv1RLg7Pixk1duEr+MV9NLc
	FXoVDrYuZZBeB9evLgv/PtcCekqD
X-Google-Smtp-Source: APXvYqyijVqRGbBioXssyDYAbUwkoj+UZR8PT6l5hWdPz2NZ08eBxpEjwL0XbaGxRCNbGJLozIpEHg==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr6927174wrn.109.1557574373616; 
	Sat, 11 May 2019 04:32:53 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	p67sm6340918wmp.22.2019.05.11.04.32.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 May 2019 04:32:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 May 2019 11:32:41 +0000
Message-Id: <20190511113241.15808-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libvncserver: set PV in the recipe
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
X-List-Received-Date: Sat, 11 May 2019 11:32:53 -0000

* last SRCREV bump commit says:
  libvncserver: Update to latest commit post 0.9.12
  but there is no PV in the recipe, so the version was just:
  git-r0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index 6a806ffbaf..bc47a3f156 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -32,6 +32,6 @@ inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
 SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
-
+PV = "0.9.12+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


