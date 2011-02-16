Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pppoa-00020j-VY
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:25:41 +0100
Received: by pxi17 with SMTP id 17so258527pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=RzXZ2qA5dNqgGeK9LaJQhwnX9mtyrk18t/RA1Jx6o3s=;
	b=UF4HCR4KvBn2LceDXa/oC4f3lbzKyjwyq7YWQcpD2494Bxbxm/TrlziQMlW0Ei9ije
	Hpt6xnakq0NVMUBOxmBzR7UP2tXUz27/kcnKQMd3nGRX1YiTx23qtjv8esYgtGd9mnfg
	EhV9aj35jK3FZF2XyZ21cw5Bh1nvHkzg7Tkmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=KiddP0WyqZMqqx4vpiBhosThedLtAYnK7ocv3c+7ZnKJqzfAVAAFw6xxsOrpZam8no
	EY4K8e387hDS+ZMdwNCs0gOH/C06xI03f9c2ndZ7yvqnm8d0VobXROzbLJ5TKo0Z5/la
	5LYx6qcInixkXmmwt1z9vxevYcJBhdC4CxCHc=
Received: by 10.142.230.12 with SMTP id c12mr890316wfh.289.1297895068418;
	Wed, 16 Feb 2011 14:24:28 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm296258wfh.6.2011.02.16.14.24.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:24:27 -0800 (PST)
Date: Wed, 16 Feb 2011 14:24:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216222430.GE14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Chris Larson <chris_larson@mentor.com>
References: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
	<1297894063-27374-3-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1297894063-27374-3-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 3/4] autotools: add INHIBIT_AUTOTOOLS_BOOTSTRAP
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
X-List-Received-Date: Wed, 16 Feb 2011 22:25:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 15:07), Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> Setting this variable to a true value (obeying the semantics of the 'boolean'
> type in oe.types) will result in not running autoreconf, and not depending on
> the things which the autoreconf requires.  Note that the
> config.guess/config.sub files are still updated when using
> INHIBIT_AUTOTOOLS_BOOTSTRAP, and these are updated directly via a find+ln
> rather than through gnu-configize usage in order to avoid the dependency upon
> autoconf/automake (gnu-configize is included with gnu-config, but requires the
> perl modules from the other recipes).
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/autotools.bbclass |   29 ++++++++++++++++++++++-------
>  1 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index 3c124ae..dd52e03 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -2,26 +2,31 @@ require classes/autotools/staging.inc
>  require classes/autotools/bootstrap.inc
>  require classes/autotools/configure.inc
>  
> +INHIBIT_AUTOTOOLS_BOOTSTRAP ?= "false"
> +INHIBIT_AUTOTOOLS_BOOTSTRAP[type] = "boolean"
> +
>  def autotools_deps(d):
>      if bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS', d, 1):
>          return ''
>  
> -    pn = bb.data.getVar('PN', d, 1)
> -    deps = ''
> +    deps = 'gnu-config-native'
> +    if oe.data.typed_value('INHIBIT_AUTOTOOLS_BOOTSTRAP', d):
> +        return deps
>  
> +    pn = bb.data.getVar('PN', d, 1)
>      if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
>          return deps
>  
> -    deps += 'autoconf-native automake-native help2man-native '
> +    deps += ' autoconf-native automake-native help2man-native'
>  
>      if pn not in ['libtool', 'libtool-native', 'libtool-cross']:
> -        deps += 'libtool-native '
> +        deps += ' libtool-native'
>          if (not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
>                                    'sdk') and
>              not d.getVar('INHIBIT_DEFAULT_DEPS', True)):
> -            deps += 'libtool-cross '
> +            deps += ' libtool-cross'
>  
> -    return deps + ' gnu-config-native'
> +    return deps
>  
>  AUTOTOOLS_DEPENDS = "${@autotools_deps(d)}"
>  
> @@ -29,8 +34,18 @@ DEPENDS_prepend = "${AUTOTOOLS_DEPENDS} "
>  DEPENDS_virtclass-native_prepend = "${AUTOTOOLS_DEPENDS} "
>  DEPENDS_virtclass-nativesdk_prepend = "${AUTOTOOLS_DEPENDS} "
>  
> +_INHIBITED = "${@base_ifelse(oe.data.typed_value('INHIBIT_AUTOTOOLS_BOOTSTRAP', \
> +                                                 d), \
> +                             'y', 'n')}"
>  autotools_do_configure () {
> -    autotools_do_bootstrap
> +    if [ "${_INHIBITED}" = "n" ]; then
> +        autotools_do_bootstrap
> +    else
> +        find ${S} -name config.guess -exec \
> +            ln -sf ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess "{}" \;
> +        find ${S} -name config.sub -exec \
> +            ln -sf ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub "{}" \;
> +    fi
>  
>      if [ -e ${S}/configure ]; then
>          oe_runconf $@
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


