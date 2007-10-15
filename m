Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IhRQ5-0005Wv-D2
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 16:59:49 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9FErL98029743 for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 16:53:21 +0200
Message-ID: <47137EDD.9070000@student.utwente.nl>
Date: Mon, 15 Oct 2007 16:53:17 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200710151419.07302.openembedded@haerwu.biz>
In-Reply-To: <200710151419.07302.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Handling of virtual/* namespace in packages
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
X-List-Received-Date: Mon, 15 Oct 2007 14:59:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> In OpenedHand we got hit by virtual/update-alternatives and packaging. 
> Poky contains two providers for virtual/u-a:
> 
> 1. update-alternatives-cworth
> 2. update-alternatives-dpkg
> 
> First one comes from IPKG source and is written in pure shell. Second one 
> is in Perl so it fetch too much to be usable.
> 
> The problem comes when you build both of them (it happens on our 
> autobuilder due to 'world' build) - package manager (ipkg) selects random 
> one - in our case it is always 'update-alternatives-dpkg' so generated 
> rootfs is too big to be usable.

Heh, I asked about that a while back and was told "everything works in poky". So much for
'working' ;)

> Solution which came to my mind is quite simple. Our distro (Poky) already 
> prefers 'u-a-cworth' as provider for 'virtual/update-alternatives'. So if 
> package depends on 'virtual/update-alternatives' then let package.bbclass 
> mangle its dependencies in such way that 'u-a-cworth' (preferred by 
> distro) would be writen in package.
> 
> What do you think about it?

Sounds like a good idea.

regards,

KOen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHE37dMkyGM64RGpERAtjNAJ48UusMliCz+nxv2sEV+RWoM3YX2wCZAahB
HnrSbCUKssdolCEWAN0W2Ng=
=I+0s
-----END PGP SIGNATURE-----


