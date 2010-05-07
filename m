Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OANFU-0006nH-9G
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 15:05:48 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 04870491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 15:02:01 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 7 May 2010 15:03:06 +0200
Message-ID: <4BE40F58.2000905@dresearch.de>
Date: Fri, 07 May 2010 15:02:16 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE25BFD.2090204@dresearch.de>
	<hrtmn1$bp1$3@dough.gmane.org>	<4BE3C542.4070603@dresearch.de>
	<4BE3F2AE.8060305@dresearch.de> <20100507110900.GF3204@jama>
In-Reply-To: <20100507110900.GF3204@jama>
X-OriginalArrivalTime: 07 May 2010 13:03:06.0761 (UTC)
	FILETIME=[A2C53F90:01CAEDE5]
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
X-List-Received-Date: Fri, 07 May 2010 13:05:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 07.05.2010 13:09, schrieb Martin Jansa:
>> When opkg installs the packages it wants to run update-rc.d *before*
>> update-alternatives. This results in an "file does not exist" error. :(
>>
>>   Installing rsyslog (5.5.4-r1.0.5) to root...
>>   Installing busybox-syslog (1.13.2-r24.1.5) to root...
>>   Configuring rsyslog
>>   update-rc.d: /etc/init.d/syslog: file does not exist
>>   update-alternatives: Linking //etc/init.d/syslog to syslog.rsyslog
>> Any suggestions?
> 
> If there is only one u-a file in recipe you can try
> inherit update-alternatives to see if it will generate postinst commands
> in right order.

Sorry, sometimes more than one.

> Or in worse case, move update-rc.d logic to your postinst scripts after
> setting u-a links.

Would be a

    touch {sysconfdir}/init.d/syslog

in pkg_preinst_${PN} be acceptable? It worked well in my test.

Regards,
Steffen



