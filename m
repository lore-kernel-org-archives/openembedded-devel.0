Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 998D171D9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:04:18 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y21so4873382lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rwSCWC04WRUse8bUdkAvqHrxcOC5wLUdSTSZAffJ+Z8=;
	b=PoXwLT4MlQ463wqonLPjzoIMAacrl4Yvm46Fs+zVIRsVV+8T2XU6MQAIZ5dsHpNv+R
	MC+nSiYGPmHM4P+OXQq0JZ2UdaGbZ7zbKnAgooV063tEHFVQMVzk04QNqf5TWR+cOMQ7
	H9AcTkBeul0wZR47m4lteKMbyGZVdOw/QXbWnKhEqeOH8bgHp0DzFuSOL5lACXVQapFg
	YiDjAVgi8h//pBJC12lTcSoC3FM/zIR99lfVCCa95QulTfWdjzE2AgIlC9zcpmTr5yVa
	nOjDvU6JeXemIHdcddZMc8T1rDD1BYnTTLECj9v3a6zV3ma7UmeWi4l6y9uUiIgznn8F
	tNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rwSCWC04WRUse8bUdkAvqHrxcOC5wLUdSTSZAffJ+Z8=;
	b=Gkuu9OoNw3CuokdJRV747dIB3hsh40wFZ0ew/gaCFGl8VaNvtKNxOqOWl0Z8FKXtfU
	8OXj7U6sjSWMtAgQ2NHm3ORgrVzBoAZyQbSgNVBKEvR+/iaYwigfvgUPOpctoPUPdkPO
	DLdPVrfuJY4QLJZQZLBawK/KofKpyqwYN9T70vJrPB/s2B1hUlLG9Wh2LA99KNczkfkB
	o7mCwDTtRLyTu0aw2IzMCeF0AbvfumAmDW00Z0klZb56ZIbNFlMdimjpkRP2QAH7op4Q
	5ybWXRSuNug7n42n3AlKUGHx3ecU8AdEjQrMpg1HoNMptgRsOA9IkB0iqlyiPZxy+Adi
	fNbw==
X-Gm-Message-State: AKaTC02NCNmbK5y3RF4qGQo+BPOWzxun53IhAbMO93qfOXIiCH3bQ+8FhOwlH4M5k+SDRw==
X-Received: by 10.25.205.193 with SMTP id d184mr32641728lfg.23.1481663059728; 
	Tue, 13 Dec 2016 13:04:19 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 26sm6678921lji.37.2016.12.13.13.04.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 13:04:18 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com
Date: Tue, 13 Dec 2016 22:04:03 +0100
Message-Id: <20161213210404.6940-7-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 7/8] opencv: Add new PACKAGECONFIG lapack
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
X-List-Received-Date: Tue, 13 Dec 2016 21:04:19 -0000

If lapack is detected there are some extra OpenCV modules that can be
built. Unfortunately they cannot be selected with -DWIDH ...

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 8cab3b87ea95..f1a3ff55009c 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -70,6 +70,7 @@ PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUI
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[lapack] = ",,lapack,"
 
 inherit pkgconfig cmake
 
-- 
2.10.2


