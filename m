Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13Uz-0001jn-HP
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 78FEA3148E2F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sFNEuYoQg57q; Wed, 29 Sep 2010 22:37:03 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id BC5713148E1D;
	Wed, 29 Sep 2010 22:37:00 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:00 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:21 +0000
Message-Id: <1285792594-10032-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/18] mc-4.6.2: use cd instead of pushd and popd
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:36 -0000

* pushd and popd aren't compatible with dash.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/mc/mc_4.6.2.bb |   27 +++++++++------------------
 1 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/recipes/mc/mc_4.6.2.bb b/recipes/mc/mc_4.6.2.bb
index 85a2cce..18aea70 100644
--- a/recipes/mc/mc_4.6.2.bb
+++ b/recipes/mc/mc_4.6.2.bb
@@ -1,5 +1,5 @@
 require mc.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 HOMEPAGE = "http://www.midnight-commander.org/"
 
 # most of these fixes were copied from openSUSE Factory.
@@ -34,8 +34,7 @@ do_unpack_append() {
         bb.build.exec_func('do_utf8_conversion', d)
 }
 do_utf8_conversion() {
-	pwd
-	pushd lib
+	cd ${S}/lib
 	iconv -f iso8859-1 -t utf-8 -o mc.hint.tmp mc.hint && mv mc.hint.tmp mc.hint
 	iconv -f iso8859-1 -t utf-8 -o mc.hint.es.tmp mc.hint.es && mv mc.hint.es.tmp mc.hint.es
 	iconv -f iso8859-1 -t utf-8 -o mc.hint.it.tmp mc.hint.it && mv mc.hint.it.tmp mc.hint.it
@@ -48,35 +47,27 @@ do_utf8_conversion() {
 	iconv -f koi8-u -t utf8 -o mc.hint.uk.tmp mc.hint.uk && mv mc.hint.uk.tmp mc.hint.uk
 	iconv -f big5 -t utf8 -o mc.hint.zh.tmp mc.hint.zh && mv mc.hint.zh.tmp mc.hint.zh
 	iconv -f iso8859-5 -t utf-8 -o mc.menu.sr.tmp mc.menu.sr && mv mc.menu.sr.tmp mc.menu.sr
-	popd
 	# convert docs to utf-8
-	pushd doc
-	pushd es
+	cd ${S}/doc/es
 	iconv -f iso8859-1 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
 	iconv -f iso8859-1 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp
-	popd
-	pushd hu
+	cd ${S}/doc/hu
 	iconv -f iso8859-2 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
 	iconv -f iso8859-2 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp
-	popd
-	pushd it
+	cd ${S}/doc/it
 	iconv -f iso8859-1 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
 	iconv -f iso8859-1 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp
-	popd
-	pushd pl
+	cd ${S}/doc/pl
 	iconv -f iso8859-2 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
 	iconv -f iso8859-2 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp
-	popd
-	pushd ru
+	cd ${S}/doc/ru
 	iconv -f koi8-r -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
 	iconv -f koi8-r -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp
-	popd
-	pushd sr
+	cd ${S}/doc/sr
 	iconv -f iso8859-5 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
 	iconv -f iso8859-5 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp
 	iconv -f iso8859-5 -t utf-8 -o mcserv.8.in.tmp mcserv.8.in && mv mcserv.8.in.tmp mcserv.8.in
-	popd
-	popd
+	cd ${S}
 }
 
 do_configure_prepend() {
-- 
1.7.1



