Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 30E0A71BB9;
	Sun, 21 Jan 2018 08:51:24 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v71so11118782wmv.2;
	Sun, 21 Jan 2018 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=01tQEh5hBvhwAfAZ31lci5rsd290qzd9mfBPkZl1izM=;
	b=gty3E7INJLFmjleTKn2zle3K+fw4rfu19buPCKfLou8BsMSqjF/ObmMza09ifbB5aC
	11B3pgDCNJuqTOm7EjJvIZpI/pbfhgV/8XbNdceiApY0bxE/+ifZguwZre2JuTP49Lil
	/GFkarEOWaIF7qeqHOKteK+jRCzfzM7fEbwQiZM+UMETBCFOOM8uWKC4xhTl+Rn4vQ+/
	Xo2fqicHYyIRuIFSNMvhgLEzxnWZzvK2mzMEYR28Dpr92QDccbv+VgzHfKsmfjWOm6Xs
	hs+5NIr4KCPA8bNW3VhkMn8K2wcpuQo62hjIAAwj1prRq7ujzvxfT5H2o15BpTTdVq74
	yLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=01tQEh5hBvhwAfAZ31lci5rsd290qzd9mfBPkZl1izM=;
	b=MH8NNH7fdPeNYZ9WW1VmWjNm/V1TntyV7Q+XizljqZgoiwUPLSDvHv2kmR68H/0NiB
	pCmuMNQKuH3hyiwKlGDVPhXYPibYEXM8wiDQk0C9ekXQXqM/rLxo5QFSdUqOYtZ1tZ8s
	N1vm+mNMw+IRUHsdLvlOgRt9n9oFUeVSehmRNRGlRWA88T4ROFwcaGfxWZOI/bATHol2
	XdUcVt6ZfGBdJn/vEVjDFw9DUdypSKZrACrUQ7F9b5DMHKSbff87suHvBKGaODy/v1Dx
	Wj6QT0DMnWsQ2GGgJy0uyWoZ/X2RJ/sElcU6C4jTy2ePkyojmqtlkvHAmnZeHaIxdaDG
	f6Aw==
X-Gm-Message-State: AKwxytdpgeZpbR0Mi1HK5IBnBX4OhhCdubwS5KBnHdDomBsmJJ9Go04l
	seTA4mqTnbY+gmIUsvVXL/R2ZG9jsAnKUrb7n+c=
X-Google-Smtp-Source: AH8x227QgzzegoNDVXuihMDqeA0AxQbtZq9+ivE4PX0uu/4JA1+yFduWnGs/Pfpm1lCALrTIJGAufJwQf9TfCBrI0dY=
X-Received: by 10.28.74.141 with SMTP id n13mr2353296wmi.81.1516524685630;
	Sun, 21 Jan 2018 00:51:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 21 Jan 2018 00:51:25 -0800 (PST)
In-Reply-To: <1516492892.24502.50.camel@linuxfoundation.org>
References: <151648740023.29293.16416809305382382616@git.openembedded.org>
	<CA+chaQcFLf+SuwaPq+Jg=8B11w_StoWE2iHzXjXDUynT8MyqQg@mail.gmail.com>
	<1516492892.24502.50.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 21 Jan 2018 09:51:25 +0100
Message-ID: <CA+chaQfJoeACB6+1KbM_+x1daYt80LW5Rrv3AOco4sFcURhpdw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] branch morty updated: image: Expand PV to avoid AUTOREV parsing failures
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
X-List-Received-Date: Sun, 21 Jan 2018 08:51:25 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, but was it really pushed?

http://git.openembedded.org/openembedded-core/log/?h=morty

still ends with:
* image: Expand PV to avoid AUTOREV parsing failuresmorty Richard Purdie 10
hours 1 -0/+2
* libunwind: Disable documentation explicitlymorty-next Richard Purdie 8
days 1 -0/+1


On Sun, Jan 21, 2018 at 1:01 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2018-01-21 at 00:51 +0100, Martin Jansa wrote:
> > This causes:
> >
> > Exception: TypeError: getVar() missing 1 required positional
> > argument: 'expand'
>
> Sorry, fix pushed.
>
> Cheers,
>
> Richard
>

