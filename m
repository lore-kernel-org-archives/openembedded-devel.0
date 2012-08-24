Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T4rl5-0005IQ-8K
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 13:08:59 +0200
Received: by weyr6 with SMTP id r6so923332wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=l2eixNJfM1+HqRDuD7orjoGizlScRKMhGTR/+C/jXDE=;
	b=zzw6i5mepsI/0VqfKAYplnaE0ahVQMtZY3VDrHWpIfUq8GUPHVa9HFXPU1NNPqo9bQ
	0EpRcu9I7F9IacjsCADSYTUTLAT8pS2GG8nGjBrdMQul1Y1edkwCttMXWBybmb+nrhJ7
	rux6s+Zz+MSMUwZeEV/vqdfEozvYfz5petk7l8TphOJJLp5xgPFX3LoqMcUw6PEbTLN7
	Lknop0GFOExWPpd6/pw/GYXjaaxVfvxRw/K/UjIVtqYZiGzQ97gZife94IeKGbGjzsxB
	gKslRrnvIbmWQ5o0Cva0fzhw6xXiGqOb59j4TM51J6W7jTZVh+FslX5Gq/0rmDYRQlrn
	MT/w==
Received: by 10.180.78.4 with SMTP id x4mr4605530wiw.19.1345805811660;
	Fri, 24 Aug 2012 03:56:51 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-95-222-156-96.unitymediagroup.de. [95.222.156.96])
	by mx.google.com with ESMTPS id dv1sm5712174wib.10.2012.08.24.03.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 03:56:50 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2012 12:56:26 +0200
Message-Id: <1345805787-6819-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Fri, 24 Aug 2012 11:08:59 -0000

This fixes "ERROR: Multiple .bb files are due to be built which each provide jpeg"

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index dd81606..ec25874 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -15,6 +15,7 @@ S = "${WORKDIR}/trunk"
 
 # Drop-in replacement for jpeg
 PROVIDES = "jpeg"
+RPROVIDES_${PN} = "jpeg"
 
 inherit autotools pkgconfig
 
-- 
1.7.9.5



