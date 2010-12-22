Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PVUr3-0006ct-Jc
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 21:00:09 +0100
Received: by fxm11 with SMTP id 11so5302388fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 12:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=P8aXTxz1QboQJNhPXB/DapqmbOc8F4/HPnJ2wRbOSFw=;
	b=b0DHafAt992mC4Gm8kCidgICJuJQTsyRnluUvQXdo/f4tNBcl0NswIp4Ms64GODDmY
	i8RZj31CbiYshVQew8U/neNL4KKgFrn//a6WOrtqItin0m8K3wzBV9TltBw5peERYYOW
	8h/lq8/Rzl8gC+dnpysXLCxuKS+ju2syznXwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gaKbTQbz1C4dHVsK4xV1s0OIQOQ/HmSWm4gX6yqwbrxYv8fjUEodDfD2s0tkjMn2Q+
	Td2OXwQZqfh2UTVX7IRN/iVptAcbzLNioLM7Gw+wH7lUwKmdBQdM9aCmPbEcXHnQgGAu
	e5HAuLZJScLrLmwAYV4Lp+55sPzIUB0j5T+BU=
Received: by 10.223.78.136 with SMTP id l8mr168281fak.82.1293048001249;
	Wed, 22 Dec 2010 12:00:01 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm1816543fak.20.2010.12.22.11.59.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Dec 2010 12:00:00 -0800 (PST)
Date: Wed, 22 Dec 2010 20:59:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101222195957.GB3295@jama>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<ietk2q$jdr$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ietk2q$jdr$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 20:00:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 22, 2010 at 08:38:02PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 22-12-10 12:14, Koen Kooi wrote:
> > Signed-off-by: Koen Kooi <koen@openembedded.org>
> > ---
> >  conf/sanity.conf |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/conf/sanity.conf b/conf/sanity.conf
> > index 0f53cb2..1c83c14 100644
> > --- a/conf/sanity.conf
> > +++ b/conf/sanity.conf
> > @@ -3,7 +3,7 @@
> >  # See sanity.bbclass
> >  #
> >  # Expert users can confirm their sanity with "touch conf/sanity.conf"
> > -BB_MIN_VERSION = "1.8.18"
> > +BB_MIN_VERSION = "1.10.0"
> >  
> >  SANITY_ABIFILE = "${TMPDIR}/abi_version"
> >  SANITY_PRFILE = "${TMPDIR}/distro_pr"
> 
> If people are agreeing, can I get some Acked-by lines please?

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

(also in favor of any 1.10.* version)

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFNElOaMkyGM64RGpERAgvLAJ9CFKK5yUiCxG7H4tcRq2OKpDDb1QCfSHz3
> 7fCKAbIj8QYD8XO8IoJg2Nc=
> =ZtSj
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


