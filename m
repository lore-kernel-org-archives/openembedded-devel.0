Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PrlqB-00044G-Mz
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 07:35:20 +0100
Received: by iyb26 with SMTP id 26so1440058iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 22:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=3S72kLekR6LpTfUpPoa0gJBXfVl+fc8av93QeKrbfPA=;
	b=gaBAFDfkJi+grJ5IUyOvRmm/Dn2huWss7QFBdJBsf6THT/8xfwxg9vXHzLvymuHnwG
	Y6nss4Gh+pnG/D8sijQ8Chyq+bWRWiOt5UCR2R9eNCJteSYUsuMSxJvVeUqHoBKEN48h
	ErkQtU7XRy8h14e/GEJVx0fhDfWOW/ZGr8AOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=TNO3aTHH4qD5v0VyDovgoxJcJUyMdxg22pzKn9A/mLPzMu4wntyAZWStN2MJHMczee
	ShD/wWRsEaro2aFI5xIa8l5MxfQnjyyrdNg15Qi2QrBu3dRWD0T5Z3FCttBNJZFlNnDM
	v/ZXkt1XU6Bcn9/4+l6WuXuucYxY/n4DzP4Ao=
Received: by 10.231.12.67 with SMTP id w3mr1807103ibw.119.1298356437227;
	Mon, 21 Feb 2011 22:33:57 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm5890553iba.10.2011.02.21.22.33.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Feb 2011 22:33:56 -0800 (PST)
Date: Mon, 21 Feb 2011 22:34:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110222063404.GA13792@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4D62B96F.3010908@mwester.net>
MIME-Version: 1.0
In-Reply-To: <4D62B96F.3010908@mwester.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2] squid: fix references to host headers and libs
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
X-List-Received-Date: Tue, 22 Feb 2011 06:35:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/02/11 13:13), Mike Westerhof wrote:
> This patch changes hard-coded references to /usr and /opt in the various
> squid config.test scripts to point to the correct sysroot paths.
> This version accommodates the strange staging dir layout used by micro.
> 
> Signed-off-by: Mike Westerhof <mike@mwester.net>

this patch is good. It does not break micro more than what it would be
without this patch

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> diff --git a/recipes/squid/squid_3.1.9.bb b/recipes/squid/squid_3.1.9.bb
> index 713b1ea..ecd6fdc 100644
> --- a/recipes/squid/squid_3.1.9.bb
> +++ b/recipes/squid/squid_3.1.9.bb
> @@ -1,4 +1,4 @@
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
> 
>  include squid.inc
> 
> @@ -18,6 +18,11 @@ do_configure_prepend() {
>         export ac_cv_epoll_ctl=yes
>         export ac_cv_epoll_works=yes
>         export ac_cv_func_setresuid=yes
> +       # Patch up the various config scripts to refer to sysroot
> +       for i in `find ${S} -name config.test`; do
> +           sed -i -e 's|/usr|${STAGING_DIR_HOST}${exec_prefix}|g' \
> +                  -e 's|/opt|${STAGING_DIR_HOST}/opt|g' "$i"
> +       done
>  }
> 
>  do_install_append() {
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


