Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OAIJo-00043t-Bh
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:50:05 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 606DF491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 09:46:09 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 7 May 2010 09:47:14 +0200
Message-ID: <4BE3C542.4070603@dresearch.de>
Date: Fri, 07 May 2010 09:46:10 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE25BFD.2090204@dresearch.de> <hrtmn1$bp1$3@dough.gmane.org>
In-Reply-To: <hrtmn1$bp1$3@dough.gmane.org>
X-OriginalArrivalTime: 07 May 2010 07:47:14.0464 (UTC)
	FILETIME=[82523A00:01CAEDB9]
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
X-List-Received-Date: Fri, 07 May 2010 07:50:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 06.05.2010 08:13, wrote Koen Kooi:
>> Since i added the recipe for rsyslog we have three different
>> syslog implemenations in OE: (busybox-)syslog, syslog-ng, and
>> rsyslog.
> 
>> At the moment syslog-ng and rsyslog have pkg_postinst and pkg_postrm
>> stages which use update-rc.d to deinstall/reinstall init.d links
>> for (busybox-)syslog which is default.
> 
>> This seems to be a bad hack for me. I believe there must be better
>> solutions for this situation. But I'm not sure which is the preferred.
>> Is this a case for alternatives? Or something like
>> DISTRO_SYSLOG_DAEMON? Or something else?
> 
> DISTRO_* is the wrong namespace for that, it's a per-image choice. You
> could have a look at using u-a to changing initscripts and binaries.

OK, than i'll try to create an u-a setting for all the syslogs (btw: we
have not three but four different ones, there's sysklogd too).

Has anyone combined update-alternatives and update-rc.d for initscripts
before? I'm afraid there are some pitfalls in the naming of the initscript
itself and the symlinks.

Regards,
Steffen



