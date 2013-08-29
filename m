Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8B86BE95
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:12 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so342100eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TPPmR969IIN+P9YqKjnDfYjC+p+v3j+oiB/FqSPiF3E=;
	b=rl6vzP/0KvJh0k9kuzYG3V+hqWGwdDwjbpYTzDf53xI/4dvMtkH+S2ClERHJkwi1sR
	o7+9VynJ6Gea9gUymiL32EyBGBy1zTuNICa8Tt5QOcN5w1jBY2UylF4kuKpAgVA/vAht
	gh3L68Cxn3owB3PgrT1jlF3r0Von7KeMB4cnIgIUQomViorhFOkUtYPRp1rInD8jw2Ep
	w2M5xsV25gxJfHtNqqgfwq5PWuCu2sVdQpoUj4+eAz3LS+df2l5YMqQQ3l7M3TpE0pT6
	z82yWzMssjmX1JEi33wdgNBikkByeNzfuXlVaBipIB42AAHxq2fow6KcG6aomv/8ifik
	vHpQ==
X-Received: by 10.14.225.199 with SMTP id z47mr5439411eep.24.1377791533504;
	Thu, 29 Aug 2013 08:52:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm47175814eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:56 +0200
Message-Id: <ebefbe7b2142f9c2a8d679da8df48a1a894444d4.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 63/66] webkit-efl: Add dependency on gst-plugins-base
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index 2a047b8..a45717e 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8ba
 
 DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
            libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
-           libxml2 pango eina ecore evas edje edbus gstreamer"
+           libxml2 pango eina ecore evas edje edbus gstreamer gst-plugins-base"
 
 # 120145 and 122103 introduces dependency on libsoup-2.39.3 and glib-networking-2.33.2
 SRCREV = "120144"
-- 
1.8.3.2


