Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA67FC9800
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:05 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37632.1774820340010924611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RrrFbzUr;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso5637385a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820338; x=1775425138; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iixra+SS3NnEHIz6rlxEtEEl9cSTJcBpc+Z5RhvLsT8=;
        b=RrrFbzUrRVBrGSZYXBuHzI1fZo9/wyFyzf5FgEYdkFnf9SthW1CxK+ZSRpVwm3teTQ
         iZkUa4+XhZ3mY1wlu4F7MGJC2ECXJM415z2YekG/ooWu0yNupYF2B1clnjdUUr36QaXl
         KzQTwrgsmfCexOLFA15B9jnFvTR1e6rnOsROT1jR9sLxMLNEMFYObu6UmOHmXpSbSbZs
         vndVJCRzh/7plVun8XBi8VTkrSbQB6w0D1Tz5b5j4adRFexO8dDTdt1XsKsh3P3c8Rm7
         MsvPwwEPvz6beJbFQy0f65PmwWG4D1OKh7Z05tF0MoNalp7innPrJCE9IqogWfOnQTWp
         OQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820338; x=1775425138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iixra+SS3NnEHIz6rlxEtEEl9cSTJcBpc+Z5RhvLsT8=;
        b=MQiSHX+1UXGueLZCLrFnDTNVIuGagDF3QcVBEgZ3+b1BF0CtxvS1HH/8l3baAbLK9r
         1cmREun2pNaAff48DzXd77wRXc9YAdzSDgp4Iw175N+JASCWjOHuAieNDaz+tuUmqTq/
         1olj4cVtcx+mkA/bI9jru7s1xfYxiEGUgRDn0z0rWbiEhimelfEYVJdUelPTSGEA4ImW
         W/enHxqmfIiKMy2xMO0eIwEpENEUjP4yj8wjllfGup08uwBnGSeCvm47l89h//LsScK1
         BOsjhpB7J+LD/fB5pPdpMoTV1IEiaqcTqVQ1XeMmRMZfQEe5nVAfDB8M3itSaKOcr2Ql
         RCpQ==
X-Gm-Message-State: AOJu0Yy8iyDOoA7v091m8/q3een9u+YraKxucFQUGoAYXrVeQ4ybvCqV
	xnmUNvUPh6Bgr0Z+rUHbX1G2IGK+kG7t0cohV3/uOhBeHOL5JQYrk8nFx37KGw==
X-Gm-Gg: ATEYQzyhKEskgco9p3VFtptHaf+T8bKfOaWqBPQzpiF1ZfiTGrA+A8oDzoMOBeoQ84D
	I4gz/Wm7+aQ6mbHbFOoxzHJ1+xfz0XEw/c8IfJEdT+TlwKVRwjKTYkZ8/DMECJy26JFQHRuREvo
	4HvRYbwtaGzRr3U/KO3oxtClFIRP3KT9grU7pygUSta5TJ6SG1gGEUuv86Gr2wm7YFTfmT/vPB5
	VLy0lx7jZPJ1crzpzJafTTVqE0cMFED9BGv3obtGWiuBt6Vh6bLe7BtsdfGLRxo3nyBCNyc9JPY
	hPmmFDZuSsBYuopbj3LlGanlEt6BQSuDtxzlD+y1TDAi79SOmhJTFsxwiHNSX1UnNHUXZ/QQ6Gy
	/TKSQVAIB+hoiOWVNNlCA4WGb75oKgiYBxs0D6gVPbjp36CUex4JcZOIweHPQ7biFholh+FyDMO
	BtqObZu/19bfwVEnXNDMn2QWBU67X4/5dmerBQ8oV+N5GfkceqZZlGGMUwCsrP
X-Received: by 2002:a17:907:c297:b0:b97:a9ac:5e05 with SMTP id a640c23a62f3a-b9b507b43d6mr586921666b.35.1774820338026;
        Sun, 29 Mar 2026 14:38:58 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:57 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:10 +0200
Subject: [PATCH 09/13] graphviz: Fix append overriding value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-9-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125818

It actually overrides value of FILES:${PN} instead of appending.
In this case SDKPATHNATIVE is the prefix so everything was still
working, but let's convert it to a proper conditional append.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
index bfc59c3ca1..a5f08d0c85 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
@@ -68,7 +68,7 @@ do_install:append:class-nativesdk() {
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
     install -m 0755 ${UNPACKDIR}/graphviz-setup.sh ${D}${SDKPATHNATIVE}/post-relocate-setup.d
 }
-FILES:${PN}:class-nativesdk += "${SDKPATHNATIVE}"
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}"
 
 # create /usr/lib/graphviz/config6
 graphviz_sstate_postinst() {

-- 
2.53.0


