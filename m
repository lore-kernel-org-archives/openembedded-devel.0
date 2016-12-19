Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDCF77250
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:09:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so18508982wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o98z1se/0K7kMnOVDovPaRpgwGvK4o5qDMjCznia7UI=;
	b=iohk3+SnQYkzO9/Nr64xWhwHA2xbR/czvHHa9WgIz28gI/fBWzdP0/2HEx82o+YToU
	JmrgtkJJAk3j7nA8pakEXesEa7z7d/49aratPJcyALTWMQniVli4wy7L42m65xXN4T2U
	2L9nkJAOLJA0D/DW8TyG1foZrMOPmhSvW3kEWus76i7KciaV9F4jL1vggyfPVz8RVsK8
	rQlZctEDkbVxVYWkz3PU1TyeHfRa7RWJT6saB9dHG1bA8O5grtJHgy8DfsT8AO1SbG8p
	FO+HQ0NH2w54K159HNQW0d0fGX96MzCUyQ08T4RHnnWL4h1+No0S4feYX1uvxtd5lWkN
	q1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o98z1se/0K7kMnOVDovPaRpgwGvK4o5qDMjCznia7UI=;
	b=Q4qlDCvvRWMp6jjjyMwJmGjR/vC22I73+5+svNnIPVuQRIhILtUnnU7FFZx2S8QTWO
	L54y0rsUuDWEvL3lLySfOXOjgwssQshKNSlmmLw2onN7ukjFXBHNh4zOeHEBtiARugd3
	ko4bji4s4PUmZE/16jgcMHBJHPejZI9X32x63Msa1a9M3MB0Ea3TzSjkgBBE+itmCAGZ
	Ot7yLRHzpnz5YP2JwhbxKuzSQM4LEzS92asMQnljJ/xGz31t0EGhCQZ/YGB0GiSPzdzz
	izIAHoex3esdf+8VexbWcLqDjd3dDA4PI/+5ujovGrqiXQgQ2IDffbbaENcz4si1gCoO
	UQCw==
X-Gm-Message-State: AIkVDXISelG2rslsYdOMX19LNxgbl6TfEWljaptfKifn2aL2bL6/2sW//fk0YucFvRzB/w==
X-Received: by 10.28.98.66 with SMTP id w63mr14832492wmb.142.1482152997766;
	Mon, 19 Dec 2016 05:09:57 -0800 (PST)
Received: from localhost.localdomain
	(ip-217-103-177-37.ip.prioritytelecom.net. [217.103.177.37])
	by smtp.gmail.com with ESMTPSA id
	bf2sm20479100wjc.48.2016.12.19.05.09.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Dec 2016 05:09:57 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2016 05:09:49 -0800
Message-Id: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libconfig: add support for libconfig-native
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
X-List-Received-Date: Mon, 19 Dec 2016 13:09:57 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
index fb6e50e..94daa88 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
@@ -12,3 +12,5 @@ inherit autotools-brokensep pkgconfig
 
 SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
 SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


