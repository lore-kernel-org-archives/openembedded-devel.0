Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0FBEB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 19:56:39 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.159.1687982194202317760
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 12:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rWikzjkM;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-98d34f1e54fso20938666b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 12:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687982192; x=1690574192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD01dNSrE2GVG/yBgcWblVezBQNLxqLyR4+xajbunLQ=;
        b=rWikzjkM5drT3qxg3bBbJdyeLbrL8ZPgZvjTtpMsfIKwqMw20tJ3rV+l9SYw+VRSVt
         gQhZPQik65K7X5N0dwyPU4Y5fJ6pKrsNwTwxh8JJS5JMESKC7514Pd+l4H9A8XXvyfWD
         fr2aqR9rgilHN8KN9xUfgFgUyFn5pBNjsYPTUY4IogBzR9uF57514SCzpryL/5z9bfaR
         IIDmshTsdhJrdz6cslhbmVvCrXEKnb6c/2NvwmchALvNHlbK91S3qT5aET0geDYph52h
         3WMqpwDhTd1fVsrzUXFs41lo6+1KkNWnAj9xG+A3lg+X+XP10qVV5SvWXc7BsvNvhf4S
         cE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687982192; x=1690574192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD01dNSrE2GVG/yBgcWblVezBQNLxqLyR4+xajbunLQ=;
        b=iHgd1KZ0267/LlBuVYi5RL393iBGBCO2doGF+Yoxv7YmzChMhCE+k8ddF3DT5fGanU
         Ms+HHEyQAj0MOX+ZT1o5INcHmEHIV3Fr64zg62MOpIWeJ5fhWwp/lCtSAF54Slp6Bju1
         2j2a+hMn5GmPvfytc730Z0F6Q3R9OuBIoPrVvRR6mkDR3PQvWC6iV4VeMoj3WEpKzInc
         00Q14yghxiM9w9G9slrU1rp2jcqWb9Hx8Rg44qtpP5ga/dfAuN4HNH/IoIcFidS70z9L
         iE+c2FuLZ4sr0Vd0GAsYPib7IeAeYL6E6Kb6XrRW9xnyFypHvFbK/jyxRLrC9WncpCfc
         xuWw==
X-Gm-Message-State: AC+VfDzMDONUL0qwGg3jeiwVu3JSTgnn5TjQsctQ5xShyiaTVu9TVnV8
	82rc/Q+fzl3W8GdnpM1I5TeZmdfnM4Q=
X-Google-Smtp-Source: ACHHUZ4zXgCSwuMZLq56heztHl6y8nIeeE1CD11QtuYsNp8EKWHXwqb+qhFwtmm3UGDheY1E6xQshg==
X-Received: by 2002:a17:907:25c2:b0:978:8a30:aaf with SMTP id ae2-20020a17090725c200b009788a300aafmr26978942ejc.64.1687982192660;
        Wed, 28 Jun 2023 12:56:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l16-20020a1709065a9000b00988be3c1d87sm6043562ejq.116.2023.06.28.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 12:56:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] pidgin-sipe: allow to build with libxml2-2.11
Date: Wed, 28 Jun 2023 21:56:10 +0200
Message-ID: <20230628195610.744894-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628195610.744894-1-Martin.Jansa@gmail.com>
References: <20230628195610.744894-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 19:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103635

* deprecated since libxml2-2.11 upgraded in oe-core in:
  https://git.openembedded.org/openembedded-core/commit/?id=24860598ba8557ea3a145f249938ea411f1ef1d8

* avoids:
| ../../../pidgin-sipe-1.25.0/src/core/sipe-xml.c: In function 'sipe_xml_parse':
| ../../../pidgin-sipe-1.25.0/src/core/sipe-xml.c:220:17: error: 'xmlSAXUserParseMemory' is deprecated [-Werror=deprecated-declarations]
|   220 |                 if (xmlSAXUserParseMemory(&parser, pd, string, length))
|       |                 ^~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index c0e1790ec2..90e1701488 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -35,3 +35,5 @@ FILES:${PN} += " \
     ${datadir}/appdata \
     ${datadir}/metainfo \
 "
+
+CFLAGS = "-Wno-error=deprecated-declarations"
-- 
2.41.0


