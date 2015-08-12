Return-Path: <prvs=659569f5e=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2D17677E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:04:49 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApoEAIZfy1WsEApK/2dsb2JhbABdhFgGxVwCghMBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM9BJAQEBBwEBAQEekFwHF4QVBZUTlWqRE4Qlb4FIgQQBAQE
X-IPAS-Result: ApoEAIZfy1WsEApK/2dsb2JhbABdhFgGxVwCghMBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM9BJAQEBBwEBAQEekFwHF4QVBZUTlWqRE4Qlb4FIgQQBAQE
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 17:03:53 +0200
Message-ID: <1439391837-10238-2-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
References: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [PATCH 1/5] openjdk-7-common: explicitely disable PCSC and SCTP
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
X-List-Received-Date: Wed, 12 Aug 2015 15:04:50 -0000
Content-Type: text/plain

PCSC default value was changed to true and SCTP was added during the 2.6.0
IcedTea release so disable them both explicitely in openjdk-7-common.inc

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 5b0ac7c..837f0b8 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -121,6 +121,13 @@ EXTRA_OECONF = " \
 	--with-cc-for-build=${BUILD_CC} \
        "
 
+# PCSC default value was changed to true and SCTP was added during the 2.6.0
+# release so we disable them both explicitely here
+EXTRA_OECONF += " \
+	--disable-system-pcsc \
+	--disable-system-sctp \
+	"
+
 do_configure_prepend() {
   echo "Configure with parallel-jobs: ${JDK_JOBS}"
 
-- 
2.1.4


