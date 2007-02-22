Received: from [204.127.200.81] (helo=sccrmhc11.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HKISr-0000im-8s
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Feb 2007 19:14:45 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (sccrmhc11) with ESMTP
	id <2007022218144401100kbkkse>; Thu, 22 Feb 2007 18:14:44 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id F28DE6A50; Thu, 22 Feb 2007 13:20:51 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1172168450.8014@gatekeeper.stellarwerx.com>
Date: Thu, 22 Feb 2007 13:20:51 -0500 (EST)
MIME-Version: 1.0
Subject: Re: RFC: stop mounting /dev/mtdblockX but mount mtdX (without/dev) instead
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
X-List-Received-Date: Thu, 22 Feb 2007 18:14:47 -0000
Content-Type: multipart/mixed; boundary="bound1172168451"

--bound1172168451
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

So how does this change the "root=" kernel command line
parameter?  Would it now be "root=mtdX"?

Regards,
-Mark Gollahon


Koen Kooi wrote ..
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Chris Ball from the OLPC project was kind (and patient) enough
> to explain the first item of
> http://www.linux-mtd.infradead.org/archive/tech/faq.html to me.
> 
> It seems that most machines in OE with MTD have something like:
> 
> /dev/mtdblock2  /             jffs2   defaults        1  1
> /dev/mtdblock3  /home   	jffs2   defaults        1  1
> 
> in their fstab, which apparently is wrong. The trick to
> understanding the FAQ entry is not to think in terms of actual
> devices and controllers, but in terms of fstab.  So 'block
> devices' translate to the emulated block devices present as
> /dev/mtdblockX and 'mtd' refers to mtdX.
> 
> The correct fstab should be:
> 
> mtd2  /         jffs2   defaults        1  1
> mtd3  /home     jffs2   defaults        1  1
> 
> I don't know which kernel version introduced it, but it seems
> to work on 2.6.16.
> 
> What do you think?
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFF3Kl6MkyGM64RGpERAhiaAKCdBvq8lwBfM2lzzt+vGS28KcY1VwCeNgvN
> Fyi+w99uUA+KF2bZOdDLBq0=
> =bELj
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--bound1172168451--
