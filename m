Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id F12717F37C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:19:36 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id t17so6101461wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dcQUWyH05LarY9SkuVNZSahoQSEX9VBBCbiXIS6wCK8=;
	b=dpxpugsnyShZe8+qh3r2C6HmelMukVKb68BGI5ADZ2vgu38oemHND6djlnvbb18Ibb
	NOWa7g0IbaXzjT6RLDEYV+kZputAVXxINuOVo58W31r8Otag1XBG+Awy94PKXNCe6roa
	gfdHICnqy/zsVu/32noupLvN+08RzhIf0nJAvhMn2+1zeePmU/hD+4gibz+D8qPfIltE
	0KXi8zMngyzmzq0e02JMWlDVGG5gjv4egJ46Md9rD5XFUWh+D9WcuiEm0E5rC/JRNE4U
	H0egYDWvW5bgKpr8FYQLG+4X7/GLHvwvLbNPnx9w14I3dxKrXVn6NsWQeD8B+NrsyP3k
	La1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dcQUWyH05LarY9SkuVNZSahoQSEX9VBBCbiXIS6wCK8=;
	b=N0KRMZQdFeRz2Hp8iymiVEBXSQzNN+OdFx0gy390UBPFBgx1AlAuF8ldryuGA5pGVl
	yhhsc15ZRZ/pXQ+yNA4fSx5zmydGCnNNm55MkkJ+y9RH6W5F6NcSn815hsXjg58VXb4S
	Zt05DCcK/oaIu76Qxvz8m0TpGIyuTgbVmhAOODmtwMnm9MQdmaLJDMYIHqOEL1Ero+/O
	dhgA5iqyhUtmSpjd1an+RyrYqMQYLmFYcoAFgC64IPhglZFYYzOHDrTK6LtsAqfpZUyD
	g2fuTxB5bRHu/qQNFTBVzT27N9xoO5pQqRLgzV1oDYTvhiHx4nu7fnF5TTg43nlzfuHI
	I7cQ==
X-Gm-Message-State: APjAAAWMna7QyLpWt+56yFSHF8pw25Z+VOtvAg/q1W2c03Vg/NFPWHFe
	VnxID5S5zv2obSlTO3BFLgI9w3wL
X-Google-Smtp-Source: APXvYqz3IcgDdAJqT3yYSMAaRb25kOmVoxbO6LvU8eTMhmoVwdUh32fBttf6YJy+GHmIdSZ38qwVSQ==
X-Received: by 2002:a1c:5f0b:: with SMTP id t11mr6798135wmb.76.1567768777379; 
	Fri, 06 Sep 2019 04:19:37 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:7c5d:97d6:64f2:9ca6])
	by smtp.gmail.com with ESMTPSA id k9sm10148223wrd.7.2019.09.06.04.19.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 04:19:36 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:19:02 +0200
Message-Id: <20190906111903.16142-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 1/2] grpc: don't use unexisting gettid function on glibc 2.29, it has been implemented only in 2.30 https://sourceware.org/git/?p=glibc.git; a=commit; h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92 Signed-off-by: Francesco Mocci <francesco.mocci@abinsula.com> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
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
X-List-Received-Date: Fri, 06 Sep 2019 11:19:37 -0000

---
 .../grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
index c6afff2d2..4f9b115ec 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
@@ -20,7 +20,7 @@ index 561276f0c2..25a74864a1 100644
  #include <time.h>
  #include <unistd.h>
  
-+#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 29)
++#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 30)
 +#include <unistd.h>
 +#else
  static long gettid(void) { return syscall(__NR_gettid); }
@@ -38,7 +38,7 @@ index 08116b3ab5..d3d3025111 100644
  
 -#ifndef NDEBUG
 +#if !defined(DEBUG)
-+#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 29)
++#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 30)
 +#include <unistd.h>
 +#else
  static long gettid(void) { return syscall(__NR_gettid); }
-- 
2.17.1


