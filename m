Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNRVQ-0000fb-36
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 19:29:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2013 10:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288870694"
Received: from unknown (HELO helios.localnet) ([10.255.13.159])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 10:12:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 03 Apr 2013 18:12:37 +0100
Message-ID: <2628772.BzK2nQghDU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1364783617-29850-1-git-send-email-jackie.huang@windriver.com>
References: <1364783617-29850-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: Re: [meta-webserver][PATCH] modphp: use libdir instead of baselib to load module
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
X-List-Received-Date: Wed, 03 Apr 2013 17:29:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 April 2013 10:33:37 jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> When we change the apache2 files layout to debian style,
> the ServerRoot in httpd.conf was changed to "/" from "/usr",
> then the relative path to libphp5 module in 70_mod_php5.conf
> will be invalid so it fails to load the module, use libdir
> (absolute path) instead so it will always find the module.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-webserver/recipes-php/modphp/modphp5.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc
> b/meta-webserver/recipes-php/modphp/modphp5.inc index c359ff9..33dbe89
> 100644
> --- a/meta-webserver/recipes-php/modphp/modphp5.inc
> +++ b/meta-webserver/recipes-php/modphp/modphp5.inc
> @@ -67,7 +67,7 @@ do_install  () {
>  	install -d ${D}${sysconfdir}/apache2/modules.d
>  	install -d ${D}${sysconfdir}/php/apache2-php5
>  	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
> -	sed -i s,lib/,${baselib}/, ${WORKDIR}/70_mod_php5.conf
> +	sed -i s,lib/,${libdir}/, ${WORKDIR}/70_mod_php5.conf
>  	install -m 644  ${WORKDIR}/70_mod_php5.conf
> ${D}${sysconfdir}/apache2/modules.d cat ${S}/php.ini-production | \
>  		sed -e 's,extension_dir = \"\./\",extension_dir =
> \"/usr/lib/extensions\",' \

Merged, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


