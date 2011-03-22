Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q25Lz-0001WF-CT
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 18:26:52 +0100
Received: by iyb26 with SMTP id 26so7945974iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=NGtO2fO8kVCr3fYPVdqk7KXQmIlEfrCnDN03ZUxMJE0=;
	b=NxRpdytFsmByyKzuvQYA7DFKx+dBTHWv/Z97H09o6oYvKbDIVdYR3zeFoQapcUuhpH
	UbXxLY/o9u5ie0I38xL+/qKdJkRu2wJmF+XZbohcvJiS29XwklXeQIElMF3gyDRc1LhE
	CtkqWiQhMjOQ9bya0bvp7FdvQoY8OrE/LvMoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=szYGhvWA53/pUNdpiQkB3qrGa8XKpsz8vBNn4zdN+uaCcNTky6hOvhlltnZtzN90D9
	BfqMft/FVdr/RuDgj3zLvjWAAcETXvBkieDFNDVEW+fcrgoH6HwfUM2ONjHbjzLdFV4r
	Yw+mNSIxP89B9D6itmxgbQkyuGNE0Gj6UzIH4=
Received: by 10.43.54.83 with SMTP id vt19mr9503336icb.155.1300814683626;
	Tue, 22 Mar 2011 10:24:43 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d10sm4514494ibb.17.2011.03.22.10.24.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 10:24:42 -0700 (PDT)
Date: Tue, 22 Mar 2011 10:24:57 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322172457.GC22283@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1300787993.3827.18.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1300787993.3827.18.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] ipkg.inc: remove unused `do_stage()`
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
X-List-Received-Date: Tue, 22 Mar 2011 17:26:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 10:59), Paul Menzel wrote:
> Date: Tue, 22 Mar 2011 09:53:17 +0100
> 
> `do_stage()` is also present in `ipkg_0.99.163.bb` which is the only recipe available for `ipkg`.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

I think we do not use ipkg anywhere now a days can you instead look into
removing these bits
> ---
>  recipes/ipkg/ipkg.inc |   11 -----------
>  1 files changed, 0 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes/ipkg/ipkg.inc b/recipes/ipkg/ipkg.inc
> index c28cf8b..701322c 100644
> --- a/recipes/ipkg/ipkg.inc
> +++ b/recipes/ipkg/ipkg.inc
> @@ -43,17 +43,6 @@ do_install_append() {
>  	install -m 0755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/
>  }
>  
> -do_stage() {
> -	oe_libinstall -so libipkg ${STAGING_LIBDIR}
> -	install -d ${STAGING_INCDIR}/replace/
> -	install -m 0644 replace/replace.h ${STAGING_INCDIR}/replace/
> -	install -d ${STAGING_INCDIR}/libipkg/
> -	for f in *.h
> -	do
> -		install -m 0644 $f ${STAGING_INCDIR}/libipkg/
> -	done
> -}
> -
>  #
>  # FIXME: Install /etc/ipkg.conf and /etc/ipkg/arch.conf
>  #
> -- 
> 1.7.4.1



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
-Khem


