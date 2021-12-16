Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE8CC4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:43 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.11867.1639668222692151152
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n+nADNs0;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 133so23331270pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TIXzjCG3VBU9XSk6a0PJq4xdDm07NXh/2UkXe3XtjUs=;
        b=n+nADNs03UwHMj/xhwO4JMpjgSvDf1SoJ5zaLNjFsaGGYPtebkSjNuOAoOPvJp9t5Q
         xjW7pv+hAIFGGtZMSogMMa69gFjWCTw5mFBd3tDtE+ncCGgCJMtm02AyNM0clMjQ7mHn
         osXl0dB+7UMC7CcpyylAyNAFD97iIv0m5JEn3waniKwAqTz2TZyQLrFIhzK6vxBPTcXv
         JaqDDrgNsh4xNoQnW038VdjDVuKUzjjVUb0f1LyE3TE3zR4Wnit3Q70/sto4eYFTACz8
         EsukEWvb0hYtH28KH04lcICQO9aQVECG5QffRP6RWI0g8Fgk6O0lFw/ilThQtMX8may1
         p1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TIXzjCG3VBU9XSk6a0PJq4xdDm07NXh/2UkXe3XtjUs=;
        b=zq9K+NhqJPmarUp9VgREbeI5gjeLOpwAaZJFRqesGPoKIYJxFl7r0LacZWSwzUjQrl
         pbZjcTrZNrH/MExhrwaKfRGEP2smPzi18hZMfM1YButki62mk2rfOlkLY7N3pmDd24Zf
         5mkoDMO4ROkZa2kDxIqmjXqQaYeYJaMxm0hXV+rRrCjDK4PNvnVJ0tSe6WDARmDwx1vH
         fhotDwyJNTRxpc/pA0diT0GSQJNQgAkOwXyIfOZm1JJDWW/JoLx6T7kd6Z161xuRxiSO
         v6NOUNYQxuxVqXm8GaQWiKgWqyhdk5YVx4GZB/QXkpr4vQRhdYEJ9fCW0zCM2K/HUOYA
         aTXw==
X-Gm-Message-State: AOAM532TVvHAc/x/+n0NJWH6t5uON+fVwkwLtE4fTJ9cVjX0ygQ2NoZF
	/78jouW8ILQc8ZZRVvWC66Scm5fRjIY=
X-Google-Smtp-Source: 
 ABdhPJz3wllyZEYqUIuR6f5aXJUO9uj8OHUeW2yWKxAf2qSc/rviNj6UdjJwf/wCFhAXclJvW4lapA==
X-Received: by 2002:a65:50c6:: with SMTP id s6mr12890782pgp.352.1639668222063;
        Thu, 16 Dec 2021 07:23:42 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 18/18] fb-test: fix SRC_URI
Date: Thu, 16 Dec 2021 07:23:23 -0800
Message-Id: 
 <a12eff7e3f6aa1d4150b0724d4b7939622aa598f.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94403

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Original repo doesn't exist any more. Even though I couldn't find any
new official repo, this is the only one on github that contains used
commit hash.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c57e4d5faa3d1c4b23173a4f26b2cd1aff846b34)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-test/fbtest/{fb-test_git.bb => fb-test_1.1.0.bb}  | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-test/fbtest/{fb-test_git.bb => fb-test_1.1.0.bb} (82%)

diff --git a/meta-oe/recipes-test/fbtest/fb-test_git.bb b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
similarity index 82%
rename from meta-oe/recipes-test/fbtest/fb-test_git.bb
rename to meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
index 2992135726..14ab41b144 100644
--- a/meta-oe/recipes-test/fbtest/fb-test_git.bb
+++ b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
@@ -1,12 +1,10 @@
 SUMMARY = "Test suite for Linux framebuffer"
 
-PV = "1.1.0"
-
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRCREV = "063ec650960c2d79ac51f5c5f026cb05343a33e2"
-SRC_URI = "git://github.com/prpplague/fb-test-app.git;branch=master;protocol=https"
+SRC_URI = "git://github.com//ponty/fb-test-app.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


