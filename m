Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B07AF3028A
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 20:44:48 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36952.1773607481903577551
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 13:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EUtkDABN;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70f91776fcso1478452a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773607481; x=1774212281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2Njod8tCPrUFODCCV2UFUer3srRQHh5ssU9xInLToE=;
        b=EUtkDABNrSoYkSQ+kiztTqs/6Ix7pXSOdCe1X+QEteSGf+EEbE08rDYZxr4m3jH9rs
         9BRpvSyAb+OvtryYWUzCU2byWIdyv5kqrVXjuXtzFZwGzYjLrLdaGyu0xF0cwGLigRoi
         VW+I09oF/ntwwQ3s9ba7t+CYWxMAG96VZj+tzhTjkKL3QarSj/jCZQ6MouxOq8hAVj+g
         rr3272jUbzesrVi+dOQGn6WgJ+VI+pt76+JGUx5yLNBHbpzZl+SmNdwe4TI9hI1zySWf
         VQAuQqWQ2zAvM03eSpNgGa4Ns5KaPQYbFiB6TXwdl7c4MhBRIm9AAvT2uhQMV6yz0UJJ
         us8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773607481; x=1774212281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r2Njod8tCPrUFODCCV2UFUer3srRQHh5ssU9xInLToE=;
        b=A/cVVbOYFKjOp2EXS3HUyHCKZfSmuczQ2etFsg+rco24uarOOPJkqQzLXtXY9HxQr6
         Oj8ovdYWQR7G942D7rhDNn5KMX2roJx0ZYr6My+pYlwyYafR88bIZX/znt09LDCxoDk5
         +iA3lNQfw3YZsyG40GPsGT4+7iuifzobv8EUqRJGBy4TExLm36vJH7UaoBZpbhfILcti
         9WZO1hBafC+wi2pnuj6dmHzieulXFaTeG/Oh07kiu1ZNwP60W2g2cxB7kpcWnr9jLPml
         Yl3FkqahHi7AylrtQ9uzWyms/aG3lQh+8w/vhpF/Wey0+r8sOcOVvSeuh2Hpd/hTEcVP
         JOlQ==
X-Gm-Message-State: AOJu0YwH3wr7BVIGCKQQ19utf1XZoHxWtdYfficlbqDChn3yoX+4NqJz
	JbM5PEimh/HXKjOz64Ox4EuLTobQNIMH6Oni5waAXlYxwpMM+l9tbAE6djjruA==
X-Gm-Gg: ATEYQzxU40N7fl8vHncJF2//jz2XLkMJtiyqq1cXmG1h+h3HXX0ot4/d9K/YspXfTsI
	WoEZqQVPFv6rHS6w2Ju7UlkcLgJUvp2UHziIHgXVTtsY2+Jgj33T3xew8iAERKRLYmvLCzsT9S1
	uCVvUlGgmH3UEV9i9jfzOKlHkV/5qBFNAJAdkhb5FTcKQCpvtkhTMr4ywiiD6q85ivGCIuB5doj
	hLUHrbSfMIhbiVy0Xe11BgdszbeUNYVWlhn+PE2fTahG/J9xkzDf6L2zarKxc5lldwY7KU+OU29
	Mp0kRT5HI2buNmUeM0vHsn5v1G2Bhf3HrzDXI8vgEvwSgvYv4IDTM7eKZnvtODru7vPtEv14KOM
	FzRkBFjm7FWfkDmpN+if2jd+Q7g5klTpYQnLedIwAd+1usBZY33ZvhNXK2Pu2NrIez9ynsLdTew
	ODi7Md+whPtf0zYuQr+z+tLBjdXNFs/FdsQjs=
X-Received: by 2002:a17:903:174e:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2aeca94047bmr96055665ad.11.1773607481131;
        Sun, 15 Mar 2026 13:44:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee3ecsm107873255ad.42.2026.03.15.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:44:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 3/3] spawn-fcgi: upgrade 1.6.5 -> 1.6.6
Date: Mon, 16 Mar 2026 09:44:22 +1300
Message-ID: <20260315204422.29217-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260315204422.29217-1-ankur.tyagi85@gmail.com>
References: <20260315204422.29217-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 20:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125249

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
* Use meson instead of autotools and cmake
* Simplify/reduce configure checks and #ifdefs

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spawn-fcgi/{spawn-fcgi_1.6.5.bb => spawn-fcgi_1.6.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-support/spawn-fcgi/{spawn-fcgi_1.6.5.bb => spawn-fcgi_1.6.6.bb} (70%)

diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.5.bb b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.6.bb
similarity index 70%
rename from meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.5.bb
rename to meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.6.bb
index 307919f775..5ad93ebc69 100644
--- a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.5.bb
+++ b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.6.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
 SRC_URI = "http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/spawn-fcgi-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "a72d7bf7fb6d1a0acda89c93d4f060bf77a2dba97ddcfecd00f11e708f592c40"
+SRC_URI[sha256sum] = "4ffe2e9763cf71ca52c3d642a7bfe20d6be292ba0f2ec07a5900c3110d0e5a85"
 
-inherit autotools
+inherit meson
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"

