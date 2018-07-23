Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 914BA60116
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 20:37:04 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id a5-v6so2027786qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZD5rniO8HUAZo+ZrDbRuYg9qo7YWXTSs/EHgUKFz1cE=;
	b=V1oOq1h22/cFmiuvKHadHVrhT2pWc3WbbPrfefL/kvxUMfaypq/8ssT05Zniz8zCwK
	Txq3XBgcmNLbytJoLjGgNWGXsNG41j/tjCVkaWtzk4ibpKZjGg/1qPzWUKgFosCxWJhe
	uUxoHiJwIYLclxq02qw5ZLG9KccKzDd4f8j7JDFXJkAQaM3QkLqQAm8GBbNj6NisO9kT
	X4yR1xsfTYvRtzHzjvBxfbuy6LfEiWbvXw1+7EUQE04RUXnlLCxmr5PGG3y9V9pjIb5B
	q9mryeZNMbF7Ro2i7bYjKKGT4iWXvkk+FgD93pNc3OjcLEts3TKmNEMIGQRl2Nen3yRt
	xs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZD5rniO8HUAZo+ZrDbRuYg9qo7YWXTSs/EHgUKFz1cE=;
	b=P41V4LC9RdPQgcH0R7EKtLoBFlHcIEAky5rllHe2eCM38kkGauzWZvwl/TJWKyLyC5
	UJbv6cve286OdUT6VqCIdK87NbegrfeTaPW+Vc700zdF55wfwHSpc0NLvoMEll/OOKDY
	kg9+CbyOlPqZaC7OaDneeDdkhqrMGrfCQIMKynUn5ueY/AQbsz1t0SV8EJEktQr/QTpV
	Vw9FK0PqKi3IRIebX52v134JKBJ0QUTdZkD2bFYsbBjhZTPhtonAxCFk08LmbydX97vD
	thIFRy1Fn2p/3sJFnw+eMehvvBUu1fkxrIDYDa9vBhOj0TOuUEBCgIFeEp386v9MLLIf
	ycRQ==
X-Gm-Message-State: AOUpUlFoqcjtSdSIOvDb1E73Sl0YChViun6R7xGg/A80zDldQvNsl05T
	nxEppDSyPKsA5bX16SxYOcF1HVRpmZ6xfrzAw+8=
X-Google-Smtp-Source: AAOMgpf6JkFu8Dr0S/wfunUpxAYLO7sH6UtFdEUFUfVPIzzWedd+ea3Ld467Et52Wcf5aE5qkA1rVlg/R3WWyKxSfEo=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr14095610qta.128.1532378225132; 
	Mon, 23 Jul 2018 13:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180723100836.12809-1-hongzhi.song@windriver.com>
	<20180723100836.12809-2-hongzhi.song@windriver.com>
In-Reply-To: <20180723100836.12809-2-hongzhi.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jul 2018 13:36:39 -0700
Message-ID: <CAMKF1soFtQP15oO22yJbb6EjQ_8ZgvuCL12Y2S_U4d1JyifRuQ@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 1/1] kernel-selftest: add support for musllibc and perfect the recipe
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
X-List-Received-Date: Mon, 23 Jul 2018 20:37:04 -0000
Content-Type: text/plain; charset="UTF-8"

please squash it into prior commit and send
a single commit.
On Mon, Jul 23, 2018 at 3:08 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> 1. Add support for musllibc
> 2. Use PACKAGECONFIG to add dependency
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  .../kernel-selftest/kernel-selftest.bb             | 30 ++++++++--------------
>  ...bpf-test_progs.c-add-support-for-musllibc.patch | 25 ++++++++++++++++++
>  2 files changed, 35 insertions(+), 20 deletions(-)
>  create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
>
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 2c23b26b5..71e3bf9b0 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -5,27 +5,17 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \
>  "
>
> -# vm
> -SRC_URI += "file://COPYING \
> -"
> +# for musl libc
>  SRC_URI_libc-musl += "file://userfaultfd.patch \
> +                      file://0001-bpf-test_progs.c-add-support-for-musllibc.patch \
>  "
>
> -# for bpf and vm
> -DEPENDS = " \
> -    elfutils \
> -    libcap \
> -    libcap-ng \
> -    fuse \
> -    util-linux \
> -    rsync-native \
> -"
> -# for vm
> -RDEPENDS_${PN} += "libgcc \
> -                   bash \
> -"
> +PACKAGECONFIG ??= "bpf vm"
> +
> +PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
> +PACKAGECONFIG[vm] = ",,,libgcc bash"
>
> -do_configure[depends] += "virtual/kernel:do_shared_workdir"
> +do_patch[depends] += "virtual/kernel:do_shared_workdir"
>
>  inherit linux-kernel-base kernel-arch
>
> @@ -69,10 +59,10 @@ do_compile() {
>  do_install() {
>      for i in ${TEST_LIST}
>      do
> -        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/opt/kselftest/${i} install
> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/usr/kernel-selftest/${i} install
>      done
>
> -    chown root:root  -R ${D}/opt/kselftest
> +    chown root:root  -R ${D}/usr/kernel-selftest
>  }
>
>  do_configure() {
> @@ -101,4 +91,4 @@ remove_clang_related() {
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  INHIBIT_PACKAGE_DEBUG_SPLIT="1"
> -FILES_${PN} += "/opt/kselftest/"
> +FILES_${PN} += "/usr/kernel-selftest"
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
> new file mode 100644
> index 000000000..5f2542681
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
> @@ -0,0 +1,25 @@
> +From a2e6b8fde28b743b69990a4e16c296e099631ed4 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Mon, 23 Jul 2018 00:56:19 -0700
> +Subject: [PATCH] bpf: test_progs.c add support for musllibc
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + tools/testing/selftests/bpf/test_progs.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
> +index 11ee25c..21b27b7 100644
> +--- a/tools/testing/selftests/bpf/test_progs.c
> ++++ b/tools/testing/selftests/bpf/test_progs.c
> +@@ -4,6 +4,7 @@
> +  * modify it under the terms of version 2 of the GNU General Public
> +  * License as published by the Free Software Foundation.
> +  */
> ++#define __always_inline __inline __attribute__ ((__always_inline__))
> + #include <stdio.h>
> + #include <unistd.h>
> + #include <errno.h>
> +--
> +2.11.0
> +
> --
> 2.11.0
>

