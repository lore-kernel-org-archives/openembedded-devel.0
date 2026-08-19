Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A19C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:26:07 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4903.1787138764466507874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S8PjT5NS;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso667167a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138764; x=1787743564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IEoEQBNgrjz0yD/nV3SLOHRC+RXnfrN1lLqGPfdcDo=;
        b=S8PjT5NSDi3fZ5RjYTRyXoUNDDADNkOT2UFXn6LOpFgRjy6Czshlf6mHsX28FdjTX4
         K6ERsb4a0tOnsOPZ0gWFyp+pPOkeT/kfwragprqB8v4v1iaQDQgvr/GNNex/K8xXJCBw
         FtiOfQoC5OeNLVbyG3TLIfyZCCsCA/SSN+UarpT+wikiimjSNcYXPM/pFrpvJ8gx0HAZ
         zlZsJ99FBDFg74An018ZebduhjFB/UKECykEJ4Wg/jwCBNCQ5qDoXOJsA9ZEpwhmm/Zp
         pEeVWqeIbZmzb0mx5u+jlNqOkfYt4wND3bWSD8sDOZVpC2Ms0iME9ehCi1jtigUXYP04
         UpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138764; x=1787743564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IEoEQBNgrjz0yD/nV3SLOHRC+RXnfrN1lLqGPfdcDo=;
        b=TOQDqodpsZnsipVS0nCakbKjinlKKo4fThU+SQHP6hizsvFsER+Gt67rjja9b7Rem7
         92XICxm2qvuU2JVjT9pyyCb7yq9NNlpdUl1M1KYWpYqIsBo+lV/mGRZLssd/zrUlohQv
         s9XSkAIleD2YoO9Uzv3c0JsY/VnTLnTtftrgWtRgR7OOFg64Q+kxk9S/q98Frb29T1w3
         j3P8cLiNBQc5Uksf4MWYacQE40LasblK0dXx1rlSoDo/aZtra5pATL0EOpyb6Iz5Cb1Z
         on+l+0arLwAy6d1G0NDrFrOUSgTm+lcUTRtK0ZZc7KzkKHzL+skr8Rov5VCdXsuExbMN
         weRA==
X-Gm-Message-State: AOJu0YyqGvh4NSY406Dko+loIqHTcKu2V6L52eMgDoMXgT4F/Of3AlS/
	N0oDzovcQkPTxybL5P9/TV/cdcbkRBgUw5NwnoxbnSpwHfyBWk8+8ExnuQJ7PDnC
X-Gm-Gg: AR+sD101fdD5e1tea/8HdK8SfiQJhVGEmYF0YqMRt10qeXZUHid5nGkvI8auCYKb8s7
	JKXS4DVve20kJtGtM67zXS+HlodQ5MBJS5RshJCkRcmTRt2cEVi1sFadfzNG55Jb39a8cQxKGRM
	Zlfhnn2zY5k3zQiFKJ4AdDfeoYdIcgAtza0+a9fpwY7jaDDoctzvMN0+CWkDrD4MN3trV8xfT28
	qCT8ZLJCkgVblsUh2bMrlYWgpiQ4H7WhSV4k4HG6qB9NpWSp+WKfPy3SUXnGyDkw1zKbFRNUkjn
	UFsJBjvShB/YVw8nRBLSVxYtI4fV/cz/e9g46oafqA0vmUYlZzZQbN4VvMYTzKUb/h5z571bnFd
	UXQphLLIMPUaWUKoiNkWv4JrGJdZ54NuE4JzwWKwLlcNTPYjnGJW1LsRmKuD2Dkz30Df2it0+CL
	/OqxfC6q/cQHp19s7odEiavjswgq6mfZuoHp/7VEoQTzILULZ3HUWD6ikanPvVfEF+eD6M4AE+Z
	A==
X-Received: by 2002:a05:6a20:2446:b0:3cc:22bb:8911 with SMTP id adf61e73a8af0-3cd00e65097mr6664364637.6.1787138763755;
        Wed, 19 Aug 2026 04:26:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm5073764eec.11.2026.08.19.04.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/7] graphviz: upgrade 15.1.0 -> 15.1.1
Date: Wed, 19 Aug 2026 23:25:48 +1200
Message-ID: <20260819112553.971109-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
References: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129355

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.com/graphviz/graphviz/-/blob/15.1.1/CHANGELOG.md?ref_type=tags#1511--2026-08-05

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../graphviz/{graphviz_15.1.0.bb => graphviz_15.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_15.1.0.bb => graphviz_15.1.1.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_15.1.1.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_15.1.1.bb
index 6771a41757..7ea33b8d8a 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_15.1.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "4c44f9f6654d39638db7cdb6a088735117469015299298d82087b24dd4042b16"
+SRC_URI[sha256sum] = "afc7c28dd43d3639910f58820bdce7d89655aa9ac0a4961ac67ffcf77e6a9ac3"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

