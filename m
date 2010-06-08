Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OLvZg-0007dT-Pz
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 11:58:25 +0200
Received: by fxm9 with SMTP id 9so2863620fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ITR5RiLtZXynL4vcubVohFrjOJj6zrXCxR6o39eXe1k=;
	b=PSHL62d2cX/YZRlNDd4sTKOwhPLa30TpiGiJlfoVthF9swvGiQUVLyQVGIfFUExyiW
	C/YeweMU2ZSjpFOxqiPsod4+m2zA3cgXi4l33W1A8xdMHta0qq1qnNqVnm5yDnavJ0B6
	KxKRFKDJCHcgUdCZWhqcZvfpnbFRWb4GMU3ig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hM9jazXw1TVUm6fDqN8E8cRrkDC3Jye271rUuSSx6WlbfirNIjgdkdyE2/SWd9irrb
	RT+u88UmUitT7GVNSX5eAWK2FQj9d6dDKXW8ZG9xISr8hxFA1rMozmqxmP80BAnacUpz
	5ZZ6uKEhQ9SDMRCHZaaADuHTM1BtTrUuhXtOM=
Received: by 10.223.45.83 with SMTP id d19mr16270033faf.65.1275990844222;
	Tue, 08 Jun 2010 02:54:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm24688444fah.4.2010.06.08.02.54.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Jun 2010 02:54:03 -0700 (PDT)
Date: Tue, 8 Jun 2010 11:53:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100608095356.GF1403@jama>
References: <E1OLvSl-0003gY-9Y@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OLvSl-0003gY-9Y@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Henning Heinold : zziplib: convert to BBCLASSEXTEND and use new patch system
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
X-List-Received-Date: Tue, 08 Jun 2010 09:58:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 08, 2010 at 09:51:15AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 8031ee4953f3510d53022ce0e53bc903d3089f30
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=8031ee4953f3510d53022ce0e53bc903d3089f30
> 
> Author: Henning Heinold <heinold@inf.fu-berlin.de>
> Date:   Tue Jun  8 01:34:58 2010 +0200
> 
> zziplib: convert to BBCLASSEXTEND and use new patch system
> 
> ---
> 
> diff --git a/recipes/zziplib/zziplib_0.13.49.bb b/recipes/zziplib/zziplib_0.13.49.bb
> index 3aecb74..256b13d 100644
> --- a/recipes/zziplib/zziplib_0.13.49.bb
> +++ b/recipes/zziplib/zziplib_0.13.49.bb
> @@ -3,8 +3,9 @@ require zziplib.inc
>  PR = "r2"
>  
>  SRC_URI += "\
> -  file://zip_c.patch \
> -  file://zziplib-autoconf.patch \
> +  file://zip_c.patch;apply=yes \
> +  file://zziplib-autoconf.patch;apply=yes \
> +  file://automake.patch;apply=yes \

Isn't apply=yes default for .patch, .diff extensions? Why did you need
to add it?

Thanks

Regards,
-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


