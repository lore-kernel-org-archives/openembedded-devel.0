Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42D0D172CE
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 06:25:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47282.1770013524768774408
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 22:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JThrcZfy;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so53651335e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 22:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770013523; x=1770618323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/3kF7Jovkmyz2zeOMov7wHpTFjaxc38g9yhv19E2jBg=;
        b=JThrcZfylJM6Pg+VZpef4Zj2KYjJm/mnnKVBnyQ9Hf1aG2PvFRv1sRd4NEfxzb6BEV
         h3eAs1GqUSN7BOdLILHlGCQ8PvdHiXmSR2B3wd+gs8Rv7AvB/dZJVvYXgSy0lQueKG+l
         zmn3r++FxsofUYomfGLADrjHt4KaZ06NGvnzdnHsrE3imh32T396UhMygA5C+GFwy0me
         LvfuEXzHAgcllydhI0ch8Gbk6yoWb6fHXscjgq+VHWAQD5E/tqsrPOkbphDvQZMo8/B7
         aF857pnAdQqjoQceqrcs0g0oqk4RFlBlmG54ZSogiiGQFKHenRemNNlKQPTZud3FmHaX
         tNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013523; x=1770618323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3kF7Jovkmyz2zeOMov7wHpTFjaxc38g9yhv19E2jBg=;
        b=Ls7bWlRoWBo+pjOtbz9zso/XAauKcnJt4MHDlRQoMi8TXqDDKMw9CWF2na8N7kaSQn
         LPJ4CcoJ+G00MajQsp72LhOhaMFVUHbY8lKBBJ1a0HIwywXgCfGkh3Yps1/L/VyxChqw
         0a61EEYnE8oIsXBkhmI8daWHO8pkaLA2gY5h24BHwaatMonApmzyFszklWfMl+l04iJw
         PSuBFRMxIt56tIolAiMOUCby7xSEeYvNcTuH9i8/JPOVXrm899ERg107+VrhhJxHqHhB
         Eb2CnFrbYn+HOKAHXBWFzQylHp6QkWBfhjWXwain8cYerJSYQ+2Sk55ZOIqJdfeeAqgb
         pwfA==
X-Gm-Message-State: AOJu0YzEBc8A1nIsqOx1F/X97lwwLjRcWk+CIz7+MXrofS7gscOvIQz3
	EUYp1P8vT8U5eZPRzN+lAcJXE/SR50w+EOSayvBzdSO/7x4eaS5cUeKSPAaylA==
X-Gm-Gg: AZuq6aIQlePflgJnfOxscxJOB3WN4j7RFBjnjWRX2pbgbUThbI4AO8Ej8TDvVAFqEYW
	CyTG3r9Xat8V2dm5ZPTsvPkM6CvUxN54YZV/EvZbk0Xa48fMVlI8DxR91ZiecLdY/UY5g5c6DjJ
	fVg4P/wv701fUBAO8MmQd5MpjzO1hK7u9Z5I/XXEWOdTCzpyo6RX9w+mE6hk5jQ+BSVXqOE2ywP
	lYmg77jU8yQboYMWexdnQKcRMIUnIYlKtoXcv1gi91afQBe9LUJ01aGC4K2zC49EJ0PGm+1KDd4
	o1phG0Z4MRCJF6zv4QEkPDFSNZjQVDEjrKQdk1fU/NAb4ZwUmY+x37YJ9jSzytqG311YDYNwKvA
	IB9eMC0TM5PJbZ9+/KHSSUcFzWZchg/jfnOoXQJLjmJi7nRyaa85i2wF5dOlRzjzu+T5GIfV2bE
	e+wjDT8Ilz
X-Received: by 2002:a05:600c:358d:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-482db499704mr147629805e9.25.1770013522932;
        Sun, 01 Feb 2026 22:25:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e476dsm40864614f8f.4.2026.02.01.22.25.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:25:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2026-02-02
Date: Mon,  2 Feb 2026 07:25:19 +0100
Message-ID: <20260202062520.1325307-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 06:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124046

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (204, out of which new this week: 15):

 - botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
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
 - freerdp: CVE-2025-68118: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
 - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
 - freerdp: CVE-2026-22852: https://nvd.nist.gov/vuln/detail/CVE-2026-22852
 - freerdp: CVE-2026-22853: https://nvd.nist.gov/vuln/detail/CVE-2026-22853
 - freerdp: CVE-2026-22854: https://nvd.nist.gov/vuln/detail/CVE-2026-22854
 - freerdp: CVE-2026-22855: https://nvd.nist.gov/vuln/detail/CVE-2026-22855
 - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
 - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
 - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
 - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
 - freerdp: CVE-2026-23530: https://nvd.nist.gov/vuln/detail/CVE-2026-23530
 - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
 - freerdp: CVE-2026-23532: https://nvd.nist.gov/vuln/detail/CVE-2026-23532
 - freerdp: CVE-2026-23533: https://nvd.nist.gov/vuln/detail/CVE-2026-23533
 - freerdp: CVE-2026-23534: https://nvd.nist.gov/vuln/detail/CVE-2026-23534
 - freerdp: CVE-2026-23732: https://nvd.nist.gov/vuln/detail/CVE-2026-23732
 - freerdp: CVE-2026-23883: https://nvd.nist.gov/vuln/detail/CVE-2026-23883
 - freerdp: CVE-2026-23884: https://nvd.nist.gov/vuln/detail/CVE-2026-23884
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2025-14423: https://nvd.nist.gov/vuln/detail/CVE-2025-14423
 - gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - gimp: CVE-2025-15059: https://nvd.nist.gov/vuln/detail/CVE-2025-15059
 - gimp: CVE-2025-2760: https://nvd.nist.gov/vuln/detail/CVE-2025-2760
 - gimp: CVE-2025-2761: https://nvd.nist.gov/vuln/detail/CVE-2025-2761
 - gnome-settings-daemon: CVE-2024-38394: https://nvd.nist.gov/vuln/detail/CVE-2024-38394
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - imagemagick: CVE-2025-66628: https://nvd.nist.gov/vuln/detail/CVE-2025-66628
 - imagemagick: CVE-2025-68618: https://nvd.nist.gov/vuln/detail/CVE-2025-68618
 - imagemagick: CVE-2025-68950: https://nvd.nist.gov/vuln/detail/CVE-2025-68950
 - imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - [NEW] imagemagick: CVE-2026-23874: https://nvd.nist.gov/vuln/detail/CVE-2026-23874
 - [NEW] imagemagick: CVE-2026-23876: https://nvd.nist.gov/vuln/detail/CVE-2026-23876
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41184
 - libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
 - libcupsfilters: CVE-2025-64503: https://nvd.nist.gov/vuln/detail/CVE-2025-64503
 - mongodb: CVE-2025-14847: https://nvd.nist.gov/vuln/detail/CVE-2025-14847
 - [NEW] mongodb: CVE-2025-14911: https://nvd.nist.gov/vuln/detail/CVE-2025-14911
 - [NEW] monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - [NEW] monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - [NEW] monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - [NEW] monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - [NEW] monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - [NEW] monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - [NEW] monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - [NEW] monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - [NEW] monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - netdata: CVE-2024-32019: https://nvd.nist.gov/vuln/detail/CVE-2024-32019
 - nodejs: CVE-2024-27982: https://nvd.nist.gov/vuln/detail/CVE-2024-27982
 - nodejs: CVE-2025-23165: https://nvd.nist.gov/vuln/detail/CVE-2025-23165
 - nodejs: CVE-2025-23166: https://nvd.nist.gov/vuln/detail/CVE-2025-23166
 - nodejs: CVE-2025-23167: https://nvd.nist.gov/vuln/detail/CVE-2025-23167
 - nodejs: CVE-2025-27210: https://nvd.nist.gov/vuln/detail/CVE-2025-27210
 - nodejs: CVE-2025-55130: https://nvd.nist.gov/vuln/detail/CVE-2025-55130
 - nodejs: CVE-2025-55131: https://nvd.nist.gov/vuln/detail/CVE-2025-55131
 - nodejs: CVE-2025-55132: https://nvd.nist.gov/vuln/detail/CVE-2025-55132
 - nodejs: CVE-2025-59464: https://nvd.nist.gov/vuln/detail/CVE-2025-59464
 - nodejs: CVE-2025-59465: https://nvd.nist.gov/vuln/detail/CVE-2025-59465
 - [NEW] nodejs: CVE-2025-59466: https://nvd.nist.gov/vuln/detail/CVE-2025-59466
 - nodejs: CVE-2026-21637: https://nvd.nist.gov/vuln/detail/CVE-2026-21637
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - php: CVE-2025-14178: https://nvd.nist.gov/vuln/detail/CVE-2025-14178
 - php: CVE-2025-14180: https://nvd.nist.gov/vuln/detail/CVE-2025-14180
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - proftpd: CVE-2021-47865: https://nvd.nist.gov/vuln/detail/CVE-2021-47865
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69225: https://nvd.nist.gov/vuln/detail/CVE-2025-69225
 - python3-aiohttp: CVE-2025-69226: https://nvd.nist.gov/vuln/detail/CVE-2025-69226
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69228: https://nvd.nist.gov/vuln/detail/CVE-2025-69228
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-gunicorn: CVE-2024-6827: https://nvd.nist.gov/vuln/detail/CVE-2024-6827
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-tornado: CVE-2025-67725: https://nvd.nist.gov/vuln/detail/CVE-2025-67725
 - python3-virtualenv: CVE-2024-53899: https://nvd.nist.gov/vuln/detail/CVE-2024-53899
 - python3-virtualenv: CVE-2026-22702: https://nvd.nist.gov/vuln/detail/CVE-2026-22702
 - raptor2: CVE-2024-57822: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
 - raptor2: CVE-2024-57823: https://nvd.nist.gov/vuln/detail/CVE-2024-57823
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
 - sox: CVE-2017-11332: https://nvd.nist.gov/vuln/detail/CVE-2017-11332
 - sox: CVE-2017-11358: https://nvd.nist.gov/vuln/detail/CVE-2017-11358
 - sox: CVE-2017-11359: https://nvd.nist.gov/vuln/detail/CVE-2017-11359
 - sox: CVE-2017-15370: https://nvd.nist.gov/vuln/detail/CVE-2017-15370
 - sox: CVE-2017-15371: https://nvd.nist.gov/vuln/detail/CVE-2017-15371
 - sox: CVE-2017-15372: https://nvd.nist.gov/vuln/detail/CVE-2017-15372
 - sox: CVE-2017-15642: https://nvd.nist.gov/vuln/detail/CVE-2017-15642
 - sox: CVE-2017-18189: https://nvd.nist.gov/vuln/detail/CVE-2017-18189
 - sox: CVE-2019-1010004: https://nvd.nist.gov/vuln/detail/CVE-2019-1010004
 - sox: CVE-2019-13590: https://nvd.nist.gov/vuln/detail/CVE-2019-13590
 - sox: CVE-2019-8354: https://nvd.nist.gov/vuln/detail/CVE-2019-8354
 - sox: CVE-2019-8355: https://nvd.nist.gov/vuln/detail/CVE-2019-8355
 - sox: CVE-2019-8356: https://nvd.nist.gov/vuln/detail/CVE-2019-8356
 - sox: CVE-2019-8357: https://nvd.nist.gov/vuln/detail/CVE-2019-8357
 - sox: CVE-2021-40426: https://nvd.nist.gov/vuln/detail/CVE-2021-40426
 - sox: CVE-2022-31650: https://nvd.nist.gov/vuln/detail/CVE-2022-31650
 - sox: CVE-2022-31651: https://nvd.nist.gov/vuln/detail/CVE-2022-31651
 - sox: CVE-2023-34432: https://nvd.nist.gov/vuln/detail/CVE-2023-34432
 - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
 - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
 - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
 - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
 - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - tigervnc: CVE-2024-0408: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
 - tigervnc: CVE-2024-0409: https://nvd.nist.gov/vuln/detail/CVE-2024-0409
 - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
 - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
 - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
 - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
 - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
 - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
 - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
 - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - vsomeip: CVE-2024-3979: https://nvd.nist.gov/vuln/detail/CVE-2024-3979
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43342: https://nvd.nist.gov/vuln/detail/CVE-2025-43342
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
 - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
 - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
 - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
 - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
 - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
 - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
 - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
 - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
 - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
 - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
 - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
 - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
 - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
 - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
 - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
 - wireshark: CVE-2026-0962: https://nvd.nist.gov/vuln/detail/CVE-2026-0962
 - wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - [NEW] xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - [NEW] xrdp: CVE-2025-68670: https://nvd.nist.gov/vuln/detail/CVE-2025-68670
 - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
 - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
 - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
 - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
 - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
 - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
 - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
 - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
 - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258

====================

Removed this week (12): 

 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408

