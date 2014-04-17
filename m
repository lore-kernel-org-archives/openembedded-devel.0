Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 302A465D2C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:42:30 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j17so13433445oag.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 18:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TZ8628j6dU2TWowo3/wTl0luFrH8TNcPTkwUcNDq8TA=;
	b=FUU6SO6or7KO1Pq8Kk+LRDtcFpm6ugKpamPO6ZjVdeg6B1Q4Y/NK7NCJgvSH/dmu1G
	WPLVmND6b2FT+3EnYhgD6GffoEP97fYbFwdaFwDs8zVW8nzRg3wLB4kpI7nGq/g4zSCE
	R9JHiw8KY8wVU8wzyQLdWB64IzJZcyS/4z1dQDPI/ZTnOmTQ6G56dxjun3JTG2Lc34KH
	Dce4VaOpcKo2b29kPYkXrK1i+809Oola3z8wRPgVyUa/ZHbctgEVtj1rB3X0llafcSSt
	rotsi2SXAw+/JpZfD5drZXOw0BZi7MjipqzZngLyB4jJ8E8xD5hz1XtDxp5bLzo3WyR8
	lZZg==
MIME-Version: 1.0
X-Received: by 10.60.16.103 with SMTP id f7mr9400561oed.8.1397698951201; Wed,
	16 Apr 2014 18:42:31 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Wed, 16 Apr 2014 18:42:31 -0700 (PDT)
In-Reply-To: <016b01cf59dd$003f8100$00be8300$@lge.com>
References: <00d101cf5942$91feeb30$b5fcc190$@lge.com>
	<CAMKF1srO8NBNuYbMhbwUO3df8+Q3aDoUmzHUinDy9V_WKuBsRA@mail.gmail.com>
	<CALYKT1hwGK7c9QcXMRXpMPLbP69zoa_49QBhZXpOaYec7geVRQ@mail.gmail.com>
	<016b01cf59dd$003f8100$00be8300$@lge.com>
Date: Wed, 16 Apr 2014 21:42:31 -0400
Message-ID: <CAFZh4h8FbND2paS5wjPZ_mYmYhnqk1ng1biUYHnEOsh6tYQG6w@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I get the toolchain?
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
X-List-Received-Date: Thu, 17 Apr 2014 01:42:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 16, 2014 at 9:33 PM, Changhyeok Bae <changhyeok.bae@lge.com>wrote:

> Thanks for your help.
>
> In summary,
> 1) bitbake meta-toolchain
> 2) bitbake [target] -c populate_sdk ...
>
> However, those were building ...nativesdk ...
> I only would like to get the cross(arm) toolchain without building SDK
> toolchain.
>
> Regards,
> Changhyeok
>
>
... those do build the cross sdk/toolchain.  You take the huge script that
is generated and install it on your PC, source the environment setup script
and now you are setup to cross compile on your host for the target.

Regards,

Brian

