Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fabian@progra.de>) id 1Pjr6Q-0004zr-9x
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 11:35:22 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <fabian@progra.de>)
	id <1Pjr5b-0001B6-IW>; Mon, 31 Jan 2011 11:34:31 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	with esmtp (envelope-from <fabian@progra.de>)
	id <1Pjr5b-00071y-Fz>; Mon, 31 Jan 2011 11:34:31 +0100
Received: from barkas-build.imp.fu-berlin.de ([160.45.111.224]
	helo=barkas-build)
	by mail.mi.fu-berlin.de with esmtps (Exim 4.72) id 1Pjr4i-0000wf-2D
	from <fabian@progra.de> ; Mon, 31 Jan 2011 11:33:38 +0100
Received: from localhost ([127.0.0.1] helo=barkas-build.imp.fu-berlin.de.)
	by barkas-build with esmtp (Exim 4.72)
	(envelope-from <fabian@progra.de>)
	id 1Pjr3S-0007yf-F3; Mon, 31 Jan 2011 11:32:18 +0100
From: Fabian Ruff <fabian@progra.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 11:32:15 +0100
Message-Id: <1296469935-30638-1-git-send-email-fabian@progra.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1296209389-20272-1-git-send-email-fabian@progra.de>
References: <1296209389-20272-1-git-send-email-fabian@progra.de>
X-Remote-IP: 160.45.111.224
X-Spam_score: -4.4
X-Spam_report: * -1.8 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.6 BAYES_00 BODY: Bayesian spam probability is 0 to 1%
	*      [score: 0.0000]
X-exim-Spam_score_int: -43
X-exim-Spam_bar: ----
X-Spam-Flag: NO
X-Originating-IP: 160.45.117.149
Subject: [PATCH v2] totem-pl-parser_2.30.0: fix configure without gobject introspection
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
X-List-Received-Date: Mon, 31 Jan 2011 10:35:22 -0000

  this bugfix removes the configure error:
  HAVE_INTROSPECTION does not appear in AM_CONDITIONAL

Signed-off-by: Fabian Ruff <fabian@progra.de>
---
 recipes/totem/totem-pl-parser_2.30.0.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/totem/totem-pl-parser_2.30.0.bb b/recipes/totem/totem-pl-parser_2.30.0.bb
index 31d6b04..a69de38 100644
--- a/recipes/totem/totem-pl-parser_2.30.0.bb
+++ b/recipes/totem/totem-pl-parser_2.30.0.bb
@@ -11,10 +11,9 @@ inherit gnome
 SRC_URI[archive.md5sum] = "81bf8e3043a9ec89bdd391c36ebd50d1"
 SRC_URI[archive.sha256sum] = "403b18c1582c14effb4e2dabf339dfdbc45285204a0cf958fc250a387b6fc65c"
 
-EXTRA_OECONF = "--enable-introspection=no"
-
 # Build of documentation is not yet possible:
 do_configure_prepend() {
+	sed -i -e 's:GOBJECT_INTROSPECTION_CHECK(\[0.6.7\]):AM_CONDITIONAL([HAVE_INTROSPECTION], [false]):g' ${S}/configure.in
 	sed -i -e s:docs::g ${S}/Makefile.am
 }
 
-- 
1.7.1



