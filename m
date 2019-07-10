Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 431F17EF3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 10:46:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p17so1894242wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W01Djw16jklmKDBKa00NdgW53BNL284sBNNYAzku5Yc=;
	b=q1W8Kud9e7e5K+RtL2ecCWEWlWiwLb9o+tlyDdccAH3V/PsrJXKUeN/aJxCQPC8mxK
	F0vJJi1uM6GR99Nzdwe5YxVsuIuEGuZJYCNYiqw/noYgvWKfGV69nF6nXpXWsZYv6ywt
	t9LaCHZuuwOBVDVbUlpTvy3TsAF1yBausLc+fzThGyRKmC9FlCJse8an4Eanxyx9Xime
	87136q2ib1FxTN2WM3XFnjMYcVqv6LdWI7k1I4IBcBVpXIhylG92SJJ48SsYXBSGIlNs
	3Jq8L5AguFhc1WteT97JSpdgXGTm2XemmRXsyLtIvm8qBlwKiX/8E7s+67yZ3CMpCpq1
	w5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W01Djw16jklmKDBKa00NdgW53BNL284sBNNYAzku5Yc=;
	b=CuCwImzipCDyLcXYLhkQt4PVHgz8Ho+P4kG7zPbQCK8C9QU3nOf35TXybN6bnKM4Wd
	dZJYlaPr6IF1HlZmfR6TXWCgCQRqkWAcN9qq3BCdfGdFREweLl2OXlBuCaRHkbdRSX/F
	Uwo2IpCIbeXcHLkNQcIETCCQTjzKVMUqhhubAYTCXFG7WKiuxN1YrVImtedAcnZd/JEv
	9HyBiR+SpxyOVEAJaaIcH93prCTbn4ckmal1YCkooJL6c/2ClxVvPD3aYN+b5JjCvXLz
	Dghc8riXHVVIe+BgZMkcqmel6mnJqoKm1pc9CkUE8CvjNBOzrWm8RycMWA7g+BZrkAfv
	T10g==
X-Gm-Message-State: APjAAAVY8i1j4W27TWQyaPfYTqq0xf56FkdOsp0F85E+K8CJGh1/7iBJ
	pTNPYFH1l9kmoozQXyach++QOGza
X-Google-Smtp-Source: APXvYqyCz9N2Cv0Z5kyNiOM+xZIEk1xLrQMQMHFCLfiOgyZofEw+soLCZUDUQsPHK941OK6xzZ9uWQ==
X-Received: by 2002:adf:fc52:: with SMTP id e18mr29571985wrs.14.1562755616749; 
	Wed, 10 Jul 2019 03:46:56 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 32sm1205033wrh.76.2019.07.10.03.46.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Jul 2019 03:46:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:46:54 +0000
Message-Id: <20190710104655.2229-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710104655.2229-1-Martin.Jansa@gmail.com>
References: <20190710104655.2229-1-Martin.Jansa@gmail.com>
Subject: [warrior][PATCH 4/5] oprofile: drop virtual/kernel dependency and switch back to TUNE_PKGARCH
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
X-List-Received-Date: Wed, 10 Jul 2019 10:46:56 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* the kernel dependency was added couple years ago with:
  https://git.openembedded.org/openembedded-core/commit/?id=16bc366877a2e02d96adb91b90e30710777e6f09
  the reasons for it no longer seem valid as it build ok
  without the dependency

* there as some differences in the resulting binaries (built with and without
  kernel dependency):
docker-shr qemux86-64@ ~/build/oe-core $ diff -rq tmp-glibc/work/*/oprofile/*/image
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/ocount and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/ocount differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opannotate and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opannotate differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/oparchive and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/oparchive differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/operf and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/operf differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opgprof and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opgprof differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/ophelp and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/ophelp differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opimport and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opimport differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opreport and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opreport differ

* comparing the first one with diffoscope shows only 2 insignificant changes:

  -  GNU                  0x00000014    NT_GNU_BUILD_ID (unique build ID bitstring)         Build ID: 71d68718f2b1393cce55605691453ca0615a985d
  +  GNU                  0x00000014    NT_GNU_BUILD_ID (unique build ID bitstring)         Build ID: 3b6d2e8b3ce02b99a41e594fafb756e5648edd3c

  -  0x0041ab00 31203230 31390032 323a3334 3a333100 1 2019.22:34:31.
  +  0x0041ab00 31203230 31390032 323a3239 3a303600 1 2019.22:29:06.

* similarly for other binaries

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index 8d706e4a50..4e5b6ca33c 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
@@ -1,11 +1,7 @@
 require oprofile.inc
 
-DEPENDS += "virtual/kernel"
 DEPENDS_append_powerpc64 = " libpfm4"
 
-# Depends on MACHINE_ARCH kernel
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 SRC_URI[md5sum] = "bd998df5521ebedae31e71cd3fb6200b"
 SRC_URI[sha256sum] = "95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6"
 
-- 
2.17.1


