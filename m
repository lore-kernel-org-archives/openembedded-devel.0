Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id EE40B6E666
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:37 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id qe11so50392427lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=auPW1xY3PHBvQzblnI+d3mYKjVdqErUSihFslR0fuPQ=;
	b=MnksYHjYha+b1yJa+MIQ541+Aa/Q3nLHi6NT/1UYqoX0GpLDPgP4kqPt1ILA+XuGrw
	HYbklzGAGlVW5TrHCTG8iJLQtXW1V7SFpuMER7MAnc0JoC7cN8Hi6ID7lVcF4p948p+L
	SpmyCqzB6S8TUyZeeJYKR/PqEmUZ9j+O2qkkekDR3VAMmgevAn55XEroRQD9K1bsaCCo
	+KAf903YmBV0+OxjsGxYCN34rbmSKtzUSBD+lHizKhLjUFBueCccTuOzBg+sSfCx5faJ
	RJ+uAO+vZj+nOST3uR7Ugt6TA0em/ghmktt6X6Wctf7+mpvfN7fbpZMFVNAcqN+HZOxA
	eqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=auPW1xY3PHBvQzblnI+d3mYKjVdqErUSihFslR0fuPQ=;
	b=WXr4xjVKn68niJfF+qpInNQYsw7yXvpFiNKT732oDQ8IbtgI/fBwbcq8MWHCFiWUHz
	SJZHx3/N0KEN9YZ4qb4/bhPuh59DgsfJbKz+IOZLaAQccmyP5dgHdbD3hoB0oXm4g6ua
	JAUV/AyKKHK+m+mdb12u4C2zLhYpJUpHQAneUxa9b9ebUk7QNJ4EW4w/MxWpkCeuMYK5
	FvU/qIDFTkCcLqL3ef88NgzFKk8Ad0qpVEvp/j4kZRPhntHN+Jfy+VQdwmoCVyUhRz6k
	ImijP1hMp/WRNkFAN7WsR/p/OPeB/HMZ6DldjoIDoUMOJJ2SJRGV1l2T6wR0TboyAfwu
	KZHg==
X-Gm-Message-State: AD7BkJLgq2NBjMZj7fN3m/S6zqvPcvDqdOCt4fkPc2KxFBuDPawXgxUaL2wIZRCSn+9yxw==
X-Received: by 10.112.12.98 with SMTP id x2mr6345896lbb.76.1459423598143;
	Thu, 31 Mar 2016 04:26:38 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:37 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:28 +0200
Message-Id: <1459423593-4123-3-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v4 2/7] opencv: Update to version 3.1
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
X-List-Received-Date: Thu, 31 Mar 2016 11:26:39 -0000

The first major update in 3.0 release series

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_3.0.bb
rename to meta-oe/recipes-support/opencv/opencv_3.1.bb
index f6c4ca8fac16..b8fb6a51376f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -10,15 +10,15 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
-SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
+SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
+SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
 	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
 
-PV = "3.0+git${SRCPV}"
+PV = "3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.8.0.rc3


