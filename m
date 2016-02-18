Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id ED9F560111
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 15:41:14 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id a4so31244008wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aSnLzGesksfNDMmUTbfZMqJdAvQQPxrDmF3drmFfHos=;
	b=mtpSvD2fg/uV75WqYlvSI1Dyxg//OjC/VDQ9AM5TvKnL+lu8pVbPuQ7xavw9hV9Y3u
	Pf989QnUMVJINWla5bPRopzsfaZJk80lxLDYsZ+AFoXFJlkttAM2a6iy1wSv9dMB+JqT
	kSEvtRisZ7F0bzaqqSJIM/dM859SbiF2lhyhsdaNhxzK/yhQZxyFJp3sAQ2iJFRl6uEw
	WZ6T1ImHEr1IgfR+qalbOuOps97GskAJS9KVgNnBT44ldiWhtOL0N1qiwaOmNFQ9F8fK
	jsGaxUr6X8SGil27DjcYBQENsm9zMYmpvvN09y4E2+kuwwd0tYNAn2zj73Svlkfwqc2V
	BYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aSnLzGesksfNDMmUTbfZMqJdAvQQPxrDmF3drmFfHos=;
	b=CsOOB5UBNxCGzhdSO3idbbdOzh882hp21d2oTm75hixikg3JI2lFmj4+TBSZTPLsj2
	Bo9OKLrs13MdjLV5338oe79UwQqSm1rUnVtJV5GOAt7XtacFBc9DHFpXRqiSVdF2EKpU
	8f+e8WXlLeES6KmF9xjwTUuPVeEASxUNMtmWk34GN62jZ7V4z14EbmoPsKR5MwCObvHo
	8Oe4ypyME0J32apL6r/M0mdtzhLpNG9pdYG15w0zYCCRWZ8eu5SPrNG2dwrRfcOaOtjs
	k8/daBQUkueRF9DCtHT1gmrPXJiQ7U0/bfLqdM+gB7L1xq5eugZQzJTaQLOV6cWUAkKR
	1CfA==
X-Gm-Message-State: AG10YOTk3dqbDt4vEX9i6D5KF3DizL8sG3QbmLBhHiY1v+5PwLrR0Ah5Nwb4SAmbYwwdSw==
X-Received: by 10.28.224.84 with SMTP id x81mr4359184wmg.62.1455810075090;
	Thu, 18 Feb 2016 07:41:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x66sm3519662wmb.20.2016.02.18.07.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Feb 2016 07:41:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2016 16:41:35 +0100
Message-Id: <1455810095-8089-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5] qtwebengine: Hide textrel QA warning until there is proper fix for it
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
X-List-Received-Date: Thu, 18 Feb 2016 15:41:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index aa45536..d2975ef 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -125,3 +125,6 @@ SRCREV = "${SRCREV_qtwebengine}"
 SRCREV_FORMAT = "qtwebengine_chromium"
 
 S = "${WORKDIR}/git"
+
+# WARNING: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+3f02c25de4_779a2388fc-r0 do_package_qa: QA Issue: ELF binary '/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtwebengine/5.5.99+5.6.0-rc+gitAUTOINC+3f02c25de4_779a2388fc-r0/packages-split/qtwebengine/usr/lib/libQt5WebEngineCore.so.5.6.0' has relocations in .text [textrel]
+INSANE_SKIP_${PN} += "textrel"
-- 
2.7.1


