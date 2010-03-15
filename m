Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1Nr9II-0005zZ-0B
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 13:21:16 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o2FCGc827891; 
	Mon, 15 Mar 2010 13:16:39 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Mon, 15 Mar 2010 13:00:11 +0100 (MET)
Received: from [127.0.0.1] (pc245_112.atmel.fr [10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o2FCI2g18512; 
	Mon, 15 Mar 2010 13:18:02 +0100 (MET)
Message-ID: <4B9E257E.3000201@atmel.com>
Date: Mon, 15 Mar 2010 13:18:06 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, ulf.samuelsson@atmel.com,
	marcin@juszkiewicz.com.pl
References: <201003150738.22158.marcin@juszkiewicz.com.pl>
	<1268659726-20887-1-git-send-email-nicolas.ferre@atmel.com>
In-Reply-To: <1268659726-20887-1-git-send-email-nicolas.ferre@atmel.com>
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.30: add linux4sam patches
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
X-List-Received-Date: Mon, 15 Mar 2010 12:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Le 15/03/2010 14:28, Nicolas Ferre :
> Introduce support for:
> 
> +	at91sam9260ek
> +	at91sam9261ek
> +	at91sam9g10ek
> +	at91sam9g20ek
> +	at91sam9g20ek_2mmc
> +	at91sam9g45ekes
> +	at91sam9m10ekes
> +	at91sam9rlek
> +	at91sam9xeek
> 
> and apply the Atmel experimental patch series from Linux4sam.org. A different
> SRC_URI is created and the patches are bundled in a patch archive.
> 
> AT91 specific bits are removed from the common 2.6.30 rule.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
> Marcin, what do you think of this patch architecture and URI management?
> 
> The defconfig are not included in this patch and shall be sent in another
> patch series.

Of course Ulf, if other patches have to be included after those ones
feel free to add them in another OE patch (I am thinking about NAND
patitions and Kconfig changes).

Bye,
-- 
Nicolas Ferre



