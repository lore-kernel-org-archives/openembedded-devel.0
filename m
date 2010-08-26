Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Ookb0-0002wo-Gc
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:06:56 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 139072DF7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 23:29:36 +0200 (CEST)
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 0C0674B0045
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 23:29:32 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Aug 2010 23:29:29 +0200
Message-Id: <1282858170-31241-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] postgresql-8.1.8 : fix configure
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
X-List-Received-Date: Thu, 26 Aug 2010 22:06:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

without this patch, using angstrom 2010.x on armv6 I actually get :
| checking alignment of short... configure: error:
                       cannot compute alignment of short, 77
| ERROR: Function do_configure failed
NOTE: package postgresql-8.1.8-r4: task do_configure: Failed

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 site/arm-common |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/site/arm-common b/site/arm-common
index 20de8c5..1554c8f 100644
--- a/site/arm-common
+++ b/site/arm-common
@@ -166,6 +166,13 @@ ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
 php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_func=
tions_use_off64_t=3Dyes}
 cv_php_mbstring_stdarg=3D${cv_php_mbstring_stdarg=3Dyes}
=20
+# postgresql
+pgac_cv_alignof_short=3D2
+pgac_cv_alignof_int=3D4
+pgac_cv_alignof_long=3D4
+pgac_cv_alignof_long_long_int=3D8
+pgac_cv_alignof_double=3D8
+
 # rsync
 rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno}
 rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
--=20
1.6.3.3



