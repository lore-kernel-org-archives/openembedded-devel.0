Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UEcRL-0000sS-5H
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Mar 2013 10:21:36 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so496498dad.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2013 01:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=c0HzF72E9LVfNMNfDwYAAXap8TtxUcT+qXKAWCUHv0k=;
	b=YwOhNF2g+ho1VgaFT6u7AfqtLykyq54lpor0RMr1oAiSDgWLSaxMT/Xelja4Upl4pI
	FxD7I29ktxb5lgg54Q9vaJTCA2wYIpZosz7jcjow4NrjvUj3ebllPn4SQGTbGXQnNfqi
	zBeJ3E82Jsfp/ujUERslmT0h0jXnt/5QGW0tAtVGAqD4dePE3KX9cbB5DyZDYAtClduW
	cNPGSQU35wyiseCqKflWq5Qzs9orcZSUiNkWdo/TVXGAk8NNOyxjvyi+vk9ZvsAT6d79
	Dh0LGoCtvcgOxkZUAfk/AxyZTOcZS2YYW4+EajuEPneJs2FXBjRkXzRFPAMkSlkycjoL
	/9Vg==
X-Received: by 10.68.26.234 with SMTP id o10mr18009910pbg.211.1362906273835;
	Sun, 10 Mar 2013 01:04:33 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id kb3sm14495558pbc.21.2013.03.10.01.04.31
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 10 Mar 2013 01:04:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Mar 2013 01:04:03 -0800
Message-Id: <1362906243-13223-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] tcsh: Depend on ncurses.
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
X-List-Received-Date: Sun, 10 Mar 2013 09:21:37 -0000

This fixes the compile errors seen when building
tcsh from scratch. Its not seen with image builds
normally since ncurses is already built due to
other image dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
index d85fba8..bba89bf 100644
--- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.tcsh.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright;md5=1cf29be62df2be1a3763118b25b4c780"
 SECTION = "base"
-
+DEPENDS = "ncurses"
 SRC_URI = " \
 	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=tarball \
 	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs \
-- 
1.7.9.5



