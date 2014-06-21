Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8088865FEC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:13 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so4594275wgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bKKmGRSULrxdRJ8GWdfmVuyrwEn3UflAaJ8q76qR61Y=;
	b=FyjLFX/Q3Hv5S33r7CC8CfRNui0KlDA1FLTWE4wVRbkqVjnisG+DgCYNd7xD8QRkWp
	3HEy0hGMOcV8CUaKm+ZR1T74PTeZYcgd7l5VBGyuVFvsXqaG+8z1TDFqRXU9+A1fIHwp
	XRPT6GfRB0QQWHwEs9kiGhfQ62W/qbE4SSZqT7np8R7j/cehIDUuIMppGPa7Q9gODFcJ
	XJGivC371fTGb1DuIYyk1xSltzwy/kioO0XarDAcDf19qHU25Aapvy9xhDcb5TGoGOQo
	QUNgNmcypXS9LuVCywESYFJFozN3Dgp/ieBphQjQGwRyKBfQbo2Yoo3HAw1K8rx/0jhZ
	IYWQ==
X-Received: by 10.180.90.233 with SMTP id bz9mr10153425wib.42.1403342354284;
	Sat, 21 Jun 2014 02:19:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jb16sm11244392wic.10.2014.06.21.02.19.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:02 +0200
Message-Id: <1403342349-11180-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 05/12] enca: add missing dependency on virtual/libiconv
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/enca/enca_1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index ea38946..d4457b8 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -2,6 +2,8 @@ SUMMARY = "Enca is an Extremely Naive Charset Analyser"
 SECTION = "libs"
 HOMEPAGE = "http://trific.ath.cx/software/enca/"
 
+DEPENDS += "virtual/libiconv"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
 
-- 
2.0.0


