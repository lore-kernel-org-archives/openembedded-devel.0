Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3E3C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.23291.1668873522710716486
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Plb4bOaU;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id p18so5431264qkg.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rAfyE5l82hBFj1n99alDXdT+4HQDYiLQTKgNprHR+M=;
        b=Plb4bOaUNVYLOzN7c51HgyD40Pil3rWepqawIyJj0skRK+acXgCJWmDSs7oAu761f/
         oWRlsPQeagJvQX2eVfSU0kz84t057GV2QpiybC6JklvhVl+Kb55uhaDEKKRz9uqzzViT
         ueNHL/2ZliJAScjBhJGdNahl/eHubwdSp+xcENQbShGb88gk6atMpX+k7nocSB/tNxxu
         dfmHaL0ektV+D7UouTOJZSEbPmOxsLMoe90gKt5PJf5B8itk62Y/aXWOYxq2avuB4rVo
         9ivkfWnkjlLoEJnFUaxER6g0rNz2Pg+OCPlP67HrOz8JCKFQ4BsqFNQlffNZXEspKxjz
         JwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rAfyE5l82hBFj1n99alDXdT+4HQDYiLQTKgNprHR+M=;
        b=QotW7UMxR+F9Z4o3TRM9sOfLs18evR9BtRqaWQIksFx3jtPJ5VNkkRsbeHJtdoDFF/
         UFuSPxWJ3hYLRxmIaBDvk39W8wJ1ugxJZG0wd0nyeK8vHkM5Z8g8Eh3AEJL83wfI7nWj
         lzeuSIAZ89RhiLoAiYFD4gbjhLgnf+DJRZ7yXGNjG9c0tVqq6UjJCFV9iQqIoZ4ndG44
         Ai3IrpXBeBV/g3dHxU4Gwt2ete54bu3rG5pg6JHUD8TCj5Gindif7GetBRIe0128Zhko
         cwxj8XEWXZV8rS+e6haDlbAnKDuhiptwd8hbnhSZn90oarKMmmTbAVMYPfVGx5qUo3hZ
         cedQ==
X-Gm-Message-State: ANoB5plC0QIbMOQIslJoFO1ApiwRZazxY/68sH1FpovEgAD3BOmqGPXN
	9fSI7OKQiqJf7z2jLS4Fd1rKvXEQzRZo1w==
X-Google-Smtp-Source: AA0mqf4AGXY9xifYSeKAhvxxqarCJySua/AkIqhnR0P4ythAx8SbCf8Rs1GcKuaXAisy+fYRBe02Vg==
X-Received: by 2002:a05:620a:15a5:b0:6ba:f088:cfd8 with SMTP id f5-20020a05620a15a500b006baf088cfd8mr10347661qkk.736.1668873521415;
        Sat, 19 Nov 2022 07:58:41 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 25/35] tracker: upgrade 3.4.0 -> 3.4.1
Date: Sat, 19 Nov 2022 10:57:49 -0500
Message-Id: <605a1c6afd148988d12ceba305d22357915cf07e.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99664

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Fixes to VAPI file
  * Fixes to IRI escaping checks in TrackerResource
  * Move fts: prefix definition to base ontology
  * Improve memory usage of already executed TrackerBatch objects
    for GC languages
  * Replace deprecated egrep tool usage in bash completion script
  * Fixes for memory leaks and invalid memory access
  * Fix endpoint-side cancellation of client-side D-Bus cancelled
    queries

Translations: ab, bg, hr, sk, tr

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db39f8875f18116abb77e339ad375e5898e38ac5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tracker/{tracker_3.4.0.bb => tracker_3.4.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.4.0.bb => tracker_3.4.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
index ed0fbb6f01..1428159ce3 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "b3b380c9571d7c7423b5f401e4a2f2d78de47143b035eb2c1281e2423c59218b"
+SRC_URI[archive.sha256sum] = "ea9d41a9fb9c2b42ad80fc2c82327b5c713d594c969b09e1a49be63fb74f4fae"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


