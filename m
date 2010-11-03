Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDYFE-0007eA-FR for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 08:58:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDYEN-0002ZB-4f for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 08:58:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 08:58:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 08:58:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Nov 2010 08:57:51 +0100
Message-ID: <iar4lv$o03$1@dough.gmane.org>
References: <4CCF64DD.9080709@gmail.com>	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTimvfGUSNhMnvcru3D46EoqNcSW87sON6OMV0GD5@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTimvfGUSNhMnvcru3D46EoqNcSW87sON6OMV0GD5@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 07:58:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-11-10 01:04, Graham Gower wrote:
> On 2 November 2010 17:08, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/11/2 Graham Gower <graham.gower@gmail.com>:
>>>  * Point configure at where it can find jpeg.
>>>  * Explicitly disable cdk and aalib.
>>>  * Fix license while here.
>>>
>>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>>> ---
>>>  recipes/gphoto2/gphoto2_2.4.8.bb |    9 +++++++--
>>>  1 files changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/recipes/gphoto2/gphoto2_2.4.8.bb b/recipes/gphoto2/gphoto2_2.4.8.bb
>>> index ea54713..836ea85 100644
>>> --- a/recipes/gphoto2/gphoto2_2.4.8.bb
>>> +++ b/recipes/gphoto2/gphoto2_2.4.8.bb
>>> @@ -1,7 +1,8 @@
>>>  DESCRIPTION = "gphoto2 is a command-line utility to fetch pictures from digital cameras"
>>>  SECTION = "console/utils"
>>> -LICENSE = "GPL"
>>> -DEPENDS = "libtool libgphoto2 popt"
>>> +LICENSE = "GPLv2+"
>>> +DEPENDS = "libtool libgphoto2 popt jpeg"
>>
>> The original recipe would build without the depends on jpeg
>> adding it to depends should be mentioned in the commit message
>>
>>> +PR = "r1"
>>>
>>>  SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
>>>            file://gphoto-popt-fixup.patch"
>>> @@ -11,6 +12,10 @@ SRC_URI[gphoto2.sha256sum] = "a2e2f70fd6051234cbc3d76dc82df6991e8a07ead56aa8d5c4
>>>
>>>  inherit autotools
>>>
>>> +EXTRA_OECONF="--without-cdk \
>>> +               --without-aalib \
>>> +               --with-jpeg-prefix=${STAGING_EXECPREFIXDIR}"
>>> +
>>
>> I have some concerns here.
>> For configure it seems best to explicitly set and reset the flags in
>> it, otherwise you may just pick up whatever happened to be build
>> before.
>>
>> from --help:
>>
>> Optional Features:
>>  --disable-option-checking  ignore unrecognized --enable/--with options
>>  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
>>  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
>>  --disable-dependency-tracking  speeds up one-time build
>>  --enable-dependency-tracking   do not reject slow dependency extractors
>>  --enable-shared[=PKGS]  build shared libraries [default=yes]
>>  --enable-static[=PKGS]  build static libraries [default=yes]
>>  --enable-fast-install[=PKGS]
>>                          optimize for fast installation [default=yes]
>>  --disable-libtool-lock  avoid locking (might break parallel builds)
>>  --disable-largefile     omit support for large files
>>  --disable-nls           do not use Native Language Support
>>  --disable-rpath         do not hardcode runtime library paths
>>
>> Optional Packages:
>>  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
>>  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
>>  --with-pic              try to use only PIC/non-PIC objects [default=use
>>                          both]
>>  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
>>  --with-gnu-ld           assume the C compiler uses GNU ld default=no
>>  --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
>>  --without-libiconv-prefix     don't search for libiconv in
>> includedir and libdir
>>  --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
>>  --without-libintl-prefix     don't search for libintl in includedir and libdir
>>  --with-libgphoto2=PREFIX
>>                          where to find libgphoto2, "no" or "auto"
>>  --without-pthread         Don't use pthread
>>  --without-cdk           Do not use cdk
>>  --with-cdk-prefix=PREFIX
>>                          Location of cdk
>>  --without-jpeg          Do not use jpeg
>>  --with-jpeg-prefix=PREFIX
>>                          Location of jpeg
>>  --with-libexif=PREFIX   where to find libexif, "no" or "auto"
>>  --without-aalib         Do not use aalib
>>  --without-readline      Do not use readline
>>
>> All things that are not mentioned in DEPENDS should (IMHO) be
>> explicitly be turned off.
>> And for the things in DEPENDS I would encourage to still add them.
>> E.g. --with-jpeg. Yes I know these will always be picked up when a
>> DEPENDS = "jpeg" is present, but making it explict does not hurt and
>> it trips an error if jpeg is not there and someone does a bitbake -b
>> of the recipe (instead of silently building a package without jpeg).
>>
>> Thanks for your contribution & apologies for using your commit for a
>> rant on configure flags.
>>
>> Frans.
>>
> 
> I agree with you here. Often a recipe breaks when a particular
> subsystem is enabled, which is usually not enabled during regular
> image builds. And it can be difficult to determine if something should
> be added to DEPENDS or disabled at configure time.
> 
> What I found with gphoto2 (which probably wasn't clear) was the
> configure script was testing for jpeg and cdk with
> -I/usr/local/include. So I guessed on what was useful and what wasn't
> and added jpeg to depends to make it clear that jpeg support was
> intended (even though it will likely be pulled in by other
> dependencies).
> 
> I assume you just want exif and readline disabled too? (and possibly
> an essay in the commit message :))

For gphoto2 to be usefull it need exif, not sure what readline brings us.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM0RX/MkyGM64RGpERApdsAJ0UwmJ03Z/Q7LyJoSKssYWZQRg1wQCeL94P
FIJjFYYigRNPTPrV1XXemD8=
=GDK5
-----END PGP SIGNATURE-----



