Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 89BFA6B321
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:53 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so218402eaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0GiSzItNllpBgq92Dw9LbaVeueDMZtojmy5PIgjcttw=;
	b=ZCh7ClXRkJ8kyOMU1Y4TSlZx3JTikaTn1cik3J7Pgx9j4AIMlBikkn4ofP2FzNsBQv
	Yi5j3cixNUjdvnqt/rFi9DNxjIAtZt7OCc+Qd0I1GrJPPrnXjXrULDtkbUzVvXrp4z9h
	UR3Y0mKnmPnqf23bCMmJrNd57KPgk47ckk9Tsf9GRmNyMndZTqYx88rF7/u+7FrtEkKL
	hIJy4/MUsGTFen70xjhha0h5Mh+E91k9GCFtr7fLVdQklnj6/CWE1OXJLK1VBPr8vD0M
	kQ9nMkJh+k1e+Qkw/KNBZxYslJ+5V/P9TumukXB22ZHRyuDRPIoClw3u6ggPXgDvSqFY
	E7GA==
X-Received: by 10.14.205.72 with SMTP id i48mr37580514eeo.139.1374669654012;
	Wed, 24 Jul 2013 05:40:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm65924048eew.1.2013.07.24.05.40.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:40:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:45 +0200
Message-Id: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/29] rrdtool: add PACKAGECONFIG for dbi
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:54 -0000

* dbi was autodetected from sysroot causing undeterministic builds and failures
  in lmsensors builds:
  ld: warning: libdbi.so.1, needed by sysroots/qemux86/usr/lib/librrd.so,
  not found (try using -rpath or -rpath-link)
  sysroots/qemux86/usr/lib/librrd.so: undefined reference to `dbi_result_get_string_idx'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
index b92fe2f..dc43163 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
@@ -19,6 +19,9 @@ inherit autotools gettext
 
 EXTRA_AUTORECONF = "-I m4"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dbi] = "--enable-libdbi,--disable-libdbi,libdbi"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-local-libpng \
-- 
1.8.3.2


