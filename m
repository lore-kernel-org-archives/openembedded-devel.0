Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1ScIC8-00049t-Tr for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:30:49 +0200
Received: by ghbz2 with SMTP id z2so6247653ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=SImNdRY6M+uVk7/UpcFk0SF8pwLzHY4e+EFoMel2bVc=;
	b=NKfrhOOUIV/aAm0+Tkd41m2ro8ETh0fyLBnBUny4iyIXDAl7quzSwZTplM96NqvgaD
	hdogi7IRhPO5ztOs/fJlbdDocJTLgqT33UziIpcuy/cHFVhs79Mx/FHM/7GcnP/3l231
	rwzlFUT8OYvgE114iCYQBsra2O0+73aRVfSbiaKRd1u7b5WkW5c/Ii9XQZQAyCS62cpn
	clPJYeoHWs/V/uFeQXwLuPUbzukt3CwDiNgFoRcny76yl7pPiPEY9YwgsiwMl5seR9H1
	YLGda7Z9oH8yBgmu9HnioN5q46S8rkt2uOlFnKGVTGp0RLjtteG8uTbCF9bAzuukNZip
	N+Fw==
Received: by 10.100.213.19 with SMTP id l19mr4051437ang.19.1338996021201;
	Wed, 06 Jun 2012 08:20:21 -0700 (PDT)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPS id v16sm186559anh.22.2012.06.06.08.20.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:20:20 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jun 2012 11:20:04 -0400
Message-Id: <1338996004-32583-2-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
References: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Gm-Message-State: ALoCoQmGSjvnLwHZQdmqD9z8TaA9tN8/oYswmNhmuXcfwD5C4tLc6SX6Vq7UHTYN+q8H/6UnX0Fx
Subject: [meta-oe][PATCH v2 2/2] python-numpy : Correct difflib dependency.
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
X-List-Received-Date: Wed, 06 Jun 2012 15:30:49 -0000

The previous patch had python-diffutils when it should have been
python-difflib.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index bae624e..702f224 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -26,6 +26,6 @@ SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
 SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
 
 RDEPENDS_${PN} = "python-unittest \
-                  python-diffutils \
+                  python-difflib \
                   python-pprint \
                  "
-- 
1.7.9.5



