Received: from mail2.zera.de ([62.225.102.139])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.mueller@zera.de>) id 1NfJD2-0005BX-C9
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:30:55 +0100
Received: from s-zera-ex01.zera.local ([192.168.7.1]) by
	s-zera-ex01.zera.local ([192.168.7.1]) with mapi;
	Wed, 10 Feb 2010 21:26:58 +0100
From: =?iso-8859-1?Q?M=FCller=2C_Andreas?= <a.mueller@zera.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Feb 2010 21:26:56 +0100
Thread-Topic: xfwm4 themes from xfwm4-themes are not packed
Thread-Index: Acqqj2QGqQXu97fIS82SPRbJG8v0UA==
Message-ID: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.225.102.139
X-SA-Exim-Mail-From: a.mueller@zera.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: xfwm4 themes from xfwm4-themes are not packed
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
X-List-Received-Date: Wed, 10 Feb 2010 20:30:55 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hope this is the right adress for the current challenge I got:

I created a recipe for xfce/xfwm4/slim. After everything working fine so fa=
r, I tried to make it more colorful and check the xfwm4-themes. Doing so, I=
 had to realize that all the themes coming from xfwm4-themes(-4.6.0) are no=
t packed and are not found in rootfs /usr/share/themes. The themes included=
 in xfwm4 can be found.

My recipe contains (beside many other / tests without xfwm4-themes lead to =
same result):

#  *** THEMES FROM xfwm4 *** \
  xfwm4-theme-default \
  xfwm4-theme-kokodi \
#  *** THEMES FROM xfwm4-themes *** \
  xfwm4-themes \
  xfwm4-theme-adept \
  xfwm4-theme-agua \

The themes from xfwm4-themes seem to be built (but not packed) properly bec=
ause all of them appear in

'tmp/work/armv7a-angstrom-linux-gnueabi/xfwm4-themes-4.6.0-r2/image/usr/sha=
re/themes' and
'tmp/work/armv7a-angstrom-linux-gnueabi/xfwm4-themes-4.6.0-r2/staging-pkg/s=
taging/armv7a-angstrom-linux-gnueabi/usr/share/themes'

Since I got no helping information in the log files I tried bitbake with th=
e option '-v'.

This drops messages for all the 'xfwm4-theme*' recipes like

NOTE: multiple providers are available for runtime xfwm4-theme-default (xfw=
m4-themes, xfwm4);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime xfwm4-t=
heme-default
...
NOTE: multiple providers are available for runtime xfwm4-theme-kokodi (xfwm=
4-themes, xfwm4);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime xfwm4-t=
heme-kokodi
...
NOTE: multiple providers are available for runtime xfwm4-themes (xfwm4-them=
es, xfwm4);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime xfwm4-t=
hemes
...
NOTE: multiple providers are available for runtime xfwm4-theme-adept (xfwm4=
-themes, xfwm4);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime xfwm4-t=
heme-adept
...
NOTE: multiple providers are available for runtime xfwm4-theme-agua (xfwm4-=
themes, xfwm4);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime xfwm4-t=
heme-agua

I checked the recipes for xfwm4 and xfwm4-themes. Both contain

PACKAGES_DYNAMIC =3D "xfwm4-theme-*"

This lead me to the idea to add within my recipe
  xfwm4-theme-bullshit \
and BB did not complain (but I dont't know if this is related to the proble=
m)!

Is it possible that
1. BB only checks within xfwm4 for xfwm4-theme*?
2. 'themedir' within xfwm4-themes_4.6.0 links to the wrong path since both =
xfwm4 and xfwm4-themes have the same directory structure for themes?

I would be very pleased if somebody could help me on this issue because my =
knowledge-funds are not yet enough to fix this issue.

Mit freundlichen Gruessen / Best regards
i. A. Dipl-Ing. Andreas Mueller
Entwicklungsingenieur / R&D Engineer

Zera GmbH
Hauptstrasse 392
53639 Koenigwinter

Tel: +49 2223 704 - 233
Fax: +49 2223 704 - 235

mailto:a.mueller@zera.de
-----------------------------------------------

http://www.zera.de

ZERA  GmbH, Hauptstrasse 392, 53639 Koenigswinter
Geschaeftsfuehrer:  Dr. Prosper Suwelack, Rainer Otto
Sitz der Gesellschaft:  Koenigswinter; Handelsregister HRB  7073
Registergericht: Amtsgericht Siegburg.

-----------------------------------------------------------------


