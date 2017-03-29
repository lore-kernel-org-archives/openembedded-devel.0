Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1F60C77BD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:55 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u1so1222219wra.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iFBzYtXJohZB7wqkcqeN8EuKSJUVnOQUGbvMymPrID4=;
	b=q6CnxSMhn0AZhnxhij2LrZOSvGi/9ckvXciQdXAGyETvV9+JGGcSzkmWzKvKqVW7sf
	2rEWE8J/SHncL0/jHiKPABabhmVTP1zMyq0tbCd1khXqc+P6d6Hm3UZyOHVhNoaafJU1
	48Ua10ZfZ6hZxHep/63p5SI8nRO7j+I3MBcQTTNgZEM35M4u+hDBpVvTSxzfafv5DR11
	h+UDrOd3VJJ1dvMk9a0E4aWQS5QFIAG+gYgS4fm4OIcbBIH2gRojD5oQAdwpzk/2sEj+
	kfuOIrTWUg3ldWY+LlmWQdN6lo0XACULRppTrh5ErGNe2iRQVHZTX93mXHEamyGJBvyL
	zVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iFBzYtXJohZB7wqkcqeN8EuKSJUVnOQUGbvMymPrID4=;
	b=gkJTrhFflMS+mY+TPxzxBIHaobva4LBGxxOXYARxCr3tZJL74HQoqpFIM0Wjjm06ry
	dJo/zdt9RrYcC3mEHZ3+P9RxOWw+tSjkv7Jzoj4wdePfSqdW0vRbMfVvosGEwMYFcGYy
	sZf+qpOKIytuUU/diAvFoJuY8FBlikYztPtbJ5drGoaGhHTKbGGtsrzwy5uM/ldkMmdV
	kjlwVdDgMCw/YDkyIIYe6IhaBvfwXSqtbPXD1+FGKtSsJ7oiJL+nutPN0lY8b4LDmMNH
	ib2UtSJ7fSbV5yX4lNpOunFEz6mcMCYKDh9Yqxyw9VpQ0QDTbO+LkUGpurL5v3KquSC0
	gnkg==
X-Gm-Message-State: AFeK/H2Qj1my5vC/sfbDVwAC+I/I5B25MjXyfa5dE3ixOHg10X+hvyi0ABKXw742jmbJmA==
X-Received: by 10.223.170.157 with SMTP id h29mr20214757wrc.140.1490779016156; 
	Wed, 29 Mar 2017 02:16:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t68sm3166743wrc.55.2017.03.29.02.16.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:42 +0200
Message-Id: <20170329091643.32180-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 8/9] tcsh, dt: blacklist because tcsh doesn't respect CC variable
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/dt/dt_18.32.bb       | 2 ++
 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/dt/dt_18.32.bb b/meta-oe/recipes-devtools/dt/dt_18.32.bb
index 9688d02aa..8c1e3dfb6 100644
--- a/meta-oe/recipes-devtools/dt/dt_18.32.bb
+++ b/meta-oe/recipes-devtools/dt/dt_18.32.bb
@@ -45,3 +45,5 @@ do_install() {
 }
 
 RDEPENDS_${PN} += "tcsh"
+
+PNBLACKLIST[dt] ?= "Rdepends on blacklisted tcsh"
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
index d7a7fd4d4..1cfd96c54 100644
--- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
@@ -51,3 +51,5 @@ pkg_postinst_${PN} () {
 #!/bin/sh -e
 echo /usr/bin/tcsh >> $D/etc/shells
 }
+
+PNBLACKLIST[tcsh] ?= "Doesn't respect CC variable and fails with HOSTTOOLS http://errors.yoctoproject.org/Errors/Details/138244/"
-- 
2.12.2


