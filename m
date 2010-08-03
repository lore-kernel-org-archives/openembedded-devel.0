Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgNbP-0006qE-3c
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 21:56:57 +0200
Received: by pxi12 with SMTP id 12so1825263pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ORr7CrvSjcPFh1sIOWLVnyHz0Km5rofsDsIA8KQwP90=;
	b=EtBxwQlbfu1OzFPensYRXps4G+Vtnm6zjpO/L+JeXfgO7NMdYN8aiv/Rp7mkS4PeQC
	zF0tvG4cj2D2sliw+zBhL0MDspkZjtsYOhW6ejTvrma/1AVrXIdB34m3++LabXzbo8BV
	A6m+s/3PhFQxv2zagE+IkJtG5xh3NamJezXx8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ICJ09cAuG1dsnokL9vYV91iNDKgN+Zk8qLyspxCwKtCCtayNxfIC0tdqR77qPkec/V
	ENZlbCDbwslx7WN1ZYklfYR/FFnt3Bfo9ZwZ/8hUlhGvtnHSImM7vHC9afghhkm0OksQ
	j26AALjJc+tqEF0G28vZNvrOXsDuJHoSNHeOw=
Received: by 10.114.24.15 with SMTP id 15mr9426480wax.122.1280865398719;
	Tue, 03 Aug 2010 12:56:38 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c24sm14241393wam.19.2010.08.03.12.56.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 12:56:38 -0700 (PDT)
Date: Tue, 3 Aug 2010 12:56:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803195629.GA5264@gmail.com>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
	<i38q56$4hq$1@dough.gmane.org> <20100803133515.GD12134@jama>
MIME-Version: 1.0
In-Reply-To: <20100803133515.GD12134@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 19:56:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/08/10 15:35), Martin Jansa wrote:
> On Tue, Aug 03, 2010 at 12:13:58PM +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Acked-by: Koen Kooi <k-kooi@ti.com>
> > 
> > If noone objects, can we get this in ASAP?
> 
> Building from scratch armv4t then armv6 was ok, building few more
> packages for armv4t again still worked, but now I've upgraded gcc/eglibc
> and building eglibc-initial for armv4t first fails:
> 
> http://tinderbox.openembedded.org/packages/665289/
> http://build.shr-project.org/tests/jama/config.log


I tried this 
MACHINE=qemuarm bitbake minimal-image
MACHINE=beagleboard bitbake minimal-image
MACHINE=qemuarm bitbake -c clean gcc-cross gcc-cross-intermediate gcc-cross-initial eglibc eglibc-initial
MACHINE=qemuarm bitbake eglibc
MACHINE=qemuarm bitbake minimal-image

All these steps went without errors.

I would be happy to assist in nailing this issue for you but I need a way
to reproduce it. On other hand I gave a hint what could have gone wrong 
Please check that

Thanks
-Khem



