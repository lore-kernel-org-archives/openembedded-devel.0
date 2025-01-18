Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57BEC02185
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 23:42:41 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.6305.1737243752327718033
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jan 2025 15:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=foEhy8LH;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e46c6547266so4806796276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 15:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737243751; x=1737848551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PSfWhfVZL8Cfq3iZwmmn0Qbxbt8XudlOvA9JjMjEuZc=;
        b=foEhy8LHAZqY8erPt5rBVr/Bd6UBcCiG4YJi5eF6elHS4grCOCJK+gQ8B/P3DbX47G
         /AbOaaHyFhWLQgkd5HjhP7OwnH7knC76RNeC6f+iBEJ6SA9VR+my3bWB0N3j30lA+38K
         +NFYQMM4HTOwC0OXWMGhICuKwh/I45FFqUkDwRKgHz2i7aeCKU1dFWUp3Ii8Jc7pdI/m
         JjzBwOlpmymTeqy2+q8NStlHCN8I3/BoP8jl6aDUDstuSMvXXZlDJWf3fkw0fFDmCeQe
         P8YkHXhUzhojtW+gQmS+bb/jpnhXUX5kE26BJo8lGXA5dOEL9bGBu+4W7JwnKd81NXB7
         CnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737243751; x=1737848551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSfWhfVZL8Cfq3iZwmmn0Qbxbt8XudlOvA9JjMjEuZc=;
        b=oCoboHD0tJQHhq2AXwOgTrCLRyLTGBOzzlaNP3W20s8pZMjIZ2I3thCko7OzHIj+OZ
         07Wcx08pjgSh9x32NO3UWcNN/fj/0DFP66TTPo5fSGdbgdY+Z/05Gk3g5iXkTM3gXGWx
         Ts/v7i/ppeO6dlmon8QpUajXnsSi3zFqhF3S+V+Ts4AxosBfm9MGZWEwzimc1gnE1QN9
         pJEk5+xQpzSseQ93e4qp0n4ypIJyzWg7biGdpwOIE7ywuHFLX11cfXeEO7oW/Qbmt8TG
         UIdhT6lpoZlgIHf6x90iVejk6CDZLVkqtq2DHXHFBt9tVcDhal9XfFS3ld6YQtE7nur8
         GSJw==
X-Gm-Message-State: AOJu0Yyv9Y2dZ99nq+IRMoUKTAfoIxljhpKddmVcjoRSA2Mb2087xEWq
	kCRQIP3pH684mBfVYVMMJfiG1qqtFchh7yXB2o+cNgR3Usuy0kjiiAAGZbxL
X-Gm-Gg: ASbGnctDEbcH7O0z8o3OVtbJPz5TqRI+T1LhZemGlxZsQuN83xbRHdI0RwyNvm0k7iL
	Esb01uQfQyUFzGTT9CNp7Gnlgb5sK5z0cjHmxCv4agwzqxRZ2r+8bfs6Xtthjl38RNZcR854Vw7
	3qx7J7Vn0QfCKfGoyOyAOtqoTvYVKqb82RR6aP8oGujQlOgDZa3sUHKieGc4DnPq/firzplsLw+
	eWxYU2ewnmNbaOAld6TAyvM07Q6hyD45h+gUixJ1ounoo7BOxgsdeN5lxsPikj6Art+u8EYBEt5
	43poC4sEL9zGC2gD4wV8Xbg0qqC8
X-Google-Smtp-Source: AGHT+IF3fJr2W8xFhc9V9tr0UCVbZeTHyDjS8JeE7sXYzz/kEMs3YZolZ06ssHGFqXzE0RByZwVHYQ==
X-Received: by 2002:a05:6902:993:b0:e57:98bb:6674 with SMTP id 3f1490d57ef6-e57b1349f66mr6917291276.42.1737243750856;
        Sat, 18 Jan 2025 15:42:30 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e57ab2e7d24sm974408276.14.2025.01.18.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 15:42:30 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 1/3] c-ares: upgrade 1.32.0 -> 1.32.1
Date: Sat, 18 Jan 2025 18:42:10 -0500
Message-ID: <20250118234212.13357-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 23:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114951

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.32.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.32.0.bb => c-ares_1.32.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.32.0.bb => c-ares_1.32.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.32.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.32.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.32.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.32.1.bb
index acabe49d6..81eae9d83 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.32.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.32.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2047e36c793a8e9c3d3f4b66f8934a19"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "5ab3fad06edb98fe8081febe1e41a027cfa3199fc525a59c851376414fe24c5b"
+SRC_URI[sha256sum] = "63be2c4ee121faa47e9766f735b4cde750fff2c563f81c11e572d3dc6401e5e7"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


