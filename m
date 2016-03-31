Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 86747601B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:36 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id c62so57234301lfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7bpPW62gT6xpiaXea9Q1/LTfa2Exey1SxNFb+6MCYN8=;
	b=SXQ4ebChNYPVC3vjTlEx3Xk8gaRUOnoOqHAVE6E/x5lk3Cgmkv94oExhAvrbhxfKiX
	q6kMolWf7DJudBLsieIecokZ0BB47ZCPnBdmXS/SaeLGsZv0nnIXsOHObwNa+B6tsZmr
	jhjR4eH06R0Qvv4OhGAGQbl2CB0H7fDUnWlqDW2+E8CQYPTH9KUmkeBkRq6b0dipKt4X
	vQ9X7X/exEGSmXqsyfbCH18MrPWEzJfrZ8EeHlwQVkAop0od4CXF7e9UnBoTdw2SwGyP
	RD/HQHqQ7XxE5iQEJELAyjBuYSEHxh7syCRBGvWv7/dfY6YOUeWRftEgpsjBZv6UjQxk
	Cz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7bpPW62gT6xpiaXea9Q1/LTfa2Exey1SxNFb+6MCYN8=;
	b=LcbvEOluN4+0Bq3Fu32bjZbC9viHArKdT5Giku4o1wYlnxPh6np9FSIgRN7P4Sf6WO
	kIeohmC98P9zvz8N8/rqSIga/Fn3oLBig8rEiCX7ELAmj0bTe5BmfDFXKfJ3cWcUpToI
	E7iU9iO0qCoBSuCYwR6zmkbhi5r2w1/lokOy1zntINiquV+H5+wb9z9XcNe5gtvyqQk1
	b8lr4AA7qI54Z0q7qS7ORgNpMT34SFC/VunPoxRdcbAqIS2cO8/mEyDLerx5sm72ASW7
	k+OXwZyc00jMV0Vk7pgd6R0oF3bfVhaXuMtnEOWoTG7vxGSpq8VHelyLju79J8rfRzC8
	RsnA==
X-Gm-Message-State: AD7BkJJDe0//cgohmDlfjVuEJ0SHAn8qzBTwjGAmPnbBm0Qr3xUlWvwPyPM3pOdN8Em+HQ==
X-Received: by 10.25.20.222 with SMTP id 91mr6768159lfu.100.1459423595624;
	Thu, 31 Mar 2016 04:26:35 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:34 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:26 +0200
Message-Id: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [meta-oe][PATCH v4 0/7] OpenCV Update to 3.1 and remove blacklist
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


Hi, I hope this is the last patchset version (cross fingers).

It has been tested with x86 and x86-64.

Depends on pyton-numpy: Add definition of off_t size (from oe-core)

Regards


Ricardo Ribalda Delgado (7):
  opencv: Fix use before set error on meta package
  opencv: Update to version 3.1
  opencv: Fix pkg-config file.
  opencv: Add missing dependencies
  opencv: Use pre-downloaded ipp
  opencv: Fix build on x86 platform
  opencv: Remove blacklist

 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch | 28 +++++++++++++++++++++
 .../opencv/opencv/fixpkgconfig.patch               | 29 ++++++++++++++++++++++
 .../opencv/{opencv_3.0.bb => opencv_3.1.bb}        | 24 ++++++++++++------
 3 files changed, 73 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
 rename meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} (87%)

-- 
2.8.0.rc3


