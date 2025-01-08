Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07976E77197
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 03:33:28 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.10808.1736307205727437751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 19:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P3k2VhBq;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: schonm@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so5145763137.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 19:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736307204; x=1736912004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Se1ujyWUHMz1ad7SoGHp94UntrmUGQyz5kNHXmdGUSo=;
        b=P3k2VhBq+AshppKkE1E0v7avLnRzdlv4EoLhssiDldXb8Gby7jOBRvF2N1Viyvy+oT
         oUo4vOq4z/+VlV2qX1f4Gmh7iRCnrIiUdWck4/xQRGcidj4oZSzoe8rUODWTDhN4Rsv9
         Vcpt+/L65wRaOop77hsjf3VirkWUZKu7f8A4wTvb6lDSrG2UY9VRJOw8rPZEqX4iPAtU
         YyfFzvNlgceETWO5czgdeHr411rl8wph6fvEeepCJIzQhNihlTSr+TTikfRSgGuJ4gSm
         7jWdRD7qWJVHjR+T94avRmi++pA8OG07Co3EsMVtdndylqNCdFUleXRlp2pVSGeqp9HL
         pBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736307204; x=1736912004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Se1ujyWUHMz1ad7SoGHp94UntrmUGQyz5kNHXmdGUSo=;
        b=MTIo+E+ngke32i8bum8vSsr7kLIDeLgj10foq5AttR7jWx704m/fExRXuBY7P7cgwT
         jOw82JwR1ETeejDOu6UDSisb0cC2EfOpkgMw2RYNrpXASKllWgnM3fB5kmqj1OyipCK6
         /ojRj9ztscYoESfRtX+tOac8ZpOecJf0kCAyH+JAuFI3aWMgS97HwOdm0o+QhIu6fQC4
         sMyT+uznUa1coQ+m0MQjRHok5/qMa5ZffvPRnAPVyW3f7QfxqNxlQPR7S+vzV0kN8Yvj
         UF4mD6B/KmaQa1oTeVU1Nwo/UQTuAqffFI7bJcz4REajp7c7h2XDe62bKPjQK5C6n3HV
         4S5w==
X-Gm-Message-State: AOJu0Yw8SEV38YbWkZzJ6sPFDCT+kU0XP2FSUg8XmnnqX+A4nOPqN3W1
	IExoqXIDnNyfFFqrbUt6RyBN5UNl2pFptOSwiyhPjIm3J0Z38YNNKAceCQWc
X-Gm-Gg: ASbGncuzSUjvXKVNi/3gNv03DScIur+F26oUQTmsPjsWNU1j/2GfkiBwoAXo2vSSyvd
	l/anmja2VuT22pMbzXt1ubCKmdNiPu78AklupakmiA41dd6rUdVqe3bhQFMNHV25R6j+0Bxwx6w
	SO9LaeX+tJy4nbu1tQSs7AaO6nXMVk05dDW3ITsOxISyadYBmvTgI5ZE8ivxdBRhRtFFl7/Pj5q
	rfq5PNH4rbrYmmvehtgqp9b/ZYP7bgfOENju1vf761jct34/VxroezGVTBl/Jc=
X-Google-Smtp-Source: AGHT+IHgcZ/5JB4j/e7m0ixj7pNNF4eIKQuoIZFAilhIEYieeiRYYAS2UbxkEhEIPAlIEAK/dCqWfg==
X-Received: by 2002:a05:6102:dcf:b0:4b2:5c0a:92c0 with SMTP id ada2fe7eead31-4b3d0fc95bfmr1049709137.13.1736307204294;
        Tue, 07 Jan 2025 19:33:24 -0800 (PST)
Received: from localhost.localdomain ([71.215.2.167])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad38ecsm8184131137.29.2025.01.07.19.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:33:23 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] onig: upgrade 6.9.9 -> 6.9.10
Date: Tue,  7 Jan 2025 22:32:09 -0500
Message-ID: <20250108033209.19148-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 03:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114733

Changelog:

  * Update Unicode version 16.0
  * Add new operator (*SKIP)
  * Fixed: ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS not working for ^* pattern (Issue #292)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/onig/{onig_6.9.9.bb => onig_6.9.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/onig/{onig_6.9.9.bb => onig_6.9.10.bb} (92%)

diff --git a/meta-oe/recipes-support/onig/onig_6.9.9.bb b/meta-oe/recipes-support/onig/onig_6.9.10.bb
similarity index 92%
rename from meta-oe/recipes-support/onig/onig_6.9.9.bb
rename to meta-oe/recipes-support/onig/onig_6.9.10.bb
index 414d9bfc1..f285c2ed7 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.9.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.10.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf"
+SRC_URI[sha256sum] = "2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05"
 
 UPSTREAM_CHECK_URI = "https://github.com/kkos/oniguruma/releases/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


