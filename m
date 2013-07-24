Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 160A36B371
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:09 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so218736eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VvzDuxnSMzuh4wvT9c4wj5iu3QPhmT1bSjetwcplU7U=;
	b=c3L4FcW4vPUId0HhcbkZZV1O2Az9cjxjfSISlhOiPgNnCup/QWrpWdtbB7XBXLc1Pe
	Wd0Ec9rYMQ1ML4t2bNR3hGncXS08lZQwAg4yjfvM18tXPz+OcnSnaNpPg/7AdMjRE9x9
	Pz9meR4zmr5KjWQHxkvMq6a7uCJbYOZGvq3u5uj1xq6z/DPmvPdy+qG3SxHTd+znu8g7
	3s9nmbJI/JBrDMehPFZT7GRYZuVPFYvG9+yGz76p3jz7zN/brVR6yu8e+98ZMa2ai/5O
	gVjpVfS2D3JAKLtwBN1+QFh0TR4ThFxqDCwxfz8OJ5BhCaYjMvNOFzrxRvzb20UPmK8n
	b7tQ==
X-Received: by 10.15.41.71 with SMTP id r47mr37029994eev.63.1374669670512;
	Wed, 24 Jul 2013 05:41:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm65835480eeb.13.2013.07.24.05.41.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:56 +0200
Message-Id: <1d44e5aa148eab4a31b646ce74ea61f0a15744a7.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/29] links: add PACKAGECONFIG for bzip2, lzma
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:10 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/links/links.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index e77e2c4..78d7ec7 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -10,4 +10,8 @@ SRC_URI = "http://links.twibright.com/download/links-${PV}.tar.bz2 \
            file://ac-prog-cxx.patch \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,lzma"
+
 inherit autotools
-- 
1.8.3.2


