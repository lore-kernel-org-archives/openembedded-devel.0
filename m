Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 93BD77C24D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 20:51:52 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c21so6200348qkl.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 12:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qipV4lcbnY4RU9j9WFIQsxCbL23hrY/AoVV5Skrez9M=;
	b=CYBDNdQac7oivo8Teeptdx/RdxX4J3Pqaq69HNfGJAbZRnnVHIGx8j8Tz09dlX7lQD
	Q7eFtuqnX9lG8eX4o+q2eF1Shqk477AXb/Vz84slDZKpNzhe8JYt6E+QBbDSAVYQTY1I
	z5RK5eih4B0iuxc0cCFmZ4P4VVIip5BakKos2Auwhrrsg1/scIgUW4tJrWoFzZWEw5ev
	SGOaJTT60A4WNCpXD08dUrEgAwynrTjPClR9p1O0iOu/gR/RdvKLX2cEkahdfM8Z2k5c
	3y0jl7aZWye95UCKaaxlnkWjkEgwJY7rksinLFCNjAuxoVWsj4ixwjnav3/BNSX1Soow
	Q1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qipV4lcbnY4RU9j9WFIQsxCbL23hrY/AoVV5Skrez9M=;
	b=n3oju68fs8iNNqYgGGyiYCZ+BtSi9cVXyrxras2YD7oqAR4aFteXUtMDBQgZWeqyIm
	tIsclw6hi2joqCXOqYGbAS6Wak8Dw+k33UzXx8KWKYemFC98VxKPcFFbdH3kn8WtQYkI
	qQURhKivL+5RJ8s63xuTroYZgJIgX4SS21S0k/vmZcdnYo4c8d4GNI8UBK4I49QCAvoT
	zsiZWKJjmxAJeqjrk5AFffn+YEbwKj6lTpk55gY5STRIuDGmzG3P/UWlL3TqFK/Lw07q
	fT7Ta0lF2VcPNi7eHu5dEUmVgGy/4BDn7Y1kNpzkhwg+lXk3gDbQvDzr8vqpzVoF/ZaY
	qbnw==
X-Gm-Message-State: AJcUukfDIYc3G66blos910VZzly1eXqynZ3Bx7e3brgI6nQoOo9+IRf8
	REx14m22+u0WDRkre1IqwMwTcluCgLtC5PYhhu4=
X-Google-Smtp-Source: ALg8bN5KsNjTyp/4G4XGahsvXshZo3tLDNd8SR92omWLzwF38CMAR3TeVPXctStCMal3Q1eINtcGv9M2pnBcCVxZv60=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr11009532qkf.223.1548449513227;
	Fri, 25 Jan 2019 12:51:53 -0800 (PST)
MIME-Version: 1.0
References: <1548421517-28338-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1548421517-28338-1-git-send-email-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jan 2019 15:51:42 -0500
Message-ID: <CAMKF1sp4PvP_U_DLYQitq-n_i__U9+ntKcPrg8Hin2Z3fq0StQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] libkcapi: Fix missing bash (for apps) and unneeded checksums (for testapp) when building
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
X-List-Received-Date: Fri, 25 Jan 2019 20:51:52 -0000
Content-Type: text/plain; charset="UTF-8"

Another approach could be remove bashism from the shell script which is
demanding it and ask for simple bin/sh

On Fri, Jan 25, 2019 at 8:14 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Fix build failures:
> 1. with "apps" PACKAGECONFIG:
>
>     ERROR: libkcapi-1.1.3+gitAUTOINC+1c736c43eb-r0 do_package:
>     QA Issue: libkcapi: Files/directories were installed but not shipped
> in any package:
>       /usr/bin/.sha1hmac.hmac
>       /usr/lib/.libkcapi.so.1.1.3.hmac
>
> 2. with "testapp" PACKAGECONFIG:
>
>     ERROR: libkcapi-1.1.3+gitAUTOINC+1c736c43eb-r0 do_package_qa:
>     QA Issue: /usr/libexec/libkcapi/test.sh contained in package libkcapi
> requires /bin/bash,
>     but no providers found in RDEPENDS_libkcapi? [file-rdeps]
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> index a93ddc823740..f70f774bf2d6 100644
> --- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> +++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> @@ -16,13 +16,17 @@ SRC_URI = " \
>  inherit autotools
>
>  PACKAGECONFIG ??= ""
> -PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,"
> +PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,bash"
>  PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher
> --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"
>
>  do_install_append() {
>      # bindir contains testapp and apps.  However it is always created,
> even
>      # when no binaries are installed (empty bin_PROGRAMS in Makefile.am),
>      rmdir --ignore-fail-on-non-empty ${D}${bindir}
> +
> +    # Remove the generated binary checksum files
> +    rm -f ${D}${bindir}/.*.hmac
> +    rm -f ${D}${libdir}/.*.hmac
>  }
>
>  CPPFLAGS_append_libc-musl_toolchain-clang = " -Wno-error=sign-compare"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

