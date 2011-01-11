Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pcffw-0007tc-LW
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 15:58:20 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 1D189491278;
	Tue, 11 Jan 2011 15:57:52 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 11 Jan 2011 15:57:52 +0100
Message-ID: <4D2C6FEF.7030506@dresearch.de>
Date: Tue, 11 Jan 2011 15:57:51 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ighiieMAN_POSIXLY_CORRECT=1@dough.gmane.org>	<1294774001-29322-1-git-send-email-sledz@dresearch.de>
	<1294756588.4307.7668.camel@mill.internal.reciva.com>
In-Reply-To: <1294756588.4307.7668.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 11 Jan 2011 14:57:52.0120 (UTC)
	FILETIME=[EB9F6780:01CBB19F]
Subject: Re: [PATCH v2] alsa-lib: fix packaging error
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
X-List-Received-Date: Tue, 11 Jan 2011 14:58:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 11.01.2011 15:36, schrieb Phil Blundell:
> On Tue, 2011-01-11 at 14:26 -0500, Steffen Sledz wrote:
>> * symlink libasound.so -> libasound.so.2.0.0 in /usr/lib was missing in
>>   dev package
> 
> Why doesn't the generic FILES_${PN}-dev from bitbake.conf catch this
> file?  Not that I think your patch is necessarily wrong but it isn't
> obvious to me why it is necessary.

The ALSA package structure seems to be a bit complex. There is an additional package named libasound but no libasound-dev. The development stuff is summed up in alsa-lib-dev.

BTW: I'm not an ALSA maintainer. Just tumbled over the missing symlink.

Steffen



