Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A4C9C65D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:25:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 133so15300283wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0oabL84NRisAFv2kr4vJOSOSepB4bLi8o/HHEs1kzd4=;
	b=hR3y5VkZ4lz6TK+a7r5iQcvp7ikIUFyWln2szQ+pvEmicjUIsJTfPLzORSdmLjH2gj
	vhUkVUk3GGdLPeODevSzV6e/tVewy9zbMYo8YNlYN+uF1seC5lKgPTmTyHHrMqXrOB9L
	RHNjVHU3EYCtlpv2nqAThsmhv6o8cwSx4LEryv9c1UGTma+F7dnoMSoqwGBZvsLtjb6W
	P6STPYnXU3nodUTzxnfn7PKSK3506dIo+ZcNa5eXz/AbHB+e9BOISa8SM43xBVPBAyi0
	XKSDvxX/0KFJkUk701FJOsBWO1bBTG2vwEZQY5U/xFKiae3eT2hYc+2fMqapu+t5BOgx
	kldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0oabL84NRisAFv2kr4vJOSOSepB4bLi8o/HHEs1kzd4=;
	b=F6Kqrlt1wF3WngoV1lR6dmIBOEjEoosYCZx39qSV87moG5Ou8eLaXcizeptIOAxe1T
	N8SD9SfUnwmBIX+l2x6i4Cmudq1GcO/JASC6cCCyQT7zpgKxZ71YClAQamjafGiv5XuT
	AD4MHpYV4LjBDdOWQBvTAuyndTRPLN8nnmjtm4wcH6jHYTZmjiPqDTI+YrGP0cdCuXjk
	nwJjk1eOOOCu2tfNJdM6StoRAhMkl3XFB0Vphc7J1pa5OfyfUBj/2BkyJfu6GrI/civ1
	BMFt8seFxivVNhDOnYNzxlBzv1zOFloWJNxpRXqSMtF5uYr8qiiXyfxAYH5gEOiRoVoe
	pLeQ==
X-Gm-Message-State: AE9vXwN6CgsJvLWmYfnSy9JkWgIpLt+9aaplzp1wb0J1pbXcP+1Rvu8Mc+B5+UTLdpQB/g==
X-Received: by 10.194.141.203 with SMTP id rq11mr24596867wjb.112.1474295149732;
	Mon, 19 Sep 2016 07:25:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bo7sm23401918wjb.28.2016.09.19.07.25.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 07:25:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:25:43 +0200
Message-Id: <20160919142547.11541-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH 1/5] jasper: add PACKAGECONFIG for opengl
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
X-List-Received-Date: Mon, 19 Sep 2016 14:25:49 -0000

* fixed 3 autodetected dependencies:
  WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build dependency?
  WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build dependency?
  WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
index 2c51319..cc6a694 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
@@ -10,6 +10,7 @@ inherit autotools lib_package
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
+PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,freeglut"
 
 EXTRA_OECONF = "--enable-shared"
 
-- 
2.10.0


