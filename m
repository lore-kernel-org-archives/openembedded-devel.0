Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLR6Y-0001vz-En
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 03:26:33 +0200
Received: by pzk31 with SMTP id 31so1417900pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 18:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=N1dCY/Yjx54WozL/0oFO6YB2xSX5gT4dI1NhlXa5cto=;
	b=pGAgNMpQGY4eFndWHPWsUmDPOXeO+CTYDIs5DBarO3D6AjIOJACxHdlONKY2XF+9m4
	y9SZQI3+fPMi86+B62Ph28S/qA4K9fSqTksVYEgu4k96LJWOlLM4oacoHOF2SybLfiWy
	TZYlEOaMHaUYFjZDituNUQFFrQe6sk/KGWB7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xdDfncNyYDDbnzwYOkCC13p/Y9JfOs9hwrzpbevG6edswZEwzut5G5WlhxppL/ELzP
	eUVQqrirDBB1N06fNkwttBhpJLCWYI6mAP1ZXQNGRvWNjJuNnb48MoIOmdz5aGMirpON
	eoId3Lo4bCIbTqkPQ1W2SxtNM2GqWOogIL3hI=
Received: by 10.115.133.14 with SMTP id k14mr11029805wan.73.1275873711315;
	Sun, 06 Jun 2010 18:21:51 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n32sm33916924wae.22.2010.06.06.18.21.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 18:21:50 -0700 (PDT)
Date: Sun, 6 Jun 2010 18:21:53 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607012153.GG6723@gmail.com>
References: <1275853110-22560-1-git-send-email-michael.lippautz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1275853110-22560-1-git-send-email-michael.lippautz@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] zziplib: Convert zu new staging
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
X-List-Received-Date: Mon, 07 Jun 2010 01:26:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (06/06/10 21:38), Michael Lippautz wrote:
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>

thanks applied after editing commit message a bit.

> ---
>  recipes/zziplib/zziplib_0.13.49.bb |    8 +-------
>  1 files changed, 1 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes/zziplib/zziplib_0.13.49.bb b/recipes/zziplib/zziplib_0.13.49.bb
> index 2effd91..3aecb74 100644
> --- a/recipes/zziplib/zziplib_0.13.49.bb
> +++ b/recipes/zziplib/zziplib_0.13.49.bb
> @@ -1,17 +1,11 @@
>  require zziplib.inc
>  
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI += "\
>    file://zip_c.patch \
>    file://zziplib-autoconf.patch \
>    "
>  
> -#EXTRA_OECONF = "--srcdir=${S} --enable-builddir=${S}/build"
> -
> -do_stage() {
> -  autotools_stage_all
> -}
> -
>  SRC_URI[md5sum] = "5f7b88ebb2bcd7e8044328482d079661"
>  SRC_URI[sha256sum] = "f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af"
> -- 
> 1.6.4.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


