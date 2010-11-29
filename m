Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PN9dM-00014Y-F6
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 20:43:34 +0100
Received: by wyb40 with SMTP id 40so4868204wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7zV6qAMfSMs6/XtzzG20L9hZ3HpdCOKWPeGNJORl1u4=;
	b=bOGmtjXJb8wxdBqQHo1YmyeuQw51r+e4T4LqQGRHGmi4ppfIXhVNNxXa9k8XN+lP5C
	KOjQErrY9XksuYumfUeQLuC748CmJ+w8cflOPPb/W4e8I5a/QYTwYTquY0Vhj+u/YqjW
	OLSeKNGLCWidJxujnETd0nxxVBl6DhgxnkFkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=mBdrFKn8j62/Tu1MlCoa5vTQjNfUi4qWmOmD/GT6Uct/7mJMaAJUDbSRPrBHkl2DyL
	j8A7G+sCBFycpZHhOrQ9W+EQrS2ttYoXSY++FK0CFKypYt5iNY5130rphyJZEAV0jo52
	pK6WgcE6tZ2a65yZ+JuotO/lb6032RiBPEyDU=
Received: by 10.216.22.70 with SMTP id s48mr857339wes.27.1291059730282; Mon,
	29 Nov 2010 11:42:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Mon, 29 Nov 2010 11:41:45 -0800 (PST)
In-Reply-To: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 29 Nov 2010 12:41:45 -0700
Message-ID: <AANLkTinrgcm1HF98iGHzspTenpMGWDvDD-87+f=8-EoV@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Mon, 29 Nov 2010 19:43:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 7:29 AM, Chris Larson <kergoth@gmail.com> wrote:
> This is a request for further testers for the parallel parsing branch
> of bitbake, as well as for review of the code. =C2=A0I'm fairly certain
> that the last real issue with it was resolved yesterday, and I haven't
> gotten any reports of problems from those testing it since last week,
> so I'm opening it up to more public testing, so we can be absolutely
> certain that we can merge it to master in the near future without
> risking problems.
>
> For code review:
> Either follow the below steps, then git log master..parallel-parsing
> or git diff master..parallel-parsing, or use the web interface at
> https://github.com/kergoth/bitbake/commits/parallel-parsing
>
> .
>
> For testing from scratch:
>
> git clone git://github.com/kergoth/bitbake
>
> cd bitbake
> git checkout -b parallel-parsing origin/parallel-parsing
>
> From an existing bitbake repository:
>
> git remote add kergoth git://github.com/kergoth/bitbake
>
> git remote update
> git checkout -b parallel-parsing kergoth/parallel-parsing
>
> Thanks for your time, and do let me know what you think, either of the
> code, performance in general, or the new progress bar (shows an ETA),
> or anything else :)

This has now been merged to the bitbake master branch, as it's been
tested for a couple weeks now without problems, and the benefits are
clearly worthwhile.  If any bugs crop up with it, we'll fix them as we
go.  Let me know if anyone has any issues with it.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


