Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA65C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 01:39:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.5628.1648085975688294642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 18:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QUDvyaaM;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id k6so3246435plg.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 18:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3RsSvetQUSpx3te5NFnNx0bqwpw7n3hhUoepiWjOm0k=;
        b=QUDvyaaM3Z8Cd97WCzXUmdKnRNWsUyjLzi7cUkEv55bCAGuEKaCXeEgLvhl83LsCuO
         SCTKAsQuD4pzP7piRynsqXAnUPKoLJAhqLAcxAZNf1t66bN3Hx2Car9ppo033cyLc3nj
         ZA0ROBtVyvDk9CBp7tHTWflKBPJqYgnvb8onRJt2fY0aRWh6tJ60ZlEIYMUmpIJ1PrI9
         kZdmvnKU1Kf3XJ0bgo+7TtcUMqzedifVic5hO4250798EVV0eFfoQvaWxUNjPssud6iL
         qPaqzDx1aDWyvVcTzGgvdzQzlxZt9mCdijKdIt0ewO/Q9KRxhXdrZp/jvnHsTt51Svj1
         DkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3RsSvetQUSpx3te5NFnNx0bqwpw7n3hhUoepiWjOm0k=;
        b=ZoD3CfrWCM3iKcYo7xevN95u5W9xTYV2ps35NfcAk4S03Qt5q3Nz54+2nlJCxYJEyd
         3Uw2JBkQOhi8L1+3awWqhDzIs8RijP3gK6NcfVYSjHRVuTZfeMHJLCrRyHMV4JrjQcoO
         X+xSu3u7qeLbBfWCX8j4zC+85iXgZy93fnXaAvBCipRGjBX1Yxmod6jL+sWaYwNRD+W/
         oXUOMpKAWmL38/1n8QF5P9MRkQrAmIXWyXgjIbl9vUXgqipweaeru2r1WbP9kufq3nd3
         W9M0TZhYJ/zl5VBA0CMrbWgYPZNXgfowAvxMBXBTGQsbsdPulLVCIfGn6IcsI/eqgNRo
         0Dxw==
X-Gm-Message-State: AOAM530+es5BjyVE+g+lcAyQdDado3XFqbXL3K2cakNjpTy1qneIY6Yr
	Hcg2sbuO/Fj4ij7yJKU3OJSyg7k5Hk/UrQ==
X-Google-Smtp-Source: 
 ABdhPJxbB/ZLHgVzfE8HVd8iLO2aF9U9CGNi0my6JxprnDRkg2FlPPmvxJOYIcSwTIJwX66xmNnWGw==
X-Received: by 2002:a17:90b:3ec5:b0:1c7:77ab:3854 with SMTP id
 rm5-20020a17090b3ec500b001c777ab3854mr3137431pjb.156.1648085974813;
        Wed, 23 Mar 2022 18:39:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 g70-20020a636b49000000b003823dd39d41sm839914pgc.64.2022.03.23.18.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 18:39:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] folks: Upgrade to 0.15.5
Date: Wed, 23 Mar 2022 18:39:31 -0700
Message-Id: <20220324013931.2153936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 01:39:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96177

vala has been upgraded in oe-core which needs this bump

Changes in this release

Bugs fixed:
  * vapi: Add missing generic type argument

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 .../folks/{folks_0.15.4.bb => folks_0.15.5.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/folks/{folks_0.15.4.bb => folks_0.15.5.bb} (91%)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
similarity index 91%
rename from meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
rename to meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
index 14e74cd0a2..51620bba8e 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG ??= ""
 
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
-SRC_URI[archive.sha256sum] = "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
+SRC_URI[archive.sha256sum] = "0fff8a896330cd82aee4598324f7e541c884d0337536212723b4beb38c759086"
-- 
2.35.1


