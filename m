Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nr6kw-0001fs-W3
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:38:43 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 2FE0EC11C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 10:35:36 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj0XAF6cnUtT4zvyPGdsb2JhbAAHmnMBAQEBN4hOrVGEewQ
X-IronPort-AV: E=Sophos;i="4.49,641,1262559600"; d="scan'208";a="50303111"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 15 Mar 2010 10:35:36 +0100
Message-ID: <4B9DFF67.5030209@atmel.com>
Date: Mon, 15 Mar 2010 10:35:35 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268640007-6783-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1268640007-6783-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 195.54.99.196
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/1] alsa-state: Support all atmel at91 boards
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
X-List-Received-Date: Mon, 15 Mar 2010 09:38:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I will resubmit the alsa-state patch using

SOC_CLASS="at91"  in conf/machine/at91*

and

SRC_URI_at91 = "\
	file://at91/asound.conf \
	file://at91/asound.state \
	file://alsa-state \
	"

in alsa-state.bb

-- 
Best Regards
Ulf Samuelsson

Ulf Samuelsson skrev:
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> ---
>  recipes/alsa/alsa-state.bb                         |   29 ++-
>  recipes/alsa/alsa-state/at91/asound.conf           |    2 +
>  recipes/alsa/alsa-state/at91/asound.state          |  283 ++++++++++++++++++++
>  recipes/alsa/alsa-state/at91sam9263ek/asound.conf  |    2 -
>  recipes/alsa/alsa-state/at91sam9263ek/asound.state |  283 --------------------
>  recipes/alsa/alsa-state/at91sam9g45ek/asound.conf  |    2 -
>  recipes/alsa/alsa-state/at91sam9g45ek/asound.state |  283 --------------------
>  7 files changed, 313 insertions(+), 571 deletions(-)
>  create mode 100644 recipes/alsa/alsa-state/at91/asound.conf
>  create mode 100644 recipes/alsa/alsa-state/at91/asound.state
>  delete mode 100644 recipes/alsa/alsa-state/at91sam9263ek/asound.conf
>  delete mode 100644 recipes/alsa/alsa-state/at91sam9263ek/asound.state
>  delete mode 100644 recipes/alsa/alsa-state/at91sam9g45ek/asound.conf
>  delete mode 100644 recipes/alsa/alsa-state/at91sam9g45ek/asound.state
> 
> diff --git a/recipes/alsa/alsa-state.bb b/recipes/alsa/alsa-state.bb
> index d77db70..c487455 100644
> --- a/recipes/alsa/alsa-state.bb
> +++ b/recipes/alsa/alsa-state.bb
> @@ -5,9 +5,16 @@
>  # Filename: alsa-state.bb
>  
>  DESCRIPTION = "Alsa Scenario Files"
> +LICENSE = "MIT"# Copyright Matthias Hentges <devel@hentges.net> (c) 2007
> +# License: MIT (see http://www.opensource.org/licenses/mit-license.php
> +#               for a copy of the license)
> +#
> +# Filename: alsa-state.bb
> +
> +DESCRIPTION = "Alsa Scenario Files"
>  LICENSE = "MIT"
>  PV = "0.2.0"
> -PR = "r11"
> +PR = "r12"
>  
>  SRC_URI = "\
>    file://asound.conf \
> @@ -19,6 +26,25 @@ SRC_URI_append_a780 = "file://gsmhandset.state \
>                         file://gsmheadset.state \
>  		       file://stereoout.state"
>  
> +ALSA_STATE_AT91 = "\
> +	file://at91/asound.conf \
> +	file://at91/asound.state \
> +	file://alsa-state \
> +	"
> +
> +SRC_URI_at91sam9260ek		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9261ek		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9263ek		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9g10ek		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9g20ek		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9g20ek_2mmc	= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9g45ek		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9g45ekes		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9m10ekes		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9m10g45ek	= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9rlek		= " $(ALSA_STATE_AT91} "
> +SRC_URI_at91sam9xeek		= " $(ALSA_STATE_AT91} "
> +
>  inherit update-rc.d
>  
>  INITSCRIPT_NAME = "alsa-state"
> @@ -59,3 +85,4 @@ pkg_postinst_${PN}() {
>  		update-rc.d ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
>  	fi
>  }
> +




