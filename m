Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 338BF745D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:25:45 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t25-v6so825792wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZVfYfqQVUMI9rwLanXUK7qylhD/sMwu20Vq8wxX3MC8=;
	b=iZyIY5+tt1FkDE/R80T+Um7qVhNMmp88iJumK7FnpHr7Cv7BbRtb1V9LqtgtCdwAAv
	DACWSIuz/eOiNMMncpWjasVgzhbVymcryJmATuziqse9q8e+96oLE7CEtsAS7XCrrfKc
	ukoKkQQI36eS1UaQM+JaGL00qfBCDT9cyrDAIyCo8qkOsauUkuB81yRwdYk5v2aRSM2S
	sapARfycHxe+SQGJA+1zWOEfVBO+duehzLHBM26fFB6moXho76s4WDejXd7OthZIM25M
	r3ZmAT9l6mMZNCMB0NuSgGO5G9UD9CZttX3a3NCM5VWTF5GOCVgyeHSGYT9caVBRx4t+
	vqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZVfYfqQVUMI9rwLanXUK7qylhD/sMwu20Vq8wxX3MC8=;
	b=edLOuwgTjwPB0Fx7KjNBXuaoaK0R2171mGQu8793LnJEZkDCRJvWHFeE+R1lz/St4U
	u5WhCQFmhFkDsxFkSVdNyZ0x07LkqaRnk6AZlph97yIbt0uujFdLyNhkI48dOE54/NC+
	IyCkqYUAR14sfwEF9SbHB889PHpxbdMZNjiIaMuFEMQ6fJZj5tp00HkYnFbAeqVf18No
	P69GfU/NtRfB1xrPWDW65W9D7BWOocGijN1sXcx+fyHQtjzarWWY3qaSWGqRn3fwDTXp
	Drn4XpxQi85UlHE5guN84olysB6KOkcnQ6uRQiJsV9EXRNJGPfw7opPXz/i9oSJjyeu+
	6JRw==
X-Gm-Message-State: APzg51CEzeOtTSJD1CMT9zX2yYFa7MlfCProOsyqSs3gub52yMbCTuzP
	dS/6LEnzv38OH9ECx4wYfv7pEtVKjpw=
X-Google-Smtp-Source: ANB0VdbQZBvrU/liVMYlk1EarPY0H7cjHKOGsFPQ/guvCdh5MeD+xkTKrj+VFTBL1mmpR+H2Uw1SSQ==
X-Received: by 2002:a1c:b49:: with SMTP id 70-v6mr514600wml.149.1535441145690; 
	Tue, 28 Aug 2018 00:25:45 -0700 (PDT)
Received: from localhost.localdomain ([80.215.36.164])
	by smtp.gmail.com with ESMTPSA id
	j44-v6sm825491wre.40.2018.08.28.00.25.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 00:25:45 -0700 (PDT)
From: vincent.prince.fr@gmail.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue, 28 Aug 2018 09:24:50 +0200
Message-Id: <1535441090-18418-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe][sumo][PATCH v2] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Tue, 28 Aug 2018 07:25:45 -0000

From: Junil Kim <logyourself@gmail.com>

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index abe015d..f4033f7 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -15,7 +15,7 @@ SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
-- 
2.7.4


