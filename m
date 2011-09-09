Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1qyj-00044m-Dr
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 04:38:05 +0200
Received: by wwe32 with SMTP id 32so447057wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2011 19:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MjQwMT5GE6NETmZBAaf/CGL0hGVDeGrygUGJYERCRQ0=;
	b=f7Gl5mnXcYGC/Yt+qrlQuSXrweJHiGZMqCp6zOBMg5VC2Ur5jjURT9SsieqV3wfHPG
	cM/ADM9S2XCrfSWEcd8aUu6/FaeFGeqwAs4A3aH/YWYM8ruDiZaVoLTewB74Pj8Yfue3
	7F4I/uswRCZvVQJ7x/BAYN1Eym4YtOaQ7gQ7Y=
Received: by 10.216.139.6 with SMTP id b6mr1419299wej.61.1315535576547;
	Thu, 08 Sep 2011 19:32:56 -0700 (PDT)
Received: from localhost.localdomain
	(host86-135-215-249.range86-135.btcentralplus.com [86.135.215.249])
	by mx.google.com with ESMTPS id ex16sm6073323wbb.4.2011.09.08.19.32.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Sep 2011 19:32:55 -0700 (PDT)
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 04:32:43 +0100
Message-Id: <1315539163-5898-1-git-send-email-errordeveloper@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
Cc: Ilya Dmitrichenko <errordeveloper@newbrik.new-synth.info>
Subject: [PATCH 1/2] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Fri, 09 Sep 2011 02:38:05 -0000

From: Ilya Dmitrichenko <errordeveloper@newbrik.new-synth.info>

Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
---
 recipes/binutils/binutils_2.20.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 5154e2d..f40b676 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -24,8 +24,8 @@ SRC_URI_append_nios2 =" \
 	file://binutils-nios2.patch \
 	"
 
-SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
-SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
 
 # powerpc patches
 SRC_URI += "\
-- 
1.7.3.4



