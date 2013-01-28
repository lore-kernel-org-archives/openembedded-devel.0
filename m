Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmKJ-0002aU-2M
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:52:36 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so1263995wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=PlG0d+nu3Lw2dLMIf7Mx4bEjlF4QpS6AmBy6pXRIIcM=;
	b=HkdjCQ9lyaCqm8wO918N/1Yp18aHNeu8Cv2Ka2JAZyyjAyR3mVVwXiwd6/rbqEx/hu
	LaQDah5CdInbyIHNXcgnFIJzazKbnz48FWCPbNIYqSb8WSuaxAtj6TuqGXTMHC5kbNal
	WRWrmsn3m89tZ/i0O13pRFpoam3vHRa3uIyS+HjO354E10Ih/B/VexhrFU+Y492nnWen
	0ulfefdgzOv2xh4MdmelNbStsnpM2bgokNR4Ozj7NT9obaZiS6dMY/EQO59w+3iDY70A
	HN9lmPFCXAVi3wcfWpnNagLQbX1slM3tc+r1KvtlHFVEWIUzdjrjW4WuW9gywllm+Umi
	RBbA==
X-Received: by 10.180.33.202 with SMTP id t10mr8891410wii.3.1359369417098;
	Mon, 28 Jan 2013 02:36:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eo10sm12722275wib.9.2013.01.28.02.36.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:36:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 11:36:58 +0100
Message-Id: <1359369418-19184-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH][meta-oe] mm-common: inherit gnomebase instead of gnome
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
X-List-Received-Date: Mon, 28 Jan 2013 10:52:37 -0000

* gnomebase is enough and gnome pulls a lot of extra dependencies

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
index 79da497..c49b4c8 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
@@ -1,4 +1,4 @@
-inherit gnome
+inherit gnomebase
 
 SRC_URI[archive.md5sum] = "4a4dad67fc8d7e0c529f3a8c6ba4d8b2"
 SRC_URI[archive.sha256sum] = "9c602dba89d264a4719db996b9b169716df2d4d10bcd24e56fc3572865a5cb8b"
-- 
1.8.1.1



