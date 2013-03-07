Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UDZYb-0001a2-9b
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 13:04:24 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2013 03:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,800,1355126400"; d="scan'208";a="300849057"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2013 03:47:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 07 Mar 2013 11:47:46 +0000
Message-ID: <2494796.TIXTerytcv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1362129599-19779-1-git-send-email-jackie.huang@windriver.com>
References: <1362129599-19779-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, Jackie.Huang@windriver.com
Subject: Re: [meta-webserver][PATCH] modphp5: use ${baselib} instead of hardcoded "lib"
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
X-List-Received-Date: Thu, 07 Mar 2013 12:04:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 01 March 2013 17:19:59 jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> [ CQID: WIND00405358 ]
> 
> The hardcoded lib path will cause apache2 fail to start on
> the target with other baselib like lib64.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-webserver/recipes-php/modphp/modphp5.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc
> b/meta-webserver/recipes-php/modphp/modphp5.inc index 3302936..c359ff9
> 100644
> --- a/meta-webserver/recipes-php/modphp/modphp5.inc
> +++ b/meta-webserver/recipes-php/modphp/modphp5.inc
> @@ -67,6 +67,7 @@ do_install  () {
>  	install -d ${D}${sysconfdir}/apache2/modules.d
>  	install -d ${D}${sysconfdir}/php/apache2-php5
>  	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
> +	sed -i s,lib/,${baselib}/, ${WORKDIR}/70_mod_php5.conf
>  	install -m 644  ${WORKDIR}/70_mod_php5.conf
> ${D}${sysconfdir}/apache2/modules.d cat ${S}/php.ini-production | \
>  		sed -e 's,extension_dir = \"\./\",extension_dir =
> \"/usr/lib/extensions\",' \

I've merged this, minus the CQID from the commit message. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


