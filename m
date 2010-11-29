Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNAMR-0002Lv-9C
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 21:30:08 +0100
Received: by gxk20 with SMTP id 20so2364860gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 12:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=zDRCqTqGWgM0zKzhWycFztpxVIzf3GtR5i4eqeLpT6c=;
	b=VWASxkC7oBkiUqmt36AVVab46G9bto0q/oIHZh+YKWTctIfeRsZxX8cIS4HI8QVfFj
	bXq2whQM0W4hwba3qWdw+Vk4a5TYRnyiQ0kBozwd/lu1btQrQaYpVhFsTWnq5N2gw4ZN
	D1WOGPggBJ4wHuoNd7xVd8UuTiLYg36bmlgws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=JZM6k26zNEBin0YWMrzLE8N0CHCX2inPO5xCirFL+VdnqsL/zFRa5GF073m3KbTYQy
	Jo8QeWDpEZyCd7IAUJmw5Wl323RIimNODECvSzneDcE0dTd1W9WPtipG4Fz/fcib0UlJ
	+IcDbHzzo4Iitu5ZI75j0Qdum9SNHgBKyVUw0=
Received: by 10.90.99.8 with SMTP id w8mr9690899agb.0.1291062526463; Mon, 29
	Nov 2010 12:28:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 29 Nov 2010 12:28:26 -0800 (PST)
In-Reply-To: <1291062192.3975.38.camel@mattotaupa>
References: <1290773704.28296.30.camel@mattotaupa>
	<AANLkTi=vVQAdAt8xn=xervkgoqbddkucX+qa1ot5Yd-1@mail.gmail.com>
	<1291062192.3975.38.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2010 12:28:26 -0800
Message-ID: <AANLkTimOH=aPwMN3h0xDjw95T4GoXiJVdn3=c_dZ0Nm7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xbmc: task `compile` fails with `/tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'`
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
X-List-Received-Date: Mon, 29 Nov 2010 20:30:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2010 at 12:23 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Montag, den 29.11.2010, 11:43 -0800 schrieb Khem Raj:
>> On Fri, Nov 26, 2010 at 4:15 AM, Paul Menzel
>> <paulepanter@users.sourceforge.net> wrote:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0arm-angstrom-linux-gnueabi-g++ -march=3Darm=
v7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork=
 -mno-thumb -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-g=
nueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-fram=
e-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -=
D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wal=
l -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=
=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isystem/oe/build/angs=
trom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-opt=
imizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive =
-fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-ap=
cs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectori=
ze-with-neon-quad -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-l=
inux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomi=
t-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -=
DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBU=
G -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a =
-mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad SDL_anigif.o XBTF=
Writer.o XBMCTex.o ../../guilib/XBTF.o =C2=A0 =C2=A0 =C2=A0-L/oe/build/angs=
trom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe=
/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 =
-Wl,--hash-style=3Dgnu ../../xbmc/lib/libsquish/libsquish-arm.a -lSDL_image=
 -lSDL -llzo2 -o TexturePacker
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0XBMCTex.o: In function `main':
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build/angstrom-dev/work/armv7a-angstrom=
-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe=
/git/tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_ini=
t2'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0collect2: ld returned 1 exit status
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: *** [TexturePacker] Error 1
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: Leaving directory `/oe/build/angst=
rom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe96=
4321c358ab9d6402088c714adcbe/git/tools/TexturePacker'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0make: *** [tools/TexturePacker/TexturePacke=
r] Error 2
>>
>> It seems link line has -llzo2 and liblzo2 should contain this
>> function, you could investigate.
>> 1. If liblzo2 exists in the staging area
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build/angstrom-dev$ find sysroots/ -iname =
*liblzo*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo.so.1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo.a
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo2.a
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo2.so.2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo2.la
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo.la
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo2.so.2.0.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo.so.1.0.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo.so
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/liblzo2.so
>
>> 2. If it does then dump the symbols it has exported as globals
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build/angstrom-dev$ objdump -t sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/lib/liblzo.so | grep lzo_init
> =C2=A0 =C2=A0 =C2=A0 =C2=A000000000 l =C2=A0 =C2=A0df *ABS* =C2=A00000000=
0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lzo_init.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A00000274c g =C2=A0 =C2=A0 F .text =C2=A0000000c=
8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__lzo_init2
> =C2=A0 =C2=A0 =C2=A0 =C2=A000024ba8 g =C2=A0 =C2=A0 O .bss =C2=A0 0000000=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__lzo_init_done
> =C2=A0 =C2=A0 =C2=A0 =C2=A000002814 g =C2=A0 =C2=A0 F .text =C2=A00000005=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__lzo_init
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build/angstrom-dev$ objdump -t sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/lib/liblzo2.so | grep lzo_init
> =C2=A0 =C2=A0 =C2=A0 =C2=A000000000 l =C2=A0 =C2=A0df *ABS* =C2=A00000000=
0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lzo_init.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0000021fc g =C2=A0 =C2=A0 F .text =C2=A0000000c=
8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__lzo_init_v2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0000247a0 g =C2=A0 =C2=A0 O .bss =C2=A0 0000000=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__lzo_init_done
>
>> 3. If the symbol __lzo_init2 is not exported then find out if
>> something is wrong with liblzo2 builds that can result in this
>> exlusion
>
> Sorry, I do not know how to do that.
>
>

ok so it seems it needs to link with liblzo probably and not with liblzo2

> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


