Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QP5sw-0006Ny-Jy
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 06:39:54 +0200
Received: by pxi6 with SMTP id 6so5438190pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2011 21:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+8YI0fRA5HMLREBWTc4WOMnUu9yL4ziVKL+4jH3sKDQ=;
	b=thvgy9PhWYYFefzvZpjhemxNDyWiZEk00VUJhNzIx5TdLWj9quNMJVjsA32TsLvHZf
	YUm5rMDyfO9kqQ6yz5V8nQwGDiNSRsQ5mr0Y6zkoq02VRxqIowbsWuQlJwT/3hwiFJiy
	iwdddrbtW+LnCYl08XF21o4iauezPa2PIQ45M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=JpQSOH0lS4M9t7llQdxgTrwTIZRPGC1nO3I+ubMkbYdlyuFSreBF3IGF7NaB3kzVM9
	iuecuzm8Ylq7nlEctkqn78wBXWORPPPlhflZ6YoBGV5bVpvPM/i1eJ57SbLbHMpvuM0P
	qdcU5iRu9Pf9zZnUoCZaZsvQF0kJK4I8j0Ojg=
Received: by 10.68.63.9 with SMTP id c9mr591400pbs.71.1306298211486;
	Tue, 24 May 2011 21:36:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 5sm5433269pbn.25.2011.05.24.21.36.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 21:36:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2011 21:36:45 -0700
Message-Id: <1306298205-20707-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] gcc-4.6.inc: Always build runtime in ARM mode.
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
X-List-Received-Date: Wed, 25 May 2011 04:39:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.6.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6.inc b/meta-oe/recipes-devtools/gcc/gcc-4.6.inc
index a5e64be..b86c6fb 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6.inc
@@ -16,6 +16,8 @@ BINV = "${PV}.0"
 
 PR = "r0"
 
+ARM_INSTRUCTION_SET = "arm"
+
 DEPENDS =+ "mpfr gmp libmpc"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
 
-- 
1.7.4.1



