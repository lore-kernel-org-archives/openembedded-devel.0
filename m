Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA4A56BE46
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:51 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so339603eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mcV+Sbc6W2kgWLWGK68MJl/uBHaQ5rT69DTFnvfK16I=;
	b=F7ffV3acxqyBQQMIVZpxStHbkafNZPMuSNP9HwcuZDPrLcn1hgnF7TrvmZXAXY13Q1
	5FIbaJkZEW7i7IvDJC/9p/8pUD/fKPTvkssy/TwY1IVXjjc2rTFUOby/ekmHeQlXX4h/
	IgyVupHmQw3vFo3xW2ygYUFc6H+Tcx88DXEqDS8yquQ6a5eXI5VVmYikGEvxhELETUZz
	+9U7mKqvxkSmt5tKNtX0LoegyWmo/LN0KgTHRz6jPNJWifmLHb29HqgUuCi7RsXV20mv
	8zdNpLQhXctF8TwOAwLpO8qKVqsDOT4TK4dd92/De9ADbZry7U8wTp7Gvz122QqDwuh6
	jTqw==
X-Received: by 10.14.241.74 with SMTP id f50mr5429542eer.29.1377791512133;
	Thu, 29 Aug 2013 08:51:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm47188442eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:40 +0200
Message-Id: <e1db3c20d3dc39d2c91f9aea1ba27dfb89b02f7a.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 47/66] gimp: Add PACKAGECONFIG for bzip2, libxpm, libjasper and gudev
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
index e9bbdcf..38b6f48 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
@@ -12,6 +12,12 @@ SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b542138820ca3a41cbd63fc331907955"
 SRC_URI[sha256sum] = "0cd1a7e67e132ead810e16e31ff929394c83fcf841e4a295c45d6f3829601ad9"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[libxpm] = "--with-libxpm,--without-libxpm,libxpm"
+PACKAGECONFIG[libjasper] = "--with-libjasper,--without-libjasper,jasper"
+PACKAGECONFIG[gudev] = "--with-gudev,--without-gudev,udev"
+
 EXTRA_OECONF = "--disable-python \
                 --without-wmf"
 
-- 
1.8.3.2


