Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BE6DD78399
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 16:24:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id t83so7903798pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dCfRKdjfPPvIO9iXzIQ6VgMQldhNkZv6AdtVHNXirEg=;
	b=P9ZMjy4iwAQwIyBUXlBZVQA5mWICdOgRkyrIoVU0OSiP2vIaC6fqXuypa/+E/fhe65
	TIF0E22qSb8dHQQMN7Pu0w6QKP+GFzhFix16xEH8WhDEiN7j9RkhNMBUqT9E9Bt9P4Mg
	l2lckMVvyBWDcBfbY6KcCPCYOWn6HwbKi59ynPBAR+Y5ADM+3LseJP2bAv6IlCcoKt2M
	Z4Bz1n/g7b/P4OMfOjLu6Naa31euTR8GukAjvw8towXay0tn0Zz8OIkv5y9+J9027+M5
	9KdZ3CDeyNJxFrU67VkSpQ1k1OInDp9QuM5/WprQSR9HvEqzPPQqRcu6+8n+QhGZs3fs
	xDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dCfRKdjfPPvIO9iXzIQ6VgMQldhNkZv6AdtVHNXirEg=;
	b=Od7olgCAv/AlO0X/9y5jFoZNe+q+u6sEgNrGsxhmC51nv99Py5W0NCEEkYRCrAYuqy
	c9b2p+RkuJveQeoRr28EtCJOg+pLI+jHomVCHhpkbYT9NUQj7PyaPUQCYpT2UNafMmvR
	mpnoIF62nWm7IoQd/VXZiUzvbuEMCFH4GNQpX4YWEshUGH66lbp+WwjPV9JOtrB9Co/b
	HQVH+77oe2fqyfl3l4q9rljajhj3dPyt5AeUgW2qY8k4toZ0xmQrMbOH9KfLltaH9C39
	Oaz82J0659G6NwUxMjfv0t5TQy/CHoyd70JeSY8BbVgnHmdmXIlGZTPoBEiO3m81o2dz
	HLtQ==
X-Gm-Message-State: AHYfb5gIypCYhynx9dzkWqn72ocjBOf5q6cPqW1bNaxg7IcaI+8saYCD
	luUJR9LIv7PlJA==
X-Received: by 10.84.241.197 with SMTP id t5mr25663531plm.473.1502641462984;
	Sun, 13 Aug 2017 09:24:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ac0b:7f59:5551:152b])
	by smtp.gmail.com with ESMTPSA id
	g1sm10009925pfk.92.2017.08.13.09.24.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Aug 2017 09:24:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 13 Aug 2017 09:24:20 -0700
Message-Id: <1502641460-4734-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502641460-4734-1-git-send-email-akuster808@gmail.com>
References: <1502641460-4734-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][master][pyro] 2/2] libexecinfo: fix complie issue
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
X-List-Received-Date: Sun, 13 Aug 2017 16:24:21 -0000

define _GNU_SOURCES to fix compile issue:
 execinfo.c:76:5: error: unknown type name 'Dl_info'
|      Dl_info info;
|      ^~~~~~~
| execinfo.c:83:13: warning: implicit declaration of function 'dladdr' [-Wimplicit-function-declaration]
|          if (dladdr(buffer[i], &info) != 0) {

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
index f79b1ab..13a38ab 100644
--- a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
@@ -16,6 +16,7 @@ SRC_URI[md5sum] = "8e9e81c554c1c5d735bc877448e92b91"
 SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
 
 CFLAGS += "-fno-omit-frame-pointer"
+CFLAGS += " -D_GNU_SOURCE"
 
 do_install() {
     install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
-- 
2.7.4


