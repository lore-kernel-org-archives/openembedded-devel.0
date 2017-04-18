Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDAB71A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:03:07 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id o21so102078405wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pobraeaoRZkM5+ka/tYzKbLqGTPBgjvv7nzbaSb+fUU=;
	b=WHMOlMFVE/VXZMKc1YCrR0aAUSNRwlUOhfEyZqqavUVomkmE/zqTV6r3m7A+qI3NCE
	JB94A09GFtqvSgOljub3XoPBjMU8TW2TYc99hcVPRMwjxEMqkiH7sOwQVgmksKVgDrxt
	QClQ2eBn+wOlQisRi0F9+p/AHU38uwUpP60p1mXToFlfBs9ywOiIaDWrBWQhQT/NNMc4
	3W0MPE/OwQZPaoXlY87FxoyasfCsP0oLdjX4AVlknMnaBDqEisyfQSbjjklhi8o4qe+l
	13oA6RBlxVR1xo7GBN8ppbeuJw/RcW5raB810RmAsQhHRsHtlAyCg2hkHPTNSLaSVRlb
	5itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pobraeaoRZkM5+ka/tYzKbLqGTPBgjvv7nzbaSb+fUU=;
	b=Sk8GB4nDONavljLoXS0PdsDLLgXhkr8Qt1A+PWH3OfikQtmXcWtLgkcduB72eKH7a8
	2jauX6U1EbzcMnlOqK7Wier7iqTNu4xMrzqm38eMEsAEAZOzV9yz0k7adZRp/ocMSrzB
	DMB6gyjmnqg9h/YSGofi9UNvKEUmfgK2Nddim3rHsQVj80M563bKrC0lre/4clzzhT5c
	rRwrl/mSewUWZ7arvlvflWW7+s9Nzx6SzANqA+mfyUwkfNu2QhScsvq7in7bpfJoI13m
	RvgE/sZhJhmAie8sMuGa01e7l5e1rcvAWhEsYWbvJF2VtS4tHVdtyfDicv33J0TW1NX/
	qK9A==
X-Gm-Message-State: AN3rC/7kR9bt5xVE1KC6TSoBG0yayWVwZuM8Nqz+CNHn13YuYCWky6WM
	2RLpDZN+hH6TlZZm/8RZ+5qXvp5H8g==
X-Received: by 10.223.136.165 with SMTP id f34mr22212049wrf.145.1492520588693; 
	Tue, 18 Apr 2017 06:03:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 18 Apr 2017 06:03:08 -0700 (PDT)
In-Reply-To: <20170413204106.30679-26-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
	<20170413204106.30679-26-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Apr 2017 15:03:08 +0200
Message-ID: <CA+chaQenX_NsaTFaL=KBjM=VJwFpkPbOAYzzDD-L7cXHKve7=g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][ 26/29] mosh: Upgrade to 1.3.0
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
X-List-Received-Date: Tue, 18 Apr 2017 13:03:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

for some reason all of these patches didn't make it to patchwork, e.g.:
https://patchwork.openembedded.org/project/oe/patches/?submitter=&state=*&q=mosh&archive=both&delegate=

Can you please resend them again?

Regards,

On Thu, Apr 13, 2017 at 10:41 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} | 5
> ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb}
> (93%)
>
> diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> similarity index 93%
> rename from meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> index e4d5b69bc..9fc8435ee 100644
> --- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> +++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> @@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> d32239bcb673463ab874e80d47fae504"
>  DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl
> libutempter"
>
>  SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
> -SRC_URI[sha256sum] = "e74d0d323226046e402dd469a17607
> 5fc2013b69b0e67cea49762c957175df46"
> +SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
> +SRC_URI[sha256sum] = "320e12f461e55d71566597976bd944
> 0ba6c5265fa68fbf614c6f1c8401f93376"
>
>  inherit autotools pkgconfig
>
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

