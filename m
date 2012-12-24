Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tn7QS-0006Ot-N5
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 13:46:48 +0100
Received: from mail436.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 0B04BDC3366
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 13:35:22 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Dec 2012 14:27:02 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 24 Dec 2012 14:27:01 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Mon, 24 Dec 2012 13:26:47 +0100
Message-Id: <1356352009-30859-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5338172934318828873
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhephffvufffkffogggtgfesthekredtredtje
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhephffvufffkffogggtgfesthekredtredtje
Cc: koen@dominion.thruhere.net,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][PATCH for denzil 1/3] systemd: move _git to _v189
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
X-List-Received-Date: Mon, 24 Dec 2012 12:47:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-core/systemd/{systemd =3D> systemd-v189}/gtk-doc.make    |  =
  0
 .../recipes-core/systemd/{systemd =3D> systemd-v189}/modprobe.rules  |  =
  0
 .../systemd-pam-configure-check-uclibc.patch                       |    =
0
 .../{systemd =3D> systemd-v189}/systemd-pam-fix-execvpe.patch        |  =
  0
 .../{systemd =3D> systemd-v189}/systemd-pam-fix-fallocate.patch      |  =
  0
 .../{systemd =3D> systemd-v189}/systemd-pam-fix-getty-unit.patch     |  =
  0
 .../{systemd =3D> systemd-v189}/systemd-pam-fix-mkostemp.patch       |  =
  0
 .../{systemd =3D> systemd-v189}/systemd-pam-fix-msformat.patch       |  =
  0
 .../systemd/{systemd =3D> systemd-v189}/touchscreen.rules            |  =
  0
 .../systemd/{systemd =3D> systemd-v189}/use-rootlibdir.patch         |  =
  0
 meta-oe/recipes-core/systemd/systemd-v189/var-run.conf             |    =
4 ++++
 meta-oe/recipes-core/systemd/{systemd_git.bb =3D> systemd_v189.bb}   |  =
  4 ----
 12 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/gtk-doc.=
make (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/modprobe=
.rules (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/systemd-=
pam-configure-check-uclibc.patch (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/systemd-=
pam-fix-execvpe.patch (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/systemd-=
pam-fix-fallocate.patch (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/systemd-=
pam-fix-getty-unit.patch (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/systemd-=
pam-fix-mkostemp.patch (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/systemd-=
pam-fix-msformat.patch (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/touchscr=
een.rules (100%)
 rename meta-oe/recipes-core/systemd/{systemd =3D> systemd-v189}/use-root=
libdir.patch (100%)
 create mode 100644 meta-oe/recipes-core/systemd/systemd-v189/var-run.con=
f
 rename meta-oe/recipes-core/systemd/{systemd_git.bb =3D> systemd_v189.bb=
} (99%)

diff --git a/meta-oe/recipes-core/systemd/systemd/gtk-doc.make b/meta-oe/=
recipes-core/systemd/systemd-v189/gtk-doc.make
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/gtk-doc.make
rename to meta-oe/recipes-core/systemd/systemd-v189/gtk-doc.make
diff --git a/meta-oe/recipes-core/systemd/systemd/modprobe.rules b/meta-o=
e/recipes-core/systemd/systemd-v189/modprobe.rules
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/modprobe.rules
rename to meta-oe/recipes-core/systemd/systemd-v189/modprobe.rules
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-c=
heck-uclibc.patch b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam=
-configure-check-uclibc.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-ch=
eck-uclibc.patch
rename to meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-configure=
-check-uclibc.patch
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe=
.patch b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-execvp=
e.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.=
patch
rename to meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-execv=
pe.patch
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-falloca=
te.patch b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-fall=
ocate.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocat=
e.patch
rename to meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-fallo=
cate.patch
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-u=
nit.patch b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-get=
ty-unit.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-un=
it.patch
rename to meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-getty=
-unit.patch
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostem=
p.patch b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-mkost=
emp.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp=
.patch
rename to meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-mkost=
emp.patch
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msforma=
t.patch b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-msfor=
mat.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat=
.patch
rename to meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-msfor=
mat.patch
diff --git a/meta-oe/recipes-core/systemd/systemd/touchscreen.rules b/met=
a-oe/recipes-core/systemd/systemd-v189/touchscreen.rules
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/touchscreen.rules
rename to meta-oe/recipes-core/systemd/systemd-v189/touchscreen.rules
diff --git a/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch b/=
meta-oe/recipes-core/systemd/systemd-v189/use-rootlibdir.patch
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
rename to meta-oe/recipes-core/systemd/systemd-v189/use-rootlibdir.patch
diff --git a/meta-oe/recipes-core/systemd/systemd-v189/var-run.conf b/met=
a-oe/recipes-core/systemd/systemd-v189/var-run.conf
new file mode 100644
index 0000000..c2c18e2
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd-v189/var-run.conf
@@ -0,0 +1,4 @@
+# empty /var/run
+R	/var/run/*	-	-	-	-	-
+# systemd-update-utmp-runlevel.service fails to start without this
+f /var/run/utmp 0644 root root - -
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipe=
s-core/systemd/systemd_v189.bb
similarity index 99%
rename from meta-oe/recipes-core/systemd/systemd_git.bb
rename to meta-oe/recipes-core/systemd/systemd_v189.bb
index 712ec79..613f703 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_v189.bb
@@ -15,10 +15,6 @@ SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0"
=20
 SECTION =3D "base/shell"
=20
-inherit gitpkgv
-PKGV =3D "v${GITPKGVTAG}"
-
-PV =3D "git"
 PR =3D "r6"
=20
 inherit useradd pkgconfig autotools perlnative
--=20
1.7.10.4



