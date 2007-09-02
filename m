Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IRk4d-0003ub-7c
	for openembedded-devel@openembedded.org; Sun, 02 Sep 2007 09:40:47 +0200
Received: from vpn006061.vpn.utwente.nl (vpn006061.vpn.utwente.nl
	[130.89.6.61])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l827cZ1R023293 for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 Sep 2007 09:38:35 +0200
Message-ID: <46DA6864.1020002@dominion.kabel.utwente.nl>
Date: Sun, 02 Sep 2007 09:38:12 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46D7FBA9.7060104@dominion.kabel.utwente.nl>	<1188653475.5722.1.camel@localhost.localdomain>	<46D9A492.5090601@dominion.kabel.utwente.nl>
	<1188693418.5722.19.camel@localhost.localdomain>
In-Reply-To: <1188693418.5722.19.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC][PATCH] Merging classes with poky
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
X-List-Received-Date: Sun, 02 Sep 2007 07:40:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sat, 2007-09-01 at 19:42 +0200, Koen Kooi wrote:
>> Richard Purdie schreef:
>>> I haven't looked closely at the diff yet but the above should not be
>>> merged back in. I removed it from OE.dev since its broken and the same
>>> (correct) information can be obtained with "bitbake -e". I will remove
>>> it from Poky too in due course.
>> Updated diffs at http://dominion.kabel.utwente.nl/koen/OE/poky/
>>
>> Changes:
>>
>> * remove showdata
>> * make rootfs_deb.bbclass work with current .dev
> 
> Given the ton of changes involved, I've committed a number of them that
> hopefully hasn't actually changed any behaviours in OE but have brought
> OEs and Poky's classes much more in sync.


I noticed that rootfs* have bits like "<something> /etc/", "<something> /usr/lib", etc
Shouldn't that be ${sysconfdir}, ${libdir}, etc?

> http://www.rpsys.net/openzaurus/temp/behaviour_change.patch is a
> (reverse) diff which will change the way OE does certain things. There
> are two main ones:
> 
> 1. pkgmaps moves from ${STAGING_DIR}/pkgdata/ to
> ${STAGING_DIR}/pkgdata/${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS} in
> the multimachine case.
> 
> 2. Enable the do_package_write_ipk, do_package_write_deb and other
> separate tasks instead of running them all within do_package_write. The
> big benefit here is you can then enable some new package class at some
> point halfway through a build and bitbake will "do the right thing". 

Provided people don't use rm_work.

> It
> also improves the number of tasks we can run in parallel slightly.
> 
> Any thoughts/comments on these or should I check them in along with a
> warning about needing to wipe the install stamps at the very least on
> existing builds?

Let's just let it on the same time as activating bitbake 1.8.8.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG2mhdMkyGM64RGpERAvHNAJ9bI0SSwgD4ef8+CVeFWtvMihXeCwCZAXln
zFYuBT3oZbE/amUgdKoqY68=
=lzVd
-----END PGP SIGNATURE-----


