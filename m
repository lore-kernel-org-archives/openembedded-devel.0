Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C6E0477707
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:34:24 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u48so14634902wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Mar 2017 12:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VN1+JVkXGCeiYUZiFSmqmKkwAXRUUmdiurywpqnlFwY=;
	b=ubtTo9fNaCOWiFt8oi6i2Lpz4+jfug/F7ef6lTjcSE83S8pwgaL2QilvoS1dMKnEXA
	ENdw2BUSPUJODkJnWdYWaoTiVeFMcnqjJ2pmsOgEt6a1tMuHImUFigKIcu2M9xd1aOLp
	vMfDQs94d0m1E3jJYegGGXkHRRKU8i+DCBdkWBKGyAw14s4/czUcv16Fg1MQjPVIDtbx
	c8zn02igt2J4UqIEuoMC43KTpTGxNvI+ilQu3KHd6nu1wGriudYBxaQG4W1sO9cRaoTy
	hqbFB8hL5HjdxUHXWYFOqSRvOsjeJxFfy8f+WIUINcjKK5xwvEssrcq75jRsUSrkMJOT
	EQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VN1+JVkXGCeiYUZiFSmqmKkwAXRUUmdiurywpqnlFwY=;
	b=K5MfWxuT1R1HVUTpe3jgKN0UEPseZh+1yIasHe9zMJEwvz1YgaYPgK/kG/NBsS10Gi
	rLbQUgUuHFvwMFsyXoHb1VSOiNQwDAFMg5lP1kPtYna+neCcZd+/660y9PtAO/RPlA4m
	huVIW/Bv4zqi8CVCvaP7Ki0jS9uElUaEBAx5kLUnyUFvX27U2lE1BUtJVWFeUrl33WWe
	WpIIcJj/nDPnN6Gitl21bSp1qvW3Bd61pjOvLMdDaC3CJkXujQFJGLd0IGabsRHhNeWY
	k8hM4kfJmkoV/SJT69mN59v9R1PfN4Z6ZS86gBGG9ktoTxOk0WVW1Ldwsd3JLMTjDoko
	I+Dw==
X-Gm-Message-State: AMke39lNS7lsUbPRwkPO5jThzVQoNlBwK0ubR+Q7VEgU7Gb9MpzZbWs7VNUeynBQ1OQw1A==
X-Received: by 10.223.137.2 with SMTP id s2mr4663290wrs.20.1488573265591;
	Fri, 03 Mar 2017 12:34:25 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	17sm16510119wru.16.2017.03.03.12.34.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Mar 2017 12:34:25 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Mar 2017 21:34:09 +0100
Message-Id: <1488573249-1869-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-networking][PATCH] ptpd: add pkgconfig to inherit
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
X-List-Received-Date: Fri, 03 Mar 2017 20:34:25 -0000

ptpd is patched to use 'pkg-config libpcap', so inherit pkgconfig to
have it available in RSS.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index 622db5f..e136193 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;md5=0733e1b3788ab2ebbc63bf33a020da1d"
 
 DEPENDS = "libpcap"
 
-inherit autotools systemd
+inherit autotools pkgconfig systemd
 
 # return something like '1.2.3' or '1.2.3/rc1'
 #
-- 
2.6.6


