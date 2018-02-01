Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 22DCD78622
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:23:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f3so6066114wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3i87hE/GPY0tG+WMEs4CiMj7KycMgUSjTfoW+9XsWR0=;
	b=tosvNKdIOwk8/yizNgDWjC1cnOAguUhpIl08iYdltLFKviSr+H/H8ri1dulRKrLtJ5
	5CqdyV1bztUJhCgkrvfUmweIIn/30XNeIQF8NGGS1ig3OaoRl+s+VHLLha/ywoMlPhpt
	uQeIfYW5KFjeit2MX6qxTQNWV+GJbVmw4ZGWCP1UZRynWhZaRnig2DG7uFBQD0Q7l8UC
	KzHh4XGDUxUHZLaSY7MZpG8YsqQM7Lju7CZoy2qkp5PzUUL/to4QmKxLT7U6cROrEf0W
	nQxTSvI3hBHGHz6ItQtxCRI/P35QlGfjjgkjLmW6YS76LOnxvbJ9OiUmOHiUpfaEuSTq
	TpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3i87hE/GPY0tG+WMEs4CiMj7KycMgUSjTfoW+9XsWR0=;
	b=NEY+8l6ku8sdBOzKkoGC882JROMZhbjVo0y/FblmY01azYn2IP12tMnKMI7c5CjnYh
	xvoWIEVMf8kJEusTbVu2ZglGT7/7JMVsbqDnPFa9JRRSA2Uj32GgmlLwELns46729aKh
	pcBOmIc7BPB3u/JKPxyMUN0twJb8tmBXfjuw5znuuT7m7IoEqxgZCv0wsEPzisMrO4OC
	lwgpOM99CbvlK096+UZydQT3aRUbW0RSCamBYjZEokbZv17VsNJ9W1CTb7l9wRXi1rpR
	cNdfHZg7shtrMocbDov0THy63XW9AjSyzSFqjjdIRQXeycb5gk+EJ7S8wFnSj8flUsLT
	zHYg==
X-Gm-Message-State: AKwxytcl2b6dCM17c8X8tgQMlNyX9VdEgXNBisiVdefP5yRqaW/mOGN5
	8ld3i3n3xeGvTnYNdAoQ19b7Ow==
X-Google-Smtp-Source: AH8x2258gDqmcFC1haomplOPet473YlhgdG5OofWOzUokvBIZvXqtDZKwG6F8zWCFA0NGz5LUyZzmg==
X-Received: by 10.28.10.206 with SMTP id 197mr25664029wmk.61.1517495022834;
	Thu, 01 Feb 2018 06:23:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p4sm12152838wrb.59.2018.02.01.06.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Feb 2018 06:23:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:23:39 +0000
Message-Id: <20180201142340.11083-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH 1/2] zsh: fix base_bindir installation
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
X-List-Received-Date: Thu, 01 Feb 2018 14:23:42 -0000

* fixes:
  WARNING: zsh-5.3.1-r0 do_package: zsh: NOT adding alternative provide /bin/sh: /bin/zsh does not exist
* it was installing zsh into /usr/bin even when log.do_configure confirms correct path:
  installation basename     : zsh
  binary install path       : /bin
* no other files were moved:
$ find 5.3.1-r0.*/image
5.3.1-r0.new/image
5.3.1-r0.new/image/bin
5.3.1-r0.new/image/bin/zsh-5.3.1
5.3.1-r0.new/image/bin/zsh
5.3.1-r0.new/image/usr
5.3.1-r0.old/image
5.3.1-r0.old/image/usr
5.3.1-r0.old/image/usr/bin
5.3.1-r0.old/image/usr/bin/zsh-5.3.1
5.3.1-r0.old/image/usr/bin/zsh

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zsh/zsh_5.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb b/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
index 1f5e390000..96d21a8b34 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
@@ -30,6 +30,9 @@ EXTRA_OECONF = " \
     zsh_cv_shared_environ=yes \
 "
 
+# Configure respects --bindir from EXTRA_OECONF, but then Src/Makefile will read bindir from environment
+export bindir="${base_bindir}"
+
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 ALTERNATIVE_${PN} = "sh"
-- 
2.15.1


