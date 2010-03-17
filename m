Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NrrsX-00050N-Im
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 12:57:47 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 17 Mar 2010 12:54:16 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 17 Mar 2010 12:54:15 +0100
Received: from jcn ([87.3.28.9]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Wed, 17 Mar 2010 12:54:14 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NrrpF-0007Iu-Bs; Wed, 17 Mar 2010 12:54:13 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Mar 2010 12:54:11 +0100
Message-Id: <1268826851-28042-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <20100314083146.GA7866@mail.ceegeebee.com>
References: <20100314083146.GA7866@mail.ceegeebee.com>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 17 Mar 2010 11:54:15.0030 (UTC)
	FILETIME=[90FFE160:01CAC5C8]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Make gnutls depend on gtk-doc.
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
X-List-Received-Date: Wed, 17 Mar 2010 11:57:48 -0000

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

Depending on gtk-doc fixes this and makes the recipe build fine.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
Please tell me if I need to increase recipe versions when making changes to
.inc files.

Thanks,
   Antonio Ospite
   http://ao2.it

 recipes/gnutls/gnutls.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
index 60f7d33..ac56bfa 100644
--- a/recipes/gnutls/gnutls.inc
+++ b/recipes/gnutls/gnutls.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
-DEPENDS = "zlib libgcrypt lzo guile-native gettext"
+DEPENDS = "zlib libgcrypt lzo guile-native gettext gtk-doc"
 LICENSE = "LGPL"
 
 SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=gnutls"
-- 
1.7.0



