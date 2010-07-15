Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OZQm1-0007Uu-5o
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 17:54:57 +0200
Received: by fxm12 with SMTP id 12so532872fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Q5RTipGJNaEVAjD9TvlpVfemVMjjATz22vgbs1fCObI=;
	b=alS9UAhR0Uno0EBniqmHNfjVLrsaqWFKym5q1t8V+aaNA5aU905G5sgpVuGXRWlc9N
	xVeygoQQ17lRzG/OoVhWuAEH0zMp/UNmlAxeR26yDF/IAlnqFBoXuNTx8H6ujMZ/RoLr
	2tHhs27L0q9QV76WdpULmUMIP54ghtD/V5Fc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nMihy/7PrsTyzbGofUXjHBcuf/ywwQNrtx1/StYXpXc+5BSIioKotHX9/Wtcq9H+4y
	fBJWonOLwW4W3ryJo8PkXX+GE+jn7yJmbZMeyILaLh+9kSqPtDpqimn7PH/DEsoYYu5f
	vURruPYYFKiA/V1+8ka2sGc5gw04oWKbZMgFU=
Received: by 10.223.116.140 with SMTP id m12mr832704faq.51.1279209292549;
	Thu, 15 Jul 2010 08:54:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k15sm373139fai.40.2010.07.15.08.54.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 08:54:51 -0700 (PDT)
Date: Thu, 15 Jul 2010 17:54:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100715155457.GC5745@jama>
References: <1279207542-5277-1-git-send-email-rep.dot.nop@gmail.com>
	<1279207542-5277-4-git-send-email-rep.dot.nop@gmail.com>
	<1279208884.2345.2030.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1279208884.2345.2030.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_00,FRT_PRICE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] gcc-cross: fix PV and make it compile
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
X-List-Received-Date: Thu, 15 Jul 2010 15:54:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 15, 2010 at 04:48:04PM +0100, Phil Blundell wrote:
> On Thu, 2010-07-15 at 17:25 +0200, Bernhard Reutner-Fischer wrote:
> > -PV = "4.6+svnr${SRCPV}"
> > +PR_append = "4.6+svnr${SRCPV}"
> 
> Munging PR like this is fairly ugly.  You might consider bashing PKGV
> instead.

PREFERRED_GCC_VERSION = "4.6+svnr%' should also work with bitbake-1.10 and newer

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


