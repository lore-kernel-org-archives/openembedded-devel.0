Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NenYJ-000200-Fk
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 11:42:46 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 15E68491274
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 11:40:13 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 9 Feb 2010 11:41:07 +0100
Message-ID: <4B713BA2.7020404@dresearch.de>
Date: Tue, 09 Feb 2010 11:40:34 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B701EA0.5090304@dresearch.de>
	<20100208163520.GA7674@merkur.sol.de>
In-Reply-To: <20100208163520.GA7674@merkur.sol.de>
X-OriginalArrivalTime: 09 Feb 2010 10:41:08.0022 (UTC)
	FILETIME=[63449560:01CAA974]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: configure failes for mc-4.6.2-r4
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
X-List-Received-Date: Tue, 09 Feb 2010 10:42:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jens Seidel wrote:
>> ERROR: function do_configure failed
>> ERROR: log data follows (/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/temp/log.do_configure.3914)
>> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint
> 
>> | autoreconf: configure.ac: not using Gettext
> 
>> | configure.ac:104: required file `config/config.rpath' not found
> 
> As far as I remember config/config.rpath is added by autopoint which
> provides translation support. I call in my scripts
> $ autopoint --force
> after
> $ autoreconf --force --install -I config
> 
> I wonder about the "not using Gettext" but the problem is probably
> "--exclude=autopoint".

Sounds good. Can you try to create a patch?

Steffen



