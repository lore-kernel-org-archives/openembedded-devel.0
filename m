Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1P3wxr-0002kk-Km
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 22:21:20 +0200
Received: from [192.168.1.12] (e180141167.adsl.alicedsl.de [85.180.141.167])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 4753158414D;
	Thu,  7 Oct 2010 22:28:44 +0200 (CEST)
References: <1286408038.3829.22.camel@mattotaupa>
	<AANLkTi=nS_3emPJsndTjjAM=cPwwc=pW0Ktk7DJwEj++@mail.gmail.com>
Message-Id: <5EF44AB3-D6B4-4505-89BE-3CC543B7FECF@vanille-media.de>
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
To: Steve Sakoman <sakoman@gmail.com>
In-Reply-To: <AANLkTi=nS_3emPJsndTjjAM=cPwwc=pW0Ktk7DJwEj++@mail.gmail.com>
X-Mailer: iPad Mail (7B405)
Mime-Version: 1.0 (iPad Mail 7B405)
Date: Thu, 7 Oct 2010 22:28:27 +0200
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: libgee_0.6.0: gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
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
X-List-Received-Date: Thu, 07 Oct 2010 20:21:22 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

That probably needs to be converted into a DEPENDS.

Cheers,

:M:

Am 07.10.2010 um 21:35 schrieb Steve Sakoman <sakoman@gmail.com>:

> On Wed, Oct 6, 2010 at 4:33 PM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>> Dear OE folks,
>>=20
>>=20
>> `configure` fails for me for `libgee_0.6.0.bb` [1].
>>=20
>>        | gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in =
AM_CONDITIONAL
>>=20
>> `libgee_0.5.2.bb` builds correctly because it does not yet use =
gobject-introspection.
>>=20
>> This question was brought up before but was left unanswered [2].
>>=20
>> There was no file `introspection.m4`, where `HAVE_INTROSPECTION` is
>> defined in, in
>>=20
>>        =
=E2=80=A6/work/armv7a-oe-linux-gnueabi/libgee-1_0.6.0-r1/libgee-0.6.0/m4
>>=20
>> as recommended in [3]. Should the m4 file be copied there as it is =
done
>> for the other m4 files?
>>=20
>>        [=E2=80=A6]
>>        | autoreconf: configure.ac: tracing
>>        | autoreconf: running: libtoolize --copy --force
>>        | libtoolize: putting auxiliary files in `.'.
>>        | libtoolize: copying file `./ltmain.sh'
>>        | libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
>>        | libtoolize: copying file `m4/libtool.m4'
>>        | libtoolize: copying file `m4/ltoptions.m4'
>>        | libtoolize: copying file `m4/ltsugar.m4'
>>        | libtoolize: copying file `m4/ltversion.m4'
>>        | libtoolize: copying file `m4/lt~obsolete.m4'
>>        [=E2=80=A6]
>>=20
>> I manually put the m4 file [4] into `libgee-0.6.0/m4/` and added
>> `m4/introspection.m4` to `EXTRA_DIST` in `Makefile.am` to `` but
>>=20
>>        bitbake -c configure libgee
>>=20
>> still failed.
>>=20
>> Do you have any ideas?
>=20
> I found that if I built gobject-introspection-native manually, then
> libgee would complete without error.
>=20
> The DEPENDS_virtclass-native =3D "gobject-introspection-native" in the
> libgee recipe isn't triggering the build automatically.
>=20
> Steve


