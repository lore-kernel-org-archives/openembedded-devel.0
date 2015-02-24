Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 06D7372C58
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
Date: Tue, 24 Feb 2015 13:05:36 -0300
Message-ID: <1424793939-31190-1-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.3.0
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: 5de71414d6a5ac0be1dec76f647836bb21381a41
X-AkerSMTPGW-MessageID: db08a3ff2141194716b23c72d8ff2c2ffefbc0f0-10o
Subject: [meta-java][PATCH 0/3] Some build fixes
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

This series tries to fix some problems I've encountered lately.

Hugo Vasconcelos Saldanha (3):
  cacao: create the link /usr/bin/java in cacao-native
  gnujaf: remove unnecessary reference to autotools
  icedtea7-native: remove currency data generation expiration date

 recipes-core/cacao/cacao_1.6.1.bb                  |  4 ++++
 recipes-core/classpathx/gnujaf_1.1.1.bb            |  2 +-
 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 ++
 4 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-openjdk-remove-currency-data-generation-expi.patch

-- 
2.3.0



