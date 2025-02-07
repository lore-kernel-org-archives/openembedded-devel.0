Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1672FC02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:48:31 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.65237.1738918108029892833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Feb 2025 00:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MEYaKLz7;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcebd8604bso2430003a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Feb 2025 00:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738918106; x=1739522906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVIK8jSTY7gYPamCV+majNU5fO1cQXxVDJivPruv9mE=;
        b=MEYaKLz7plY6rLxgr9raPtnQzhU4JrlGbt+gx9dtDKUsSibTzb0B87yr+qg+I0Cix5
         wWGG7C1HKA75fQLkcvWxXEd+Ba8HVMwv0HhR22rR8K51HM5SwGxOqI4aQg4i7hYsOnG3
         DI3FEVyeyOEga3bKqC4LwT56yqasIGaf5DTVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918106; x=1739522906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVIK8jSTY7gYPamCV+majNU5fO1cQXxVDJivPruv9mE=;
        b=edPUs2JonLZel9b1/eNHYQjQsP8FdpfsYBnegKZIQeIhRw8U/8Ulp0u0EQ+Cbh3uSL
         j9ftAs9Z/EdIw3RV5yQqZWXOmpSfNp8arh+brHspYueg6JqJW0KWSs74G87E7+tyUOM+
         AxN58+NMULmbRDA8Vk4QoI9pB9clAYD96JOQMvCHjE96GpeZRD1B6rr0jGgjXVGpH+WI
         OrlpaKTTHh0iROgJZ3Seq+mr0UV4KZOt9/SXADjoUVVJcoOYC9EiUKfE4t8OLfowB2cR
         ezg90hfNp6L6m8BynZj/3p5GOeGxBT2QVmWBAIfLsca+XtxecILkllrEhU4X3yJzj4te
         +cKw==
X-Gm-Message-State: AOJu0Yzo2iSwROJWLa73WVBXtVxvolh00j49UUMPUk5rSODsNeY0cmfz
	qrO3QbYXrODX5d1y+aWjdLNlnLdApxAjJUarq+6p21GxEYNHEzbETax8MmAkvAfIvBkmPcZgWS+
	V
X-Gm-Gg: ASbGncug7bjNVH4rL+AJhNrJZVmM5eJqb4Q7Zjd71ChBw3t7E1rEnhZYcoDAsEYxqh9
	m3PLErDPCWZESngLhuLYRFULGYKT2B/0AtWtHdXa8j88L7Fb8McOueqePz22aflcJseFZKz2vle
	iWWcQIgRbL8b6mSM7YHPZ0pBZEj/eYzx/fPgfX4ik4xMaM/H4II7WZkMvf+4SEqFGMkEG3GAU0s
	z/4Y+OUsdOzy//QL+Ve+oDE2hYrCK4LBx1BxrH3mwUAYpPTclofIjq2DAagcCJvaSMS/aB/0o6a
	WbGtYiLctFOSaZTr+nQj9OSkq3ECHQ==
X-Google-Smtp-Source: AGHT+IGtErv4ybQGU5OD/0GWgrVPAJl0hBXqW/HA7eiuCVvs4Xwh9MB+lpvVbsSGwvNKZ5+Xbm7cIw==
X-Received: by 2002:a05:6402:3907:b0:5dc:893d:6df3 with SMTP id 4fb4d7f45d1cf-5de44e5b84bmr7094901a12.0.1738918105915;
        Fri, 07 Feb 2025 00:48:25 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4bd92f60sm455794a12.71.2025.02.07.00.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:48:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] valkey: Upgrade 8.0.1 -> 8.0.2
Date: Fri,  7 Feb 2025 10:48:22 +0200
Message-Id: <20250207084822.2094041-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Feb 2025 08:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115305

Upgrade to release 8.0.2:

Security fixes:
- (CVE-2024-46981) Lua script commands may lead to remote code
  execution.
- (CVE-2024-51741) Denial-of-service due to malformed ACL
  selectors.

Bug fixes:
- Fix an uncommon crash when using TLS with dual channel
  replication.
- Make sure repl_down_since is correctly reset when dual channel
  replication fails.
- Fix a performance regression where a replica does not properly
  initialize the database size when loading a snapshot during
  replication.
- Make sure the last accessed time is correctly updated when using
  the TOUCH command with the CLIENT NO-TOUCH option.
- Fix a bug where total_net_repl_output_bytes may report the wrong.
- Fix a bug where used_memory_scripts may report the wrong value.
- Fix a bug where server might crash when using active defrag when
  scripts are evicted from the script cache.
- Fix a bug where extra memory would be used when storing strings
  in the inline protocol.
- Fix a bug where the SORT command may throw a cross slot error.
- Fix a bug where the RANDOMKEY command may omit returning keys in
  cluster mode.
- Send the correct error message when FUNCTION KIlL is used to kill
  an ongoing script.
- Fix a potential memory corruption when databases are emptied,
  such as through FLUSHDB, when during active defrag is running.

Behavior changes
- Revert an unintended breaking change when sending an unsubuscribe
command when a client is not subscribed to any channels.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../valkey/{valkey_8.0.1.bb => valkey_8.0.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_8.0.1.bb => valkey_8.0.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_8.0.1.bb b/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_8.0.1.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
index a62abebfbd..5f05f227c6 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.0.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "4fbab5740bfef66918d6c2950dd2b3b4e07815a2"
+SRCREV = "d6a2f561e2751d4ab246ad084e4fa185526fa479"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


