Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id BB9667FE07
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 16:21:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z3so8055613wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=F2U/ijBONX50ajLu2z07GmLerwICgnvB/LdOOfeL/c4=;
	b=1cZ1R0lJk53E9E31gvWnYY6RgDx6QK+Ays4tcfCILcTAaEbiuwYxVOzMHG5mzl1ANc
	BE1Gc4ngsLqmP5g1nRfZmyAG2Sh31Zu7/ID9lVyf4UYfYHOh0c2T3GL9iO56Rl6R32J/
	aWd1g+Zt2RInQ/ph7yoJOhgMTthfSTo7N1QlJQEShw2iUQ/MGNEEjKKvgx5R/pj9CYz5
	v4Vtfb6tJXRKmT54bdZuVfqbKMqeIGtBZ3z4naWfsnEeZ1HjCT0h+4tF+HIISwunL+Wz
	HjxksM4/JZhrrEkVPyyI+O85hTBw/2p+hBW9YCXlqydhgyJfZohPghQ+X1vfYbh5oPjD
	6kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F2U/ijBONX50ajLu2z07GmLerwICgnvB/LdOOfeL/c4=;
	b=Xu82y/DtP6hvwmgIqicIoX79xGOK4wd9Mjfrv/p5yqyWXqymsf+JAIiRqbYLqvxziZ
	3gk3JBGYvTnt0WYD7VEkfzcJGiDwh08l9i8ZYVt4s4HkJlsdaccGDlQPKwAxx2D5njxP
	ZSxrWfK4HUeoqZ3ForXOVyeeZodz2EkDsCRjHKwSpQzRk6fwhxRtG65AQ227IyTicvzN
	ZEbi3Qxc8pGgGjzFdT2SstsOoLxLIY/UIV3Y1+CxJnuvxyVE2UaFmX/oW2wCRVwTqNfn
	e1/nx+LtCIKtfvG1ukjaHpyaoOjTTBgbQ1qa4BG50EazjjgjovjAX15pb8+hGWqWFIf+
	sKcw==
X-Gm-Message-State: APjAAAXzGJZAzirXOuyZzLX42uiCNkZ3bR+dFfILbUOYF2nSX2SvRwvL
	/x2FmFL5sEiej/XXUJBfqJIpk/hPaEA=
X-Google-Smtp-Source: APXvYqwB3ptuG0AP88J0wWlw+HectrKFNWUFcg/+ZSN6RwdDfYQwS8SWLGCoMTPg88KutxcjUiyIQA==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr11862121wrp.236.1578586911198;
	Thu, 09 Jan 2020 08:21:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d14sm8655010wru.9.2020.01.09.08.21.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 08:21:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 16:21:41 +0000
Message-Id: <20200109162141.20579-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109162141.20579-1-ross.burton@intel.com>
References: <20200109162141.20579-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] opencv: abort configure if we need to download
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
X-List-Received-Date: Thu, 09 Jan 2020 16:21:51 -0000
Content-Transfer-Encoding: 8bit

OpenCV's habit of downloading files during do_configure is bad form
(as it becomes impossible to do offline builds), so add an option to
error out if a download would be needed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 03e4f58dca..f679ccb05f 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
+           file://download.patch \
            "
 PV = "4.1.0"
 
@@ -87,6 +88,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
+    -DOPENCV_ALLOW_DOWNLOADS=OFF \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.20.1


