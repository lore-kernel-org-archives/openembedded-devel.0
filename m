Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PAhpN-0003VK-GQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 13:36:30 +0200
Received: by fxm3 with SMTP id 3so4230148fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4o3ngmrcVQvEj418Xh4ssA6CbVGpdvfpEURC5HUedyU=;
	b=TiayOAeLoiGvN/5rWnmT78kolEmgBEiVmZLxnQGv+p8Jth6n/ofSwAgk1gmcGmSqhA
	3x8F07KoI6y6CoBIpUcSnzXAMrMR+lSHyBn2zBDggFhrBCm64tJARlDbwPvUKH1IzFKh
	Op6KUmUkOc7xPkcXCkX/X2ABFM9k+Q4p+DAUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=A5rhFoTCHBVaBojAWUrflXQLT2sCddjqgqlv/ny8ZMjiGzltyBm3bPZy8EGBKdq9GY
	nc+vHdGf7nEpNHSM93MRJ/VXkzcwQWSGQ4KBqUN4wO0OrR3vDay5FtWeSZaKnyixBowf
	chX7CW/f+jc2MwV0HK/FSxnMLoq2dbSm5ISPk=
Received: by 10.223.119.77 with SMTP id y13mr712046faq.108.1288092944456;
	Tue, 26 Oct 2010 04:35:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 10sm3463001fax.42.2010.10.26.04.35.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 26 Oct 2010 04:35:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Oct 2010 13:35:41 +0200
Message-Id: <1288092942-5827-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <20101026112551.GD3514@jama>
References: <20101026112551.GD3514@jama>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] autotools, base, vala: don't define DEPENDS with _virtclass overrides
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
X-List-Received-Date: Tue, 26 Oct 2010 11:36:30 -0000

* native and nativesdk are handling DEPENDS from target recipe if there
  is no DEPENDS_virtclass-native(sdk) defined
* this breaks recipes where is DEPENDS_virtclass-native(sdk) defined to
  override common DEPENDS but without ie autotools dependencies

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/autotools.bbclass |    2 --
 classes/base.bbclass      |    3 ---
 classes/vala.bbclass      |    1 -
 3 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 2c27d0f..a13c3d0 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -25,8 +25,6 @@ def autotools_deps(d):
 EXTRA_OEMAKE = ""
 
 DEPENDS_prepend = "${@autotools_deps(d)}"
-DEPENDS_virtclass-native_prepend = "${@autotools_deps(d)}"
-DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d)}"
 
 inherit siteinfo
 
diff --git a/classes/base.bbclass b/classes/base.bbclass
index d4d8257..4473edd 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -81,9 +81,6 @@ def base_deps(d):
 	return deps
 
 DEPENDS_prepend="${@base_deps(d)} "
-DEPENDS_virtclass-native_prepend="${@base_deps(d)} "
-DEPENDS_virtclass-nativesdk_prepend="${@base_deps(d)} "
-
 
 SCENEFUNCS += "base_scenefunction"
 
diff --git a/classes/vala.bbclass b/classes/vala.bbclass
index d4ba831..0ea68cb 100644
--- a/classes/vala.bbclass
+++ b/classes/vala.bbclass
@@ -3,7 +3,6 @@ PARALLEL_MAKE = ""
 
 # Vala needs vala-native
 DEPENDS += "vala-native"
-DEPENDS_virtclass-native += "vala-native"
 
 # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
 export STAGING_DATADIR
-- 
1.7.3.1



