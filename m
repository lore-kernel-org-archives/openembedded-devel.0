Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 0894B736EE
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
Date: Tue, 24 Feb 2015 13:05:38 -0300
Message-ID: <1424793939-31190-3-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424793939-31190-1-git-send-email-hugo.saldanha@aker.com.br>
References: <1424793939-31190-1-git-send-email-hugo.saldanha@aker.com.br>
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: 5de71414d6a5ac0be1dec76f647836bb21381a41
X-AkerSMTPGW-MessageID: 63b4a07ef12765705166e4419b9a17d9a5aa71c5-10o
Subject: [meta-java][PATCH 2/3] gnujaf: remove unnecessary reference to autotools
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
X-List-Received-Date: Tue, 24 Feb 2015 16:03:57 -0000
Content-Type: text/plain

do_install was calling an unnecessary 'make install'. oe_jarinstall
provided by java-library class is sufficient.

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
---
 recipes-core/classpathx/gnujaf_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/classpathx/gnujaf_1.1.1.bb b/recipes-core/classpathx/gnujaf_1.1.1.bb
index 69681b4..0bd8b57 100644
--- a/recipes-core/classpathx/gnujaf_1.1.1.bb
+++ b/recipes-core/classpathx/gnujaf_1.1.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/classpathx/activation-${PV}.tar.gz \
            file://MimeType-symbols-fix.patch \
           "
 
-inherit autotools java-library
+inherit java-library
 
 S = "${WORKDIR}/activation-${PV}"
 
-- 
2.3.0



