Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nf7GS-0003t7-Nt
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 08:45:39 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 9373D491283
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 08:43:05 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 10 Feb 2010 08:44:03 +0100
Message-ID: <4B726388.7070109@dresearch.de>
Date: Wed, 10 Feb 2010 08:43:04 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B7145A5.70808@dresearch.de>
	<f96d234e1002091314n6d8d1698pc1ce00c269dc3feb@mail.gmail.com>
In-Reply-To: <f96d234e1002091314n6d8d1698pc1ce00c269dc3feb@mail.gmail.com>
X-OriginalArrivalTime: 10 Feb 2010 07:44:03.0194 (UTC)
	FILETIME=[D0CA3DA0:01CAAA24]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: confused by netbase/udev
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
X-List-Received-Date: Wed, 10 Feb 2010 07:45:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> I ended up just removing the following files from my build, and now it
> works as I expect -- the first USB NIC is always eth0, etc.
> 
> 70-persistent-net.rules
> 75-persistent-net-generator.rules

I believe that's what we want.

BTW, what's the best way to remove them from the build? Something like
this in udev_141.bb?

do_install_append_hipox() {
 rm -f {D}${sysconfdir}/udev/rules.d/75-persistent-net-generator.rules
}

Steffen



