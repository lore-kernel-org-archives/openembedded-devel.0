Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EC7C38A23
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.2123.1674324088066323550
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Te3U8cW4;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so11896200pjg.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI/25VhHbiUyxNIZZnEGfn5/N4f2+D9dPjMKIxsF95s=;
        b=Te3U8cW48sQZ9eQdcsvwNyi7z/qbSUGAEOdrcXNGGY+f+RT3O+8R1d7puE8IYYQbVL
         A1PHw0/eLMOEU63T72L0I6z1jNtuBXumc26uH61bdnnSlmVRVyrb291CoZaM+EZ0jg0r
         y8Zu308pAOwp/5fUF/D89Zk6IgyYkBiswQVv5AJsktqlOB4VzojEjLFnbITmXATUwFIp
         +fZINNUiE4fpaqsanFq/MO8XV4nYKhejigseLv5k5zJ5ajDkFIceytdjYnvn9okS9iOc
         f2P4a0G+fNdgbLu8kn6KkJb4KyJb1w8AZO2eUtyJkTZw997zjMHrgah5JbaOQJTT4kA9
         Boew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI/25VhHbiUyxNIZZnEGfn5/N4f2+D9dPjMKIxsF95s=;
        b=0liOprFEmGB7hwJbFjOCPmH177/6oEAfKvAO1PwOL7jf/KNHxVe4jW9XEK+wLb7JdM
         517Rq8rdLvWK81VI3mUNfzY+f1zDBkK4ZRI3uJQa/cWKnf9F8McqBa3QWn0ksSEWQcEh
         u4eJCFB24T8Q2FqyL68X64TZxKGO9X7M6x5HcFdcyoK7Gf1RmNEjXstT3TH0IoJY+Wci
         ca5PXvDc7ijwijuaPiekdNgtTYZBhfGd85qigl0/kcqbuwy8ir9wSP4mXjjxeQvEIJs2
         QJMpxLGArlWp3x6WLGWu+3RFKOlwDp9urDC8qzDmwBts8KXaSogQivVq7RQ3qvFYM/x9
         RWzQ==
X-Gm-Message-State: AFqh2kq+h8QC5onAXDaYujcRyEo4H5C2YEiK8XmB+22ts5oFXxng5FvC
	Mg3sov5Cdw3u2oXk3uQ6yPPyHxhPcQq0jw==
X-Google-Smtp-Source: AMrXdXvBkpsyrhHIeSChf4rjkMLlgPDWxcVl9m93FxS7a5fVo8gqgainXs5CSHS4AdEQ+mIqBNqF3Q==
X-Received: by 2002:a17:90b:1b49:b0:22b:b5e9:ec37 with SMTP id nv9-20020a17090b1b4900b0022bb5e9ec37mr5972648pjb.1.1674324092732;
        Sat, 21 Jan 2023 10:01:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/30] log4cpp: Keep using std=c++14
Date: Sat, 21 Jan 2023 10:01:02 -0800
Message-Id: <20230121180121.1229895-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100678

It still needs auto_ptr which is pre c++17

| ../../log4cpp/include/log4cpp/BufferingAppender.hh:21:81: error: no template named 'auto_ptr' in namespace 'std'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
index d9a55dd761..8e6d455174 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.3.bb
@@ -19,3 +19,5 @@ EXTRA_OECONF = "\
     --enable-html-docs=no \
     --enable-latex-docs=no \
 "
+
+CXXFLAGS += "-std=c++14"
-- 
2.39.1


