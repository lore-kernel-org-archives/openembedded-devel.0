Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 207F96FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2016 17:12:38 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id hb3so13837955igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=PtaAy+iBxAQDuDOEH52HpHy3ZllAfVnuMcQ27/+8FJ0=;
	b=QUxl9zCYHV2wNydkhYS3apuCAJtPkABN/EGdRZlthmtjopfNsfwq/KieBfbU/qHHwu
	FNeNNasnxLrNtEKvSVmgKbjyY8iTlTaId4g51EbTlFxR49rY5nfuP77vV+qd2tqyY4I9
	iJZ7oen53sIhOtw7kWDGLzANMkWmkI/8VrfPNFH18StXlgxk4OIePq9Breetse43zI7e
	LP+DqWh+8AeHI3vsIijFCnUGanYhAUUJPUiSUzs9mdJ299TiewwDrcNPdV8QIiLUFiya
	6iaRaCqO5k/hPgoR1k+uORALK9fII/DVciIMvtg9N+b4CkgjMZBTih+4Q8G5NFDDG+F3
	pvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=PtaAy+iBxAQDuDOEH52HpHy3ZllAfVnuMcQ27/+8FJ0=;
	b=Vi4Ltnkzp3vl56Cn39sHu4p4FOIdDXDq5DOjeOkf5eeRayn2BNe0Jo39ymMiNXMT/m
	CpvkgTxbcAH81TRT43IBi1B5Us1N3TnPGRA4yIyVHxas5DqvFH5G/L++oHHLfpTPeKGt
	7kZvqXnaLumII475mfhIfntla8I+aBJKMZfUyCecWoFZNBs6KzPBv6guaaezXqprYq0u
	awa0td/N1hU7Bcre2J5DuwzZYqWmopzmkXIpRdqPsZ1Za4pCZfi4iVY4UJfGgqEoPUp5
	S8GuVaPZAMlDHjdZvt/OnP5imkBaP9FTjkNdYjGw4MM1s5UfWx7kBg8MlHtAJwYG5rZT
	b22g==
X-Gm-Message-State: AG10YORBteHYqLthOi9FJWR85QvZCOS+gOPQ99MPootG5Dk70J2Px0cg1akSe36CZ9dVZ6QK0Y3LKhi6VDPjJg==
X-Received: by 10.50.132.40 with SMTP id or8mr4228596igb.47.1455297159523;
	Fri, 12 Feb 2016 09:12:39 -0800 (PST)
MIME-Version: 1.0
References: <45119797-AAEF-4ED3-A274-A23D25F85FD3@dominion.thruhere.net>
In-Reply-To: <45119797-AAEF-4ED3-A274-A23D25F85FD3@dominion.thruhere.net>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 12 Feb 2016 17:12:29 +0000
Message-ID: <CABcZANnwOpo8AMYoPCo6w1zEv26xqK__=W12mpha_1hac4T7Gg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Kodi 16rc recipes available
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
X-List-Received-Date: Fri, 12 Feb 2016 17:12:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2016 at 9:23 AM Koen Kooi <koen@dominion.thruhere.net>
wrote:

> I=E2=80=99ve managed to get kodi 16rc3 to build (and work!) on armv7a and=
 x86-64.
> The recipes can be found here:
> https://github.com/koenkooi/meta-dominion/tree/master/recipes-multimedia
>
> It needs work before I can submit it properly to meta-multimedia. The
> problems I=E2=80=99ve spotted so far:
>
> 1) No libva in oe-core, it should move from meta-intel to oe-core.
> libva-intel-driver is fine where it is.
> 2) No vdpau in oe-core, it should move from meta-dominion to oe-core
> 3) It runs java in do_configure. Since meta-java only works one day per
> year we=E2=80=99ll just have to install it on the host.
> 4) OpenGLES is broken in kodi, a fork has fixes.
> 5) Wayland is broken in kodi, a fork has fixes.
> 6) No PACKAGECONFIGs yet for weird media accelerations like openmax, imx6=
,
> etc.
>
> and the big one for me:
>
> 7) no hts add-ons available. pvr.hts needs ${S} from kodi, but uses cmake
> instead of autotools. I might just partially copy/paste cmake*bbclass int=
o
> kodi_git.bb to make this work. Needs more thought and less cmake.
>
> So if you have an x86-64 box with intel graphics, great, everything works
> as expected. On ARM you need working openGL, so that limits you to
> snapdragon/freedreno. That works[1], but no accelerated decode.
> If you have non-intel graphics in x86, have a look at what meta-dominion
> and meta-amd (thanks Kergoth!) do, I have it working on ATI and Nvidia
> cards locally.
>

To make sure credit goes where it's due, I didn't have anything to do with
meta-amd, that was other folks at Mentor, IIRC primarily Sean Hudson and
Drew Moseley. They've done good work on it :)


> Anyway, if people want to help out with getting the recipes upstreamed
> into the right layers: awesome. The biggest hurdle named ffmpeg was remov=
ed
> (well, added into OE, but you get what I mean) 16 days ago, so it should =
be
> relatively plain sailing :)
>

Nice, looks like you've done some great work on this :)

