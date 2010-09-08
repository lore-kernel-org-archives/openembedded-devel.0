Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OtL6d-0005tH-6J
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 15:54:33 +0200
Received: by wwi14 with SMTP id 14so42785wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=WDrsNy1fkveOw5wsynd4jz3l94vqozleWkNG3oZFmT0=;
	b=ayadVUkd/JMAWAg7p29CDj0IG0RVEWcJ2jldpUl+zd7WV92pKW8ipb+4F+SROsVCvz
	3zFOQJiskBZsSRhkUxampysQhsebwS81LwcK5hrKaq+xgBchNTYGBOWeCEcfIWRk2t61
	+i5o++H+BKMDCjY9m5kgAaPXtuzqEFSgAGRTo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=lIWLaTncfcNuh10aAnzDDtfTOtPdT8LB/P1SnOd2O87x6tIVLTj2lIx4qPYLpCfHuF
	LkWRDp9r/vGFYbCU+o1lHOZ0YJ2CySB+sfyGVrcYKNWh54wO+qVLk5pPYRW65LGMGdSF
	p4wEJWaNEaQhVi1YHPYpg7WZ2nXXLvz2/X9oU=
Received: by 10.227.129.12 with SMTP id m12mr1847wbs.102.1283953948269; Wed,
	08 Sep 2010 06:52:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Wed, 8 Sep 2010 06:52:04 -0700 (PDT)
In-Reply-To: <AANLkTimVjyq7CA2CqyaR_D-AJ-8Aawhoknzs1Xs1R2fc@mail.gmail.com>
References: <AANLkTimVjyq7CA2CqyaR_D-AJ-8Aawhoknzs1Xs1R2fc@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 8 Sep 2010 06:52:04 -0700
X-Google-Sender-Auth: BlP84CRMWmD-rgHdOgWErVDcR04
Message-ID: <AANLkTi=-H-JnU5VyoGO_NEAgORF27GkM1X+VazqYq2Jt@mail.gmail.com>
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
Subject: Re: OBSOLETE in base.bbclass
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
X-List-Received-Date: Wed, 08 Sep 2010 13:54:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 8, 2010 at 6:04 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Bumped upon this while peeking in base.bbclass:
>
>    # OBSOLETE in bitbake 1.7.4
>    srcdate = bb.data.getVar('SRCDATE_%s' % pn, d, 1)
>    if srcdate != None:
>        bb.data.setVar('SRCDATE', srcdate, d)
>
>    use_nls = bb.data.getVar('USE_NLS_%s' % pn, d, 1)
>    if use_nls != None:
>        bb.data.setVar('USE_NLS', use_nls, d)
>
>    setup_checksum_deps(d)
>
> Not sure what part exactly is OBSOLETE, but I don't think we support
> 1.7.4 any more, so I feel it is better to clean this and remove the
> obsolete section.
>
> Any bitbake wiz care to comment on this?


Hmm, I think that was from the time period when I wasn't involved in the
project.  Hopefully RP can speak to this :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

