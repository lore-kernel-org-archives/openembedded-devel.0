Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H92Xb-0001nt-9l
	for openembedded-devel@openembedded.org; Mon, 22 Jan 2007 18:01:16 +0100
Received: from [130.89.6.44] (vpn006044.vpn.utwente.nl [130.89.6.44])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0MH13Lr002504 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jan 2007 18:01:03 +0100
Message-ID: <45B4EDCD.1060609@dominion.kabel.utwente.nl>
Date: Mon, 22 Jan 2007 18:01:01 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45B40165.6000506@whitby.id.au>
In-Reply-To: <45B40165.6000506@whitby.id.au>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Adding a new global MACHINE_ENDIAN variable
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
X-List-Received-Date: Mon, 22 Jan 2007 17:01:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> There exist machines (like the ixp4xx range of processors) which can be
> run in either little-endian or big-endian mode, and both modes are
> supported by OE.
> 
> I propose a new "MACHINE_ENDIAN" (naming courtesy of RP) variable to do
> this selection (i.e. for machines that support both, the build can be
> selected in local.conf).

No, that's just needles confusion, just make a .inc file (like ixp4xx.inc) that has the
common bits and 2 machine files that set up the appropriate endiannes stuff. That way you
can use machine overrides to configure stuff instead of putting more anonymous python
functions in the metadata.

regards,

Koen "stop adding MAGIC_VARs" Kooi
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFtO3NMkyGM64RGpERAnveAKCB2/xOEcBcMmF4CDPF7kAqAGQS+ACfetns
soDxhcws50KBPKr71LbmEqk=
=Hsop
-----END PGP SIGNATURE-----


