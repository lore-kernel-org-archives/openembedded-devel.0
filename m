Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQEzp-00055F-Pa
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 12:12:33 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so1959714wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NJw+zBt4qiNZ9uI2/vuR0pFWorDl7L3pi2ht2/mtF5Y=;
	b=B4T2uri99SLrK4P/x7CUrpmG/2aq/l8T1sFP5P/I5R9OmQmnCsdgUXIj2HMHKGTQSc
	O9L1maktb+ufUAtfZn17f3Z1KhBHaR3ybVmLzTe6SbedFlI/6erpo8F/zNz9cMgZ7PON
	l17BRySsO5vLJ/5geed8RXWafJKaGF2fyRFMX2y4JcrBRF1XHsF5eePscSebNTQUIG5Z
	jJCteCNn8BdnfpOU6iC5mAqlkaN695Iz+x3Eo7zUU2k9Kal5STlaiONhtCapRqtMrZPs
	PlOZZT98yhS5ekAGmaL4LDEI9D3k+Ia+70C3FzrUb36Oa/KnvL0SPk7yn8ao8dUMHKHg
	akEA==
Received: by 10.216.207.199 with SMTP id n49mr5085977weo.136.1350899949243;
	Mon, 22 Oct 2012 02:59:09 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id cn6sm21061479wib.9.2012.10.22.02.59.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:59:08 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Oct 2012 11:59:00 +0200
Message-Id: <1350899940-2274-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 10:12:33 -0000

This fixes "ERROR: Multiple .bb files are due to be built which each provide jpeg"

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 2aefe1f..303bbae 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -15,6 +15,9 @@ S = "${WORKDIR}/trunk"
 
 # Drop-in replacement for jpeg
 PROVIDES = "jpeg"
+RPROVIDES_${PN} += "jpeg"
+RREPLACES_${PN} += "jpeg"
+RCONFLICTS_${PN} += "jpeg"
 
 inherit autotools pkgconfig
 
-- 
1.7.9.5



