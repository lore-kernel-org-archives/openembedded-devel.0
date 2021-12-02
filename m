Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343ADC43217
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 12:19:17 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.7385.1638447556132575669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DkOCBg+b;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 nn15-20020a17090b38cf00b001ac7dd5d40cso4498881pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fu9sKguq9Fz+PVamKvBprXxYWVRy0hgD9nIp4Dt3Y58=;
        b=DkOCBg+b9vDAjW5bYCXwzf9MTwW58JiAGYPu4431th3bD0GVefVixSXHOy4BnXBYRM
         E0qiq4+KEvnCgSqNNEHQ3rWPLMAH9br9q6w0MpvyYhTNX8I8wr+/LE9F6G/AhVgnWNQw
         cpJYVatrVzOfeDo5CQdnUtqlEVuR9ONEdJPfNksKzJP1bFQTMpkgbulx9RvOl96HOkso
         bSymTN8kBHhQoeIisto0FSyUkLoQ9W8IWJfvc7CE7s2ZVaBYYIaMQSOTieU9v/roQY7y
         IHT1pupjY9VcgJLfpJCS8v3jxl44+k0Te8ANlq/iE98JCBPpbwvGXlWlZ+iysSgu+n2R
         3OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fu9sKguq9Fz+PVamKvBprXxYWVRy0hgD9nIp4Dt3Y58=;
        b=A22S/ONQSJ8tApojkh2cPfFxF66tyIsJ6cJojNUbpqyujxwrbHZ61atuEoW83gKhNP
         aXcEYR54Sg+JwL3wte6sVNhpbAQ+aOjSsgds4EzzPvuSsvpdZXgSAIjQndyHPkoU/Yjx
         Wfqj7Kgaat2A+ObtyPoeCn9NcbeZvGAZKqAkE0KKWHqH9korshGSQBDnir+VR7gavdBp
         VA0eT/4yIGB56MU8GMRDGI4nQlEH1oULIPfaqkJRs74TUWkEtqerIyCYTv9Z/LL/HWR5
         LbMzH7Yvxx7Osq5frrzPR3QrOI90Ovv1xDl2M1YgPMbl5Xn2VonyyDBTWk+LbEtyQmGT
         gLww==
X-Gm-Message-State: AOAM530PigeqV6oFt3749mChqnJRExA6Y/efIrrsZsRtTl2NoeKgBvr2
	1a2AVeAGfmHIploj2XeHEqGkLGWFhy4=
X-Google-Smtp-Source: 
 ABdhPJx17bh9lWjADllggkV62eho4fabhQgKxbB6QCvfZwV3r3gAiI8PtogNlTZCgUg1HuV+PfpRnA==
X-Received: by 2002:a17:90b:4a83:: with SMTP id
 lp3mr5724256pjb.34.1638447555436;
        Thu, 02 Dec 2021 04:19:15 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9b75:b57e:d1aa:6e39])
        by smtp.gmail.com with ESMTPSA id
 d2sm3396881pfj.42.2021.12.02.04.19.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 04:19:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 5/5] jansson: whitelist CVE-2020-36325
Date: Thu,  2 Dec 2021 04:19:05 -0800
Message-Id: 
 <e0e79bbde23f17185cc59908fee97c0cea098428.1638447451.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638447451.git.akuster808@gmail.com>
References: <cover.1638447451.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 12:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94184

From: Marta Rybczynska <marta.rybczynska@huawei.com>

According to the upstream [1], the bug happens only if the programmer
does not follow the API definition.

[1] https://github.com/akheron/jansson/issues/548

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/jansson/jansson_2.13.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
index d6e56ea768..7beea9f1e7 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
@@ -11,4 +11,7 @@ SRC_URI[sha256sum] = "f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f4
 
 inherit autotools pkgconfig
 
+# upstream considers it isn't a real bug https://github.com/akheron/jansson/issues/548
+CVE_CHECK_WHITELIST = "CVE-2020-36325 "
+
 BBCLASSEXTEND = "native"
-- 
2.25.1


