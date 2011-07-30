Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QnBW0-0004zz-3v for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 17:31:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QnBRr-0004JH-QA for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 17:27:31 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2011 17:27:31 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2011 17:27:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 30 Jul 2011 17:27:20 +0200
Message-ID: <j117so$upr$1@dough.gmane.org>
References: <201107301242.41215.schnitzeltony@gmx.de>
	<201107301312.14146.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <201107301312.14146.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.2
Subject: Re: fakeroot 1.14.5 source is missing
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
X-List-Received-Date: Sat, 30 Jul 2011 15:31:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-07-11 13:12, Andreas Mueller schreef:
> On Saturday, July 30, 2011 12:42:40 PM Andreas Mueller wrote:
>> Hi guys,
>> 
>> I tried to build an image based on gumstix overo-2011 branch [1] but the sources for fakeroot 1.14.5 can not be downloaded.
>> 
>> ERROR: fakeroot-native-1.14.5: ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.14.5.orig.tar.b z2 cannot check archive integrity
>> 
>> In [2] I saw that it is it is not there ( anymore ? ).
>> 
>> As far as I can see we have the same issue in mainline oe 2011.03-maintenance.
>> 
>> [1] http://gitorious.org/gumstix-oe/mainline/commits/overo-2011.03 [2] ftp://ftp.debian.org/debian/pool/main/f/fakeroot/
>> 
> I don't know how to create the 'official' pull request bur I think we need to pull
> 
> commit 085dc5e99abf98772bfb44f3f25320418d500740 Author: Florian Boor <florian.boor@kernelconcepts.de> Date:   Thu May 5 11:28:09 2011 +0200
> 
> fakeroot: Move from not fetchable 1.14.5 to 1.15.1
> 
> Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
> 
> Test environment: BB_VERSION        = "1.10.2" METADATA_BRANCH   = "org.openembedded.dev" TARGET_ARCH       = "arm" TARGET_OS         = "linux-gnueabi" MACHINE           = "mainstone" DISTRO            = "minimal" DISTRO_VERSION    = "dev-snapshot-20110504" TARGET_FPU        = "soft"
> 
> Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
> 
> into 2011.03-maintenance.

http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-June/033373.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFONCLYMkyGM64RGpERAqsYAJwLnvUe7fKAmA9HeOEti1LxU7cLBgCgi5ag
jsG6WtTJWRZOvVbI2z2g/vk=
=H4or
-----END PGP SIGNATURE-----



