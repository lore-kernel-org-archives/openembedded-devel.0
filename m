Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 323 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 16 Jan 2016 14:46:37 UTC
Received: from smtp121.iad3a.emailsrvr.com (smtp121.iad3a.emailsrvr.com
	[173.203.187.121])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4C07318F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 14:46:37 +0000 (UTC)
Received: from smtp24.relay.iad3a.emailsrvr.com (localhost.localdomain
	[127.0.0.1])
	by smtp24.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	E204F1805C9 for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 09:41:12 -0500 (EST)
Received: from app26.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140])
	by smtp24.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	DA45D1805BB for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 09:41:12 -0500 (EST)
X-Sender-Id: scott@jumpnowtek.com
Received: from app26.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140]) by 0.0.0.0:25 (trex/5.5.4);
	Sat, 16 Jan 2016 09:41:12 -0500
Received: from jumpnowtek.com (localhost.localdomain [127.0.0.1])
	by app26.wa-webapps.iad3a (Postfix) with ESMTP id CC683380041
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 09:41:12 -0500 (EST)
Received: by apps.rackspace.com (Authenticated sender: scott@jumpnowtek.com,
	from: scott@jumpnowtek.com) 
	with HTTP; Sat, 16 Jan 2016 09:41:12 -0500 (EST)
Date: Sat, 16 Jan 2016 09:41:12 -0500 (EST)
From: "Scott Ellis" <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
X-Auth-ID: scott@jumpnowtek.com
Message-ID: <1452955272.835129245@apps.rackspace.com>
X-Mailer: webmail/11.6.10-RC
Subject: [PATCH] [coreutils]: Add xattr PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jan 2016 14:46:38 -0000
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From Yocto poky where it also stops this warning=0A=0AWARNING: QA Issue: co=
reutils rdepends on libattr, but it isn't a build dependency? [build-deps]=
=0A=0ASigned-off-by: Scott Ellis <scott@jumpnowtek.com>=0A---=0A meta/recip=
es-core/coreutils/coreutils_8.24.bb | 9 +++++++--=0A 1 file changed, 7 inse=
rtions(+), 2 deletions(-)=0A=0Adiff --git a/meta/recipes-core/coreutils/cor=
eutils_8.24.bb b/meta/recipes-core/coreutils/coreutils_8.24.bb=0Aindex f042=
346..6a09c59 100644=0A--- a/meta/recipes-core/coreutils/coreutils_8.24.bb=
=0A+++ b/meta/recipes-core/coreutils/coreutils_8.24.bb=0A@@ -28,14 +28,19 @=
@ SRC_URI[manpages.sha256sum] =3D "cf0333b5f134a331e0b46e2ddf90666f8bdc3281=
c1ca2c7cc=0A EXTRA_OECONF_class-native =3D "--without-gmp"=0A EXTRA_OECONF_=
class-target =3D "--enable-install-program=3Darch --libexecdir=3D${libdir}"=
=0A=0A-# acl is not a default feature=0A+# acl and xattr are not default fe=
atures=0A #=0A-PACKAGECONFIG_class-target ??=3D "${@bb.utils.contains('DIST=
RO_FEATURES', 'acl', 'acl', '', d)}"=0A+PACKAGECONFIG_class-target ??=3D "\=
=0A+    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \=0A+=
    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \=0A+=
"=0A+=0A PACKAGECONFIG_class-native ??=3D ""=0A=0A # with, without, depends=
, rdepends=0A #=0A PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"=
=0A+PACKAGECONFIG[xattr] =3D "--enable-xattr,--disable-xattr,attr,"=0A=0A #=
 [ df mktemp base64 gets a special treatment and is not included in this=0A=
 bindir_progs =3D "arch basename chcon cksum comm csplit cut dir dircolors =
dirname du \=0A--=0A2.5.0


