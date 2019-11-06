Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 139A07F8AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 03:49:20 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d29so4418014plj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 19:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+FOdv7QhqTnbN6SKPcmL+O/oXBlt0xsmAKn3aGq5zzI=;
	b=hMN0hzb/nvxgIo2GK8DuZOqSY7Y6NTO+OW9fDrXddTn8RVLhF1N3W0tGPnEBRVpkgR
	D7QpHSkvQ9e6LyhdBv7g7mp6fgROpTag4Bhj274X/swbkPWD4Zt30an26JZXhtTv1PPW
	THUDCogZVIAejbYpCk1Ayj5OKSb9hufaMh7M3ZyRiLB9uhh1NZpCfULBPCbs09asiNmV
	QRxeJREIg/XXWyMiguaVJ2VimDzxfVKC5YgxRvwh/UYAA5kD+AQDRrFjwtll/066LNdO
	J4709NxxiwDGUCuUZR2xMu8EIJrqLrw3pjt/81TSSupXXuytIh6WPpqYc9gBHAzsDCPA
	UaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+FOdv7QhqTnbN6SKPcmL+O/oXBlt0xsmAKn3aGq5zzI=;
	b=k2jWErj3lAURMRc9CMJPYFbnlNjYADrbtFKUeMOSFqhAueLDtwjLDOjgVxt2l6mCPR
	xkYdooQXJDbTOsWdIVYbi+oyrzqIrrkvPZ6B3fnFoWNtcEbnDwJLnL6rbT7tFJwQc7MT
	fUk8eO2jh344CzRjv34ctaI+CN0RZYw2IbY3AjwzpLnn9LCyjdUiMywVNHbj+droiLCr
	ALB/t+Qj0pqaa+RHN8EeGuogTI2uFLvgtGq7Uc9wEH3V9kaC+BalYEmKb+jlL8+YRRD4
	BYadRZ56y0TIkFIl8SsCJtmZRUoUpuOjSTttBlKY+w+ZXZ5sbY/BXyG4roQDzirCJ4cB
	7JLw==
X-Gm-Message-State: APjAAAVwq+FT6wYrJM1m4YMMdZAe31TFr6wpKof8Bu8M7TODYSxYcCo/
	d9Y4seZribKY7GAH4ZREuGezXw+LhVw=
X-Google-Smtp-Source: APXvYqzpf0lWKI5vip9T0L318vbngzhy7Q6n0jAXsOJYAnrF1vWk7TpiDf/iFx0HLYzmSxO7R0uu2A==
X-Received: by 2002:a17:902:aa41:: with SMTP id
	c1mr302455plr.153.1573012161477; 
	Tue, 05 Nov 2019 19:49:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id 39sm912407pjo.7.2019.11.05.19.49.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 19:49:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Nov 2019 19:49:03 -0800
Message-Id: <20191106034904.2815791-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191106034904.2815791-1-raj.khem@gmail.com>
References: <20191106034904.2815791-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] netkit-rwho: Include stdint.h for int32_t
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
X-List-Received-Date: Wed, 06 Nov 2019 03:49:21 -0000
Content-Transfer-Encoding: 8bit

This ensures that when libc does not include stdint.h indirectly then it
still can compile

Fixes
| ../include/protocols/rwhod.h:57:2: error: unknown type name 'int32_t'; did you mean 'uint32_t'?

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...002-Fix-build-issues-found-with-musl.patch | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
index 717b4d73f4..349a1351fe 100644
--- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
@@ -12,8 +12,6 @@ Upstream-Status: Pending
  rwhod/rwhod.c     | 5 +++--
  3 files changed, 5 insertions(+), 2 deletions(-)
 
-diff --git a/ruptime/ruptime.c b/ruptime/ruptime.c
-index 1d4f7b6..f1f043c 100644
 --- a/ruptime/ruptime.c
 +++ b/ruptime/ruptime.c
 @@ -53,6 +53,7 @@ char ruptime_rcsid[] =
@@ -24,11 +22,9 @@ index 1d4f7b6..f1f043c 100644
  
  struct hs {
  	char	hs_hostname[MAXHOSTNAMELEN];
-diff --git a/rwho/rwho.c b/rwho/rwho.c
-index 63919ac..71aec9e 100644
 --- a/rwho/rwho.c
 +++ b/rwho/rwho.c
-@@ -49,6 +49,7 @@ char rcsid[] = "$Id: rwho.c,v 1.7 1999/08/01 20:44:18 dholland Exp $";
+@@ -49,6 +49,7 @@ char rcsid[] = "$Id: rwho.c,v 1.7 1999/0
  #include <assert.h>
  #include <stdio.h>
  #include <time.h>
@@ -36,8 +32,6 @@ index 63919ac..71aec9e 100644
  #include <protocols/rwhod.h>
  
  #include "../version.h"
-diff --git a/rwhod/rwhod.c b/rwhod/rwhod.c
-index 54498d0..40cabcf 100644
 --- a/rwhod/rwhod.c
 +++ b/rwhod/rwhod.c
 @@ -76,6 +76,7 @@ char rcsid[] =
@@ -66,6 +60,13 @@ index 54498d0..40cabcf 100644
  /*
   * Taken from:
   *
--- 
-2.14.1
-
+--- a/include/protocols/rwhod.h
++++ b/include/protocols/rwhod.h
+@@ -37,6 +37,7 @@
+ #ifndef _RWHOD_H_
+ #define	_RWHOD_H_
+ 
++#include <stdint.h>
+ /*
+  * rwho protocol packet format.
+  */
-- 
2.24.0


