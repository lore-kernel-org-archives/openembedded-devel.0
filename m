Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D7BEC78093
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 19:52:37 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q1so422893qkb.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 11:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ywX/yCawmE1+IjCDCKViNLCLADL16z/+oE8MrTnUomA=;
	b=INWaLZIV0ufsa2JBlE8WFuSMkBF5Dt0YwZ9tGH25ntBubO6FUOnjE92t8DFdI9NYD7
	HHEN8IUcYB+vzzxcSPMRV3C3wzRFTsnbpmOxNFMrP3iEpt1yOv3pjpMKy0jGY2S2EckJ
	8pLmA8jcZIbRCacqe9lPUFNooJwsg2ox7SHy79jI018fY6y1IuBy5qERDcKbqMpTzsvN
	cAmtfHfvMBOM9Z2yM8HlGezT9KDJtvRVDkSGaUI6SKrDIWPO1HESca/5MRMSOU64Wc+A
	wTWrfqbXOXsuE+8aalid1Q5eU8q/xQpu6zD/5E8csdK+ZLOxLnnNkXSUMUYonZMDGyeJ
	oPqQ==
X-Gm-Message-State: AKwxytcMRNqbqciTwQjSAg8px3XteNVLK6XnGxv6SfQZerdZ+fUesNew
	JQ082UQeJB2mt57K3DToD8/wdSDA
X-Google-Smtp-Source: ACJfBotdcjthnvQSRsPYCwA8bnjNfsLX2B5VIKcITiStaOfiuMZpUHXZInIKF462x8tolRyyUmM8BA==
X-Received: by 10.200.43.13 with SMTP id 13mr28663497qtu.341.1515613958492;
	Wed, 10 Jan 2018 11:52:38 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z17sm10655345qti.59.2018.01.10.11.52.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 11:52:37 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 14:52:31 -0500
Message-Id: <1515613951-26460-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.4.3
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
X-List-Received-Date: Wed, 10 Jan 2018 19:52:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.4.2.bb => python-psutil_5.4.3.bb}         | 0
 .../python/{python3-psutil_5.4.2.bb => python3-psutil_5.4.3.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.4.2.bb => python-psutil_5.4.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.4.2.bb => python3-psutil_5.4.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index a50d905..b96d54f 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "38aee50427a58533064491286dc2e3c5"
-SRC_URI[sha256sum] = "00a1f9ff8d1e035fba7bfdd6977fa8ea7937afdb4477339e5df3dba78194fe11"
+SRC_URI[md5sum] = "3b291833dbea631db9d271aa602a169a"
+SRC_URI[sha256sum] = "e2467e9312c2fa191687b89ff4bc2ad8843be4af6fb4dc95a7cc5f7d7a327b18"
 
 PACKAGES =+ "${PN}-tests"
 
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.4.2.bb b/meta-python/recipes-devtools/python/python-psutil_5.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.4.2.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.4.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.4.2.bb b/meta-python/recipes-devtools/python/python3-psutil_5.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.4.2.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.4.3.bb
-- 
2.7.4


