Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRKv1-0001zq-Rn
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 09:35:04 +0100
Received: by pzk12 with SMTP id 12so236437pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 00:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MInppYWwRjup2KMx77abwtyN99+9Zj7arU9iDXukdss=;
	b=of5/oiKkegE/Q8pSFvQPN1pv/DauE2lnZkazY7NboaHENldbQo1LTTQ1DSoiB9+IDs
	3fcWHt6zKbwGjw7pJgFfy5zrgzIgDifsbXF2oHkU/gE7OeH7mWyBIcj3S7U6pL50CyM6
	9JptdX5TE25+t1stjb73FDPwM4oTKPX2yPX5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QDFLRPHeHdLqLk4t3NUVNr9ukYRzhM38mYIuN3+rST9Pg1GOuEHNNy41h2tPuhsaZp
	5ld2dP71veg1b6Sk1fZwxULD4zAEiNZH9Z9D09FWtIfUrMJjXKLDABRjzrDarjdNpROJ
	CpJlsxQzGT9qbWY01QwVAcuLl+QP/FScs+5eg=
Received: by 10.142.234.1 with SMTP id g1mr1219304wfh.142.1292056397929;
	Sat, 11 Dec 2010 00:33:17 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y42sm5255571wfd.22.2010.12.11.00.33.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 00:33:16 -0800 (PST)
Date: Sat, 11 Dec 2010 00:33:13 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211083313.GA8894@gmail.com>
References: <1288776534.3980.33.camel@mattotaupa> <4CD1A210.5000007@telus.net>
	<1288999268.4113.51.camel@mattotaupa>
	<20101106075118.GM15069@ibawizard.net>
	<1289035885.4901.2.camel@mattotaupa>
	<20101106103653.GO15069@ibawizard.net>
	<1289060440.4901.134.camel@mattotaupa>
	<1289514419.16615.19.camel@mattotaupa>
	<1291979488.3970.12.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1291979488.3970.12.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][RESEND] vlc_1.1.4.1: add `lua5.1-native` to `DEPENDS` and `lua5.1` to `RDEPENDS`
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
X-List-Received-Date: Sat, 11 Dec 2010 08:35:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/12/10 12:11), Paul Menzel wrote:
> > ---
> > This patch has the number 3506 in the patch queue [1].
> > 
> > [1] http://patchwork.openembedded.org/patch/3506/
> 
> It would be great if some could commit and push this patch.

Applied thanks

> 
> 
> Thanks,
> 
> Paul
> 
> > ---
> >  recipes/vlc/vlc_1.1.4.1.bb |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
> > index af01d98..df8f17c 100644
> > --- a/recipes/vlc/vlc_1.1.4.1.bb
> > +++ b/recipes/vlc/vlc_1.1.4.1.bb
> > @@ -10,7 +10,8 @@ SRC_URI[sha256sum] = "61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d3667c8e49696
> >  
> >  # ffmpeg from git (library version => 52) is required
> >  # libtool-native must be >= 2.2.4
> > -DEPENDS += "libdvdcss libdvdread lua5.1"
> > +DEPENDS += "libdvdcss libdvdread lua5.1-native"
> > +RDEPENDS_${PN} += "lua5.1"
> >  
> >  EXTRA_OECONF += "\
> >         --enable-dvdread \



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



