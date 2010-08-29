Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OpcYT-00030T-PI
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:43:54 +0200
Received: by fxm6 with SMTP id 6so2916895fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=h6XNHu6WvU4LHTGbG+Ch5zXlXv8jgpnXAdcm11ihpqI=;
	b=KyjxAf5tOlVXMFgMjTkhpQb1GvICmuDGDiYukVEskdl9BzivYE59xEIf81eOdXmQ3H
	+CabtmfQG5wD6w2oxl8L//fUz3JcdxMBhptDaLLHWsJ68gsffT34KL4C4ouGFmULQBwQ
	FBN6RWwy66hdW/I5dtrymIJttoLDW58IQkFzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=gCzDJFrdthl3rBajEmFd6Bwk7S8ob39tZ99WvbaDdFs+s0RXXhXBxBpzeQ71tiPd84
	gdNHg5G3ooqNHAmCUPMbCo3ljYdan2YaTCyDIXbAaFNATu/Ih4KDXaaFXbdUhLdNunDR
	XxJ6nrTWHknRDkMAPSR1AufVfjFr27Ia1DfwU=
Received: by 10.223.103.134 with SMTP id k6mr2398772fao.5.1283067802884;
	Sun, 29 Aug 2010 00:43:22 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id m17sm216643fag.0.2010.08.29.00.43.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 29 Aug 2010 00:43:21 -0700 (PDT)
Date: Sun, 29 Aug 2010 09:44:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100829074414.GM17268@jama>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-22-git-send-email-raj.khem@gmail.com>
	<AANLkTinto0DJo6_PQ+c55fdsn45xfP6RgTHV-CUednpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinto0DJo6_PQ+c55fdsn45xfP6RgTHV-CUednpQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 21/23] xqt2_20060509.bb: DEPEND on libxmu instead of xmu
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
X-List-Received-Date: Sun, 29 Aug 2010 07:43:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Aug 29, 2010 at 09:14:03AM +0200, Frans Meulenbroeks wrote:
> I think this is very bad that we apparenlty have a recipe from 2006
> that has a problem with a lib that is not there:
> The DEPENDS is also from 2006.
> Was it possible to have broken depends in the past, or was xmu a good
> depends in the past?
> If not, is it worthwhile to keep recipes from 2006 that are apparently
> not maintained and have been kept around for so long ?

This was my fault from 2010-06-24
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=c470dca9ddeaa911c4d63edd8e863f31e537e97f

and the fix is right

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Anyway wrt the patch:
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> 
> 
> 
> 2010/8/28 Khem Raj <raj.khem@gmail.com>:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes/xqt2/xqt2_20060509.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/xqt2/xqt2_20060509.bb b/recipes/xqt2/xqt2_20060509.bb
> > index 7634d27..4492bc7 100644
> > --- a/recipes/xqt2/xqt2_20060509.bb
> > +++ b/recipes/xqt2/xqt2_20060509.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Xqt2 is an X-Server than runs within the Opie environment"
> >  HOMEPAGE = "http://xqt.sourceforge.jp"
> > -DEPENDS = "freetype libxi xmu flex-native virtual/libqte2 libqpe-opie"
> > +DEPENDS = "freetype libxi libxmu flex-native virtual/libqte2 libqpe-opie"
> >  LICENSE = "GPL"
> >  SECTION = "opie/applications"
> >  APPTYPE = "binary"
> > --
> > 1.7.1
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


