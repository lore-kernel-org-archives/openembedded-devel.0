Received: from [216.145.234.92] (helo=demolition.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1IxkEV-0005Xm-L8
	for openembedded-devel@openembedded.org; Thu, 29 Nov 2007 15:19:16 +0100
Received: by demolition.dls.net (Postfix, from userid 67)
	id 0F72278; Thu, 29 Nov 2007 08:16:13 -0600 (CST)
From: <mwester@dls.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Thu, 29 Nov 2007 08:16:13 -0600
X-SentFrom: 208.97.118.162
X-SentAddr: 4675c051ba9e8885d6e5a82457605098ccf0a84b
User-Agent: DLS.net Webmail
References: <474EA852.7090306@whitby.id.au>
In-Reply-To: <474EA852.7090306@whitby.id.au>
Message-Id: <20071129141613.0F72278@demolition.dls.net>
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2007 14:19:19 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed

> Some machines don't have consoles, so the only way to access them on the
> first boot after a reflash is via the network.
> 
> Of course, an 'auto' keyword is required for this, and netbase currently
> has none.
> 
> Is there any reason why at least eth0 should not have an 'auto' keyword?
> 
> Should this be OE-wide, only for Angstrom (koen thinks eth0 and eth1
> should be auto), or only for specific machines (in which case, does
> anyone object to ixp4xx having auto eth0)?

I think the "principle of least surprise" would favor "auto eth0".  Most users expect that if it has a network port, regardless of what type of equipment "it" might be, it should make an attempt to join the network.

+1 for me.

Mike (mwester)


