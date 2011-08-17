Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtZIA-0003Da-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 08:07:54 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	08:03:16 +0200
Date: Wed, 17 Aug 2011 08:03:27 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110817060327.GB7904@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1313501855.git.anders@chargestorm.se>
	<b2a661498def56a184f05a3c7cde1528aa1b0e8d.1313501855.git.anders@chargestorm.se>
	<j2e2od$g94$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j2e2od$g94$1@dough.gmane.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH 1/1] connman: conditionally enable wifi and bluetooth
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
X-List-Received-Date: Wed, 17 Aug 2011 06:07:54 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Koen Kooi <koen@dominion.thruhere.net> [110816 17:36]:
> Op 16-08-11 15:38, Anders Darander schreef:
> > Use DISTRO_FEATURES to conditionally depend and enable wifi and bluetoo=
th.
> >=20
> > Signed-off-by: Anders Darander <anders@chargestorm.se> --- meta-oe/reci=
pes-connectivity/connman/connman.inc   |    7 ++++++- .../recipes-connectiv=
ity/connman/connman_0.76.bb   |    4 ++-- 2 files changed, 8 insertions(+),=
 3 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe=
/recipes-connectivity/connman/connman.inc index 2652125..284edd2 100644 ---=
 a/meta-oe/recipes-connectivity/connman/connman.inc +++ b/meta-oe/recipes-c=
onnectivity/connman/connman.inc @@ -14,7 +14,12 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \ file://src/mai=
n.c;beginline=3D1;endline=3D20;md5=3D4b55b550fa6b33cc2055ef30dd262b3e"
> >=20
> > # we need to define the depends here, the dynamic stuff is too late -DE=
PENDS  =3D "wpa-supplicant dbus glib-2.0 ppp busybox dhcp resolvconf bluez4=
 iptables gnutls ntp" +BLUEZDEPENDS =3D "bluez4" +WIFIDEPENDS =3D "wpa-supp=
licant" +DEPENDS  =3D "dbus glib-2.0 ppp busybox dhcp resolvconf iptables g=
nutls ntp
> > \ +            ${@base_contains('DISTRO_FEATURES', 'bluetooth','${BLUEZ=
DEPENDS}', '', d)} \ +            ${@base_contains('DISTRO_FEATURES', 'wifi=
','${WIFIDEPENDS}', '', d)} \

> Are those helper vars really needed?


No, they're not strictly needed. I'll submit a new patch version without
them.

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Laxholmstorget 3	Email: anders@chargestorm.se
602 21 Norrk=F6ping	Web: www.chargestorm.se


