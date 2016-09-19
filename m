Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1DF73181
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:25:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so15315942wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a08E1+dB77w0ZTbS3Ya0JvYDAHW5f8V6nIb+vWNqg8w=;
	b=lWEQm/e8M0HZ3/55fgxm66YEYP+nemW9VrNPlHpVcapB8RQFQqqXAe2QQ/59BEaxat
	z0CNfn2fwqDmHiLqqKmTbo+UR5kcB4AlQ6QXAFIclq4gdnuBBv3LeTAyFmakd+rWfKYM
	QW8VR1YNIv2YPS2zeiKvBIrfl7hRMTtDoRkQ9c7q2v4DIuc55zC5zOGkyiuA+50lfQt8
	uZ6TtojBoxh3HjifKYRCWAlJZxZ+UQoy75T7OXOec4TxXMlE1XGKNfRmEVv5z3XMeKuf
	8SHLkZ8Gtd8pcGaazupMEIdg1bsbsZdRWV7HdG71X3Mxm9JNXwYBxXIX/8nnsEiCn7Hm
	m3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a08E1+dB77w0ZTbS3Ya0JvYDAHW5f8V6nIb+vWNqg8w=;
	b=LK1wYk3Xl7AAw6rpCaJgN/2O1FpaFoIHxqjxmqKkS6ki7WLIBnRnpjuIHriTZYmhgp
	Z6lX5FkDIyAFrng6Se1UUHM+Y85QrlzrhMy9yCsMff+Ms9wFDle9gRF4FYqiTcZKI2Yz
	10xycjXyLCL3iWkB3sKnJmW5WNL+209Gvet6IkgcoGv0BVcwg87JCG6DCXonJGWjj7pN
	Eb4d8S28OBxCuIehwOENZevy6MCfCStRr15wYG8FEqM0qyvrXlxofsjXkX6BzZ3J4uKi
	lmX1qha3wTqffjTnpkWAY8x5cvDTlDrmqhYI4cm/IIW0CwJynmt/zCNw7cj8W1fx74ah
	eMjg==
X-Gm-Message-State: AE9vXwO8McVw6FuF2/7BKL1aEx7bZtwMMj+shWHtA6rPG+QfZgHMF5Pu0qjx6PBBmjWc9Q==
X-Received: by 10.28.230.147 with SMTP id e19mr2478651wmi.107.1474295153331;
	Mon, 19 Sep 2016 07:25:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w207sm22382829wmd.8.2016.09.19.07.25.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 07:25:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:25:45 +0200
Message-Id: <20160919142547.11541-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160919142547.11541-1-Martin.Jansa@gmail.com>
References: <20160919142547.11541-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] libgit2: add dependency on libssh2
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
X-List-Received-Date: Mon, 19 Sep 2016 14:25:55 -0000

* autodetected as reported in bitbake world status e-mails:
  libgit2-0.24.1: libgit2 rdepends on libssh2, but it isn't a build dependency, missing libssh2 in DEPENDS or PACKAGECONFIG? [build-deps]
* log.do_package:
  DEBUG: libgit2: Dependency libssh2.so.1 requires package libssh2 (used by files: /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/libgit2/0.24.1-r0/packages-split/libgit2/usr/lib/libgit2.so.0.24.0)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
index dbcbb7a..092a674 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=34197a479f637beb9e09e56893f48bc2"
 
-DEPENDS = "curl openssl zlib"
+DEPENDS = "curl openssl zlib libssh2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.24"
 SRCREV = "211e117a0590583a720c53172406f34186c543bd"
-- 
2.10.0


