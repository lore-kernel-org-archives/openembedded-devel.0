Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UNP4I-0008Be-CB for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 16:53:45 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UNOo4-0002Pu-4D for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 16:36:56 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 16:36:56 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 16:36:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Apr 2013 16:36:22 +0200
Message-ID: <kjheov$259$1@ger.gmane.org>
References: <1364997019-23273-1-git-send-email-stefan@herbrechtsmeier.net>
	<24CFFAEA-7DF1-44A1-88E3-3CA2DE01D70C@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <24CFFAEA-7DF1-44A1-88E3-3CA2DE01D70C@gmail.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][PATCH] cryptsetup: Update to latest version and use openssl as crypto backend
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
X-List-Received-Date: Wed, 03 Apr 2013 14:53:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-04-13 16:17, Khem Raj schreef:
> Stefan
> 
> On Apr 3, 2013, at 6:50 AM, Stefan Herbrechtsmeier
> <stefan@herbrechtsmeier.net> wrote:
> 
>> Cryptsetup with the command luksOpen failed with the error message: 
>> device-mapper: status ioctl failed: Permission denied
>> 
>> The error comes from libgcrypt with drops root privileges if it is 
>> linked with libcap support [1]. Update cryptsetup to latest version and
>> change the crypto backend to openssl as libgcrypt states this behaviour
>> as a feature [2].
>> 
>> The license was updated to GPLv2 with OpenSSL exception.
>> 
>> [1] http://code.google.com/p/cryptsetup/issues/detail?id=47 [2]
>> https://bugs.g10code.com/gnupg/issue1181
>> 
>> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net> --- 
>> .../recipes-support/cryptsetup/cryptsetup_1.1.3.bb |   18
>> -------------- .../recipes-support/cryptsetup/cryptsetup_1.6.1.bb |
>> 25 ++++++++++++++++++++ 2 files changed, 25 insertions(+), 18
>> deletions(-) delete mode 100644
>> meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb create mode
>> 100644 meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
>> 
> 
> would be nice if you use git format-patch -M ..
> 
>> diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
>> b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb deleted file
>> mode 100644 index 254f563..0000000 ---
>> a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb +++ /dev/null 
>> @@ -1,18 +0,0 @@ -DESCRIPTION = "Setup virtual encryption devices under
>> dm-crypt Linux" -HOMEPAGE = "http://code.google.com/p/cryptsetup/" 
>> -SECTION = "console" -LICENSE = "GPLv2" -LIC_FILES_CHKSUM =
>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" - -DEPENDS =
>> "util-linux lvm2 libgcrypt popt" -RRECOMMENDS_${PN} =
>> "kernel-module-aes \ -                     kernel-module-dm-crypt \ -
>> kernel-module-md5 \ -                     kernel-module-cbc \ -
>> kernel-module-sha256 \ -                    " -SRC_URI =
>> "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2" 
>> -SRC_URI[md5sum] = "318a64470861ea5b92a52f2014f1e7c1" 
>> -SRC_URI[sha256sum] =
>> "9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e0602bf40208b5e69c0a" - 
>> -inherit autotools gettext diff --git
>> a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
>> b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb new file mode
>> 100644 index 0000000..ade69f4 --- /dev/null +++
>> b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb @@ -0,0 +1,25
>> @@ +DESCRIPTION = "Setup virtual encryption devices under dm-crypt
>> Linux" +HOMEPAGE = "http://code.google.com/p/cryptsetup/" +SECTION =
>> "console" +LICENSE = "GPL-2.0-with-OpenSSL-exception" +LIC_FILES_CHKSUM
>> = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326" + +DEPENDS =
>> "util-linux lvm2 openssl popt" +RRECOMMENDS_${PN} =
>> "kernel-module-aes-generic \ +
>> kernel-module-dm-crypt \ +                     kernel-module-md5 \ +
>> kernel-module-cbc \ +                     kernel-module-sha256-generic
>> \ +                     " +

R* variables go below do_install

>> +PR = "r1"
> 
> You can drop PR
> 
>> + +SRC_URI =
>> "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2" 
>> +SRC_URI[md5sum] = "f374d11e3b0e7ca0f805756fd02e34ff" 
>> +SRC_URI[sha256sum] =
>> "baf36e663c03eb6440482d91c486d61ed47ce5c9268ad04c18ca09082755149c" + 
>> +inherit autotools gettext + +# Use openssl because libgcrypt drops
>> root privileges +# if libgcrypt is linked with libcap support 
>> +EXTRA_OECONF = "--with-crypto_backend=openssl"
> 
> 
> hmmmm, may be using packageconfig here would be better
> 
>> -- 1.7.9.5
>> 
>> 
>> _______________________________________________ Openembedded-devel
>> mailing list Openembedded-devel@lists.openembedded.org 
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRXD5mMkyGM64RGpERAlfJAJoDvwX/cgqRMISdDNg40VSsCf6v7gCeN/qe
KJRsc0sM5nBwWsopIzLkYGo=
=nvrs
-----END PGP SIGNATURE-----



