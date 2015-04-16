Return-Path: <joe@deserted.net>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id BA18673D17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 04:12:57 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so2413881igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 21:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=mkSP9orzb8DqcIvjYUHufXulsubCKYcV09zgN0CfnB4=;
	b=IoQf1MK73zRrPOzmCIqwrroCj5a8SNlyAyRbTgXHxIMc5x7ilUGmdMOZJD6mzxEbsl
	581QPEUKjdJYWRhdsFpZ3DS/xJak6rFDy791s8ymDBx8HAwSyzBecOSTwOoKqekoUtb7
	aX+OIJ2r1R1ABrIXpm1oT/9EjhvyL7afgegtr9XPgqAm9GO1bNysyLjrvsF1XFSmPbzB
	qao+vFBq6OxS2alaa10lKvF2HLxkC0D5MHxNpb1YhxxOtaFyM97PMHBxx1X1+5o0lfIc
	9EnXsgHIdDVy+Mv6Vc6CYy8JGfI4brZGNpvKY1tp5kBH3hRgk3pkmzXNYC8HCCC1qrxH
	Kb0A==
X-Gm-Message-State: ALoCoQnfq6L4PoICCrBMgzyD2eFLrlkF+s6EHJwf9aDil+t/fnUj7sozhnlQjsrW9gAMtPd3Bvpg
X-Received: by 10.50.30.202 with SMTP id u10mr2870432igh.28.1429157578479;
	Wed, 15 Apr 2015 21:12:58 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id w33sm3777380ioi.17.2015.04.15.21.12.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 21:12:57 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 00:14:25 -0400
Message-Id: <1429157668-4952-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking, for-fido][PATCH 1/4] postfix: add LSB init infos
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
X-List-Received-Date: Thu, 16 Apr 2015 04:13:00 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Keep compatibility with chkconfig tool.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-daemons/postfix/files/postfix | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/files/postfix b/meta-networking/recipes-daemons/postfix/files/postfix
index 7bcc816..0ea67ef 100755
--- a/meta-networking/recipes-daemons/postfix/files/postfix
+++ b/meta-networking/recipes-daemons/postfix/files/postfix
@@ -1,4 +1,12 @@
 #!/bin/sh
+### BEGIN INIT INFO
+# Provides: postfix MTA
+# Default-Start: 2345
+# Default-Stop: 016
+# Short-Description: start and stop postfix
+# Description: Postfix is a Mail Transport Agent, which is the program
+#              that moves mail from one machine to another.
+### END INIT INFO
 
 success() {
         echo " Successful"
-- 
1.9.1


