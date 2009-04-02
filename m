Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpMUW-0001Kp-Jq
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 14:58:22 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 09D33189362; Thu,  2 Apr 2009 14:58:02 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 14:58:02 +0200
Message-Id: <1238677082-16558-1-git-send-email-k.kooi@student.utwente.nl>
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
Subject: [STABLE][PATCH] procps: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Thu, 02 Apr 2009 12:58:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/procps/procps_3.2.7.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/procps/procps_3.2.7.bb b/recipes/procps/procps_3.2.7=
.bb
index 689fc33..6da975a 100644
--- a/recipes/procps/procps_3.2.7.bb
+++ b/recipes/procps/procps_3.2.7.bb
@@ -1,6 +1,6 @@
 require procps.inc
=20
-PR =3D "r7"
+PR =3D "r8"
=20
 inherit update-rc.d
=20
@@ -22,8 +22,8 @@ FILES =3D "${bindir}/top.${PN} ${base_bindir}/ps.${PN} =
${bindir}/uptime.${PN} ${ba
 CONFFILES_${PN} =3D "${sysconfdir}/sysctl.conf"
=20
 EXTRA_OEMAKE =3D "CFLAGS=3D-I${STAGING_INCDIR} \
-		CPPFLAGS=3D-I${STAGING_INCDIR} \
-                LDFLAGS=3D-L${STAGING_LIBDIR} -Wl,--rpath-link,${STAGING=
_LIBDIR} \
+                CPPFLAGS=3D-I${STAGING_INCDIR} \
+                LDFLAGS=3D"${LDFLAGS}" \
                 CURSES=3D-lncurses \
                 install=3D'install -D' \
                 ldconfig=3Decho"
--=20
1.5.6.5



