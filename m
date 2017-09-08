Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C4F2A780F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 16:16:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h4so1634639pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n1uPLI0oXL4uFg85UBDFCL4QlARPAWNEAbJNdlogOYo=;
	b=JPksN9Adfrq8222mOjPnJUXOladXM/KS528588LmLTFM2HhdB6V/ZSZgfW68MnePtI
	f2pjjwTp4ofe460+MtPKKvKt7CpkR0BqJ3tOvyCDvL4umF7UJqKypQpAQq/ouBL06NWe
	R/KKr1eLVUxZQfnWrbbSj0XjqbyvNxYgI/Nwe7CZEdZnaH+ulgnzVfepkRPUhEw0PcED
	Xih+Kg+uBAMMmgFmREmxeIxn7VhOjxRh933ZBQ+zfxPoyZYa7fCZDoZdUb7Yj5vHpdW9
	hE8C0/G2+/HdPxqM1/rVweAak1DGTVfqCtaca38+bHFYA5eO09F9ty1wozWqT2950KoW
	YRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n1uPLI0oXL4uFg85UBDFCL4QlARPAWNEAbJNdlogOYo=;
	b=IoaOWCGmV1i2qTqkeiRoJl0bM3+VMOvo24Su0WTGwsBy4YJ2v38PVOzwyrY6+DAekC
	Jybvyd1VIniTj/DJ86DmXj/c2GY70s2L+NVR9rD88tCWm/htmeMGmX83lOuCEwcHP8dZ
	DaCyK4nxVK2HaVRZwVV7qht7yGs18SksDY9vA2xSEq1f0/la16ID+M5wpY27rLObrFlK
	pTIaxxuhsOhF00AKCOTDV9umr68O6TnkCxTKcIbN5/6YFVG6ot9sxkYaMemAxWKJ/jRS
	fkniQaftMvYD2bjzo7ewum/m8sNMYZUIdc7IkKhl2EHQZ+r95SkzXkulZySLg5eGZzPr
	lxAw==
X-Gm-Message-State: AHPjjUiS9ILRNqUoSfUQYmLNBYcpeJehfceVwTGCGoOQ/Gl+nPSNkaIE
	0vn8HlcbszjNVKFivjzwbSD0JJKiQi5r7hmKTzM=
X-Google-Smtp-Source: ADKCNb7nUxJm5+hWOmaJi/GUNpdUvvf3geiRJu2hffXRu2JoZYXt4JVVGiBwCbXg/XL+uHlOCRwpEDS4yeztGSQaO6w=
X-Received: by 10.84.218.199 with SMTP id g7mr4111484plm.215.1504887364541;
	Fri, 08 Sep 2017 09:16:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Fri, 8 Sep 2017 09:15:34 -0700 (PDT)
In-Reply-To: <20170908111039.5192-1-mikko.ylinen@linux.intel.com>
References: <20170908111039.5192-1-mikko.ylinen@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Sep 2017 09:15:34 -0700
Message-ID: <CAMKF1spxA3Affojtxs9T32zpxY-YaH-znEg0DDdVU8cK8sjYNg@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] efivar: fix build when host gcc version is < 4.9
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
X-List-Received-Date: Fri, 08 Sep 2017 16:16:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 8, 2017 at 4:10 AM, Mikko Ylinen
<mikko.ylinen@linux.intel.com> wrote:
> efivar v27 started using C11 _Generic keyword in macros but that
> is not implemented in gcc until 4.9. This makes efivar-native
> (which is a dependency to efivar) build to fail if the builder host
> gcc version is < 4.9.
>
> It turns out only 'makeguids' generator needs to be built for the
> build arch to generate GENERATED_SOURCES for efivar target build.
> 'makeguids' sources/includes have no gcc version dependencies so
> to fix efivar build when host gcc < 4.9, we simply build 'makeguids'
> target for efivar-native.
>

this looks ok. Thanks for doing it. We can now apply the efirvar recipe updates

> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
> ---
>  meta-oe/recipes-extended/efivar/efivar_0.31.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.31.bb b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
> index 6ad3b36..9d4cdc9 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_0.31.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
> @@ -35,11 +35,15 @@ do_compile_prepend() {
>      sed -i -e s:-Werror::g ${S}/gcc.specs
>  }
>
> +do_compile_class-native() {
> +    oe_runmake -C src makeguids
> +}
> +
>  do_install() {
>      oe_runmake install DESTDIR=${D}
>  }
>
> -do_install_append_class-native() {
> +do_install_class-native() {
>      install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
>  }
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

