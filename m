Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id B37A7601A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 16:46:30 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 2so3311762vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=XSIEeCHU43sATdtKTFXdBEFoezd6dwtvD1Xjl6Hawsk=;
	b=GVUhpVeM/iNZXNlnap8JuJgSM7MUR/Vbb7SxSjWLIXZ162F3b1mxPZbb7TGG5PvR5H
	oNMxZPA2e9BhpHPuKubuU62wu1r+LB0UOqb+0aCghHtrjLrxmmnSbiaMKsonO1ePFFph
	2wYjug+R1esXLD+IgA6A1ckU0dUQXJTL5taEPngBlp/Ts6i0/AzlI9mOcdowi8rCUHrV
	dG9ASZltVUqSDjMj03dsJz6vUn1CCMFRfAjjlfW5wJi7dgCJVhdY2WOLsB6891YNzdBn
	eRdqP/Me2J5bTD4RL/72uB+zJHlLqdMEprJIHTKMBANY4KLveITWPgUURgS9vEb5v0Xc
	k/5A==
X-Gm-Message-State: AA6/9Rk8WrVWz40u2iHkRxi6Z5Xv+4V3d04BFRSqfLW+5W+ytqtQ/8zAujSVICJzUZcvXA==
X-Received: by 10.31.174.147 with SMTP id x141mr2395520vke.73.1476981991526;
	Thu, 20 Oct 2016 09:46:31 -0700 (PDT)
Received: from localhost ([187.23.155.148]) by smtp.gmail.com with ESMTPSA id
	g65sm17176962vkd.2.2016.10.20.09.46.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 09:46:30 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 20 Oct 2016 14:46:24 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Oct 2016 14:46:24 -0200
Message-Id: <20161020164624.12103-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.10.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5 PATCH] qmake5_paths.bbclass: Fix fonts installation path
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
X-List-Received-Date: Thu, 20 Oct 2016 16:46:33 -0000

As Qt internal fonts (qtbase-fonts) are not included anymore, we need
to rely on system fonts to work.

All major distributions, as well as all recipes on OE-Core and
Meta-OE, use ${datadir}/fonts as path so we adapt the value for use
for Qt use as well.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 classes/qmake5_paths.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_paths.bbclass b/classes/qmake5_paths.bbclass
index e1101a9..ef3ff8f 100644
--- a/classes/qmake5_paths.bbclass
+++ b/classes/qmake5_paths.bbclass
@@ -49,4 +49,4 @@ OE_QMAKE_PATH_QT_SETTINGS = "${sysconfdir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_QT_EXAMPLES = "${datadir}${QT_DIR_NAME}/examples"
 OE_QMAKE_PATH_QT_TESTS = "${datadir}${QT_DIR_NAME}/tests"
 
-OE_QMAKE_PATH_QT_FONTS = "${OE_QMAKE_PATH_LIBS}/fonts"
+OE_QMAKE_PATH_QT_FONTS = "${OE_QMAKE_PATH_DATA}/fonts"
-- 
2.10.0


