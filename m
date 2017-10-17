Return-Path: <s.sonski@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 05BE97833C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:56:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q132so6117528wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f1n6H8MNfzNRW8NyqKsbd0NSkGqy8t9KpBNiGt/uAtw=;
	b=TZ2fLL8ryoa8rWIvvH64rME4+3QKjV+OXbPltTxmZaiAtZWKnOJlRjLafhvUb1FW3k
	mWpMTy0iTRK0StzgUkR7u/ma3AI2BOCOcbMDbfN0pIIZ08RkEFjov89Hrs2fHhjzgHM2
	lLOfOd/LtcTOFhK/Jbl/6PnQw45BmObmiVYzD63detYg5By0Pgf/Iyj7gWFdbvDLEgrb
	Lrx5w3OU251jDBZrhCakH5TD6/dFVzwEKTxI15UngNbYBcLQTyBlj1HuuiGVbLMAU2I0
	nVK6qNXsByXAzq4fkUbP5VMscGktiIGKCXO0jXAnlxbbW5rOcIOFBX7RzKSacFFundC3
	JuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f1n6H8MNfzNRW8NyqKsbd0NSkGqy8t9KpBNiGt/uAtw=;
	b=DxmVPj4tsIG1DR9PNH5lU56+Pak6JyRJs2FDZCu6WJ4eikZFdt8VtLWxFgg3V1mCQ6
	Y23rXwrcpzYHE9mqMh1SHIxNa4iy7mZ0OH+/dBcO4Wazddtb9ZQy6jBo1+gpbI5yIbEQ
	M6DIVpaxTSdvfADaG8WfxD5h/xc/FBv6Ix3Z8KYXLwpGJC4KnI/xWJoEGEBx9aWomAkK
	OiesPoCXReKq8NDO0Yt/VLSVCsjEpKty5PMxbnZerNGjRaGfnUnaZ4CnPaQa5DRQRZWQ
	A4UVGpD/TsaanH47v1SmYbpP1qFwpCqjhSG8nNhk8JkWIIMkAsdereqj5fDLwln6BAGe
	RwHw==
X-Gm-Message-State: AMCzsaXXlgef7butlXdRAvlTTD7a0Dp46CEcZf+c/pfInDXcY0I+Hwev
	ofz5S3VZLQE+BMijU94ixRR5D6y2
X-Google-Smtp-Source: ABhQp+SwIjjYyeqiNzcDimP1jE9iyZtBeDkb94COh2cjLJx21kBaM+eDx4FrzmbJDOAZkUcRNysc5A==
X-Received: by 10.28.65.133 with SMTP id o127mr4834371wma.146.1508270214549;
	Tue, 17 Oct 2017 12:56:54 -0700 (PDT)
Received: from sonski-desktop.home
	(p200300C803DCFA0066E575A1101A0295.dip0.t-ipconnect.de.
	[2003:c8:3dc:fa00:66e5:75a1:101a:295])
	by smtp.gmail.com with ESMTPSA id
	z192sm8328100wmz.28.2017.10.17.12.56.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 12:56:54 -0700 (PDT)
From: Stefan Sonski <s.sonski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 21:56:49 +0200
Message-Id: <20171017195649.8657-2-s.sonski@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171017195649.8657-1-s.sonski@gmail.com>
References: <20171017195649.8657-1-s.sonski@gmail.com>
Cc: "Chris E. Rallis" <Chris.Rallis@RavenInd.net>
Subject: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Tue, 17 Oct 2017 19:56:54 -0000

From: "Chris E. Rallis" <Chris.Rallis@RavenInd.net>

Signed-off-by: Stefan Sonski <s.sonski@gmail.com>
---
 classes/qmake5_base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 8e1fe20..042008c 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -28,6 +28,7 @@ EXTRA_OEMAKE = " \
     OE_QMAKE_LINK='${OE_QMAKE_LINK}' \
     OE_QMAKE_LDFLAGS='${OE_QMAKE_LDFLAGS}' \
     OE_QMAKE_AR='${OE_QMAKE_AR}' \
+    OE_QMAKE_OBJCOPY='${OE_QMAKE_OBJCOPY}' \
     OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
     OE_QMAKE_WAYLAND_SCANNER='${OE_QMAKE_WAYLAND_SCANNER}' \
     OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
@@ -42,6 +43,7 @@ export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
 export OE_QMAKE_LINK = "${CXX}"
 export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
 export OE_QMAKE_AR = "${AR}"
+export OE_QMAKE_OBJCOPY = "${OBJCOPY}"
 export OE_QMAKE_STRIP = "echo"
 export OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/wayland-scanner"
 
-- 
2.14.2


