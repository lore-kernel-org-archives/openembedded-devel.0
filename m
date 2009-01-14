Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1LN4eV-00006L-1O
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 13:15:19 +0100
Received: from [172.20.1.5] (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	n0EC8aVR025482 for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 13:08:36 +0100
Message-Id: <5ED84125-2736-489A-94F0-1E385661D7BA@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel <openembedded-devel@openembedded.org>
In-Reply-To: <20090114124842.32a3241e@adrastea.totalueberwachung.de>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Wed, 14 Jan 2009 13:08:34 +0100
References: <20090113203242.4D378189331@amethyst.openembedded.net>
	<20090114124842.32a3241e@adrastea.totalueberwachung.de>
X-Pgp-Agent: GPGMail d55 (v55, Leopard)
X-Mailer: Apple Mail (2.930.3)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] Koen Kooi : mtd-utils-native: remove default-preference from 1.20+git, it shows now errors in my tests
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
X-List-Received-Date: Wed, 14 Jan 2009 12:15:19 -0000
X-Groupsio-MsgNum: 7222
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-12-224643932"
Content-Transfer-Encoding: 7bit

--Apple-Mail-12-224643932
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 14 jan 2009, om 12:48 heeft Daniel Willmann het volgende geschreven:

> On Tue, 13 Jan 2009 21:32:42 +0100 (CET)
> git@amethyst.openembedded.net (GIT User account) wrote:
>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 78fca8ee204f310352b0bc950fd9a536a98e5d2e
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=78fca8ee204f310352b0bc950fd9a536a98e5d2e
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date:   Tue Jan 13 21:31:16 2009 +0100
>>
>> mtd-utils-native: remove default-preference from 1.20+git, it shows
>> now errors in my tests
>
> mtd-utils-native fails here with:
>
> | make[1]: Leaving directory `/home/alphaone/oe-dev/tmp/work/x86_64- 
> linux/mtd-ut
> ils-native-1.2.0+git-r2/git/ubi-utils'
> | ccache gcc  -isystem/home/alphaone/oe-dev/tmp/staging/x86_64-linux/ 
> usr/include
> -O2 -I/home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils- 
> native-1.2.0+git-r2
> /git//include -DWITHOUT_XATTR -L/home/alphaone/oe-dev/tmp/staging/ 
> x86_64-linux/u
> sr/lib -Wl,-rpath-link,/home/alphaone/oe-dev/tmp/staging/x86_64- 
> linux/usr/lib -W
> l,-rpath,/home/alphaone/oe-dev/tmp/staging/x86_64-linux/usr/lib -Wl,- 
> O1  -g -o /
> home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils- 
> native-1.2.0+git-r2/git/ftl
> _format /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils- 
> native-1.2.0+git-r
> 2/git/ftl_format.o
> | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils- 
> native-1.2.0+git-r2/git/
> mkfs.ubifs/mkfs.ubifs.o: In function `write_super':
> | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils- 
> native-1.2.0+git-r2/git/mkfs.ubifs/mkfs.ubifs.c:1866: undefined  
> reference to `uuid_unparse_upper'
> | collect2: ld returned 1 exit status
> | make[1]: *** [/home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd- 
> utils-native-1.2.0+git-r2/git/mkfs.ubifs/mkfs.ubifs] Error 1
> | rm /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils- 
> native-1.2.0+git-r2/git/mkfs.ubifs/mkfs.ubifs.o
> | make[1]: Leaving directory `/home/alphaone/oe-dev/tmp/work/x86_64- 
> linux/mtd-utils-native-1.2.0+git-r2/git/mkfs.ubifs'
> | make: *** [subdirs_mkfs.ubifs_all] Error 2
> | make: *** Waiting for unfinished jobs....

Which e2fsprogs-libs-native do you have installed? Also, oe-devel is  
subscriber only, enough with the CC:!

--Apple-Mail-12-224643932
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: Dit deel van het bericht is digitaal ondertekend
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFJbdXEMkyGM64RGpERAkeXAJsG8xdetraTeMYgDeAfaN2bh+pFDgCffG2V
rZIKDkbBWU5/xJJmR+t6CQk=
=HiWO
-----END PGP SIGNATURE-----

--Apple-Mail-12-224643932--
