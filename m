Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHA65-0001gB-SI for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 09:32:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHA3a-0000Hh-R6 for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 09:30:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 09:30:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 09:30:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 May 2011 09:29:10 +0200
Message-ID: <ipoasc$8ti$1@dough.gmane.org>
References: <531B6536C9F737458807DF75064873C801ED5F36E7A6@mta-digimail.MTA.INT>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <531B6536C9F737458807DF75064873C801ED5F36E7A6@mta-digimail.MTA.INT>
X-Enigmail-Version: 1.0.1
Subject: Re: troubles building rule qt4-embedded
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
X-List-Received-Date: Tue, 03 May 2011 07:32:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-05-11 09:16, Bosi Daniele wrote:
> Guys,
> I have got some troubles building the rule qt4-embedded, during the build of "meta-toolchain-qte".
> I'm working on an embedded board with a mpc5121 powerpc, using a "angstrom-2008.1" machine.
> 
> Down here I post the output of the building process. After a first look it seems like the makefile has an "-mmmx" option that is unsupported from the powerpc-linux-g++ compiler.
> Someone has any suggestions to fix this problem?


> NOTE: Running task 1074 of 1527 (ID: 5, /opt/OE/org.cnh_fred.dev/recipes/qt4/qt4-embedded_4.5.1.bb, do_configure)

There's no 4.5.1 in the maintenance branch, so you are using a really
old version. Please update to the latest
(http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=2011.03-maintenance)
before reporting a bug.

The easiest way to setup the maintenance branch for angstrom would be to
follow the instructions at
http://www.angstrom-distribution.org/building-angstrom
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNv67GMkyGM64RGpERAi2LAKCYByyvMO4fqplq5Tk5MzlzwMpkvACfeJbC
7muMZbTQO2CALWZ/3tax+WM=
=SyM0
-----END PGP SIGNATURE-----



