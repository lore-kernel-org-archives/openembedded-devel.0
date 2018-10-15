Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F32065CC7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:04:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q5-v6so12408621qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ypx245DDrocRcZSzoyV4VRPNpBqiq5afBM/90PLVkYI=;
	b=m2LlB10qJTsZM1dT/9u1EWPhoJvzm7UFFtA9U5cLFSiJvCNKl5r3+tWfHTOS8cwvUt
	3BiglDSAhxGSOZQlHFOY2O2XXi7Fr0yZ9rmDh86F8Wv3XLXxp86Yq32uPyJmYFjtrXRN
	8L1p538rL5TWwwJYsvMqUcskO5E5NrRdG0vGyZySiIpgaw4OBsNfOY6WnVkFNSdERwNr
	qcVlTWQf9gb6cLsyTZRSuDRaZ+Vc0ITVPmm0ToZWU0R2+IyP62rq3qZs+PgOOPk8U+mT
	vfZsJT3XfH8jqgDDt1RYuXumkSUdiSioLa6o/u2hKl414zFUNFnFDAgOk1mwf8Sh29Yj
	9MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ypx245DDrocRcZSzoyV4VRPNpBqiq5afBM/90PLVkYI=;
	b=nUvErnYjCY3fI78gSSSjCHLlglAZdqqLofJ8+a3vHnjcEF7lz30MIrA6gd4UGD+Iqs
	r/O+1bWvQHvNjdmyiyikB/mopzWf4io8rp96CLEQFQH7g7g6uhn0dFy3eCVp7h6RfxcI
	sOkmpK+UtLoTqpDGC9tYB4GF3nD28FNj6uzyfaVyYcFvBTaDEZ6jxVKCwz16SlW9TTcu
	b1CiF8RcHieEXfYIzG5XK8CY9nntcUB9LH6et/bJeLAp7aVU90B+7H3+SRvdAsUAwrmg
	9Mpzu3KqiU3GygSKUX2VNAfNOvlqxDT/+ety0zOOTMCt3bGkuWQniIeGd/lu6+zsfY8H
	Nj+g==
X-Gm-Message-State: ABuFfoik4YpKoR641fvHfUq0BoCaPBjJRTh+jzrS49/7AYzkajWlIjjf
	imZZ0xRfmT0IIOdpr/dC9377EJmfe1BHmKwZLDo=
X-Google-Smtp-Source: ACcGV62KXt/9nDY6Aleubk6Uz1NX3vOxqyFPI8U8EhEDcEXfqZqnm4wqhkeU8YpgWTQFJJp3DcOoazf9yDsadd0gOqE=
X-Received: by 2002:a37:5003:: with SMTP id
	e3-v6mr17560611qkb.102.1539626643261; 
	Mon, 15 Oct 2018 11:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181015155444.7275-1-brgl@bgdev.pl>
In-Reply-To: <20181015155444.7275-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Oct 2018 11:03:36 -0700
Message-ID: <CAMKF1spH_HPGvbsgjTmw4Qhf4PpWk1-grZABNtVrHo9miY8BnA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: lew@avast.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	jan.kaisrlik@avast.com, karas@avast.com
Subject: Re: [meta-oe][PATCH v2] catch2: new package
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
X-List-Received-Date: Mon, 15 Oct 2018 18:04:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 8:54 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Add a recipe for the catch2 testing framework. There's a bug upstream
> which makes it impossible to build with gcc7 so include a patch.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - upstream merged a different solution for the build error: backport
>   the relevant patch, include Upstream-Status tag
> - use ${datadir} instead of hardcoded paths
> - depend on python3-native, not python-native
> - replace ALLOW_EMPTY_${PN} = "1" with RDEPENDS/RRECOMMENDS
>
>  ...1-Fix-convert-from-char-on-ARM-build.patch | 46 +++++++++++++++++++
>  meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 26 +++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
>  create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb
>
> diff --git a/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch b/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-opython3nativen-ARM-build.patch
> new file mode 100644
> index 000000000..307377563
> --- /dev/null
> +++ b/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
> @@ -0,0 +1,46 @@
> +From 5729874fa5059c39aa97cfa08fddf107b7a65c9e Mon Sep 17 00:00:00 2001
> +From: Miguel Gaio <mgaio35@gmail.com>
> +Date: Wed, 3 Oct 2018 10:22:16 +0200
> +Subject: [PATCH] Fix convert from char on ARM build
> +
> +Some platforms set the signedness of char to unsigned (eg. ARM).
> +Convert from char should not assume the signedness of char.
> +
> +Fix build issue with -Werror,-Wtautological-unsigned-zero-compare flags.
> +
> +Signed-off-by: Miguel Gaio <mgaio35@gmail.com>
> +
> +Upstream-Status: Accepted [Commit f1faaa9c107113692301ad8bb56084460ef1a2ff]
> +
> +Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +---
> + include/internal/catch_tostring.cpp | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/include/internal/catch_tostring.cpp b/include/internal/catch_tostring.cpp
> +index 4e0c027d..8cbabbf2 100644
> +--- a/include/internal/catch_tostring.cpp
> ++++ b/include/internal/catch_tostring.cpp
> +@@ -205,7 +205,7 @@ std::string StringMaker<bool>::convert(bool b) {
> +     return b ? "true" : "false";
> + }
> +
> +-std::string StringMaker<char>::convert(char value) {
> ++std::string StringMaker<signed char>::convert(signed char value) {
> +     if (value == '\r') {
> +         return "'\\r'";
> +     } else if (value == '\f') {
> +@@ -222,8 +222,8 @@ std::string StringMaker<char>::convert(char value) {
> +         return chstr;
> +     }
> + }
> +-std::string StringMaker<signed char>::convert(signed char c) {
> +-    return ::Catch::Detail::stringify(static_cast<char>(c));
> ++std::string StringMaker<char>::convert(char c) {
> ++    return ::Catch::Detail::stringify(static_cast<signed char>(c));
> + }
> + std::string StringMaker<unsigned char>::convert(unsigned char c) {
> +     return ::Catch::Detail::stringify(static_cast<char>(c));
> +--
> +2.19.1
> +
> diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> new file mode 100644
> index 000000000..370ade150
> --- /dev/null
> +++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "A modern, C++-native, header-only, test framework for unit-tests, \
> +TDD and BDD - using C++11, C++14, C++17 and later."
> +AUTHOR = "Phil Nash, Martin Horenovsky and others"
> +HOMEPAGE = "https://github.com/catchorg/Catch2"
> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> +
> +SRC_URI = "git://github.com/catchorg/Catch2.git \
> +           file://0001-Fix-convert-from-char-on-ARM-build.patch"
> +SRCREV = "9e1bdca4667295fcb16265eae00efa8423f07007"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "python3-native"

this is redundant since python3native is being inherited.

> +
> +inherit cmake python3native
> +
> +# Header-only library
> +RDEPENDS_${PN}-dev = ""
> +RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> +
> +do_install_append() {
> +    rm ${D}/${datadir}/Catch2/lldbinit
> +    rm ${D}/${datadir}/Catch2/gdbinit
> +    rmdir ${D}/${datadir}/Catch2/

why not just delete whole dir in one go ?

> +}
> --
> 2.19.1
>

