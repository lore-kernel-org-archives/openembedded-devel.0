Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0918BC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.11752.1639668213500880648
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a0mdBIOq;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so3555535pjw.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LBuQgKq5M0VbKswVMeC5DpAAQDkAhGyA+T6iHb0mmh0=;
        b=a0mdBIOqb40RgPW63HLkBlelNalKD9VkVWuxj/G9alzpZ8XnBmLFwoejvD+egaA0Pw
         E1WzPD3r1Nf+t4UTa9YA1krrqh4JryB/9YlpdaAGknpioDpDJSk+66dKDME7sUM+AcM/
         qdA5sLqS8NpvVGOuhTu9n3JxbS+4rlk3S3kk1aHOwOhzwLrdR9N/Oh8POUgOCzAVLNwG
         J4PK9rfa/RWzZKG7oxhEBjjNxI/Te/05f8st6ib+MrPscJm2/vcbJfz44K6dWG6a/ytP
         cSt/k9f+4iEU9kFP5s4E8p5W1o8VdjaM4vBuqRYiagnlhaW2PRZ5X8wT/1+UZhhX7QwG
         Wfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LBuQgKq5M0VbKswVMeC5DpAAQDkAhGyA+T6iHb0mmh0=;
        b=qDr8AfRG8y1RMuAiLGjMPsDB5vZEHDvNKWXH6x2vutxNsEaFBitLuIeVf2SbUCI8zO
         WKOvei9ylzIh+cCxPuWQE7O6X60v2S+Lq6naY4r+wKJc/cm5V9jmizDfaQ83BjANBfUy
         YxTk7LRx5W7JPsgMdYKvuHxKWBp5Vl9B779xlF762uDLIj9xIycha1nnF/Y+1ZEUAWPV
         /J2jZGEA2NENjiPM2uuJi/lebFQqWckKXu6f5fdTmgF8BGb3h6gw3AS9w+7+Q994oU6u
         bKFOWMjyowp2Fotf36pHMHFl9Xr7InjJbmbmIxzwHz5gk3qiKpUJLkINIdX7OQi6zHgd
         mFYg==
X-Gm-Message-State: AOAM532xgB9KvI0kYA8pLnwWpHi66YtMTybheeJCHc65eJAGYkoLUrrj
	E898dxElYJvt8HaGX2pfkGfiNFNWzgo=
X-Google-Smtp-Source: 
 ABdhPJypM4aAJsH9RcwaLfcJlhirvYqoVjEc3sU6JalaMuebylOZKAqQmYCNREVBuXikvY9LR3waRw==
X-Received: by 2002:a17:90b:1c81:: with SMTP id
 oo1mr6726997pjb.137.1639668212870;
        Thu, 16 Dec 2021 07:23:32 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 07/18] nodejs: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:12 -0800
Message-Id: 
 <806ebd9314a0af89a334e04d85041e54b1ce29ad.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94392

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise licenses BSD-2-Clause and BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4004a2279e11287407d820b997bb043b6ffe6fa7)
[Fixed up for Honistor context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
index 4715019798..47be000c9f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD & Artistic-2.0"
+LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a1016f9b7979cfe6fc3466a9bba60b1e"
 
 DEPENDS = "openssl"
-- 
2.25.1


