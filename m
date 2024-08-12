Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467B3C52D7B
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 03:29:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.38302.1723433318665801915
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 20:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gvZx00+u;
 spf=pass (domain: konsulko.com, ip: 209.85.210.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-710e39961f4so984602b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 20:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723433318; x=1724038118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJhb4WklUTHT6OiBxQFFoJI62Fyue1Ey/9r+TVXUR/0=;
        b=gvZx00+uYE7N34wulWIMfR8jTk+Wejenr9MZKsEd1Cphi4imfoAv1SJ+yOYHk156od
         eh89thd3k7+HQDtWiUpzGxpe9/MP5izCdVC3NdrRmitOZlkvWOnmMSmujMFnzuq0ntJI
         UW/fA6GfSof1SfMIvfwen7Pq7MDoHGYP9zciU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723433318; x=1724038118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJhb4WklUTHT6OiBxQFFoJI62Fyue1Ey/9r+TVXUR/0=;
        b=AAJLDl60m+QOKnsKmKCFnEw+JEyXCNN87o0+JCRW0W17xacX1NqGTd82kZDftbqwxf
         EvztbL+lY/x3sJv5iXD+zD0LoeWEXTnCf+s4fijk+K/AT37F2FuFc66JMuriiEG6iOhN
         lz6HfRgdezNhvIZtRUZsDM3ebBkFLlJvL0cYfqS9e2xAuiVjdUFGz3rLyrNv3KEr4KGC
         JJ1eWLSLqg0ngQIEwzuv1U9RWJ0cu3zFNvUEfF7C7iihcdVWDQY6mvt320tOdWDLr2hF
         W3qS3UAsjx3mt31vuWywFa7DbVb3PVST3h68wsVXJJ4oa7sFmomoGd/Ee3R5D2LGbcgf
         7S5w==
X-Gm-Message-State: AOJu0Yxv8ExWgh3K1HzPsiLwh4Mt4irep5z1wIpfaqboEiuZvRgig1+3
	ZBBHo9ZgeywtHnOUW0rraoowncgW1p6t3FH3m/kpl5PgYRBIsBBxkxoL0hoO0aWQ7GYoWI6ix1n
	qViw=
X-Google-Smtp-Source: AGHT+IGVJQEJynf/qvR+IFK5FlpMwtTdOu3SxiReZUxytmkZ+Lq0ww09QTtmcE5NzCvkyx186TA8ug==
X-Received: by 2002:a05:6a00:2e83:b0:70c:f1fa:d7bf with SMTP id d2e1a72fcca58-710dc6c1558mr5826244b3a.4.1723433317562;
        Sun, 11 Aug 2024 20:28:37 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a7aed7sm3102812b3a.144.2024.08.11.20.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:28:37 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [scarthgap][meta-python][PATCH 1/6] python3-pydantic: upgrade 2.7.0 -> 2.7.1
Date: Sun, 11 Aug 2024 20:28:09 -0700
Message-ID: <b1d10d60c75b01f1edeb4c688f6db7f45e015df9.1723432397.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723432397.git.tim.orling@konsulko.com>
References: <cover.1723432397.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 03:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111759

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Bump pydantic-core to v2.18.2
-Ftp and Websocket connection strings support
-Use field description for RootModel schema description when there is no docstring
-Fix validation_alias behavior with model_construct for AliasChoices and AliasPath
-Revert typing.Literal and import it outside the TYPE_CHECKING block
-Fix Secret serialization schema, applicable for unions
-Fix strict application to function-after with use_enum_values
-Address case where model_construct on a class which defines model_post_init fails with AttributeError
-Fix model_json_schema with config types
-Support multiple zeros as an int
-Fix validation of ints with leading unary plus
-Fix interaction between extra != 'ignore' and from_attributes=True
-Handle error from Enum's missing function as ValidationError
-Fix memory leak with Iterable validation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Backport from Styhead 6112eb064ccaf7b9c74b285e3fc070bab0343340 as part of the overall scarthgap fix
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-pydantic_2.7.0.bb => python3-pydantic_2.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.0.bb => python3-pydantic_2.7.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
index 36ad83527d..3c11144472 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b5ecdd42262ca2462e2624793551e80911a1e989f462910bb81aef974b4bb383"
+SRC_URI[sha256sum] = "e9dbb5eada8abe4d9ae5f46b9939aead650cd2b68f249bb3a8139dbe125803cc"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.46.0


