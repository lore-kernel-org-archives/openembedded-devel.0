Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1880.1795113359637025299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=v0GldX2K;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso62254b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113359; x=1795718159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4SFnwTRw6uA7FQmbP6lwA1aHLn0+xVB2zPdrrrMWHw=;
        b=v0GldX2KLHs1UXsViNGhHHTZiED1EfpHYgko3bBhUE4o0Ac4aTd+wtZjreLalO+axC
         7MDbDzxg+cy5ZxMTRI9u4W/aRjDqIaUJBUKLorNj+0dl9aH2hI1QmpcUCyhQxf77f9TQ
         0n+3NUi9csb+f4m3uPuaLg0AamFGzwZvuE6/1H5FRnRLg4FvkwzSVppY9R9kpjb6ohMK
         hafkTUXpJKMtwR9GQrrdRcvyK79WiHfgKnJEiBhrrJndwBIA6pQBp+CoWTveSUSJPIx/
         pocQGWwjiN3Wt1eOXfs8a7XGR3tUREPbUlIrwQtMOERGnWPmo96Ekg7eQpvPY6AiZlXe
         kLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113359; x=1795718159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4SFnwTRw6uA7FQmbP6lwA1aHLn0+xVB2zPdrrrMWHw=;
        b=xNm1D6nSGPkzK6Qm84Q1ZRsVQVjdfKAcTNhDQrXRegnVdA3wd6R0cAzNDk6HzIM7tt
         npmGCrGvna629ykkApjUK6UUjlV7ujSl20Cf+VDES1sPetAn4ohzLv3AmQX7ebyR5v0/
         6im/rwZ0olWubzuJf8ot9ovSGS0dKUxz2+XL0tpZvs/9ysPd0RicVR5caPAsFE0B/6qw
         b25T9nOHC2e6BZafLwYZn5ykfzvEGWHQhUmXd3DH8b7yZOty3ov3ZWeUe+MnSDTq8LwD
         LqrXXxTL9X30PyQ8FSsquvn/gLA8R3RfL7gqqyilFFpjmqGc7y5LL8exNlwtI8yyaISb
         +hjw==
X-Gm-Message-State: APuU4Z+8J8jClVwQ6/m8tLrjupdjmAzEVqEN7vWeyy483fPJ+wCgOB7K
	Yiuj6iitOdxJQ5+oAag7G5JQgVidcsVay0yeqWsATaCeIgDWsOzHUaWb4OHEvw==
X-Gm-Gg: AYBFou1bOCa6d+R2yOhQkLt+kMK4AdRSEda3Zagejr9ZyqCs5IrD3Q6ioHD96MRnFN+
	9PMGLYUo5QAiQ/BDeYVPi3zXmmg9fCsiA9fpCVMm94irUj0y0NFqyOF5MImyjSo3K8KCJ/6+VYW
	RtURZCSmP76Iy+QeqeAvLzXcTsg/feyVYEjNp0hGgRMBvYvT03KjRXyNK6IAlkEW+lWoEviqx+p
	P0gr5C5K1ZmxH9jVDr8HeDy04JsPW3uCk9/uY5rzAWZYv+L4zQWlIH1lUab0uRvDtoovz9U7v8D
	hG8iZcQh8QTs9dqcuz5OdIKqQ5GS5AB8M8mBq8CVGU66KZjOABMezlC72V/NsfUJFN2rBfh3ECW
	PjpA0jovq3AhqZtVJSbTgS6dSWBbz6vQUevmno6KYAHDORomnqVn6kFkarvI1zbRU2DFa4ZqZZu
	ST7kHGHSwBAQWZlDDIdS983k+8hIB7VHfKNPkiw4Us9aoV+Kgq75VwRneEUL/+ZxuUoRw32G4a/
	vzX+rWyphRYoZhL6+w2jf4u72jIthMjfkpU2kj2e/xWvD+CJlcqLIGJfkz9o890tJwEsPHJjZFI
	zEsD+TQOjJU1IGLih/EWso71KkjXJdlfsvGRLGS+ezaVXLB2ii3Nph3GN5YLnw==
X-Received: by 2002:a05:6a00:1786:b0:886:a737:e0fe with SMTP id d2e1a72fcca58-8c87c197705mr425936b3a.23.1795113358901;
        Thu, 19 Nov 2026 10:35:58 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:35:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 02/64] zchunk: upgrade 1.5.4 -> 1.5.5
Date: Fri, 20 Nov 2026 07:32:30 +1300
Message-ID: <e0bfd20f79ab3e16fb56e781300c630bf756d05a.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132692
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix out-of-bounds read
- Harden multipart download parsing against malicious servers
- Harden chunk decompression and header parsing

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Handle CVE-2026-117556.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb} (81%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
similarity index 81%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
index 9d587debfd..f84cd8d6fe 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "A file format designed for highly efficient deltas while maintain
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1;tag=${PV}"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "99e51afa38c723e7c25834c2c3b305d20ef55d04"
+SRCREV = "ae8e9f5b1e820a906c39f7eaf231e71bef72a3a6"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
