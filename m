Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id D1E516AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 02:35:29 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id y188so2270005ywf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 19:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PBSYlNSW+VcMEYDv2y1yX7NK/fdzE//+LMTRz2I2y2Y=;
	b=UmjPN0ZUqFMVBVVVHRR56RQj0vffx7eyYi5qcPtEUPID0/KokiFrchY3dg58msBesF
	E/tLT6wvVuKQMDV0AaSEnmAP9P317uHoKc+k7/9DS5QcwOij7tDtIxfhyrPvAfyCIUkS
	1DAEDRbAn4j+L1h6rIbarfk8DrXspjBn9ShYlLdecrpCo5e8r0t8/ZzmHJxcOpwKt5Vf
	x+oWYj2XyUPd4PdhK6ddQnVH1Z2B7S2XQDEJh/JEo6BIbPalwFn/jAnZuR4LeoR/9oYk
	dh+OatNE4jz9TOC0QcNvbGBrEw59M9XlD9cwQ2J37fe7UTVm/I6EnkJg4wAsdYQlLOH0
	Tt3w==
X-Gm-Message-State: ALyK8tI3D/XUOvj0LwsDwsib4M+PX0EjeGEPueWS3Qw5mqCdATTxUXYgGY/KEsfP8YwtMg==
X-Received: by 10.129.72.201 with SMTP id v192mr4493263ywa.231.1468377330420; 
	Tue, 12 Jul 2016 19:35:30 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id s78sm919396ywg.26.2016.07.12.19.35.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 19:35:29 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2016 22:35:19 -0400
Message-Id: <1468377319-5770-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-backports-ssl: add package RDEPENDS
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
X-List-Received-Date: Wed, 13 Jul 2016 02:35:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
index 313ed4a..45492da 100644
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
@@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e3
 
 PYPI_PACKAGE = "backports.ssl_match_hostname"
 inherit pypi setuptools
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pkgutil"
-- 
1.9.1


