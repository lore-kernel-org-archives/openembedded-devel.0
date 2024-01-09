Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5440C47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:53:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.17019.1704808390809522341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=khcvX2ul;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a28e31563ebso309157266b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1704808389; x=1705413189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8FbgqwpewryFWSfdn4dKFXejex62FzZfjkwd5zqM0M=;
        b=khcvX2ulHEepLeSJ8fI5ZgPULsOjls2h6MhdZm/AYFa2HUsAfnyITVt0OTymcUCZz4
         JwHrJeqN3+LRmLi+jPkclhNDPOVKrnJlgsXtAaek8beMVf6WkpK98K0ksJapJh95Pn1e
         gBOoPuNwyYS/2qQnSq+s+MJWPMBkVyB+kEvGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704808389; x=1705413189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8FbgqwpewryFWSfdn4dKFXejex62FzZfjkwd5zqM0M=;
        b=rCb+BeXaPwnKNfk6Wg4+EujfydOFZOzx8frJMk+dWswk/jFj7TjV/3UhvhiiqS+xDc
         1pgGJPICYfzF6sauptilBBlnt4ZXzG3MjvBjAxo1y1TXC0oJ56TeZUwVYLefg8Fww4dV
         gAq2/ZyRCj8e4ySxXkPJCHb19ioe+GQHFWUb/8pIaDU/iS4NEpZxwz2lVLw3tpmmFmma
         vEX+AUAXzsRdDT3tEA8ygVnJJrgT1uPPhujB2QyCd4KwFsLYeDFb9yZCz2/mvJdsj9iY
         Ud9QQB6OnxuZBxcCWLWH+CXneCVFH8iVnI1B2Fb+fuc9Qc/Odq4LuLvlj5xWlB0dol9O
         CaPg==
X-Gm-Message-State: AOJu0YydmAfMMjugLrA80ieOtAoJbZdKp+8xlJjjpzsD4IF/hOdngttn
	nTlBew8ObAKbgZQR7SBOqgklfEPefgBAQkaxdDoVWKz3xFo=
X-Google-Smtp-Source: AGHT+IEMHKjgElSQmoNS7ggpFY/7qdfO35N4V21XxjHN6DP8W2e3LX05Gs6EJEnqkPhz4pgUwx678Q==
X-Received: by 2002:a17:907:7e8e:b0:a27:9bb7:622c with SMTP id qb14-20020a1709077e8e00b00a279bb7622cmr633043ejc.63.1704808388145;
        Tue, 09 Jan 2024 05:53:08 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906590e00b00a26c2f13b73sm1084132ejq.143.2024.01.09.05.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:52:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-wtforms: Upgrade 3.1.1 -> 3.1.2
Date: Tue,  9 Jan 2024 15:51:20 +0200
Message-Id: <20240109135121.3460927-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109135121.3460927-1-leon.anavi@konsulko.com>
References: <20240109135121.3460927-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108194

Upgrade to version 3.1.2:

- Fix SelectMultipleField value coercion on validation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wtforms_3.1.1.bb => python3-wtforms_3.1.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_3.1.1.bb => python3-wtforms_3.1.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
index b57c31100..1459538ea 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
-SRC_URI[sha256sum] = "5e51df8af9a60f6beead75efa10975e97768825a82146a65c7cbf5b915990620"
+SRC_URI[sha256sum] = "f8d76180d7239c94c6322f7990ae1216dae3659b7aa1cee94b6318bdffb474b9"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/WTForms"
 UPSTREAM_CHECK_REGEX = "/WTForms/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.39.2


