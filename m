Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B92660017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:20:44 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so2013030wes.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nne15KCfOJQtj1jLCkpBMbSrvXrn+i801SMVERZyzNE=;
	b=jM2N2wvI6H2ak1snVaeF6ueLAlhLp6ETN2/Ojfh4/RcmUanNK9BZgy5NUOY024BouF
	5137SrPs+1S2QoDij91x7ZJnB7b2s4OnZTsB4Ojrfe6Wd2+q6+EvH/svLCv+AMUeB+1X
	Mb5sl8tHzgqZNcUj7FbjjektJ5vp5r6v/t/7fBM4O6P5wt9Fhp2OXyvkAAwVNNCqhB//
	SXZ8WTTbipHBXJQW/Vd437JbbZn5l5L1z5s8LuxhTTrrvvhOQP/Zote8Wh+Fd/fSyLRg
	jeavL18ShQUbKU6P8AFbLAKzfGHDc74wOssNd1U0HItJnR9UwQ7jkkmST2gRE5HKtNiJ
	N+Bw==
X-Gm-Message-State: ALoCoQnz5XPRi5ADNMZr/6goSKiAyQsQrdhtRWWs+6agT7N3872l6BUNEjDzbuusA2Ej7NeT+MUK
X-Received: by 10.194.175.202 with SMTP id cc10mr10345367wjc.48.1393539645683; 
	Thu, 27 Feb 2014 14:20:45 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id ju6sm14526019wjc.1.2014.02.27.14.20.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:20:45 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:20:36 +0100
Message-Id: <1393539638-18126-2-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393539638-18126-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1393539638-18126-1-git-send-email-nicolas.dechesne@linaro.org>
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
X-List-Received-Date: Thu, 27 Feb 2014 22:20:45 -0000

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


