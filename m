Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDB070BED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:30:45 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so5694408wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kqw9XLxwoYwk9aCbwlyer7iR4dDl9DWX/viIbp5f/jE=;
	b=0Yt/NOhWru/gRgwN9GkfxvdTNR5d/UvnLNoEcl52HsSPyhQOAXnS0RBEw4xdaPqafh
	1ovLj1DSr1GGwyUNk/8S9B0pT44dJ4HUOsjbPbTFsGqz+YCc6phNR1HPX4hPGO5v50nG
	oEiqKCch1DV4GSKIHT5TLNfy6jk9OqYwM6riHaJFKHv+4/aRjcwdLnHbyfV8eBR4S1sQ
	szYXH2C35GCv/mokkjFQZ67Zi6GNvZ6a1M+MpSEdPXGw2kuCWzQGBW/XlX0aCM3v3w2c
	ovSrMKnfQfHZih7OYsyrgnlzapouvDKrDWSMWgjUi9+iEP8+L+vvYLe0Bxf0NGDEOkcE
	FaYg==
X-Received: by 10.180.74.240 with SMTP id x16mr32440597wiv.13.1407846646234;
	Tue, 12 Aug 2014 05:30:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r1sm55742561wia.21.2014.08.12.05.30.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:30:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:31:18 +0200
Message-Id: <08c6c87275ce97d7dd05bb0d10723f614731847a.1407846579.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407846579.git.Martin.Jansa@gmail.com>
References: <cover.1407846579.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846579.git.Martin.Jansa@gmail.com>
References: <cover.1407846579.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [dora][PATCH] 2/2] glmark2: Add virtual/libx11 dependency
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
X-List-Received-Date: Tue, 12 Aug 2014 12:30:48 -0000

* without it, do_configure fails:
  | Checking for 'x11'                       : not found
  | The configuration failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
index 9edee14..fbc402b 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
-DEPENDS = "libpng12 jpeg"
+DEPENDS = "libpng12 jpeg virtual/libx11"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 
-- 
2.0.4


