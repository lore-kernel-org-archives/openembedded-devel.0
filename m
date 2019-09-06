Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F62A7F3B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 12:36:32 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id l16so6363692wrv.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ce8CbsXB5WEKLLEGw7/bnLVgADcKBvbt8bi+O5CY7XY=;
	b=UNROmlGyBFRx3jaCyeIlWDeOzp70x91j7jVQL6z+0fun8rFjtE/QEPs/UTj3dJ1gOM
	5Jz2I+ZNPyxBzdrZyP91EaIBts7UgNebFvPJxR1cBKGXWnBeKete3LRcwYraW8B4x+Vg
	SWDEwlXz7XbinGU4c1O63lr3W4tA/L34+xK4hWDA/4JksA130+z1buU4XGg8W/8KHrwE
	Co9NmapmmAiY38Fgv5hQ0uMVg//DQ6ZEyuKTVc6gLonjrorJoYFhAmAwJfSO/aPNbIrC
	aiBAN+YqGIfzan/rh7Yv+h/iDRMigJrGBlIVFjm4HkBoC1nC9OFxJBDxvKBNoBOH3uGE
	IWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ce8CbsXB5WEKLLEGw7/bnLVgADcKBvbt8bi+O5CY7XY=;
	b=XvXo5NaprHIpmiUfx3nWuKczWCxwO45VCG0cgfJWiHxk6y+T/UYGhiH7Evi+oYc+No
	4MvUuZEfH7ZbN0e9W5e+1b+kUXOz66EYsLXB25cUxWoFg2qwoUlJUjZUrIJP3k2W8SqA
	Jd2OLfDuL1Up6Jl7iuLTXit5L7bRZNdTxDvTAMWAz4dYZtixjcYMGNhVdxCgohWe/EWL
	xwOQYKTo2VqmMb7xi1Kq5sT9Z0uQd3mYOwFGoeHG6Vg4EGscVVF4KyN8qL6J6h0uE8x6
	3c1e0YzlDHPlOqf/VgLSrFa6XqxMTpQA2RcVUulYwrtz/NPQHsTKThTTYgxrIrl5adXZ
	knRQ==
X-Gm-Message-State: APjAAAWSiozqSHducnhrWUNMT2NP2dgrVVOOOI4t+zHueFnK4TU/SZIF
	juCInqeSjaP+2ySvfj1Iy1HmxYTd
X-Google-Smtp-Source: APXvYqxO26SUwQcnPnDADxk3s2ZIEU9sJ18EokSXeNLEjp/vnMM2AkwZRSeFBlRjuC7w6VxIwzVTVQ==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr7431066wrl.81.1567773392894; 
	Fri, 06 Sep 2019 05:36:32 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:7c5d:97d6:64f2:9ca6])
	by smtp.gmail.com with ESMTPSA id k6sm9958213wrg.0.2019.09.06.05.36.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 05:36:31 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 14:36:26 +0200
Message-Id: <20190906123627.17290-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Francesco Mocci <francesco.mocci@abinsula.com>
Subject: [meta-oe][PATCH 1/2] grpc: don't use unexisting gettid function on glibc 2.29, it has been implemented only in 2.30
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
X-List-Received-Date: Fri, 06 Sep 2019 12:36:32 -0000

https://sourceware.org/git/?p=glibc.git;a=commit;h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92
Signed-off-by: Francesco Mocci <francesco.mocci@abinsula.com>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
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


