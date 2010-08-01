Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OfhJc-0001oQ-A4
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 00:47:33 +0200
Received: by pwi10 with SMTP id 10so1208415pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Aug 2010 15:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ZsEPvTB2o/4s0NDVJFMK8JWaSdttlceomYGakZ6158w=;
	b=PVjH6Ny2qaZLJwh64dEMWUt8+k5vlVLjGOdN6KjUgfWi65vrKWy1HdvgtutnvRxGhL
	2hjimZ7f5jOz4NscdU2vpllHt2TZSh2m0NQ5/QaKqg0ImW6whNyW8Ysl8brYRaRvr6dG
	AJe6SQOZqD5PHQWRcpxYBizANmVF13xTe1qNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=NdtqL5NsgweZgiZNcx17tQiqo/zlEtAnYZYuORtM+CNzZWt1S1K42fMwUlqggx5NOt
	IFCGqhFgWP35T0GUh8P3dmq623b5rS70L9lYU8tuXQN3YRHkblSOMmrtvtNV2ik2lg+E
	z+9CeidQON4aY6bl/TiS3ewV11U5/PuI7psTI=
Received: by 10.114.120.20 with SMTP id s20mr2338315wac.60.1280702825204;
	Sun, 01 Aug 2010 15:47:05 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n32sm10022325wag.11.2010.08.01.15.47.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 01 Aug 2010 15:47:04 -0700 (PDT)
Date: Sun, 1 Aug 2010 15:46:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100801224659.GF30928@gmail.com>
References: <alpine.DEB.2.00.1007270333240.15938@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1007270333240.15938@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: one package build failure for angstrom: gnash
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
X-List-Received-Date: Sun, 01 Aug 2010 22:47:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On (27/07/10 03:38), Robert P. J. Day wrote:
>=20
>   with current git pull, a build of beagleboard-demo-image on my
> 64-bit ubuntu system finally settled down to a single build failure of
> gnash.  i've attached the full compile log file, but here's what
> appears to be the salient part of it:
>=20
> ... snip ...
> /bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcom=
pile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -I/home/rpjday/=
oe/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 =
-DHAVE_POLL_H  -D_LITTLE_ENDIAN -DHAVE_CONFIG_H -I. -I..  -DPLUGINSDIR=3D\"=
/usr/lib/gnash/plugins\" -DSYSCONFDIR=3D\"/etc\" -I../libnet -I../libamf -I=
=2E./libcore -I../libcore/swf -pthread -I/home/rpjday/oe/angstrom-dev/sysro=
ots/armv7a-angstrom-linux-gnueabi/usr/include  -I/home/rpjday/oe/angstrom-d=
ev/sysroots/x86_64-linux/usr/include/glib-2.0 -I/home/rpjday/oe/angstrom-de=
v/sysroots/x86_64-linux/usr/lib/glib-2.0/include  -I/home/rpjday/oe/angstro=
m-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/=
home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/include   -I/home/rpj=
day/oe/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I/h=
ome/rpjday/oe/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/us
> r/include  -isystem/home/rpjday/oe/angstrom-dev/sysroots/armv7a-angstrom-=
linux-gnueabi/usr/include  -isystem/home/rpjday/oe/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-=
registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines=
-hidden -pthread -pthread     -W     -Wall     -Wcast-align     -Wcast-qual=
     -Wpointer-arith     -Wreturn-type     -Wnon-virtual-dtor     -Wunused =
     -fvisibility-inlines-hidden -MT libgnashbase_la-curl_adapter.lo -MD -M=
P -MF .deps/libgnashbase_la-curl_adapter.Tpo -c -o libgnashbase_la-curl_ada=
pter.lo `test -f 'curl_adapter.cpp' || echo './'`curl_adapter.cpp
> arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-=
g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb -I/home/rpjday/oe/angstrom-dev/sysroots/armv7a-=
angstrom-linux-gnueabi/usr/include/libxml2 -DHAVE_POLL_H -D_LITTLE_ENDIAN -=
DHAVE_CONFIG_H -I. -I.. -DPLUGINSDIR=3D\"/usr/lib/gnash/plugins\" -DSYSCONF=
DIR=3D\"/etc\" -I../libnet -I../libamf -I../libcore -I../libcore/swf -pthre=
ad -I/home/rpjday/oe/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/include -I/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/include/=
glib-2.0 -I/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/lib/glib-=
2.0/include -I/home/rpjday/oe/angstrom-dev/sysroots/armv7a-angstrom-linux-g=
nueabi/usr/include/gstreamer-0.10 -I/home/rpjday/oe/angstrom-dev/sysroots/x=
86_64-linux/usr/include -I/home/rpjday/oe/angstrom-dev/sysroots/armv7a-angs=
trom-linux-gnueabi/usr/include -I/home/rpjday/oe/angstrom-dev/sysroots/armv=
7a-angstrom-linux-gnueabi/usr/include -isystem/home/rpjday/oe/
> angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -isystem/=
home/rpjday/oe/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/incl=
ude -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -=
ggdb3 -fpermissive -fvisibility-inlines-hidden -pthread -pthread -W -Wall -=
Wcast-align -Wcast-qual -Wpointer-arith -Wreturn-type -Wnon-virtual-dtor -W=
unused -fvisibility-inlines-hidden -MT libgnashbase_la-curl_adapter.lo -MD =
-MP -MF .deps/libgnashbase_la-curl_adapter.Tpo -c curl_adapter.cpp  -fPIC -=
DPIC -o .libs/libgnashbase_la-curl_adapter.o
> In file included from /home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/=
usr/include/curl/curl.h:36,
>                  from curl_adapter.cpp:70:
> /home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/include/curl/curlr=
ules.h:144: error: size of array '__curl_rule_01__' is negative
> /home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/include/curl/curlr=
ules.h:154: error: size of array '__curl_rule_02__' is negative
> make[2]: *** [libgnashbase_la-curl_adapter.lo] Error 1


its pulling in wrong header.
/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/include/curl/curlrul=
es.h
is for build box. It sould have includes the one from target sysroot.
Somehow libtool is hosing it up.=20


> make[2]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/gnash-0.8.5-r6/gnash-0.8.5/libbase'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/rpjday/oe/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/gnash-0.8.5-r6/gnash-0.8.5'
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>=20
>   astonishingly, both firefox and abiword appear to build.  so it's
> only gnash that's the roadblock now.
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>=20
>         Top-notch, inexpensive online Linux/OSS/kernel courses
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



