Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id E97D06B4BB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:22 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so1260236ead.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cSzwwm0N+s5W57SjVc7M38tgMGk1bWVrGu6I3RpMIU8=;
	b=BK9dcwPEJJn9isOkY7ZhfUXlfXPbRJvVFbqmidKTduDPwbSpgGB3QJvh2KilNrWnQN
	Lvz9v50bg1nsl4Po0rv7glzeXR1Ksbukob7WPOb8Sm2gA7CbJXhzIyP9vl8fUV5/axFR
	JnYieXCY6i09kZbu8q9Fp8lh6246ncz/4rycAY03F9csimPzAigosSnKFwOhaNiE7wOK
	2X3jEBeN41Lzrc2mC5wNofBAO5uiaxdtiEr/KactzjljG9NVkqYrypBydAywKAp418Z8
	CKFz9OgTtZkitnpMLfsQKIEFUCTbbFo3/lvt3elbxmJ0U3k/Z6xN5AsYGHoRZzLJ3Rj/
	QvCw==
X-Received: by 10.14.225.72 with SMTP id y48mr14387569eep.131.1375652843034;
	Sun, 04 Aug 2013 14:47:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j2sm28797566eep.6.2013.08.04.14.47.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:42 +0200
Message-Id: <1375652867-10498-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/15] glmark2: add dependency on jpeg
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:23 -0000

* fails without:
  | Checking for header jpeglib.h            : not found
  | The configuration failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
index b5d483c..9edee14 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
-DEPENDS = "libpng12"
+DEPENDS = "libpng12 jpeg"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 
-- 
1.8.3.2


