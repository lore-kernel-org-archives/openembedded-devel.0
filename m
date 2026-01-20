Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F67D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:03:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4930.1768910619058119146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SIDVfJQ+;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso10839818a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768910617; x=1769515417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaSoonJvXF6f63Rv2zct6b3NaVAfltELmXnh2fgRJI4=;
        b=SIDVfJQ+KOY9IJPFt7K3LiGyzav1NUFgcghtxlOkZALnsdhEwsOuDydbzm9zyH05Qi
         5YKXRLmDiNRwYNX/vVUuLvPfMtKJiKjWo5HP0j1KwqwZssqdUgWbNnDMz5vmNWaS0G01
         GkCitLTPDslP4SpUW/vkXvb/TE7qO555Fqo+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910617; x=1769515417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yaSoonJvXF6f63Rv2zct6b3NaVAfltELmXnh2fgRJI4=;
        b=u4MP/xL8QOvwhZ+1qRLBNO8yMo/HlRYD5KYXGtbTbkZvdL6Q2h3GScRzPNxrC1LkD2
         Gay20qRj5Uk9anQjSAJFJwmSJte/BeIpdg43DS36SXw16QF4VO7FtgDYYVSvUQSTEThw
         snFMtNebxyj4hb7yBbUfFFSSbS82olsQSgDPcfi0sHGX76HKpoJ6pmbcWtrL7eLY+y/c
         r5ZUlHFq0ASHdRdBhtTwiC5JXuvoEiE5YlzwIfBry10GskjwupA3WxvwZew+7tfhvUeP
         nfNoYjZKEeaDAlwGl4QIGaqcge5i1jaLx+LVf73uQaEgKABawrDxeOunwHDteZs7sALI
         k48g==
X-Gm-Message-State: AOJu0YzZpeA3lyC6T0ffT0BIPeA6/ft54gVTUjOQNHnfg4IuRK74KEQe
	ynrPu8JpbrXNRdcdsj0PN+PCl+ElZ25uKTFhdtfzgIMY3/AVp5gTA7mqoKkHGd9J4/OKNVPb4Uh
	znxtJ
X-Gm-Gg: AY/fxX5yQB5Qs7Si+M01kXDmmFv5kOD4wIy6Lkr//w+jS1OmrYDc0HYr3TCogUEM/ra
	u6gOMUWCZXp2Pc/wXyMJvw7wE3QMASKzapvkqqp/E9HVxIAEnW2RyF6CXaFC8BeXkFNOxNJZr7o
	lPTq+7tnI7EvKV36yq/oK0pkiUMaGpSzvxyXvrYVgn349W5WBqNuge/DT8TRTB9MaYWx0OHdpxQ
	LjBU7fs033Vr3Q5RMhhelwc2ad/h4RLmKo5FxK7Q9P5MI+NF9ii6VjQm58Tj3uQW8Ivmy7LEpK/
	ssf/5XxE+jEi3QWmXSj7WFTiDmtOeOrr8DDAbjlWAXHW7Zb/R4ZcjPvKEdnGUcUJANLbnu8TSlP
	HlM8wIN77qTaQez+fxwn2NMpktck82+kM1MuzJJXOyHeanOki/WjAFc7iRqelpLUNoLpKFoCYRu
	6nDSylOE6lgIcA/+X3vo/jxcsS
X-Received: by 2002:a17:906:c10d:b0:b87:225f:2e74 with SMTP id a640c23a62f3a-b879690b04amr1256044266b.14.1768910617075;
        Tue, 20 Jan 2026 04:03:37 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm1378721966b.4.2026.01.20.04.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:03:36 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-icecream: Upgrade 2.1.8 -> 2.1.9
Date: Tue, 20 Jan 2026 14:03:31 +0200
Message-ID: <20260120120331.2092596-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120120331.2092596-1-leon.anavi@konsulko.com>
References: <20260120120331.2092596-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 12:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123667

Upgrade to release 2.1.9:

- Removed support for Python 3.8.
- Fixed issues to improve lists output.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-icecream_2.1.8.bb => python3-icecream_2.1.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icecream_2.1.8.bb => python3-icecream_2.1.9.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.8.bb b/meta-python/recipes-devtools/python/python3-icecream_2.1.9.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-icecream_2.1.8.bb
rename to meta-python/recipes-devtools/python/python3-icecream_2.1.9.bb
index 71ad6ab98c..82b2039334 100644
--- a/meta-python/recipes-devtools/python/python3-icecream_2.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gruns/icecream"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eca5ce1610d64ed40920efdce85ff8d1"
 
-SRC_URI[sha256sum] = "37269bbc62b02f0d85bfaf3a0eb4df272c967fad059f7ddcdaee5303ea2b2a62"
+SRC_URI[sha256sum] = "e47b6477d29848949ee5050127aeb88fd30f1908e5cf29772e8a1a0fcdf15473"
 
 inherit pypi setuptools3
 
-- 
2.47.3


