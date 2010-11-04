Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PE0UR-0004o3-2k
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 15:08:31 +0100
Received: by yxe42 with SMTP id 42so1434176yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=yWoy0GWs1j44rx62BUs4n2kcrQ8u1DbVT9CbRSu8kyc=;
	b=LRDpclNOqw6+7mB7kLSl6c2dk3vedCahxSknw8nLuytGN/3H8PpGNBjzKWuzUWmzux
	4lkFZTOQNimfKLO8TW1moCcxoV4lG/88wxo0ekp4Wi/ja7CSBTPhRaFTaNKswLHo4GOI
	tZVbVraY01a3EVHawOKcEs/IlAXdtwahqgxdg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=LTyM/E+eedijVfSAtuTNs1e5LtdT2X9cYSPgjNyikmvFz8LyfZ9ZTjhAGkYI8+A2p6
	Hvr5x18nS82d7hce2N1qPluc89+tvaDlun+zmPe6s/E9NkO+xxWj8d9sv/prDPCMLj2H
	UqdNKp4vOQX64Qey5q2H1ZWD7Gj7ZLnrYBO4I=
Received: by 10.216.184.11 with SMTP id r11mr806722wem.8.1288879656772; Thu,
	04 Nov 2010 07:07:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 4 Nov 2010 07:07:16 -0700 (PDT)
In-Reply-To: <AANLkTinPkXnf0iSakku7hkMHge_NqXPW_7WS1DHsqjHu@mail.gmail.com>
References: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
	<20101104001342.GG3440@jama>
	<AANLkTim6PdzTRY-9zANa5t90dcYaSTrCudCKYNWsUV--@mail.gmail.com>
	<AANLkTinPkXnf0iSakku7hkMHge_NqXPW_7WS1DHsqjHu@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Nov 2010 07:07:16 -0700
X-Google-Sender-Auth: fV2ky_bWeb-zZ4mMGsHr_NDsf1Q
Message-ID: <AANLkTin2tSJxYOwwkS4QSR=RH8VEfBp68VeHrE-GiBsO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
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
X-List-Received-Date: Thu, 04 Nov 2010 14:08:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 3, 2010 at 11:01 PM, Khem Raj <raj.khem@gmail.com> wrote:

> >> bitbake@jama ~/oe $ git show-ref HEAD
> >> b3246d96069fd11caee42ec6ebcbf6dca2d62449 refs/remotes/origin/HEAD
> >
> >
> > No, this is broken.  It shouldn't be determining the METADATA_REVISION
> from
> > a ref you don't even have checked out.  Right now it's pulling the HEAD
> ref
> > from upstream, it should be pulling the local HEAD ref.  So NACK on this
> > patch, the metadata revision code needs to be fixed to either not use
> > show-ref or pass the necessary args to not operate based on a HEAD of a
> > remote.
>
> whats wrong with this patch. or what is it that we need additionally.


The issue is, show-ref shows all refs which match the supplied search
string.  show-ref HEAD will show all the HEAD refs, both local and the ones
in all your remotes, which isn't what we want for METADATA_REVISION.  I'm
testing a patch which changes it to use rev-parse to get the commit hash for
HEAD rather than show-ref.  Thanks for catching this, by the way, I don't
want to sound unappreciative, its just that this patch is more of a
workaround, rather than a fix for the root problem. :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

