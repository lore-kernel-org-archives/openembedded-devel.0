Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1Nr7CH-0004eM-OO
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 11:06:59 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o2FA1v810052
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:02:18 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Mon, 15 Mar 2010 10:45:33 +0100 (MET)
Received: from [127.0.0.1] (pc245_112.atmel.fr [10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o2FA3Og08992; 
	Mon, 15 Mar 2010 11:03:24 +0100 (MET)
Message-ID: <4B9E05F0.7080701@atmel.com>
Date: Mon, 15 Mar 2010 11:03:28 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268608696-31002-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1268608696-31002-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH 1/2] linux-2.6.30: Add linux4sam patches
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
X-List-Received-Date: Mon, 15 Mar 2010 10:06:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Le 15/03/2010 00:18, Ulf Samuelsson :
> Do not apply .10 minor patch due to conflicts
> 
> Introduce support for:
> 
> +	at91sam9260ek
> +	at91sam9261ek
> +	at91sam9g10ek
> +	at91sam9g20ek
> +	at91sam9g20ek_2mmc
> +	at91sam9g45ek

This board name is not official name from Atmel. Be careful, it may
confuse people (as there are already may boards based on this chip pair
(9g45/9m10)).


> +	at91sam9g45ekes
> +	at91sam9m10ekes
> +	at91sam9rlek
> +	at91sam9xeek
> 
> Leave at91sam9263ek patches as is for now.
> In addition: Add support for configurable NAND partition size
> checksums.ini updated in another patch
> 
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>

[..]

> --- a/recipes/linux/linux_2.6.30.bb
> +++ b/recipes/linux/linux_2.6.30.bb
> @@ -1,6 +1,6 @@

[..]

> +AT91_EXP_PATCHES = " \
> +	${KERNEL_MINOR_0} \
> +	http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;patch=1 \
> +	ftp://www.at91.com/pub/buildroot/2.6.30-exp.2.patch.bz2;patch=1 \

NAK

The latest atmel experimental patch series is here:
ftp://ftp.linux4sam.org/pub/linux/2.6.30-at91/2.6.30-at91-exp.3.tar.gz

=> note the exp.3 and not exp.2 that you are using...

> +	file://at91/linux-2.6.30-001-configurable-partition-size.patch.patch;patch=1 \
> +	file://at91/linux-2.6.30-002-mach-at91-Kconfig.patch;patch=1 \
> +	file://at91/linux-2.6.30-003-sam9m10g45ek.patch;patch=1 \
> +	"
> +
> +SRC_URI_append_at91sam9g10ek		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9g20ek_2mmc	=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9g45ek		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9g45ekes		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9m10ekes		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9260ek		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9261ek		=	" ${AT91_EXP_PATCHES} "
> +# SRC_URI_append_at91sam9263ek		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9rlek		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9xeek		=	" ${AT91_EXP_PATCHES} "
> +SRC_URI_append_at91sam9rlek		=	" ${AT91_EXP_PATCHES} "
> +
> +SRC_URI_append_at91sam9263ek = " \
> +	${KERNEL_MINOR_10} ${AUFS}	\
> +	http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;patch=1 \
> +	file://hrw-linux-2.6.30-exp.patch;patch=1 \
> +	"
>  


-- 
Nicolas Ferre



