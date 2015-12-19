Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 61B956012C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Dec 2015 01:45:24 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ph11so3932423igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 17:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0LwlJa/RHMDbczaUtgfwpjJ6RblNcjH/qXa8SZecXpk=;
	b=DSa4S8vY0mC2VV/Ex07z3ynHCxOCqr1pe9/RCR2WPstQ4YLV5ih4j2wd4mHP/Gr6Bt
	3PNyuMK+LwOmPYfcjMsTckhCdAKx389Pprk6MXeklX6rNavqUKjkKxnXN6qptBjXMcRi
	qtJ4p0lOMVoINgJMQrJbPW29Ov4MxLNjXASKkTKHzTj2RVs5qH4JoMYCmY/EfDahLmHR
	tdXDvSv2b5JZ4TAJTvtSELBBZ8Mf4HooGoFkPgCQQHuKCpiDrHi34TcMQdGr0kKGUUZg
	Zyt5iK7PcPzVtHhU8MJQrubiTaK3rpLZdP3THXfp0kOHaRSCguyOgXNm60xQ8cLgjprc
	WMTQ==
X-Received: by 10.50.83.72 with SMTP id o8mr6360876igy.48.1450489525245;
	Fri, 18 Dec 2015 17:45:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	f199sm7631798iof.20.2015.12.18.17.45.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 17:45:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:45:18 -0800
Message-Id: <1450489518-1970-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mpg123: add textrel to INSANE_SKIP
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
X-List-Received-Date: Sat, 19 Dec 2015 01:45:25 -0000

The x86 assembler optimisations contains text relocations and there
are no upstream plans to fix them:

  http://sourceforge.net/p/mpg123/bugs/168/

Benchmarking suggests that the SSE assembler is still clearly faster
than the generic C code, so leave the assembler optimisations enabled.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
index 22ea572..d11a312 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
@@ -51,6 +51,10 @@ EXTRA_OECONF = " \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
 "
 
+# The x86 assembler optimisations contains text relocations and there are no
+# upstream plans to fix them: http://sourceforge.net/p/mpg123/bugs/168/
+INSANE_SKIP_${PN}_append_x86 = " textrel"
+
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
 #| {standard input}:47: Error: selected processor does not support Thumb mode `smull r5,r6,r7,r4'
-- 
1.9.1


