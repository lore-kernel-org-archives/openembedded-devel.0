Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD999C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 09:32:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3138.1745573570913316418
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 02:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=G4B0gc0o;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf257158fso11861265e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745573569; x=1746178369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FU5TNU97Pn+bo5y2eKcakSxs2wYK1dx8KDLRAhp/TsM=;
        b=G4B0gc0o+5hHAdmWATZAotEHwlStKjISP7D+jIxgkmwDNY4AE36ApHpuMJrzqEKb49
         vnI6aCjrUuUIK1FDVn9xk2i/E2aAGtTFcrN32Nredq2RuFrqSaJU4FcyKlcZIScHGpvG
         mXOoD5lL6zV05GvjE6cMiky5VQ3Cc6/DPkc3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573569; x=1746178369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FU5TNU97Pn+bo5y2eKcakSxs2wYK1dx8KDLRAhp/TsM=;
        b=XzRAqK8FGuVbjvtzH7WvHOr9ZBSEbrvTV2GFH3dYUGx6rsUzoW0Ta+RVYpqGkdVA3u
         fqUe7F6TiGQwjdFUku7UkkJdgwZwvHKCunTYkZSirjrelJpobltxZxR1lo+rSHYLxmKX
         ZhH5zsaV6t0IiTRRwyRsuvs8sh/OHLvctzv7oRcFzna56QMqtF1MRW4eb5dEzrUX4cgh
         ml1KJApQI13QSTBQvuxC9Ef3ZDjd0c+YF0QtLciZdWVHQY6SdGYmU/8KmP5JXq0iDJP4
         7io7sCpIPPKM0h9M9rO0ij400yDtedWsbSr5Bx/IJ1cp+qqaZWhTtVS5WkLE036hQK/n
         kGJw==
X-Gm-Message-State: AOJu0YxyzVOr2wY7aWXB12wDVZsHoAgjyN0u+12j1XAjGUZq0Knl97j1
	bwngm/2jEzPuGs+S3A+fjQoEvUw1jDAWNdnYQkxUe7dJoyNAbpo14E7tK+8OmSMNF/u0sESnyKe
	G
X-Gm-Gg: ASbGncuZZeujN88eH+EqXnrb3qsJwQ5hEeonMGP8EdZPrv/97ydfssBKVkZedz8nC8Q
	puLgsQA27vv7ogJwvtZprLoXmXM7+k33PstwOT5WWbP7m9aPutkk8wTWFWaBGmSuZyitlXfozhr
	Wtaru4xX2WXpIXU+SDn2aZFg/NX8O4/sgblWUEjFyIFhqSSWBwsqZTEdrdsNJXZCKN7yfb06llH
	UCkAAIJ3ANCoIXx/TSAePg9P+2K3ZdNac+bq/u+jSIZb/bGig5PZwV4O6D+GFYB58RPhgO1EvJy
	r0FStMZMgGZKgSkJfkMVClMnt1J++LDjKqxXVEev8xUteJp2+QCVOkk=
X-Google-Smtp-Source: AGHT+IGsBQdP9f+G9aTB6onouTk37O0ZQjjWwaXkGekIKzpqzU8JpZMA/4+0dPqp6Fh9oKXsgQN5SQ==
X-Received: by 2002:a05:6000:144b:b0:39c:2678:302b with SMTP id ffacd0b85a97d-3a074f14a59mr1233820f8f.45.1745573569072;
        Fri, 25 Apr 2025 02:32:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1787773f8f.3.2025.04.25.02.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:32:48 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-h11: Upgrade 0.14.0 -> 0.16.0
Date: Fri, 25 Apr 2025 12:32:45 +0300
Message-Id: <20250425093246.1951085-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 09:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117121

Upgrade to release 0.16.0:

- Reject certain malformed Transfer-Encoding: chunked bodies that
  were previously accepted. These could have enabled
  request-smuggling attacks when an h11-based HTTP server was
  placed behind a load balancer with a matching bug in its chunked
  handling.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-h11_0.14.0.bb => python3-h11_0.16.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h11_0.14.0.bb => python3-h11_0.16.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
index 2bddefa3f0..a47e6ab61e 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
+SRC_URI[sha256sum] = "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
 
 RDEPENDS:${PN} += "python3-profile"
-- 
2.39.5


