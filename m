Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NugvX-0007be-KP
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 07:52:29 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 70265491274
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 07:49:15 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 07:49:44 +0100
Message-ID: <4BAB076A.5070305@dresearch.de>
Date: Thu, 25 Mar 2010 07:49:14 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269419979-26397-1-git-send-email-sledz@dresearch.de>
	<20100324174300.GA16224@gmail.com>
In-Reply-To: <20100324174300.GA16224@gmail.com>
X-OriginalArrivalTime: 25 Mar 2010 06:49:44.0502 (UTC)
	FILETIME=[5A388D60:01CACBE7]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rsyslog: new recipe
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
X-List-Received-Date: Thu, 25 Mar 2010 06:52:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
>> +pkg_postinst() {
>> +        update-rc.d -f syslog remove
>> +}
> 
> AFAIK pkg_postinst is run after install here it seems this must be done
> after un-install.
> 
>> +
>> +pkg_postrm() {
>> +        update-rc.d syslog add 5
>> +}
> 
> pkg_postrm is run after uninstall and this seems to be adding the service
> may it should be revered ?

These steps are made similar to the ones in
recipes/syslog-ng/syslog-ng_2.0.5.bb which remove/reinstall the
default syslogd initscript (if i understand this right).

I believe that's a hack, but for now i would made it in the
same way. For the future we should look for a better way to
handle various syslogd's (alternatives or something like this).
I'll start an extra thread on this topic.

Steffen



