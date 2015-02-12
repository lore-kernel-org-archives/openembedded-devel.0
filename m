Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 3AB70606E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 12:35:05 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Thu, 12 Feb 2015 10:34:56 -0200
	(envelope-from hugo.saldanha@aker.com.br)
Received: from saldanha.aker.com.br (10.4.3.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 12 Feb 2015 10:34:38 -0200
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Feb 2015 10:36:22 -0200
Message-ID: <1423744582-29803-1-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.3.0
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: 5de71414d6a5ac0be1dec76f647836bb21381a41
X-AkerSMTPGW-MessageID: 57292a410f68b46fd1062faba36fdf95dcdb7beb-10o
Subject: [meta-java][PATCH] cacao: upgrade m4 macros in source tree
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
X-List-Received-Date: Thu, 12 Feb 2015 12:35:10 -0000
Content-Type: text/plain

Before configuring package, we upgrade m4 macros with a call to
libtoolize. Otherwise, compiling would fail with a complain about
different versions of libtool.
---
 recipes-core/cacao/cacao_1.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 75fdc8f..0cb2fbc 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -49,6 +49,8 @@ EXTRA_OECONF = "\
 "
 
 do_configure_prepend () {
+    # upgrade m4 macros in source tree
+    libtoolize --force --copy --install
     rm  src/mm/boehm-gc/ltmain.sh
     mkdir -p src/mm/boehm-gc/m4
 }
-- 
2.3.0



