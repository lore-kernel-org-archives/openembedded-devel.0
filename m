Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EFED35E51
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.27782.1730831955414426577
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPLcuJjl;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea339a41f1so50046067b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831954; x=1731436754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9POI2q6JIrf3JKWDDjBTYyzlvWfaW8kzCbvqfihntY=;
        b=SPLcuJjl0KQbYEkLcvCSpQ8NeF3mllUJbvCuxKYugFbO+rc5MDPEYgGTx1c/sCmXm/
         lLf0Y4065+qyscvkcG/aBM/lKAnvA1OuJDnUI6xcn1cnBX3YP4HOdNb9t6jLiJlizgCO
         6mzPpGl9dBwI2/EGMGFiGBv96Ck2s+mRWxQcvWsR0foVKUYfemf6Lnkijs1tX7VcM10+
         pO/4N7uJewMWqupjjPN8odMPCW1DDXnu+yX/MdSPBt/LqXzWWb6pw+NtFfxfE9djgIwE
         zKh6AAo3IIgA1JY/81aSi11ansjUC2phQ+cieRGpw8Q7aA987m29/hcBF4waMJlBZasJ
         46GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831954; x=1731436754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9POI2q6JIrf3JKWDDjBTYyzlvWfaW8kzCbvqfihntY=;
        b=lx3cyDX4JxX+rkyAdniiVa0WE4bCYqUSihVq5RQa5ZgNH9fFhSaub0xKLxi6dIv7Pa
         yAtZGqwvr09hM8+Sw1S9nB1uv7bWj2SCEvPPFEcamfrQAf6FDoH688qRuUMHGfisquv+
         lWQZYPN03LSi6ih8uMJnoYNKtG34pMg5BkxQyNLyyF5BXO5Aa5PpB8PO8YZuF3Zxw55a
         TmDpPDMclK6YS+mRphvBPZGMWExjxTySzKNWfKZE4NaEdWQlh5gy1zwakW5AeFiM8lle
         8SnVBonrmo+Q2h2VlND7ysm46hWJas6iAhmHxEbostN9fBhV+qSO//b9YQGnktrCys78
         Ry7Q==
X-Gm-Message-State: AOJu0YwIYttp8vU4ILdo9MJMNsZPLqbhmdT2TQQ8orVF/hWLra1TWWBi
	RpnsoVG1iHiQWINnJZJcXcWGpGf/g3AMrF5gV2gSqPVRBj0RNuQkD1W3o0mL
X-Google-Smtp-Source: AGHT+IGOM1Cwa0P8UoSCp7jEENdikXea2sbTd/X+aMHmbPr1FvFzbah7y+174WSIb0LT/JgUMF6SJg==
X-Received: by 2002:a05:690c:4b8f:b0:6e5:b6a7:1640 with SMTP id 00721157ae682-6ea525435a1mr221052667b3.42.1730831954136;
        Tue, 05 Nov 2024 10:39:14 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:13 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 093/161] bdftopcf: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:09 -0500
Message-ID: <20241105183658.34982-95-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113607

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
index 9116b5f74..53e09fd86 100644
--- a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
@@ -7,7 +7,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9a35333adf75edd1eaef84bca65a490"
 DEPENDS = "libxfont"
 
-SRC_URI[md5sum] = "2a455d3c02390597feb9cefb3fe97a45"
 SRC_URI[sha256sum] = "4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2"
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


