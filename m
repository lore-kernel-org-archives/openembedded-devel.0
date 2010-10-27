Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PBE0j-0007jg-7M
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 23:58:23 +0200
Received: by wya21 with SMTP id 21so1165685wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ITK3xFed4doYSrXWqLvwSnx93uCFeCKrt0HEQVTZsps=;
	b=naX6POCVBjXJEZVP7MkOl3pPyxwWobxrY+/1LPgbug5ddm3dCJmjmSVClFWLY8sERq
	lTBfi0TgrFLCZ7DHn2/K2BwZpvEu8L7C3sxZsyV9P1OmKDImrTuXZCgHwwwcVg6vOsEP
	EVrP5UlIKhnxdKoBXtrvzND/nXb/P1+yT9Fws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=CkwynopTyWij5UMpENZoNPCYtYA5k+Nfqec1KBzpfKuUbeZtmOne0/KMDvLXjWSHio
	ZKN3bj4sn/kJmBcslexJ+rf9dBd0A9Gg4rW6ahCmTDFdbYfcrAubeVY96MGdza+k+VcD
	V74yVvXavG5AbKknsW6ivD9fq6+V9TiaXnWqI=
Received: by 10.216.71.206 with SMTP id r56mr1479545wed.29.1288216641528; Wed,
	27 Oct 2010 14:57:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Wed, 27 Oct 2010 14:55:44 -0700 (PDT)
In-Reply-To: <20101027215249.GF3514@jama>
References: <1288214778-31692-1-git-send-email-cliff.brake@gmail.com>
	<20101027215249.GF3514@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Oct 2010 14:55:44 -0700
X-Google-Sender-Auth: eSwlm9X7OqeMMiu3B4EFYQFeRhE
Message-ID: <AANLkTimytPAXv3hFFB=Of+GsfFRcGoAtqnvOev9ZOZPO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] libfontenc: add font-util depend
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
X-List-Received-Date: Wed, 27 Oct 2010 21:58:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 27, 2010 at 2:52 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> > diff --git a/recipes/xorg-lib/libfontenc_1.1.0.bb b/recipes/xorg-lib/
> libfontenc_1.1.0.bb
> > index bce1aa5..757431f 100644
> > --- a/recipes/xorg-lib/libfontenc_1.1.0.bb
> > +++ b/recipes/xorg-lib/libfontenc_1.1.0.bb
> > @@ -1,7 +1,7 @@
> >  require xorg-lib-common.inc
> >  DESCRIPTION = "X11 font encoding library"
> >  LICENSE = "BSD-X"
> > -DEPENDS += "zlib xproto"
> > +DEPENDS += "zlib xproto font-util"
> >  PE = "1"
> >  PR = "${INC_PR}.0"
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>



Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

