Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P7qHT-0004qb-Nf
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 16:01:41 +0200
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 71538CE32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 15:38:26 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmYVAFvqu0xT4zjzPGdsb2JhbAAHgxeEUos/jggBAQEBNatOkgeBIoMzdASKSg
X-IronPort-AV: E=Sophos;i="4.57,345,1283724000"; d="scan'208";a="1682655350"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.250]) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 18 Oct 2010 15:38:25 +0200
Message-ID: <4CBC4DD4.3010908@atmel.com>
Date: Mon, 18 Oct 2010 15:38:28 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
In-Reply-To: <201010181520.30454.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 62.127.194.21
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Mon, 18 Oct 2010 14:01:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz skrev:
> Dnia sobota, 16 pa=C5=BAdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.=
com=20
> napisa=C5=82(a):
>=20
>> +++ b/conf/machine/include/at91-2.6.30.inc
>> +++ b/conf/machine/include/at91-2.6.32.inc
>=20
> Do you plan to duplicate that file with each kernel you will produce? C=
reate=20
> include/at91-sam9.inc and put it there.
>=20
> Regards,=20

This is to allow different kernel versions for different AT91 chips.
This allows both a "stable" version, and a development kernel
to be easily handled.

The file defines (amongst other things) the
* kernel version,
* u-boot version
* at91bootstrap version
so you need one file per version.

There are basically two choices.
1) versions in one file per kernel, and functions in a common include fil=
e.
2) versions and functions in one file per kernel

I do not see how a single include file will give me this flexibility,
but I am open to suggestions.

Best Regards
Ulf Samuelsson



