Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B0A3371AB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 15:16:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 6so2342831wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XU8/DvKDJHuUc8D+smnPUQ1N8qGM8ivjtBjtPAtlxRU=;
	b=E5oLQUthB9MWxpDikC1G4PhmipfIAzKdVCB/QXiMRtcueTpqkFSbguLodVhEw5hxm+
	4Fwayoi5E/22R+99cnr+u5TCYBZW+lBUVMZjA++l3YoHfVWhSsbLzGIpCMpLYiYt8vGS
	4caVFWi7d14c1TCf+fiKCs7XbAGf/FsodUyNfc6T9azsUHE1clLwEFNy/rSQBzq83x+u
	VtCB6cK7BpieiTF4Z2vbxdND0CV+bJ4CBc09V9aPRuGoXzPwrc98mAWAfFkuFQGs8J9i
	+Cmjl5nN+I4NIg9h8bu0sVMtW0UB3bZD3cioB83kMstAH9w/383sSxGRsELIXiWME8eF
	/erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XU8/DvKDJHuUc8D+smnPUQ1N8qGM8ivjtBjtPAtlxRU=;
	b=JIg0FA4+UQGcQD24VeKKhUGCBQpIJ3tGYwjG+ifARtHqU48vuj8di2WadGzAkauy9s
	lEQOLKllfC7mtPjKSMS4+kNaX9mcnHqjjDw1utKgPnY+tzXTSAycCy0Hw112UlkVuTts
	lcrL4rXy9GJDjYS/yxg/GuY5aG4iKeDUiwnYpcEy1BYn40dxetd4vwBPPImdcfx1rRDz
	0UFxrN4dawkUWqv9a9i/gbDy9Ea3z3SVQCsdEfZTTUZ25NvW2vYWWBC985VK5E8tP6Bn
	shhjkas0oeYuE3gsTMlwc2ok6OU4TO1g1FsOyNLMFtDJKF8zWPQxM9hz1pVArv3Kvfgf
	KnQA==
X-Gm-Message-State: AODbwcC2PsJGJyPP9Rq+xneLSZGpI6TVz46hGUDSFlVOL8jaYwYMbxTl
	F2iHaotJB6ChNA==
X-Received: by 10.223.151.6 with SMTP id r6mr2726552wrb.189.1495034192242;
	Wed, 17 May 2017 08:16:32 -0700 (PDT)
Received: from localhost.localdomain ([37.159.50.168])
	by smtp.gmail.com with ESMTPSA id q16sm3374094wmg.2.2017.05.17.08.16.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 May 2017 08:16:31 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 May 2017 17:16:27 +0200
Message-Id: <1495034188-28333-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [PATCH] wvdial: inherit pkgconfig Missing pkgconfig does not let build the package.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 May 2017 15:16:36 -0000

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

---
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index f7adf4c..3a71fb9 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "WvDial is a program that makes it easy to connect your Linux work
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
+inherit pkgconfig
+
 DEPENDS = "wvstreams"
 RDEPENDS_${PN} = "ppp"
 
-- 
2.7.4


