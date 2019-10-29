Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E23C57FA1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCJ6cyJz8b
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373885;
	bh=ZjfOhyCmilo3OfyVhaQ8ogweV59i1TMfT7MvPbPSM9s=;
	h=From:To:Subject:Date:From;
	b=JB54gasrx4Ez4mqwZHQ44Qeh6PHX3P5hUUJBAVAQsOlQWQWen7qiQMFrjdFesDqCN
	qfgeqAZIjDULmidaYn7A0CYQ+bNhOwRFvOzDEHxcQ1NDIxkMcB8+vs8FUwzqpj7hVM
	HecS9oX6JwvziOeK7OqqstegIRvUHKz6nHG1z93wqDHYdxSeilVeZmcLn54AfTPWh+
	7T8kXKKdHdu4PnQYHNQPvJSYxh2FGFRqTiNnbF+qIFfBTNv8l/N8648f3QnPnxRW2M
	Dz30OKLipn3LXh71iLgThlCI22WGY5erC0JAeVblADdm0waiCdPb6UxeW4k733E9ri
	B1vX6QnvAHVPSnUZFl/hnWBoDUedBxh7phoqoPWAlxqQyXDouZhS/E5q6r+TeEl5h5
	6BUcs6i/redc3IyRf6/v29qJnmO1tnkXBQysX/bcu3qfs3B2Q1mQeJHRSB2NYjGKH7
	4NMYCYrQrESlf8TFMhlPRYmAYF+hmLKFC8VJ6cK9zlbdgTHtdaoGeaayrOS4zbMcS4
	6KDqzTsK7JulP04lEOXsbJTCZcqtpmlxKABYGwX1aobIuuoQ52I/bw7OP3wzXJ7LmH
	+9bQjWIh3/aqKyH1jXfViWI71TeRT4rXV0XwcLii8nUdXmEovtPfmB7PVspevQEGrn
	FcP5PNbz03J5lxKnDNq/Rulo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:15 +0200
Message-Id: <20191029183123.1868-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libtorrent: Upgrade to 0.13.8
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:26 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index b2dffcdb9..fa106ea41 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -11,9 +11,9 @@ SRC_URI = "git://github.com/rakshasa/libtorrent \
            file://0001-implement-64bit-atomic-for-mips.patch \
            file://0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch \
            "
-SRCREV = "074f6ec51a2e4bc5c6140b4dad13c9bb56f3f0dc"
+SRCREV = "756f70010779927dc0691e1e722ed433d5d295e1"
 
-PV = "0.13.7+git${SRCPV}"
+PV = "0.13.8"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


