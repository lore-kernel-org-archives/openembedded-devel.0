Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 622B16FF73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 13:17:18 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id vo2so52357313lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T4AgxNGk6rtyg1+b6OX2oIsTpnHiws3wRo38V9QzqAk=;
	b=JsCb561EIB2naL6e+nV1y/rdtT2NB9c6OMSOvwEvudAytc7mz/5F+vvZDXnMC2epWx
	IWGkmNLK5ElysK/GMDqrweVDd7+iYmsvSEA2KcQ/IMLnoSWe7lWxHPoLDT+8CcLkefbg
	HyZWQ3gB/j4Z5RWzzdl22qo9rqAml6VwVVclkmPdgD6y1kx0ouVp+E6Fv7PvYrjObTHp
	N4isM0X9UdQWkXamKjBfFw6Z5vv6D+bfVPfDpGgUlGfwrmry3A+pmuszuYWxyb7dTqRE
	0w6Yzi7rKCH0wQUopsgEOAISTqRcdmf9Dp8KIaEXXRRsTaWnjunW+es7W8DViQX2KOCN
	/owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T4AgxNGk6rtyg1+b6OX2oIsTpnHiws3wRo38V9QzqAk=;
	b=Olgt5SqEGdKKjTrO5sdS3lydB0QjpXeCkEYiyapPyjArb539ASDPpAojjBdDeblvsy
	e/omq0+WH0UffNzz3Pc8otzbnB/3KfwDzbJBYMjCpg8j0M2ndZSRk3ShxcaKgsSMG18E
	1gGjGKdPteVCX6HCQM7D4AP1pjwiIhqfeKhOsCGtozItKlzwTyuIOSHW+CnrgopXxC5u
	6UA3dMXUiYaiuMAOpPR4wqxtdbsrFn3x8CKVtGy1YStZEPYBcMQOvLE5wtyNwksZhxS7
	thJz8YdcRw29KwXNtjOpFl/1q79XxMUBUB4PgctiVY0wURlMQhRiWxDUWu5CR5O+gjt8
	uxsA==
X-Gm-Message-State: AD7BkJL8o7DU3gJBhs2hGkbAjTKLRy0+WVoi64UVfnGboUn5JaZrEv5PBdF+OzIN2LWF9Q==
X-Received: by 10.112.141.73 with SMTP id rm9mr6456020lbb.57.1459430238942;
	Thu, 31 Mar 2016 06:17:18 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	m141sm1367954lfb.12.2016.03.31.06.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 06:17:17 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 15:17:10 +0200
Message-Id: <1459430230-3206-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [meta-oe][PATCH v5 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Thu, 31 Mar 2016 13:17:19 -0000

OpenCV wrongly assumes that the X86 variable would be set on Intel 32
bit architectures.

This patch adds the missing definition on those cases.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 84a592799c0a..3943043b327f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -41,6 +41,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
+EXTRA_OECMAKE_append_x86 = "-DX86=ON"
 
 PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-- 
2.8.0.rc3


