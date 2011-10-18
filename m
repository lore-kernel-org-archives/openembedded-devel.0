Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGGgC-0004Hp-36
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 22:54:33 +0200
Received: by iafi7 with SMTP id i7so1130737iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=I8CHvOtH2zY7mmVmjOT3PvyEY9ajduNo9Zi0cqPP7Tw=;
	b=jo1iHgPmDCJflz+N4R4o/mCWqiHHhT1jAjx5hXTOMdOvvd6bx+YYtlvNfRYERBb8ry
	PJLzuyQl+kLdZKrxISod1zO+YhfYHqah8DDL9CxTDxZVQfqAXwm2pXyNotDn/ITd+9DS
	G0cEdpCWuOuomL1Oiu9wvPJPR67c5qJLedomA=
Received: by 10.231.50.201 with SMTP id a9mr1788267ibg.1.1318970920305;
	Tue, 18 Oct 2011 13:48:40 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id jm11sm8393031ibb.1.2011.10.18.13.48.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 13:48:38 -0700 (PDT)
Date: Tue, 18 Oct 2011 13:49:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018204954.GA27472@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <j7gllt$s0$1@dough.gmane.org> <20111018203818.GD556@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111018203818.GD556@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Patchwork breaking submitters name Was: Patchwork hooks for meta-oe active and working
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
X-List-Received-Date: Tue, 18 Oct 2011 20:54:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 22:38), Martin Jansa wrote:
> On Mon, Oct 17, 2011 at 09:32:13AM +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Hi,
> > 
> > Thanks to Khem the patchwork hooks for meta-oe (and hence meta-efl,
> > meta-gnome and meta-xfce) are active and working.
> > Once the commits hit the OE server the state will get updated automatically,
> > so the submitter will instantly know when his/her patch has hit the repo.
> > 
> > regards,
> 
> There is known and fixed issue with patchwork breaking author name
> 
> We have an example in patch
> "[meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)"
> Original e-mail says "Pau Espin Pedrol <pespin.shar at gmail.com>"
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035644.html
> 
> older patchwork instance says only "pespin <pespin.shar at gmail.com>"
> http://patches.openembedded.org/patch/13323/
> newer patchwork instance says also "pespin <pespin.shar at gmail.com>"
> http://patchwork.openembedded.org/patch/13323/
> 
> Same problem was reported also on LKML
> https://lkml.org/lkml/2011/9/18/128
> And later fixed by Jeremy Kerr
> https://lkml.org/lkml/2011/9/18/149
> 
> Can we get this upstream fix to our patchwork instance too?

This patch is already applied to the new patchwork instance on
patchwork.openembedded.org however it was only yesterday when it came
into life.

-Khem


