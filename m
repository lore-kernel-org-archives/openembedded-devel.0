Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id B4DCD7FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:24:26 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t26so8893984ioi.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PE33tzWuRkymi+mcaeJxqdUceH9vB07yQMN921BU6MM=;
	b=jvSmmuF/sUqBsAjUGk0g4Rz/SpFcyS9qdoZwgSUWUQ4RbmqPKcmunNc3PBW82FJn6O
	WoMDyhTjaKQrvkP24OTY/zUbN2HYeb/fgot/Z4CJfRAzzTh9992TJymQxbJHh+djCqag
	55yYv1KBoaOL/SaWr4tv7Dtisp+MRdJVcB3ZyZat50n9sxquV/gGoq6lYASgUxqvgqj/
	EUY1zBrbdNIkwF9ZRI1+2qZAXc7OVEzFK/0e92Lub6JBgBLsksKJ52it96TYj/XhcmmO
	w2xU+SEOIQ7Inzv8hY/8qxVUc+a8DcMfox33Q83J/gRfh1ZkJ48cr0LEXCc2TRZ9MzZA
	QhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PE33tzWuRkymi+mcaeJxqdUceH9vB07yQMN921BU6MM=;
	b=I/tIVmHDCoqNGPnQEXn62TSDV/Hu9h6q/OzajnijlbXUWeF/S2hyBbXqJxe6u70xLG
	FCOUVBQYKtiwQOtdrgEVVyyxFV2U6jydc3hwCOaKuU1DrBrGLlRqlpiJEneLsO8iTo2/
	Mf2O4eXRFC4TlIxjnFEuU6xdCo64t6xpzjbQTRKIFuerZTg6oMxWRWhyk8Oglq1wiGJc
	Nr6nhUojL02rQAn2NIzHDMpXbbnAjrv8VIT9IPqQiuRxa03A2cdV+i/ZfSztfruQZgDs
	+5EN14EpJezbIp8XtAi6liAKDqqYt6J/vobECWA1ofeqmeCnlcWuEcwrgThRd1ou5JGk
	rT3A==
X-Gm-Message-State: APjAAAXa543NYL7Jbwb6D+xIYPAU+ZNjK0c0LEuDix04AJCW9KT/k1wa
	tgg1CldlI0nd6MaHEHKy6rRE+6ZON1ktT/f1huo=
X-Google-Smtp-Source: APXvYqyBsILKgSNv2ZCml9frQz2Qn53b72GlMya1zZCu8w6e/AZ1oYDQtfHCciCCCqQGyo/HVXqA1AbIceJFcWaYWZU=
X-Received: by 2002:a05:6638:41d:: with SMTP id
	q29mr11072743jap.128.1578608667829; 
	Thu, 09 Jan 2020 14:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
	<bc6e63b4-17f5-4d2c-761b-abe8ef476551@windriver.com>
In-Reply-To: <bc6e63b4-17f5-4d2c-761b-abe8ef476551@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 Jan 2020 23:24:16 +0100
Message-ID: <CALbNGRT-yQLsGTLsSTJzbhU5b6zzLxHmb6A2wi-pDfmZt-4_8A@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	matthew.zeng@windriver.com
Subject: Re: [PATCH 1/9] poppler: upgrade 0.82.0 -> 0.84.0
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
X-List-Received-Date: Thu, 09 Jan 2020 22:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 11:01 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 1/9/20 4:05 PM, Andreas M=C3=BCller wrote:
> >  From announcements:
> >
> > Release 0.84.0:
> > core:
> >   * Fix crash when converting from Unicode to ASCII-7
> >   * Splash::scaleImageYdXu: Protect against crash if srcWidth is too bi=
g
> >   * JBIG2Stream: fix potential crash in malformed documents
> >   * JBIG2Stream: fix leak in reset() if called several times
> >   * Internal code improvements
> >
> > utils:
> >   * pdfimages: Add error message if first page is larger then number of=
 pages.
> >   * pdfinfo: Improved paper size recognition
> >   * pdfsig: Fix exit code when dumping signatures
> >   * pdftocairo: Error out when even/odd selects 0 pages
> >   * pdftohtml: Fix memory leak
> >   * pdftoppm: Add an option to scale before rotate
> >   * pdftoppm: Add -hide-annotations option
> >   * pdftoppm: Error out when even/odd selects 0 pages
> >   * pdftops: Improve -optimizecolorspace
> >
> > qt5:
> >   * Code cleanups
> >
> > glib:
> >   * Fix compiler warnings
> >
> > Release 0.83.0:
> > core:
> >   * Improve when a file is recognized as Linearized
> >   * Improve const-ness of the code
> >   * Make code a bit more readable/maintanable
> >   * Fix uninitialized memory uses in broken files
> >
> > utils:
> >   * pdffonts: Make code a bit more readable/maintanable
> >   * pdftohtml: Make code a bit more readable/maintanable
> >
> > qt5:
> >   * Remove a bunch of unused internal functions
> >   * trUtf8 -> tr (less warnings)
> >
> > build system:
> >   * make-glib-api-docs: switch to python3
>
> Nice.
>
> Andreas,
>
> Have you by chance tried to add ptest coverage for poppler?
> If not, Matthew may do that.
>
>
Have not done any ptest on this - just some runtime tests on target with ev=
ince

Andreas

