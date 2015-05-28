Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id F23817567D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:22:36 +0000 (UTC)
Received: by wgme6 with SMTP id e6so36280026wgm.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pFLJfAc7xfJvTBpbXmFp1xagq3jbCqCdPd0H+VUOOFA=;
	b=asO+mRS4QjP6985fxCjdCoWsbcZFCjmkMYaBXpPkBg4fqxdEFqWS/mP3G3VD7Da9X1
	rpujkgRLcWe2cCwjz0U/f8/ALbsSb7VpyOZ1tIyyp7Cyp999dXndxbv/2pUDsSl0ZHfe
	ysfr7LBzgpcDwqA3ZTo3na8C/SuotoxCuGjPsJoC+tRAAFCC0wwLYNcircliRLDWkT0T
	PnIT9nOgToWBkK4WRm2So8GeVgNGNWJN9qRW436NRQkhAXRLSpjWdQnnM/2gKf6cDkUl
	7fXzvhzPyTy24ZUqX3ns7qpT5G3m2NT4kKn8sBaIqoxsYkEyFpMTzJnBHtuohwvL4qy/
	QZww==
X-Received: by 10.194.3.77 with SMTP id a13mr5394182wja.104.1432819356766;
	Thu, 28 May 2015 06:22:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id bh7sm3367924wjb.8.2015.05.28.06.22.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 06:22:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 15:22:52 +0200
Message-Id: <1432819376-24340-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
In-Reply-To: <20150528132002.GG2383@jama>
References: <20150528132002.GG2383@jama>
Subject: [WIP][meta-qt5][PATCH 1/5] qtbase-native: add CLEANBROKEN
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
X-List-Received-Date: Thu, 28 May 2015 13:22:37 -0000

* otherwise do_configure fails with:
  make[2]: *** No rule to make target 'cmake-clean', needed by 'sub-installed_cmake-clean'.  Stop.
  make[2]: *** Waiting for unfinished jobs....
  hidden very far in log.do_configure

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase-native.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index b6c868d..4af0c0a 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -27,6 +27,8 @@ SRC_URI += " \
     file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
+CLEANBROKEN = "1"
+
 QT_CONF_PATH = "${B}/qt.conf"
 
 do_generate_qt_config_file() {
-- 
2.4.1


