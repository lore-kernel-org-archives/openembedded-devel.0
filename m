Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IooJ2-00057D-O0
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Nov 2007 23:51:00 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 8A57D28C013; Sun,  4 Nov 2007 23:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180186223.adsl.alicedsl.de [85.180.186.223])
	by srv043.dedi23.de (Postfix) with ESMTP id B31E128C012
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Nov 2007 23:44:40 +0100 (CET)
Date: Sun, 4 Nov 2007 23:50:18 +0100
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.24) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <31612875.20071104235018@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200711042303.04292.openembedded@haerwu.biz>
References: <E1Ioitd-00024s-TQ@linuxtogo.org>
	<200711042303.04292.openembedded@haerwu.biz>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev neod: add dependency to dbus-1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Nov 2007 22:51:01 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz wrote:
> Dnia niedziela, 4 listopada 2007, mickeyl commit napisa=B3:

>> neod: add dependency to dbus-1
>>
>> Author: mickeyl@openembedded.org
>> Branch: org.openembedded.dev
>> Revision: dfbec4dce18c3885b36210c05ed69759ab6bf5b6

>> packages/openmoko2/neod_svn.bb        6cc80a4570dfd74c4eefe208b331a5b8c8=
d049af
>> packages/openmoko2/neod_svn.bb        92a5e00ba437275e36002f64963caa7aab=
304a17
>> @@ -1,7 +1,7 @@ DEPENDS =3D "gtk+ pulseaudio"
>>  DESCRIPTION =3D "Simple Neo1973 Daemon for Button Handling and Power=20
>>  Management" =20
>>  SECTION =3D "openmoko/daemons"=20
>>  DEPENDS =3D "gtk+ pulseaudio"
>> -RDEPENDS =3D "gpe-scap xrandr alsa-utils-amixer apm"
>> +RDEPENDS =3D "gpe-scap xrandr alsa-utils-amixer apm dbus-1"

> Why such rdependency? If it does not use dbus libraries then it does not
> need it. If it use them then it gets linked to it.

Please look into the source, before making too fast assumptions. neod
calls dbus-send which is part of dbus. No linking, but calling at
runtime -- same as for xrandr, gpe-scap, and alsactl.

Regards,

:M:
--=20
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



