Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C05C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:41:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.45904.1748857302285050772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 02:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QjPPBWGV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f89c6e61so1520433f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748857300; x=1749462100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgXoFoHMhLw/JmzJxTxTUdmCCKwrnEWb83iXemF6xCI=;
        b=QjPPBWGVjx4dNwSlRnqp3fWoNA8uWO7ZiR3uxO5fkiI/WqKd+dHVFM7uvWIDtBLFcg
         Sk9YRevnC7nj14Ku6py8vdsWxQ7G/2fgcws0SVhCRj9NnH7NThzm0Uj4fGXRdG0GjOTu
         fqiXGdMiX474yqnWq5qNQqLWLUC+AviBfzS9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857300; x=1749462100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgXoFoHMhLw/JmzJxTxTUdmCCKwrnEWb83iXemF6xCI=;
        b=mZKctvtysbqvy9BCZIWyfivM5nAUItqtP/bhBAMg5hGZs4gTpCQUls/LhHxwNYAiqu
         aM0d6WU0baz2DSdXTWRsxIN+DVk+u5CNtAQ34nIfwjXlnJdEOOwBVshYpx39WHfwWOQm
         bk3/HNS7EpE8EFDqXhW9vEOo0wW4P/CmOtGKzFonKWsgH3WE/RBwj8+hsQYiBWNdy14T
         ZhYsTzYAFRN0F7QU4n+/VSwGJ6WFBTkC21ExBA0OekhusbRkRo4UInRpE4iosK78JINK
         E1AcBCVMV0phhgYKryQfNhiyBXi/vfQ2G6esAm99UWueAjI/+5onNkP++iH/bFUps91H
         z0jg==
X-Gm-Message-State: AOJu0Yw54E9z5XE/eRw2w9+BnGWGfoAHd+GmI/c063BkRp7t4nE90Q8B
	/wNN0dIE11nrPP7JzUObltHhvYyYtNR7BLzgMktNMBIFWvQrtcqguoXByKOTE7vZkjFmW+UqnDn
	fVn0M
X-Gm-Gg: ASbGncs8MyENk1omn4T4iz8h4IpMb3wKrF+KSSgQp6gjO3fGNhsw9wF58lnIrsF5gzL
	ozm9ZFEVuCZ0B3TCErZPwgcSu4dUmz/4H/mYXuZw33JrdM3bbHSYHqcnv+y/tYwgj0YOiIVyNCS
	N6gXbwDjrufVbTWMYqzC+aYfmX/ehnFp+g2BqBEXy1V8qOaty7OqYLAn4XNpcLSEdT/q3zlGMaF
	xHHtpD4h1NjxjR1KCPrlCgxEKujsdiEFSVacfrDxJT/udo9dB8usvy445GFvrkj4jKikI9pB776
	gJ4xsfWWZHLGS57e7oJD6s/9NHc9Xji4QxZubGVvZSEJtSkXQQvfEY2gf9YjyrwKiA==
X-Google-Smtp-Source: AGHT+IFKtf4zC/ZWkj/lzzuqqq6TG7HKxcX2CotWxh/NC4WrTn8YakpDdfTJJJGQVW56sCLBdI7Lrw==
X-Received: by 2002:a05:6000:25c5:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a4fe17ba17mr5629034f8f.22.1748857300393;
        Mon, 02 Jun 2025 02:41:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm14025417f8f.41.2025.06.02.02.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 02:41:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-cmd2: Upgrade 2.5.11 -> 2.6.0
Date: Mon,  2 Jun 2025 12:41:34 +0300
Message-Id: <20250602094135.830557-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602094135.830557-1-leon.anavi@konsulko.com>
References: <20250602094135.830557-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 09:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117700

Upgrade to release 2.6.0:

- cmd2 2.6 supports Python 3.9+ (removed support for Python 3.8)
- Added support for Python 3.14
- Added new Cmd.ppretty() method for pretty printing arbitrary
  Python data structures
- Clarified help text for -t/--transcript argument to the history
  command

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.5.11.bb => python3-cmd2_2.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.5.11.bb => python3-cmd2_2.6.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.6.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.6.0.bb
index 45644b4e8f..b5dc97fb02 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "30a0d385021fbe4a4116672845e5695bbe56eb682f9096066776394f954a7429"
+SRC_URI[sha256sum] = "8cffaba7810526421cab3bfa0101b4907e1298ff2bcd8119615965a2eae5d95f"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.39.5


