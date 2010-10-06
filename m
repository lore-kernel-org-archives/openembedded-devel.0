Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P3VeV-00012g-MA
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 17:11:32 +0200
Received: by bwz7 with SMTP id 7so61478bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6Q3xmz+9OKB7KlJHg9yxYuptCaE1du2AFKYslDhOU9g=;
	b=N6IfnfeUwuZ9SZ+lgGMc5m57Q/s1plKEgMZ7gCDYWjp13OysVtkm2dsUEO+pUDWGaL
	lAm8Eryq3YNa3JFkaEV7TNKCiA2qfc6t9UlSlrkV24NUzkU2SVRwWncieHNgLq2Yab0L
	Je0rsMk5qDB++d9dqRQ6QLw4hlh/PKEGZfQOI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=c+AMryHcfGxMlg7/JP1+bzt+ydxT2lAtSOag6loEAnKasiGY173vQhSLZIIG00WlEP
	8NXIxyuGVoJVEHBqRG6uSYQm/T8voRM2kDW54nrL4FnoK6iO0tPeVKtAIkwn8UODIwbW
	9rJ7MdvL1PVJy62b2oqC8Aax6MUGJRLt2N2t0=
Received: by 10.204.141.16 with SMTP id k16mr9888889bku.177.1286377872747;
	Wed, 06 Oct 2010 08:11:12 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x19sm755344bkv.21.2010.10.06.08.11.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 08:11:11 -0700 (PDT)
Date: Wed, 6 Oct 2010 17:11:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101006151119.GL3264@jama>
References: <1286374774.3792.12.camel@mattotaupa> <20101006142538.GJ3264@jama>
	<1286377015.3792.16.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1286377015.3792.16.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] mokosuite2: Add `libfakekey` and `vala-native` to `DEPENDS`.
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
X-List-Received-Date: Wed, 06 Oct 2010 15:11:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2010 at 04:56:55PM +0200, Paul Menzel wrote:
> Am Mittwoch, den 06.10.2010, 16:25 +0200 schrieb Martin Jansa:
> > On Wed, Oct 06, 2010 at 04:19:34PM +0200, Paul Menzel wrote:
> > > 
> > > During the latest bumps of `SRCREV` I guess it was forgotten to add some dependencies.
> > > 
> > > `libfakekey` is needed for a successful configure and without `vala-native` `valac` is not found on a clean and minimal build system.
> > > 
> > > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > 
> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > 
> > IMHO no need to bump PR as it won't change resulting packages, but won't
> > harm as it builds quickly.
> 
> Ok, I updated the patch.
> Could someone please commit this, since I do not have commit rights.

Both pushed.
 
> > Thanks for spotting it.
> 
> No problem. Do you have an idea on how to avoid that in the future?

not really, from what I understand packaged staging makes it
easier/faster to rebuild after prunning sysroots, but ie if I use
shr-image as target, then it's quite likely that ie libfakekey gets
staged (because of some other recipe) before building mokosuite2.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


