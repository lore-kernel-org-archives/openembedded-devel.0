Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 491EC77076
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 22:09:36 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so3160082wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LCGmtsahC2eeK8I6BVpHkJdcYsBMmgnk3iHaCKR1bgo=;
	b=UyR7X/iHufoKFTdRcw4oLQWwix/fTVgX/O0MoKcdFpcg+RggORLcJ6Pg/lTSny8jne
	tLq59wbPyoXNafQv+tlFFjaQEtpHFCsbucI+IzKEBLVR4ZSIEFtn18Ri6V5qPkEmHrtl
	Ues2GEZPXuu0RPPgt+ZS1PtAqJ5GxVI4aFOcNj72EObgxvw2kFMPXycW1BoaR/SF4RG9
	IKL+WakEp/C3m0j0eiBPGBPhb6fEsZZ4exDesyfruUqTxNS0SYBNY6hgd7+0ok9ENBok
	5BuqrItdMncx7y5VmBP1ewNEnvFnd9JeI+Q6e7u+30GcPKqECVKR++ozigwBVHTM/5Jk
	Zrtg==
MIME-Version: 1.0
X-Received: by 10.180.103.72 with SMTP id fu8mr34442563wib.7.1443650976421;
	Wed, 30 Sep 2015 15:09:36 -0700 (PDT)
Received: by 10.194.159.102 with HTTP; Wed, 30 Sep 2015 15:09:36 -0700 (PDT)
In-Reply-To: <1443646235-9298-1-git-send-email-jkv@unixcluster.dk>
References: <1443646235-9298-1-git-send-email-jkv@unixcluster.dk>
Date: Thu, 1 Oct 2015 00:09:36 +0200
Message-ID: <CA+chaQfM37CKMyJKr36EHbpizxzkkN8iH4orNCzTQmUyeQ4+Hw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] mongodb: receipe fixed, removed from blacklist and now cross compiles to arm.
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
X-List-Received-Date: Wed, 30 Sep 2015 22:09:37 -0000
Content-Type: text/plain; charset=UTF-8

Why did you add glibc and didn't remove boost from DEPENDS if it isn't
going to use system boost? Will it also use bundled pcre and tcmalloc now?
Most people hate bundled libraries for good reasons, if it's not the case
here, then at least explain it in commit message and update DEPENDS
accordingly.

On Wed, Sep 30, 2015 at 10:50 PM, Johnny Vestergaard <jkv@unixcluster.dk>
wrote:

> Removed the dependencies on system boost.
>
> Signed-off-by: Johnny Vestergaard <jkv@unixcluster.dk>
> ---
>  meta-oe/recipes-support/mongodb/mongodb_git.bb | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> index 879fc7c..7348978 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -3,7 +3,7 @@ LICENSE = "AGPL-3.0 & Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
>
>  file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -DEPENDS = "openssl libpcre boost libpcap"
> +DEPENDS = "glibc openssl libpcre boost libpcap"
>  # Mongo uses tcmalloc on x86_64, which is provided by gperftools
>  DEPENDS_append_x86-64 = " gperftools"
>
> @@ -14,7 +14,7 @@ inherit scons
>  # | scons: ***
> [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod]
> Error 1
>  # | scons: building terminated because of errors.
>  # | ERROR: scons build execution failed.
> -PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
> +#PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
>
>  PV = "2.6.0+git${SRCPV}"
>  SRCREV = "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
> @@ -30,15 +30,12 @@ S = "${WORKDIR}/git"
>
>  export OE_TARGET_ARCH="${TARGET_ARCH}"
>
> -EXTRA_OESCONS = "--prefix=${D}${prefix} \
> +EXTRA_OESCONS = "sysroot=${STAGING_DIR_TARGET} \
> +                 --prefix=${D}${prefix} \
>                   --propagate-shell-environment \
>                   --cc-use-shell-environment \
>                   --cxx-use-shell-environment \
> -                 --ld='${TARGET_PREFIX}g++' \
>                   --ssl \
> -                 --use-system-pcre \
> -                 --use-system-boost \
> -                 --use-system-tcmalloc \
>                   --disable-scripting \
>                   --nostrip \
>                   mongod mongos"
> --
> 2.6.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

