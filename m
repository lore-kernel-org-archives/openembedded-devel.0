Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PN9ei-00019z-02
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 20:44:56 +0100
Received: by gwj16 with SMTP id 16so1925313gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 11:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9gRysLnBs7QsOSyZNN01ygvC4uYgiROp1dLLIQYBqiY=;
	b=fdgrmXiEW5UMnQjZkHpT2GsT1h3EwsZIO7WWQgtMnkFOxjfCoYmbtREYbDOTgEdpuh
	Xp09AvSM07an/7MGVDd1L9e8pyIjrI3svvW1rD6zPAYiVpflTE/ckP4TqavcUJ46K7fP
	0ttY0z7Kka8VN/Mz2KGuFVbXRzw6eJ6O6pw0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=em4cNjfF0Da6cHPo1ghzaRE+TB6iu6vxME37Zu2egnDnwpIQfEYCwts22yXwYcPsQR
	Ya/M9/cal04eybz0VbGo/ARx0mmLaei7jktfwbbDKziSlTvY9Ns0foK6ca7zM1NMqJ7G
	OtAZ9DmU6w2XGVRy4/L4qVco2FQ7w2OtYyorY=
Received: by 10.91.51.19 with SMTP id d19mr9570562agk.183.1291059815573; Mon,
	29 Nov 2010 11:43:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 29 Nov 2010 11:43:15 -0800 (PST)
In-Reply-To: <1290773704.28296.30.camel@mattotaupa>
References: <1290773704.28296.30.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2010 11:43:15 -0800
Message-ID: <AANLkTi=vVQAdAt8xn=xervkgoqbddkucX+qa1ot5Yd-1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
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
X-List-Received-Date: Mon, 29 Nov 2010 19:44:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2010 at 4:15 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-=
a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -m=
no-thumb -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnue=
abi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-p=
ointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_R=
EENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -=
O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dc=
ortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isystem/oe/build/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimiz=
ations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvi=
sibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_F=
ILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-s=
tack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-w=
ith-neon-quad -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux=
-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-fr=
ame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC=
 -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -W=
all -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcp=
u=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad SDL_anigif.o XBTFWrit=
er.o XBMCTex.o ../../guilib/XBTF.o =C2=A0 =C2=A0 =C2=A0-L/oe/build/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/bui=
ld/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,=
--hash-style=3Dgnu ../../xbmc/lib/libsquish/libsquish-arm.a -lSDL_image -lS=
DL -llzo2 -o TexturePacker
> =C2=A0 =C2=A0 =C2=A0 =C2=A0XBMCTex.o: In function `main':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build/angstrom-dev/work/armv7a-angstrom-li=
nux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/gi=
t/tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0collect2: ld returned 1 exit status
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: *** [TexturePacker] Error 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: Leaving directory `/oe/build/angstrom=
-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe96432=
1c358ab9d6402088c714adcbe/git/tools/TexturePacker'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make: *** [tools/TexturePacker/TexturePacker] =
Error 2
>

It seems link line has -llzo2 and liblzo2 should contain this
function, you could investigate.
1. If liblzo2 exists in the staging area
2. If it does then dump the symbols it has exported as globals
3. If the symbol __lzo_init2 is not exported then find out if
something is wrong with liblzo2 builds that can result in this
exlusion

-Khem


