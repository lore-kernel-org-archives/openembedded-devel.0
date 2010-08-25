Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoDme-00007E-VS
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 13:04:58 +0200
Received: by eyb7 with SMTP id 7so138259eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=VNNDQzBthnc7mJ+EbkaC+mcpMV1p42S75u8OWEdjWeA=;
	b=wOM/MbeuT4Yw6/EaRfPpkUJyN2UWsrvJrLVJBRkQ1AMNWA/j6iQXRU6W8ZoloVBQEw
	m+d5SCQ6ufSHdckvP1SUSJSjlV0kWOkWtEPw+mU6xH6ED3iEBnzFknRy04EcTr5C2tZ+
	liRv9vJEmFjEVaK7+YTHPNk3eeNivvIAqpFwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=pqMoFRXuec4HcGXijkyU0wtlqOyPPeKpupWNVBowAxy2UV153vwf+ze1TUlGHeZFtY
	TAG8X/3Bk+gV4jg159tXOEe4FfEp2vZk8gUSDIKD/HeObLv8fkDT2JZ95aI13Ckhy8f/
	0dkxiFmSIucAiNaGnXkOWLi+uWMF7f5C+5+gw=
MIME-Version: 1.0
Received: by 10.213.29.137 with SMTP id q9mr5511428ebc.11.1282734255499; Wed,
	25 Aug 2010 04:04:15 -0700 (PDT)
Received: by 10.14.6.75 with HTTP; Wed, 25 Aug 2010 04:04:15 -0700 (PDT)
Date: Wed, 25 Aug 2010 17:04:15 +0600
Message-ID: <AANLkTinTAbx5g2SOB8dGjyPbSGOJCAoeD6YCf2=MUa+F@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sysvinit_2.86.bb: change sysvinit-utils for compatible with upstart
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
X-List-Received-Date: Wed, 25 Aug 2010 11:04:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Anatoly Shipitsin <norguhtar@gmail.com>

* move shutdown to sysvinit package
* move killall5 to sysvinit-utils
* change PR =3D "r59"

Signed-off-by:=C2=A0Anatoly Shipitsin <norguhtar@gmail.com>

---
recipes/sysvinit/sysvinit_2.86.bb | =C2=A0 =C2=A08 ++++----
=C2=A01 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/sysvinit/sysvinit_2.86.bb
b/recipes/sysvinit/sysvinit_2.86.bb
index 40c642a..aca5249 100644
--- a/recipes/sysvinit/sysvinit_2.86.bb
+++ b/recipes/sysvinit/sysvinit_2.86.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "System-V like init."
=C2=A0SECTION =3D "base"
=C2=A0LICENSE =3D "GPLv2+"
=C2=A0HOMEPAGE =3D "http://freshmeat.net/projects/sysvinit/"
-PR =3D "r58"
+PR =3D "r59"

=C2=A0# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .con=
f.
=C2=A0# Set PACKAGE_ARCH appropriately.
@@ -42,7 +42,7 @@ PACKAGES =3D+ "sysvinit-utils sysvinit-pidof sysvinit-sul=
ogin"
=C2=A0FILES_${PN} +=3D "${base_sbindir}/* ${base_bindir}/*"
=C2=A0FILES_sysvinit-pidof =3D "${base_bindir}/pidof.sysvinit"
=C2=A0FILES_sysvinit-sulogin =3D "${base_sbindir}/sulogin"
-FILES_sysvinit-utils =3D "${bindir}/last.${PN} ${bindir}/mesg.${PN}
${bindir}/wall.${PN} ${base_sbindir}/shutdown.${PN} ${bindir}/lastb
${bindir}/utmpdump ${base_sbindir}/runlevel"
+FILES_sysvinit-utils =3D "${bindir}/last.${PN} ${bindir}/mesg.${PN}
${bindir}/wall.${PN} ${bindir}/lastb ${bindir}/utmpdump
${base_sbindir}/killall5"
=C2=A0RRECOMMENDS_${PN} =3D "sysvinit-utils"
=C2=A0RRECOMMENDS_${PN}_micro =3D ""

@@ -112,6 +112,7 @@ pkg_postinst_${PN} () {
=C2=A0update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 20=
0
=C2=A0update-alternatives --install ${base_sbindir}/reboot reboot reboot.${=
PN} 200
=C2=A0update-alternatives --install ${base_sbindir}/poweroff poweroff
poweroff.${PN} 200
+update-alternatives --install ${base_sbindir}/shutdown shutdown
shutdown.${PN} 200
=C2=A0}

=C2=A0pkg_postinst_sysvinit-utils () {
@@ -119,13 +120,13 @@ pkg_postinst_sysvinit-utils () {
=C2=A0update-alternatives --install ${bindir}/last last last.${PN} 200
=C2=A0update-alternatives --install ${bindir}/mesg mesg mesg.${PN} 200
=C2=A0update-alternatives --install ${bindir}/wall wall wall.${PN} 200
-update-alternatives --install ${base_sbindir}/shutdown shutdown
shutdown.${PN} 200
=C2=A0}

=C2=A0pkg_prerm_${PN} () {
=C2=A0#!/bin/sh
=C2=A0update-alternatives --remove halt halt.${PN}
=C2=A0update-alternatives --remove reboot reboot.${PN}
+update-alternatives --remove shutdown shutdown.${PN}
=C2=A0}

=C2=A0pkg_prerm_sysvinit-utils () {
@@ -133,7 +134,6 @@ pkg_prerm_sysvinit-utils () {
=C2=A0update-alternatives --remove last last.${PN}
=C2=A0update-alternatives --remove mesg mesg.${PN}
=C2=A0update-alternatives --remove wall wall.${PN}
-update-alternatives --remove shutdown shutdown.${PN}
=C2=A0}

=C2=A0pkg_postinst_sysvinit-pidof () {


