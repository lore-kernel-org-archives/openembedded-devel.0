Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SIQBg-0000o0-AK for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 22:00:12 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SIQ2d-0004Ek-B2 for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 21:50:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 21:50:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 21:50:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Apr 2012 21:50:41 +0200
Message-ID: <jm7bmi$dla$1@dough.gmane.org>
References: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: Hard floating point support for armv7a wmmx2 processor in oe-core
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
X-List-Received-Date: Thu, 12 Apr 2012 20:00:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-04-12 19:38, Nicolas Aguirre schreef:
> Hi,
> 
> I'm building an oe-core minimal image and toolchain for the cubox[1] 
> which has a Marvell Armada 510 SoC, also known as Dove. It's a armv7 Arm
> processor with wmmx2 instruction set [2].
> 
> I setup a new machine for the cubox and added : require
> conf/machine/include/arm/arch-armv7a.inc in my cubox.conf file
> 
> I also added ARM_FP_MODE = "hardfp" TARGET_FPU = "hardfp" in my
> local.conf file.
> 
> It finished the build sucessfully for angstrom efl-nodm-image.
> 
> I don't know exactly which option enable and where to add it to enable 
> hard floating point.

Hard floating point as in using the VFP coproc or hard floating point as in
that overhyped ABI that is incompatible with everything else?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPhzIPAAoJEHZqAkdh1vT6R68P/2PExTB9bX2Tgvv3eG1N7d0A
wgdGPDB694TQmV5QByTlqDGV/+hpb07rPQMZzH4RMYlzohrCO3dhyfylZXF34ju6
84qxXyfiB6aIhsK+oCz9mQhSH755PX6k6Wa4dspxYHbDJaHII5GlUDFZaUi9D/ve
efu2pWbZ9JMNqY8NhEpV5fatUVG1lLaWV2zliwqDaeO1h2zr+2eb4lO2/V60XvmI
tJIxUOm21l68n9SOzGjt+UQfM93GTFexRvC2EC9uk5TQaNOWIP499khxWjpdiCWN
s5AvSaIy/Y0u2XuTmpU0wkx+QviZINCDItV1qeovZXAzA0pbgOWh3D6hkdm3Aw89
B1HtLw7LFqidXIhN5BLwpIq8HhIiJG9Vej60eGEUj/dTdNTAuM7qTOIDvbQ4pPwu
ezLTgwGimCrOc1jwqxuGJ/QR7HjaQllXc6kS1RNRU3ePNv5ySVkT0IoGKfPV4ulQ
sy4u6yDCh9ZqpZvsfxFOJXkBJF6ZubEPKfF9a+24gmW6Icx2BJK4bPTPXVQNDIt+
vT8jzKZsr3tnfSELNhe2/R0Usk1TeH9OyRjy4i8I3A0UZx20gNmsQHtXa9SMNU5M
xONIOzpYa9zo90VMnrv6/eYMpfOHH+Jv/8fMECnXWPpm+tDIm/fnV3q9iWSqXnqx
ThR4S3hryDV7XQka/pA5
=pMxB
-----END PGP SIGNATURE-----



