Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id A9CFE607DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:32:31 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id c21-v6so8098658plz.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qovPillsXi4D73/KfoHQQBk2+uaEjQIVJveGMvpqX9k=;
	b=GTLjccm9Ypjn7yFQkG8/8jJoK4GoXcEOQ8QpAPzf3I0APWwqGYUY8NFtAdYd8HdKk0
	WOMbLUaFcZzvlYgTR4vEagGcqczZshXdP7pspsgMlKBFZ3hsn7rJwgN6rnUGBQy6xnSf
	7FLrqIttW95bf6vOTrNp70PwdP7G37qbmPNGGkB7FMZOaIb33LRoaFBE2R3koMObGrSb
	FWflVEL4aJa8rMwZJBcZ8rYQUg/zukdLQDKesGeZvvqvXbPHyT5NDnlOP2qPLy4Px2qh
	efEoz/oCHoQ6vnjTt7rLLpakmu7rCRsoqCh/AQjG4+5K2SU6fYpoOc4LMyXyNkJNywVv
	6++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qovPillsXi4D73/KfoHQQBk2+uaEjQIVJveGMvpqX9k=;
	b=HF/8J1Qc7rMYXPv3m24/eL8Zwwf8GMZBtjlmjhWcJnp81eLKM9BIfRiRRxfPargl0b
	KZjYTp8echalAPiWsOfCiX4WsdlNKXdy+jW8+yeuaYJ0I1Smmft1yL+MR0qIWrbR6o+K
	5n7afgD5+I/9aH0oHJ5mYyRgcSn+0j7+DZpjGVp/OD4O8dma5VI4Q5Ac7jTSWdDoRRFV
	jTo9dB6GPGpzrp8o8PuIKnc0L4e7JKygIK/DXbHhx+CC/V98KA0v8YIVNY7zf901WaSD
	2mH3w2cefViLojNdPAUG+UT8Xf7mKRqveJijgNOca+s423xwuI8EwCVTOvGTZ1c0uGLD
	NsDA==
X-Gm-Message-State: AElRT7ENLnS8hcy7M1B7vU6JqVZ+Vp7G2JvMjKknbOxv9HAvo8UPqpg0
	MN1CTa3DaJ59QSywGQ8L1Ev0xQ==
X-Google-Smtp-Source: AIpwx4/un+3vLeQur9pshLYXO1iyldKiG+THMuIJ5kp11SgZyl4QCgUteAx4qboNylYk3qETb7lRrg==
X-Received: by 10.98.93.149 with SMTP id n21mr12392732pfj.222.1522805552193;
	Tue, 03 Apr 2018 18:32:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a4f3:7c10:9123:63ea?
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	133sm6946888pfy.113.2018.04.03.18.32.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Apr 2018 18:32:31 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180403231601.5329-1-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1a96ea45-d89b-a5f8-ff6c-23abcbb96303@gmail.com>
Date: Tue, 3 Apr 2018 18:32:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180403231601.5329-1-schnitzeltony@gmail.com>
Subject: Re: [PATCH 0/2] poppler nightmare
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
X-List-Received-Date: Wed, 04 Apr 2018 01:32:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Andreas,



On 04/03/2018 04:15 PM, Andreas Müller wrote:
> Not convinced that I'll get support at poppler project. Let's see what
> autobuilder says. If it fails, please unroll back to 0.57.0 - I am sure
> that disable glib causes trouble for evince.

this didn't make it into the current world build. I built it @ home a
getting the same errors:

|
/build/build_artifacts/master/tmp-glibc/work/core2-64-oe-linux/poppler/0.63.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/7.3.0/ld:
warning: libpoppler.so.74, needed by ./libpoppler-glib.so, not found
(try using -rpath or -rpath-link)

- armin

>
> Andreas Müller (2):
>   poppler: Rework patch fixing do_configure
>   poppler: update 0.62.0- > 0.63.0
>
>  ...0001-Do-not-overwrite-all-our-build-flags.patch | 36 ++++++++++++----------
>  .../{poppler_0.62.0.bb => poppler_0.63.0.bb}       |  4 +--
>  2 files changed, 21 insertions(+), 19 deletions(-)
>  rename meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb} (93%)
>


