Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9D68D76312
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 14:36:47 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o1so3594458qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sr1Slaa0/tOdyD80cMtDuDkkbehZlq4985GNOzpIaO4=;
	b=Zh2cLgqkp/veOiM31MOQzpSNziTJUmBic6SGqVn0K43k073IReMnTKNmA80/1aCARu
	M03Z43WcZPCmILkLzuUNnerdYVb4JW3dBfDw9WollH2eGXy6iYCj1vcmG15TH7Y+38kj
	vNzRBZDOWpcGjOpXkiGYiU90gpJTScBGbPxwGbV0n2Zn9Nup3odWwNZylo/hyMEjlILV
	3jGC0PGG+CkktTRbd5TlKDH/MadbwXLmuwzBkh/G3F5Ab3aAi0GInU/UQKbTZrjDG7sM
	5JIx6QSMMwdOCvDd/PnKdlYCWjXAob7KbwV0v1gZsl2OssDLLc6FUk+xdek1KS9G4LHD
	pixg==
X-Gm-Message-State: AEkoouuk6fD7F3ghscOw9ZyiG1eKpgJJ/x9HZUsU6cNCZBKAG4fnFEN1mv7xllTUEgjwYg==
X-Received: by 10.55.75.76 with SMTP id y73mr5163737qka.12.1470839807823;
	Wed, 10 Aug 2016 07:36:47 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	c26sm23514314qte.1.2016.08.10.07.36.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Aug 2016 07:36:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 10:36:39 -0400
Message-Id: <1470839799-9264-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] evtest: update to version 1.33
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
X-List-Received-Date: Wed, 10 Aug 2016 14:36:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/evtest/evtest_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/evtest/evtest_git.bb b/meta-oe/recipes-support/evtest/evtest_git.bb
index 96feab7..fa0d6e2 100644
--- a/meta-oe/recipes-support/evtest/evtest_git.bb
+++ b/meta-oe/recipes-support/evtest/evtest_git.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRCREV = "b8343ec1124da18bdabcc04809a8731b9e39295d"
+SRCREV = "ab140a2dab1547f7deb5233be6d94a388cf08b26"
 SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git"
 
-PV = "1.32+${SRCPV}"
+PV = "1.33+${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


