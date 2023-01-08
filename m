Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165E9C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:52 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.46796.1673191271117305859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lMj5/VFZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so3834819otk.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV/ii1ieCW+2bmfZdZi1sULiy91YidR3arK85EaL+RI=;
        b=lMj5/VFZP40Nvcib93oZV8uNbFKlf0GqBHrb9vypz+RhGt7WkFphUV7uAKe72gbLG8
         o15giIIWUwclRdyPXtCEqh/8FWTW1ddsKZop5HLMlVQeLaDfyQqRvnyfvkX36l3Tbp67
         /v4O/dBOpwxSq5oq2HLqpKlHKHQ+mIDyiL/BmNT9tHVNk7kjpv/M3pSLILTPhCZyt/IN
         XQKWUbu1jAgmjiUFcEEdkwE1aCj/sggY2EgqM7Qrm5wvh+/BYxrZv2UsH9E+Z10+cYly
         oDC1bhDflpXSpfLsgpihy1RtkJaj/CMkPCOOkA9norx+wE2cnRCBzWnw6QkaqtzAAEQf
         d7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV/ii1ieCW+2bmfZdZi1sULiy91YidR3arK85EaL+RI=;
        b=g8s1kkrBM3pROiciN63zbNcoPTCi2t8ePyArRf1BCtNI7gfS4Foh8jRIFcPKTLmun3
         5w5Fgouv7T0fbNjKjcAnjMmmzK4050zz49ogfogcIAoNCpHoIDca2BYEQQAt3LIe7GJz
         li63UAhO0+PtuRZBnWBnPJODhJCrVzuDxSALO18THlht09SU0/1zv/VxjbgE3cxZ7hrT
         jHl6V7Qc6k6dO1Bt/PXq19ux+QXCbdqm0eQhxO5USIC2OUJZw56M4qeq+GJi9W/vk9A+
         PcrJx32vnICO8+UTeyeH5qHNmdQWQRf6et1Ku1KNlFiOp24khqz+5m+ytAM+ccAkI3hV
         RVQg==
X-Gm-Message-State: AFqh2kpw0CcIVfABcybP1KSAFbjOX2dKIxqcNDQa/pzFym6IHTV8puMQ
	UBXBDn3IHGv8xe03YVs1I27BpCO35g4=
X-Google-Smtp-Source: AMrXdXvhJ1kZgqTJXUuWiNCZXMVSPcg4uQ0tXKK9EFdjvHSykyWUMhKVLk4IWIqNtFZnbmz7ah19Dw==
X-Received: by 2002:a05:6830:14c:b0:661:dfeb:ea52 with SMTP id j12-20020a056830014c00b00661dfebea52mr26619992otp.17.1673191308435;
        Sun, 08 Jan 2023 07:21:48 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 25/26] nss: Add missing CVE product
Date: Sun,  8 Jan 2023 10:21:00 -0500
Message-Id: <e972c95314a157fbc77c8746427306c4529a7fcf.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100470

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


