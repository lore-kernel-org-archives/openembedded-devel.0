Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE5378741
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l24so5440650pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=U1udBeopoHDHZqBcAezgbeXB5itovaHeZdAGMRSN8h0=;
	b=FKSVHd+Yv92G8Vjphg5L1KuegA6aX6KdkeYPXHL/oX/FotGwm32gQvk7xbdM2RiDsO
	Gk07c6JtS8oLgtWW5fYwZkGTNlm3HcCoJwxQmEzOXsyfxu5RQw4xWhzj2WbLVEhPsdZQ
	lzSXac+oL7sQvGuhUhYjcdggNXrljxHlhfZcvW7vL//H9YMYQmvytTER5uAkHJwZirc5
	NXWZmQBNCXaiX8cGy/Gze2nlVT4zl7ibX5wYZ3X3l5bUPWRur6qnwaxoHGv+kMa7fqA9
	SyOoTCTuhNLX0xB3rrEY8M7AEwEe5oBTrRKRxmcoDNXNVr062nR+NOMRjp/iVZ9V20jz
	zWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=U1udBeopoHDHZqBcAezgbeXB5itovaHeZdAGMRSN8h0=;
	b=cXw5DWLtzAtPMbcayOeK3z01kl6MRwxZw9dsJQ9N/cpNJzeYavGzCt/h+SFBi51rZU
	EAuZL/TS10cnmFJGjwJBZzSbB9Ljl1V0DmCC0sPKE/Olx7F1/VPEeMT/UqlvkCrqENSz
	5Rl7jBIgKflWJHwz85rfHFMJaG8viApyU59NcnHHE/kENxvugmXS7KktXZl+spTgs2um
	AR5jkrTKDLbPl7cY2IYuO6Mhyq8pgzxB1XnO1h9zNHEC1QfkAQVphbFR/DRNzqT9Cs6V
	Djx/HaeE7FtgGx97EHAVCp0hVK5bRYvTLcwIGOQGYMYV9+u9LsgXxglnz9XFo+czJbGo
	dXew==
X-Gm-Message-State: APf1xPAwtJ340ikf6ry/hm9rkbRgaJ17T+uutrcW7s2vvmy+CiI+JXKB
	wWSJYhaGfYvbMjXM64tZStqQMg==
X-Google-Smtp-Source: AH8x227Gt9sU4mm8qIgcQuaAYqnMPz0IiaAVPJYvhtLCFPMe9cBoNTjv9pWZiRkNSyK/VjdPxn/msQ==
X-Received: by 10.167.129.129 with SMTP id g1mr8415960pfi.224.1519594410000;
	Sun, 25 Feb 2018 13:33:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:53 -0800
Message-Id: <1519594406-24490-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 03/36] sqlite: move to recipes-dbs
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:29 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-shell.c-Fix-format-not-a-string-literal-warning.patch            | 0
 .../sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch                       | 0
 .../sqlite/sqlite-2.8.17/mainmk_no_tcl.patch                              | 0
 meta-oe/{recipes-support => recipes-dbs}/sqlite/sqlite-2.8.17/sqlite.pc   | 0
 meta-oe/{recipes-support => recipes-dbs}/sqlite/sqlite_2.8.17.bb          | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-dbs}/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/sqlite/sqlite-2.8.17/sqlite.pc (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/sqlite/sqlite_2.8.17.bb (100%)

diff --git a/meta-oe/recipes-support/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
similarity index 100%
rename from meta-oe/recipes-support/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
rename to meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
diff --git a/meta-oe/recipes-support/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
similarity index 100%
rename from meta-oe/recipes-support/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
rename to meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
diff --git a/meta-oe/recipes-support/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch
similarity index 100%
rename from meta-oe/recipes-support/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch
rename to meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch
diff --git a/meta-oe/recipes-support/sqlite/sqlite-2.8.17/sqlite.pc b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/sqlite.pc
similarity index 100%
rename from meta-oe/recipes-support/sqlite/sqlite-2.8.17/sqlite.pc
rename to meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/sqlite.pc
diff --git a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-dbs/sqlite/sqlite_2.8.17.bb
similarity index 100%
rename from meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
rename to meta-oe/recipes-dbs/sqlite/sqlite_2.8.17.bb
-- 
2.7.4


