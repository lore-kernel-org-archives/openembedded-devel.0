Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmSV1-0002os-Uh
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 17:27:48 +0200
Received: by pzk1 with SMTP id 1so4749730pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=mN3uwxWoSlCWtQFKGtbUlZGWyOup0PsXbr/p+2d1PgQ=;
	b=CeqvRn2Z+bSVSiRK7gI34FpndKJy+4WlR5YYxHQoCU5aGHKAK3gh7O/0G2Jf94DxkP
	25UppDdG/2CQyDGpHiQ3x2wGsLp3SHuXmsdXXnvCFFZLoXxH/MXqS0BWPnvwifku5IKK
	7BrnjPcbLRa0BOMz8aJY3ujBtnodvSCLqWQqo=
Received: by 10.68.34.35 with SMTP id w3mr380969pbi.144.1311866611116; Thu, 28
	Jul 2011 08:23:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Thu, 28 Jul 2011 08:23:01 -0700 (PDT)
In-Reply-To: <j0r3md$jq5$1@dough.gmane.org>
References: <4E3104D3.7050702@dresearch-fe.de> <j0r3md$jq5$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jul 2011 08:23:01 -0700
Message-ID: <CAMKF1spsmfABvkBBv6s-WCmZAFVKyFuC+42+of85Y6zBQUKW2w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Problem building gcc
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
X-List-Received-Date: Thu, 28 Jul 2011 15:27:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2011 at 12:38 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 28-07-11 08:42, Steffen Sledz schreef:
>> I've problems building gcc from the 2011.03-maintenance branch. The do_i=
nstall step fails with
>>
>> | + mv '/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_=
1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc+=
+.so.*-gdb.py*'
>> /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/a=
rmv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/share/gdb/auto-load/=
usr/lib | mv: cannot stat
>> `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc++.so.*-=
gdb.py*': No such file or directory NOTE: package gcc-4.3.3-r24.1: task do_=
install: Failed ERROR: Function 'do_install' failed (see
>> /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/a=
rmv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/temp/log.do_install.14408 for =
further information) ERROR: Task 2 (/home/sledz/work/angstrom-setup-scripts=
/sources/openembedded/recipes/gcc/gcc_4.3.3.bb, do_install) failed with
>> exit code '1' ERROR: '/home/sledz/work/angstrom-setup-scripts/sources/op=
enembedded/recipes/gcc/gcc_4.3.3.bb' failed
>>
>> A way to reproduce the problem is using the current =C3=85ngstr=C3=B6m o=
ebb.sh script:
>>
>> MACHINE=3Dbeagleboard ./oebb.sh bitbake gcc
>>
>> My build host is running a 64-bit openSUSE 11.4.
>>
>
> Can you try:
>
> diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package=
-target.inc
> index 33567da..7d3f4ae 100644
> - --- a/recipes/gcc/gcc-package-target.inc
> +++ b/recipes/gcc/gcc-package-target.inc
> @@ -171,5 +171,5 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/lib=
gcc_s.so
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_=
SYS}/bits/*.gch
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# move the gdb python helpers to gdb auto-load=
 directory
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/gdb/auto-load/${libd=
ir}
> - - =C2=A0 =C2=A0 =C2=A0 mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${da=
tadir}/gdb/auto-load${libdir}
> + =C2=A0 =C2=A0 =C2=A0 mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${data=
dir}/gdb/auto-load${libdir} || true
> =C2=A0}

so these are not generated for gcc 4.3 ? in any case this patch seems ok to=
 me

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOMRINMkyGM64RGpERAmHUAJ9ujUhTt4aw9jT49EaNRY7cUuD7hgCeOsBJ
> vcTtJYmXd5igGAygUTQr5Og=3D
> =3Dnwkq
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


