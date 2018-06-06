Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id EDCE074BBC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:14:23 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id y20-v6so7149681qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k9U3kJ58/0gbaaigZdfY69b+V7EAEdEOmSKR5mI71QI=;
	b=mV3xbe+zlzCDeKPF2buSLfzz+ALMnaDz1kBUkWfxrXJ3+BBoC1QFQWwxQrECAyCxtO
	7yKRcO8KyQzquBvkvLUxnCYgBZuhj4JQBsQNaW0owqbxRJiqNTEz3ccUodUaw1ChEWCv
	Vg5R4YACSNwGplr1Q1iU4OGbKKPiAqoZmCWDmLFWzc59hLNgFJeaqCc+nZks11Mlij6o
	7N/HM4O0Z/+nAfKc9dIsZgRjjjay4Yb3kesm93nJrZTYSLNqvzyErOlctbq411NX6Cnv
	vDWmkr7LfZYlKGKNWSW3SEml6wA1shSfgIfEgp4Ul2rtS+ebFYreKvdU1JuqKWHkmrFW
	S0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k9U3kJ58/0gbaaigZdfY69b+V7EAEdEOmSKR5mI71QI=;
	b=ISCJjBvVlvy/2u4tGYjNZu8I9lVyTT4Uy9fSw95Dybo5AAamScFeiXmaPx7lX7KYnn
	IEHsiAtqxjTrHYOEqrjpHhQ+7J1f48g9qUunqFo/tgLt/wPc08O5SJ19yWUgTL8w/4K9
	JyGG7z1naKbuDA1l8yFhMUXyMRoYBcfxxe6C2klJ5tTgek3QzNqH/wQzKaJRVaXTGWOh
	WnEnj9I3FdD1fBWZICqRNo2UHTxMaFQLA//lpN8qlZOrNDlk8tQMJ1TSotehwYwU2jf9
	65c+cKLQM1gYOZB0aZNl12MDPxG0bOFZI1vnpHBbqXyvCv5H1pEhv+9rCOdqvASmZniF
	0rtg==
X-Gm-Message-State: APt69E3uqUTxthfWa2JdpB/I92nnAbnWFoicJs0rctcBU0tHLq+rHqhg
	QHs9XLrKnSuJSrUJxAfuelW0Kw/B+aJBaNy9eYI=
X-Google-Smtp-Source: ADUXVKJncm8VxLWQRJ9lQFhaHfn9aP2ugbgLca2tAyhhFJvCiez3euJF2R8JKBH/NcFGviyOaKOEtkFAvFkvObfpJl8=
X-Received: by 2002:ac8:70c9:: with SMTP id
	g9-v6mr3694698qtp.376.1528305264711; 
	Wed, 06 Jun 2018 10:14:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 10:13:54 -0700 (PDT)
In-Reply-To: <CAKpvFF1BbLmk4yhas7BRcN1e3tX1AcyGbOs0EpNcxE+kBtdX-w@mail.gmail.com>
References: <CAKpvFF1BbLmk4yhas7BRcN1e3tX1AcyGbOs0EpNcxE+kBtdX-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jun 2018 10:13:54 -0700
Message-ID: <CAMKF1spQ5vRByvaOh6XYj7AUzMyPdQGw19=TQTtsFtLCu1BH8A@mail.gmail.com>
To: Stefano Gurrieri <gurrieristefano@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: xscreensaver yocto recipe
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
X-List-Received-Date: Wed, 06 Jun 2018 17:14:24 -0000
Content-Type: text/plain; charset="UTF-8"

it seems its using -L/usr/lib which is causing cross compiler to emit
host target contamination warnings. You probably want to make sure
that these recipes are
ported over to work well with new layered model of OE, since they have been
part of classic OE they might need some love.

On Wed, Jun 6, 2018 at 12:02 AM, Stefano Gurrieri
<gurrieristefano@gmail.com> wrote:
> Good morning,
>
> I'd like to using a XScreenSaver program on my Linux embedded console (based
> on i.MX6 solo) with X11.
>
> I didn't find any recipe under Yocto (currently I'm using Yocto Morty)
> except this old recipe (2010) in openembedded no more maintained (maybe).
> Below the link:
> http://cgit.openembedded.org/openembedded/tree/recipes/xscreensaver?id=44985d56bc556786812a0a02d6219afd31a7381d
>
> So that, I'm trying to use the version 5.07 in my Yocto project, but during
> the configure I see the error below:
>
> ERROR: xscreensaver-5.07-r0 do_configure: This autoconf log indicates
> errors, it looked at host include and/or library paths while determining
> system capabilities.
>
> In attachment, you can find config.log
>
>
> Someone, could help me?
> Possibly, does some other similar program exist under Yocto?
>
> Thank you.
> KR
> Stefano
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

