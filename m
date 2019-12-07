Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id A9A837C89C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 18:49:57 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id b18so1189573qvy.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 10:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q/qr+G1QXAGn214smTQVOYkvB/1/yK5nSHni8OaVmAk=;
	b=TbMSe1bxcJHunDnP7hrwIEv3L8lW3CP0jPxN+ZhK0teLoH24d2bcB7bjIV8VMTl1ZW
	fHFt3ScLYcFnALcizGN745yn1+BujIqwOwZndvAdyW8sHpTEkodoONvfDHdonJ/2P2v0
	8+vW01RFBsEdtvLmuHD14BBhWOBnoaRn59W/IMV/mfP+QBGRID4LbAunNgm09x1UJL0M
	3d3QXC4LS0EwZWs49uwFk6frPn1YNsWntxKc+f9jMI5EuGoK3imutLSyObPv6WIOFNtA
	qZLbcveJtrFCDBven3Dy8VXxb0m180/BkCz4O5I+WoKo7tECyWQpAh/0339FCR+I/6N7
	EOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q/qr+G1QXAGn214smTQVOYkvB/1/yK5nSHni8OaVmAk=;
	b=QOG/Sbzu1ugJc7cGf9NWb5oUVbIWLLMONv+U+9H/qCxMgc4saXXI9WxamdNcexsry8
	bYX3i42yI3JdFeIhqRLn2gm3t66x6ymFd6rdGVtudn7jOyvpLAHXD2huHRlwCYA5ZQAm
	ouZiADq+4WjaJ7KB1ph3duq3ZaNOHtenMNuLDTpL0We9ae8DevkKI/E0OeyOtcrP/mYJ
	Zohbhgdvz38x+W9dkGlFriGNiP9HTSDIFEvrpyXtnOGdTySrBdI+nW6E2m0eYTLDYC/t
	m+gEHuyTNFRYqUEIXhSFycjhGehjeMT5Cx/05i+hANrs5uu4bC7p0ZJmQR6xz3iiY2RH
	Ofaw==
X-Gm-Message-State: APjAAAUFFQqX7JX+DJdKK2AtPyJ5ByN7AhpceVfWOnV4fu7G2BpmE71F
	MdSYeTLqMJgx389UMPLtXH20voFiWCXmIrF02rE=
X-Google-Smtp-Source: APXvYqygu/57FkQP7ivvFNx9il/dulM/Ra4jhG6pi+2gGGgbBUGWGoijUAGP5REdKKamUANBOjV55dvb/XJhpy7nS9c=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr17888955qvm.206.1575744598049;
	Sat, 07 Dec 2019 10:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20191207180738.40895-1-alex.kiernan@gmail.com>
In-Reply-To: <20191207180738.40895-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Dec 2019 10:49:31 -0800
Message-ID: <CAMKF1sodVrWmRA5f0_gb0NX+g6AZaOMvn21SBhLt8r3Sczj2Qg@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] recipes: rename distro_features_check to features_check
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
X-List-Received-Date: Sat, 07 Dec 2019 18:49:57 -0000
Content-Type: text/plain; charset="UTF-8"

btw. zeus should be branched out before applying this commit.

On Sat, Dec 7, 2019 at 10:08 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Avoid warning due to the class rename in OE-Core.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  recipes-core/cacao/cacao_2d6f6c14daf9.bb      | 2 +-
>  recipes-core/classpath/classpath_0.99.bb      | 2 +-
>  recipes-core/jamvm/jamvm.inc                  | 2 +-
>  recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> index 6783894907d7..0e50b686e107 100644
> --- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> +++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> @@ -19,7 +19,7 @@ S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
>  SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
>  SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
>
> -inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
> +inherit java autotools-brokensep update-alternatives pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>  REQUIRED_DISTRO_FEATURES_class-native := ""
> diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
> index 714503aab6fa..5b9d904636db 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -1,6 +1,6 @@
>  require classpath.inc
>
> -inherit distro_features_check
> +inherit features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
> index cdf087ec8afd..387d799bff03 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -15,7 +15,7 @@ RPROVIDES_${PN}_class-native = ""
>
>  BBCLASSEXTEND = "native"
>
> -inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
> +inherit java autotools update-alternatives pkgconfig relative_symlinks features_check
>
>  REQUIRED_DISTRO_FEATURES_class-target = "x11"
>
> diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> index aa165f5075a3..87de6be12ac0 100644
> --- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> +++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
>  FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
>
> -inherit distro_features_check
> +inherit features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

