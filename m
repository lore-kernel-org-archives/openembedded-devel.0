Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1GeIrd-0004C5-9A
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Oct 2006 23:10:45 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 653294295E;
	Mon, 30 Oct 2006 09:10:11 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10957-05; Mon, 30 Oct 2006 09:10:06 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 933404295D;
	Mon, 30 Oct 2006 09:10:06 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 5B5D115EBF69; Mon, 30 Oct 2006 09:10:06 +1100 (EST)
Date: Mon, 30 Oct 2006 09:10:06 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Message-ID: <20061029221005.GA27629@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Marcin Juszkiewicz <openembedded@hrw.one.pl>,
	openembedded-devel@lists.openembedded.org
References: <200610291528.40663.openembedded@hrw.one.pl>
Mime-Version: 1.0
In-Reply-To: <200610291528.40663.openembedded@hrw.one.pl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: handling of machine/distro features stuff
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
X-List-Received-Date: Sun, 29 Oct 2006 22:10:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 29, 2006 at 03:28:39PM +0100, Marcin Juszkiewicz wrote:
> 
> Currently OpenEmbedded use overrides based on DISTRO, MACHINE, TARGET_ARCH 
> and few others. I want to suggest start of using also 
> {MACHINE,DISTRO}_FEATURES because we have some stuff in metadata which 
> make sense only on some targets only - for example madwifi is limited to 
> PCI devices only.

In general that sounds reasonable.

I've also run into problems before with things that depend on PCMCIA
which I don't have built into any of my kernels.

If you are going to do this it might be nice to make pci and mini-pci
separate features, since I don't want to build loads of pci device
and driver related stuff when my target devices only have mini-pci.
All my current mad-wifi cards for here are mini-pci.

[...]
> I remove madwifi stuff from wpa-supplicant recipe then I will get working 
> version. But this cannot be pushed back into repo because NSLU2 related 
> distros want version with madwifi support.

Yep. I need madwifi support in wpa-supplicant for my router distro
and associated target devices as well.

-- 
 Jamie Lenehan <lenehan@twibble.org>


