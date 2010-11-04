Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PDqB5-0008IG-Rh
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 04:07:52 +0100
Received: by wwi18 with SMTP id 18so1428565wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 20:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=7dSJ3+BwryENpWidNJtKjZ43jEQ+0zr7xJNxh0+KK8Q=;
	b=CGKyB2tbRZ4I+FJ2DtWVvlnHJfSmOVF5iNX8pm9omETq5tldE98zA66IFhmKw1Zk24
	wfiFp41GoWiwQjipTRUs7W7GmvE0A1IkCDK2IZZutE1BwdJcAiRKSOEuDJi/j9DqNdSy
	eKUHgezVD7NGKC7HS+cx2P0RGhxrsLvvcqHM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ibYW8bQGuxcFR5kD0ZTf+aBLhxJEjwfp7SY3zjD8zVgK0fPOGJZO7BTC6xrxC8kHJR
	X8t6cE8SsLFKqYK5Xi0QtbqfD2uh7wntP4wD9gjj065361zpnleTrToRA9NqY6FUcWXR
	b5wvCPFGVh+CIOdJNcOtGhYpAMO2wLbnMDZCc=
Received: by 10.216.30.10 with SMTP id j10mr1322023wea.8.1288840020088; Wed,
	03 Nov 2010 20:07:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Wed, 3 Nov 2010 20:06:39 -0700 (PDT)
In-Reply-To: <20101104001342.GG3440@jama>
References: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
	<20101104001342.GG3440@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 3 Nov 2010 20:06:39 -0700
X-Google-Sender-Auth: r4EDOJ6WYmclwomCouHpepg2psU
Message-ID: <AANLkTim6PdzTRY-9zANa5t90dcYaSTrCudCKYNWsUV--@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] metadata_scm.bbclass: get the metadata revision for current HEAD
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
X-List-Received-Date: Thu, 04 Nov 2010 03:07:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 3, 2010 at 5:13 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Nov 03, 2010 at 04:55:52PM -0700, Chris Larson wrote:
> > On Wed, Nov 3, 2010 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > > Currently we report wrong revision when we build from branches not
> based
> > > on master because we only fetch the HEAD value which is remote master
> > > This patch makes it to report the HEAD of whatever branch one has
> > > checked out.
> > >
> >
> > This doesn't make sense.  The HEAD ref always points to the current
> checked
> > out commit or branch, it is *not* specific to master.
>
> No it does make sense, because it fixes my <unknown> METADATA_REVISION :).
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> in my R/W checkout I have it right even before patch
>
> bitbake@jama ~/oe $ git show-ref HEAD
> b3246d96069fd11caee42ec6ebcbf6dca2d62449 refs/remotes/origin/HEAD


No, this is broken.  It shouldn't be determining the METADATA_REVISION from
a ref you don't even have checked out.  Right now it's pulling the HEAD ref
from upstream, it should be pulling the local HEAD ref.  So NACK on this
patch, the metadata revision code needs to be fixed to either not use
show-ref or pass the necessary args to not operate based on a HEAD of a
remote.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

