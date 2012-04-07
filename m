Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGd1A-0002EH-Tf
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Apr 2012 23:17:57 +0200
Received: by dadz8 with SMTP id z8so3950211dad.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2012 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=EGkM4cfRaWgXZN+l5TOoNYxGfVf5OL1NWNR7iSYAxxM=;
	b=yGYW9QNWFjgPgEjL7GGnBc2tmKNK+joB8tTcR96UC4dkUg+4lmePvJhZMPt9IkiAKH
	Ojp/8E9v7ZIFFDSBswSuerCeXCdoZP9fu8YNFBrkS74HlOgfMUbmf/6DpAkTiKQ/2w/G
	J/TCWRSTptMa3kfDmZIDzvRdRlbckVN0IoUKHEbWg3BZRUmtZCMh9KSUYlNDB1aY/Ix+
	VTAtrtLKYu5CP9h5TPvR9v+12znY5ZHA8cBiVutIVBv5Idq8xF3ueIVoSvVW/S/N19fh
	+kuFqKg7bIojYZpDkx2Q6x/BBxCdvLN/4xs1onZ160tpiG8pNSfSQKizuK4MM2PpvAyP
	Tq0A==
Received: by 10.68.234.195 with SMTP id ug3mr7098554pbc.4.1333832921770;
	Sat, 07 Apr 2012 14:08:41 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id o7sm10109096pbq.8.2012.04.07.14.08.39
	(version=SSLv3 cipher=OTHER); Sat, 07 Apr 2012 14:08:40 -0700 (PDT)
Message-ID: <4F80ACD6.8080901@gmail.com>
Date: Sat, 07 Apr 2012 14:08:38 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.4
Subject: meta-linaro and toolchain-layer
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
X-List-Received-Date: Sat, 07 Apr 2012 21:17:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Ken Werner @ Linaro has created a meta-linaro layer. I have created a
github repo of same here https://github.com/kraj/meta-linaro

Moving forward soon gcc 4.7 will land in OE-Core and 4.6 will be
more or less retired. In natural progression it would move to
toolchain-layer if there are consumers of it.

linaro is also working on gcc-4.7 improvements in  same manner as
4.6  and there could be more tools e.g. gdb binutils etc. that could
be useful for armv7+ from that layer.

I would like to propose few things we could do.

Use gcc-4.6 from meta-linaro and retire it from toolchain-layer
which means toolchain layer only has gcc-4.5 and eventually
This also means that we don't move gcc-4.6 into toolchain-layer
when its relegated from OE-Core

In similar fashion add recipes for gcc-linaro-4.7 whenever linaro
makes first 4.7 based release

Does anybody see downsides to this approach ?

This could mean that distro may have multiple compilers for different
architectures e.g. linaro toolchain for arm
architecture and may be OE-Core provided toolchain for rest of them

another option is that we do the same thing where we cherry-pick
linaro patches into toolchain-layer and append them on top gcc from
OE-Core which we have been doing with 4.6 it does mean extra work
validation and maintenance that I would like to avoid.

Thanks

- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+ArNYACgkQuwUzVZGdMxQ1gACeNBUacwHJrvYuzpStJKeVZHb6
4qUAniohGmPBRhVJJtjEpGlG/JyKdCvt
=fnnP
-----END PGP SIGNATURE-----


