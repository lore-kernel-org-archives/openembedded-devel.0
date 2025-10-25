Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F79CCF9EB
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.957.1761363630622196323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgKuKSjy;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a26ea3bf76so3722250b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363630; x=1761968430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNDHYI9bDd/DTqYN11D1obTSQFFkiNrI+XWB81LqjJk=;
        b=DgKuKSjyNcwTJxau/7oCBYhi9xehiJmAWOecDYa2YAhLS7mK0Osf1O2Iz/c1OY5/fk
         DFLmNymfOe5rplUZrE2qgpLsPFCwtsMAvovMIl6h7LCm6BptSBWJOygEUsN8l9LpOejG
         rOyab5YOqT/0AOT3TY1KDkM0etqgew8TOJzSjQxofnpOAI1o4HMnLhDvEmbSjjc9fC4v
         erzNKb2qaLl+K3/KVsVtwwl4BVaLehMVvd2YR7LPHpnJvyhStgQH0hYp3Bhr6Tti8tyh
         z4QBQ7q8aYnyVAjHzWDs1N0vnOy0utI0NkOyqaCVEyWgyxus8LK07m+t/Q/6Ali5P+fK
         QuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363630; x=1761968430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNDHYI9bDd/DTqYN11D1obTSQFFkiNrI+XWB81LqjJk=;
        b=Ct+h2+b7rhT8aPHWXEoGP9GsYrrlX0b0kOqTuB1NKiNGtSv54dSH3/aKcWclHyD6/q
         UBn2cQVj2WFRZBAwyGfmOjdId+wQbIZhirvDJhkqS1GMT1N9/OVOTzInrhgVQvdtapo4
         C/tyNfTG7KEp6tVB3qvn/07TZgLLg9qgAkeMliZKdj9VhM/89IS4V9/q5FBAQErectXn
         cB+CcDYcdotOOsxjrRbs6uFENl+V5PEboG+V8fYFUiTREHK/8tasQ4D4Bt5yb5y/YFpf
         oiRKWh0+/Kf/Ied9tT9BvqENE2DIe/welEVv2a0Mg1vZZR9DGotZBDuqqOCcsteRSZVY
         UjEg==
X-Gm-Message-State: AOJu0Yw9QM4uk1EzVfQ4RBQfbfguvidMeEhALo1tJF3Q117M5HjClYsH
	b5dNBsRf7BgaQIkRjum1LcC71iSirMkVZaN6v1rHLDqp+9gMac487C2Z3jOxBSJv
X-Gm-Gg: ASbGncu2bw+/4lkq34n7omA4V5kCoiN+Vyqynq/Evsm4+B124v35Ji8nUZz31hgmVbM
	ObdrWH4uyvK3EBkGf66FyB7vtUex/EsdDNA5+Y2ipc9AIbypFHwJ2vl3EDdvqALras6n6YZ+Lok
	jjLIl0TUPXNDhyZ3JavcPuGGkb9GiQZszgDxf+rQ/8eWiOtnu89QdXggHfIei5vRIMklVKpd7It
	4lrkuhpqmimw4YCX+Z7ftd92KIVhYX1xIPdDx11umUNkdQ9oOpXQzms5d48PjI1HjfPLB6qYYgq
	bkvNrq/zAi5LprgLarC1QExBohbJxNRvBdNzYntFOxG6kKSvNmwXNylLn71ssO5EbArD7Z1YxvO
	dEABxsHqkQKciyoIKCRW9y90PR0kLN8v6mkcMTQEooy9iKeJTsO8Ri9Lnaf+5CYPYt4wD9MuGzp
	bkK7t1+I5MRhdlPcB6rCfUOPUUMgD/0kwaj+Ih/CbFtIcLD9AK/UjtBFO34RAFl31E81everWhl
	AUM73ScdZY=
X-Google-Smtp-Source: AGHT+IFoU6ughT3W/NpMinfQAFvB/jldrr+t/Y0UUP4mO1WkdHNdUFZs9kqQ7BKjcWmeXgjFu1ytJg==
X-Received: by 2002:a05:6a20:7d8b:b0:33a:f317:58ac with SMTP id adf61e73a8af0-33dece2b1ecmr5673827637.59.1761363629731;
        Fri, 24 Oct 2025 20:40:29 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/11] poco: Link with libatomic on x86
Date: Fri, 24 Oct 2025 20:40:15 -0700
Message-ID: <20251025034017.2071643-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120994

It does not have compiler intrinsics for 64bit atomics

Fixes
i686-yoe-linux-ld.lld: error: undefined symbol: __atomic_compare_exchange

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.14.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.14.2.bb b/meta-oe/recipes-support/poco/poco_1.14.2.bb
index 8f81fac77b..8cdcf3649c 100644
--- a/meta-oe/recipes-support/poco/poco_1.14.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.14.2.bb
@@ -77,6 +77,7 @@ EXTRA_OECMAKE:append = " -DCMAKE_SKIP_RPATH=ON"
 LDFLAGS:append:riscv32 = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
 LDFLAGS:append:mips = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
 LDFLAGS:append:powerpc = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
+LDFLAGS:append:x86 = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"

 python populate_packages:prepend () {
     poco_libdir = d.expand('${libdir}')

