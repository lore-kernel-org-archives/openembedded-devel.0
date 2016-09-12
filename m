Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 06263731FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 19:47:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z84so175516pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 12:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7cFxK0pNrRWTRTwaTerLZWXM/ko/qN5MW84s9S/cMVQ=;
	b=KvxSC/26zm6FVRoZmKWhe7YsIwWnFl6eun3uOo61ssZPsm/FMz8rjOfUoIu7rXmiHX
	DN+LR3AX6mSXUzYtzC8/8UoEg4oJytmKf6AdMgzFPqq/8mI0TVZOWST7/SjGU7/Igqoi
	reAPDmidVQFDgSK/OayVZtUEco+jZvUKLZZPToltpIIQuoDvBqaFy2iKRoiG7ZURkT8C
	9oRN4xG1SoloyIgWM49dgllK7mpsk3qr7vOExrQW5iQlB/fn55uZAwvSmwXRJ/bbPmgO
	nGVzdUVwLV78iPEEpwx3K97DiHe5G2ymHHXh0n7EclExpIgO4sIiSeG4sUJcE9xshp8f
	Xo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7cFxK0pNrRWTRTwaTerLZWXM/ko/qN5MW84s9S/cMVQ=;
	b=OAA+uhDULsdwGRBXrOcBO2AXPaBLhbtsxLw3LtEFebewzD1115eGroCfqfeA37kCxj
	QcicQV1RF8+Mmj3gcG9EXxYaaD8If89E/Sz1nAuGGqGQEx+lY4UxWvVIGRriV1Bd9M/F
	WrLeoWOoMgQbjWqhpp/sn+dsyHzU074GLuHx1TNAR+1fPzk95zN6Am4ELz/jbA58Rd6T
	YN91ILhGqAw+ozLWNIIaRttKhkHPHuiymApqGTqrXuP6Vc3b+1HStHlAW0/8GYGBRNzJ
	3COqK9Uvv1nYUMeI+kDzLQdmItx30XUQI3nQgx/E9iaMgmPuzZw1u0wtcQ9GH5NwlH4/
	KLjA==
X-Gm-Message-State: AE9vXwN280uE2nZCfeaRwJJwjapVctYZOWqjv3uONszNR1MzKS2fZBERDHqjFKe9uZgkRQ==
X-Received: by 10.98.131.142 with SMTP id h136mr26380832pfe.92.1473709666420; 
	Mon, 12 Sep 2016 12:47:46 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	q8sm26401324pac.32.2016.09.12.12.47.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 12:47:45 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2016 12:47:39 -0700
Message-Id: <1473709659-23717-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] minini: update SRC_URI with new download path
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
X-List-Received-Date: Mon, 12 Sep 2016 19:47:46 -0000

  https://code.google.com/archive/p/minini/downloads

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/minini/minini_1.2.b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb b/meta-oe/recipes-support/minini/minini_1.2.b.bb
index 6607dd8..4a73f12 100644
--- a/meta-oe/recipes-support/minini/minini_1.2.b.bb
+++ b/meta-oe/recipes-support/minini/minini_1.2.b.bb
@@ -14,7 +14,7 @@ HOMEPAGE = "https://code.google.com/p/minini/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb21481ad45c5578ae8c8d37b8c8d76d"
 
-SRC_URI = "http://minini.googlecode.com/files/minIni_12b.zip;subdir=${BP}"
+SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/minini/minIni_12b.zip;subdir=${BP}"
 
 SRC_URI[md5sum] = "32740621098e3f0a321c7c23f4bcbc5d"
 SRC_URI[sha256sum] = "b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2e888e2"
-- 
1.9.1


