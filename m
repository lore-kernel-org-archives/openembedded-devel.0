Return-Path: <ian@boundarydevices.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 948CD605BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 07:17:44 +0000 (UTC)
Received: by wmec201 with SMTP id c201so226954wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 23:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=V7yW6Xxv+DRR9NIOpON8BoNf1l9H3avT2m8xHSiKsRk=;
	b=EIF/uJd2Nv+RLhXXoREoAerkJQValFXO9+XM2xQ7aUu5lgyHgTo+y0/euZ3OVYaK01
	elGo7DAe2dDIEA1rm/0AMkhoZVN/8lr+S468IzSeRBHVlRqJeoP6lo3CrcLpLxZCace3
	H8/SRtMp/1LFZ1cKxl+kcIC4pX3mqeuqqafFaIr3yz1pxL46iAK7E6woULJaAuOrIxEY
	era5gQbHGiUZuXCzoY3Nx2PGG9flpGHC65JMjhtZOI2tlRIBHWMXm5xtQv5M41f/V4tt
	iRVkyYZnI+/X9N7PLKYCcl1UTzdoSPLVGdcGpqwg8UlbaJ2daLT4MNPSAIwYIISkUlI0
	m8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=V7yW6Xxv+DRR9NIOpON8BoNf1l9H3avT2m8xHSiKsRk=;
	b=SUWXq5gpzsiYnV+e8Yu2wAGYqstfgQy4VzcX/SkjGdXiCvccyiv7umeUmZRNP8h6IJ
	zJGek9R0PNB3MPF7ZODpZ8oC/fd4I8RwKtNOavJUbb1BEUHH38fY1tMaQENlGcpCEBZD
	TtKm/6lcictiVrqAs0z42h9PT1EIYJF0eGx41aDGHMpY+FnQuA0DNMsCq294X4eF2IBZ
	S4QjzPtgfraXi+5R/YCl6aFcizPgQQpsqkGK+w8o/+wgEBeFIgqgsnl7WB1jULOl6Amo
	XMOU5CrnqdN/RudoPgSampRuoqJ4KjnC77sA/13y077WRzrYpZPkk6UwVes3HSz5WZ0d
	JwxA==
X-Gm-Message-State: ALoCoQk2DB1BD6ReghL4I2rUe7hCKOpxl/a9Iv5ftGN7YgSkebR/Rl2BR0X2/rJcLjzuIKVsTbnz
MIME-Version: 1.0
X-Received: by 10.194.185.234 with SMTP id ff10mr77306731wjc.170.1448954264506;
	Mon, 30 Nov 2015 23:17:44 -0800 (PST)
Received: by 10.27.110.18 with HTTP; Mon, 30 Nov 2015 23:17:44 -0800 (PST)
In-Reply-To: <CAP9ODKqR8SHDGvqUs4v82mTpPbFSSm_wd_mvE5H9QiCg23ScpA@mail.gmail.com>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
	<CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
	<CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
	<20151106171738.GF2550@jama>
	<1446839474.2527.7.camel@Saturn.local.all>
	<CAP9ODKqR8SHDGvqUs4v82mTpPbFSSm_wd_mvE5H9QiCg23ScpA@mail.gmail.com>
Date: Mon, 30 Nov 2015 23:17:44 -0800
Message-ID: <CADseiPmXNcnsCaYsEi_oW-ujY3Q6EWVE1iz5tm=WYt0wULt5NA@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Tue, 01 Dec 2015 07:17:44 -0000
Content-Type: text/plain; charset=UTF-8

I'm getting segfaults when I run google-chrome on my nitrogen6x after the
new updates. Compiles great, just segfaults. Anyone else noticing similar
problems? I'll be digging into it more, thought I'd reach out first though.

Thanks,
-Ian

On Fri, Nov 6, 2015 at 11:58 AM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Fri, Nov 6, 2015 at 5:51 PM, Max Krummenacher <max.oss.09@gmail.com>
> wrote:
> > Hi
> > Am Freitag, den 06.11.2015, 18:17 +0100 schrieb Martin Jansa:
> >
> >> After long time first successful chromium build in bitbake world..
> >> Thanks!
> >>
> >> Can you apply the same fix for cef3 recipes?
> >> http://errors.yoctoproject.org/Errors/Details/21442/
> >>
> >> cef3 for qemux86-64 doesn't even configure:
> >> http://errors.yoctoproject.org/Errors/Details/21501/
> >>
> > I'll try to fix this.
> >
> > It looks like this never worked for x86-64 because of a missing config
> > file.
> > One probably can reuse the i568 one.
> >
> > There seem to be additional errors to the one fixed with the packages.
> > So
> > maybe I won't be able to fix it.
>
> Send a complete patchset and we apply them all ;-)
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

