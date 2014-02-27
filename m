Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 118C560017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:16:08 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so32353wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nne15KCfOJQtj1jLCkpBMbSrvXrn+i801SMVERZyzNE=;
	b=O6HQB8cYyGon0u/ezec0sfwpT+dzqoDE/aqIiXQMxpDLkS8KdXVDXC/lOJtXmY7jV2
	SwerbO3cWwNTTL2KSWXWovNCeJlD3VToTfrSH6geZOu4neUGjmhha8cM+Cgjb/oFm0gX
	C7E+Dhcu8APmTvDggcgBW5h5T+c8A8TlyeW1D+3uEx6DzxTG2CdUXI8e8Gva1HxFipQJ
	mYGD2qtrUVDR7VMxJQoG1rftT9OiY+9XbZelLIXOsP7v89r+pI2G0P6C7ZBdFco/Qo6P
	8Qr9pNQejANhATx8w0M7fPK1+MSYGPSqRTXddZ3VUX+AT1EL5jTRbsX08l/HkDTyHftP
	zejg==
X-Gm-Message-State: ALoCoQkMvot+T7ijdpbib/m0tn/a3ZUBx7Sro3JXB7MDFrwtGvkKtKg1ephT9TQBFohjvDxTOAMp
X-Received: by 10.180.73.141 with SMTP id l13mr281854wiv.60.1393539368921;
	Thu, 27 Feb 2014 14:16:08 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	bj3sm14499950wjb.14.2014.02.27.14.16.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:16:07 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:15:58 +0100
Message-Id: <1393539360-17923-2-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393539360-17923-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1393539360-17923-1-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora v2 1/3] qtbase.inc: don't force ARM_INSTRUCTION_SET to arm
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
X-List-Received-Date: Thu, 27 Feb 2014 22:16:11 -0000

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


