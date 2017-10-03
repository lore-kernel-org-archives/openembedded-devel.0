Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DA18577ACB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 12:21:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q132so16495290wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dxvDMF7/iFY9LC5BvrqFVXqOK9TF4Mv+1UDCl1NhHcY=;
	b=RvpZd4yxUH0StAsIva2tntLufee6zzNwtb89ZncE0+6ogqHjWjLufkAZCX+dHoVHB1
	NC+9BQZOA5xQ+zMFF2IA8a7KCzn95PcDcP5RVldzqmeQjLlUqaxeHYXY8Y3FJVwdQ0X8
	U5PglgtrLa06Vl6FL65VQSCjrbUW2mIsKPp3Jbylv1mzDK0jRIw/PIYtB9ETC+PqLMG8
	PNFbY//eyTbRxfxMrENUWCDDLJBClsce9Hn8V6/Cvgyt3wLEe0ffab7Cw4xwlbQ8OuCj
	yOGt9aeUcDmpD5cNPD7GMh5IdExUS2oJu23SE4r+yGbYyXbin/klKaNYVCbJkQ9bUYa/
	Fhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dxvDMF7/iFY9LC5BvrqFVXqOK9TF4Mv+1UDCl1NhHcY=;
	b=dTieXeXMgRETbdGif94MExLwK5V3+neFkP8XVzNIvz0tUc7lhoe1Bjozvw26MaSm0u
	i1qeG5kh1qGeELzJ5eqNgLJmarAa+XHOKxfe68NDF5bTQ+cMKM1a9UNwaSfnaUWvScFE
	X6rn/oAlPSTZgb9kq0pPRTlRZChHJ2GbnNpauLllWhppDnnKhzHZZbSupH4XHAagX+O7
	lCTcr7fjiJQ3Vc0C4diL8+JrVHDWrrADoKs9wf/23QArMZPrsMlGIf67viSphD9xumox
	mWt71wBppaQUqyK+IaT8fY2sH4vc2/bC3fpZnaCnpNfZZMZC4mlK9zfHpL2oVAO5bAOx
	A/EQ==
X-Gm-Message-State: AMCzsaXwgECzqTplu/Hi+wjo2CAFH3iYWef6g46qLCAGbKQ9t+L32j7P
	4E7gIu8OLwNdFBnixUVkRgIVag==
X-Google-Smtp-Source: AOwi7QCEYdpWI6+LTQCIordtwEtjY7UvLz1Jzh18ed25ym/8jVILeXs+t1lj3j6X/SvstP+Mq8VO8g==
X-Received: by 10.28.62.145 with SMTP id l139mr4322300wma.150.1507033313352;
	Tue, 03 Oct 2017 05:21:53 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d16sm127967wrb.53.2017.10.03.05.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Oct 2017 05:21:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 12:24:40 +0000
Message-Id: <1507033480-26116-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] leveldb: fix parallel build II
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
X-List-Received-Date: Tue, 03 Oct 2017 12:21:53 -0000

* I was still able to reproduce the build failure which was supposed to be
  fixed by this patch.
* added comment suggesting to do the same in:
  https://github.com/google/leveldb/pull/512/commits/6a6541b339b84070f585ffa1a437ef0e2ae22c9c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../leveldb/0001-Makefile-Fix-parallel-build.patch        | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
index 5068654..3135d4d 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
@@ -20,16 +20,15 @@ Upstream-Status: Submitted
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -386,7 +386,7 @@ $(STATIC_OUTDIR)/write_batch_test:db/wri
+diff --git a/Makefile b/Makefile
+index f7cc7d7..51a0bcd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -386,6 +386,7 @@ $(STATIC_OUTDIR)/write_batch_test:db/write_batch_test.cc $(STATIC_LIBOBJECTS) $(
  $(STATIC_OUTDIR)/memenv_test:$(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS)
  	$(XCRUN) $(CXX) $(LDFLAGS) $(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS) -o $@ $(LIBS)
  
--$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
-+$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db $(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
++$(SHARED_OUTDIR)/db/db_bench.o: | $(SHARED_OUTDIR)/db
+ $(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
  	$(XCRUN) $(CXX) $(LDFLAGS) $(CXXFLAGS) $(PLATFORM_SHARED_CFLAGS) $(SHARED_OUTDIR)/db/db_bench.o $(TESTUTIL) $(SHARED_OUTDIR)/$(SHARED_LIB3) -o $@ $(LIBS)
  
- .PHONY: run-shared
-- 
2.7.4


