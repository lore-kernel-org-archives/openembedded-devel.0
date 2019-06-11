Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF327E5B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:14 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id p11so13849416wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Iodg+L/eHzQE54nXcQKUpzxNp+vRVEnUwPBrAz5cIoc=;
	b=TRaZ5y2UMm3zJN9D7EZSqipJvVooDEgLjJm8hYseaZtyhG5YvJQIGU/3dJxr+nNt+P
	V5V5luruNfTtdUYvLfAIhsWbki0g1LmjTAtG8uG5Z32n50DQomW+ZdncrDh0LK1oMDf1
	T+lU/OoeaDcX30WZI+sTpL+fevSyqKK2y3qkCMkkgB54NxC51ZbFPbecMLTwL10Ou85s
	p4mnf/iiSIPiuwAm6/eepHEeZ3qIQbEi+bA52n3vGD9f4ewAOHEx2EzxamflIzek+bg2
	zDUlXS7TifKJHJQXwlXdU5HrpBhy1vKNNNx5UzMFIoqj6rHzmJRVi/vFk+45HFB/eELZ
	AQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Iodg+L/eHzQE54nXcQKUpzxNp+vRVEnUwPBrAz5cIoc=;
	b=GFf0G5rK1zWVKYjG2v0nf5hSMO+zkAEA/VD1FLqwxdN9nWmCUk3ebT0dv2611fA1Et
	072Te8y1Ra/oyjavPWx53kzDweD7fCZNAaIVR3dVqrbvF4hxmMGHWl1sQ4OQdjraL2KY
	YqMK5X5wGNGdY5TSReHLnPNv54NJkC/AVvRndntufXigUtwJtGG0kDaY2mc6TStGS9Im
	1vzK/R6GhX8s1elOzdcFR9pejRtHOV14dtJQ11Kl7K752ph6n6tRvM4sM5dmNudG2w6Q
	pzPePwViwVkEKeOTKYnSUBJ2GmoeRT1H6+zUfco3eHBjpNNBJs8H5/Cn05hfKQcRk4Ln
	AS8A==
X-Gm-Message-State: APjAAAXfB/Ng79TSc5MfGGfpL0ij7VCUeDqzD7on1B9TQGGPqHAzJIPG
	jTLJMY8ZOTNrUyp8upfSC/JvNHxf
X-Google-Smtp-Source: APXvYqzyJE3ui1VmePaJM73yuh+4f6hVQK/3AHKJG3GKmM64DqN58VV5jL1SdxL8LSomMBcN8wJPvA==
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr31584337wrn.160.1560272115355;
	Tue, 11 Jun 2019 09:55:15 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	u13sm16267267wrq.62.2019.06.11.09.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:55:01 +0000
Message-Id: <20190611165504.23049-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 08/11] opencv: use the same package name in PACKAGES and RDEPENDS
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
index fa6e06a255..ce60698b2b 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
@@ -176,7 +176,7 @@ SUMMARY_python3-opencv = "Python bindings to opencv"
 FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python3-opencv = "python3-core python3-numpy"
 
-RDEPENDS_opencv-apps  = "bash"
+RDEPENDS_${PN}-apps  = "bash"
 
 do_install_append() {
     cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-- 
2.17.1


