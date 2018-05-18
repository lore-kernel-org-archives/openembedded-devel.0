Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC7474BBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:16 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id a14-v6so2937215pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j6xolWBbbO8Q0Y9PkWd77p/bTPzc71Z0U31klRmAb3Y=;
	b=Sf0gHlus3XpJNWCzKujiET4hh0836BfL9QnBd6QW2O2fJKqZnzyuqhhaNqEK2ltN7s
	ZKSPp/232u/McETIjNLegnLghsyziMpbuFsA6sATVfolCYnswRoKyglH57FGGOgx+mXp
	zg9xOuBll39iYNY92VmOPa8kDdslAUzpTfPZUhU2ArNevItQosnLw9fGmadPwgrsAqeS
	VtsZY8LOLTrZNeqpipnFYNLzyvOh/9krdisu1rpBQNMMg1JTDfbTTQFUkMtppmnclkg+
	Tr4pn5G/5tmqzASqQ/CcdN7cU0eq8M1XQfUVTWby1spyXiS7KVB6/Lo3+aKOHkNHQgKg
	mJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j6xolWBbbO8Q0Y9PkWd77p/bTPzc71Z0U31klRmAb3Y=;
	b=qkUsqGIO9SN+wN7/9P55UKpPgwNGn+l8T4W45aSeJz72JkoYZgiVMPdg7dfv53OMG7
	6UG6nBbMU+OQTvytSDRAZS9ikeGaE3TskMtq4a+Kob19M7QPW0F43Ew+CIhBbKpqhyHs
	cwbe1xOTL2xn3RfWPgS0F77QMQ2jLRsOS+gVi1bbcz71SerXIzNgX37Pe9lWdiLssbWK
	Lfk01N7SViZ7XhuaTXuzVHVl+TNA3yEU4R4lVe78KQ4Uj4XUna670zS10RuePpSQm+jG
	ptzIjIK3AopwOSafOu8ZMTt/sR4gBAiOMOs1NiCgEgyzSW3POUj6lu/CAuD9O1D8Obw+
	dEGw==
X-Gm-Message-State: ALKqPwfpbQtwHJz92EIm3M5XIqvCI6WmQKtBqnI1N8RqrTrt4ZWgv2KU
	Cme3xVeXWeoue/+zswlqraAphQ==
X-Google-Smtp-Source: AB8JxZozQE37T1VNtQBa8HaZAgaLlLJMfFMaU5UOrSTpCNthOWhV3/IMxYo6Y7CXD50DXeR/6Nt88A==
X-Received: by 2002:a62:dc4e:: with SMTP id
	t75-v6mr7268918pfg.139.1526607078051; 
	Thu, 17 May 2018 18:31:18 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:39 -0700
Message-Id: <1526607046-8081-10-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 10/17] glm: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:17 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
index 4e2ee23..7f16708 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
@@ -4,9 +4,7 @@ mathematics library for graphics software based on the OpenGL \
 Shading Language (GLSL) specifications."
 HOMEPAGE = "https://glm.g-truc.net"
 BUGTRACKER = "https://github.com/g-truc/glm/issues"
-
 SECTION = "libs"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29edccf97b93e72b790"
 
@@ -16,13 +14,13 @@ SRC_URI = " \
     file://0002-glm-install-headers-only.patch \
 "
 SRCREV = "fcbedf5058ef8613dd02aac62ef00d55dcfeadd7"
+
 S = "${WORKDIR}/git"
 
 inherit cmake
 
 EXTRA_OECMAKE = "-DGLM_ENABLE_EXPERIMENTAL=ON"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native"
-- 
1.9.1


