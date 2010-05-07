Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OAP9U-0001MN-W3
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 17:07:45 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id A349B491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 17:03:57 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 7 May 2010 17:05:03 +0200
Message-ID: <4BE42BFB.2020806@dresearch.de>
Date: Fri, 07 May 2010 17:04:27 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE41DF5.7040805@dresearch.de>	<1273242036-7529-1-git-send-email-sledz@dresearch.de>
	<20100507144927.GH3204@jama>
In-Reply-To: <20100507144927.GH3204@jama>
X-OriginalArrivalTime: 07 May 2010 15:05:03.0683 (UTC)
	FILETIME=[ABFEF130:01CAEDF6]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Fri, 07 May 2010 15:07:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 07.05.2010 16:49, Martin Jansa wrote:
>> +pkg_preinst_${PN}-syslog () {
>> +    # this is needed to avoid sysmlink errors,
>> +    # because update-rc.d runs before pkg_postinst :(
>> +    touch {sysconfdir}/init.d/syslog
> 
> missing $

<Grrrr>

> touch: cannot touch `{sysconfdir}/init.d/syslog': No such file or directory
> 
> but even when I add $ here it should fail like
> update-alternatives: Error: not linking //usr/bin/time to ../../bin/busybox since //usr/bin/time exists and is not a link
> 
> but fails a bit different
> 
> Configuring busybox-syslog.
> update-rc.d: /etc/init.d/syslog: file does not exist
> update-alternatives: Linking //etc/init.d/syslog to syslog.busybox

Are you sure that you run the patched version? It looks like
running a version without touch in pkg_preinst.

> ...
>> -INITSCRIPT_NAME = "sysklogd"
>> -INITSCRIPT_PARAMS = "start 39 S 1 2 3 . stop 99 0 6 ."
> 
> params not needed anymore?

Fall back to the defaults like in all the other syslog recipes.

Regards,
Steffen



