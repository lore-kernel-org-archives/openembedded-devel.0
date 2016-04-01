Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 09D8676294
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:33 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id c62so90148601lfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vF/MYqiIeNXctlRm+WXDbSCL4x4PS46E392j4e/ZBds=;
	b=W5C8VkTHcW45BavRZEHsrjLM1Vuqe7OhPumOjTClbhb0bf0L83k1yW/Fk1YLmH4JVp
	9lLtBOCvPY+BWM9FeSWl30AtMgyDePXs+G75ya2ivhNQuDLIrRUYGFSJ+yRewISnhYB0
	C7XNf5SC1Og054QU8FPDCvrASQLvKJB4oQnsf8tRxdcV7M8h3a0purGQO5myfD1dVPp8
	XoazYhDbUKoTMuvadpdw6+AI+rG5bbGuO2rKsAOTelRTYD+c0vn2Laza/3qlzph/qUDD
	bERHrzhoT+aneyDYvwKTZAGJnkU9JWvJjU895IFze54ePBWfqfh4zKTQ91yijxDNT93/
	oq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vF/MYqiIeNXctlRm+WXDbSCL4x4PS46E392j4e/ZBds=;
	b=eUL9ldZ/jdGv4LCqPz1gEEMYJYDK8rpEccus0oXlNTYeluXCFJG/IWdqbLxewui74e
	J60wqed2OGvRXmX4ZqqdH10cODO+GEV0YB9p3Czswod75hV0ApYEvsQIzguNX4wrTtpl
	nsScKrTE1iocqqq/wgFSX+HCnTOIyxPHvOj4yGMr3BvhjBprMGnAic/WdMt0UeScoM3W
	DgF4/TsCApF0fB1zqHuTwKNzgwxnrzpgFrD5Xxw2xLh5UP2AysUzVOd8x4Ts51ax232s
	mUr+7DmQXrd8RPKbDfxPn5Xv9hpo8A/W6FlpYKJiRCMpjSmh0MCEA1AWNUIof8DOtsXD
	65Xg==
X-Gm-Message-State: AD7BkJJ/6M53Dnx1agm1fvcb7Bv40qnZuG4OWfTKAB84KDtRNIkNbLFG7UpO28O5uKWuyg==
X-Received: by 10.25.156.133 with SMTP id f127mr2757583lfe.102.1459546593466; 
	Fri, 01 Apr 2016 14:36:33 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:32 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:23 +0200
Message-Id: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [meta-oe][PATCH v7 0/7] opencv: Update to 3.1 and remove bl
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:35 -0000

What can I say... Sorry about all the spam :S. This should have
never reach v7.

Hopefully all the dependecies are ok this time.
It also predownloads the Intel IPP, using bitbake.

I have decided to resend the whole patchset because it is now a
mess of v7, v6, v5...

It is also available on 
https://github.com/ribalda/meta-openembedded/tree/opencv-v7

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
 .../opencv/{opencv_3.0.bb => opencv_3.1.bb}        | 28 +++++++++++++++------
 3 files changed, 77 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
 rename meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} (86%)

-- 
2.8.0.rc3


