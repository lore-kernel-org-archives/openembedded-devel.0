Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5FB7F822
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:39:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u18so3701547wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kp6tFooxNFLqfT1l5g665A2RMeMOSp324Nr0tWODM9E=;
	b=ccxVfPutifaYNZNWaCY1FfNFyDz+8mBo9E4+vI7ci/hWg/RnvhZNuD9H1c2s4Sejs3
	Ln3/TBGMouZ2bXX6jFfoDptZnsIuojHV8zGCw7TCfAL3RPkv7oh1sgerdVZL5JAhbPVj
	bdqibQvjHHJfIpTjERv+ppp4/dGG2qAH9inB7u80oldvP90OxdBH2AJeiZ7ma6Aq/Vty
	iGJ6DvCKeAoe1QY1lqghgeXEkpG/2yBi6vnWZRD6hfq3KzM9k3hjMZRCwpsLRri0A6pf
	OXgUEgzOS/bTXumIyWyGDJI2j0rQosSLdl7AYsRGb8G9TL/3qoX9/Y9DoEn2ogXWR7BP
	1jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kp6tFooxNFLqfT1l5g665A2RMeMOSp324Nr0tWODM9E=;
	b=N2y23Ha2U1dphD5vj8jYHJ2sqU1gFRGee0FV5DlCANEE+1C6LlrvxUDkz5DU18eX2g
	X3vavvzQcbpwDGzx4NKaVDdMjZ7LytSjkH+2+oZMstj+y2EkhTezryXi6+xN4hOwYrGR
	b+9lZVHJ0ByQ3uylqmW9M4Jj6aMUpvUFUmwmQppqSXiTVv+blx6lt79Uzb3dAJoYU/4b
	TZpFlJsmSiF392MYP2vsQIL/b8PPXW21f3zLIQAgIAt9lOOY1HGIHM3/mw1hL4fHHMg6
	PfIWZrxxIT0ymvsDwCTmmGJeMkHy+UyLf3+4gF2fDdIC9WUkePs5EgleY5OoNYk3QdlX
	XZwQ==
X-Gm-Message-State: APjAAAWA+oiPJXCgf7EmzvDaBS9F65jeOcUEwkUwZB7gz1Go9E50picP
	6WEtHeZtfZHdKLo1SRA0teQE9av+YKg=
X-Google-Smtp-Source: APXvYqzcc9qAbvsWR8uyV5/HbMBTV/kJMKNKZmo8nHXCwFNNh1ORdzb0DsjdxtLr0zMAEgfuyKWEMQ==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr6715690wmi.114.1574177997870; 
	Tue, 19 Nov 2019 07:39:57 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 76sm3622102wma.0.2019.11.19.07.39.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 07:39:57 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 15:39:45 +0000
Message-Id: <20191119153944.2192-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-contextlib2: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Tue, 19 Nov 2019 15:39:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-python/recipes-devtools/python/python-contextlib2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-contextlib2.inc b/meta-python/recipes-devtools/python/python-contextlib2.inc
index 50c93e943..750721f3d 100644
--- a/meta-python/recipes-devtools/python/python-contextlib2.inc
+++ b/meta-python/recipes-devtools/python/python-contextlib2.inc
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
 
 SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
 SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.20.1


