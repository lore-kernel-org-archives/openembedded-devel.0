Return-Path: <ayoub.zaki@googlemail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAD6785E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 11:35:45 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id x140so10591107vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VYBLcfZxQghGeKnU1vOxMpm8p+AsUMIKZV3rXfO4l4M=;
	b=veEQqyT/k0G5ZR/xbAuP5rECRh3fKeQmnC6lgsewXv3vh/+tuoqriIbduXhOqScfc2
	pIJIlen3KJ20JfxdxIEJbfqTckCBqRw4Xk2VsCySmKNWfld7nqOAne7LepyDbsIpBJd9
	fepzZPv6fDuTtkGL2/N6ijsZH7fv/31nFBH+yndReTKlYEJr/i+jjfhHenO+LEnKZ1xp
	h473WPnep535F037lUkpv3P72tmddakUMzkfZ3y2lf1sBaCIlzJqpFQQ/2s7x/bIxNnu
	/Uk63eDl3zIyaOGHfV7n9Jh9ylqc70bu18Z4QrEqmMofR/lSUa8dmtAxnW2adIUkOEL8
	0mzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VYBLcfZxQghGeKnU1vOxMpm8p+AsUMIKZV3rXfO4l4M=;
	b=kopy271s5ju0tTtRxAqgnQGX2HplcuZ5caN4wEEAEZ0bpSm4oojCdqLLXcGfq1Gak0
	HtH5FIDVAUSZ1zVNTLoRF2F+hKurPf9WOd9kxY5iiAseEWM+JcDE09OIGXnBNEDfu+L7
	yz5XEVJHcbDCeczFzj5RUBiVlbZ3SjlaTllDYdDO1GoeOE0Y33iPdVg0r0EZXW8XBRya
	VXNUwccf+38/ygnW9/oIjeSMi5y5s0kFNRO8wDo10pezqaGhdn5U2YBiEhCaQgU9Kmh6
	23+qgS2eaCGl+alqgtL9a+pUiobfpRowkM60UQzWOTL1Gx3maqCnig3w8SwcCO7Qbz9o
	iexg==
X-Gm-Message-State: AKGB3mI6g041JGT2q3z5QyhGHmefwrXW2sjKcn4kK+UDJMCXv5Tpj6n2
	SBarKvsaK3Ep53x6vnmYyMZRJEe9TkgIho/JT88=
X-Google-Smtp-Source: ACJfBotFVK+EXlakb3P7gqXBlT5FQjJrB2BbPZzVFvYX/A2sCOmSetCpHNCznR/rUY4CkPs0BhVwgMPTMhP7iBInn18=
X-Received: by 10.31.175.141 with SMTP id y135mr95615vke.36.1512992146737;
	Mon, 11 Dec 2017 03:35:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.67 with HTTP; Mon, 11 Dec 2017 03:35:46 -0800 (PST)
In-Reply-To: <87o9n5a4dk.fsf@rkubodac-desk.ger.corp.intel.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
	<CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
	<CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
	<87o9n5a4dk.fsf@rkubodac-desk.ger.corp.intel.com>
From: Ayoub Zaki <ayoub.zaki@googlemail.com>
Date: Mon, 11 Dec 2017 12:35:46 +0100
Message-ID: <CA+-BmJakBB5Pk72M1eMSS19U2-SDtw3gRfHuSYwG9Yh1wjqBBA@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Mon, 11 Dec 2017 11:35:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raphael,

Yes you are right, it  built better with using rocko branch, now Chromium
is up and running.
Thanks  again for the amazing work :-)

best regards,

On Mon, Dec 11, 2017 at 12:30 PM, Raphael Kubo da Costa <
raphael.kubo.da.costa@intel.com> wrote:

> Ayoub Zaki <ayoub.zaki@googlemail.com> writes:
>
> > Hello all,
> >
> > I'm trying to build from the latest commit meta-browser:
> > a8bb1e779bc3565beacceadc4414816670f33475 with an imx6 using yocto pyro
> > branch with meta-freescale, however the build fails :
>
> FWIW, the errors reported below seem to be coming from Node. I guess the
> node.js version in your pyro branch is too old and does not support all
> the JS features present in the Chromium code.
>

