Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A128CC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 05:43:29 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.7726.1639374208640118773
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 21:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fA/Qgwmm;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id y9so432962pgj.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 21:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Km+ykec9SP7lzdqHbg8cik3PBmvcj2HWk+7b5hUXgho=;
        b=fA/QgwmmMOXcxibrGJWpCe4wF45rV7Muuil0lSFOykQSq2zAq53m0WD0dcYEx/6h3Z
         JPC/dxaXuSV/8xA/HiJwXIazrGXs+CMFPssPdYYbGZ78WXbI3T8uev+U57XhJBzu4K/P
         IJheCEDb6T+WwdEUvgxJu3h9XZWlLydvSHiHg0zWSQZxpn/oKwJ0BG0n8NOhTqIf56DK
         iQolbZKUv1OsONxFOoRZM44QFC8eI+FpchpUug4JYBONZxXlKlx667qHB5DG6a1CnamV
         pIvWNPcjwScnDFRbGrtffKMZB8HUIa7OUtwtuoW7ZSZER/Il2zeJlhndzYl5AWoiW2iC
         JaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Km+ykec9SP7lzdqHbg8cik3PBmvcj2HWk+7b5hUXgho=;
        b=rpMzrvFf8KE8U2wpTVIE1ZU317iIWuJT/NzFGSmsmGUZn803mCcnK//cr0nVIUgNpo
         cQIXpzhriPKb+Q9i6QEhM61xt7vNqEOxTreLsL3ssoRt0PnEDLXflHtwwPkil3qZfdVK
         UctNBHUmMTKVBMMxwShwsdIBYN3qz7u4NeDv57uM7XCjF9grNDzMBtOH1YKEBikl2m5u
         nzpGxU3n6q+TZqI11wn+g2wGjx1AByBRRvy2bURwR6ZzOhXBBmBzYBUFfPtCo03c6XlM
         l0ZOfcX+Sz73OuixtueIRzYKqthair7aY+ujvfCsiFhdFI5N72XgG10t48DRXwhyDFmN
         lRZA==
X-Gm-Message-State: AOAM533qNsAkP5jxfO71F4n1SIKciDeMUZ4e0y2NxhPA0tgigVMoHdcx
	kqto+l6yQIvodfLVxuzAxSFGBWFxJkva3A==
X-Google-Smtp-Source: 
 ABdhPJy+ShU6ItK26trglCMRu/zO0hjuIcIHlLjbSZfzESLQFi04cikhhQhtsToA7xVdzfmEKr4HEw==
X-Received: by 2002:a63:751a:: with SMTP id
 q26mr46640703pgc.529.1639374207941;
        Sun, 12 Dec 2021 21:43:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 g1sm10101207pfu.73.2021.12.12.21.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 21:43:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-gnome][PATCH] yelp: Add option to support webkit2gtk-4-0
Date: Sun, 12 Dec 2021 21:43:24 -0800
Message-Id: <20211213054324.1794930-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 05:43:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94311

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_41.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_41.1.bb b/meta-gnome/recipes-gnome/yelp/yelp_41.1.bb
index 980b9a1ae5..36ea0e0ad1 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_41.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_41.1.bb
@@ -21,6 +21,10 @@ DEPENDS += " \
     webkitgtk \
     yelp-xsl \
 "
+PACKAGECONFIG ?= ""
+
+# Enable if soup3 is enabled in webkit recipe
+PACKAGECONFIG[soup3] = ",--with-webkit2gtk-4-0,"
 
 do_configure:prepend() {
     export ITSTOOL=${STAGING_BINDIR_NATIVE}/itstool
-- 
2.34.1


