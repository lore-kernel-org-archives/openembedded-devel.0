Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id DCC8B6A8DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:04:56 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id k5so12485618iea.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=a/2bI20cQGf5aDiXwZf72PlMh0ajVDYHUY+54A0v57Q=;
	b=KldNppgMnCgXX7qgJ5YfHpRkqZwK0ihVVmQtj6gyn+GdmsOpNRW/qPs4e/zD1fBTWx
	p7cTiNSu/wuFMyxa/yiXlMus8/aM9vfxzOSMV95IEVtxFWKv5WNouESTPsahjzMJKGdR
	B0gTZrCt3rxN6nWdSw1k/EJk6ezHcuBlr4jTIQVWAWB7ozHD62IQJP45gJEdOYi9AKjK
	ipPluO2QEh9k+KARAk084eZw5pz3VZ0hg4uOOb3ASajCGecIevA+RFEHRYZDFXMjTDoX
	UBqkhgjX/ePkR47iRP9G00bZk+PmeaNiZXAzGbN49vNQcVaUjc2T7slor75xzfox94hV
	Xicg==
X-Received: by 10.50.28.112 with SMTP id a16mr333184igh.74.1370937897836; Tue,
	11 Jun 2013 01:04:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 01:04:27 -0700 (PDT)
In-Reply-To: <1370468616-10931-1-git-send-email-philip@balister.org>
References: <1370468616-10931-1-git-send-email-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 01:04:27 -0700
Message-ID: <CAMKF1sqq_2DehmUAdGh06Gq=TgGwRQEePKeQgZouhkm2SqeU0Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] swig : Update to version 2.0.10 and and add nativesdk support.
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
X-List-Received-Date: Tue, 11 Jun 2013 08:04:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 5, 2013 at 2:43 PM, Philip Balister <philip@balister.org> wrote:
> Build tested for armv7a machine.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-devtools/swig/swig.inc       | 2 +-
>  meta-oe/recipes-devtools/swig/swig_2.0.10.bb | 9 +++++++++
>  meta-oe/recipes-devtools/swig/swig_2.0.9.bb  | 8 -------
>  3 files changed, 10 insertions(+), 9 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.10.bb
>  delete mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.9.bb
>

git format-pach -M so that it looks like a move and not a copy delete add


> diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
> index 0476d53..8e83526 100644
> --- a/meta-oe/recipes-devtools/swig/swig.inc
> +++ b/meta-oe/recipes-devtools/swig/swig.inc
> @@ -40,7 +40,7 @@ EXTRA_OECONF = " \
>      --without-tcl \
>  "
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>
>  do_configure() {
>      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/Tools/config
> diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.10.bb b/meta-oe/recipes-devtools/swig/swig_2.0.10.bb
> new file mode 100644
> index 0000000..312ce11
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/swig/swig_2.0.10.bb
> @@ -0,0 +1,9 @@
> +require ${BPN}.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
> +
> +SRC_URI[md5sum] = "6d5e7ad05b4a404e5e85db9befb70c9a"
> +SRC_URI[sha256sum] = "d1eef329e867124ce60838b5ad07c763146b6c8f250dd22a861ead7406f78e63"
> +
> diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.9.bb b/meta-oe/recipes-devtools/swig/swig_2.0.9.bb
> deleted file mode 100644
> index 9e9544c..0000000
> --- a/meta-oe/recipes-devtools/swig/swig_2.0.9.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require ${BPN}.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
> -
> -SRC_URI[md5sum] = "54d534b14a70badc226129159412ea85"
> -SRC_URI[sha256sum] = "586954000d297fafd7e91d1ad31089cc7e249f658889d11a44605d3662569539"
> --
> 1.7.11.7
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

