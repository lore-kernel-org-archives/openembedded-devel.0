Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DC2CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:22:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.43994.1757589762563158062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YY2zgkph;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0473327e70so95836166b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757589761; x=1758194561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15gyoM3xfopnM5MXN30tpSjcSRpn+fVFLR/fBMvyWQI=;
        b=YY2zgkph+hFOCKa6CCN3pGH5qSx8Dn7jB+dCI3dk6azTcNVaAaAHU8WMxi/2FulD2G
         k6qeynjHXa89Fbdjeq9q9Z6wMsbzH8O/KDy/BYDfs1lovaivKbRA9xJ1418I36M2L3Ix
         1rf7hN6Fn3vkuDCWp4gyqmxNHIqHIKoOdgXF0EmXtVa0MJCUIegczFCZQW7/KdnRRbdf
         77UenkXZlgV+N3RT1BAofbIkgg21Xw/nUvQ4iFqZSEuAbu4j2L7xiUV81pHYVBaR2iNE
         FXqgq8SosqqVWVVaO8ev3Y3xCIP2qKfVr9RKvcF63vdtOAaX6Gy+Yc4dxVCE7NA+xsec
         cfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589761; x=1758194561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15gyoM3xfopnM5MXN30tpSjcSRpn+fVFLR/fBMvyWQI=;
        b=hO6VEccRUxtp9a1BhoSESLIuluob7fnKAYFCDUngARe5ywzue8PAFmjkcVYmAimDhd
         kswOY4Qq4t0MK/2/PAr1llbujI7+0aPKwerjn4wrXKVzgRcAJ1k+ngygAiE9iL73kEro
         OdwbDnPwQHRGG6PsSz/md48RpNVE5q7dOpJkqBemvncGZgW9wusU8Lbh+RGXRyhzc0ph
         2SZjp3a91jxF7eLDycM1jGHUwqEq4FFnfVZLmMxgF45be60GDo3vjQi4MuNQHqm6lX9K
         gcdKuq4Uw/ccC1E0YxYUWbH/dzNul8CDhFcPYv7ekmKdOHSnOjthC4FC2nJUVynL2JoL
         Nmig==
X-Gm-Message-State: AOJu0YwqSFzFp5A+Dsu8w01biFLek5EAvJ6Iq0mel9IOjvo69hdJGnYN
	oBZYquM8NFGudTsOK7wmfFAqsGfXYyCNIvmkd44rZFrIZQqqcI2pkqmHMKdY+A==
X-Gm-Gg: ASbGnctaEhFJg63hvH2mB/Oz3zAvbnwlXpHzfq9sKE+UPVTYfRiZW08HFMhUcSFr9lE
	VPFcjJz2EP13kUPAoU+w1JdOjfc+H0yIw4pdoisGoNMajrCrJMsgSNCffF2fxc8lmQXxlYV02Yj
	6bsZ6sZKLdOQeRTbDDzW67qGFjjT8SMoDJhC9rZtVbxFxVWRG9lQoWcB6vPIAncCb6fdBKA+sN5
	6CduwaV+kvdV4dlV2RMMIXDEaj7vEFh62Jo3jrZDgAJgDr6h1VvB/8nbk7flVTV5F+mCKxbdQPy
	/v5dSj6ztghEnaVQKJBeCAl9b1n/96mSSdgd/eavtFH7C8Wtdj4z4pj5ZGi21vOeb1Bp7idK1KU
	R5OAf07Tw7o//oAB35YY8xoQOvEo65zk=
X-Google-Smtp-Source: AGHT+IHGNT+ZOF/IKIV08+aIeW1DL3wvzzeZcwLGRJKhHnk1jXl+EZHyiFXJtoTblPYT32+sJlTxFg==
X-Received: by 2002:a17:907:3f1b:b0:b04:53cc:441c with SMTP id a640c23a62f3a-b04b14aeaa4mr1904276966b.28.1757589760817;
        Thu, 11 Sep 2025 04:22:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31295c9sm114824166b.43.2025.09.11.04.22.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:22:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH 2/4] pgpool2: upgrade 4.5.2 -> 4.5.3
Date: Thu, 11 Sep 2025 13:22:36 +0200
Message-ID: <20250911112238.3277434-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911112238.3277434-1-skandigraun@gmail.com>
References: <20250911112238.3277434-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119364

From: Jason Schonberg <schonm@gmail.com>

Changelog: https://www.pgpool.net/docs/latest/en/html/release-4-5-3.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../pgpool2/{pgpool2_4.5.2.bb => pgpool2_4.5.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.2.bb => pgpool2_4.5.3.bb} (91%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
similarity index 91%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
index 0bf45c17ce..09d756b289 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
@@ -10,13 +10,13 @@ HOMEPAGE = "http://pgpool.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 
-SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
+SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
 	   file://define_SIGNAL_ARGS.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "480ac23f01cd7d6c856b29386bf17a848712fb4b4057d4c8abd5c8bf819bdf06"
+SRC_URI[sha256sum] = "25ed340d7b7dc00c20e4ba763d3f9c07ba891b150d9d48af313a1351cafdd778"
 
 S = "${WORKDIR}/pgpool-II-${PV}"
 

