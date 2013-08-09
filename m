Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id C01116B5E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:54:00 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so2042613eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6XORp5QEhLQcJ4LjsYoDrWCdxgFzzYEouO95etXvz10=;
	b=PoiyUsTVQ+RafeIkrWfawPXQgLkiM3NEemwbPg8SEnzD2Gtqt2j26llkjS7UDC1Yse
	cVO5Bn+brkfZbWDmyC+hhxVrgwXnHDt8i8qaIUdNjlE4Ln83ZkYAX3Rareo0k6orYlMh
	ad/Fd5vHU7KU65LhP+VBPALkkr4NlcB8slwTXnlJr78nntA2ae7NulySkWmr8H0yBg0e
	CzXaKmcn1PNVVBS6a+xxdHpSELFNX1l7YCZSreocTJTSVAMGmMlAx15KwQRoQKKQTgWi
	vf+NMoxY+2vI87pf2W13Ki1Us/yFoxwCpWzsevoS2axuO9hs4XJ2K8HBNRYvwRUulKRY
	x/ZQ==
X-Received: by 10.15.111.136 with SMTP id cj8mr12090223eeb.91.1376038441232;
	Fri, 09 Aug 2013 01:54:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm26780454eel.12.2013.08.09.01.54.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:54:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:30 +0200
Message-Id: <1376038471-32202-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/12] webkit-efl: add dependency on gstreamer
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
X-List-Received-Date: Fri, 09 Aug 2013 08:54:01 -0000

* fails without it:
  | -- checking for module 'gstreamer-0.10'
  | --   package 'gstreamer-0.10' not found
  | -- checking for module 'gstreamer-base-0.10'
  | --   package 'gstreamer-base-0.10' not found
  | -- checking for module 'gstreamer-app-0.10'
  | --   package 'gstreamer-app-0.10' not found
  | -- checking for module 'gstreamer-audio-0.10'
  | --   package 'gstreamer-audio-0.10' not found
  | -- checking for module 'gstreamer-fft-0.10'
  | --   package 'gstreamer-fft-0.10' not found
  | -- checking for module 'gstreamer-interfaces-0.10'
  | --   package 'gstreamer-interfaces-0.10' not found
  | -- checking for module 'gstreamer-pbutils-0.10'
  | --   package 'gstreamer-pbutils-0.10' not found
  | -- checking for module 'gstreamer-video-0.10'
  | --   package 'gstreamer-video-0.10' not found
  | CMake Error at cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake:108 (message):
  |   Could NOT find GStreamer (missing: GSTREAMER_INCLUDE_DIRS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index cf6fba7..2a047b8 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8ba
 
 DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
            libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
-           libxml2 pango eina ecore evas edje edbus"
+           libxml2 pango eina ecore evas edje edbus gstreamer"
 
 # 120145 and 122103 introduces dependency on libsoup-2.39.3 and glib-networking-2.33.2
 SRCREV = "120144"
-- 
1.8.3.2


