Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JfyJM-0000cd-Oe
	for openembedded-devel@openembedded.org; Sun, 30 Mar 2008 16:15:04 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JfyJK-00087l-G4
	for openembedded-devel@openembedded.org; Sun, 30 Mar 2008 14:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 30 Mar 2008 14:15:02 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 30 Mar 2008 14:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sun, 30 Mar 2008 16:14:52 +0200
Message-ID: <fso78t$8is$2@ger.gmane.org>
References: <c384c5ea0803300616k3a3219ek6d48878f57ed4ef9@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803300616k3a3219ek6d48878f57ed4ef9@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: base.bbclass: Enable overwrite flag for unzip command
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
X-List-Received-Date: Sun, 30 Mar 2008 14:15:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello,
|
| During rebuilds I noticed unpacking a zip a second time fails, whereas tar
| silently succeeds, overwriting files.

I think all unpack methods should have consistent behaviour, but I don't
think silently overwriting files is a good idea, especially when SRC_URI
contains patches as well.



| I will shortly commit the following change (after a test), which enables
| overwrite behaviour for unzip:
|
| -base.bbclass:574:               cmd = 'unzip -q'
| +base.bbclass:574:               cmd = 'unzip -q -o'

Since sorting out unpack behaviour will take too long:

+1 from me

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH76BcMkyGM64RGpERAjmRAJsFayVq33qqBcSBgDzHHEput2Kk2gCePPQb
Ad+tFhoZs/Bt0FQM2fd+XqE=
=1wUR
-----END PGP SIGNATURE-----



