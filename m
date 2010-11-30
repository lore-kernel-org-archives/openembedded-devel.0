Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNL6Q-0005xc-JU
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 08:58:19 +0100
Received: by iwn8 with SMTP id 8so4187368iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 23:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gx82i/D1f6GgW5P5vLHMrZW+u4hAcA48hBdcOcFYDJc=;
	b=kvil4hQuzh9R8KX0TQ/a8e7Q3ETcbBPXqRMnh6pCqIo631O943D+w1VJRvxXSO3jU8
	96pqTCpM/vBXOAPRgPpgjoDfG2mWrptMopSAMuUsH3tDlsKZF89c2+J9z123rQ1NS2Ke
	lRDX6F1hI850GrlsyXQfbiGCm6Z0JpxT+TtbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aser0AY7pKNX6lpGlUD3a1MM8ESc6f7w8LfLquESmWFo/Atf5QFksp7VsRuJdRHU1D
	nhDVqtmAyhKRwNHcoi1Ap7RAhsvQmX4P4EcWR9beIN/B0GVObfdohC4NHYUlUFwHvZjD
	YysydQ3bmA51N3G2xruh01rjlVeBTsCPzuMs8=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr6930881ibc.7.1291103815101; Mon, 29
	Nov 2010 23:56:55 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 29 Nov 2010 23:56:55 -0800 (PST)
In-Reply-To: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
Date: Tue, 30 Nov 2010 08:56:55 +0100
Message-ID: <AANLkTinqmryB1Ofe2gDV959h2cLbLkrC-ZohbgrPMicA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Nov 2010 07:58:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/30 Khem Raj <raj.khem@gmail.com>:
> Hi Folks,
>
> Please update your release branch to latest tip and rerun your builds
> and other tests that you have been doing
> and indicate any hot fixes that we need for the final release. Again
> update the Testing table with the results
>
> Thank you
> -Khem

I thought I already mentioned this, but we need from master
	95035fb93f662b8036e1083a7a834030b4b98041
f2a9c8045666402811c4e5adeccb62ee2042e0c9
	f7403d0b48339483fa02e4042d2c70b992228beb

Without these the underlying recipes (and my test image) do not build.
I also strongly suggest doing clean builds with a removed downloads
dir. After I did that I caught the ones above.

I'm still working on a php issue. I hope to have a patch soon.
The bad guy seems to be 	f6fa9298359781393ed2466c45cf42da56068bb1
After this patch it has build several times for me, but recently it
did not (even not when revering to just after this patch).
php*/ext/iconv/config.m4 seems to be the bad guy by adding
/usr/include and /usr/lib to the cmd line, but with my m4 and auto
knowledge it takes some time to find and fix this (the value of
--with-iconv-dir does not seem to be used).

Frans


