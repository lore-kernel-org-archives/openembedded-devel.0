Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PN22V-0003mu-AA
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 12:37:00 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.12.11.20060308/8.12.11) with ESMTP id oATBZdbP027417
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 12:35:39 +0100
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id oATBZdSI020132
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 12:35:39 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.7]) by
	DEMCHP99ET0MSX.ww902.siemens.net ([139.25.131.181]) with mapi;
	Mon, 29 Nov 2010 12:35:39 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Nov 2010 12:35:38 +0100
Thread-Topic: [oe] [PATCH] qte: fixed do_configure() for powercpc
Thread-Index: AcuPsX3AG0H5u7bJRhyqtBAhD5Kb8wAB4Bug
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D61C@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D34C@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3B1D5D0@DEMCHP99E35MSX.ww902.siemens.net>
	<4CF38257.3040406@eukrea.com>
In-Reply-To: <4CF38257.3040406@eukrea.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.35.17.2
X-SA-Exim-Mail-From: Fabrice.Aeschbacher@siemens.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=5.0 tests=AWL, BAYES_00,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qte: fixed do_configure() for powercpc
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
X-List-Received-Date: Mon, 29 Nov 2010 11:37:00 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Here is my 'git format-patch' again, after having run 'git rebase master'

With kind regards,
  Fabrice


Signed-off-by: Aeschbacher <fabrice.aeschbacher@siemens.com>
---
 recipes/qte/qte-common_2.3.10.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/qte/qte-common_2.3.10.inc b/recipes/qte/qte-common_2.3=
.10.inc
index 18811c7..2eed76d 100644
--- a/recipes/qte/qte-common_2.3.10.inc
+++ b/recipes/qte/qte-common_2.3.10.inc
@@ -109,7 +109,7 @@ export SYSCONF_LFLAGS =3D "${LDFLAGS} -lts"
 export SYSCONF_MOC =3D "${STAGING_BINDIR_NATIVE}/moc"
 export SYSCONF_UIC =3D "${STAGING_BINDIR_NATIVE}/uic"
=20
-# generate uclibc and eabi configurations
+# generate uclibc, eabi and powerpc configurations
 do_configure() {
        for f in ${S}/configs/linux-*-g++-shared; do
                sed -e 's,-linux-,-linux-uclibc-,g' < $f \
@@ -119,6 +119,7 @@ do_configure() {
                sed -e 's,-linux-,-linux-uclibceabi-,g' < $f \
                        > `dirname $f`/`basename $f | sed -e 's,linux-,linu=
x-uclibceabi-,'`
        done
+       sed -e 's/arm/powerpc/'  ${S}/configs/linux-arm-g++-shared > ${S}/c=
onfigs/linux-powerpc-g++-shared
        echo yes | ./configure ${EXTRA_OECONF} || die "Configuring qte fail=
ed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
=20
--=20
1.5.6.5



> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Eric B=E9nard
> Gesendet: Montag, 29. November 2010 11:37
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] [PATCH] qte: fixed do_configure() for powercpc
>=20
> Hi,
>=20
> On 29/11/2010 11:19, Aeschbacher, Fabrice wrote:
> > Is this patch likely to be accepted and commited soon in=20
> branch release-2010.12, or should I overlay?
> >
> the patch doesn't apply can you please rebase it against master ?
>=20
> Applying: qte: fixed do_configure() for powercpc
> error: patch failed: recipes/qte/qte-common_2.3.10.inc:109
> error: recipes/qte/qte-common_2.3.10.inc: patch does not apply
> Patch failed at 0001 qte: fixed do_configure() for powercpc
>=20
> Eric
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> =


