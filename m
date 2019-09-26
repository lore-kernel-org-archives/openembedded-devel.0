Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 013AA72E8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 16:24:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h2so2699556edn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bDl911qPpvPgui4XmfYXLKkJD03sWMcYiGFl13/+Mmo=;
	b=qjcBtnRpxME5eYyRxuhKOZK4gYWGj3FhkFIdQPeDE2vLOSp9a1MPMywI7vpWXoM9Gc
	25Yi1N+Nqh55v7xh8pr8F0QvSpfb5QQSxWUKBBZ4OiFuMDB7F/8mq9xusa3rKFnFUHBV
	yoftoZh2JVVXEwDkQfe2caG2Gim4Vf9mjlouNKJr70MqKWQ3l9ZbnscYlRQKhmNLlHBG
	2AM/1OmU2+i6kMAbzOUYW27pOWzJEYKa586ahy/eLzv95wU370UMkX8YQ+jbdyyjQNrE
	HMiSxIDrNUXIfJnbaj254eUeBC/f65pJmZIJu8ROoz4A1DU0lGdaCFRj6MU5E+yT1fGv
	wqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bDl911qPpvPgui4XmfYXLKkJD03sWMcYiGFl13/+Mmo=;
	b=f1cyjo0mQp9zYBokmyWck6g6MIQJlY+TsbIhq/LVP2Sz0GGpQnusW72BLy9C0Vo0d6
	AHg/rnHVM201FPoe+m+Rdf+tkSASeq+ROPW0q/aiBw3psWvO8SanYXtDaFXWC/yvJF62
	bepWbC6eJjTXZhIzm+NOgaB4lnol4C2EyNtnl1R3Ds/O78f9nR5wl05e2ahuXhbuneVX
	13OgSnU7OR8rFxavNEndArTo30mjrfX9Dh7tqFuvzCZwEJbgWpB2kuP2zVzCX0mhTV6w
	w8SUH2poH0P0QaAuvH2iuZRTp+35/r0q8cZ3xMOODy7g3ADnw51viSasRF/9p/AgO/OU
	oV6g==
X-Gm-Message-State: APjAAAWZ/og3joVfDJDtnCg1F9yiF/AUxfRR13wmbak51+yK7BGZzuuh
	eoUCCG1GkmhUUbvPGYoGWT/RuCKGFAEcqpwEbuw=
X-Google-Smtp-Source: APXvYqwxYbQ//7DLppOLRlyowx0alWPxZdTpUqhDnVTvHORuRNHHK5u14jNpK1v4zlYfdcB9uKDfjXDHNttO3/0hpdw=
X-Received: by 2002:a17:906:b742:: with SMTP id
	fx2mr3826370ejb.205.1569515070572; 
	Thu, 26 Sep 2019 09:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569403988.git.liezhi.yang@windriver.com>
	<10fa582ff48102bdf3380916207f636daa0f4c69.1569403988.git.liezhi.yang@windriver.com>
	<CA+chaQfB7aTq_nLmy9Dkwdg=DyB4u_s769QvOWK_iuqtjq0u=A@mail.gmail.com>
In-Reply-To: <CA+chaQfB7aTq_nLmy9Dkwdg=DyB4u_s769QvOWK_iuqtjq0u=A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Sep 2019 18:24:28 +0200
Message-ID: <CA+chaQfS5PowEYYaN+h70fMHH2Mh_7z-kLVwaC_WDHQ5Dat9ug@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 8/8] spice: Drop broken native
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
X-List-Received-Date: Thu, 26 Sep 2019 16:24:30 -0000
Content-Type: text/plain; charset="UTF-8"

I assume it was failing for you with:

cc1: error: -Werror=address-of-packed-member: no option
-Waddress-of-packed-member

I'll send revert of this change and new change to
append -Wno-error=address-of-packed-member only for target:
CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"

Please test it and report back if it works for you.

On Thu, Sep 26, 2019 at 5:44 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> Can you check config.log to see what is broken on your native compiler?
>
> It was building fine for me and it's dependency of qemu-native when spice
> PACKAGECONFIG is enabled, so I would say it's still useful.
>
> Maybe your host has really old gcc or something?
>
> On Wed, Sep 25, 2019 at 11:36 AM Robert Yang <liezhi.yang@windriver.com>
> wrote:
>
>> $ bitbake spice-native
>> checking whether the C compiler works... no
>> configure: error: in
>> `/path/to/spice-native/0.14.2+gitAUTOINC+7cbd70b931_4fc4c2db36-r0/build':
>> configure: error: C compiler cannot create executables
>>
>> It's a broken native recipe which means no ones need it any more, so
>> remove it.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta-networking/recipes-support/spice/spice_git.bb | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
>> b/meta-networking/recipes-support/spice/spice_git.bb
>> index 552f81d..30e939a 100644
>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>> @@ -39,7 +39,6 @@ export
>> PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
>>
>>  CFLAGS_append = " -Wno-error=address-of-packed-member"
>>
>> -PACKAGECONFIG_class-native = ""
>>  PACKAGECONFIG_class-nativesdk = ""
>>  PACKAGECONFIG ?= "sasl"
>>
>> @@ -54,6 +53,6 @@ PACKAGECONFIG[xinerama] =
>> "--enable-xinerama,--disable-xinerama,libxinerama,"
>>
>>  COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
>>
>> -BBCLASSEXTEND = "native nativesdk"
>> +BBCLASSEXTEND = "nativesdk"
>>
>>  EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

