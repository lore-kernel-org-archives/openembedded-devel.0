Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6A278849;
	Tue, 30 Jan 2018 16:39:24 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y3so2026685wrh.3;
	Tue, 30 Jan 2018 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vaLA6BfDs+BXjF/K1HP8EuJZCQQ5QbyHp8O0st8CU2k=;
	b=LA7cHic04LJu5DtL9YEi3o7b7hW6fsfCegFk5t8ST+Lef43pLae4hUYYqLATCLDdOI
	DJAB7g+K/v3/NtVRZQHjUjS1LDTXJ+ac5N0TtRVVPAPKHxuaATfUHHN5z+LR1QzQnwJS
	hNhkHbcZMBONLMlAnjdvfaqBp96NXFr9fEGwz3ywBmgJCOtwXhZ8e2cChOPb+ZbgX9QR
	R1acZawnld+bibG7Q98ZbWEJedPd5D1ZuUOxyIdgSEboRpUZpgirHKVEIotbQseqKXSD
	G2s7MmWZkJk65keiLoIcf3QVWZ85dCTqNxQu8IqYdK8WWQ4rJeC8GLsR6N9lkAHuvYZ1
	MuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vaLA6BfDs+BXjF/K1HP8EuJZCQQ5QbyHp8O0st8CU2k=;
	b=UTVKJ/DcDxb+32S+CPjo37Dgg+Dh9Esu2ekZgIMNc7d9R2v1/S/7Xz9WFUONTeQibi
	N+6pNmCm81pj5q7C9DBx5rRnLEknQe7K0HTjYPBMtkrpm7tr9kXQkPajH2mwCkrSHmk/
	TSwL7FtRPZEAFC2vnCc5il2kvj6cRMEg96/Q8VEQ5/LUe+tLM1mxHCQSWMYvev0E4to0
	2/ZNqgRV9SrKbx+5yDg8S3LZUrmq980/qyPaahLm/UOzjw5jmEMGHvNuwGb00nWAY5ba
	4bXdnDyrWDNU9Uag6jOMHZyVmcehHq+q0c03KvId73JhL0/Pp7Q8CngU9/sBwoy5E2IX
	B0Sw==
X-Gm-Message-State: AKwxytcwkrn0RtUZkaKS4UiKYvIciHZn4Wqq1biq6VpJA3LW9Aj4fTzz
	5Juu0P6T2Btp7z9GoYBCuezTi6qmUy38VYsZzSrxcw==
X-Google-Smtp-Source: AH8x227XgfQD8i2DRmMPWZZB30Osds6hhg2AvyxulaZTtYUVLvLxNfuZGGu9HXTpz6+9ydh+HReKdLGJMSi/AC1ZZAs=
X-Received: by 10.223.136.167 with SMTP id f36mr10710622wrf.200.1517330365181; 
	Tue, 30 Jan 2018 08:39:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 08:39:24 -0800 (PST)
In-Reply-To: <20180129085034.89DCA2328AF@git.openembedded.org>
References: <151721583389.32622.5504232841603929200@git.openembedded.org>
	<20180129085034.89DCA2328AF@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 17:39:24 +0100
Message-ID: <CA+chaQcw+n2EUijWLajxKn7-XHks8QtqKAvG9dx2mAVamXrNYA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 11/29: gzip: 1.8 -> 1.9
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
X-List-Received-Date: Tue, 30 Jan 2018 16:39:25 -0000
Content-Type: text/plain; charset="UTF-8"

You have forgot to update:
meta/conf/distro/include/tcmode-default.inc:PREFERRED_VERSION_gzip-native
?= "1.8"

now all the builds show:
NOTE: preferred version 1.8 of gzip-native not available (for item
gzip-native)
NOTE: versions of gzip-native available: 1.9

It might be better to just drop this as nobody is probably going to use
older gzip-native than 1.4 when there is only 1.9 available in oe-core.


On Mon, Jan 29, 2018 at 9:50 AM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit db59381121d564a1ba5d199a8099d120620f0527
> Author: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> AuthorDate: Thu Jan 25 16:13:37 2018 +0800
>
>     gzip: 1.8 -> 1.9
>
>     1.Upgrade gzip from 1.8 to 1.9.
>     2.Delete 0001-gzip-port-zdiff-zless-to-Busybox.patch, since it is
> integrated upstream.
>     3.Modify wrong-path-fix.patch, since it is changed upstream.
>
>     Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../0001-gzip-port-zdiff-zless-to-Busybox.patch    | 59
> ----------------------
>  .../{gzip-1.8 => gzip-1.9}/wrong-path-fix.patch    | 23 ++++++---
>  .../gzip/{gzip_1.8.bb => gzip_1.9.bb}              |  5 +-
>  3 files changed, 17 insertions(+), 70 deletions(-)
>
> diff --git a/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch
> b/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-
> zless-to-Busybox.patch
> deleted file mode 100644
> index 20d5a19..0000000
> --- a/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-
> zless-to-Busybox.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 5f712621829ed81a758077431226a86df37fbc3b Mon Sep 17 00:00:00 2001
> -From: Denys Zagorui <denys.zagorui@globallogic.com>
> -Date: Thu, 8 Jun 2017 16:05:50 +0300
> -Subject: [PATCH] gzip: port zdiff, zless to Busybox
> -
> -Problem reported by Denys Zagorui (Bug#26088).
> -* tests/zdiff: Check that diff uses POSIX-format output.
> -* zless.in (less_version): Don't exit merely because 'less -V'
> -fails; instead, assume 'less' is compatible with an old version of
> -the original 'less'.  Busybox 'less -V' fails, but apparently its
> -'less' works anyway somehow.
> -
> -Signed-off-by: Denys Zagorui <denys.zagorui@globallogic.com>
> -
> -Upstream-Status: Accepted
> ----
> - tests/zdiff | 4 +++-
> - zless.in    | 2 +-
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/zdiff b/tests/zdiff
> -index 0bb7c7d..9cd4fd4 100755
> ---- a/tests/zdiff
> -+++ b/tests/zdiff
> -@@ -22,7 +22,6 @@
> -
> - echo a > a || framework_failure_
> - echo b > b || framework_failure_
> --gzip a b || framework_failure_
> -
> - cat <<EOF > exp
> - 1c1
> -@@ -31,7 +30,10 @@ cat <<EOF > exp
> - > b
> - EOF
> -
> -+diff a b | diff exp - || skip_ "diff output format is incompatible with
> POSIX"
> -+
> - fail=0
> -+gzip a b || fail=1
> - zdiff a.gz b.gz > out 2>&1
> - test $? = 1 || fail=1
> -
> -diff --git a/zless.in b/zless.in
> -index e634af6..9759ae6 100644
> ---- a/zless.in
> -+++ b/zless.in
> -@@ -47,7 +47,7 @@ if test "${LESSMETACHARS+set}" != set; then
> -   export LESSMETACHARS
> - fi
> -
> --less_version=`less -V` || exit
> -+less_version=`less -V 2>/dev/null`
> - case $less_version in
> - less' '45[1-9]* | \
> - less' '4[6-9][0-9]* | \
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-extended/gzip/gzip-1.8/wrong-path-fix.patch
> b/meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch
> similarity index 70%
> rename from meta/recipes-extended/gzip/gzip-1.8/wrong-path-fix.patch
> rename to meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch
> index 4dc1000..7c37bc8 100644
> --- a/meta/recipes-extended/gzip/gzip-1.8/wrong-path-fix.patch
> +++ b/meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch
> @@ -13,17 +13,24 @@ Signed-off-by: Ming Liu <ming.liu@windriver.com>
>
>  Upstream-Status: Pending
>
> -Index: gzip-1.8/Makefile.am
> -===================================================================
> ---- gzip-1.8.orig/Makefile.am
> -+++ gzip-1.8/Makefile.am
> -@@ -81,8 +81,7 @@ gzip.doc.gz: gzip.doc $(bin_PROGRAMS)
> - SUFFIXES = .in
> +---
> + Makefile.am | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index d4ecc3f..e4657d2 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -82,8 +82,7 @@ SUFFIXES = .in
>   .in:
> -       $(AM_V_GEN)sed \
> +       $(AM_V_GEN)rm -f $@-t $@ \
> +           && sed \
>  -              -e 's|/bin/sh|$(SHELL)|g' \
>  -              -e 's|[@]GREP@|$(GREP)|g' \
>  +              -e 's|[@]GREP@|$(base_bindir)/grep|g' \
>                 -e 's|[@]VERSION@|$(VERSION)|g' \
>                 $(srcdir)/$@.in >$@-t \
> -         && chmod a+x $@-t \
> +         && chmod a=rx $@-t \
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/gzip/gzip_1.8.bb
> b/meta/recipes-extended/gzip/gzip_1.9.bb
> similarity index 86%
> rename from meta/recipes-extended/gzip/gzip_1.8.bb
> rename to meta/recipes-extended/gzip/gzip_1.9.bb
> index d093207..a8eeba1 100644
> --- a/meta/recipes-extended/gzip/gzip_1.8.bb
> +++ b/meta/recipes-extended/gzip/gzip_1.9.bb
> @@ -3,7 +3,6 @@ require gzip.inc
>  LICENSE = "GPLv3+"
>
>  SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
> -            file://0001-gzip-port-zdiff-zless-to-Busybox.patch \
>              file://run-ptest"
>  SRC_URI_append_class-target = " file://wrong-path-fix.patch"
>
> @@ -34,6 +33,6 @@ do_install_ptest() {
>              ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
>  }
>
> -SRC_URI[md5sum] = "732553152814b22dc35aa0267df5286c"
> -SRC_URI[sha256sum] = "1ff7aedb3d66a0d73f442f6261e4b3
> 860df6fd6c94025c2cb31a202c9c60fe0e"
> +SRC_URI[md5sum] = "929d6a6b832f75b28e3eeeafb30c1d9b"
> +SRC_URI[sha256sum] = "5d2d3a3432ef32f24cdb060d278834
> 507b481a75adeca18850c73592f778f6ad"
>
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

