Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71C8B7E39F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 20:23:43 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f97so6121274plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2019 13:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lbTO8dSiGxM44ovcOMdrT/2DTNbuWVf7aGx8dZoHsVw=;
	b=CBinbZnh5scaBC5UB4h6UpXXdD2qVfqYVk3l3w+g5oMyeFK2LnT+QIMI7W/TIYFQ+6
	KUlKJEad0tokYd3UiCg5jsHb9JLN2J8cRogG+XMijxywZ74Hc40dR/IHqRrzhMKHjYaA
	zZYnME3709/jrDwi3AYyQsh4BSiUQB0JJVoteVWaWQPvYYBpc+K7M+gkqBEJbbepVqGF
	6hTLOv9mD2yijTksEbpI8mPaUDOgU6qGptaXd7+gG4cpnNJY+bx71zExwPpkZFBltRH+
	7HggVOvELV0EZm8T0PjZRWFQS0gOBItkuC80zbA19KmP/JLCWBCnjnPRbwyz7XiXe90N
	qdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=lbTO8dSiGxM44ovcOMdrT/2DTNbuWVf7aGx8dZoHsVw=;
	b=JC1USgvkaGfekAJ2D9NCOhYA8sM9ZaJN+yMpvISSJUsCv2nc6mK8JTDF9uec4YCoz/
	UXTmbPpul6ioBdCPSUaPciWrg0eue9bB/OzHWts/NsEAYxbHLVrB30mO6Xsh5FbI4tML
	21CqywgaAzWISWN6Rv4sGSnQwk27hi6xwA/y788Bn4xkuTnqIHchtRIU3sxjjwIRJpg1
	oxOHdq/bdiSa54mfc1z+5Q9sF4E3pgXhmC9XZGJI07hGvskfQpamrKIN/D36/W/Yw/As
	JHRYT1W4UEn2n/i+qYaagMCRipfpQFQ8AunYvZxovK6hRhhTor7e2mYVW0r2I6ddUfuK
	IgiA==
X-Gm-Message-State: APjAAAUA401pfwKaOoalDWytPJVXnJ6+oZRPHwf+a30UgA9ogcNekVgY
	MqccW2Aze8k8wHbOE4TaFgGw9T5g
X-Google-Smtp-Source: APXvYqxvVmuztKmGsUHNdQECbIkrsNpybExSUEYU0qxZQFjMZGmSJWoBMIaoqUA18Jc2839rjWEuTg==
X-Received: by 2002:a17:902:b089:: with SMTP id
	p9mr25832526plr.38.1559507019215; 
	Sun, 02 Jun 2019 13:23:39 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1148:3840:7bb3:6bde?
	([2601:202:4180:c33:1148:3840:7bb3:6bde])
	by smtp.gmail.com with ESMTPSA id e6sm7797394pfi.42.2019.06.02.13.22.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Jun 2019 13:23:19 -0700 (PDT)
To: Tim Orling <timothy.t.orling@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f9d57034-a434-b696-5428-c549992ef0e7@gmail.com>
Date: Sun, 2 Jun 2019 13:22:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
Subject: Re: [meta-perl][PATCH 01/13] libterm-readkey-perl: upgrade 2.37 -> 2.38; fix upstream check; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 20:23:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/2/19 11:43 AM, Tim Orling wrote:
> Upstream release notes:
> """
> 2.38     - 2019-01-05
>         * Bundle up various changes including:
>                 * Indexing improvements
>                 * Makefile improvements for some make utils
>                 * Various code cleanups and modernizations

bug fix only? ie appropriate possible backport to warrior?

- armin
> """
>
> * Add UPSTREAM_CHECK_REGEX
> * Add UPSTREAM_CHECK_URI
> * inherit ptest-perl; all tests pass
> * ptest RDEPENDS on perl-module-test-more
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  ...erl_2.37.bb => libterm-readkey-perl_2.38.bb} | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>  rename meta-perl/recipes-perl/libterm/{libterm-readkey-perl_2.37.bb => libterm-readkey-perl_2.38.bb} (74%)
>
> diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> similarity index 74%
> rename from meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> rename to meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> index 6b76682c68..cc1ac6ed56 100644
> --- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> @@ -3,8 +3,8 @@ DESCRIPTION = "Term::ReadKey is a compiled perl module dedicated to providing si
>  control over terminal driver modes (cbreak, raw, cooked, etc.,) support \
>  for non-blocking reads, if the architecture allows, and some generalized \
>  handy functions for working with terminals. One of the main goals is to \
> -have the functions as portable as possible, so you can just plug in "use \
> -Term::ReadKey" on any architecture and have a good likelihood of it \
> +have the functions as portable as possible, so you can just plug in 'use \
> +Term::ReadKey' on any architecture and have a good likelihood of it \
>  working."
>  HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
>  SECTION = "libraries"
> @@ -14,16 +14,23 @@ LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"
>  
>  SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
>  
> -SRC_URI[md5sum] = "e8ea15c16333ac4f8d146d702e83cc0c"
> -SRC_URI[sha256sum] = "4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db682db241"
> +SRC_URI[md5sum] = "b2b4aab7a0e6bddb7ac3b21ba637482c"
> +SRC_URI[sha256sum] = "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd22e105a856a47290"
>  
>  S = "${WORKDIR}/TermReadKey-${PV}"
>  
> +UPSTREAM_CHECK_URI = "https://metacpan.org/release/TermReadKey"
> +UPSTREAM_CHECK_REGEX = "TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar.gz"
> +
>  # It needs depend on native to let dynamic loader use native modules
>  # rather than target ones.
>  DEPENDS = "libterm-readkey-perl-native"
>  
> -inherit cpan
> +inherit cpan ptest-perl
> +
> +RDEPENDS_${PN}-ptest += " \
> +    perl-module-test-more \
> +"
>  
>  do_configure_append () {
>      # Hack the dynamic module loader so that it use native modules since it can't load


