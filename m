Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49F7176102
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:13:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b205so6011622wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mHTrnBVTiMBI8gakLN0tDi+aC7kHkmH6QlL0dpwCCCw=;
	b=JJviIV14+B9Ebzp3JH+YX2HiU2SKhcFwCC1aFPhGYzVu3Dl/zVi4h/IKEk+B9W3hG7
	4PPs4/tii0DrQFtpTcWCV0PR2ig9h2IBsZBuG53o4h6Yf8fbEcVdSzdicSaTcAlK6NFy
	8/mmuwSBVRTLV3u1fHQqTm6E+v9GT7KU7CKHSW5kFon+Mmq4v1p3f6gtjtjTMSZi98U4
	KLgk7yeWfvVEl8kHhUbO+0rLLhrr+yahba0sh7FMPTANNqMMAiHt6aOUcAQkqzqxTgZn
	DGH41RAnb80JAkfP3l8v0zUV14jJja14DwT2D9/07b33mHBDgMPEMSZB1Ek6OtgeAR5T
	0/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mHTrnBVTiMBI8gakLN0tDi+aC7kHkmH6QlL0dpwCCCw=;
	b=ORm58N3NuYQL6mfrve7FaJluaRCrWsRisurOV/CvzFZ6qqoIj4K3KcUOMzqfMlWG4u
	jbbYICZNZQhD73qr+9M0SrWzaSoGfpyQEoVn8MtNKzQxTyhwPeyIByNt++3QJpitkhT+
	OjwD1wBFO9ljfFDkTYnequYdRV0r5YTSbN4oPG3PlwinlaQWnReS+dS64obKFuy7Cur5
	emj/lWGpfkLdDUwGutBtOhm6gmSIFugNbKCiU/BrVadRpEV+bvVMsExcBz3B6OMWddao
	vApM3VaMk2O5dg5Myyy7zi3VhvGzVKApf2cXFtNJV4uBKY5pib+jvyIQQsmCX+xn69ep
	torQ==
X-Gm-Message-State: AG10YOQWH8t/0JhvNnFhYCv8LWqqfOy5NThR3k8mkKSNKNakthcpe0E2c9HuW15Coen2bQ==
X-Received: by 10.28.95.6 with SMTP id t6mr782013wmb.59.1456438382437;
	Thu, 25 Feb 2016 14:13:02 -0800 (PST)
Received: from localhost.localdomain (p4FDF1458.dip0.t-ipconnect.de.
	[79.223.20.88]) by smtp.googlemail.com with ESMTPSA id
	hx10sm2163102wjb.25.2016.02.25.14.13.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 14:13:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 23:12:48 +0100
Message-Id: <1456438369-28621-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456438369-28621-1-git-send-email-schnitzeltony@googlemail.com>
References: <1456438369-28621-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] abiword: unblacklist - gtkmathview is back building
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
X-List-Received-Date: Thu, 25 Feb 2016 22:13:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 89ba736..962a56c 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -122,5 +122,3 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
-
-PNBLACKLIST[abiword] ?= "Depends on broken gtkmathview"
-- 
2.5.0


