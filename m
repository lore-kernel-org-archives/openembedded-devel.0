Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9B4C61DA4
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.44854.1674653498449648384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LiUdWQLy;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id i18-20020a4a2b12000000b00510ebea37bfso557406ooa.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqOy8WPKInJ7/et9OyPGtAs1D8XG1hVP4jo+FZG6hm4=;
        b=LiUdWQLyLy+gc6n0gskjNdRhRlepwW0Ug4/oFnrXPxkHFisIMl+zCTRf/yH6r96GWm
         6gn4px83clT+QfP36p4nK3JxtzNcXIJwvYSm4JD2u80jYGq8BqgBz1SNTOyjfF7r14sx
         YCQQWz0ySvyNbkYfUfnNDX66hnGpUeaPbMvRmgLhi6ZKVltyg1xYn9eBGKjxBc96LfSs
         sFB7+HVOBoCIDU7mTefJ8vy2rCDQHEdq2O90yF+TwOk3FOWfQw+z+gsy41TQLZm6XOVo
         4iKtt3iUwS6FX+8Vdd+JqpfNJrQ/htWHdDS0/43MLoaeJ1WS0UoHl8SjOvc1lk45kkl/
         pQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqOy8WPKInJ7/et9OyPGtAs1D8XG1hVP4jo+FZG6hm4=;
        b=Bywxit128I3sXzX3RnAySme8+DTfzoW3IGwOUQ/4qLC5YPuWOgPxuSOrGSitjBCyLH
         dzfecU8LkGrR/YtC/hhvDFEBfW7iPjq1s4oezlJczm4mMuGv0kv1ubgnK5qDOx0pNJmA
         1hIgtS+0bkrj5/4xhqLHLsq9tJgRKwVzE1VeY28ZeZvCk4ni4pll0jnkvkX/rf1W3bV1
         X9hXRugoib/DqahfLpbgjNUDbpOXcimM832x/rqD/4szDc3Gmd1X8fSbTu6XT9Og52f5
         pW5k+6RsMKXT2rOj9pIBnrLTFMz9ZYn5+dxG1B27wFqd8LZtlBYJ1NQ0GCQ7dsi0qynA
         4xVw==
X-Gm-Message-State: AFqh2krPzZwP4yA3l3c0mygmRld1mvyF+xN2a5jcRYANj+nzWEy+qbVT
	GJ7cYCXHWpUntkWQbTzr5p6/MFOJlLU=
X-Google-Smtp-Source: AMrXdXt5A6YVKQ6i5K6SJ74EkXZW510if6CJeOhDWar2EKfUy58d5hSeE2/5G/ndj8Ie0znJJBKjJQ==
X-Received: by 2002:a4a:c30b:0:b0:4f2:b11a:8020 with SMTP id c11-20020a4ac30b000000b004f2b11a8020mr14978398ooq.5.1674653497638;
        Wed, 25 Jan 2023 05:31:37 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 12/41] botan: upgrade 2.19.2 -> 2.19.3
Date: Wed, 25 Jan 2023 08:30:54 -0500
Message-Id: <42fbcc64a1f66f1ee6e9a887f5c5574c16dd29e1.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100747

From: Chen Pei <cp0613@linux.alibaba.com>

Version 2.19.3, 2022-11-16
    CVE-2022-43705: A malicious OCSP responder could forge OCSP responses due to a
    failure to validate that an embedded certificate was issued by the end-entity
    issuing certificate authority.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2392dc79254a223da260c4b3b639d738e81b06a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb} (93%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.2.bb b/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
similarity index 93%
rename from meta-oe/recipes-crypto/botan/botan_2.19.2.bb
rename to meta-oe/recipes-crypto/botan/botan_2.19.3.bb
index 5261367db2..8d9d423ce7 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.2.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3af5f17615c6b5cd8b832d269fb6cb4d54ec64f9eb09ddbf1add5093941b4d75"
+SRC_URI[sha256sum] = "dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.25.1


