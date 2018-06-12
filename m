Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE2578DD3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 16:06:10 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id s13-v6so12905252uad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EJ0BGrE4NEnVLeywQI0IPBGKfxoxe6EKInEvT247Slk=;
	b=Kt/4AbfgYxo3c8TEJH4dKZ7/GDN8zSBscpnJSd8cfrWfHLup4bjFHgdrwXJ7ZCvsZS
	3jj3bLCYivuQxFP/Y2B3xdEYIbr3h5OE879zretrTP1hRKlN+h1iYpZ5OYmDCCB4fRz/
	cUPajHUwQNN0XItpQOj/h+pLVo9Gn4N403m+AjQiCbZ41lhbsbIvh6bL/1RO9On0djPV
	yGXhCq7/op7HVC1L8Psu21VnIgN2Amd7uJSJmJ5F6jV8HbaEWaJ9G72Wha4++LHnWFDD
	8Fxy2/qML1vhc67LKjho84r6u9rqYSXw6Opl2mk2w0eu85GE9sBeQeOEQgvOuORsNOep
	36dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EJ0BGrE4NEnVLeywQI0IPBGKfxoxe6EKInEvT247Slk=;
	b=RKY7FnGxJ7tdItkLzig9QQALKyhlj0BgxzW4+MTnrVnRKzyQp/U3/IB+wgg5kzQ8kb
	LNMwinfh5WTkoXZNKh8Q4I73c+bIEuom99xOhYZOf+xoEcLg/1yY8cUQlntSDj0R6p0u
	PyNAfgu5IW3kL52EejWBYfX1JTzi0IEa6zfvZ06Jemdn3y3inzTeuIsqI99aNmoCZqyM
	WSIyqRqDTjfs+4+3lUB7BRQJSOj+15k+KJV3L1yVMc+lp+pYvwJIfge2CIDywetHWx6E
	EqXbq1cFekNssw5zUcRapGVQeoXI5ygviOLURaZf9UYYLmasbLIq6vG1MFgGY7gdtvpu
	yI/Q==
X-Gm-Message-State: APt69E01GkcNf2MboFWAuGZO53uWcp9bZkFo+Tqdi6Bc36SSdom24JnB
	azam3b5v05jd6r1W2gebfSaYLPX5kDq+d6Yi+rw=
X-Google-Smtp-Source: ADUXVKK/WF7FPRXyawifLlr1ILUKVmO393OI32zbHW+C9k0Td6RINv/ll9a6S9LR00aza7SQjzH8UDsI/rTdormSdnQ=
X-Received: by 2002:ab0:304e:: with SMTP id x14-v6mr768515ual.80.1528819571082;
	Tue, 12 Jun 2018 09:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180610005105.4153-1-dev@sashko.rv.ua>
In-Reply-To: <20180610005105.4153-1-dev@sashko.rv.ua>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2018 09:05:53 -0700
Message-ID: <CAMKF1soOPBiTKYnUzk6N6MN3ofuY2D2i3xMGCph9YYU49VrCqw@mail.gmail.com>
To: open.source@oleksandr-kravchuk.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@sashko.rv.ua
Subject: Re: [meta-oe][PATCH] libsodium: update to 1.0.16
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
X-List-Received-Date: Tue, 12 Jun 2018 16:06:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 9, 2018 at 5:52 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Added link to bug tracker and updated md5sum of LICENSE, which has been
> updated with the copyright year.

The patch seem to not reflect this. Secondly, It should have updated
SRC_URI checksums too which seems missing as well.

>
> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> ---
>  .../libsodium/{libsodium_1.0.11.bb => libsodium_1.0.16.bb}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.11.bb => libsodium_1.0.16.bb} (100%)
>
> diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
> similarity index 100%
> rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
> rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

