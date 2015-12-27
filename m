Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 603596011A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Dec 2015 19:04:05 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p187so240302803wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Dec 2015 11:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=of5vgfjPWHRXj8ncpQQnxnDVNHcYkDDWFu05pmRnW0g=;
	b=TMfo/eTwJOfGJ6nBwSffxfqK3nv5sIfAZKajh+Y/KVWTpP3fVaStLIQ7ERFWgWfzX5
	mMScIbxowW+87sO/gpm4dFiNKdhELqb49XeZJX083j1CYYmH/4R7c+PEVvoa1ilQPJ9W
	6SNF35sj9rrSEbwg8AZdRT6SRadREFRF6MEVP7Mp5RQ2O2LdoOvTEcNbmnmuQ6Y99h16
	WyGBwrjpOghsuhmN7TvU5SDrdHQFo/6YeYw3OBskqbh1HJwWSV3EhAIrE9vuGzI1kqOg
	RXQ13uXECSPBlQ01vI/G5qlNVKTX+U+PzBi4t1Fij+ZkTtRtsKKynrn6xvQ6EMpPQ7Ui
	ewRw==
X-Received: by 10.194.206.41 with SMTP id ll9mr60707407wjc.10.1451243045874;
	Sun, 27 Dec 2015 11:04:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z65sm5292360wmg.10.2015.12.27.11.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Dec 2015 11:04:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Dec 2015 20:07:20 +0100
Message-Id: <1451243240-31401-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][dizzy][fido][meta-networking] tcpslice: fix do_install
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
X-List-Received-Date: Sun, 27 Dec 2015 19:04:08 -0000

From: Roy Li <rongqing.li@windriver.com>

replace to run "make install" with directly calling install command,
since "make install" asks "bin" user and group, and maybe fail when
system has not;

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
index 203d143..0baa109 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
@@ -29,7 +29,8 @@ do_configure () {
             ac_cv_target=${HOST_SYS}
 }
 
-do_install_prepend () {
+do_install () {
 	mkdir -p ${D}/usr/sbin
+	install -c -m 555 tcpslice ${D}/usr/sbin
 }
 
-- 
2.6.4


