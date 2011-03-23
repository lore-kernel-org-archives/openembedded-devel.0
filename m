Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Q2Le5-0002xQ-Db
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 11:50:33 +0100
Received: (qmail invoked by alias); 23 Mar 2011 10:27:55 -0000
Received: from mail2.zera.de (EHLO localhost.localdomain) [62.225.102.139]
	by mail.gmx.net (mp005) with SMTP; 23 Mar 2011 11:27:55 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+jOkNdRmGjXtJeuaPS34bEKNb+ode5CwtwV/nUvF
	QrkqxNdE3pT/9m
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2011 11:19:49 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1299591298.3785.126.camel@mattotaupa>
	<201103230935.01227.schnitzeltony@gmx.de>
	<1300873918.4101.4.camel@mattotaupa>
In-Reply-To: <1300873918.4101.4.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201103231119.49415.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Wed, 23 Mar 2011 10:50:33 -0000
X-Groupsio-MsgNum: 30544
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_FlciNWHq+XuUsxH"

--Boundary-00=_FlciNWHq+XuUsxH
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 23 March 2011 10:51:58 Paul Menzel wrote:
> Am Mittwoch, den 23.03.2011, 09:35 +0100 schrieb Andreas Mueller:
> > On Wednesday 23 March 2011 08:14:22 Koen Kooi wrote:
> > > On 23-03-11 01:33, Andreas Mueller wrote:
> [=E2=80=A6]
>=20
> > > > Since xfce4.6 means huge rebuild for me (and I did only pick up what
> > > > Khem suggested): Can anybody test this for xfce_session_4.6.{1, 2}
> > > > and create the patches?
> > >=20
> > > Could you send me the patch to get the native recipe for Xfce 4.8?
> >=20
> > Sorry - but what do you mean with *native* recipe for Xfce 4.8?
>=20
> You wrote that you had adapted/extended(?) `xfce-session_4.8.*.bb` to
> build a native package(?) (sorry). So I wanted to just see your
> `xfce-session_.4.8.*.bb` to know what to do.
Oh I see - sorry for causing confusion: I added native support for iceauth.

With the recipes attached I get=20
=2D iceauth installed on target image=20
=2D xfce4-session not complaining about missing iceauth

Still have no idea why iceauth was not found in target image...

Andreas

--Boundary-00=_FlciNWHq+XuUsxH
Content-Type: text/plain;
  charset="UTF-8";
  name="iceauth_1.0.4.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="iceauth_1.0.4.bb"

require xorg-app-common.inc
DESCRIPTION = "a tool for manipulating ICE protocol authorization records"
DEPENDS += " libice"
PE = "1"
PR = "${INC_PR}.1"

BBCLASSEXTEND="native"

SRC_URI[archive.md5sum] = "bb2e4d2611047f7c5a1a82ec956a9de4"
SRC_URI[archive.sha256sum] = "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"

--Boundary-00=_FlciNWHq+XuUsxH
Content-Type: text/plain;
  charset="UTF-8";
  name="xfce4-session_4.8.1.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="xfce4-session_4.8.1.bb"

DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
DEPENDS = "libwnck libxfce4ui libxfce4util dbus iceauth-native xfce-utils"
RDEPENDS_${PN} = "iceauth xinit dbus-x11"
SECTION = "x11"

PR = "r0"

inherit xfce46

EXTRA_OECONF += "ac_cv_path_ICEAUTH=${bindir}/iceauth"

FILES_${PN} += "${libdir}/xfce4/*/*"
FILES_${PN} += "${datadir}/xfce4/*/*"
FILES_${PN} += "${datadir}/themes/Default/balou/*"

FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"

SRC_URI[md5sum] = "478080ff666fdd36786a243829663efd"
SRC_URI[sha256sum] = "1df52a77d87ed4d27b4f40a2f03a0b6334422d64bdc4e31b9aac22e25e68b829"

--Boundary-00=_FlciNWHq+XuUsxH--
