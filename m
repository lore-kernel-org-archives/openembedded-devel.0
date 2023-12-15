Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9D8C46CCD
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:01:15 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.65786.1702656074433182475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tpp5ybKr;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so92477666b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 08:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702656072; x=1703260872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1pZc1DoaWvTwwpuxZauJwGEIHv4SR3C6fn25hF1KxI=;
        b=tpp5ybKrlTDTs1Y2QAKgdueslsE0N8eKH8XOhcyvgSRiw+sh1L/Vg7ouKueeAOOiLX
         LMmaJCLTV/ED+r5S59IkZ7IAgmQ9mue+wIZFy8BVkY0yDNoepLrlSkAuORgOh8gKjnIe
         cqiVLz647N/OcybS3jQad7CSHng2IcTewtkUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702656072; x=1703260872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1pZc1DoaWvTwwpuxZauJwGEIHv4SR3C6fn25hF1KxI=;
        b=o2+lNjdw8SZMDirHWcleKTK7rh0DJoJHnpnhCZdjE3xu9MGScWYolNufMSMzc4NdRn
         nADFuLtn9aZTTn7i4qptsZW7V3EEeDzKeOr8NS7/GBkusLnud0Uv6eP61Y2Bz4pnWJ0E
         xfQcNm+bGZL6lhlzcGM2JCU2tC1d/YEveJgKapjvI3WQ7kr2mSnWuWYWSu9KxtWqhrfZ
         RgI9vujHd3LfgOsAogUlezJ0CXnHApK+8W5pLh96POS/ARBT/eSa9JSD+HvslKN4OJBL
         N4GcujbTXv0nzN8/AFLf7gx4qDsRBKgToWJS+C9ixqxZQkoeP+r1DIvZLTcU12fLn789
         jwFA==
X-Gm-Message-State: AOJu0YxCh1U//YFw4Np4wh5TlWKeiLIGgauI/CBNA6ld9yeCIwITm44O
	HwF3XTw6y4LvQBApJEhH1koSIjmBI/jjRFUR+JM=
X-Google-Smtp-Source: AGHT+IGte/lnycO1ZKEfb1WzUT4QwM9axylYA+z0UpxEoBNbZcd/2LFvRnSjdZ0UKfEFHhQAxkpOSQ==
X-Received: by 2002:a17:906:bcef:b0:a19:a19a:eae2 with SMTP id op15-20020a170906bcef00b00a19a19aeae2mr5732011ejb.155.1702656072718;
        Fri, 15 Dec 2023 08:01:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id mm20-20020a1709077a9400b00a1a53e9f401sm10926896ejc.132.2023.12.15.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:01:12 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-cycler: upgrade 0.11.0 -> 0.12.1
Date: Fri, 15 Dec 2023 18:01:02 +0200
Message-Id: <20231215160103.2164505-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215160103.2164505-1-leon.anavi@konsulko.com>
References: <20231215160103.2164505-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 16:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107526

Upgrade to version 0.12.1:

- Addition of type hints.
- Fixes the previous release not shipping the py.typed file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cycler_0.11.0.bb => python3-cycler_0.12.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cycler_0.11.0.bb => python3-cycler_0.12.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb
rename to meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
index 59492e8bf..574083b61 100644
--- a/meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://github.com/matplotlib/cycler"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
 
-SRC_URI[sha256sum] = "9c87405839a19696e837b3b818fed3f5f69f16f1eec1a1ad77e043dcea9c772f"
+SRC_URI[sha256sum] = "88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.39.2


