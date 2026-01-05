Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C409C2A072
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 07:01:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59473.1767596479014692441
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 23:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KXRrMXM0;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so8151935f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 23:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767596477; x=1768201277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AXfDgKXcYPrMQ8WtlNlDTbs/d7lE4+H0J5KHvP41iE=;
        b=KXRrMXM0UAy6Q7sJYagKkVzLf3K8Uz8FQ2I+BVF1Xw5I35E6RgFhyIS/xj1cpnT4Rh
         d0TgGKrYnqPrxpiGNMwOmb1JQhDfmRGV6WOMyqNeOaou8c6EAo0y5SciNcKPeUuyYoSR
         lHNF7tbosM7QQrFA66HmVEQyBqxa+ewu588++CtILBPSX0pWYmE4HBt3Qr2pruzK/t9Y
         NLobW+lGU+QUSrsgmJa+HCkHhEIOeocaowTabcHffiC35dcjB7YcZ4FTmiH/SVI/f52M
         A1/xIzKopNxu3kyjl2+v3Zx11nojHj7X/PU3J3ch4tLZ5s+l7JgiFMTIN/Hy3Rrffe8G
         g5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767596477; x=1768201277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AXfDgKXcYPrMQ8WtlNlDTbs/d7lE4+H0J5KHvP41iE=;
        b=Ak6qVEa+oLlg1VqvoC4WTbl18/8PCkgAdmQh1D7wlQsoG6rdZS3IKQKmFAgG0GSfQO
         ep0tifnf/T2GFQ2AVBAJO8Dfv9xTa30PkStwGVB7ERYA1WGlanh6PokakdRcaEUclWnY
         PFC5BNEKhsBShIf1yFkdlAI/6z+VOcg5KLKvrNsPiGCWYkKzg/qc2v9BkzAqmNXLiRNt
         xcmiM7P9FhMv+mw8/HXAhiwqnlt5nY3hARPYUtq5bHoEnlXa5DrNALOVwiy9AtHmdDAf
         ViNxMejVba5UP2dys2M9SUn6gZ1ruqnQfS9E2T3U67L7JGE5k3d7VmucHgFgN+OJhleL
         aUWw==
X-Gm-Message-State: AOJu0YypQhg1w5ZSP2gXtUoRUa68gyAL5C3kVZNI3ILuAwVKvWujNGzB
	yk42bIqwnovXasUberQAJ8uusmPY3l9FCWL15YFCmILDGj5uGnWfYuUadlVkBA==
X-Gm-Gg: AY/fxX6+XYff8YrIkGJbCmekV9xsC0PgcQzkX3/rROnFMxa7yUxJclWB2nVo2RHxOEz
	G6jmHn+Bnua9twcz6ItFIneSbPZeoOHXP2c6el7CGxZfn8NkPPN/Gn3t1Lf9VnPEyYe4USp5a2P
	6FbTvOrqmaz8EIfRDPz9l2+Cj54v9TZvaVf62s7NgcQr1cFqxQLD+nF+EVYibMrM65H3a0eSK9k
	e1HT06DJaAY0GRrn23XN3eE7CGCs2s87LFpag7tmOtXs+2W1EzPaLQwNPu6bv+dx5oz6+u2Mmaz
	3AHZBZYzxaanrM1D7KYBa1FWBrkMxleTaJK4E6SBA+AUL3OmxJsb8oBaciQcBg1eDEG27P7JN+e
	KlLhgWqAjI2Fp84zrQDyjL29EOl1Yz3QFOuQ3er0+MyrWFG0v+sebeulqUI/Of5Bny5cVsvzvA3
	hvIF8jWPgG
X-Google-Smtp-Source: AGHT+IEmG3W+Ql81g6kMiWDMaS2Byf5DcfCAGRwnwYWumCsCCxqPcavFXBizfAdyg3ZM+bVbPt8dIQ==
X-Received: by 2002:a05:6000:2889:b0:430:fb00:108f with SMTP id ffacd0b85a97d-4324e4c9eefmr59130915f8f.18.1767596476533;
        Sun, 04 Jan 2026 23:01:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2a94sm99345864f8f.43.2026.01.04.23.01.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 23:01:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-01-05
Date: Mon,  5 Jan 2026 08:01:15 +0100
Message-ID: <20260105070115.1147636-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123126

List of all open CVEs (64, out of which new this week: 28):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - [NEW] fontforge: CVE-2025-15269: https://nvd.nist.gov/vuln/detail/CVE-2025-15269
 - [NEW] fontforge: CVE-2025-15270: https://nvd.nist.gov/vuln/detail/CVE-2025-15270
 - [NEW] fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - [NEW] fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - [NEW] fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - [NEW] fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - [NEW] fontforge: CVE-2025-15275: https://nvd.nist.gov/vuln/detail/CVE-2025-15275
 - [NEW] fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - [NEW] fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - [NEW] fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - [NEW] fontforge: CVE-2025-15279: https://nvd.nist.gov/vuln/detail/CVE-2025-15279
 - [NEW] fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
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
 - [NEW] imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] python3-cbor2: CVE-2025-68131: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
 - [NEW] python3-configobj: CVE-2023-26112: https://nvd.nist.gov/vuln/detail/CVE-2023-26112
 - [NEW] python3-flask-cors: CVE-2024-1681: https://nvd.nist.gov/vuln/detail/CVE-2024-1681
 - [NEW] python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - [NEW] python3-ldap: CVE-2025-61911: https://nvd.nist.gov/vuln/detail/CVE-2025-61911
 - [NEW] python3-ldap: CVE-2025-61912: https://nvd.nist.gov/vuln/detail/CVE-2025-61912
 - [NEW] python3-m2crypto: CVE-2009-0127: https://nvd.nist.gov/vuln/detail/CVE-2009-0127
 - [NEW] python3-m2crypto: CVE-2020-25657: https://nvd.nist.gov/vuln/detail/CVE-2020-25657
 - [NEW] python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - [NEW] python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - [NEW] python3-pyjwt: CVE-2025-45768: https://nvd.nist.gov/vuln/detail/CVE-2025-45768
 - [NEW] python3-reportlab: CVE-2020-28463: https://nvd.nist.gov/vuln/detail/CVE-2020-28463
 - [NEW] python3-twitter: CVE-2012-5825: https://nvd.nist.gov/vuln/detail/CVE-2012-5825
 - [NEW] python3-uvicorn: CVE-2020-7694: https://nvd.nist.gov/vuln/detail/CVE-2020-7694
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - [NEW] sox: CVE-2022-50798: https://nvd.nist.gov/vuln/detail/CVE-2022-50798
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738

====================

Removed this week (4): 

 - gimp: CVE-2025-14422: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
 - gimp: CVE-2025-14423: https://nvd.nist.gov/vuln/detail/CVE-2025-14423
 - gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - gimp: CVE-2025-14425: https://nvd.nist.gov/vuln/detail/CVE-2025-14425

