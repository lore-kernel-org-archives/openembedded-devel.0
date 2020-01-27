Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9EB7F971
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:23:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so12371651wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SrNWU5fKMFPuZTR8Kni9v77c5uCno5bMl6lqeukp+qc=;
	b=tkTh9HULKksg2IHdaATBK2hXuQ8qVlPk0MjIREzCTRHCkfVRpcDwaCaMw5+Cnfkw+P
	52zHXq3VmXeD3dTZisNCmCPTdmOJ+gm8z8K8y3xWcRX7NNVgjC96CkNVeH8C1UWQAbIF
	eHNOeQZBEKXUbbgcrOiIQLozRj/A/nnG3s6ZPdYfpPGaJmHTazTTm/TDm2rMvdm93FSM
	z1Hh4lY1+abRTgDhumchDW9/nwb7L/74cY3WH+QMuP7PC0omZ25a++eRtKCDCBR49JDt
	GgcpzmVuamuQD89VV1d33xH64lixMhaBPid/l+LXdC5ElwcZ0+O3jLSQSaGyq+ytX/je
	JgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SrNWU5fKMFPuZTR8Kni9v77c5uCno5bMl6lqeukp+qc=;
	b=SuCt77lnlOtOITYwB7sMpvtwZ9jky9xjaHex7TaA1Z/HKOEcdTkfop18gSSHPvH2Gn
	6DD+eymOi1RnezqehRl9vjR2Vnjv3pXQ2rVBvXA5IYNM63IaG12PBkGAuknWceVWMA2d
	58NJjBBtd5MM/wavLZpS12Yzq+k9JUk1R6NFI/66EpdObHGB9hJRdtuZ3FYM1lXPH+dR
	AQS7m+m7eFRsL0dHEOnY69A9NpAru4yJxv+I777lyMsiKQqA2F/dXjCZ1SpwQFxQtywP
	QhD0DBb9dS3B4wwlu3F3nW0r03w8vDUoh5KKolYdPivQUqRz9w2UZ/ckUiNO7vIh4IE2
	mGSw==
X-Gm-Message-State: APjAAAW9Ibr5IGtzbZN10HnY5sOtWEEBSuwJ2qZREA1xzG7n8mYb4IuZ
	mvcLMRxU1cbytoRL57/9/ouvogO7Q3SFTb7GxtU=
X-Google-Smtp-Source: APXvYqy6T+XAdDNaek8GB+XBLBzKZ8Ggffc1l4ccE7YT1Mxwyq1lEWJjOS5fvEtBFhJHu1NdD9OjGlhZm31t9+8im1Y=
X-Received: by 2002:adf:f308:: with SMTP id i8mr22991086wro.42.1580145833626; 
	Mon, 27 Jan 2020 09:23:53 -0800 (PST)
MIME-Version: 1.0
References: <1572534894-51167-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572534894-51167-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 18:23:42 +0100
Message-ID: <CAHtQpK6pqYO5WHh6Lmj61gs1zW32bWVYu5hW0uqDqy2V4PJKnA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libhugetlbfs: upgrade 2.21 -> 2.22
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
X-List-Received-Date: Mon, 27 Jan 2020 17:23:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Raj,

Can you pick this one?

It should solve one of the build issues you've posted in
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors

On Thu, Oct 31, 2019 at 8:20 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> 1) Upgrade libhugetlbfs from 2.21 to 2.22.
>
> 2) Update two patches for new version.
>    0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
>    0005-Include-dirent.h-for-ino_t.patch
>
> 3) Add RDEPEND python3-core for libhugetlbfs-tests to fix the do_package_qa error as follows:
>
> ERROR: libhugetlbfs-1_2.22-r0 do_package_qa: QA Issue: /usr/lib/libhugetlbfs/tests/run_tests.py contained in package libhugetlbfs-tests requires /usr/bin/python3, but no providers found in RDEPENDS_libhugetlbfs-tests? [file-rdeps]
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch | 13 +++++++++----
>  .../files/0005-Include-dirent.h-for-ino_t.patch             |  9 +++++++--
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb  |  6 +++---
>  3 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
> index 53f35ab..34a6220 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
> @@ -10,15 +10,17 @@ Upstream-Status: Submitted
>
>  Signed-off-by: Ting Liu <b28495@freescale.com>
>
> +Update for 2.22.
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>  ---
>   tests/run_tests.py | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
>  diff --git a/tests/run_tests.py b/tests/run_tests.py
> -index 3c95a03..560df6b 100755
> +index 018264d..0aabcd1 100755
>  --- a/tests/run_tests.py
>  +++ b/tests/run_tests.py
> -@@ -234,9 +234,19 @@ def get_pagesizes():
> +@@ -245,9 +245,19 @@ def get_pagesizes():
>       Use libhugetlbfs' hugeadm utility to get a list of page sizes that have
>       active mount points and at least one huge page allocated to the pool.
>       """
> @@ -36,6 +38,9 @@ index 3c95a03..560df6b 100755
>  +        return sizes
>  +    out = p.stdout.read().strip()
>  +
> -     if rc != 0 or out == "": return sizes
> +     if rc != 0 or out == "":
> +         return sizes
>
> -     for size in out.split("\n"): sizes.add(int(size))
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
> index 0817420..e736cbc 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
> @@ -8,12 +8,14 @@ error: unknown type name 'ino_t'; did you mean 'int'?
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> +Update for 2.22.
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>  ---
>   tests/hugetests.h | 1 +
>   1 file changed, 1 insertion(+)
>
>  diff --git a/tests/hugetests.h b/tests/hugetests.h
> -index 8b1d8d9..056042c 100644
> +index bc4e16a..fbe4dc0 100644
>  --- a/tests/hugetests.h
>  +++ b/tests/hugetests.h
>  @@ -22,6 +22,7 @@
> @@ -21,6 +23,9 @@ index 8b1d8d9..056042c 100644
>   #include <errno.h>
>   #include <string.h>
>  +#include <dirent.h>
> + #include <unistd.h>
>
>   #include "libhugetlbfs_privutils.h"
> - #include "libhugetlbfs_testprobes.h"
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 66fd8e2..f258122 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>  DEPENDS = "sysfsutils"
>  RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
> -RDEPENDS_${PN}-tests += "bash"
> +RDEPENDS_${PN}-tests += "bash python3-core"
>
> -PV = "2.21"
> +PV = "2.22"
>  PE = "1"
>
> -SRCREV = "73d06e69108f231696e9c5c44f4b42690fc5d752"
> +SRCREV = "e6499ff92b4a7dcffbd131d1f5d24933e48c3f20"
>  SRC_URI = " \
>      git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
>      file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Regards,
Andrey.

