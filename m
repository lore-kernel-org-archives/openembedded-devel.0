Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jcigz-0008At-9S
	for openembedded-devel@openembedded.org; Fri, 21 Mar 2008 15:58:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jcigy-0006hq-G4
	for openembedded-devel@openembedded.org; Fri, 21 Mar 2008 14:58:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 21 Mar 2008 14:58:00 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 21 Mar 2008 14:58:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 21 Mar 2008 15:57:52 +0100
Message-ID: <fs0idg$j6$1@ger.gmane.org>
References: <47E3C6F7.8030902@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47E3C6F7.8030902@gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: RPROVIDES problem for kdepimpi
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
X-List-Received-Date: Fri, 21 Mar 2008 14:58:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Junqian Gordon Xu schreef:
| Similar to the tzdata problem. kdepimpi recipe does not define a package
| ${PN}, and bitbake doesn't like the fact that ${PN} is missing in
RPROVIDES.
|
| Should we ship an empty kdepimpi? Or any better solution?

kdepimpi-x11 does:

PACKAGES = "libmicrokcal-x11 libmicrokabc-x11 kopi-applet-x11 kopi-x11
kapi-x11 libmicrokdelibs-x11 kammu-x11 libmicrokammu-x11"

Which is buggy, since it will break the -dev and -dbg depchains (and
ships no .debug files).

Change that to:

PACKAGES += " \
libmicrokcal-x11 libmicrokcal-x11-dbg libmicrokcal-x11-dev \
libmicrokabc-x11 libmicrokabc-x11-dbg libmicrokabc-x11-dev\
kopi-applet-x11 kopi-applet-x11-dbg kopi-applet-x11-dev\
kopi-x11 kopi-x11-dbg kopi-x11-dev\
kapi-x11 kapi-x11-dbg kapi-x11-dev\
libmicrokdelibs-x11 libmicrokdelibs-x11-dbg libmicrokdelibs-x11-dev\
kammu-x11 kammu-x11-dbg\
libmicrokammu-x11 libmicrokammu-x11-dbg libmicrokammu-x11-dev"

ALLOW_EMPTY_${PN} = "1"
RDEPENDS_${PN} = "kopi-applet-x11 kopi-x11 kapi-x11 kammu-x11"

FILES_....-dev
FILES_....-dbg
etc.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH48zwMkyGM64RGpERAq/fAJ9J9UHDj/GWLoxLn+39CUFnG6XdtACgqvZP
PfvptGphDh4wh1dbRBofUgQ=
=fUrC
-----END PGP SIGNATURE-----



