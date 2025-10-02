Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35709CCD189
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:37 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.7544.1759409971894192883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4bsW1IR;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b472842981fso146881266b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409970; x=1760014770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPvFOYs1JcAtQ6Di8ruzuwTZ8ODnc0CMuqggDYAQ/RA=;
        b=f4bsW1IRjHEAfJ7V3lYjnK5enM+b+QwK/x0J8UuEWKi0a/m4XCrE8Q9lHcomb45Ae1
         YXgcuF+t3N0f6KPqD3iOZCatAoWBIclHUJKTYOBuDB2RP3GVctg3i9jTS/VSG6c5vJ1J
         WfK76p2j968iQkO2VbxwCB0D+7Jmn+CuyNX6Jd6afQBkL9m91txWf2ZDE+IwW+dvd0ur
         8gsMm7ohnE9hXe0s7EXe++jgGgr1i8B0iBlRUkvvfPGcfLmnEwEDYLD4jqXdU4LzENha
         U0sGTahcnEvmgqJVDuio28sOZzCtn2vUZq+ZN/Ql+5t6ij5ZSjRv8/f0r2xa0KPooR8d
         avmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409970; x=1760014770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPvFOYs1JcAtQ6Di8ruzuwTZ8ODnc0CMuqggDYAQ/RA=;
        b=u9AibWF+XtyjGEZX2U1StVu3XkgYCidBqrrDeQPCenDMFgkJYMd+K6S4bciDiy/rUm
         HIWvaak6JQgX8n9DuuarWy4zyWn4uDdZqNnyGmBnZHnK5MXsQlPCdL99qqq3SWCLVo31
         Sn0mHC99itt2kza2tp0qSmHwAfIbM40QIyDgfZo7zajsvrvBh8o5RwSadpZy2nOj2Zf/
         IVI5EdYf2rH0hAmnDrrZnCv/DqN5yRd5eOEyA8SFLfXRdoXVYzw8tdgRfKqglV5rCoar
         o4P4MWgADtXFO9anvT3jNIA9k3XsZhJpX3Ihak0l31TjnTOLcZmQgGzM9Z03Nubp6Jau
         VtBQ==
X-Gm-Message-State: AOJu0YygW8vZQGogncasjZbLZOMDv0HrgxM7G77qBAO75dh6kLoxwhQs
	WQFSDXO+XBeNXk/vvVbQj+rbvauLLvT5qIrdYfkIVTdzR4t3djOCqnvxXuXhsQ==
X-Gm-Gg: ASbGncsCuMhL/pezi2naTAbBL1iWcH3xdhDdZ6EwTQv7QsSLy5pwMx/rpEnZ/MPioRP
	9gHKYKx5ocQUkD+tuXw82Qa9c4cIfLVJNGuPaqyH1bXSlX/QF6Zwol6KS+ovdr9JBXlIYryUxZF
	uee3T57hIkqsARrq7Xz2//HiRyO4U4EGUv/kUkGn4IEAzeRp88pXCeqqM5D8WwwDO+tmEEj3ZUK
	i+jalWsK9Qzk98rsmLTc94+CKj8wurE3o8MOmjbzl6SquAuL27sFwYDOzNu3CpWtbGQAn6qXyyD
	cm1UfGeqzKpeQ+hIBZPmY9jL29iPVyaW1feV2A8vZas316f0E4iDBlkwzNahHZLMYWvmra3n7M3
	vvv1vQjgRS1f9DWUxZXTX/GgwuOG9LwWCDrbSEojQy8zqcZR1S0zx9VM=
X-Google-Smtp-Source: AGHT+IEPgEzc7xi86B3Ivmqj9sQxWOrclL9GlP2Uysn112UrKdw871FBJAT4GNVJqM0xWiAa037rKA==
X-Received: by 2002:a17:907:2684:b0:b3e:bb87:772c with SMTP id a640c23a62f3a-b46e2ff190bmr942806966b.17.1759409970185;
        Thu, 02 Oct 2025 05:59:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/26] liboop: set correct LICENSE
Date: Thu,  2 Oct 2025 14:59:03 +0200
Message-ID: <20251002125926.2624522-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120172

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0ea9584b84b5e23af9cc7285757d9032f31a968f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index 7ad88b7402..d9d802a6dc 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Liboop is a low-level event loop management library for POSIX-based operating systems"
 HOMEPAGE = "http://www.lysator.liu.se/liboop/"
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
 
 SRC_URI = "http://ftp.lysator.liu.se/pub/liboop/liboop-${PV}.tar.gz \

