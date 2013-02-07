Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3cro-0000Mc-U8 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 02:35:22 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3ONs-0005v3-SE for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 11:07:12 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 11:07:12 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 11:07:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 07 Feb 2013 11:06:45 +0100
Message-ID: <kevubg$t7s$1@ger.gmane.org>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe-meta-systemd 0/5] xinput-calibrator rework
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
X-List-Received-Date: Fri, 08 Feb 2013 01:35:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-02-13 23:18, Andreas Müller schreef:
> * Implemented are 3 modes of invocation: 1. udev/systemd 2.
> /etc/xdg/autostart 3. manual 1/2 are selected upon DISTRO_FEATURES
> containing systemd or not
> 
> * The calibration is stored in
> /etc/X11/xorg.conf.d/99-<name-of-touchscreen>.conf Herby support for
> multiple touchsceen devices is prepared.
> 
> * The script detects upon parameter information how it was called and
> waits for xserver to come up / detect connected touchsceen devices. If no
> matching calibration file is found, the xinput_calibrator is called for
> this device. For systemd invocation the default display is choosen.
> 
> * For manual invocation and multiple touchscreen devices attached, the
> operator can select which device to calibrate interactively.
> 
> * Multiple touchscreen support is prepared - the following open issues
> are known: * Multiple touchscreens with same device name will get same
> calibration values. An unique device identifier could not be found yet. *
> systemd startup with multiple device cause multiple instances of 
> xinput_calibrator being started without information for which device the
> calibration is performed.
> 
> * Many many tests were performed: 2 automatic invocation types * (1st +
> 2nd startup) * (0, 1, 2 touchscreens)
> 
> * Other layers need alignment for pointercal removement. If accepted I
> can take care (this is NOT an extortion :)

At FOSDEM I found out that the Tias wearing the FOSDEM organization hoodie
is actually the same Tias who maintains xinput-calibrator. Long story short:
we should send all out patches upstream and he'll have a look at them. He is
a big fan of the xorg conf snippet that this patchset introduces.
In the long term I think we'll need to see how well the 'tagging' of the
evdev itself with the calibration value is working. I looked at it a few
years ago and it didn't work for our usecases, but that might have changed.
THat should make non-X apps work as well (e.g. QT/e).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRE3y1MkyGM64RGpERAnfeAKC7FF+MGpDJXCr3hZ9f4HHbQUi3YgCgrrmZ
5UqAi0nnN/7uZ2X0v2x6acU=
=iaR5
-----END PGP SIGNATURE-----



