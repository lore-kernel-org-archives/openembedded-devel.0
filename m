Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3084473198
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:20 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id s5so6266619qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=aMfJNu0jcDyP6Laf0XCU6dnuC3av8oDD6N1reTUnRo0=;
	b=ZQXcjzZ2xHeBJCH4kFMWmrkMo1YL7/oULbaw+Zq/J6xvqs+nsw9Fji5JuaEMP3mqD8
	WkNgn2PCL3/+sxrLJByUrFlHJYvUlURU/sxuc/NJM+Wd0wN4BoSiL2AWU1z3A7uQp2BV
	TjY+1EnwT0b839d0CVZBif7DZ4aWKdj+NrUz3omaZq5KuKOUnl/5MuwQu4rupQjPjnGO
	tt9+iijaUCvC4T+Nx/WZJvp4WEgeSp9bKHXXU+xX+sk0gT4e17DOgTM6UHvu/J62J4kH
	EzTLeFv7pSwgrhgyOveW+E7u+dET3lEvnz/ZqTcPMHDUuF8YM8tPVb1Yak/+7ylq5wxf
	/Y9w==
X-Gm-Message-State: AD7BkJJf9ue/Ym0Uz8eTHytfqdl09zP6HkNjrJUrw11tOQFWeS9QHVbrdOYF+O35pWbeLw==
X-Received: by 10.55.76.11 with SMTP id z11mr23284856qka.83.1458997520923;
	Sat, 26 Mar 2016 06:05:20 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:40 -0400
Message-Id: <6d7a10f65f6500a5371c44bda4dd536e7c16d32e.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 20/30] python-py: update to 1.4.31
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-py_1.4.26.bb => python-py_1.4.31.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.4.26.bb => python-py_1.4.31.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python-py_1.4.26.bb b/meta-python/recipes-devtools/python/python-py_1.4.31.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python-py_1.4.26.bb
rename to meta-python/recipes-devtools/python/python-py_1.4.31.bb
index bb20a41..592bc04 100644
--- a/meta-python/recipes-devtools/python/python-py_1.4.26.bb
+++ b/meta-python/recipes-devtools/python/python-py_1.4.31.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "30c3fd92a53f1a5ed6f3591c1fe75c0e"
-SRC_URI[sha256sum] = "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
+SRC_URI[md5sum] = "5d2c63c56dc3f2115ec35c066ecd582b"
+SRC_URI[sha256sum] = "a6501963c725fc2554dabfece8ae9a8fb5e149c0ac0a42fd2b02c5c1c57fc114"
 
 inherit pypi setuptools
-- 
1.9.1


