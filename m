Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OAODk-0003Ls-UD
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 16:08:05 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id B3BA3491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 16:04:17 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 7 May 2010 16:05:23 +0200
Message-ID: <4BE41DF5.7040805@dresearch.de>
Date: Fri, 07 May 2010 16:04:37 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE25BFD.2090204@dresearch.de>
	<hrtmn1$bp1$3@dough.gmane.org>	<4BE3C542.4070603@dresearch.de>
	<4BE3F2AE.8060305@dresearch.de>	<20100507110900.GF3204@jama>
	<4BE40F58.2000905@dresearch.de> <20100507130851.GG3204@jama>
In-Reply-To: <20100507130851.GG3204@jama>
X-OriginalArrivalTime: 07 May 2010 14:05:23.0605 (UTC)
	FILETIME=[561A6450:01CAEDEE]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: All the syslogs
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
X-List-Received-Date: Fri, 07 May 2010 14:08:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> Would be a
>>
>>     touch {sysconfdir}/init.d/syslog
> 
> :) also option, but u-a should at least show warning that link file is
> not and link and in worse scenario refuse to replace non-link file with
> link to alternative (IIRC the case for u-a-cworth and his variant
> included in opkg).
> 
> What I had in mind was adding:
> update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
> after u-a call in postinst and similar
> update-rc.d $OPT ${INITSCRIPT_NAME} remove
> in postrm, etc.

I would prefer my method because the update-rc.d class does
a bit more than just calling update-rc.d (e.g. stop running
services). And i thing it's not a good idea to duplicate the
whole code.

Regards,
Steffen



