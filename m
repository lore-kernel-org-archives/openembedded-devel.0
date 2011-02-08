Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PmqGP-0004l9-39
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 17:18:01 +0100
Received: by ywi6 with SMTP id 6so2318963ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=peQm9e3dcZe5rnXDGBzaxa0vjYneNtYic4/Hto1qMUc=;
	b=kPbMAUL5207rl8yWo5Kz+6ZsmTY7Asy1g2ia5vyLFSd1KLOilVPjpmqKEJ2CfaFz4y
	tcAUzk2NTHWKQ+DrpaGrIC9rheFsMBnV8Ux69KlnLxQVs0JMfXFKczQi2xmmFWTl3Lcx
	T7ewcGKerfVCkbBoOgkZfpLboICzvDK2QWkjc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UYw3XuDlY/tm73aLch1cbxDlObn1P22LvMtoboM09v8XiPNsXRwotNVi+4IZR5nj/y
	GcIbtssdDZj45WgGPR8T8mP76gxWPcHnfP9Xha9Goxxpdd+Q2au+huhCfhN9X3krfKDq
	zYuOOdMjqMlhbKFXDrQf+Prz1+XCWsYkQoFf4=
Received: by 10.101.186.1 with SMTP id n1mr10452117anp.209.1297181818482;
	Tue, 08 Feb 2011 08:16:58 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id w6sm7245628anf.6.2011.02.08.08.16.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Feb 2011 08:16:57 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Feb 2011 09:16:41 -0700
Message-Id: <1297181802-18948-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
References: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] autotools: symlink where we can
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
X-List-Received-Date: Tue, 08 Feb 2011 16:18:01 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/autotools.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 9744589..a88a4d1 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -137,11 +137,11 @@ oe_autoreconf () {
 		if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
 			: do nothing -- we still have an old unmodified configure.ac
 		else
-			echo "no" | glib-gettextize --force --copy
+			echo "no" | glib-gettextize --force
 		fi
 	else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
 		if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
-			cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+			ln -sf ${STAGING_DATADIR}/gettext/config.rpath ${S}/
 		else
 			oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
 		fi
@@ -151,9 +151,9 @@ oe_autoreconf () {
 	for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
 		mkdir -p ${aux}
 	done
-	autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
+	autoreconf -Wcross --verbose --install --symlink --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
 	if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
-		intltoolize --copy --force --automake
+		intltoolize --force --automake
 	fi
 }
 
-- 
1.7.2.3



