Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QDNuN-0001xQ-SK
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Apr 2011 23:29:00 +0200
Received: by wwb17 with SMTP id 17so734444wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2011 14:26:34 -0700 (PDT)
Received: by 10.216.159.75 with SMTP id r53mr1380758wek.98.1303507592664;
	Fri, 22 Apr 2011 14:26:32 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m2sm1564549wer.13.2011.04.22.14.26.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Apr 2011 14:26:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303506946.4155.81.camel@mattotaupa>
Date: Fri, 22 Apr 2011 23:26:29 +0200
Message-Id: <AF97BCF4-CD32-4069-BB81-FECAC104F6D9@dominion.thruhere.net>
References: <1303134465.3910.63.camel@mattotaupa>
	<1303134640.3910.67.camel@mattotaupa>
	<4DAD7297.2030606@opendreambox.org>
	<1303506946.4155.81.camel@mattotaupa>
To: Paul Menzel <paulepanter@users.sourceforge.net>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] [PATCH 2/2] pkgconfig: add git version
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
X-List-Received-Date: Fri, 22 Apr 2011 21:29:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 apr 2011, om 23:15 heeft Paul Menzel het volgende geschreven:

> Am Dienstag, den 19.04.2011, 13:31 +0200 schrieb Andreas Oberritter:
>> On 04/18/2011 03:50 PM, Paul Menzel wrote:
>>> Date: Sun, 17 Apr 2011 19:19:58 +0200
>>>=20
>>> 1. The revision is close to the upcoming release of pkg-config 0.26. =
[1]
>>> 2. The patch `sysrootfix.patch` has been merged upstream [2].
>>> 3. No embedded GLib is shipped anymore [3]. Therefore drop patches =
`autofoo.patch` and `glibconfig-sysdefs.h`.
>>>=20
>>> The patch is tested using the following configuration
>>>=20
>>> 	Build Configuration:
>>> 	BB_VERSION        =3D "1.12.0"
>>> 	METADATA_BRANCH   =3D "pkg-config"
>>> 	METADATA_REVISION =3D "d4ae0c5"
>>> 	TARGET_ARCH       =3D "arm"
>>> 	TARGET_OS         =3D "linux-uclibceabi"
>>> 	MACHINE           =3D "beagleboard"
>>> 	DISTRO            =3D "minimal-uclibc"
>>> 	DISTRO_VERSION    =3D "dev-snapshot-20110417"
>>> 	TARGET_FPU        =3D "hard"
>>>=20
>>> and `angstrom-2010.x` and `minimal` too.
>>>=20
>>> [1] =
http://lists.freedesktop.org/archives/pkg-config/2011-April/000720.html
>>> [2] =
http://cgit.freedesktop.org/pkg-config/commit/?id=3D66d49f1375fec838bcd301=
bb4ca2ef76cee0e47c
>>> [3] =
http://cgit.freedesktop.org/pkg-config/commit/?id=3D99964eddb5935173fcedfc=
793e762d7dc7d01bba
>>>=20
>>> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>>> ---
>>> 1. How can this recipe used also for the native recipe?
>>> 2. What is `pkg-config-sdk` used for?
>>> ---
>>> recipes/pkgconfig/pkgconfig_git.bb |   12 ++++++++++++
>>> 1 files changed, 12 insertions(+), 0 deletions(-)
>>> create mode 100644 recipes/pkgconfig/pkgconfig_git.bb
>>>=20
>>> diff --git a/recipes/pkgconfig/pkgconfig_git.bb =
b/recipes/pkgconfig/pkgconfig_git.bb
>>> new file mode 100644
>>> index 0000000..9c6d7d1
>>> --- /dev/null
>>> +++ b/recipes/pkgconfig/pkgconfig_git.bb
>>> @@ -0,0 +1,12 @@
>>> +require ${PN}.inc
>>> +
>>> +PR =3D "${INC_PR}.0"
>>> +
>>> +SRCREV =3D "7850aeb03a54a15d07b6c243b61033cd379c39d7"
>>> +SRC_URI =3D "git://anongit.freedesktop.org/pkg-config;protocol=3Dgit"=

>>> +
>>> +PV =3D "0.26"
>>> +PR =3D "${INC_PR}.0"
>>> +PR_append =3D "+gitr${SRCPV}"
>>=20
>> Usually, SRCPV is used in PV, not PR. Also, I'd prefer not using 0.26
>> for a pre-release snapshot, to make a future update to the released
>> version work. How about using one of
>>=20
>> PV =3D "0.25+gitr${SRCPV}"
>>=20
>> or
>>=20
>> PV =3D "0.25.999+gitr${SRCPV}"
>>=20
>> instead, and removing the PR_append line?
>=20
> Your suggestion is documented in the user manual [1], but Koen advised
> to use `PR_append` to keep the hash out of `PV` [2].
>=20
> Would I get an Acked-by changing the line to the following?
>=20
> 	PV =3D "0.25+0.26"

You would from me=


