Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A61C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:16:26 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.40322.1747970176439058814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 20:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K/FdN405;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86a07a1acffso591820139f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 20:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747970175; x=1748574975; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDb8kiCUhW7Um9DT9Ahxvu+Sg/yCrkpKymb9XmARtxw=;
        b=K/FdN405o3MzTfQOpy4z4rPkc7wMmuuCNi2+ywCcVzg9NI17F/VxDZFxwhUtrNB6/l
         81uMpjvJ8JZSCoTrBgKjpeGLq5x9LoeyBZRiSF2a5ho2yiEcdtSNyuDAJrf2ju1L6hDb
         V/Z/UtQSxGxqbjk1NDjwTHFgr+bmNqfedY/qVGa7RSObDFq9KAn6CJNxz6K2Z+81LVnq
         1SnRsKgPwzDbbK48gvRyoBMoZGxAdLBXGbz5UVwqpOez1gjIt+liw6QFy7aIQ/WG1Yb+
         KJ9s0KGsp3yYspAbr6Mm5yCPB0YFo8t11Ka9Xf8bHpKwMdrzNZprObFyLtIayjuyY5s8
         uSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747970175; x=1748574975;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RDb8kiCUhW7Um9DT9Ahxvu+Sg/yCrkpKymb9XmARtxw=;
        b=Vg0QNShYx+MtjTRBYZCfzPD8XOzmEUXmH+8cMGa49es1IgvgMmiUwNNdTAs6P9FSvS
         9HrSfU07gFwIu0eIVjVaMQ6YnTb+ZiU8lo+/RMK3MWumvaogJKQCtSSgFpT8Ih+LIe06
         gGgyGP8i+tzFBz7jrulcHhgGUbsLfu70yPsWbrTpWTWMWkErWHITiTQjN5U/tNeu50D8
         0P+E7IVMzyg/YaiZdktKwHEtDKwbzMgTdAJfeFwEAqAMCl7pl751KXc2w6JI+j8/AdB2
         IR5i+3qh44KNYZu04ShoPzJ45pxDK1fvGjM2hWeVGE01U2/B4ebJTXizpavAt30+eUhZ
         u3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcfdr+44ydyeT4gJzAIr/PPw3HnDd4N6LqDQfu5E5KBDxRffj7NFZykbUOLmLyugT5bGtcFo7b/tHI9gegfWlw++k=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzBOjJ8NExDfKKPWk49/s3tP8Z1OUXbqlk9G1ZI56tCF2DGYg7J
	N+X0B/1tLW/cNLkZowuo2V4KTaYcgqo9Pj6/0CtBvjTGe+vcMAb30+8d
X-Gm-Gg: ASbGncsuWIUBVLa5vA+hR5Ci3B/AwPWq0tzdkI+cKTIGv3QwCOXZbbfQx7C8EipkZMa
	i3lh3ZyCw8stjoetlhaF00MYxIWcAulhGKkiPXmsNqqIvkPjs4cy8EYFl+oiYjus/Fvp3M+yHp7
	CsR9MNNKJVQZkenNFvkSIIq3OVM+tbNU24VP1xvLmxm0HTbAOv6ds39sH/HTQCOE7g2n8/gQdyc
	isBG39g8O/C8TEIT5cBWBFkj4EbJMM0Oois53TmRF5ujGey1o5xr/8aufg2cNEfBm2ByFAU2olO
	9NxLunKInDGV/4yKszr4P9XG1UGgu40uwXk2YaieESX9vrnD5dEaxACtRx4sJUx6zbZtUCqELwj
	Xk85VkWmiLDqJGKW5i6KgNG+wNRhA
X-Google-Smtp-Source: AGHT+IF84jl1fMmcJ6FlMSCO4Jt1krhZtmOMDgRqx08smMbhIjkFOZ0ioBsFqMIjswx+eQ9ckdQWcA==
X-Received: by 2002:a05:6602:4189:b0:864:4ab4:adf1 with SMTP id ca18e2360f4ac-86caf12c204mr163146539f.13.1747970175589;
        Thu, 22 May 2025 20:16:15 -0700 (PDT)
Received: from [172.26.252.3] (174-29-216-122.hlrn.qwest.net. [174.29.216.122])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a236e8034sm325596139f.32.2025.05.22.20.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 20:16:15 -0700 (PDT)
Message-ID: <734619d4-d127-4d6d-804c-ba56d3c552ef@gmail.com>
Date: Thu, 22 May 2025 21:16:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org,
 joe@deserted.net
Cc: afenkart@gmail.com
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [meta-networking][scarthgap][PATCH] chrony: use inherit_defer for
 conditional inherit of useradd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 03:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117602

[ Upstream commit 63df976d8eec0fa714e8da30f4333f8af23c57d3 ]

conditionnal inherit is missed when PACKAGECONFIG privdrop is
activated after this inherit, eg in .bbappend.

Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
 meta-networking/recipes-support/chrony/chrony_4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.5.bb b/meta-networking/recipes-support/chrony/chrony_4.5.bb
index ae46ef1fd4..dbea406233 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.5.bb
@@ -48,7 +48,7 @@ DEPENDS = "pps-tools"
 inherit update-rc.d systemd pkgconfig
 
 # Add chronyd user if privdrop packageconfig is selected
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
 USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
 

