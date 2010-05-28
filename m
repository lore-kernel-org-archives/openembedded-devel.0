Received: from mail.asoft.ru ([91.205.86.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1OI3Fv-0004iZ-CR
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 19:22:03 +0200
Received: from localhost.localdomain (office.asoft.ru [62.205.175.245])
	(authenticated bits=0)
	by mail.asoft.ru (8.14.3/8.14.3) with ESMTP id o4SGngfX024467
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 May 2010 20:49:43 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 May 2010 20:49:41 +0400
Message-Id: <1275065381-22201-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.6.4.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.3
	(mail.asoft.ru [91.205.86.207]);
	Fri, 28 May 2010 20:49:44 +0400 (MSD)
X-SA-Exim-Connect-IP: 91.205.86.207
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ttf-droid: new recipe
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
X-List-Received-Date: Fri, 28 May 2010 17:22:03 -0000

Add recipe for Droid fonts (specifically developed by Ascender for
Google's Android platform).  Since there's no canonical tarball URL for
these fonts, we fetch them directly from Android git repo.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---

It would be nice to have this in tree - not only these fonts looks good,
but also they're smaller than DejaVu counterparts due to less symbols
included  - basically European scripts (but there's also separate fonts
containing Chinese/Japan). Personally I use them as default fonts in
x11-based image for about two months without much problems (the only one
I stumbled upon is missing "direction" characters, used in default
layout of matchbox-keyboard)

Recipe is basically copy of ttf-dejavu.
Fontconfig bits are omitted as I'm no expert in fonts and not much sure
if they're needed.

 recipes/ttf-fonts/ttf-droid_git.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ttf-fonts/ttf-droid_git.bb

diff --git a/recipes/ttf-fonts/ttf-droid_git.bb b/recipes/ttf-fonts/ttf-droid_git.bb
new file mode 100644
index 0000000..f04f51a
--- /dev/null
+++ b/recipes/ttf-fonts/ttf-droid_git.bb
@@ -0,0 +1,28 @@
+require ttf.inc
+
+DESCRIPTION = "Droid fonts - TTF Edition"
+HOMEPAGE = "http://www.droidfonts.com/"
+LICENSE = "Apache 2.0"
+PR = "r0"
+# git magic below - SRCREV is an ID of /data/fonts subtree
+# (so we don't need to fetch full platform/frameworks/base.git)
+SRCREV = "31f255e44e618ff3b923f332e8fcb83403fd39f5"
+PV = "0.0+${PR}+gitr${SRCREV}"
+
+SRC_URI = "git://android.git.kernel.org/platform/frameworks/base.git;protocol=git;branch=master"
+
+S = "${WORKDIR}/git"
+
+do_install_prepend() {
+	rm ${S}/Ahem.ttf # we're not packaging it
+}
+
+PACKAGES = "${PN}-dbg ttf-droid-sans ttf-droid-sans-mono \
+            ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif"
+RRECOMMENDS_${PN}-dbg = ""
+
+FILES_ttf-droid-sans = "${datadir}/fonts/truetype/DroidSans.ttf ${datadir}/fonts/truetype/DroidSans-Bold.ttf"
+FILES_ttf-droid-sans-mono = "${datadir}/fonts/truetype/DroidSansMono.ttf"
+FILES_ttf-droid-sans-fallback = "${datadir}/fonts/truetype/DroidSansFallback.ttf"
+FILES_ttf-droid-sans-japanese = "${datadir}/fonts/truetype/DroidSansJapanese.ttf"
+FILES_ttf-droid-serif = "${datadir}/fonts/truetype/DroidSerif*.ttf"
-- 
1.6.4.4



