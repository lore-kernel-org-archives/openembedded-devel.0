Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13FB7771FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l6so16766423wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZVPQ/BSN5eCrXYcZayu3goTdTenlpHfiGMViNUrkK8U=;
	b=evuYMEbmvNjW3UuL7vReFu5QfBfC13gzNmgOFmRQJvLkOMLJOqyToiMnLAOErKgaZF
	+kE9kDpWujWC3Jj04jLhsjI4BoR4WXCsnb03enYWm07tNm6xFLoWzc/ozFXF0xKoH1bE
	WxUbITQCgxLVOP9/q8vnys0R5vzdp1E7VzCRDUARbxITtvrlOk130doDNiShPneFCa3l
	SnfV77RHbeGhHE9H8nODUyAYI3qDaALgRr2s/6/Md79WMyrbFMxe+I4SL1P5oalYBoM7
	mem083A81IzwXrPVeh6c+srrJLq/aHFhytMvRqnRyOy8NTWt3P/qjACH1frlN5PxR1oF
	8fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZVPQ/BSN5eCrXYcZayu3goTdTenlpHfiGMViNUrkK8U=;
	b=KoHyOWGzkgUmiqlUCj66IzTcXYcqWcCALJBKyu60/NB0EbONL45R1rMKvCYLFaFc4O
	U9acLr0FMCMlEKYj5+EjlCoSIgO7UKsEVZN732lDxtCQD8+dPkXHDMbLQzOc/ffTtW6u
	g8bVe9V+BDRBL2omSOA+ZSKp4oGYriAyebAQkYgf+ubU6tEtGjkpgILPSY+vxJsbVo2R
	7WmvrmFz2cEn8oeLUb9sngBpXQTMxtSIuKeLmV/yZ8rd7vtBtcJjdc2DgZRA2mdBx+kz
	FmWfgiZe572A/O2jvmY4psm3V0MMtVfpHQaySlxFSbc/v/YWaPQjPDXKq6YjpKexAjs/
	QTEg==
X-Gm-Message-State: AOPr4FX/lOhgdxx7SU1AnWgjY/3WCBI+CeDCBqwVaYt7HQiQrkGdKzVoTfYOdMQb4ckyGg==
X-Received: by 10.28.91.199 with SMTP id p190mr5802929wmb.47.1460317309187;
	Sun, 10 Apr 2016 12:41:49 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:02 +0200
Message-Id: <1460317290-4787-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 03/31] qtbase: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index bf56741..e9a9051 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "41706400f605524a5a9953714aa0cfbf811dba7e"
+SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
-- 
2.5.5


