Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5F47FC9E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 12:09:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z7so7061948wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 04:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qLQADId25Gh6XKsqyBjRVSufiCyOvDqWOJgRJrZb7U4=;
	b=B4/gbV8Vh3l4VEVOLkDbtRR48aODGAoKH67F0octPzhFVgBWEziarT0I6RL4UoM9eg
	PB2TTbCUfeFR1UTqgrT6CWPvS8eF31SBuu0kAH1pYO1w7Que24wSPMqdrZOu06TxXUON
	cTnibrkdYt8rFyDBi6RoEUuFEmujNctXVGDbTXxPSNEkuMFniIUEbGzuOfoqjvRZTVip
	MGpN0egwi1J3NJ1zP3D2bxrIsav6ZM9a8CMmCwndR14mFd10ARsFxHfmaQrJSR3qVBf6
	G8Y4mFMYqsjNljiV9z5D8VQWPjRkshtiSoOfKF0MGvxQGs2ws4eSmuvuV7VAoU+8dNcu
	fkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qLQADId25Gh6XKsqyBjRVSufiCyOvDqWOJgRJrZb7U4=;
	b=OO3bsiyrbplCyQjRpF0oIY5IOmWI22xn61A3bsBrZPh/o1tm0m1r2P3rJPnHu01CCQ
	9XpzDjOLFeAgz1kkHuNbsMyPBTBloyzKpm+Iikg6Jsea9vXsDPfVv3xRWIbHw1uKQB0e
	9IenAzrj7eHYcPozqDaSpAsE5ibcmY3byehvoEl1Q+ZeZNwTf+fbHfm+5NCDu8PjgySB
	q8vH8Hj9GrVWnv78IdRv3P//1Y89JOSc3ds7LonzlSu0NQTx8clTkN1A4FeEF0QiI4xx
	Y5vudVFrzwopkMpXi8GwWmKgtiM5rRWgzUTlciR1qBTCqsiVS8yTYivvT4qya2CMTejw
	Mglw==
X-Gm-Message-State: APjAAAVfb+V/v0IaPU7+guB+i6eAF8+qjg9dcAhzfn+t5/MPX66CaaZc
	XUY6ehgUTFnXCEYWYYIaSG6GMLUfzB0=
X-Google-Smtp-Source: APXvYqxlZTki6dXMk3OjAVtxKdyOPN4PtPHCXBtb6Ekv2a8/V1B/Wo690jJIFTf/XBTWQrDV7LsbjQ==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr11151150wrs.287.1578571786006;
	Thu, 09 Jan 2020 04:09:46 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d32:c012:51ed:b4fa:d66:b069])
	by smtp.gmail.com with ESMTPSA id
	s16sm8292256wrn.78.2020.01.09.04.09.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 04:09:45 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 13:07:08 +0100
Message-Id: <20200109120708.23608-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: fix cmake installation directory
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
X-List-Received-Date: Thu, 09 Jan 2020 12:09:45 -0000

This should help reverse-dependencies find the cmake files also in multiarch locations

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
index 53f6469b2..11c8eab55 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
 DEPENDS = "openssl websocketpp zlib boost brotli"
 
-EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
+EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
 
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
            file://disable-float-tests.patch \
-- 
2.17.1


