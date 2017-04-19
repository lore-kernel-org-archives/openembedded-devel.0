Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id CC3C871A34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 07:34:35 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id 203so4464270ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eGP3fObeCRUtINO7/8VlEeo/V4srALgsPhD8vg4BU/s=;
	b=S3cyzBmWRLVbv/0WYHtmDv6csHxRCqLE6Jx7jkHBhG9cKemPoKp6J6wj96taCCVd9P
	hZCIHqir7e6RGOOOVF/m0dG97Zt4G485JIRD7dLmKx6+2+VbWDIW2l8zjmbV/tofictb
	zFu0o4eAqjZ68Z1NGbMrTW7ifrE+ty8BiL9rSQUPDUlZTcyg7Pd8dUMCT7L1LGDF4Fq5
	nvKiEWpO4aHkHW2NiEl0+46fqJLjMHILgt34uxhCxHgk62RFrZs5/By6bR2wBRdSiy15
	0UoUJnBMGll0OTFj6mpj5XUAmv9rC2Z/iu16WPIrZ1/HwWvKDHiKzImMg0Ox5GXzc7RT
	bIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eGP3fObeCRUtINO7/8VlEeo/V4srALgsPhD8vg4BU/s=;
	b=R5ZRgHAiVYRgdzXNlukUAEnncnDsw1Ce5hlDkENTjT8erLi0Sb+6lUQ5Q1IVXkOKoM
	wyQ7Aczyfh/jJqOMfHuoLDLKwVtweIwxHkaLDgMXEGZiGxoDeb3hZXuM5p65vL1ZICow
	WLvqOmIbuFfE1T3dpZBTzQm045uZUFPFxGxVhWgj7W6z8vryp7njT5DzlOxrhmuCZu+X
	19w9+4GifQkzzphBjh53/hZC/gKmCFcVcF+zdBLDWisrZtEjk9oLgZmUUddV1T2t778V
	HxTtKt1mWMbRJhMHfFHfZYokR/rBfI8oFFr7ss01+zTorVRcrgjaXuvN/tVbDK7hJSdk
	rtFw==
X-Gm-Message-State: AN3rC/7gIY/sCMxMD/0o9rWrfJiGKYY391+OMJt/JYxVntW9oAQQxmoS
	X2MNzLRMf7oKJyBVEMCXsCqXAnN8MOUg
X-Received: by 10.129.124.84 with SMTP id x81mr1052727ywc.167.1492587276665;
	Wed, 19 Apr 2017 00:34:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Wed, 19 Apr 2017 00:34:06 -0700 (PDT)
In-Reply-To: <1492583315-67555-1-git-send-email-zhixiong.chi@windriver.com>
References: <1492583315-67555-1-git-send-email-zhixiong.chi@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 19 Apr 2017 10:34:06 +0300
Message-ID: <CAHiDW_GhMU0Gi6WZnOdxeUs1pXJQrEgW74S7-WB66_inzu90HA@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] autoconf-archive: drop m4files confliction with gnome-common
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
X-List-Received-Date: Wed, 19 Apr 2017 07:34:36 -0000
Content-Type: text/plain; charset=UTF-8

On 19 April 2017 at 09:28, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:

> Delete the conflicting m4files with gnome-common to avoid the confliction,
> and the two m4 files will be installed by gnome-common that comes from
> oe-core, then set rdepends to gnome-common.
>

For those who missed it, there was a discussion on oe-core already (a
suggested logical dependency from gnome-common to autoconf-archive was not
accepted because oe-core should not depend on meta-oe).

The real solution might be to get rid of gnome-common altogether -- at
least for oe-core this will be relatively easy as its usage is historical.
Maybe something in meta-oe still requires gnome-common but at least the
dependencies could be more correct if the gnome-common recipe was in the
same repo as autoconf-archive: the files could be deleted in gnome-common
and gnome-common could rdepend on autoconf-archive as was originally
suggested.

If we weren't so close to Pyro release I would suggest the above... even
now I personally wouldn't object if someone sent patches for that but I can
see how this hack may be less invasive. In any case I've filed a bug for
removing gnome-common and will do that during next cycle if no-one else
gets to it before.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11380


Cheers,
  Jussi


> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../autoconf-archive/autoconf-archive.inc          |  2 +-
>  .../autoconf-archive/delete-some-m4-files.patch    | 23
> ++++++++++++++++++++++
>  .../autoconf-archive_2016.09.16.bb                 |  4 ++++
>  3 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive/delete-some-m4-files.patch
>
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> index 779115a..9684d1f 100644
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> @@ -6,7 +6,7 @@ DEPENDS += "m4-native"
>  DEPENDS_class-native = "m4-native gnu-config-native"
>  DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>
> -RDEPENDS_${PN} = "m4 gnu-config"
> +RDEPENDS_${PN} = "m4 gnu-config gnome-common"
>  RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>  RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive/delete-some-m4-files.patch b/meta-oe/recipes-devtools/
> autoconf-archive/autoconf-archive/delete-some-m4-files.patch
> new file mode 100644
> index 0000000..2aa788b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive/delete-some-m4-files.patch
> @@ -0,0 +1,23 @@
> +Delete two m4files ax_code_coverage.m4 and ax_check_enable_debug.m4
> +to avoid installing conflicts. These two files can be installed by
> +gnome-common from oe-core, even if the files in gnmoe-common is
> +copied from autoconf-archive(the reason is that the old version
> +autoconf-archive don't provide the two files).
> +After upgrading to the new version, we need to drop them in meta-oe
> +and then set rdepends to gnome-common(oe-core)
> +
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +Index: a/configure.ac
> +===================================================================
> +--- a/configure.ac     2016-09-16 06:00:00.000000000 +0800
> ++++ b/configure.ac     2017-04-18 17:43:05.946290554 +0800
> +@@ -19,7 +19,7 @@
> +
> + AC_PROG_SED
> +
> +-M4FILES="m4_esyscmd([echo -n m4/*.m4])"
> ++M4FILES="m4_esyscmd([echo -n m4/*.m4 | sed -e 's:m4/ax_code_coverage.m4
> ::g'|sed -e 's:m4/ax_check_enable_debug.m4 ::g'])"
> + AC_SUBST([M4FILES])
> +
> + TEXIFILES="m4_esyscmd([cd m4 && echo -n *.m4 | sed -e 's/\.m4/.texi/g'])"
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb b/meta-oe/recipes-devtools/autoconf-archive/
> autoconf-archive_2016.09.16.bb
> index 0a1a771..561b57b 100644
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> @@ -9,5 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> d32239bcb673463ab874e80d47fae504"
>  SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
>  SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a722
> 40a5e5fcd248e8444335e63beb60fabd82"
>
> +SRC_URI += "\
> +        file://delete-some-m4-files.patch \
> +"
> +
>  EXTRA_OECONF += "ac_cv_path_M4=m4"
>  BBCLASSEXTEND = "native nativesdk"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

