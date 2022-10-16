Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8051CC4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 20:18:58 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.33418.1665951533373169260
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 13:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DC6K7Njb;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id m15so13365639edb.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+zM11CNMvAQ88fjQE6v+aNgkcZUzdnoN19g95sHOrA=;
        b=DC6K7NjbAdKXQPMFLCg1N2s2XI2T5STGvMpW1l1aswHaKTrHTgvIUdUsHr9Uycdgqo
         DdA338yzzhcWB2BHkmtdEngqXx2rrp8jO33RrUGN+eJl4pvA7d0RP4lw/ZId3ssoM+Jk
         5YKjC6Vx8n1qm//eqtEV/sg0sF2VZxaakga5rkTxg5Ww4ujvQvo30uhN0JvrKT1J4eSs
         XOyLWPRsBYcXzb7Elr2hpFXs3y3NAkFCMEa5WsbhtvWNc8stWwLOrhKI9GhWxR7pfxV/
         T/tDORbFcOp/URWHYgnrcJmEJlEkFyVk6Erge3w97xCQnx7d+NfrHRULR1bxq0A/33H1
         NU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+zM11CNMvAQ88fjQE6v+aNgkcZUzdnoN19g95sHOrA=;
        b=V3wyzBpbV+jTEasw9AlnETg04LLLdjrZOKFDwXk/XNZRt7fpk9ALNHUCmbVj3t+PM2
         j/0v3M0FvTe+aVYzqN+yKSVn3VOAXIhZLn9sOZEWrW0y9TcEXQ2jmwcdTfZaAfa8HDRO
         RtqULJyCjHNnxSJqW/yCJNNlbUuHNBzAqTsVemGCDhyh6/U+4bgDzQpxg05YCvLExBMv
         kylYLZo0aapd1wG7/u1df3G0wtnnOU5ikjyMZHSV5rDgXxl5DrFMiu6R8WiXcJhy6JIS
         TW/XzAjGMw661mhcg/+MgiDa8CE4DJ4/tUN6V/SL66tFaKe380Qyus3o1HHJsE5ZjmCg
         3C4Q==
X-Gm-Message-State: ACrzQf0UYaciDiXzrZicA6KBK6gJfN6+mEfyoCcU9Yz15Z6J1qWT7Lwi
	HnjSANkgdwvcgp56PWpE/MWacF72OQg=
X-Google-Smtp-Source: AMsMyM5usZi2QMbzLqpvpXXWOcuYGSUkYINnAJQgYWd6jaaz0UW5nFKpf8+/XHwLj13IZiWGgiSEXw==
X-Received: by 2002:a05:6402:ea0:b0:454:38bf:aa3d with SMTP id h32-20020a0564020ea000b0045438bfaa3dmr7409505eda.291.1665951531530;
        Sun, 16 Oct 2022 13:18:51 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b0078d8c1eee44sm4950672ejc.158.2022.10.16.13.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 13:18:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 2/3] conntrack-tools: Add PACKAGECONFIGs for build options
Date: Sun, 16 Oct 2022 21:16:58 +0100
Message-Id: <20221016201659.14759-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221016201659.14759-1-alex.kiernan@gmail.com>
References: <20221016201659.14759-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 20:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99181

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../conntrack-tools/conntrack-tools_1.4.7.bb             | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
index 7d8ce9f80aa7..6f88b5fe31b8 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
@@ -14,7 +14,14 @@ SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-too
 "
 SRC_URI[sha256sum] = "099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d"
 
-inherit autotools update-rc.d pkgconfig
+inherit autotools update-rc.d pkgconfig systemd
+
+PACKAGECONFIG ?= "cthelper cttimeout \
+		  ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+PACKAGECONFIG[cthelper] = "--enable-cthelper,--disable-cthelper"
+PACKAGECONFIG[cttimeout] = "--enable-cttimeout,--disable-cttimeout"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
 INITSCRIPT_NAME = "conntrackd"
 
-- 
2.35.1


