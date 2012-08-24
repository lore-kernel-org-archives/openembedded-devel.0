Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T4rnQ-0005St-Dq
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 13:11:24 +0200
Received: by wgbdr1 with SMTP id dr1so1123560wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=l2eixNJfM1+HqRDuD7orjoGizlScRKMhGTR/+C/jXDE=;
	b=Xnrk//WEaWohu3Xv3dDyjGgr3czriHPBgATk8QJfpcHm1FQAe9RV4caUhVbP4Tr/KL
	ikK0UftY1wRl2hIduzV4UQ4iYCRgmvKxjWtR7U/gAjo37I6TL58DQZbw7RFeMV5w6krL
	0xQ+VdzkUeuSWzT2bYj7yVhM1ohffW6c63R/5LC8cF9Hutn6k8gw+2suSz6UhyGJPOFt
	VWEhYk4f3IWpkJ8GCxvj9UVyuSU78DXZDc4HQGvJK3EkVyIpEyyvCKUSgHJWYcRl1C/I
	ShkveUVa7VHSJFf1g9qLrHLojwXvbEMAtokN5I6LzcQRGIoeAutwKCXx7zRIfRMvDpFX
	rYRw==
Received: by 10.216.143.158 with SMTP id l30mr2601985wej.113.1345805957209;
	Fri, 24 Aug 2012 03:59:17 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-95-222-156-96.unitymediagroup.de. [95.222.156.96])
	by mx.google.com with ESMTPS id dv1sm5712174wib.10.2012.08.24.03.59.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 03:59:16 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2012 12:56:27 +0200
Message-Id: <1345805787-6819-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345805787-6819-1-git-send-email-s.stirtzel@googlemail.com>
References: <1345805787-6819-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [meta-oe][PATCH] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Fri, 24 Aug 2012 11:11:24 -0000

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



