Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 05EB271633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 16:03:53 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Tue, 24 Feb 2015 13:03:39 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from saldanha.aker.com.br (10.4.3.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 24 Feb 2015 13:03:49 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Feb 2015 13:05:37 -0300
Message-ID: <1424793939-31190-2-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424793939-31190-1-git-send-email-hugo.saldanha@aker.com.br>
References: <1424793939-31190-1-git-send-email-hugo.saldanha@aker.com.br>
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: 5de71414d6a5ac0be1dec76f647836bb21381a41
X-AkerSMTPGW-MessageID: ebc7cc8f88884e3761fcc78a187550fa05c53136-10o
Subject: [meta-java][PATCH 1/3] cacao: create the link /usr/bin/java in cacao-native
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
X-List-Received-Date: Tue, 24 Feb 2015 16:03:56 -0000
Content-Type: text/plain

In native build, the link is not created by update-alternatives.
Some package builds were failing, like gnumail and gnujaf, if cacao
was the PREFERRED_PROVIDER_virtual/java-native.

Something similiar is currently done with jamvm-native.

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
---
 recipes-core/cacao/cacao_1.6.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 0cb2fbc..2bd06c6 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -59,6 +59,10 @@ do_install_append () {
     rm ${D}/${bindir}/java
 }
 
+do_install_append_class-native () {
+    ln -sf cacao ${D}/${bindir}/java
+}
+
 FILES_${PN} = "${bindir}/${PN} ${libdir}/cacao/lib*.so ${libdir}/lib*.so* ${datadir}/${PN}"
 FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/.debug/lib*.so*"
 FILES_${PN}-doc += "${datadir}/gc"
-- 
2.3.0



