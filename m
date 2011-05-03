Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHDcC-0005LB-0K for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 13:18:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHDZY-0005ib-Qa for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 13:15:20 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 13:15:20 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 13:15:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 May 2011 13:15:03 +0200
Message-ID: <ipoo3s$h7c$1@dough.gmane.org>
References: <4DBFC26B.2090006@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4DBFC26B.2090006@gmx.net>
X-Enigmail-Version: 1.0.1
Subject: Re: arduino IDE on beagleboard
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
X-List-Received-Date: Tue, 03 May 2011 11:18:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-05-11 10:52, Robert Schuster wrote:
> Hi,
> on scap.linuxtogo.org I found a screenshot of someone using the arduino
> IDE on a beagleboard:
> http://scap.linuxtogo.org/files/422bf4ad3de13dccfd2bcd19253e9ab5.png
> 
> If this person is here on this list 

I am :)

> (or someone else tried this too), I
> have a question: Did this work nicely?

First you have to fix the included rxtx install:
http://dominion.thruhere.net/koen/cms/making-processing-arduino-ide-replicaorg-work-on-arm

> Could you upload programs to the
> arduino and receive stuff through the serial port?

That works, and if you download and untar:

http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-binutils-2.21.tar.bz2
http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-gcc-4.5.2.tar.bz2
http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-libc-1.7.1.tar.bz2

You can even compile the included examples. I succesfully compiled and
uploaded the serial test app to the
http://elinux.org/BeagleBoard_Trainer expansionboard attached to my xM.
I haven't tried using it on a proper arduino board yet, but that uses
the same bootloader as the trainer.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNv+O3MkyGM64RGpERAsSTAJkBerPIaFUJQZmYxEKAPsx3lE9VogCgjnbp
eiBbe3p4HbqJtx6Nu5iIKMU=
=J3yG
-----END PGP SIGNATURE-----



