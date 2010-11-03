Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PDa8I-0007XK-OD
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 10:59:57 +0100
Received: from keemun.altell.local (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 289B6543F;
	Wed,  3 Nov 2010 12:58:49 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Wed, 3 Nov 2010 12:58:48 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.3-desktop; KDE/4.4.4; x86_64; ; )
References: <1288773858.3980.10.camel@mattotaupa>
In-Reply-To: <1288773858.3980.10.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201011031258.48681.khimov@altell.ru>
X-Altell-MailScanner-ID: 289B6543F.074D7
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libprelude: angstrom-2010.x: task `compile` fails with `./include/prelude-plugin.h:66:20: error: conflicting types for 'lt__PROGRAM__LTX_preloaded_symbols'`
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
X-List-Received-Date: Wed, 03 Nov 2010 09:59:57 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 03 =D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2010=
 11:44:18 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Paul Menzel =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> Build Configuration:
> BB_VERSION        =3D "1.10.0"
> METADATA_BRANCH   =3D "org.openembedded.dev"
> METADATA_REVISION =3D "54d1ab587326543390e8ae55e9f7945a3a4ebdd1"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "beagleboard"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "next"
> TARGET_FPU        =3D "hard"
>=20
> testing to build `suricata_1.0.2` (commit f85795) [1] the build fails in
> the task `compile` of the dependency `libprelude_1.0.0` (commit 577889)
> [2].
>=20
>         | In file included from prelude-plugin.c:56:0:
>         | ./include/prelude-plugin.h:66:20: error: conflicting types for
>         | 'lt__PROGRAM__LTX_preloaded_symbols'
>         | /oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-li
>         | nux-gnueabi/usr/include/ltdl.h:106:36: note: previous declarati=
on
>         | of 'lt__PROGRAM__LTX_preloaded_symbols' was here make[4]: ***
>         | [prelude-plugin.lo] Error 1
>=20
> Could you take a look and/or report that upstream.

I can and I will but please don't expect it sooner than this weekend, I'm=20
overloaded at work currently.


