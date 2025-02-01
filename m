Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D16C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 17:03:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.46842.1738429394126209508
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 09:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WP4g1yxy;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so35277885e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 09:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738429392; x=1739034192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1RjbIGdxCDnHsK8w5piiiW0n73mcOnitoRhMXjblC3s=;
        b=WP4g1yxyiOp7K5zpKR5XkhM21UyRKmLA5eBzxVe32Q/AG1hTFvWT+dG7UB80lshCsh
         OF4SX4Q+/wh+8WUwwoQXHf9/SwWONlcr0egZug1JFq75/G36GH/lXaWAOd7/qgshFie/
         bLSBVvML/TywBvznr2mQaIvJzwFWwfz5GbGmEjSMCSRfmamcJcjpqyIC36QYOiFH3WkQ
         ZcUT00lDcOLecySKFAciwMkOtogZJlKE4Oc9Hw2KmtVkGhjVIwy8rRNqzIctNLFmigI9
         T7klYtflCzv/et/hyfLjoiiOhbtwBVb0Dg3HmVUS1WTZAJVJlRkdWqcGn85/lPTuIku6
         KA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738429392; x=1739034192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RjbIGdxCDnHsK8w5piiiW0n73mcOnitoRhMXjblC3s=;
        b=aYKFXRBethOst8o1AABEkBO9pVyeu3eb0KPRKaxcTuzz18Xiq1RIDmNk/iPyfSQvVc
         DKiJpNhqbeXPXHnhWejtlsp+IJBj3Ysip1U7KQTz3MnuWBJMyzfdn7LhJeaqqfVb5tg+
         /rG3ProSFgIeO1fivYXZ3pvhHLIugwAONLZlAvzRw9Rtzlp9qayFokJzE9QUFTNxmqhS
         ugqxr9436V+xqEEXxwMmoXXGyaPFLneSN26qC9oOur223L42TLnbKCu22REGzx8mM/8z
         FXLCmlOFOjTt+Hu0ohftuhspbg0zEfSlfdNaxyMS0YHPQrvZM78acbhmDWbeTjL4ey4S
         QT6g==
X-Gm-Message-State: AOJu0YzrHxT7OESkqoaOn8yyQFKGZoZqlfCwoQR8QV2WSDKZoCfWMEBM
	LoQl+HR5cClpzRe5lJrfJY0jz2Z3QDFF8AwxxhDvXG5Pe2zvVjW7IKnHXYxB
X-Gm-Gg: ASbGncvN3ZmCXdvdO0yNBiGbx4nQPC8i/Z/+GZTomCXsRgIeCiqd6Jkr19egchcS4kP
	IV0P6CpIeIdnXEs/WsYnyI1cL+nEl6KaH7tNGup0b05z1A83rMQ5OFxvLPqMEbxlxeQqvi+JZ/i
	AAJzOMPI/+BSNenQdf+IYz/0/qy84WQkaH7iVpVvYQspce4vo/1HWtrmDJXeZrw/90WJpFi4KyS
	Ke2e6GeLo8WbLhFnPs8xERbGGtma0B015DJhnGJhZqUlcYFwhrcD9XzLsIpbT/s/Dd9pNawvYS6
	Ja8q6/nXqQX8+fVW6KvHyunrQGn57Pa1WVDcvm/Aqpyfv3601LqVOKj6Gw==
X-Google-Smtp-Source: AGHT+IE7tYaCBOaNGiDPxAYu1FgK046WEenjirFcAwa/7fCdSUAzcOCfSFZj4R83HTDN/KL+bQOswA==
X-Received: by 2002:a05:6000:1788:b0:386:459f:67e0 with SMTP id ffacd0b85a97d-38c5194d438mr15156634f8f.21.1738429391722;
        Sat, 01 Feb 2025 09:03:11 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122707sm7860204f8f.50.2025.02.01.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:03:11 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 1/3] mdns: Upgrade 2559.40.32 -> 2559.60.39.0.1
Date: Sat,  1 Feb 2025 17:02:39 +0000
Message-Id: <20250201170240.2880-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 17:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115213

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/{mdns_2559.40.32.bb => mdns_2559.60.39.0.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2559.40.32.bb => mdns_2559.60.39.0.1.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
index 9cc6708d18c5..6fea434de81a 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0004-Add-definition-for-MAX.patch \
            "
 BRANCH = "rel/mDNSResponder-2559"
-SRCREV = "0b8a5dbcefd6cc72846385aebfe4f6111f2814cb"
+SRCREV = "e8a63bd04dda3f83a80f1dbc6db03e7806d87c11"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.25.1


