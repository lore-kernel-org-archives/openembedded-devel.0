Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1PAJuG-0003Ju-Ok
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 12:03:58 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7913E491278
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 12:03:13 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Oct 2010 12:03:13 +0200
Message-ID: <4CC555E7.2010000@dresearch.de>
Date: Mon, 25 Oct 2010 12:03:19 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.11) Gecko/20101013 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DB561678F08F554EB0D9F21B70E268A505AF5C@exchange.intern.dresearch.de>
	<1288000524-18800-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1288000524-18800-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 25 Oct 2010 10:03:13.0607 (UTC)
	FILETIME=[D62FE570:01CB742B]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] epiphany-2.30.2: unbreak do_configure by setting ca-file path
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
X-List-Received-Date: Mon, 25 Oct 2010 10:03:59 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Am 25.10.2010 11:55, schrieb Steffen Sledz:
> * Disable existence check for ca-bundle file in configure.ac because
>   it does not work in OE cross compile environment (location at build
>   host may differ from location at target).
> * Explicitely set ca-bundle file path according to the one used by
>   ca-certificates package.
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

This is a patch implementing the first option i mentioned (Use the --with-ca-file option but disable the existance check in configure.ac).

If there are no better solutions in the next time i'll push this one.

Steffen




