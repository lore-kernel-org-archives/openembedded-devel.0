Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DE7C54F2E
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 11:10:19 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.40188.1747969548348661188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 20:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFNr6TpU;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86a07a1acffso591351139f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 20:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747969547; x=1748574347; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0+vaNfHRuLQRRbjccWJ4GOI17KQE6ITwVy3Oc7wbD4=;
        b=NFNr6TpUk+yVHQg/XY6yY3OxV4mFj7/jR8piyKsZAVjn5dwmCqkbjPVWvjL2qgn7JB
         94sql1aIJaOrwYarWxqNUwIOdJZebtFkjXHWzE8zcnCP887+RXYqtvsBjDaQe8tlwLk8
         cK7DDsVnbl6XsfOwlQE6FNr9X5oTw46VJkI/ifv4/wZXlYUdM3fnyQB0tz2dt4YuSo4o
         /E0VM7X/td6fNL48YP0XVVmpSAwJ/a61GC5opmBclE+vh0/6xmIxkDMQdz68+r6GDO5r
         lm5229lI/UhuJNRP6bwLWmlcIx9oOvVISJEa0ZHT1XY6ElAv1YWfQZHwQwh6UzbS1tgx
         deFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747969547; x=1748574347;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0+vaNfHRuLQRRbjccWJ4GOI17KQE6ITwVy3Oc7wbD4=;
        b=jRrXQeZx9EOSusF5Lhbucu0MRdZgtp7mTpVkygMMfZvKUwcYyIiuXj3EHEnv3GUsww
         lulv5kqnv9tmBZJIUZNeGL6+1SOBDB/SBB/Fg3yOBfr0RqIy5hVNTS8zuHlB8J88Nxr6
         iXI8S26JlpxFXOTDH/D1Kl9C8wWO9+ZPCUPdN5+kUqRVyus/p+++54ikT2LQhDAn5DuB
         wDXq+b3ziPDv5qR579c30s+wpts0CF0Vv6O6KDImMMFy3LcyGejE+ZmziekEQcDNlL/5
         CpKUoRUf562yaNzlFw0Ppzx/HJ6JI75rIjWzy+u/damH4+X/g1vhnPJdzSJTBtT9qBjO
         PxPg==
X-Forwarded-Encrypted: i=1; AJvYcCWXAb9zSC0wP3Cmope6hTf80BJUyimB9kKznMVzUYedJLtBsrQ2p5AXP1/Q3gM6P/IPfkF1PH7/wsRL9GYjxCGx8JU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBEUIhDPkwjLS53rG9A4luFmF2OejlMro0qDhKXClnie24ixzD
	sUU3SYTWdWhd19qIIidLIPY3rkW1EVy3vmLIRKlrsRQZ9S8gvEfDCTr/
X-Gm-Gg: ASbGncsPu/93ECBqWg8RrsrInKiKaEr3+ldmWQvv+ZdR2Qcm83ubTiQEhPBhRhy/Kc0
	hlI0xDFG9PZeieBtkE3SATuupUyamPu5f+xQAAhsokLEkaX3In0ATps4S1mFepQB5krrI9xAPhi
	vJ5sw3kG8K6thz5v6qwQkmjNvyJibOyDgefa9hee04K5VpYY7bTRpthk2Mf16VGU3ShxzTlQyLG
	YxEoQlzOhW/NGFucokQikOEwx7Z61k3VSfRSuxpxvV94xvWhmFjdwzUIAcR5CVCZOThZI7n2xfE
	K2GCtdwRxPejoFyK2coRt2WzzMVpiKzwFp5ktF6or8+rcXN8lDvEleXyILLM5uGrYLfkReXx8u4
	7/lRMjwI2gqzvCVUBBX3PFm29U4wt
X-Google-Smtp-Source: AGHT+IHVWrCkugHdrTwpHDkgMxs7HV4nkQ+a8wxsikYdB1YUqFEAIv2b2ugbMHCwnIIrFMkq7g0wuQ==
X-Received: by 2002:a05:6602:488d:b0:85d:a5d3:618c with SMTP id ca18e2360f4ac-86caf1070aemr139086439f.11.1747969547383;
        Thu, 22 May 2025 20:05:47 -0700 (PDT)
Received: from [172.26.252.3] (174-29-216-122.hlrn.qwest.net. [174.29.216.122])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235e160asm318771239f.15.2025.05.22.20.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 20:05:47 -0700 (PDT)
Message-ID: <575fde2a-e410-47a4-b7e0-b22b99f9ed60@gmail.com>
Date: Thu, 22 May 2025 21:05:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org,
 joe@deserted.net
Cc: afenkart@gmail.com
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [meta-networking][walnascar][PATCH] chrony: use inherit_defer for conditional inherit of useradd
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 11:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117608

[ Upstream commit 63df976d8eec0fa714e8da30f4333f8af23c57d3 ]

conditionnal inherit is missed when PACKAGECONFIG privdrop is
activated after this inherit, eg in .bbappend.

Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
 meta-networking/recipes-support/chrony/chrony_4.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
index 83dee9143b..d21a1c6216 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
@@ -48,7 +48,7 @@ DEPENDS = "pps-tools"
 inherit update-rc.d systemd pkgconfig
 
 # Add chronyd user if privdrop packageconfig is selected
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
 USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
 

