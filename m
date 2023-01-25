Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D1EC61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.44966.1674653488668886893
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HqM9PLqF;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id c145-20020a4a4f97000000b004f505540a20so3146479oob.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV/ii1ieCW+2bmfZdZi1sULiy91YidR3arK85EaL+RI=;
        b=HqM9PLqFX2gv5W9FxPjNCHMbokyYJejGWQHUqbDE0nff122yiO43XBN/aWlhG2P+6t
         HFJABJYiWnH77rppgB8uKHfsFBHXIOZdmrw00aJGZTSnr9ZUKa9wCZ/9rh1odUySkmV3
         1RN+HZe+xpN5XWW5tdizutaUyv9+djLjizzPzozRdBDRyqoIwX1HXqXat/bTgKzptLDu
         BwY0Pyd4zh93FcZ179wiMd596+02OOWtvtkv2r6M68BAs7SSP+8w2w11GobiFIh6XKu2
         sVvaX8XhtKy6lr8zfymEahSgO7hiFhLJLvdaZbvTqqwUKojO9+vOJ+ge1jlZkiABCV43
         1HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV/ii1ieCW+2bmfZdZi1sULiy91YidR3arK85EaL+RI=;
        b=g4X+XGPNMiRnkafoyFQHyKu3LsPwLnuDwPd35QxzN53r7PJuCAUHiX2Pcmx3P2sAyq
         0X/oGWiJdyv1x27qHsrhpOm6aP9FitPvBHCgTSxCu2YbrnkZQyHE5I6Z5E5IqmUmo9Kp
         9It4zUIYPZdHczoGBoXDJGhzBI+oZbBOqxOS+j8MqlqrKxk7+u/9Vwq7fbQKCbKDr4fS
         AIL3uHI3uoSa8Y1ZRoJEjUZLOzKRfbzXGxovlc0wnrR4DXxdTXayqGIsiqgvfAp8TiRF
         aCAKFXodwSEeiBJuKGVpEQA3KScrYTA5OWJQXoQSFI/5qbvkMgvCHr+Zd/jV9n78MGyC
         s3MA==
X-Gm-Message-State: AFqh2kq8Bw4yz9F6A87xfctIUGaihW3f3xu/zk+N9lmhFSAgqfZhI8Ub
	T6QBMNhFOR2eMRGzticcg/coJCIJfzY=
X-Google-Smtp-Source: AMrXdXtY8NO2Zp9yOtODHgjJA67vRyOfQAEDKkPySkB9L9p0W3uBhwBjIMcr5JhtY0Tb0Noie3wGww==
X-Received: by 2002:a4a:370c:0:b0:4f2:a3c:e285 with SMTP id r12-20020a4a370c000000b004f20a3ce285mr16102503oor.4.1674653511985;
        Wed, 25 Jan 2023 05:31:51 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 25/41] nss: Add missing CVE product
Date: Wed, 25 Jan 2023 08:31:07 -0500
Message-Id: <e972c95314a157fbc77c8746427306c4529a7fcf.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100760

From: Mathieu Dubois-Briand <mbriand@witekio.com>

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8e0432fd54a1412a67dc1f9c33f5f6afbb860a62)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.74.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 591b12a917..73701393e6 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -280,5 +280,7 @@ RDEPENDS:${PN}-smime = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
 
+CVE_PRODUCT += "network_security_services"
+
 # CVE-2006-5201 affects only Sun Solaris
 CVE_CHECK_IGNORE += "CVE-2006-5201"
-- 
2.25.1


