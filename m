Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9D977E76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 05:08:09 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 63so1943287pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 22:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1FGayaxb0lQ+E+MnFyaMMTg77NoKoJXFwXcKe7Q9S1U=;
	b=m6ei31RlArUtMXYFkqfMQxk3eh1d/JJXnS4A26bOa6pf9zcUCb5EYHPfvlyDEquonR
	9wUNJE4JxrRbW3VmDmvuYou2Gub5CLzutbScVKZ++/2Trf8KYiCIW59HnV5jK0vWH8Zo
	8s4kLtSc59a1YuF4pZ6ZhnBH8ADIKk4qI5S1fTS/r5t32lnaZfcGquD2h1VJU1zWZSiz
	s5XOMIM+HXb8QJikt3Af3H/kg6DH39K0sxjIdZ8Xt/aTOJ1xsDJwqSbCBnlyNSOjgtX2
	u0NHVfk1QWYEgNVfGCjehZNBUpQtbIjnt+SdHyomBE0e4S8uIJ8Qm17owCW3IAZtDAP8
	T/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1FGayaxb0lQ+E+MnFyaMMTg77NoKoJXFwXcKe7Q9S1U=;
	b=XX/cyF3bVdK1a5xqY2+1Tb+Qu3bv8UvEHB8LZBlsfHL/cJkTxMQdNMtHNDtr0HHdNo
	CYtzhmFkTL9AvnzcfYUYmwVSpebqEkPNC1OzYcLt2ZRQJ+qIOUFu6+nq0TKOtnyyT4Vu
	4mWyi0sROng37KN/ExOpc+IGM+MePceowNvCwyA3Uh3vNp31C69kuElBDSXmsWXwHjIM
	wyTvbOoLRjq5R64m3BXOjAyObmXOEbLrTolbec3wofsPVWOCs0zGlN7S+fGOtCAyMeGg
	zlvEUTUxqqTtcHDhU4gh1fbDSsxl0mpnpxxmGstxEVYE3yl/RigHj0lmpb/mYFneCHvW
	UHTA==
X-Gm-Message-State: AHYfb5gYwPc+63Y6YKJNWyPQVixWkYGipEASuorVhdhxPRoOWCDkxr8p
	O1Oxu+RiixoSd0FpBdWh2W/5Qv6nj8ZF
X-Received: by 10.84.229.15 with SMTP id b15mr3655771plk.215.1503983290704;
	Mon, 28 Aug 2017 22:08:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 22:07:40 -0700 (PDT)
In-Reply-To: <1503976183-18757-1-git-send-email-bruce.ashfield@windriver.com>
References: <1503976183-18757-1-git-send-email-bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 22:07:40 -0700
Message-ID: <CAMKF1soxc=Vcv-Niwf4KZrY378dZ-iAT-gjmrMX9POv73fnUSg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: update to fix build issues with 4.12+
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
X-List-Received-Date: Tue, 29 Aug 2017 05:08:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 28, 2017 at 8:09 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Bumping the version to 5.1.26 fixes the build issues with
> the 4.12+ kernel (and headers).
>
> i.e.:
>
>  tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:
>  In function 'atomic_try_cmpxchg':
>  |
>  tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>  error: undefined named operand 'new'
>  |   return try_cmpxchg(&v->counter, old, new);
>  |   ^~~~~~
>  |
>  tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>  error: undefined named operand 'new'
>  |
>  tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>  error: undefined named operand 'new'
>  |
>  tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>  error: undefined named operand 'new'
>

fixed with
https://patchwork.openembedded.org/patch/143347/

> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  .../{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb} (93%)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
> similarity index 93%
> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
> index 4085b9fc7339..fdefe03172d2 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
> @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
>  SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
>             file://Makefile.utils \
>  "
> -SRC_URI[md5sum] = "1a7db64cd69ba6d39574fb333e031251"
> -SRC_URI[sha256sum] = "7ed0959bbbd02826b86b3d5dc8348931ddfab267c31f8ed36ee53c12f5522cd9"
> +SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
> +SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
>
>  S = "${WORKDIR}/vbox_module"
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

