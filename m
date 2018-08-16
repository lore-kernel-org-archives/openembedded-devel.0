Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2387D600BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 17:27:42 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v90-v6so1671065wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CZDIy01myAqHf8a3JrFXaQOYD19Pm867AZ0Xn5mCZ04=;
	b=U6022izbiT457NV3TDRFGfHlS+Txpp2AutedUNJ3+NPSqlHycXnkQr+HgJYUJNn/Vf
	a1pu+gtvS/GuPRU9M0Pv+1JKYDU6jy5qAs6MyZ5DdCktrOcZOdai1y5fJSzRB1OA3Q95
	6vY9CJdwFyFvkFH49x5LVYNScAn6wKIe285A7J7z6S1m/AB5UgS461Du9xVbTDlIZyAn
	SivvMIfG90BGUKmqbKSNsNGDRDQDewLvDwWLbv9W7taZ0V8i/GGOfDQOaR7ZDfHysjRU
	3w76Xsn1+QsOhRjNWyPzOuKwXgKcZNV9CYP+bkYHTitWtO6IbuJskupdTmyF8RMIoLkL
	6N0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CZDIy01myAqHf8a3JrFXaQOYD19Pm867AZ0Xn5mCZ04=;
	b=a0GBuXuU8/XLgYQcVj7RJl3UetPWyF3my1fMRqhJSrmBUTlsClLENIOpb44wfV+VFI
	WDjE8yYcRHRYAfdpNy3BLcBeYNgEwJKlNXyQtB1ohrid676CfPqP4FTuLQ2fbbF+GgrS
	RfvPHfuusp9qqL2hYbHaiKGqUnZDluHeeVfJchkZV41B1JamkalbhwP8ulaVCc+vxzuc
	usYczJeFHWxE6cFCrOeQ6aMr1ngnJ11USefDPhRP+UnWwb34KcbQPM9/NQQsSiK04NIn
	zZXDqofzVSKXKoKEU62FuAowi6GIhOpqm3LYydgOTpyUleKFNDyG6EOaOgHoRAFIfxdz
	ZYYg==
X-Gm-Message-State: AOUpUlHau6o4xp0f4sPaal7ag8vitrntChZXUnxdclENmNjK1k7FMgoK
	7CBLUSqisr4Kaz3pmrgSS/qQMVxbtwqVEcaNCExT2Uyo
X-Google-Smtp-Source: AA+uWPzDo7sQSixPolAnHT6pgUQlLlgP/qY0+V6cVu3p+RvR8cALNMqFh41FhsFp5wYaZUTnNVnakVALrGmNEjv2Mcs=
X-Received: by 2002:adf:f28c:: with SMTP id
	k12-v6mr20070272wro.263.1534440462698; 
	Thu, 16 Aug 2018 10:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180813081742.6961-1-raj.khem@gmail.com>
	<20180813081742.6961-19-raj.khem@gmail.com>
In-Reply-To: <20180813081742.6961-19-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Aug 2018 19:27:31 +0200
Message-ID: <CA+chaQcy1F03YbKDg4SEHwajyrx2gRjLCQVAHg++Hu5xCaguew@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 19/21] cfengine, cfengine-masterfiles: Upgrade to 3.12.0
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
X-List-Received-Date: Thu, 16 Aug 2018 17:27:42 -0000
Content-Type: text/plain; charset="UTF-8"

With this one I'm seeing cfengine-3.12.0-r0 do_package failure:

ERROR: SYSTEMD_SERVICE_cfengine value cf-consumer.service does not exist

On Mon, Aug 13, 2018 at 10:20 AM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...10.2.bb => cfengine-masterfiles_3.12.0.bb} |  4 +--
>  .../cfengine/change-hard-coded-lib-path.patch | 28 -------------------
>  .../set-path-of-default-config-file.patch     | 23 ++++++++++++---
>  ...{cfengine_3.10.2.bb => cfengine_3.12.0.bb} |  7 ++---
>  4 files changed, 24 insertions(+), 38 deletions(-)
>  rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.10.2.bb
> => cfengine-masterfiles_3.12.0.bb} (87%)
>  delete mode 100644
> meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
>  rename meta-oe/recipes-extended/cfengine/{cfengine_3.10.2.bb =>
> cfengine_3.12.0.bb} (93%)
>
> diff --git a/meta-oe/recipes-extended/cfengine/
> cfengine-masterfiles_3.10.2.bb b/meta-oe/recipes-extended/cfengine/
> cfengine-masterfiles_3.12.0.bb
> similarity index 87%
> rename from meta-oe/recipes-extended/cfengine/
> cfengine-masterfiles_3.10.2.bb
> rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
> index b52e7cc082..dda6af9c9d 100644
> --- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
> +++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
> @@ -22,8 +22,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=9f76426f9ef8c6f6739fadd21d817a4f"
>
>  SRC_URI = "
> https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz"
>
> -SRC_URI[md5sum] = "1247ef4e8f3cee5efa98da50c326e5a4"
> -SRC_URI[sha256sum] =
> "5d18a8d71f451d0b5dd1f5e579452b29b99b664f2bb0827dbba9a615f2764df6"
> +SRC_URI[md5sum] = "d59bd8c95620da816c382f749d425860"
> +SRC_URI[sha256sum] =
> "1c50e3d8c702097e13a21258626d936d6ff2e6492e893dfe286ff0d6204d7a65"
>
>  inherit autotools
>
> diff --git
> a/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
> b/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
> deleted file mode 100644
> index 2295e415cd..0000000000
> ---
> a/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -projlibdir use a hard coded lib path, this will cause error when build a
> 64bit
> -target. So change it to suitable path.
> -
> -Signed-off-by: Song.Li <Song.Li@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 38e2b9c..bc6b996 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -188,7 +188,7 @@ AS_IF([test x"$enable_fhs" = xyes], [
> -   fi
> -
> -   sbindir='${exec_prefix}/bin' # /var/cfengine/bin despite being sbin_?
> --  projlibdir='${exec_prefix}/lib'
> -+  projlibdir='${libdir}'
> -   mandir='${exec_prefix}/share/man'
> - ])
> -
> ---
> -1.7.1
> -
> diff --git
> a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
> b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
> index b9526f2843..db69f951ca 100644
> ---
> a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
> +++
> b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
> @@ -1,23 +1,38 @@
> +From dc270040cb3beb5ca42f864813145c8a68594bad Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Mon, 18 Jul 2016 09:06:06 +0800
> +Subject: [PATCH] cfengine: add recipe and base policy
> +
>  Upstream-Status: Inappropriate [configuration]
>
>  Set the path of default configure file.
>
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
>  ---
> + misc/init.d/cfengine3.in | 12 ++++--------
> + 1 file changed, 4 insertions(+), 8 deletions(-)
> +
>  diff --git a/misc/init.d/cfengine3.in b/misc/init.d/cfengine3.in
> -index d6ae26f..1dee283 100644
> +index c584817..12f5803 100644
>  --- a/misc/init.d/cfengine3.in
>  +++ b/misc/init.d/cfengine3.in
> -@@ -101,11 +101,7 @@ if [ -z "$LOCKDIR" ]; then
> +@@ -101,14 +101,10 @@ if [ -z "$LOCKDIR" ]; then
>   fi
>
>   # default control file
>  -if [ "$DEBIAN" = "1" ]; then
>  -    DEFAULT=/etc/default/cfengine3
> +-    INIT_FUNCTIONS=/lib/lsb/init-functions
> +-    if [ -e "$INIT_FUNCTIONS" ]; then
> +-        . "$INIT_FUNCTIONS"
> +-    fi
>  -else
>  -    DEFAULT=/etc/sysconfig/cfengine3
> --fi
>  +DEFAULT=/etc/default/cfengine3
> ++INIT_FUNCTIONS=/lib/lsb/init-functions
> ++if [ -e "$INIT_FUNCTIONS" ]; then
> ++    . "$INIT_FUNCTIONS"
> + fi
>
>   if [ -f $DEFAULT ]; then
> -     . $DEFAULT
> diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
> b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
> similarity index 93%
> rename from meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
> rename to meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
> index b86b0a1f18..aa33a97a4d 100644
> --- a/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
> +++ b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
> @@ -16,12 +16,11 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=f8b34828ab373d6b1bb4b0fc60a78494"
>  DEPENDS = "attr tokyocabinet"
>
>  SRC_URI = "
> https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
> -           file://change-hard-coded-lib-path.patch \
>             file://set-path-of-default-config-file.patch \
> -"
> +           "
>
> -SRC_URI[md5sum] = "c16baf08189a1af6fcf2e2ff61102992"
> -SRC_URI[sha256sum] =
> "d4fa9ac7276dba7b85d6757aab2f0929ab8d3b115cb0e7b0cf984760347429d7"
> +SRC_URI[md5sum] = "33ef12260db4b430352229f37f7cb0e5"
> +SRC_URI[sha256sum] =
> "d71ba98a272390c6fa8bc20e8ea27f0050a0a72a3e6b206a4762b4646be332ec"
>
>  inherit autotools systemd
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

