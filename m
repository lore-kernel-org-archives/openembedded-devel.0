Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id E05B865DAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:39:25 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hy4so11831025vcb.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GQsP1zKhvhESXYN3pVDAPBpN0NmLTm7jTqkaO1osE08=;
	b=qN/tJHGcXMUgJNcxnwY0AzvPtzbLNXFyqmMGTdsu3ikVjaCon2Eg908TyGEUIRXiRU
	gIgqYAfMcRehdaMjg9aN7whI4faJoKrrIkI5jUi1Ic2W6gK9q5CmJST/ds04JV4WAwH/
	Yh0mUOekwsAPGj9kZWiNQvTt1aaVeEkFaWbDcCNPRPieEktoz1FqITCAI8n4iqLayqCT
	LqbLDh5k8Zhe6I/FyMROhYlWGmvFupW+otaS9ZBVvCEeY8cB8/1WZqruwLU3WHX8dygX
	zpXMeJwW1BClhTnQpCkTcUHglXQiv1TqfUDWb2gzfFopDp4n3HhjnwhANqtThi/ZkI9J
	6UWg==
X-Received: by 10.52.179.161 with SMTP id dh1mr3508552vdc.78.1407177566694;
	Mon, 04 Aug 2014 11:39:26 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	u18sm45672879vdi.20.2014.08.04.11.39.24 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 11:39:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Aug 2014 15:38:35 -0300
Message-Id: <1407177515-15086-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
References: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] evtest: Update to 0e14da9 revision
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
X-List-Received-Date: Mon, 04 Aug 2014 18:39:32 -0000

This updates to 1.31, plus fixes available in the Git tree.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/evtest/evtest_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/evtest/evtest_git.bb b/meta-oe/recipes-support/evtest/evtest_git.bb
index e4e4347..6fbb77d 100644
--- a/meta-oe/recipes-support/evtest/evtest_git.bb
+++ b/meta-oe/recipes-support/evtest/evtest_git.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRCREV = "67f3dfefb0b5708ad5b692f19c1a3a5b135264ca"
+SRCREV = "0e14da978ea906c7fdaf90f54f798a542e79ce8f"
 SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git"
 
-PV = "1.25+${SRCPV}"
+PV = "1.31+${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10.4


