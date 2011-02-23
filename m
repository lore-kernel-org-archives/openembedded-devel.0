Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsN2d-0007ur-4b
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 23:18:39 +0100
Received: by fxm8 with SMTP id 8so4093607fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 14:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=p7o9rS/q7eeqZRs6EQzTfO8U0RMvzO4opE7Cal4/uD0=;
	b=PXSl04qtFZXIPCz+YAT2oUZaed2/PJSNf73+9qjgV23hbUrrhBwXrj5qqfXSSy4kOk
	Gnbu4o+f5GuVT+2XgRYfvOux3BIDLLyfsDV6UvDrJUWQP9dQM8IbqD7ZxPKix7KvVXto
	JIKxdjaVflo3WK4Vpxf9alDckobLD9Tairv1Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=SqMr6ImuYh7cQsjbEpBWLbxlBOnVbKM2L/sszml8wHeFZou9ZXwvpgWF7cf+Wy19wp
	/oOB3OCNHPI7AVc1FCqD6sLM2YJwt40Zr6EL3BQbu8pVkY/ZaAnC5HbtKBDtQgMjIjuZ
	VooCzkHDkzywE+ejMcyCuTtZW0vZu5xP6HKfk=
Received: by 10.223.71.199 with SMTP id i7mr49670faj.57.1298499048714; Wed, 23
	Feb 2011 14:10:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 14:07:36 -0800 (PST)
In-Reply-To: <4D64BD5E.6040805@dresearch.de>
References: <4D64BD5E.6040805@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 14:07:36 -0800
Message-ID: <AANLkTi=ez39+s8=GSRnoZ9N8sDWjQn75d0tR==0VSoDk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: net-snmp-svn-r7.0 do_compile failed
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
X-List-Received-Date: Wed, 23 Feb 2011 22:18:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2011 at 11:55 PM, Steffen Sledz <sledz@dresearch.de> wrote:
> Again a clean build:
>
> OE:hipox sledz@mobil-400-586:~/work/openembedded> bitbake net-snmp
> ...
>
> Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.12.0"
> METADATA_BRANCH =C2=A0 =3D "org.openembedded.dev"
> METADATA_REVISION =3D "8e4bd2f"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hipox"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "2010.7-test-20110223"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "soft"
>
> ...
> libtool: link: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Da=
rm926ej-s -Wl,-rpath-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/ar=
mv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -mthumb=
-interwork -mno-thumb -DNETSNMP_ENABLE_IPV6 -isystem/home/sledz/work/OE-tes=
ting/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-=
optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -Ulinux -D=
linux=3Dlinux -Wall -Winline -Wstrict-prototypes -Wwrite-strings -Wcast-qua=
l -Wno-char-subscripts -o .libs/snmpd .libs/snmpd.o -Wl,-rpath-link -Wl,/ho=
me/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/=
lib -Wl,-O1 -Wl,--hash-style=3Dgnu =C2=A0-L/home/sledz/work/OE-testing/tmp.=
6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/.lib=
s -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/n=
et-snmp-svn-r7.0/net-snmp/agent/helpers/.libs
> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/n=
et-snmp-svn-r7.0/net-snmp/snmplib/.libs -L/home/sledz/work/OE-testing/tmp.6=
/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -L/home/sledz/work/OE-test=
ing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/sn=
mplib -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnuea=
bi/net-snmp-svn-r7.0/net-snmp/agent/helpers ./.libs/libnetsnmpagent.so help=
ers/.libs/libnetsnmphelpers.so ./.libs/libnetsnmpmibs.so /home/sledz/work/O=
E-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-s=
nmp/agent/helpers/.libs/libnetsnmphelpers.so /home/sledz/work/OE-testing/tm=
p.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/.l=
ibs/libnetsnmpagent.so /home/sledz/work/OE-testing/tmp.6/work/armv5te-angst=
rom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmplib/.libs/libnetsnmp.so -l=
dl ../snmplib/.libs/libnetsnmp.so -lcrypto -lssl
> ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
> collect2: ld returned 1 exit status
> make[1]: *** [snmpd] Error 1

confgure could have a test to use/not use libpthread to link and this
test may be failing for some reason and disabling libpthread from
getting into
linker commandline and resulting in this. look at config.log I would
say and see what games it plays with libpthread tests if they are
runtime
tests then they wont succeed for sure.

>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@DResearch.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


