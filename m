Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HYcPy-0000VS-GW
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 08:22:58 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l336MqLr020188 for <openembedded-devel@openembedded.org>;
	Tue, 3 Apr 2007 08:22:52 +0200
Message-ID: <4611F2B9.7040108@dominion.kabel.utwente.nl>
Date: Tue, 03 Apr 2007 08:22:49 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <151901c775b6$2c86fc10$6e01a8c0@twilight>
In-Reply-To: <151901c775b6$2c86fc10$6e01a8c0@twilight>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Busybox 1.5.0 available for testing
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
X-List-Received-Date: Tue, 03 Apr 2007 06:23:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike (mwester) schreef:
> Busybox 1.5.0 is committed.  It is marked with preference = -1, so it should
> NOT be automatically included in anyone's builds.
> 
> It's considered less-than-stable upstream, so be prepared for anything to
> happen with it.  I re-did the patches that are applied, a couple of them no
> longer seem pertinent at all, but since they are referenced in the
> busybox.inc file, I don't know how to "un" specify them for 1.5.0 and higher
> versions.

I've given up on busybox > 1.2.1 since the developers feel the need to change all the
cmdline option every minor release[1] and add regression faster than I can run tests....
As a bonus: all >1.2.x version have superfluous rewrites of core parts with the sole
intent to annoy Bruce Perens...

I wouldn't be surprised if most of the scripts in OE suddenly break.

regards,

Koen


[1] I gave in an and ship util-linux-mount, util-linux-umount and procps-ps with angstrom
since the busybox utils cmdline options break the proper versions....
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGEfK5MkyGM64RGpERAuk4AJ0VlEobHeOIzVHiCyOygww/nTCilACfRc+f
owC3DEd/gC0569wGgs0+hgI=
=aZ9p
-----END PGP SIGNATURE-----


