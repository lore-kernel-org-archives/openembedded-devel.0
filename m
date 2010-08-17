Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OlFRB-0003rV-K2
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 08:14:18 +0200
Received: by fxm6 with SMTP id 6so3452611fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=DvgIxmTVbDjdATfRaqfmNmiirS5AIaexBusc4RY0B08=;
	b=a5ZpgLqGrsDDdgHVUE5lRLG9ADi58dCK8f09I0+qoMY9BSP5sJpRrBlqifAneGGaRN
	I6JPkYayapAtvW7jIIpNzbzmGGsE0mmOy1sYWujY94XmrhcYGi1Mo2qWKGHnPUlwa6Vc
	vkU4ujduDwKzZ+oCpPgr8+gubfTdQxAstHJtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Jbh/pYvmFURb4UTVcYE4GIZJIfmWD1PGkdj9gEe5Q+8RN3NWCZe4eC9ZwzBISrDmGB
	YemmlA1PkcraIKl4XkTafaVOUkYQpkUIYM/O9kQrbJpMJbKt1mu0hEKnb3HX8gyRcTaA
	IE/BdJK90vBGTfkyAaAoZfZeIm1DdZhKW6JtU=
Received: by 10.223.123.79 with SMTP id o15mr6042591far.12.1282025640028;
	Mon, 16 Aug 2010 23:14:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r10sm2804427faq.29.2010.08.16.23.13.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 23:13:59 -0700 (PDT)
Date: Tue, 17 Aug 2010 08:14:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817061411.GC11569@jama>
References: <E1OhMNp-0001vS-Ot@melo.openembedded.org>
	<AANLkTimcUgoNO73WXbn2R1O-pgXT-4raSGjtsHa8SvOC@mail.gmail.com>
	<4C609035.7080500@gmail.com>
	<AANLkTinwNNmb-b2dDWycBeKmPWK4JP0sjYAYYZhmKwau@mail.gmail.com>
	<4C69D533.7060902@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C69D533.7060902@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rootfs_ipk.bbclass: remove host's lists in /var/lib/opkg/*
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
X-List-Received-Date: Tue, 17 Aug 2010 06:14:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 17, 2010 at 09:47:55AM +0930, Graham Gower wrote:
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  classes/rootfs_ipk.bbclass |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index db04fb6..915e3d7 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -98,15 +98,19 @@ fakeroot rootfs_ipk_do_rootfs () {
>  		else
>  			rm -f ${IMAGE_ROOTFS}${libdir}/opkg/lists/*
>  		fi
> -	
> +
> +		# Remove lists, but leave SHR's tmp dir if it exists.
> +		rm -f ${IMAGE_ROOTFS}/var/lib/opkg/* || true
> +
>  		# Keep these lines until package manager selection is implemented
>  		ln -s opkg ${IMAGE_ROOTFS}${sysconfdir}/ipkg
>  		ln -s opkg ${IMAGE_ROOTFS}${libdir}/ipkg
>  	else
>  		rm -rf ${IMAGE_ROOTFS}${libdir}/opkg
>  		rm -rf ${IMAGE_ROOTFS}/usr/lib/opkg
> +		rm -rf ${IMAGE_ROOTFS}/var/lib/opkg
>  	fi
> -	
> +
>  	log_check rootfs 	
>  	rm -rf ${IPKG_TMP_DIR}
>  }
> -- 
> 1.7.1
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


