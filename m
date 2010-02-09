Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NeqBv-0003xd-MA
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 14:31:50 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 9D5661D360E2; Tue,  9 Feb 2010 14:29:13 +0100 (CET)
Date: Tue, 9 Feb 2010 14:29:13 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209132913.GC24852@ibawizard.net>
References: <4B7145A5.70808@dresearch.de> <1265716784.16488.1.camel@mattotaupa>
	<4B716090.2090104@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B716090.2090104@dresearch.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
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
X-List-Received-Date: Tue, 09 Feb 2010 13:31:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Steffen Sledz <sledz@dresearch.de> [2010-02-09 14:18:08]:

>  # Wired or wireless interfaces
>  auto eth0
>  iface eth0 inet dhcp
>  iface eth1 inet dhcp
> 
> But i'm not sure what this part means (especially what means 'auto'
> here. Where can i found some documentation about the content of this
> config file. The busybox and ifup/ifdown manpages are not very helpful
> here. :(

man 5 interfaces?

Quote:

" lines beginning with the word "auto" are used to identify the physical
interfaces to be brought up when ifup is run with  the  -a  option.   (This
option  is  used  by  the  system  boot scripts.)  Physical interface names
should follow the word "auto" on the same line.  There can be multiple "auto"
stanzas.  ifup brings the named interfaces up in the order listed.  "

> And another problem is the mentioned naming. If every connected
> USB-NIC gets a new name i cannot refer to it in this config file.

You can get unique name/symlink using udev rule.

-- ynezz


