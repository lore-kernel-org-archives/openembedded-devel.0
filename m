Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E09AC0218F
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:13:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.6455.1737620035066315224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y5dTqfG0;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab651f1dd36so137808466b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737620033; x=1738224833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP4cGL2mz7wm2UyvCoABQEC6/osxKUZRlYaio+TUV3U=;
        b=Y5dTqfG0CgWJ3DAiP45iIo3x+1Q0lYGKotKD1UHhDqUtY8ZsmXb8pnmnmhShxb6NOJ
         0mzuye0yoeL/9dswLdl/OHtA15mhPmM1aZLWxowP+Ua6Vheeykk9s/OR1KILAiyssbEA
         Z8OKZD7avSMdXO92nD7UING8vYsMaH8JrIkL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737620033; x=1738224833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OP4cGL2mz7wm2UyvCoABQEC6/osxKUZRlYaio+TUV3U=;
        b=fMzbSczM61cI6niR2J17EC1TExM+MjEjdIvg8gJ++JcZPK1rBxLHYX1/CHlsNDPjgo
         Pyyfp1NwH4heqKZP1mmJkMP2shDpWL0ciOOQn5gBjepWKmEkp287RqA+OMTna0lepWun
         XpR5NnZLSDWz1Cfu+u6UnU1q7O1NUqPVJqKU5vlV/pkvekcopNzpc2DMJztmK9kCXGid
         zqFNVt3nEjBboxbIs+fGPLBRLf/qm6S12KGjMMXPOZIE6rvEG6C5BYG1F9tp377w5CQ+
         s4UJxKC+mCeSXXq2MCetFMRMctCD93P9VZUZnih+CM4wHo+u+8zH5Kyk6f7MlxocU+iS
         +Qgw==
X-Gm-Message-State: AOJu0Yz8/zPvbaZoWpUeXszbivezzh9GbWC5tlTa6x9k8NfUUac0mzWm
	5mP0A+erywHWpiZKpPI8xglOoERxlSrXDShdmKYmy0Wv1U4kB1NiNnw3V42O8w+Nc/Do9IqYmKd
	v
X-Gm-Gg: ASbGncso1XEfnhAx7Jm8YH9R3fbg21gsC5WLwvTd8eAdJkOp71OEwhi01cybmUq4/RU
	xCImQzJ0tC7ikjVxsqG/kojcbdG+CyL5uKb1T0uf/CT/aiG4R1MMzLfJ4Y+dOxgqAw9scMJbC08
	p4z6btlnVUgOp26ySBeLUZEnoEUA/7FYjgLzWVHhmhfGxxw2uCRaNjgk2mta1f6cB368gVcG/1O
	nD2t7FSMgrNeNkcPf5h3fUMOITGr9OIsvrXseIcXuCueAE+j60KlfMfSr15e/aF75N2IsI+w1aV
	UXERofGt0UWYFReL6m0=
X-Google-Smtp-Source: AGHT+IEffKdfc8RPCLS+hl+Xy2rq4dpp2pP1GrD1bmR28pY/JFCCM0cr/Y7mrTKag5H72k8Nmrr/0A==
X-Received: by 2002:a17:907:7eaa:b0:aac:439:10ce with SMTP id a640c23a62f3a-ab38b2cef0bmr2544219766b.27.1737620033241;
        Thu, 23 Jan 2025 00:13:53 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f290fasm1040414966b.103.2025.01.23.00.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:13:52 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-zeroconf: Upgrade 0.140.1 -> 0.141.0
Date: Thu, 23 Jan 2025 10:13:47 +0200
Message-Id: <20250123081349.3440231-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250123081349.3440231-1-leon.anavi@konsulko.com>
References: <20250123081349.3440231-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 08:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115030

Upgrade to release 0.141.0:

- Speed up adding and expiring records in the DNSCache

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.140.1.bb => python3-zeroconf_0.141.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.140.1.bb => python3-zeroconf_0.141.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.140.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.140.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
index ced5e31f49..f545f2b550 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.140.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=93e84222c4bfa3e70c20bb48ae9893b1"
 
-SRC_URI[sha256sum] = "477d396cb712247aa5859e59249aabdad3fab1139097794e70b2e4b1625047bf"
+SRC_URI[sha256sum] = "c0c41cfe1331cf885f132dd2400e4091f59ae0a571cae14f3db66919a055489b"
 
 inherit pypi python_poetry_core cython
 
-- 
2.39.5


