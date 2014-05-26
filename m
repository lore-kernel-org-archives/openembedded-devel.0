Return-Path: <ashcharles@gmail.com>
Received: from mail-pb0-f41.google.com (unknown [209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 35C406FA43
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 19:27:46 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id uo5so8038009pbc.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 12:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7YJDLQHtVFQsJ8Sm2GDyymNCwnP5w/gI7ULwI6OIpMg=;
	b=BGpLx7TsYfoe15XQSFg86IdLmhmNeyRH7c5/d4Gkhk9SyNMv9jQHJ23AvydLMIeUJy
	wDO2HZ9V2Jp/kN7+/ZIM7b25yvf1UIHa4FYKpVvxKk1dDM4BSZVHb1XXRKS8edk3DlxA
	MPDuqb4iH3TZZfGlAPMe0KDD9SfVnj/qZQwzEWVhWsaDCAlbuun/vRuTZZepw5glZKst
	dqJcp7NUizmorhmM1SuuGoQOH48UknlMJc3NGwEiH09uueGiNs1absaVrrbm2Q2kQYsF
	ddqbiU44iw1qRg8E/lc3rXwgTR1Pon4+ZRMdNkxmgaPJQiJ70N0nxgA0E7YijI8BnQjN
	1Qeg==
X-Received: by 10.66.142.201 with SMTP id ry9mr30524647pab.14.1401132467853;
	Mon, 26 May 2014 12:27:47 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	eh4sm19514033pbc.79.2014.05.26.12.27.46 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 12:27:47 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 12:27:39 -0700
Message-Id: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 May 2014 19:27:50 -0000

The po subdirectory is not copied over to the build directory of
found on the VPATH for an out-of-tree build so we symlink it over.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index c47c653..5c9c749 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -14,7 +14,9 @@ SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e
 
 S = "${WORKDIR}/${BPN}"
 
-PR = "r1"
+do_compile_prepend() {
+    ln -s ${S}/po po
+}
 
 ALTERNATIVE_${PN} = "volname eject"
 ALTERNATIVE_LINK_NAME[volname] = "${bindir}/volname"
-- 
1.8.3.2


