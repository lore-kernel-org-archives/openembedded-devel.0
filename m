Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAI9s-0007Bu-VO
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:11:58 +0200
Received: by iwn41 with SMTP id 41so474174iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=StGYOZ5mAtiCbDitepTF1LC6OnUE9jAJL57SAy/xUD0=;
	b=Y4qCUuf0jAQ6A0nMvGEasxr4ZeJBlftp6D0+dqiecMs8yOcbZgdN+ozxIljOMGiPg6
	HPI0mqSXGaG4KYm47/S/LrZ4IaK+1gC/9pStA2QhhiJ/a7vDCBOj1l5Ma7YaBcjKStyT
	JAUVvi/GqD/r7kfxOjlz0h2kK3IEMVygkWGcU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YcrMvfv/Rr8ZoQvTrfOcpTe/S9iMcW/nt2Rft8Cw+QQAIBI9tUwCA+ECG7Diq+f/OL
	oped+ZOKMT77tSqHdbg567EMEyLdp28cECAdQL4RHktwhe7emUe01EAhQyM8xxnfTdA3
	O7ba3LS8FsTts7bvs0raxmYnLezI0u+iZ5xU0=
Received: by 10.42.191.210 with SMTP id dn18mr4680570icb.288.1287994277112;
	Mon, 25 Oct 2010 01:11:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 01:10:57 -0700 (PDT)
In-Reply-To: <4CC53A53.9080907@nedap.com>
References: <4CC53A53.9080907@nedap.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2010 01:10:57 -0700
Message-ID: <AANLkTimtcG9b7dEX2SLuOQ-Lq7kv2AmSEuVS4ek+hk_H@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: -lz gets translated into /usr/lib/libz.so
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
X-List-Received-Date: Mon, 25 Oct 2010 08:11:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2010 at 1:05 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote=
:
> Building openjdk-6 still ends in an error (or again?)
> Looking at the log file reveals that the -lz option is somehow replaced b=
y
> /usr/lib/libz.so
> Is there anyone with a hint in the right direction?
> Is this a libtool issue?

are you using libtool 2.4 ? i.e. if you are using angstrom-2010 then
you are. In this case the libtool macros used for concerned package
might need upgrade.

>
> ////
> | /bin/sh ../../libtool --tag=3DCC =C2=A0 --mode=3Dlink
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mno-thumb -D__ARM__ -D__LINUX__ -std=3Dc99 -pedantic -=
Wall
> -Wno-long-long -D_POSIX_C_SOURCE=3D200112L -D_XOPEN_SOURCE=3D600
> -D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_REENTRANT
> -isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-=
gnueabi/usr/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -gg=
db2
> -fno-strict-aliasing -avoid-version -Xlinker
> --version-script=3D../../contrib/mapfile-vers-product -Wl,-O1
> -Wl,--hash-style=3Dgnu -o libjvm.la -lz -lpthread -ldl =C2=A0-rpath
> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/open=
jdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/install/lib
> =C2=A0../../src/fdlibm/libfdlibm.la ../../src/mm/libmm.la
> ../../src/native/libnative.la ../../src/threads/libthreads.la
> ../../src/toolbox/libtoolbox.la ../../src/vm/libvm.la
> ../../src/vmcore/libvmcore.la
> | arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mno-thumb -shared =C2=A0-Wl,--whole-archive
> ../../src/fdlibm/.libs/libfdlibm.a ../../src/mm/.libs/libmm.a
> ../../src/native/.libs/libnative.a ../../src/threads/.libs/libthreads.a
> ../../src/toolbox/.libs/libtoolbox.a ../../src/vm/.libs/libvm.a
> ../../src/vmcore/.libs/libvmcore.a -Wl,--no-whole-archive */usr/lib/libz.=
so*
> -lpthread -ldl =C2=A0-march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwo=
rk
> -mno-thumb -Wl,--version-script=3D../../contrib/mapfile-vers-product -Wl,=
-O1
> -Wl,--hash-style=3Dgnu -Wl,-soname -Wl,libjvm.so -o .libs/libjvm.so
> | /usr/lib/libz.so: could not read symbols: File in wrong format
> | collect2: ld returned 1 exit status
> ////
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


