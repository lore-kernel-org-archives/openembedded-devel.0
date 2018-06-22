Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 86E32771A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 00:37:10 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 69-v6so493425wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 17:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QRw6BRQiNG7njjSB0mFK/dWx+ydrR5dznknC2G/lnYY=;
	b=DH+A5QYJI/wb/esUAbTWMY9QsvyAsOLB4W86C/Fiw/j65BENvluaMnm6HPiOYRsn1Z
	g7IX0JNUNE7nGaqUy9XG9zm2H+Uu1E6ZCLauBfizkOAN4MHH+rO+mlDP9rUxU4TdLVZ1
	ztzzYAlJyJKsk4WLxkrXfwA2IzGn4QSfaaNp4R3Ts3QGFYlHqpxQ3TsDeu2APJpz/bbc
	hLSLMq/NJY1UEmISq4DRG/UMZfpz5Pkl8Z1ZaRnpTLO8OUpqoOUfg1i8dMN+DngGMF20
	uCzVfMnVwjRz6jn7T3Sw+jBrDliT2wWjrVbqkDFBkvp9uBahzS+RczeDX8RkBPhoF7pp
	lSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QRw6BRQiNG7njjSB0mFK/dWx+ydrR5dznknC2G/lnYY=;
	b=lByzuG1KySHbxAzGaoE6vJgcyIPhef2x5SYOI62oDRd8PROh6IXPxrlOw46ydR2FLv
	RLp5SCykyMxvQWvaLSr/UKtF4VvQ+mfDhWQB39o5mhYg43616QaP1e6qQlPOa32lAdWi
	bCXnCHGJjDDjOW8453R7l9w8fVCgvFEvUkoIFeOqx4hUXzVoS5nfp6NW7kyfdvRSnNxT
	fE08OLLrlHTKYYLuA3e0fNQho5YoMizoa5KECzmp2mQ3hhjEMpTW0rZb5K0JH7qHx9Xu
	9/Yv9AYBw+ZxCCccUw3Fmby39vXZZ6ZkWNm8ruIltb7VMODlKxEy0orCM4hkbUnEg+HL
	YQnA==
X-Gm-Message-State: APt69E0gSWB3bZWJowrNvjScsE+Mp5SxKvyF5EFh26EEJFxU9nO+Bfu1
	UUB3yIKgfj5REfcgG1mshztgqQ==
X-Google-Smtp-Source: ADUXVKK/Vs4SJPQArM55sOJ1DTopcE+4FKSlg/b1R2puniGS+R3zerLv06qtdYVxnFJk5jZ9kZAbig==
X-Received: by 2002:a1c:9947:: with SMTP id
	b68-v6mr6492642wme.159.1529627831165; 
	Thu, 21 Jun 2018 17:37:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s13-v6sm6376692wrq.48.2018.06.21.17.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jun 2018 17:37:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2018 00:37:09 +0000
Message-Id: <20180622003709.22945-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][krogoth][meta-qt5] qtbase: don't use thumb for armv[45]
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
X-List-Received-Date: Fri, 22 Jun 2018 00:37:10 -0000

* it fails when building with gcc8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 01e5026..0d6d6da 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -149,6 +149,11 @@ Prefix=..
 EOF
 }
 
+# Causes qdrawhelper.s: Error: unaligned opcodes detected in executable segment
+# when building qtbase/5.6.3+gitAUTOINC+e6f8b072d2-r0/git/src/gui/painting/qdrawhelper.cpp
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 # qtbase is exception, we need to use mkspecs from ${S}
 QMAKE_MKSPEC_PATH = "${B}"
 
-- 
2.17.1


