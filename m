Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpMUX-0001Kw-DK
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 14:58:17 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id F2E23189369; Thu,  2 Apr 2009 14:58:02 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 14:58:02 +0200
Message-Id: <1238677082-16805-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>,
	=?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] ncurses: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Thu, 02 Apr 2009 12:58:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/ncurses/ncurses/use_ldflags.patch |   12 ++++++++++++
 recipes/ncurses/ncurses_5.4.bb            |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/ncurses/ncurses/use_ldflags.patch

diff --git a/recipes/ncurses/ncurses/use_ldflags.patch b/recipes/ncurses/=
ncurses/use_ldflags.patch
new file mode 100644
index 0000000..e04f1e5
--- /dev/null
+++ b/recipes/ncurses/ncurses/use_ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN ncurses-5.4.orig/mk-1st.awk ncurses-5.4/mk-1st.awk
+--- ncurses-5.4.orig/mk-1st.awk	2004-01-10 20:48:43.000000000 +0000
++++ ncurses-5.4/mk-1st.awk	2009-04-02 10:23:04.000000000 +0000
+@@ -287,7 +287,7 @@
+ 				}
+ 				end_name =3D lib_name;
+ 				printf "../lib/%s : $(%s_OBJS)\n", lib_name, OBJS
+-				printf "\tcd ../lib && $(LIBTOOL_LINK) $(%s) -o %s $(%s_OBJS:$o=3D.=
lo) -rpath $(DESTDIR)$(libdir) -version-info $(NCURSES_MAJOR):$(NCURSES_M=
INOR) $(SHLIB_LIST)\n", compile, lib_name, OBJS
++				printf "\tcd ../lib && $(LIBTOOL_LINK) $(%s) $(LDFLAGS) -o %s $(%s_=
OBJS:$o=3D.lo) -rpath $(DESTDIR)$(libdir) -version-info $(NCURSES_MAJOR):=
$(NCURSES_MINOR) $(SHLIB_LIST)\n", compile, lib_name, OBJS
+ 				print  ""
+ 				print  "install \\"
+ 				print  "install.libs \\"
diff --git a/recipes/ncurses/ncurses_5.4.bb b/recipes/ncurses/ncurses_5.4=
.bb
index 5607614..eb798df 100644
--- a/recipes/ncurses/ncurses_5.4.bb
+++ b/recipes/ncurses/ncurses_5.4.bb
@@ -1,7 +1,8 @@
-PR =3D "r18"
+PR =3D "r19"
=20
 SRC_URI =3D "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz \
            file://makefile_tweak.patch;patch=3D1 \
+           file://use_ldflags.patch;patch=3D1 \
            file://visibility.patch;patch=3D1"
 S =3D "${WORKDIR}/ncurses-${PV}"
=20
--=20
1.5.6.5



