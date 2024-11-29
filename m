Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E16D6D25B
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:46:35 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.116419.1732891586065059129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZYCqUaZl;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so2127856a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732891584; x=1733496384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxCS/EoPjYFVASkR0QBjXTn/cxnNxY/WVV0HMgVmWFI=;
        b=ZYCqUaZlD5hzCHyye13dbgZQ5uY4YyFgJo9ersS5VH9sWWARyA+fZBY5wBVLZQbG55
         UJEeLzUNNQQKhS3Z3xmXyJujkcFo9dmrGEOtU7cIasv+3aWzWmZ1W26zF9RifbX/OD9J
         qrXPTvHb8Nk6d51aAXgu/1C0NordK63Hwks4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891584; x=1733496384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxCS/EoPjYFVASkR0QBjXTn/cxnNxY/WVV0HMgVmWFI=;
        b=Oo1OOmSZFCyBmBQVwX2haZFBmYm2PEcL4gRAKIGSmS9vC13TL3yMsMkMXRrJxLEWfF
         Q4HuKJVMgvklVjP9l6Isgof9lVbGgqlwJF1mn+z6xTEJuGQkYE3JOpycZBTv4M0GVRcQ
         A7WZj+qzZSU/EtMlcRFEAZWjCjbkMzTjehqlMBrbqy4pLYzWJ3GWGLQWELZ0SlVpbvlI
         BXmb7aaFVS6fkcVKuJrLCYarVZtJAX+30vu8we/K6Ay2XsLJPldEuxpKNjVZ8mjNxM0g
         pAhDLgkIrQFr3Sw6nilR8GwaRvAkkeNg8feG2CvXtvMGPjbDp08H8c4oUuCfLPtUrD1v
         CeIA==
X-Gm-Message-State: AOJu0Yxi3bHGtLabJ0ZCa47D7parOfZaKvUZ1roFRb150b1VkwPkQTR/
	CKBY0tlsEfPo35pobZA26fsSHe5DkG+WAehvN5/0nDzMBPN0VUPNq/LBZAOAAS8igmQ9Pyx6BgV
	3
X-Gm-Gg: ASbGncsth4UtqAuTvyJu1lQQ/dJpVdG42iT/7ixtNNuMbG4uQkom1uw6DzaBFKBQH6k
	Bn/tzbLIYlLDaXlp6fUXttXZEB0bmD9sQR23jadqZYPoJeUxGme6ttCBRnaya3+gp52FGkL4lup
	a2opXkWVkS9xTTbRXJUT5ExrKImYguCUPlwoeD+Boez+P/4n9oNfxQ146qAS47sHReuOciqB0Fj
	gSJYMiLDsWUoXsylcHDu8C9GQJ43q74qxmmdXoYQvpS/ynIJqkuctI5vutMED5p
X-Google-Smtp-Source: AGHT+IGSUGktqH/kjkFRQnBGearq1/4d+jBvd4lHVBglJWVQNj4tceTqBq31LZ0COsD51r2vrkXbeQ==
X-Received: by 2002:a05:6402:13d1:b0:5cf:a1c1:526e with SMTP id 4fb4d7f45d1cf-5d080bb24a0mr11600220a12.10.1732891584020;
        Fri, 29 Nov 2024 06:46:24 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b87cb290sm622832a12.12.2024.11.29.06.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:46:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-typer: Upgrade 0.13.1 -> 0.14.0
Date: Fri, 29 Nov 2024 16:46:17 +0200
Message-Id: <20241129144619.780319-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129144619.780319-1-leon.anavi@konsulko.com>
References: <20241129144619.780319-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 14:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114116

Upgrade to version 0.14.0:

- Remove auto naming of groups added via add_typer based on the
  group's callback function name

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-typer_0.13.1.bb => python3-typer_0.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.13.1.bb => python3-typer_0.14.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.13.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.14.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.13.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.14.0.bb
index e7879caafe..4074f31eb8 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.14.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/tiangolo/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "9d444cb96cc268ce6f8b94e13b4335084cef4c079998a9f4851a90229a3bd25c"
+SRC_URI[sha256sum] = "af58f737f8d0c0c37b9f955a6d39000b9ff97813afcbeef56af5e37cf743b45a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.5


