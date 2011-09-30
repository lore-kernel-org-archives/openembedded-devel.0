Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9ckJ-0007eY-CZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:03:19 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SuH2+LdADKIYF+gra6YuZSSU/zlKc8DdXiLsFH8oqwA=;
	b=sekKSEhfcRFCw9sh5cvds6GEPsgldXc0EiNziW4hDXI66BLfcoGVD6shi7a/HucK4m
	kd7WYCNbC+SzofPSSGKyEjQpJXp7VSXxiDw64pqK8N6IqMb2ucVFQTrz19Ywlsy7Da1n
	oPJJOaJyhXfaB96ufhvIIldewDtbXyJtIwH3o=
Received: by 10.204.132.193 with SMTP id c1mr8174680bkt.101.1317387472860;
	Fri, 30 Sep 2011 05:57:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m18sm4875566bkt.12.2011.09.30.05.57.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:57:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:43 +0200
Message-Id: <03ccaa2f1593940cec8932d53a4bcbe6d47674e6.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 07/15] e-wm: include /usr/lib/enlightenment/modules/wizard/favorites/.order in FILES+${PN}
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
X-List-Received-Date: Fri, 30 Sep 2011 13:03:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 55c9874..a4fb5b4 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -100,6 +100,7 @@ FILES_${PN} = "\
   ${libdir}/enlightenment/utils/* \
   ${libdir}/enlightenment/modules/*/*.* \
   ${libdir}/enlightenment/modules/*/*/* \
+  ${libdir}/enlightenment/modules/*/*/.order \
   ${libdir}/enlightenment/*plugins/*/*/* \
   ${libdir}/enlightenment/preload/e_precache.so \
   ${datadir}/enlightenment/data/icons \
-- 
1.7.6.1



