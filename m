Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D376D7D8EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 20:34:08 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y3so7827108plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=yXIxIVh5MXSj/jZSSp7QcfWrAGPJJi4gSc5L1HJtBrg=;
	b=aZfL15W1OF91ZNMOuSZvAA6xVKoVjWXchCiRDndNs3sculN+/MKRigehg++jYtNH3K
	UzjKaQUiUpOQfjU9xw3iJnwxvFUfivfUdofI9ie+d7x0x6oO0xvu+H4pJjHASNbMAAgu
	H28vm9kBloyRgU1lH9bafoACOsesK7JqoEQpEWig+DA2jKie9fYwDSIIc1z3/1RS4Hzs
	ZAlDmr7QWFOTpcWj7QQCU38g6juXJqKsYmEXvYfzWbxroX1ujCIfzF60oqgHbvFJLUk/
	l4I5feYlxDjbXCnW7ZA/lZmoCvyOb77v7BYOYBndm79Robz85+4YLqemW1RXX6C5MRhI
	hAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yXIxIVh5MXSj/jZSSp7QcfWrAGPJJi4gSc5L1HJtBrg=;
	b=l++O8sfArMjphijTVR27Z8uGnWrAd502wuey6HZJgi0kABXdRPOPATl/Rhw3YZ/cJB
	yK+2LnZe4nIuJjGM8MfBUDKMzhXQ9+Uv3Qwk/2zt5UHPPqYHNCWgJScRsHH5T/t1F7yO
	i8dGawj6L2MV62YFKUigMBAlWvb9VxCajSXW8U4oCQ/ppn5rZC3/yw6JrS9XxKAOLjN6
	k0rW03k4kP9T49vryOUvD/92DCNua3mxVaeD9jN3hO/xcYoknUxXYmVDoShip/OeS1A7
	7A96+CIWigUa6TO8IO/R5T1eEFbLYoJaR4iWzmu4/84q0n9UImCSbtFHOmVKSJ4U2l5c
	QblA==
X-Gm-Message-State: APjAAAU3hrcWVJLaIakxSLk/Et2o0v3/2HijVWAzGW3hYq2gbRvbUWSS
	D1tBvpIImT1cMnn8YM+xuJLZTqyE
X-Google-Smtp-Source: APXvYqzN2/5dEMOuPA/u9wos+PyB+nCS+EaS7l3VkSmzaKJdAPbVo4lR7nuQAyc4IPt0zzdfMMHeXg==
X-Received: by 2002:a17:902:141:: with SMTP id
	59mr78683726plb.132.1556742849882; 
	Wed, 01 May 2019 13:34:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8977:bf2:211e:20be])
	by smtp.gmail.com with ESMTPSA id
	x6sm21091959pfm.114.2019.05.01.13.34.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 May 2019 13:34:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 13:34:08 -0700
Message-Id: <1556742848-24453-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] meta-filesystems: drop bitbake from README
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
X-List-Received-Date: Wed, 01 May 2019 20:34:08 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/README | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-filesystems/README b/meta-filesystems/README
index 87cb685..edcf8bf 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -9,9 +9,6 @@ Dependencies
 
 This layer depends on:
 
-  URI: git://git.openembedded.org/bitbake
-  branch: master
-
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
   branch: master
-- 
2.7.4


