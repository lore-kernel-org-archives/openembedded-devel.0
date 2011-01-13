Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PdO4F-00042Y-7r
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:22:23 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id p0DELkSl003928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 13 Jan 2011 15:21:47 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1PdO3e-0006g8-A7; Thu, 13 Jan 2011 15:21:46 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 15:21:43 +0100
Message-Id: <1294928503-25643-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.3.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.995
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] e2fsprogs: change mode of non-links only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jan 2011 14:22:23 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

When building as a dedicated user, compilation fails else in a way like

| + cd ..../e2fsprogs-1.41.12-r27/e2fsprogs-1.41.12
| + do_compile
| + find ./ -print
| + xargs chmod u=rwX
| chmod: changing permissions of `./patches/llseek-uclibc.patch': Operation not permitted
| ERROR: Function do_compile failed

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/e2fsprogs/e2fsprogs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index 34b9950..bdb4bbb 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -23,7 +23,7 @@ EXTRA_OECONF = "${@['','--disable-tls'][bb.data.getVar('ARM_ABI', d, 1) == 'oabi
 PARALLEL_MAKE = ""
 
 do_compile_prepend () {
-	find ./ -print|xargs chmod u=rwX
+	find ./ ! -type l -print|xargs chmod u=rwX
 	( cd util; ${BUILD_CC} subst.c -o subst )
 }
 
-- 
1.7.3.4



