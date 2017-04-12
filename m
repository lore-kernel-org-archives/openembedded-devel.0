Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFD677CD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q125so8652002wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=urmdV5Q9Rt4owhQOfpw3glcX3SQoiWCby5YKG9hN2r8=;
	b=iQNgVkEjYCWb78/f/BkLD/Tye/ZYMsI3JUh/a4IjrpJMynlrKNGcyAoSqZQT8fT3lb
	fpPKz+GPDjIcuidmOvEGiz44UZw7ZH0aEK4sMNd19509xilFrgc9w1sjI6zBcUAISq+Q
	T2ben/Y8nZX1i0DLNorGsY/647nU0pFbef0y6H9kZHm5EVLLJRNKIZkrzJZFbz2vMoPG
	/S8XLs9qFz/SKjmWFCL3qbGeJRcENcLWvFFeZWqNVdj81U58tNluUHIULkUpIHa7hbWx
	h5jKPNq24gwuFcaFccGK0JQcPO+oSWmYXaRNIelCv3GlfmSiHcVIY/KKIGZEVZN0nLVL
	mSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=urmdV5Q9Rt4owhQOfpw3glcX3SQoiWCby5YKG9hN2r8=;
	b=n+RWWWmLRSUYnu5/tqQzSLdJFlS2SW7ukq/ttM1/Sje6T5ROObJVkzDpuDEbOe9zSQ
	IJDBLfigWQqskagxevsiVIo6vGfki2iSkBjRMuj861J1zFrYjO55IT9hBvXkiVYqh2Ju
	XY7zZub5PdDL1eI1DLcqa0VbtPUaY9yAKwVBljimSWXfts2wZaMom9I9qATr5kEB6Avj
	ZmVBiRi9eGv9Ka+U0BxPDeZE/4MVbsKoPfBoAs6wGnpbM5ZnLRC0RtwQrUPt2Ac/27nv
	0Kd+Q9/+N+6UuRvJEoxZ8LptTWxm5UdF09pPtZ9Q30VBpeh4jER2HJLPlwOZUZBKxcHI
	RNjw==
X-Gm-Message-State: AN3rC/53YbTvsgBDu0VTahczOVQxrm091IYU+m+KOU0ENj5ApmxkXS5PbrpeGRJqKL/H2A==
X-Received: by 10.28.174.16 with SMTP id x16mr4277943wme.11.1492027015212;
	Wed, 12 Apr 2017 12:56:55 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:12 +0200
Message-Id: <20170412195638.3243-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/29] thunar: update 1.6.10 -> 1.6.11
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.10.bb => thunar_1.6.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.10.bb => thunar_1.6.11.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.11.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.11.bb
index 90fd788..c750e8c 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.11.bb
@@ -9,8 +9,8 @@ inherit xfce distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "3089e1dca6e408641b07cd9c759dea5e"
-SRC_URI[sha256sum] = "7e9d24067268900e5e44d3325e60a1a2b2f8f556ec238ec12574fbea15fdee8a"
+SRC_URI[md5sum] = "9749be8247cb19ed0fd36e4118c6236a"
+SRC_URI[sha256sum] = "b1c7c3121827f59610900ef1cc19aa10a50ab2cc3ae38eee15181b64256e8b42"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.9.3


