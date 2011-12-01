Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RW1sF-0003gj-Ao for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:20:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RW1lm-0006vZ-NO for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:13:26 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 09:13:26 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 09:13:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 Dec 2011 09:13:10 +0100
Message-ID: <jb7cun$3n6$1@dough.gmane.org>
References: <20111130143236.2A06010331@opal>
	<CA+chaQctkMN+3h6zjmjXxYMvH_bqqL8UXc7akAE=cx7hnxH+kg@mail.gmail.com>
	<20111201003533.GD29875@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <20111201003533.GD29875@jama.jama.net>
X-Enigmail-Version: 1.3.3
Subject: Re: [oe-commits] Koen Kooi : pixman: update to 0.24.0
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
X-List-Received-Date: Thu, 01 Dec 2011 08:20:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-12-11 01:35, Martin Jansa schreef:
> On Thu, Dec 01, 2011 at 12:18:54AM +0100, Martin Jansa wrote:
>> On Wed, Nov 30, 2011 at 3:32 PM,  <git@git.openembedded.org> wrote:
>>> Module: meta-openembedded.git Branch: master Commit:
>>> 80e3a0c42db89fa2716b0a839b8ef71d6d6349db URL:
>>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=80e3a0c42db89fa2716b0a839b8ef71d6d6349db
>>>
>>>
>>> 
Author: Koen Kooi <koen@dominion.thruhere.net>
>>> Date:   Wed Nov 30 15:27:26 2011 +0100
>>> 
>>> pixman: update to 0.24.0
>>> 
>>> * All patches that went upstream are removed
>>> 
>>> Tested on beagleboard/angstrom
>>> 
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> 
>> 
>> FYI: this break my armv5t build, I'll try to test pixman-0.24.0 from 
>> oe-core or debug it tomorrow.
>> 
>> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc 
>> -march=armv5te -mthumb -mthumb-interwork -mtune=xscale 
>> --sysroot=/OE/shr-core/tmp-eglibc/sysroo ts/spitz -O2 -pipe -g
>> -feliminate-unused-debug-types -Wall -fno-strict-aliasing
>> -fvisibility=hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o
>> .libs/pdf-op-test pdf-op-test.o  ./.libs/libutils.a 
>> ../pixman/.libs/libpixman-1.so 
>> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libpng12.so 
>> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libz.so -lm |
>> ../pixman/.libs/libpixman-1.so: undefined reference to
>> `__builtin_arm_wslldi' | ../pixman/.libs/libpixman-1.so: undefined
>> reference to `__builtin_arm_wor' | ../pixman/.libs/libpixman-1.so:
>> undefined reference to `__builtin_arm_wunpckilb' |
>> ../pixman/.libs/libpixman-1.so: undefined reference to
>> `__builtin_arm_wsrldi' | ../pixman/.libs/libpixman-1.so: undefined
>> reference to `__builtin_arm_waddbus' | ../pixman/.libs/libpixman-1.so:
>> undefined reference to `__builtin_arm_waddhus' |
>> ../pixman/.libs/libpixman-1.so: undefined reference to
>> `__builtin_arm_wsrlhi' | ../pixman/.libs/libpixman-1.so: undefined
>> reference to `__builtin_arm_wxor' | ../pixman/.libs/libpixman-1.so:
>> undefined reference to `__builtin_arm_wpackhus' |
>> ../pixman/.libs/libpixman-1.so: undefined reference to
>> `__builtin_arm_wand' | ../pixman/.libs/libpixman-1.so: undefined
>> reference to `__builtin_arm_wunpckihb' |
>> ../pixman/.libs/libpixman-1.so: undefined reference to
>> `__builtin_arm_wzero' | ../pixman/.libs/libpixman-1.so: undefined
>> reference to `__builtin_arm_walign' | ../pixman/.libs/libpixman-1.so:
>> undefined reference to `__builtin_arm_wmulul' | collect2: ld returned 1
>> exit status | make[2]: *** [a1-trap-test] Error 1
>> 
>> The same for region-test and pdf-op-test.
> 
> Failed the same also for armv4t.. so for now I've added
> --disable-arm-iwmmxt and replaced .bb with smaller .bbappend:
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> 
> DEPENDS += "perl-native" BBCLASSEXTEND = "native"
> 
> PRINC = "6"
> 
> SRC_URI += "
> file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
> 
> NEON = " --disable-arm-neon " NEON_armv7a = " " NEON_armv7a-vfp-neon = "
> "
> 
> IWMMXT = " --disable-arm-iwmmxt "
> 
> EXTRA_OECONF += "${NEON} ${IWMMXT}"

Do you want to send a patch for that?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7XNxYACgkQMkyGM64RGpFMPQCfdUSdwDedEIoZVd0sDwFHoE+/
bekAnjd6YDJhN2+1Do4Q3UVmJ/PWRhy1
=H0/4
-----END PGP SIGNATURE-----



