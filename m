Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGH5X-0005R7-94
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 23:20:43 +0200
Received: by iafi7 with SMTP id i7so1153421iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zOD22N13OnVSFqq2VhvUj40SPEPB/dC8NlTR2xNE6QE=;
	b=higUYxNaZpuwpGV746PRB3Awp9TNy45dTB1bHweiqauT5WgDsyy9B22u77KjxaIBgY
	2EzQUQty/cbW8wMTfD9xnl68EQYx4D3KBo48jDloxYU0dEaDDY1F9ufUpB+rhW3xN+61
	f3AQN6hioPLmI+RLvolQq6RY89if+13jnQDVY=
Received: by 10.42.164.67 with SMTP id f3mr7567133icy.41.1318972492821;
	Tue, 18 Oct 2011 14:14:52 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id p16sm8496444ibk.6.2011.10.18.14.14.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 14:14:52 -0700 (PDT)
Date: Tue, 18 Oct 2011 14:16:11 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018211611.GC27508@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1318971633-1534-1-git-send-email-pespin.shar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1318971633-1534-1-git-send-email-pespin.shar@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH][meta-efl]] dummy patch to try if patchwork bug is fixed
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
X-List-Received-Date: Tue, 18 Oct 2011 21:20:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 23:00), Pau Espin Pedrol wrote:
> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>

And it did not work since mailman served it as it is. I guess problem
might be in the mailman

> ---
>  meta-efl/recipes-efl/e17/efm-path_svn.bb |   15 ---------------
>  1 files changed, 0 insertions(+), 15 deletions(-)
>  delete mode 100644 meta-efl/recipes-efl/e17/efm-path_svn.bb
> 
> diff --git a/meta-efl/recipes-efl/e17/efm-path_svn.bb b/meta-efl/recipes-efl/e17/efm-path_svn.bb
> deleted file mode 100644
> index 685513f..0000000
> --- a/meta-efl/recipes-efl/e17/efm-path_svn.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -LICENSE = "MIT"
> -PV = "0.0.1+svnr${SRCPV}"
> -PR = "${INC_PR}.0"
> -
> -require e-module.inc
> -
> -SRCNAME = "E-MODULES-EXTRA/efm_path"
> -
> -do_configure_prepend() {
> -    sed -i -e /po/d configure.ac
> -    sed -i -e s:\ po::g Makefile.am
> -}
> -
> -FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug/"
> -FILES_${PN} += "${libdir}/enlightenment/modules/"
> -- 
> 1.7.7
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


