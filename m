Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1Ixj15-0007US-6W
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2007 14:01:20 +0100
Received: from openmoko ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Thu, 29 Nov 2007 12:58:15 +0000
	id 00068230.474EB768.00002F73
Date: Thu, 29 Nov 2007 12:58:01 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071129125801.31b1db05@openmoko>
In-Reply-To: <474EA852.7090306@whitby.id.au>
References: <474EA852.7090306@whitby.id.au>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 29 Nov 2007 13:01:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Nov 2007 22:23:54 +1030
Rod Whitby <rod@whitby.id.au> wrote:

> Some machines don't have consoles, so the only way to access them on
> the first boot after a reflash is via the network.
> 
> Of course, an 'auto' keyword is required for this, and netbase
> currently has none.
> 
> Is there any reason why at least eth0 should not have an 'auto'
> keyword?
> 
> Should this be OE-wide, only for Angstrom (koen thinks eth0 and eth1
> should be auto), or only for specific machines (in which case, does
> anyone object to ixp4xx having auto eth0)?
> 

It is quiet common to find commercial equipment doing this in the real
world. You just tell your dhcp server the MAC and you can find it on
first boot easilly.

So I think we should probably allow this as well.

+1 for me on eth0

G


