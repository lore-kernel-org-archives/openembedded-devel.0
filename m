Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 905F475794
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 15:42:29 +0000 (UTC)
Received: by igui7 with SMTP id i7so16813041igu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sT4QuburWw/DXHqiCWApgeQPcI3IyWsDjVTI9N+bVds=;
	b=mWiJA/KBjqlaD0YJHEEGvIE1AZXwV9bQYL0V8ayb/AJOMxRWBykaFtXEMNG9MU4NtD
	5565TUfNFoXWetv4PclPpcd91KgyYV1Xq3TFl1DOdeQodT2lET0Zlz1gMxn24ATcb4cr
	BoJWkuPDTsPws3u9oRLETpGrwRvHNtpnvBf78zUgsI6SSTuaBTkpxmfoUUSHw/llbSZh
	HW591WdBJD8Mz2P6frGdkKH9gpBjrsrNY2JQwo6ikc8xNeyUVkCJ8bOaMpdCBHs4BI8u
	wEOZRfL4CebWdq5PO180MiQjuJc2e17DR/w1fsbNCQXHbTBnae3tQCRtWS4R9569xRaK
	qAag==
X-Received: by 10.50.30.226 with SMTP id v2mr3428478igh.11.1440171749490; Fri,
	21 Aug 2015 08:42:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 08:42:00 -0700 (PDT)
In-Reply-To: <1440175216-21907-1-git-send-email-biannm@cn.fujitsu.com>
References: <1440175216-21907-1-git-send-email-biannm@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 08:42:00 -0700
Message-ID: <CAMKF1spvKJaV0_+JngPLnZWesZ2ELipZ3c=UdOY1v-Nu2yLkBg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: 0.1.101 -> 0.1.102
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Aug 2015 15:42:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 9:40 AM, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
> upgrade sysdig to 0.1.102, and using GIT source instead of archive.
>
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../01-donot-set-default-value-to-va_list.patch    | 22 --------------
>  meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb  | 34 ----------------------
>  meta-oe/recipes-extended/sysdig/sysdig_git.bb      | 32 ++++++++++++++++++++
>  3 files changed, 32 insertions(+), 56 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch
>  delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
>  create mode 100644 meta-oe/recipes-extended/sysdig/sysdig_git.bb
>
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch b/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch
> deleted file mode 100644
> index 9cb6378..0000000
> --- a/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-va_list.patch
> +++ /dev/null

why is this patch dropped ?

> @@ -1,22 +0,0 @@
> -fix build error as following.
> -
> -  sysdig-0.1.101/userspace/libsinsp/ctext.h:376:50: error: could not convert '0' from 'int' to 'va_list {aka __va_list}'
> -  |    int8_t vprintf(const char*format, va_list ap = 0);
> -  |                                                   ^
> -  | make[2]: *** [userspace/libsinsp/CMakeFiles/sinsp.dir/ctext.cpp.o] Error 1
> -
> -
> -Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> -
> -diff -Nurp sysdig-0.1.101.orig/userspace/libsinsp/ctext.h sysdig-0.1.101/userspace/libsinsp/ctext.h
> ---- sysdig-0.1.101.orig/userspace/libsinsp/ctext.h     2015-06-04 02:58:51.000000000 +0800
> -+++ sysdig-0.1.101/userspace/libsinsp/ctext.h  2015-07-02 09:18:14.154627357 +0800
> -@@ -373,7 +373,7 @@ class ctext
> -               // application to this library seamlessly.
> -               //
> -               int8_t printf(const char*format, ...);
> --              int8_t vprintf(const char*format, va_list ap = 0);
> -+              int8_t vprintf(const char*format, va_list ap);
> -
> -               //
> -               // nprintf is identical to the printf above EXCEPT for
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
> deleted file mode 100644
> index 789fd47..0000000
> --- a/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -SUMMARY = "A New System Troubleshooting Tool Built for the Way You Work"
> -DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
> -system state and activity from a running Linux instance, then save, \
> -filter and analyze."
> -HOMEPAGE = "http://www.sysdig.org/"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -
> -inherit cmake pkgconfig
> -
> -DEPENDS = "luajit zlib ncurses"
> -RDEPENDS_${PN} = "bash"
> -
> -
> -SRC_URI = "https://github.com/draios/sysdig/archive/${PV}.tar.gz \
> -           file://01-donot-set-default-value-to-va_list.patch \
> -          "
> -
> -SRC_URI[md5sum] = "5fe96a3a0fd98b2157a40cb29af41afc"
> -SRC_URI[sha256sum] = "6995e39be565514901b5cb587689ee2efbf8359293e4e597362382cccf0e9db6"
> -
> -DIR_ETC="/etc"
> -EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
> -                  -DUSE_BUNDLED_ZLIB="OFF" \
> -                  -DBUILD_DRIVER="OFF" \
> -                  -DUSE_BUNDLED_NCURSES="OFF" \
> -                  -DDIR_ETC="${DIR_ETC}" \
> -                '
> -
> -FILES_${PN} += " \
> -    ${DIR_ETC}/* \
> -    ${datadir}/zsh/* \
> -    ${prefix}/src/*  \
> -"
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
> new file mode 100644
> index 0000000..62aa433
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "A New System Troubleshooting Tool Built for the Way You Work"
> +DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
> +system state and activity from a running Linux instance, then save, \
> +filter and analyze."
> +HOMEPAGE = "http://www.sysdig.org/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS = "luajit zlib ncurses"
> +RDEPENDS_${PN} = "bash"
> +
> +SRC_URI = "git://github.com/draios/sysdig.git;branch=master"
> +SRCREV = "b7394e29ced4f1a991af03c0381a5828abcbab7a"
> +PV = "0.1.102+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +DIR_ETC="/etc"
> +EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
> +                  -DUSE_BUNDLED_ZLIB="OFF" \
> +                  -DBUILD_DRIVER="OFF" \
> +                  -DUSE_BUNDLED_NCURSES="OFF" \
> +                  -DDIR_ETC="${DIR_ETC}" \
> +                '
> +
> +FILES_${PN} += " \
> +    ${DIR_ETC}/* \
> +    ${datadir}/zsh/* \
> +    ${prefix}/src/*  \
> +"
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

