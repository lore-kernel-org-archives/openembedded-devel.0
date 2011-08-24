Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QwFK4-0007XX-1I for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 17:24:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QwFFS-0006LT-Kb for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 17:20:10 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 17:20:10 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 17:20:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 24 Aug 2011 17:19:57 +0200
Message-ID: <j334qt$t65$1@dough.gmane.org>
References: <4E54DA89.2080105@dresearch-fe.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <4E54DA89.2080105@dresearch-fe.de>
X-Enigmail-Version: 1.3
Subject: Re: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 15:24:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-08-11 13:03, Steffen Sledz schreef:
> We like to create an upstart based image. Therefor we use
> 
> IMAGE_INIT_MANAGER = "upstart upstart-sysvcompat sysvinit-utils"
> 
> inside our image recipe.
> 
> Unfortunately our image somehow inherits task-proper-tools which contains an RDEPEND for sysvinit. This results in
> 
> -------------------------->snip<------------------------- |  * check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/sbin/runlevel |       But that file is already provided by package  * sysvinit |  *
> check_data_file_clashes: Package upstart-sysvcompat wants to install file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/init.d/rcS |       But that file is already provided by package  * sysvinit |  * check_data_file_clashes: Package upstart-sysvcompat wants to install
> file /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/init.d/rc |       But that file is already provided by package  * sysvinit |  * check_data_file_clashes: Package upstart-sysvcompat wants to install file
> /home/sledz/work/HydraIP/OE/tmp.6/rootfs/hydraip-hipox-devimage/etc/default/rcS |       But that file is already provided by package  * sysvinit |  * opkg_install_cmd: Cannot install package upstart. -------------------------->snip<-------------------------

Why not change those into u-a entries?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOVRadMkyGM64RGpERAkPdAJ4q2GZbqk9Bk9xI3/EJ+6puyDr0OgCgjgeI
GPHe/PbojFKSuh4RqeXDKGY=
=aCHU
-----END PGP SIGNATURE-----



