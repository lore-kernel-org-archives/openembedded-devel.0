Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B7BC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:03:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.260.1659107028410154230
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hR2XUI0Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id y141so4851712pfb.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8g2ruPkUFxUD4oZ6sVs8QaWGojAstJhqN1qVzWnYQsA=;
        b=hR2XUI0QLRX0HSjdtwNiUUOzMXzqmBHc5kbwrjOTFxyBexH4AHKx33d2sKtxc2G1ph
         YPgQKkCL8tHnMSD0GrR9zs7PMTYMdqZe/jzio6ZgZF6zDA9Pa23kwMjnZYN3jnV7Yi3f
         xIzNVop00EFf04zbfIImd915OL0jv4BuPcAB26BKydgFNvPZgkbTaVs9yhdC6AR0pBeh
         XelHqjURqBWRrgZwAsm046CmLlOi4uS0vjzq1Z++cl28104diwgT1b6Dj9LdB0lzu842
         B/BjE0vApwFTMaSwaBt6764QIKnDqHj9erewJ6GKERzZxZmZ/cPZ/V6kW4FBgYEReWTs
         veEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8g2ruPkUFxUD4oZ6sVs8QaWGojAstJhqN1qVzWnYQsA=;
        b=VxHBBhVjFh5ElyVWO0kV6FuBR3CQuiScwoKxxxWUtXVF/tyFbPen3mqdiIc8FzbNzE
         cEHMFDRQh+jQAj/weBiJBFhwnHyQ8AQuBEnQ6eKbQuwqmUqVzjurKEDZ3DSejNz/B6JK
         k//8K+PLdKQ6FwS48LfhCGEFpg/rGxC6iiyjmiYLkLa7fYJGGamcBsPKRq64AcONSDpK
         nE/ASR0IeG62lK/O6y/jYnyAbEl3jUOlKKIgXjiwrR3eNUYM30x51Fkm4/RpzLJowj4o
         AQTS74WHsqZPhDe2SIfAoNsMOXbHUrYFSoArU9Y6yGK0oC1EhlnQWkRg/rAXGlDx0Yca
         ZzfA==
X-Gm-Message-State: AJIora+4Yuhk49XO+8V81vU3G6HNahCgKqUnhKuyLR7jcSCbzQy6YTn4
	1q1So2jYhlJbwZv0GYDbH/m9abqPTEU=
X-Google-Smtp-Source: 
 AGRyM1scDJBZeINVHN2BJ8NqovbMSfx97fx5nIT2WNHT1otW+S+q0/RMI8xpa3aAOoTxyhnv+Y7ecQ==
X-Received: by 2002:a63:d646:0:b0:41a:6c24:d829 with SMTP id
 d6-20020a63d646000000b0041a6c24d829mr3290799pgj.470.1659107027389;
        Fri, 29 Jul 2022 08:03:47 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 x10-20020aa79aca000000b0051be16492basm2957080pfp.195.2022.07.29.08.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:03:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 4/5] tracker: upgrade 3.3.0 -> 3.3.1
Date: Fri, 29 Jul 2022 08:01:39 -0700
Message-Id: <20220729150140.104164-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729150140.104164-1-akuster808@gmail.com>
References: <20220729150140.104164-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 15:03:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98044

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  * Fixed blank nodes to return the correct identifier in certain
    queries.
  * Fixes to FTS consistency after updates
  * Fixes to HTTP module linking
  * Fix handling of STRING_LITERAL_LONG1/2 terminals
  * Fix handling of negated property paths
  * Use .so suffix for modules on all platforms
  * Added code examples in JS/Python
  * Developer documentation improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 91d468a051f90d4df3550b911a4604db490d8d50)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tracker/{tracker_3.3.0.bb => tracker_3.3.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.0.bb => tracker_3.3.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
index bb2396af7c..42f44863ba 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "0706f96fe7f95df42acec812c1de7b4593a0d648321ca83506a9d71e22417bda"
+SRC_URI[archive.sha256sum] = "5ad6f5bc97781ebf55ecd6947cd4ae7ff4192516580d10bd8380f1dd47196ed2"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


