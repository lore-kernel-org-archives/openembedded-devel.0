Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pppkp-0001rZ-3y
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:21:47 +0100
Received: by yxd5 with SMTP id 5so823986yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=CAvF3OEOAcADKw6wNXI4ecWI9XuIWTimTj/P69SUEwQ=;
	b=xecHhsFE6XcO694KGK0FNXepWZNOu7MqzZc8Kr0Q2niOt1R/THzZBfzhnuXgZ7HHVQ
	t0AghV2XblEJrADaJr4RURyLoUpo087eiackIwn8K63sl2WgD6iy15F5+xbTfmkKkUrx
	TeW0Fim2eH5MDJffr3Y3WZrUYs0Mw4gyLyw64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=sr0ntMnX9dSOr9/gH3Vgt3Nmw2kulNeUeyRx4qdttEZEuJRJHGPCQ81p4vTiWsD8pJ
	gmkmHO4Iy9hmXbqsBjljkvDjBk17IIwT6HWVclJyB9Tyvdx33C2Rc8F7m1WdGEXGW9g3
	6/uLSItpAoLE0T4x1g1Hbfyi8pZezmptWGPco=
Received: by 10.236.108.167 with SMTP id q27mr2095952yhg.36.1297894834178;
	Wed, 16 Feb 2011 14:20:34 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 66sm131114yhl.46.2011.02.16.14.20.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:20:33 -0800 (PST)
Date: Wed, 16 Feb 2011 14:20:35 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216222035.GD14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Chris Larson <chris_larson@mentor.com>
References: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
	<1297894063-27374-2-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1297894063-27374-2-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/4] autotools: shift deps into AUTOTOOLS_DEPENDS
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
X-List-Received-Date: Wed, 16 Feb 2011 22:21:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 15:07), Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/autotools.bbclass |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index 60925e9..3c124ae 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -21,11 +21,13 @@ def autotools_deps(d):
>              not d.getVar('INHIBIT_DEFAULT_DEPS', True)):
>              deps += 'libtool-cross '
>  
> -    return deps + 'gnu-config-native '
> +    return deps + ' gnu-config-native'
>  
> -DEPENDS_prepend = "${@autotools_deps(d)}"
> -DEPENDS_virtclass-native_prepend = "${@autotools_deps(d)}"
> -DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d)}"
> +AUTOTOOLS_DEPENDS = "${@autotools_deps(d)}"
> +
> +DEPENDS_prepend = "${AUTOTOOLS_DEPENDS} "
> +DEPENDS_virtclass-native_prepend = "${AUTOTOOLS_DEPENDS} "
> +DEPENDS_virtclass-nativesdk_prepend = "${AUTOTOOLS_DEPENDS} "
>  
>  autotools_do_configure () {
>      autotools_do_bootstrap
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


