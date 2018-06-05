Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id B6832786A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 23:33:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2018 16:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,479,1520924400"; d="scan'208";a="230225761"
Received: from tuzhen-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.70.49])
	by orsmga005.jf.intel.com with ESMTP; 05 Jun 2018 16:33:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 06 Jun 2018 11:33:28 +1200
Message-ID: <5113980.YQSFpsKea5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20180605133909.11319-2-nick83ola@gmail.com>
References: <20180605133909.11319-1-nick83ola@gmail.com>
	<20180605133909.11319-2-nick83ola@gmail.com>
MIME-Version: 1.0
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: Re: [PATCH 2/2] mosquitto: add mosquitto-examples package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2018 23:33:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 6 June 2018 1:39:09 AM NZST Nicola Lunghi wrote:
> From: Nicola Lunghi <nicola.lunghi@jci.com>
> 
> the mosquitto install populate some .example files in
> /etc/mosquitto. move thise example files in a separate package
> 
> The PACKAGE_BEFORE_PN is needed because otherwise those examples
> end in the base mosquitto package
> 
> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
> ---
>  .../recipes-connectivity/mosquitto/mosquitto_1.4.15.bb        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-networking/recipes-connectivity/mosquitto/
mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/
mosquitto_1.4.15.bb
> index c71f1e467f..8dd2124c41 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
> @@ -62,6 +62,8 @@ do_install() {
>  
>  PACKAGES += "libmosquitto1 libmosquittopp1 ${PN}-clients"
>  
> +PACKAGE_BEFORE_PN = "${PN}-examples"
> +
>  FILES_${PN} = "${sbindir}/mosquitto \
>                 ${bindir}/mosquitto_passwd \
>                 ${sysconfdir}/mosquitto \
> @@ -79,6 +81,8 @@ FILES_${PN}-clients = "${bindir}/mosquitto_pub \
>                         ${bindir}/mosquitto_sub \
>  "
>  
> +FILES_${PN}-examples = "${sysconfdir}/mosquitto/*.example"
> +
>  SYSTEMD_SERVICE_${PN} = "mosquitto.service"
>  
>  INITSCRIPT_NAME = "mosquitto"
> 

Both of these look good to me, FWIW

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



