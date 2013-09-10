Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB016B05F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 11:03:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2013 04:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,877,1371106800"; d="scan'208";a="393528815"
Received: from akagikob-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.123.124])
	by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2013 04:03:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: rongqing.li@windriver.com
Date: Tue, 10 Sep 2013 12:03:37 +0100
Message-ID: <2240923.qfWRyOXVqG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1378791798-724-1-git-send-email-rongqing.li@windriver.com>
References: <1378791798-724-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-webserver] apache2: add apxs to SSTATE_SCAN_FILES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Sep 2013 11:03:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ronqing,

On Tuesday 10 September 2013 13:43:18 rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
> 
> apxs is installed under /usr/bin/crossscripts of sysroot, its hardcode paths
> should be handled when store or extracts the sstate archives.
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb index
> f230f94..fa14b07 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
> @@ -26,6 +26,8 @@ S = "${WORKDIR}/httpd-${PV}"
> 
>  inherit autotools update-rc.d
> 
> +SSTATE_SCAN_FILES = "*.la *-config *_config apxs"
> +
>  CFLAGS_append = " -DPATH_MAX=4096"
>  CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
>  EXTRA_OECONF = "--enable-ssl \

I think this should really be SSTATE_SCAN_FILES += "apxs" to allow the base 
value to change in future (assuming that works - it should do).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

