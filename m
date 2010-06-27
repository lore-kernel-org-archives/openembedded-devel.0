Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSkfW-0006tT-Ud
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jun 2010 07:44:39 +0200
Received: by fxm7 with SMTP id 7so146921fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 22:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=fzDagSm42eMdT1nafTKRbv1nt75m202pCTKe2vzFCfU=;
	b=tfzJLSTz8ImVpFu0eofHNg9H4c7nyN3RTLrAPs2UKkmAiRoajTGYmGvXE71Sy8T0By
	nJhbSVMUhUt34uD4tVWZCyDSWUN37iEl7svXP1Za62J50W2DNPKlOj/5UNiBZ+fbHZUF
	pSUemjUXYEyhCt0xkJTdTJ5XbFn8yq3nrSyzw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=q+2ADn3NbUb/OHgNdspjjKG6jTkTdSnK+IsrnWLs4r2bfLxJw/33wY1PLhZBnvgnC2
	eQxLiCjknFCUBE5mJlyKB2KYsWx3DZJvY/b+y50IulJb12K/pyorgr3Y5t5ov4wBzwT3
	cI+j1B7sZCOgbrs/iy8pXotVqSiATxokiR1nc=
Received: by 10.223.63.17 with SMTP id z17mr2309097fah.66.1277617198262;
	Sat, 26 Jun 2010 22:39:58 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e11sm42070230fak.41.2010.06.26.22.39.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Jun 2010 22:39:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jun 2010 07:39:28 +0200
Message-Id: <1277617168-17482-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qt-4.7.0-beta1: upstream tarball was changed, regenerate checksums
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
X-List-Received-Date: Sun, 27 Jun 2010 05:44:39 -0000

* already applied (the change is ok, see diff)
* sending to list only as heads-up, you can remove old tarball from downloads 
  (otherwise next rebuild will complain about checksums - but INC_PR was bumped 
  yesterday so you should seen it soon).

* new qt-everywhere-opensource-src-4.7.0-beta1.tar.gz	183MB	6/15/10 5:38:00 AM
* Changed files:
diff -rq old new
Only in new: .LICENSE
Only in old: .LICENSE-ALLOS
Only in old: .LICENSE-ALLOS-US
Only in old: .LICENSE-DESKTOP
Only in old: .LICENSE-DESKTOP-US
Only in old: .LICENSE-EMBEDDED
Only in old: .LICENSE-EMBEDDED-US
Only in old: .LICENSE-EVALUATION
Only in old: .LICENSE-EVALUATION-US
Only in new: .LICENSE-US
Files old/.tag and new/.tag differ
Only in new: LICENSE.PREVIEW.COMMERCIAL
Files old/doc/html/debug.html and new/doc/html/debug.html differ
..many doc/html and doc/qch files..
Files old/doc/qch/qt.qch and new/doc/qch/qt.qch differ
Files old/src/corelib/global/qglobal.h and new/src/corelib/global/qglobal.h differ

diff old/src/corelib/global/qglobal.h new/src/corelib/global/qglobal.h
57c57
< #define QT_PACKAGEDATE_STR "2010-05-04"
---
> #define QT_PACKAGEDATE_STR "2010-06-15"

$ cat old/.tag  new/.tag
Source revision: 3101ccc6e6f53de04b24755a5d665c73196b1190
Mkdist revision: bc9761f44c0e587a11b452fd47ddd9f8a5bf88ee

Source revision: 3101ccc6e6f53de04b24755a5d665c73196b1190
Mkdist revision: b0ece13ac29b1dbccb692e343270ace51f5ca160

So the source is the same (except QT_PACKAGEDATE_STR), only docs were
regenerated and .LICENSE now shows TECHNOLOGY PREVIEW LICENSE AGREEMENT

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/qt4/qt-4.6.2+4.7.0-beta1.inc        |    4 ++--
 recipes/qt4/qt4-tools-native_4.7.0-beta1.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc b/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
index d2d196b..8ac9577 100644
--- a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
+++ b/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
@@ -69,5 +69,5 @@ do_install_append() {
 	done
 }
 
-SRC_URI[md5sum] = "128dae41b23bb427b735548c7864703a"
-SRC_URI[sha256sum] = "1107de986e4dda7795d094a2a3b5d85027d780b9b63e9860957cb1d6c56c8929"
+SRC_URI[md5sum] = "1a863712da64dd2c1d08380075b74f39"
+SRC_URI[sha256sum] = "32237307496b255bb95abdcd1754885947008a52c76f32c6843744d330f2b7b5"
diff --git a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
index d54debf..62b7863 100644
--- a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
+++ b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
@@ -18,5 +18,5 @@ EXTRA_OECONF += " -no-fast -silent -no-rpath"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
 
-SRC_URI[md5sum] = "128dae41b23bb427b735548c7864703a"
-SRC_URI[sha256sum] = "1107de986e4dda7795d094a2a3b5d85027d780b9b63e9860957cb1d6c56c8929"
+SRC_URI[md5sum] = "1a863712da64dd2c1d08380075b74f39"
+SRC_URI[sha256sum] = "32237307496b255bb95abdcd1754885947008a52c76f32c6843744d330f2b7b5"
-- 
1.7.1



