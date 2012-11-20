Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Taxm5-0005Ue-28
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 01:02:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Nov 2012 15:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,288,1352102400"; d="scan'208";a="220389135"
Received: from unknown (HELO helios.localnet) ([10.252.122.180])
	by azsmga001.ch.intel.com with ESMTP; 20 Nov 2012 15:48:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>
Date: Tue, 20 Nov 2012 23:48:33 +0000
Message-ID: <1558793.4hLbH6dKvs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <20121119155657.620d6dbe@gnutoo-desktop>
References: <12301427.Yf0uchSh3U@helios>
	<20121119155657.620d6dbe@gnutoo-desktop>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] OE-Classic recipe migration status
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
X-List-Received-Date: Wed, 21 Nov 2012 00:02:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Denis,

Just commenting on the ones you've asked about or I know something about:

On Monday 19 November 2012 15:56:57 Denis 'GNUtoo' Carikli wrote:
> Having the following software would be nice:
> * 0xffff,0xffff-native //used for flashing the n900 and for interacting
>   with the n900 NAND partition(decoding what's on an MTD partition such
>   as wifi calibration, MAC address etc...)
> * abiword plugins
> * accelges : gesture recognition for the openmoko freerunner (gta02)
> * asterisk recipes? could still be usefull...

There is asterisk in meta-telephony - the remaining recipes are just 
additional sounds AFAICT. 

> * batctl	//for mesh networking
> * batmand	//for mesh networking
> * wscan,dvb*	//for looking at dvb-t, some of my devices have USB
> host.
> * ekiga //would be nice for VOIP
> * fennec //renamed to firefox mobile?

I guess so, I think the rename to Firefox Mobile happened a while ago though 
so anything still named "fennec" is pretty old by now.

> * flashrom //could be definitely usefull to flash BIOS from embedded
>   devices, I cross compiled it by hand for now, devices that have SPI
>   can flash SPI BIOS chips, such as the bug 2.0 or the rasberry pi
> * geoclue // could be usefull if it can uses gpsd
> * gnash //usefull to see flash animations even if now there is html5
>   for youtube

If it works, last I heard it hasn't been particularly successful. My 
information could be out of date however.

> * gnuchess //nice chess engine but a bit too hard.
> * gnumeric //should be very nice. like ooo/libreoffice calc.
> * gst-ducati // would be really usefull for omap4.
> * gst-player? //isn't it gst-123 or something like that in the new oe?

There's a patch, there was feedback that hasn't yet been addressed IIRC and 
thus it has not yet been merged.

> * intone-video //would be nice, like intone which is an efl music
>   player but for video.
> * irssi //nice command line IRC client.
> * linphone //VOIP client, no VOIP client seem present in the new oe.

Perhaps not, I've seen people asking for linphone though.

> * mpd-alsa, mpc, // do we have mpd in the new oe? if so that's nice.
>   what about graphical clients?

We do have mpd and libmpd, but nothing else that I know of.

> * mumudvb //would be nice, for straming dvb.
> * nmap //nice for nmap -sP (for finding IP of local computers).

I have the beginnings of a recipe for nmap, I just need someone to help me get 
past the build issues (some issue with definitions from network headers 
clashing, probably triggered by some autotools breakage).

> * openbmap-logger //same kind of softwaer than cellhunter(see below)
> * privoxy //a proxy that can filter request, usefull for anonimizing
>   the connection or with tor.
> * sflphone-common  //is slfphone in the new oe?

If it is it's not in any of the fairly long list of layers I'd expect to find 
recipes in.

> * tesseract //could be usefull for making apps that uses a camera and
>   recognize text?
> * totem
> * tor //anonymity network.
> * tshark,wireshark //usefull for debugging modem protocol in some
> phones.
> 
> Games(All the free games that don't require 3d if possible):
> * abuse (arcade game)
> * bzflag? doesn't it require 3d acceleration?
> * bzflag-server? is it required for bzflag?
> * cellhunter //not really a game, it's rather a tool for mapping cell
>   towers with the freerunner, would be nice to have.

OK I've removed the [game] tag from this one.

> * crimsonfields
> * freedoom // free software data (.wad) for the game named doom.
> * frozen-bubble

I'd like to see frozen-bubble also; it would necessitate bringing over sdl-
perl as well though.

> * openttd* //train simulation
> * opentryan
> * rocksndiamonds
> * supertux,supertux-qvga
> * wordwarvi //great game
> * xboard //also need a chess engine such as gnuchess or another one
> * prboom  ??? //not in the list, but probably not in the newer oe
>   either. doom game.

prboom should really be in the list, but was excluded because some (unbuilt) 
recipes are in meta-opie since one or two of them were configured to build with 
libsdl-qpe. Someone could use those as a starting point though.

> Misc comments:
> * Aurora is in meta-smartphone I think.

There is aurora-daemon and aurora-systemmanager - do these replace the single 
aurora recipe?

> * Eukrea uses barebox in its layers.

Ah, I see it is in meta-eukrea. Would it be worth making it available in some 
more central location or should this layer be added to the layer index? The 
layer doesn't seem to fall into an obvious category though...

> * We have a generic compat wireless that has almost all modules in the
>   new oe.

Do you mean compat-wireless-all ?

> * concierge is an osgi implementation that was used in the buglabs bug
>   1.x and not used anymore in the buglabs bug 2.x
> * emacs-x11 is already in the new oe, under the name of emacs(yes it
>   works with X11).
> * fso2-demo-image //obsolete, probably doesn't work anymore because of
> zhone
> * fso2-console-image //available in meta-fso
> * fso-console-image //replaced by fso2-console-image

Noted these, thanks.

> * gnuradio-image //probably in meta-ettus?

Ah, I see there is console-gnuradio-image and gnome-gnuradio-image in meta-
ettus, noted.

> * linux-bug //kernel too old but no replacement, a 2.6.30 exist without
>   display and only serial is in mainline.

So what about linux-bug20-linaro_2.6.35.bb in meta-bug? Or is this the kernel 
you're referring to?

> * gpsd-device-config //obsolete?
> * linux-leviathan //obsolete, was for htc dream but got renamed.
> * madwifi-ng //obsoleted by the ath5k driver
> * mokonnect //obsoleted by iliwi

Noted.

> * lowpan-tools //seem usefull for the nanonote and it's lowpan sdio
>   card. what's the status of the nanonote in the new oe? was there a
>   layer somewhere on some git hosting websites?

I don't know of any layer supporting nanonote, no. Wouldn't be difficult to 
create one though.

> * msmcomm-specs, palmpre-audio-scripts  //palm pre got dropped by
> freesmartphone and msmcommd was the deamon that talked to its modem

Presumably these could be picked up by someone else if desired?

> * remoko* // uses bluez3, bluetooth mouse,keyboard,etc...
>   implementation.
> * sms-sentry //don't work anymore, need to be updated to the new
>   freesmartphone API, usefull for finding the position of your lost
>   phone.
> * tichy // not tested but may be really old...for the openmoko
> * wesnoth-wvga // wesnoth-wvga is the equivalent of wesnoth in the new
>   oe, and the old "wesnoth" is a sub wvga version, which is dropped
>   upstream.
> * xfce46-image,xfce-image there is an xfce image in angstrom in the
>   newer oe.

Made notes for most of these, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


