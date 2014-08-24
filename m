Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 19B5770703
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 23:37:11 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so8964339ieb.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hND9JtR2P7nqDbr2UkFZGNKHBk8jMw4rzYFjh+SRtF4=;
	b=Ly5AisY/pjw4zolQb20Q03w7kTiWnVmqBAD39IDINFjRHT3S0bW3UFC8Ubt/nX+8Fp
	z+ugut8qpYgCiuRyVr64DU+CYmc8s4KBpJjrCANVcRqvwK/2LccUgiCEuXUkZp/f+m6E
	qmbFkjoOAq42O00/fG0UoL30ZRTClBn6r9N7g7SBDvOz2VrV4NZGSjr3ABlrNQ5spFmz
	nkLuLtI5SIyOB2a6NdYeYFFRciyNjpGxW5K9CoZgHqoNekJQWvOYFnp0HS8cRHYOw3y7
	1PSKf3KfoHC4eZ6TMowaAoFHhhvNnm1CHfcBwtI5DfkoTejybKHyrGuIQPIby+z9Cf3C
	tmhg==
X-Received: by 10.43.75.7 with SMTP id yy7mr286266icb.15.1408923432366; Sun,
	24 Aug 2014 16:37:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sun, 24 Aug 2014 16:36:42 -0700 (PDT)
In-Reply-To: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>
References: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Aug 2014 16:36:42 -0700
Message-ID: <CAMKF1sqRuJ2Ncy=FR09ir4N0teHWvN3CfxGQR97niSDFAcHHzQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][for-daisy][PATCH] php: Fix native build due mistakenly linking against host's iconv
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
X-List-Received-Date: Sun, 24 Aug 2014 23:37:12 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 24, 2014 at 2:03 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The configure script has mistakenly choose to enable iconv support,
> due host to provide it, adding '/usr/lib' to the linking flags and
> failing as:
>
> ,----[ Linking error while testing 'fork' support ]
> | conftest.c:268: warning: conflicting types for built-in function 'fork'
> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
> | collect2: ld returned 1 exit status
> `----
>
> This patch disables iconv support for native builds fixing the error.
>

the patch subject is confusing. enabling iconv is not mistake but its
probed and if found its used. in this case libz against which libxml2
is linked is not used here and that ends up in error.

Can you try to add --with-iconv-dir=${STAGING_LIBDIR_NATIVE}
and see if it helps ?

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-devtools/php/php.inc |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index b1bf79c..1e2aa72 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -37,6 +37,7 @@ EXTRA_OECONF = "--enable-mbstring \
>  EXTRA_OECONF_virtclass-native = " \
>                  --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
>                  --with-libxml-dir=${STAGING_BINDIR_NATIVE} \
> +                --without-iconv \
>                  ${COMMON_EXTRA_OECONF} \
>  "
>
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

