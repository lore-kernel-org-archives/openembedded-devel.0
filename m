Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SasVJ-0006rg-Fi
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 19:52:45 +0200
Received: by vcbfl15 with SMTP id fl15so2071347vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ccWsPetthyqZ67l+Ca8inekCx/7JWZ8hcycTWRUN8YU=;
	b=Aum3DU/9CR38RTFTtnd+HNUGAX0SD+qaa+dRL/2JQ8dqjPbWab4rHgHE5aTem/pTdp
	m6W+ZIk96LgmVetMEBuyviBClO7A6wfW+qHe+X0Kr4M9ZilGcg15XBkJNeEDlAuaJVWc
	LrGYHpYy4EWgFa28zr0lpPFk0hpQ2UN9asp52vGf8UZZ8l7xtSn+llmC97Tk9RdPfc1I
	cVb5NbfHj5aPJNlHnqn3V6+nODBIQsZegYDvuBVRC5qx1pg5H9XvMaw+bdY6le9T54RZ
	Rl/MWnoHwwfC+zC/K/e2Ma8foHKPWLPnaVKBOEiO72VvIXtLxhUR3wzvhlK5RVwJxMuQ
	TNZQ==
Received: by 10.220.214.148 with SMTP id ha20mr6942075vcb.5.1338658942759;
	Sat, 02 Jun 2012 10:42:22 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id bj6sm8849957vdc.12.2012.06.02.10.42.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 10:42:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:42:13 -0300
Message-Id: <7ee2ae23865369b7ddbea7658b60d5495b030057.1338658900.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1338658900.git.otavio@ossystems.com.br>
References: <cover.1338658900.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1338658900.git.otavio@ossystems.com.br>
References: <cover.1338658900.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/2] owfs: update to 2.8p15
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
X-List-Received-Date: Sat, 02 Jun 2012 17:52:45 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../owfs/{owfs_2.8p14.bb => owfs_2.8p15.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/owfs/{owfs_2.8p14.bb => owfs_2.8p15.bb} (94%)

diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p14.bb b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
similarity index 94%
rename from meta-oe/recipes-extended/owfs/owfs_2.8p14.bb
rename to meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
index 1acdcf9..451aaae 100644
--- a/meta-oe/recipes-extended/owfs/owfs_2.8p14.bb
+++ b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
@@ -11,8 +11,8 @@ DEPENDS = "fuse virtual/libusb0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
            file://owhttpd \
            file://owserver "
-SRC_URI[md5sum] = "cd213fd9bbfed95cca2c833c0f14dd72"
-SRC_URI[sha256sum] = "88b6ee5e7e4d3fe6f4faf021948236162219cf5d1ff4bf3844e62e6ae2635b23"
+SRC_URI[md5sum] = "24ec3d04ded1b199831f03e70d9e2f1f"
+SRC_URI[sha256sum] = "5bbc4ff01865e114f52ef75fd7dd3a5ee52b9ad6841504cc6155a353c516ed87"
 
 inherit autotools update-rc.d
 
-- 
1.7.2.5



