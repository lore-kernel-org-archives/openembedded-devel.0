Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R0Fqp-0000OQ-3T
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 18:47:19 +0200
Received: by bkbzu17 with SMTP id zu17so3697770bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2011 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=w4+GT7jSdACJy0blLuMPXorPboPcLsb2GtQOxVYyrvk=;
	b=gGd+tr2/JdgzswI9/Np2o1aPZMbdXR+J11siY65+AKh0eiRAbR0qcf5Zmz/hdaTdta
	piWh9SRY57OnRaBV7ce8dT1+FGpx1fG9rIaRTyuy2DIdlN7vhw1SpswNsoI9ttgkjKPQ
	XtBRkjBBjQ7OvNdMxKrC50cSC1GHb4HkiA7wE=
Received: by 10.204.154.150 with SMTP id o22mr1649697bkw.363.1315154539359;
	Sun, 04 Sep 2011 09:42:19 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id zw12sm2257104bkb.10.2011.09.04.09.42.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Sep 2011 09:42:18 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2011 20:42:09 +0400
Message-Id: <1315154529-19023-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie] libopie2: also use gcc45_opiemm_include.patch for git version
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
X-List-Received-Date: Sun, 04 Sep 2011 16:47:19 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/libopie/libopie2_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-opie/libopie/libopie2_git.bb b/recipes-opie/libopie/libopie2_git.bb
index 8ffefe0..ab866d3 100644
--- a/recipes-opie/libopie/libopie2_git.bb
+++ b/recipes-opie/libopie/libopie2_git.bb
@@ -6,6 +6,7 @@ PR = "r14"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${OPIE_GIT};protocol=git;subpath=libopie2 \
+           file://gcc45_opiemm_include.patch \
            file://include.pro"
 
 # FIXME remove this!
-- 
1.7.2.5



