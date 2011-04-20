Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCSrX-0001uV-Fm for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 10:34:17 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCSp5-0000t1-QM for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 10:31:43 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:31:43 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:31:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 20 Apr 2011 10:31:25 +0200
Message-ID: <iom5kt$2h5$1@dough.gmane.org>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1303283391.git.michael.lippautz@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe 0/6] add syslog-ng/eventlog/libnet
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
X-List-Received-Date: Wed, 20 Apr 2011 08:34:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-04-11 09:18, Michael Lippautz wrote:
> This is an re-import and upgrade from org.oe.dev. If everything is fine I can 
> also apply them to org.oe.dev.
> 
> libnet: 
> * libnet at packetfactory.net is dead... 
> * Get the latest version from a github fork that claimes to update and maintain 
>   it
> * README tells it's compatible with libnet-1.1
> * dynamic build, instead of static
> * removed cruft that is handled by autotools class
> * removed already applied patches and rebased endianess one
> 
> eventlog: minor upgrade
> 
> syslog-ng:
> * adapt EXTRA_OECONF
> * move to latest stable (3.2.2)
> 
> Pull URL: git://gitorious.org/oe-zoid/meta-openembedded.git
>   Branch: master
>   Browse: http://gitorious.org/oe-zoid/meta-openembedded/commits/master
> 
> Thanks,
>     Michael Lippautz <michael.lippautz@gmail.com>
> ---
> 
> 
> Michael Lippautz (6):

Thanks for the patchset!

Could please squasH

>   syslog-ng: Re-import 2.0.5 from org.oe.dev
>   syslog-ng: Update to 3.2.2

and

>   eventlog: Re-import 0.2.5 from org.oe.dev
>   eventlog: Clean recipe and upgrade to 0.2.12

and

>   libnet: Re-import 1.1.2.1 from org.oe.dev
>   libnet: Clean and upgrade (see below)

Being able to trace the origin isn't worth having broken recipes at
various points due to missing checksums IMO.
If people disagree with that I'm willing to stance my stance on that,
though.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrpndMkyGM64RGpERAkk7AJ9POYE6e38p9gV6J6u7lvB556iNhACfRXmq
6+REBlvfKEQgeCzTXC6vEX4=
=zXuI
-----END PGP SIGNATURE-----



