Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 702297F57E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2019 16:32:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Ggf55SpSz29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2019 18:32:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566750749;
	bh=uXLV5WQtaYP1eeK9Qliw55IeGMjJPk+Z6nZr32BcGS4=;
	h=From:To:Subject:Date:From;
	b=d0xvn0iyCm8rEMn0ZEQt94I0gFujDxUqBNtZDNMK+tOXWImNWzPzKfBQqPWI6fb5l
	NnlRgI5LsK3hyDrmtCyO9e24aa6tlEqHij1IiAsfSJaBjXSOpFTd0kPJI3zC1ijSkf
	m58GrUpgvCu4axfZYFvWtIs2PmkYgQ38GzmwB35Zm1+8EfkrHg3U+cSQ0T7JtvHfqQ
	cYGL98SyodCw8U8A6PrcLu/Fb6cDt93fAf3mmSdM+VeppbcZeQ+uAEUjHSHCiyxtPY
	bCYtB/a/7rz2wQf8PvvJ3WB4xuuWaURwlLTCRBz6IcoivPFTlX8N6lFuGLkOu3NNZ1
	wqYc+4+lEYY7Mjg7IJAnb920kVRmGxr/vv0WoyubOy25qUhry/wgtPcovVuSDutWJx
	9OVeUPH+CA+XJ1H1vhNU+pa3vRMiuGxRo9RNj9lBANg/Btz8AmXBpYdid7KwJFoUw5
	uqEtb/lLv1yR6z+H3E1OQeHpP3oeOfO8Axpylmw9gqXyIbjzvmh1VHDsGMP3uO1Y3L
	S8b0InfeMzg3AK8VOE/m+hLmFnh6rWq35+GaMqppiA2icoyx7bBoTt08t6z69COX9j
	/X32ybO1l2ONaA+Wl8HLK9tTOR48YhtTqxHvCsL5JRs+Kzmj/PSUL2PsEzUDv9Vkf/
	RuscU3t/OVzLMxHu9+xuaCK4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Aug 2019 19:32:28 +0300
Message-Id: <20190825163228.8400-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libenv-perl: Import from meta-security
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Aug 2019 16:32:30 -0000

This will also be needed by a new meta-lsb layer.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-perl/libenv/libenv-perl_1.04.bb   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb

diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
new file mode 100644
index 000000000..dd8e1159e
--- /dev/null
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Perl module that imports environment variables as scalars or arrays"
+DESCRIPTION = "Perl maintains environment variables in a special hash named %ENV. \
+For when this access method is inconvenient, the Perl module Env allows environment \
+variables to be treated as scalar or array variables."
+
+HOMEPAGE = "http://search.cpan.org/~flora/Env/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "fdba5c0690e66972c96fee112cf5f25c"
+SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
+
+S = "${WORKDIR}/Env-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


