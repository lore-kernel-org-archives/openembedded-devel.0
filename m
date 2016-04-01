Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 593B176F8C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:36 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id k79so90175802lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=auPW1xY3PHBvQzblnI+d3mYKjVdqErUSihFslR0fuPQ=;
	b=xbfmz4XaFiJ9jlgqWNUb6XctcGkuIUWP39DgaBu6azZhMTW47RGLt65j2/QF9Awf6m
	MbBu0kxCZ0UXlPlUQQuI8x/ArwKALlicZP7iQ/v9SK5Y+F57R77q2/Pmi1tSzl9TkGiY
	E6YyQ/Cl0XoC8lR5wNEjjd7aMNeIQ2tKxACc692Pa04pFceB9hm7GIFE5qR2ZqwzmrgT
	11MxBH0PP6hgUhpDBjd2m/X3nVoLPixZ2MHoq/nCHck5jnXiM6CFQ1w7hYjgEFRpHbhn
	PQlCYJpxxCYuEoLQ3AGbSBy/gfqmpzgLJfzOEWov4gtA/5QzVrQvqg8HzQQOtEg3mVlJ
	pZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=auPW1xY3PHBvQzblnI+d3mYKjVdqErUSihFslR0fuPQ=;
	b=AryFbTdGMBraukHpzrSAAhE4/o5mlNygd5pS8NiaOL42oAnBfZuZAUa7ec8LzgOPU6
	X4ZjLJg9cy8ZdP/hbiY4fuq3QOM0wEXoqgKE4DUuWx/zYO2oGgP1inVqCQWnvtRPYDCI
	63bkZySkBPf4HBVbqsKLxlCoeEjILQx0WH0TBvincytw4ZL9Jh7lzHaYy+078XUH/OxC
	zM3RJZdgQDko56E8eyPWsY/JK3mK80ZJ1HiteLNerzR+VBpwbBT2uWGvAPmf9qNBWq0A
	eaEQlQuwNS5e/pUB0nzF58PrvaKGpN5OBCuI7vnP75aDma+YS1luRYG8SFglxITEiYo5
	aM0A==
X-Gm-Message-State: AD7BkJKQ+3t2v+6s5CrZV8Ae2wv/gbjh+W/hY5YiErh3JurQvPTwkCUp1V1QrFYUanlaSw==
X-Received: by 10.25.137.67 with SMTP id l64mr2360046lfd.158.1459546596600;
	Fri, 01 Apr 2016 14:36:36 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:35 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:25 +0200
Message-Id: <1459546590-9513-3-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v7 2/7] opencv: Update to version 3.1
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:36 -0000

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


