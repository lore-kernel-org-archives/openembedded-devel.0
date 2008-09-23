Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KiAXK-000492-RA
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 18:14:50 +0200
Received: (qmail 7559 invoked by uid 813007); 23 Sep 2008 16:11:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Sep 2008 16:11:17 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue, 23 Sep 2008 18:11:18 +0200
User-Agent: KMail/1.10.0 (Linux/2.6.27-rc6; KDE/4.1.1; x86_64; ; )
References: <gbb2sq$m6c$1@ger.gmane.org>
In-Reply-To: <gbb2sq$m6c$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200809231811.19352.openembedded@haerwu.biz>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] udev problem for zaurus machine solved
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
X-List-Received-Date: Tue, 23 Sep 2008 16:14:51 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 23 of September 2008 17:44:26 Koen Kooi wrote:

> I decided to sit down and debug the udev problem on my c700.
>
> Summary:
>
>   It's not a udev problem, it's pretty much a problem with zaurus
> initscripts.

Currently it is more then Zaurus devices - thats why I am Cc: OE ml.

There is standard script and specific "devices" script are present for:

- all Zaurus devices
- iPaQ devices: h3600, h3900
- Jornada devices: 56x, 6xx, 7xx
- Simpad
- FooNAS
- Openprotium
- UML

> Background:
>
>   Udev mount a tmpfs over /dev and starts adding nodes with the info
> from /sys and creates a tarball when its done to make succesive boots
> faster
>
>   /etc/init.d/devices is a script that attemps to fix up devfs errors
> and for zaurus machines creates some kernel 2.4 specific symlinks
> when udev isn't running
>
>   However instead of doing a runtime check (e.g by looking at
> /proc/cpuinfo) zaurus machines opted to have their own devices script
> in packages/initscripts/initscripts-1.0/<MACHINE>/devices, which, as
> it turns out, have a broken check for udev. It doesn't detect udev
> and mounts and _empty_ ramfs over /dev and fills in a few dev nodes.
> This is hidden by the fact that udevsettle/trigger is still running
> in the background creating extra dev nodes.
>
> Solution:
>
>   Don't install the 'devices' script for angstrom.

I would like to drop that script totally (like it is done in Poky). We 
nearly do not have 2.4 powered devices which would use devfs - if 
someone maintain such one then please rise hand - I think that 
do_install_append() for such devices would be enough - rest can work 
without 'devices' script.


-- 
JID: hrw@jabber.org




