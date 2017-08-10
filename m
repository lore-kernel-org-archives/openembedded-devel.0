Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3C971BF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 15:14:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r77so3412820wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jQH7H/lTPaqw/KIC6tpMv0GAgeOpKPOVBI99A0sUyGg=;
	b=qy0Q9NYz6GGKvXD65HKatD2xNJj3gDbJjtOVUub/5tyiFAsGbFos3DNBshtq6SVrjm
	lesIEVJE2r4tD4mAj0oK/CPiPEbC55XgxYKTtA7cIEgSIlOx6tsxsXZDfWQbqDwW4bPm
	Oxa6INXWUN6R5zYlEMPa1sW2RBYGO9inEQ3atnY948TyclStFx9+ZMz7LJ/pc6Be8/Dz
	vjVLtL/+7rzCmZLueil42DgVFweaI1NOieS3OUeFdJA8im5UvIFizXJXCu2S+TGlNqEi
	jBEsLOJ2+P+IiK8Rnf4tDoRiKJYqBPfMafpRtddPc6yTAsUEDUjX8JCkYkiGfszz+PAZ
	oLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jQH7H/lTPaqw/KIC6tpMv0GAgeOpKPOVBI99A0sUyGg=;
	b=d9yDVrxw9Tt6RDgjiKuCfyFGnvj3ikJoKBp96csA/y7cqHxAAa1RJE93f+nJ3q5lC6
	kBRWdiNCx1880vhK53Y7hEC3DErasL6c2ZfUT2G5nPCxHlWare16P5XYlLiWjPpgp2Cj
	vmB1EAJrViw9v1V0l6D+Y2hqRcE7Vf07LjSGDmHWrRvOwizS5t61pyL02XcW2RGfZ8Fs
	bjxOwAVJCXZLbH3VO0q4sFxVU+Wmi1Xu81ACkJ7sXcElBnPhdt0VKL0lkfTE6XXySKV+
	IFDBm0Ze1WEEiyFd0QfUYxFNDK3AYgC0XqyPNd0Z+p/AGYGJ1z0SkKMrdGbXkberkOzN
	xqWg==
X-Gm-Message-State: AHYfb5hGSDk+ywWDmUCcEp4oRafHVf7zf5tGqCstwNRRB4kxxsPYkaMj
	JcOH6penajcnZiF/
X-Received: by 10.80.143.226 with SMTP id y89mr12287379edy.85.1502378061506;
	Thu, 10 Aug 2017 08:14:21 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.240])
	by smtp.gmail.com with ESMTPSA id j6sm2984288edb.14.2017.08.10.08.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Aug 2017 08:14:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Aug 2017 17:12:15 +0200
Message-Id: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
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
X-List-Received-Date: Thu, 10 Aug 2017 15:14:21 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This fixes following errors when compiling with clang:
| ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to '__atomic_load_4'
| ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to '__atomic_compare_exchange_4'
| ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to '__atomic_fetch_sub_4'
| ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to '__atomic_fetch_add_4'

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index 53bbf7e..2f456bf 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -17,6 +17,8 @@ S = "${WORKDIR}/json_spirit_v${PV}"
 
 DEPENDS = "boost"
 
+LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
+
 inherit cmake
 
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
-- 
2.7.4


