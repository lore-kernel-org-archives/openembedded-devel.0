Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QpQde-0005lv-JN
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 22:04:58 +0200
Received: by pzk2 with SMTP id 2so4779699pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/zq4K/D5AMfTFvcrgQsdk7lAIL/Dmflgjmntvp7xV4g=;
	b=k+nQetL6tJ9G9qXNIm/BpiQ8Q0fOh7HarfRq23/qhEDDlds8ywshAFKg7j0qo32Gii
	5enDO7CI760K6QszPrHLWnRxmnKN1M6LkhLbkZFhHSqPA+fOwMp41DGS8GECDqDj2HmD
	qZrBrd7r480rlg08syPqL5YSCo0LuJUIOt4vg=
Received: by 10.142.10.33 with SMTP id 33mr2267020wfj.69.1312574432369;
	Fri, 05 Aug 2011 13:00:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k3sm3468659pbj.45.2011.08.05.13.00.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 13:00:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Aug 2011 13:00:18 -0700
Message-Id: <1312574418-21041-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH V2] systemd: Link with librt explicitly on uclibc
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
X-List-Received-Date: Fri, 05 Aug 2011 20:04:58 -0000

Latest systemd has started to use mq_* functions
which are found on librt in uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 7a35f79..44f2e7f 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -28,6 +28,8 @@ UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
                              file://format-replace-m-uclibc.patch \
                             "
 
+LDFLAGS_libc-uclibc_append = " -lrt"
+
 S = "${WORKDIR}/git"
 
 SYSTEMDDISTRO ?= "debian"
-- 
1.7.4.1



