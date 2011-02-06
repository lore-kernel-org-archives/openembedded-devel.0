Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pm81G-0004Wr-CZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 18:03:27 +0100
Received: by wwi17 with SMTP id 17so3788751wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=BSjX62p0va1f0adyTTW3BjGOgBOnDCS2dIHWz/0hUzg=;
	b=Kfc466dbuJVA2MLPAYUI65AlyQitaDT/yK8SXlzVbLc1eTfRVbOOLTdisg4pma7BQm
	4w4fBh9qOhDvCwXUrSWmcRmE2ZSASj/RW7wWNgHd17MthxVnpGenDzy2gog3Ed0r5Js9
	QZ9XnXvghNfR3r048RR0F3+b1AjlGsdam2Eh8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=bQbTBxjXiI+L5W3fozJ0cyUqdefLUsJHoQHJ1LX7X48iq3W1ce3LYtymgcE6PeOytC
	trZ/CfqKCqLdX5ZLfTTak2NWmVBQjPsof1Yf3m0zow/ZBTOoyErtcn1OE/yl6QI+kw6B
	+PWOGe8//KwsLzLGArzKA064fV7pPU5D1ylD8=
Received: by 10.227.145.198 with SMTP id e6mr14659040wbv.151.1297011746245;
	Sun, 06 Feb 2011 09:02:26 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id o6sm2540470wbo.15.2011.02.06.09.02.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 09:02:25 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Feb 2011 18:02:18 +0100
Message-Id: <1297011738-4317-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] apt: remove references to not-built man pages.
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
X-List-Received-Date: Sun, 06 Feb 2011 17:03:27 -0000

Manual pages are not being built because doxygen is currently not
supported by openembedded.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/apt/apt-package.inc |   15 +++------------
 recipes/apt/apt_0.7.20.2.bb |    1 -
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes/apt/apt-package.inc b/recipes/apt/apt-package.inc
index 350bebd..b1a729f 100644
--- a/recipes/apt/apt-package.inc
+++ b/recipes/apt/apt-package.inc
@@ -1,10 +1,4 @@
-apt-manpages="doc/apt-cache.8 \
-	      doc/apt-cdrom.8 \
-	      doc/apt-config.8 \
-	      doc/apt-get.8 \
-	      doc/apt.8 \
-	      doc/apt.conf.5 \
-	      doc/apt_preferences.5 \
+apt-manpages="doc/apt.8 \
 	      doc/fr/apt-cache.fr.8 \
 	      doc/fr/apt-cdrom.fr.8 \
 	      doc/fr/apt-config.fr.8 \
@@ -24,11 +18,8 @@ apt-manpages="doc/apt-cache.8 \
 	      doc/ja/apt-cache.ja.8 \
 	      doc/ja/apt-cdrom.ja.8 \
 	      doc/ja/apt-get.ja.8 \
-	      doc/ja/apt.conf.ja.5 \
-	      doc/sources.list.5"
-apt-utils-manpages="doc/apt-extracttemplates.1 \
-		    doc/apt-sortpkgs.1 \
-		    doc/fr/apt-extracttemplates.fr.1 \
+	      doc/ja/apt.conf.ja.5"
+apt-utils-manpages="doc/fr/apt-extracttemplates.fr.1 \
 		    doc/fr/apt-sortpkgs.fr.1"
 #		    doc/fr/apt-ftparchive.fr.1
 #		    doc/apt-ftparchive.1
diff --git a/recipes/apt/apt_0.7.20.2.bb b/recipes/apt/apt_0.7.20.2.bb
index e3d4cd7..5c932a5 100644
--- a/recipes/apt/apt_0.7.20.2.bb
+++ b/recipes/apt/apt_0.7.20.2.bb
@@ -12,7 +12,6 @@ PR = "r3"
 require apt-package.inc
 
 FILES_${PN} += "${bindir}/apt-key"
-apt-manpages += "doc/apt-key.8"
 
 do_stage() {
 	install -d ${STAGING_LIBDIR} ${STAGING_INCDIR}/apt-pkg
-- 
1.7.1



