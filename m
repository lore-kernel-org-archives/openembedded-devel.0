Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1ROhid-0006UB-1w for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 04:23:56 +0100
Received: by gyh4 with SMTP id 4so2473122gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 19:17:37 -0800 (PST)
Received: by 10.101.196.32 with SMTP id y32mr4469311anp.120.1320981456495;
	Thu, 10 Nov 2011 19:17:36 -0800 (PST)
Received: from [192.168.0.225] ([24.214.175.85])
	by mx.google.com with ESMTPS id c10sm15079288yhj.2.2011.11.10.19.17.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 19:17:35 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: David Thomas <david.thomas@microbee-systems.com>
In-Reply-To: <1320966270.21414.8.camel@mattotaupa>
Date: Thu, 10 Nov 2011 21:17:51 -0600
Message-Id: <18E8B061-C5E9-48CE-93CF-94642D94339A@microbee-systems.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1389840.j5gWQFZ9u1@helios>
	<D1FB05D7-71E3-4B22-8A8B-594B38FE09D1@microbee-systems.com>
	<CALJpqJx6SVr8TRPDaZFSvEWfs-uyjN_OMsrLxVfYo+RrLtCQcg@mail.gmail.com>
	<1320966270.21414.8.camel@mattotaupa>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Fri, 11 Nov 2011 03:23:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Nov 10, 2011, at 5:04 PM, Paul Menzel wrote:

> Am Donnerstag, den 10.11.2011, 16:11 -0600 schrieb David Thomas:
>> I have tried every possible way, 8 hours so far, to get this file to
>> process these patches. I got the patches, I have set up local
>> repositories, ad nasium and same response, unable to fetch from any
>> source.
>>=20
>> I have tired every combination, I have tried every possible link, =
url,
>>=20
>> SRC_URI =3D "git:///home/twoods/local;protocol=3Dfile;branch=3Dmaster"
>>=20
>> =
git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit;file://smallsc=
reen-fontsize.patch;patch=3D1
>>=20
>> and on and on. Every single project I have seen references the same
>>=20
>>=20
>> SRC_URI =3D =
"svn://svn.o-hand.com/repos/matchbox/trunk;module=3D${PN};proto=3Dhttp \
>>=20
>> I am at the point of hurling this machine out a window. How could =
this
>> be so cryptic and difficult?
>>=20
>> Does anyone have a idea?
>>=20
>> DESCRIPTION =3D "Matchbox virtual keyboard for X11"
>> LICENSE =3D "GPL"
>> DEPENDS =3D "libfakekey expat libxft"
>> RCONFLICTS =3D matchbox-keyboard-inputmethod
>> RPROVIDES_${PN} =3D matchbox-keyboard-inputmethod
>> SECTION =3D "x11"
>> PV =3D "0.0+svnr${SRCPV}"
>> PR =3D"r7"
>>=20
>> SRC_URI =3D =
"https://git.gitorious.org/cm-t3530/cm-t3530.git;protocol=3Dgit \
>>           file://smallscreen-fontsize.patch;patch=3D1 \
>>           =
file://2-Add-new-modifier--layout--Used-to-cycle-thru-all-available-layout=
s.patch;patch=3D1\
>>           =
file://3-Changes-to-improve-layout-rendering--especially-after-adding-supp=
ort-for.patch;patch=3D1 \
>>           file://4-Add-rendering-debug-logging.patch;patch=3D1 \
>>           =
file://5-Add-support-for-loading-multiple-independent-layouts.patch;patch=3D=
1 \
>>           file://6-Add-layout-switch-key-to-all-layouts.patch;patch=3D1=
 \
>>          "
>=20
> Where do you have these files stored?

     $OEBASE/sources or /home/twoods/sources
>=20
>> S =3D "${WORKDIR}/${PN}"
>>=20
>> inherit autotools pkgconfig gettext
>>=20
>> EXTRA_OECONF =3D "--disable-cairo"
>>=20
>> FILES_${PN} =3D "${bindir}/* \
>> 	       ${datadir}/applications \
>> 	       ${datadir}/pixmaps \
>> 	       ${datadir}/matchbox-keyboard"
>=20
>=20
> Thanks,
>=20
> Paul
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



