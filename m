Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QP7qf-00007F-Kd for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 08:45:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QP7ni-0003ny-Fi for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 08:42:38 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 08:42:38 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 08:42:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 25 May 2011 08:42:21 +0200
Message-ID: <iri8ce$acf$1@dough.gmane.org>
References: <AEF4F94AE6BD724F91B503AC1AFED2392C5E8391CF@STOEXMBXC03.domain01.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AEF4F94AE6BD724F91B503AC1AFED2392C5E8391CF@STOEXMBXC03.domain01.net>
X-Enigmail-Version: 1.0.1
Subject: Re: kbd and console-tools collision when using systemd
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
X-List-Received-Date: Wed, 25 May 2011 06:45:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-05-11 08:00, Anders Darander wrote:
> We have recently switched our local distro to use systemd for the
> init-process. This works fine for our HW-target (apart from some
> non-optimal configuration, but that is something we're looking into).
> Our HW-target is based on the at91sam9g20.

That's good to hear!

>  However, sometime later, we tried to rebuild our distro for qemuarm,
> to ease the work on some of the systemd configuration. Qemuarm (just
> as any other Qemu-target) adds keyboard to the machine-features, and
> task-boot.bb translates this into the inclusion of the keymaps
> package, which in turns draws in console-tools. This is where we are
> getting problems.
> 
> Local distro uses task-boot.bb Qemu -> keymps -> RDEPENDS
> console-tools Systemd -> RRECOMMENDS kbd
> 
> This leads to lots of clashes with e.g. usr/bin/dumpkeys,
> usr/bin/unicode_stop etc. Currently we have solved this by using a
> local copy of task-boot.bb in one of our layers, which lets the
> machine feature keyboard include kbd-keymaps instead of keymaps.
> 
> Is there some better/simpler way (maintainence wise) to solve the
> problem? Or is the local task-boot.bb the best way to handle it?
> (It's always better to try to reduce the amount of local copies, to
> be able to benefit from the community, and to easier contribute
> back).

You can work on this problem on two fronts:

1) disable the vconsole service in systemd
2) switch task-boot to kbd

Option 1) is avoiding the real problem, but it's nice to have anyway,
since "most" of the OE platforms work well enough with fbcon to not need
fancy keymaps and fonts.

I briefly looked at kbd vs console-tools during systemd bringup and it
seems that kbd is the best long term answer.

Systemd v28 will also drop the dependency on hwclock, so your system can
be even smaller :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN3KTNMkyGM64RGpERAn5jAJwL4INAEkw+DiHlMdREd5X9F3V2FQCfYwy4
czetFb/X9AUyC4ADzCyfHJM=
=Wn8e
-----END PGP SIGNATURE-----



