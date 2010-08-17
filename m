Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OlNge-0002X4-Qz
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 17:02:49 +0200
Received: by wwb34 with SMTP id 34so6718475wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 08:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=RPCq9QcZz80B3kna+8Qfr/0ylLkDkYePFMOK0SE5p9U=;
	b=S3odeS9P7yQKyuFrQrIsfGx4ZavMMTpeUpq9cTxdwYVC2Hm4b+V1EsvyGTCcW3R5Z/
	Vu0L4BIJOKDcX78Rqz1UCyvCsnvk2uFkwgigAh18PGLXWIdB2s2Qdbf9xSKuzOuOoGi5
	9kWLEcd1cpPk1bVVWwTsxguoUTfGwi1GvTUwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=oFp63n+UnsyvBZCvOfpFDckwmLbSI0gJlfpu+P867sQS3lLvrDSiGycBheUt+u9YYj
	osQ7D1vL+5LyXaA+RzAHSPad6bAklgzp7M6tRc1THvPKnCeazRMHdvAXPCAYl8+al0aH
	4Jm+l+13V7LJ3HV5l2czb79/merHbYoI+2kXI=
MIME-Version: 1.0
Received: by 10.227.157.13 with SMTP id z13mr5660820wbw.184.1282057345507;
	Tue, 17 Aug 2010 08:02:25 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 17 Aug 2010 08:02:25 -0700 (PDT)
In-Reply-To: <4C68B2C5.5030908@mlbassoc.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
	<4C68B2C5.5030908@mlbassoc.com>
Date: Tue, 17 Aug 2010 11:02:25 -0400
Message-ID: <AANLkTinLbKUPNo=59RUUoznY7tYBh4LCacFeAgUEQ-6k@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Tue, 17 Aug 2010 15:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 15, 2010 at 11:38 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> The biggest problem (as discussed at great length already) is that the
> distance from 'dev' to 'stable' can be measured in years :-( =A0'stable'
> just isn't useful at all for "current" work...

I must admit that some percentage of the time I also experience build
errors, but I've simply adapted my work-flow to deal with it.  For my
project work, I simply build over the course of a week or so until I
get something stable, and then lock down my OE version for my
development.

I think it would be very useful to have a "stable" branch that is only
synchronised with dev when X number of targets build from a clean
build.  It seems like this would be high value, with little effort.
Of course there will be corner things that break, but at least a new
beagleboard user can check out something and have reasonable
confidence that it will build images.

Does anyone have suggestions for the branch name and a reasonable
subset of machines and build targets?  Perhaps someone is already
running these clean builds?  At one point we had a machine at OSUOSL
dedicated to this purpose, but no one ever set it up.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


