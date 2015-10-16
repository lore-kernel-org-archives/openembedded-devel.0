Return-Path: <folkus@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id AA0AF77104
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:32:09 +0000 (UTC)
Received: by lffy185 with SMTP id y185so77468743lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fiA1qGIOyQ+RMcDhq96bdhMBovP4kr+i46ncfMQvcmw=;
	b=hWIXCzx0yzQJ54pMVs5hdN23wjSz8OKQ73n7WrLyB7rDDHPUq4TvAaLqTPzVqp4LVS
	f5P3qiRV7bbTN+HnjFaod7nPVFT7nGdK4JM7JseSAdrLtFA2C4GAbSyeDtLzTlOtOAf4
	9fsdWVlRC2j/sxxeNET0KAVCd8ZZVPRQXeMZpZlgWq5bSkbOIc/7cjpuFyvJ11ql2KCM
	f3QzyNhCVN3yOksMOMIaYuOtP8/Jrq15UxsAdiIq7axKxuv9fpe7T7hgRzVLTaFPwjUD
	gdbriyuPUCng5Dn8MCakexTQVncDTKIUlGCbJwHhTVRYJxACOmzW88aArut3dfTQUnYV
	ldBw==
X-Received: by 10.25.79.84 with SMTP id d81mr5205718lfb.40.1444991528534;
	Fri, 16 Oct 2015 03:32:08 -0700 (PDT)
Received: from localhost.localdomain ([188.121.6.226])
	by smtp.gmail.com with ESMTPSA id
	e138sm2777674lfg.36.2015.10.16.03.32.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 03:32:07 -0700 (PDT)
From: =?UTF-8?q?S=C5=82awomir=20Paszko?= <folkus@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 12:31:45 +0200
Message-Id: <1444991505-29220-1-git-send-email-folkus@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-qt5][PATCH] The same thing like with qtconnectivity_git.bb. There is missing line, which is setting the OE_BLUEZ_ENABLED. It was broken when merging .inc with _git.bb files. Without this missing line libQt5Bluetooth isn't working with bluez!
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
X-List-Received-Date: Fri, 16 Oct 2015 10:32:13 -0000

From: folkien <folkus@gmail.com>

---
 recipes-qt/qt5/qtsystems_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index edc0360..95138d8 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -31,3 +31,4 @@ QT_MODULE_BRANCH = "dev"
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.4
 
 SRCREV = "37b614abbfb35d06a57e5b0824249c3abd5640e3"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONFIG+=OE_BLUEZ_ENABLED', '', d)}"
-- 
2.6.1


