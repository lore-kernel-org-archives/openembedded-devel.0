Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4B00F7F23C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 10:41:55 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y19so6064118wrd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 03:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dcQUWyH05LarY9SkuVNZSahoQSEX9VBBCbiXIS6wCK8=;
	b=ah8TVVqk4RPp/YxkMtjk7P7j7FgzhRy4qtkCKtfpIaA4uxUwm0phIYmlpnUK93pb33
	vfnx/1oIqtLLzGpJKNkswFWI4R4/SkKj/mnKJPX0kHHf7mlcKQzyMgp5xHmFf43pP9lr
	GwiWY4AgZZtd/bqtpIpiaqBXVnqfyuikogh3PgXK4aUNbApLfe/qMx//EPtUBEG9SHLr
	t3rbuf5SSBo7P8joLrQ1MhK5tFf5v263CxFx86PRmH4t352MpDalh0f7yXK5t2Y6rLoa
	8PX1JHjRbt2sChnNzezozdR1vYwKHi4qEOAAN1Ls0POqDtlBUW492zzHscellm5JxuRW
	n01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dcQUWyH05LarY9SkuVNZSahoQSEX9VBBCbiXIS6wCK8=;
	b=RiyP5udvMSbMPb31yxI80Qo8ZDDT4UD+NTlNkMPc9slucU0WKb7qO00Ly76p5D6eYe
	Vh/7Jz60ahLOhOykdXSc1uTjnhZ7yj4RQsJURx+668YOz1QaygdLEl2GKK4P9JFf3+tK
	3OEUDfQxe2WEJGq3CP9zAkgnCszskHex0BXy28rDg/vwm3vr5mkF9PS6puoqIXLWFvhX
	sMBERNcoZ1otQJS3W5Zelx7xao9MoxqV1OIKua1TC+YAoVSa5ZtX7nP+sfCFM0P4S0k5
	eX5fgkgsLdYlbBpx5hGaeM/t8IvYnP7veADPzY0dZ/IyxahGdczQJjQV8xXzWomwct4m
	+nGA==
X-Gm-Message-State: APjAAAV17a4rQco3asbNfaLH6+OWFUyUe7WdY4XxlaS13Gzqg/J24K0g
	yuhcjKZTiF46/k0SrIDV0VZpSMj0
X-Google-Smtp-Source: APXvYqz6lelCDN4gA+mi2G84B3BVlatMhLiLgiT9J6ROn9x4+2bedGQ1aWfQXssEiXq71lHvaJVs8w==
X-Received: by 2002:a5d:4146:: with SMTP id c6mr6428210wrq.205.1567766515423; 
	Fri, 06 Sep 2019 03:41:55 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:7c5d:97d6:64f2:9ca6])
	by smtp.gmail.com with ESMTPSA id
	j22sm10007430wre.45.2019.09.06.03.41.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 03:41:54 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 12:41:51 +0200
Message-Id: <20190906104151.12922-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] grpc: don't use unexisting gettid function on glibc 2.29, it has been implemented only in 2.30 https://sourceware.org/git/?p=glibc.git; a=commit; h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92 Signed-off-by: Francesco Mocci <francesco.mocci@abinsula.com> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
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
X-List-Received-Date: Fri, 06 Sep 2019 10:41:55 -0000

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


