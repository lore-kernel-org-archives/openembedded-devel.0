Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Puh2B-0001rN-Gd
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 09:03:47 +0100
Received: by fxm8 with SMTP id 8so5467298fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=KuW5BOB42Ds4Fmwt3RKTiNMaJdPoTRsInI8ta1uwDCE=;
	b=u/ssrOfQsBmci5kHaKDBXTiC4cJTwQjU2GpAQDce8dPdLw26y4ceKVopcVbz0rsur5
	Wof2g/4tb+NF7RFZe3UKvu1njc3qy6V2Ab4jJPOz0C9ClzyEUwpY1rqxv115uftR85Pb
	/CMn0XGkv2XiKvBsJUdmYh71Dez+XjeidEQlc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=eyDayQLNARxrf8bE1kI1h/m/0mb4E1vKF18qrynzYHwR2pyQnWJkWOZ5Tewj32mSDt
	h+ewosfmwtoLp7Dn53zRBgy0Q+qxruahJRzXj7UTNLm/iqlzmduUugv4I8epXXgfreBa
	hftvFjRQGLBnINN1ex2a1dzPWeYL7YXuVPkho=
Received: by 10.223.96.195 with SMTP id i3mr3270167fan.77.1299052940804; Wed,
	02 Mar 2011 00:02:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 2 Mar 2011 00:01:50 -0800 (PST)
In-Reply-To: <4D6DF124.2080607@dresearch.de>
References: <4D64BD5E.6040805@dresearch.de> <4D6DF124.2080607@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2011 00:01:50 -0800
Message-ID: <AANLkTi=sJanB_o6LGmg=3-96=iDD8VMrM-DLp4EC+zBr@mail.gmail.com>
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
X-List-Received-Date: Wed, 02 Mar 2011 08:03:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 11:26 PM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 23.02.2011 08:55, schrieb Steffen Sledz:
>> Again a clean build:
>>
>> OE:hipox sledz@mobil-400-586:~/work/openembedded> bitbake net-snmp
>> ...
>>
>> Build Configuration:
>> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.12.0"
>> METADATA_BRANCH =C2=A0 =3D "org.openembedded.dev"
>> METADATA_REVISION =3D "8e4bd2f"
>> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
>> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
>> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hipox"
>> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
>> DISTRO_VERSION =C2=A0 =C2=A0=3D "2010.7-test-20110223"
>> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "soft"
>>
>> ...
>> libtool: link: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3D=
arm926ej-s -Wl,-rpath-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/a=
rmv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -mthum=
b-interwork -mno-thumb -DNETSNMP_ENABLE_IPV6 -isystem/home/sledz/work/OE-te=
sting/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive=
-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -Ulinux -=
Dlinux=3Dlinux -Wall -Winline -Wstrict-prototypes -Wwrite-strings -Wcast-qu=
al -Wno-char-subscripts -o .libs/snmpd .libs/snmpd.o -Wl,-rpath-link -Wl,/h=
ome/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr=
/lib -Wl,-O1 -Wl,--hash-style=3Dgnu =C2=A0-L/home/sledz/work/OE-testing/tmp=
.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/.li=
bs -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/=
net-snmp-svn-r7.0/net-snmp/agent/helpers/.libs
>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/=
net-snmp-svn-r7.0/net-snmp/snmplib/.libs -L/home/sledz/work/OE-testing/tmp.=
6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -L/home/sledz/work/OE-tes=
ting/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/s=
nmplib -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnue=
abi/net-snmp-svn-r7.0/net-snmp/agent/helpers ./.libs/libnetsnmpagent.so hel=
pers/.libs/libnetsnmphelpers.so ./.libs/libnetsnmpmibs.so /home/sledz/work/=
OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-=
snmp/agent/helpers/.libs/libnetsnmphelpers.so /home/sledz/work/OE-testing/t=
mp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/.=
libs/libnetsnmpagent.so /home/sledz/work/OE-testing/tmp.6/work/armv5te-angs=
trom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmplib/.libs/libnetsnmp.so -=
ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lssl
>> ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
>> collect2: ld returned 1 exit status
>> make[1]: *** [snmpd] Error 1
>
> I did some research in this. This is a bug fixed upstream with svn revisi=
on 18721[1].
>
> How can we handle this? Should we increase the SRCREV to a newer version =
(which one)?
>
> Or should we create a patch backporting the fix? Then we need someone who=
 is more familiar with autotools (i failed here).

for svn recipe you can bump rev up and for others you can backport the
fix and you can backport it as it is ideally that patch should
have changed configure.ac and regenerated configure but they patched
configure instead. but its ok to patch configure here since
we do not regenerate configure for net-snmp recipe.
>
> Steffen
>
> [1] http://net-snmp.svn.sourceforge.net/viewvc/net-snmp?view=3Drevision&r=
evision=3D18721
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


