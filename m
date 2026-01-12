Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C953CD2504D
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:21:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28868.1768206072265862137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BjclqKWz;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso25483055e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 00:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768206071; x=1768810871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4UXiJBwrU85ftwP/gcX514853Zo9d8OKNH1ElgLPAc=;
        b=BjclqKWzVkv6e/+VTrt4d2JrE1TnLMlZI9YabQlU/UOr74KVpilGCA5Juini77kuj0
         yg/a/9tP0c74FC+Yk/YiLrIjyfPgvSO9PABRpsh9AuJLwyhnrDgUr+BgF2GBG7wepku/
         GhHOrp51mcQ7Or1SwLDa+hKgPR25MDoYiaQFwZwbn08ZUqUfuv1PUNeQH2SwxGiYQ0DO
         so913vD0wZELjjeU7PHfBlEfImkIG0MgLGjX8LgGzGKFeO+9EcQeozRskTomeCW5VNPO
         n7EDFr81yosiAXvH+6bBcttfMQKxd29261e5EnnvSnnxtsVObio7Nr7zad4Jf52lIsGJ
         gRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206071; x=1768810871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4UXiJBwrU85ftwP/gcX514853Zo9d8OKNH1ElgLPAc=;
        b=G7jsSYNwviyddloxqujlkDu+Me2aL9wy0zenKn4QM7/4itBiXf5UQnHVL61GUHBdXP
         RkhfQBUFBJrzS1xpJ5IcYe9c1ezARP7l2gUnt4gjFlrmNN8AH8YlW34f94oFVXM9mVlk
         kzmp8RzetNDndOKdG/atbwgPJs9DchilCiWEKogqjpH1tfQdH2q5Gk/LN+SqpSQxa4lc
         6iz1K09Pi7LFnNYvMYmYHXAN4vAIgimfkjEvbbmUdG1wT5S5bshlcSh6Pe1FYEg/Wfft
         T9L1R4d+nQs5/ut8J9aQUHDWF+A86vR70mm3WmIt3aileEtkRWfKC+EgNCVmKIwoWsJk
         9qWg==
X-Gm-Message-State: AOJu0YzxdMeYdP2/H98wiL6k6l9+LdrdZZmzKPX+oXGeQ8pUpBDypmWR
	t/gIskGPuUX+X8X1oa3OhjClbbXaaK8oSFs/Yfk0AdOsdHvXpVR8bzz7RPdAZQ==
X-Gm-Gg: AY/fxX6jQx70jnc5i6NMMX9HviiaQeVEq3apQDO1TnX7ATwoOYy0sqzctuwGMJwVqbk
	ybu2XV/qGc/7X1BGU0NBOXuJ+7zosCQFMpY3VJg2NPiDVGBhXRQVXqunhK3hQbzO9z7g7sgBa+K
	whf9SSugQjZtDrZgVNlmfp+aYJOGKFwm+WgkIgd0kdt2Whk2Jhkpw6SEaGTGkI/wDiaigMO+8TL
	9HDbhc+qQz288uacrrkRRqUmR6nfhm1nZli/xbLsELKdAhlUkPL6oGurdnnTFuXb/c9bG2kcepl
	0k+fW7nW3wDG2ZvahgG06Etb3IY537NB38RD8r+9pWU4aYcDCg34Xklp4dktCXbjSnW/JMeI9Gi
	I13gaFfJ7y8l3XnZO3Jt1NYl3MjLCuKeOepMHyaWEjfDUG9eiJcxKqm/5emXFpI8HW0RpiLRuZm
	k2IVyQAOFc
X-Google-Smtp-Source: AGHT+IEp6WUcNVMYv2JK6dI0VAu7bpJjGH6O0CwGW/GM9AcHS6sBOw/Rfy2ZEF6gDNhakx6ydEULOA==
X-Received: by 2002:a05:600c:6c95:b0:47a:8383:f2b2 with SMTP id 5b1f17b1804b1-47d7f63722dmr198566285e9.17.1768206070596;
        Mon, 12 Jan 2026 00:21:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636c610sm123295795e9.0.2026.01.12.00.21.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:21:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-01-12
Date: Mon, 12 Jan 2026 09:21:09 +0100
Message-ID: <20260112082109.165876-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123363

List of all open CVEs (70, out of which new this week: 13):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fontforge: CVE-2025-15269: https://nvd.nist.gov/vuln/detail/CVE-2025-15269
 - fontforge: CVE-2025-15270: https://nvd.nist.gov/vuln/detail/CVE-2025-15270
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15275: https://nvd.nist.gov/vuln/detail/CVE-2025-15275
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15279: https://nvd.nist.gov/vuln/detail/CVE-2025-15279
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - [NEW] libsodium: CVE-2025-69277: https://nvd.nist.gov/vuln/detail/CVE-2025-69277
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - [NEW] lmdb: CVE-2026-22185: https://nvd.nist.gov/vuln/detail/CVE-2026-22185
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - [NEW] nginx: CVE-2025-53859: https://nvd.nist.gov/vuln/detail/CVE-2025-53859
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - [NEW] python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - [NEW] python3-aiohttp: CVE-2025-69225: https://nvd.nist.gov/vuln/detail/CVE-2025-69225
 - [NEW] python3-aiohttp: CVE-2025-69226: https://nvd.nist.gov/vuln/detail/CVE-2025-69226
 - [NEW] python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - [NEW] python3-aiohttp: CVE-2025-69228: https://nvd.nist.gov/vuln/detail/CVE-2025-69228
 - [NEW] python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - [NEW] python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - [NEW] python3-lief: CVE-2025-15504: https://nvd.nist.gov/vuln/detail/CVE-2025-15504
 - python3-m2crypto: CVE-2009-0127: https://nvd.nist.gov/vuln/detail/CVE-2009-0127
 - python3-m2crypto: CVE-2020-25657: https://nvd.nist.gov/vuln/detail/CVE-2020-25657
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-pyjwt: CVE-2025-45768: https://nvd.nist.gov/vuln/detail/CVE-2025-45768
 - python3-reportlab: CVE-2020-28463: https://nvd.nist.gov/vuln/detail/CVE-2020-28463
 - python3-twitter: CVE-2012-5825: https://nvd.nist.gov/vuln/detail/CVE-2012-5825
 - python3-uvicorn: CVE-2020-7694: https://nvd.nist.gov/vuln/detail/CVE-2020-7694
 - [NEW] python3-virtualenv: CVE-2026-22702: https://nvd.nist.gov/vuln/detail/CVE-2026-22702
 - python3-werkzeug: CVE-2026-21860: https://nvd.nist.gov/vuln/detail/CVE-2026-21860
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738

====================

Removed this week (8): 

 - imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - python3-cbor2: CVE-2025-68131: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
 - python3-configobj: CVE-2023-26112: https://nvd.nist.gov/vuln/detail/CVE-2023-26112
 - python3-flask-cors: CVE-2024-1681: https://nvd.nist.gov/vuln/detail/CVE-2024-1681
 - python3-ldap: CVE-2025-61911: https://nvd.nist.gov/vuln/detail/CVE-2025-61911
 - python3-ldap: CVE-2025-61912: https://nvd.nist.gov/vuln/detail/CVE-2025-61912
 - sox: CVE-2022-50798: https://nvd.nist.gov/vuln/detail/CVE-2022-50798
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994

