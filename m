Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1ORVFJ-0005zD-6P
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 21:04:26 +0200
Received: by vws19 with SMTP id 19so214379vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=qEpzHFgqMUtYNEoO8oka/OcCNG8mqVCt4H8jS0TUNKs=;
	b=T8F5Nl889wEq3sMwgaNK2oeNbqEL8hPEtzNTaGPppxiscDCtOxAzGjC19D907CU6wS
	ksEROn3gB8RjpqNshJuD4IZt0PoYu/qHBFqTbVAMs//s0FIubJVJK3wTyUMHjzAf/vRh
	vVVAEr4ny5B8vEcWgO2hP5q34H03qvdhPWoec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=dr5jwQ18Rtmcu4Fl4n8vM4VAm74OA0puimnZg6rbhyQwZ1SNmyocxt6t2+tXWkykY1
	EYmKvfWz35M86KFRmaT+YtzdbDaDLf1RVC0KPi76cfhy8y9I+51+3CHJIoiA4Omfs/pr
	ixaHylRKKd3tuiZzP2fsbfFatDu1uFFtCDQwc=
Received: by 10.224.101.75 with SMTP id b11mr5249288qao.38.1277319582526; Wed, 
	23 Jun 2010 11:59:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.204 with HTTP; Wed, 23 Jun 2010 11:59:22 -0700 (PDT)
In-Reply-To: <20100623172453.GD5535@gmail.com>
References: <4C1FDFAE.8040704@mentor.com> <20100622144759.GB32544@gmail.com> 
	<4C210735.5090202@mentor.com> <20100623172453.GD5535@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 23 Jun 2010 11:59:22 -0700
X-Google-Sender-Auth: TXQ7-UUUeL9xrAzMmv2qbURuos0
Message-ID: <AANLkTiklI8GfmXhUOPh9QDNxodcpuXFi6QXQtMHvsQ5P@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC, PATCH] Make packaged-staging use more correct 	PSTAGE_PKGARCH
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
X-List-Received-Date: Wed, 23 Jun 2010 19:04:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 23, 2010 at 10:24 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On (22/06/10 11:55), Tom Rini wrote:
> > Khem Raj wrote:
> > >On (21/06/10 14:54), Tom Rini wrote:
> > >>packaged-staging.bbclass: Change PSTAGE_PKGARCH to something dynamic
> > >>
> > >>Currently, we make all pstage packages be locked to BUILD_SYS which
> > >>causes annoying warnings in some cases and doesn't allow for sharing
> > >>between say 32 and 64bit (which is valid for target bits).
> > >>
> > >>This changes to ${PACKAGE_ARCH}-${HOST_SYS} for everything and
> > >>reworks the opkg.conf we generate to add entries as needed.
> > >>
> > >>There is an alternative, suggested by Chris Larson, that we modify
> > >>PSTAGE_PKGARCH in an anon python function so that we can avoid
> > >>things like 'x86_64-x86_64-linux' in native packages and similar
> > >>duplication in sdk packages, or otherwise be more dynamic (use
> > >>HOST_OS instead of SYS and then catch the cross case, etc).
> > >
> > >I think this approach sounds better having same arch repeated twice
> > >would be confusing
> >
> > Here we go.  This also reworks generating opkg.conf a little bit (it
> > had multiple entries before due to a lazy grep).
> >
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
>
> very nice
>
> Acked-by: Khem Raj <raj.khem@gmail.com>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

