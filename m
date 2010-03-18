Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NsMQh-00018i-3f
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 21:35:00 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Mar 2010 21:31:49 +0100
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Mar 2010 21:31:49 +0100
Received: from jcn ([82.57.79.31]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 18 Mar 2010 21:31:48 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NsMNf-0003Vb-Rk; Thu, 18 Mar 2010 21:31:47 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Mar 2010 21:31:44 +0100
Message-Id: <1268944304-13459-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1268826851-28042-1-git-send-email-ospite@studenti.unina.it>
References: <1268826851-28042-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 18 Mar 2010 20:31:49.0089 (UTC)
	FILETIME=[0912FD10:01CAC6DA]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] gnutls: fix do_configure by depending on gtk-doc
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
X-List-Received-Date: Thu, 18 Mar 2010 20:35:00 -0000

building gnutls_2.8.5.bb fails in do_configure with these messages:

[..]
| automake: unknown warning category `cross'
| doc/Makefile.am:27: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| gtk-doc.make:7: GTK_DOC_USE_LIBTOOL does not appear in AM_CONDITIONAL
| doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
| gtk-doc.make:50: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
| gtk-doc.make:173: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
| doc/reference/Makefile.am:147: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: Task failed: /home/chris/oe/micro-dev/work/i686-oe-linux/gnutls-2.8.5-r0/temp/log.do_configure.14113
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/chris/oe/openembedded.org/recipes/gnutls/gnutls_2.8.5.bb do_configure failed
ERROR: Task 652 (/home/chris/oe/openembedded.org/recipes/gnutls/gnutls_2.8.5.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 865 tasks of which 0 didn't need to be rerun and 1 failed.
ERROR: '/home/chris/oe/openembedded.org/recipes/gnutls/gnutls_2.8.5.bb' failed

Depending on gtk-doc fixes this.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---

Changes since v1:
 * better short commit message
 * increased INC_PR

Thanks,
   Antonio Ospite
   http://ao2.it

 recipes/gnutls/gnutls.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
index 60f7d33..ccf6f69 100644
--- a/recipes/gnutls/gnutls.inc
+++ b/recipes/gnutls/gnutls.inc
@@ -1,13 +1,13 @@
 DESCRIPTION = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
-DEPENDS = "zlib libgcrypt lzo guile-native gettext"
+DEPENDS = "zlib libgcrypt lzo guile-native gettext gtk-doc"
 LICENSE = "LGPL"
 
 SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=gnutls"
 
 inherit autotools binconfig pkgconfig
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 EXTRA_OECONF = "--with-included-opencdk --with-included-libtasn1"
 
-- 
1.7.0



