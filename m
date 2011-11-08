Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNlLn-0002RA-1a
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 14:04:27 +0100
Received: by ywf9 with SMTP id 9so471153ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 04:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NBmv3e4BkbOrD8qeNm7L5tS4HztXTwuUGHzr7FUyusg=;
	b=pkK4OYejvtzmK/8A2hjLmLQeoSOC5MBpMr2UY5XiW+uFXo91y5xe1dW6hvYxoK8BOE
	Jp0WKj+QrHm+CrlR4hjr4x/JpttcKZMYlWrnAjpgLpnHF72R6nN8xv/ihWv+wpIGKtMf
	DxU8HIrXvKc2rUoz9RbcDnj9JeCYPyvcXX4yY=
Received: by 10.236.181.198 with SMTP id l46mr41293182yhm.96.1320757092242;
	Tue, 08 Nov 2011 04:58:12 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y58sm2066338yhi.17.2011.11.08.04.58.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 04:58:11 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2011 12:58:00 +0000
Message-Id: <db24be4e6f001aae20b76249c499becc26ca1821.1320757052.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320757052.git.otavio@ossystems.com.br>
References: <cover.1320757052.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320757052.git.otavio@ossystems.com.br>
References: <cover.1320757052.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] systemd.bbclass: stop using SYSTEMDPN to rdepends addition
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
X-List-Received-Date: Tue, 08 Nov 2011 13:04:27 -0000

The systemd runtime dependency needs to be add dynamically onto each
package that has the postinst generate thus removing the SYSTEMDPN use
et all.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 83833db..2ca7bfc 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -1,7 +1,4 @@
-SYSTEMDPN ?= "${PN}"
-
 DEPENDS_append = " systemd-systemctl-native"
-RDEPENDS_${SYSTEMDPN}_append = " systemd"
 
 systemd_postinst() {
 OPTS=""
@@ -67,9 +64,14 @@ python populate_packages_prepend () {
                 postrm += bb.data.getVar('systemd_postrm', localdata, 1)
 		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
 
+		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
+		rdepends.append("systemd")
+		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+
+
 	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
 	if pkgs == None:
-		pkgs = bb.data.getVar('SYSTEMDPN', d, 1)
+		pkgs = bb.data.getVar('PN', d, 1)
 		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
 		if not pkgs in packages and packages != []:
 			pkgs = packages[0]
-- 
1.7.2.5



