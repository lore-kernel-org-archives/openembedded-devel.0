Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1A16AEF8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 08:44:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5S8ixKO025227
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 01:44:59 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 28 Jun 2013 01:44:58 -0700
Message-ID: <51CD4D0A.5070802@windriver.com>
Date: Fri, 28 Jun 2013 16:44:58 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1372123379-20337-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1372123379-20337-1-git-send-email-rongqing.li@windriver.com>
Cc: joe.macdonald@windriver.com
Subject: Re: [PATCH meta-networking] cyrus-sasl: Avoid to call AC_TRY_RUN
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
X-List-Received-Date: Fri, 28 Jun 2013 08:44:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 06/25/2013 09:22 AM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> If the gssapi libraries are compiled before cyrus-sasl, configure will call
> AC_TRY_RUN to check if gssapi libraries support SPNEGO, but calling AC_TRY_RUN
> will fail on cross-compile environment.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |    6 ++-
>   .../files/avoid-to-call-AC_TRY_RUN.patch           |   46 ++++++++++++++++++++
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index bf6f95c..4311540 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -4,7 +4,8 @@ DEPENDS = "openssl virtual/db"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
>
> -SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz "
> +SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
> +	   file://avoid-to-call-AC_TRY_RUN.patch"
>
>   inherit autotools pkgconfig
>
> @@ -14,6 +15,9 @@ EXTRA_OECONF += "--with-dblib=berkeley \
>                    --without-pam --without-opie --without-des \
>                    andrew_cv_runpath_switch=none"
>
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
> +
>   do_configure_prepend () {
>       rm -f acinclude.m4 config/libtool.m4
>   }
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch b/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch
> new file mode 100644
> index 0000000..df9fa15
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch
> @@ -0,0 +1,46 @@
> +Avoid to call AC_TRY_RUN
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Avoid to call AC_TRY_RUN to check if GSSAPI libraries support SPNEGO
> +on cross-compile environment by definition AC_ARG_ENABLE enable-spnego
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + cmulocal/sasl2.m4 |   13 ++++++++++++-
> + 1 file changed, 12 insertions(+), 1 deletion(-)
> +
> +diff --git a/cmulocal/sasl2.m4 b/cmulocal/sasl2.m4
> +index 3c2841a..a5ecf81 100644
> +--- a/cmulocal/sasl2.m4
> ++++ b/cmulocal/sasl2.m4
> +@@ -281,6 +281,17 @@ if test "$gssapi" != no; then
> +
> +   cmu_save_LIBS="$LIBS"
> +   LIBS="$LIBS $GSSAPIBASE_LIBS"
> ++  AC_ARG_ENABLE([spnego],
> ++              [AC_HELP_STRING([--enable-spnego=<DIR>],
> ++                              [enable SPNEGO support in GSSAPI libraries [no]])],
> ++              [spnego=$enableval],
> ++              [spnego=no])
> ++
> ++  if test "$spnego" = no; then
> ++       echo "no"
> ++  elif test "$spnego" = yes; then
> ++       AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
> ++  else
> +   AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
> +   AC_TRY_RUN([
> + #ifdef HAVE_GSSAPI_H
> +@@ -308,7 +319,7 @@ int main(void)
> + 	AC_MSG_RESULT(yes) ],
> + 	AC_MSG_RESULT(no))
> +   LIBS="$cmu_save_LIBS"
> +-
> ++   fi
> + else
> +   AC_MSG_RESULT([disabled])
> + fi
> +--
> +1.7.10.4
> +
>

-- 
Best Reagrds,
Roy | RongQing Li

