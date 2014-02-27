Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 205C76F3A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:36:20 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id z12so3068138wgg.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 08:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nne15KCfOJQtj1jLCkpBMbSrvXrn+i801SMVERZyzNE=;
	b=UD88xJVmst25z9sBo4NhAuG/qH1OnwtMkAo5+97GMgvxt3rFlwltxidEGG8t9R7C5G
	Kxfz9NkM2l71bqvSL8+jhH4xJ3NuihPvjjVYSTieBGPawmkKAzyULcm/FFPa/YP5Uk2M
	CrMw4CN7hLggygAqCAfdd+XKQ71+aeIAtwA70OEMUuTF5kUaKz+bObo5+i169Y5CyrOe
	OBbVHiKRIixBxwgHxq1wFpNlEoHKud4UfYseZXK+YQJyYC474ubxa4PT2lCc6J4LJLRW
	I2Rh2H7/WUcczRxv0wpm5InBiAQgWhQrnaZHhsC+BSOEl6IiAyGq/50zlbXRoNuDTsfH
	Gvpw==
X-Gm-Message-State: ALoCoQkH0kfb39Vhxf3ilOZceROD/ZZLafcf++X0zxGyMB3bTxik+xPoFtgoqIUoW81b2rZsi3U1
X-Received: by 10.180.84.73 with SMTP id w9mr13676714wiy.58.1393518981357;
	Thu, 27 Feb 2014 08:36:21 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id 12sm12452107wjm.10.2014.02.27.08.36.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 08:36:20 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 17:35:52 +0100
Message-Id: <1393518954-15100-2-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393518954-15100-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1393518954-15100-1-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora 1/3] qtbase.inc: don't force ARM_INSTRUCTION_SET to arm
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
X-List-Received-Date: Thu, 27 Feb 2014 16:36:21 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Forcing ARM_INSTRUCTION_SET to arm when building qtbase no longer
seems to be required.

Confirmed by forcing ARM_INSTRUCTION_SET to thumb and building
qtbase 5.1.1 and 5.2.1 tuned for both armv4t and cortexa9thf-neon.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 recipes-qt/qt5/qtbase.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 71da726..e4beafd 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -130,9 +130,6 @@ QT_CONFIG_FLAGS += " \
     ${EXTRA_OECONF} \
 "
 
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-
 do_generate_qt_config_file_append() {
     cat >> ${QT_CONF_PATH} <<EOF
 
-- 
1.9.0


