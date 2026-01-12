Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80AAD2504C
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:21:11 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28864.1768206062864940091
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRgdnEGS;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so4521748f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 00:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768206061; x=1768810861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZjnjaNBWjyECPnWlSjKd0TCHJXE4PEV3NvEKDILeps=;
        b=CRgdnEGS5xJOuRoplu0iED2g9a5FWVB1Q0xglSZ/vrdQbT2K+agNWH0X808Hw6sXXP
         XzaozQnVCn2qWZM6qxzYfsM94D516yNLTZjRi866IlvNppl/fDT6al5N7HKegn0wOC5z
         IljmTAdYeOeuve8ZeReazXoWOnpcriKDH3qCY9yLiZJu2Qns0Oq6GwuXmZXtecJUsuQ6
         a1wY111DBuuwOD+os882lUdGy1Yg06cNycFklUg+1IsQq4LbuMZgOlxkCL/HyFL+YaII
         PJdXqVsuorW0jaoIwGibz1Hm48r1x9KDbYV81MsgLUCCBpvbV3rCoYucQwJqQjrlKUaJ
         5vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206061; x=1768810861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZjnjaNBWjyECPnWlSjKd0TCHJXE4PEV3NvEKDILeps=;
        b=Q0daEcp4+IvNyE7pfisBiqCvB7Ahl+ciQnRFXEoNVz71jBYX7ca2+bT7Ek/QCqk87p
         k2HdX3WjidCtszUXMzl02aKlxHhrkkG3ZjwILlIHlt5Cu5gX8Rg0pUdPmmm6R7qWXoNL
         O4cvDZ/6WwTivWTYkZy7ojZ7qCn2TAMkAMtDTkqBEute9dyWBkvVN/7ed0dG/qkMN6F/
         wYur1lFZ4Bosi3FZWRsbGS0w3mPDGLpdZBQuHxlb6lBLUGVgkazM6vP7auSM2dmxuzkD
         M1NhW198xv6VuEjwrAg2YMzv/urnUCAgf2G8ePXNqbuWoJfzSpQ1eNrWwZgaSO2w9W0h
         1yMg==
X-Gm-Message-State: AOJu0YxyeGm1PKb7+tUC4KzoCqaZtjSQflhLHZzZCuE3rAFMMhiCA8y4
	zrQbq4OQfWeCnYkeQJUxJ2IvivadpSG2/d0XpbE4nB2QxJBgezY2ianAwOZ7wg==
X-Gm-Gg: AY/fxX5BsjPQkyau3ReMZDWuaHv/pHO2mdPYWK+lwdwtXQTEs0eXgaQ/+UqodoSqMw2
	v22r0E0D0vFgxAlsW99qDBjNVxiWzCHnX9g9CveIljG+tBOEv3wuXP4csLz9WV3WrjsgxMxZR39
	Zut6+OpmpMY3UUXV+bQX6Z+KE8jK+4xct5X6AweVXO55nSXc1s6L9gQDXhlwktrEXWSCZ2O32HG
	eJDemqJjrFPhoDQPmuc0woP9rwH0lwb4nnAeG6A5EgXQ15pW1RK8ucd2CV60DHhVDeSRnLkTNYi
	Cj3Q/3Iqg0G7Zw1Xdo9mtncx+XyPhCEoYIIesvMgXSRyfywvPH7+56WdLuhIugGNK9yOk2tjNuX
	vnfM5pSbA4zL/56MLdhI5TJ9z1RfI44bvoPpyCY6LUXycI78Hw49m2juRT4SQdTVMgqcFMZGiBP
	K+R8Ch3IQx
X-Google-Smtp-Source: AGHT+IH8naOZYJmdvV0r2Lt5ji6c1WEWzf7uKKRLeYsXZsC/x3Nq0YDgQkH7W5bMttcOPyMMu4m5Aw==
X-Received: by 2002:a5d:6a8c:0:b0:432:dd71:8f2c with SMTP id ffacd0b85a97d-432dd71908bmr8267490f8f.10.1768206061012;
        Mon, 12 Jan 2026 00:21:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm37789888f8f.17.2026.01.12.00.21.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:21:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2026-01-12
Date: Mon, 12 Jan 2026 09:20:59 +0100
Message-ID: <20260112082059.165836-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123361

List of all open CVEs (190, out of which new this week: 21):

 - [NEW] boinc-client: CVE-2013-2018: https://nvd.nist.gov/vuln/detail/CVE-2013-2018
 - botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - [NEW] fluidsynth: CVE-2025-56225: https://nvd.nist.gov/vuln/detail/CVE-2025-56225
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
 - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
 - gimp: CVE-2025-14422: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
 - gimp: CVE-2025-14423: https://nvd.nist.gov/vuln/detail/CVE-2025-14423
 - gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - gimp: CVE-2025-14425: https://nvd.nist.gov/vuln/detail/CVE-2025-14425
 - gimp: CVE-2025-48796: https://nvd.nist.gov/vuln/detail/CVE-2025-48796
 - gimp: CVE-2025-48797: https://nvd.nist.gov/vuln/detail/CVE-2025-48797
 - gimp: CVE-2025-48798: https://nvd.nist.gov/vuln/detail/CVE-2025-48798
 - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - [NEW] gpsd: CVE-2025-67268: https://nvd.nist.gov/vuln/detail/CVE-2025-67268
 - [NEW] gpsd: CVE-2025-67269: https://nvd.nist.gov/vuln/detail/CVE-2025-67269
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - [NEW] imagemagick: CVE-2025-66628: https://nvd.nist.gov/vuln/detail/CVE-2025-66628
 - [NEW] imagemagick: CVE-2025-68618: https://nvd.nist.gov/vuln/detail/CVE-2025-68618
 - [NEW] imagemagick: CVE-2025-68950: https://nvd.nist.gov/vuln/detail/CVE-2025-68950
 - imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41184
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
 - libmad: CVE-2018-7263: https://nvd.nist.gov/vuln/detail/CVE-2018-7263
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42861
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - [NEW] lmdb: CVE-2026-22185: https://nvd.nist.gov/vuln/detail/CVE-2026-22185
 - mongodb: CVE-2025-14847: https://nvd.nist.gov/vuln/detail/CVE-2025-14847
 - netdata: CVE-2024-32019: https://nvd.nist.gov/vuln/detail/CVE-2024-32019
 - nodejs: CVE-2024-27982: https://nvd.nist.gov/vuln/detail/CVE-2024-27982
 - nodejs: CVE-2025-23165: https://nvd.nist.gov/vuln/detail/CVE-2025-23165
 - nodejs: CVE-2025-23166: https://nvd.nist.gov/vuln/detail/CVE-2025-23166
 - [NEW] nodejs: CVE-2025-23167: https://nvd.nist.gov/vuln/detail/CVE-2025-23167
 - nodejs: CVE-2025-27210: https://nvd.nist.gov/vuln/detail/CVE-2025-27210
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - php: CVE-2025-14177: https://nvd.nist.gov/vuln/detail/CVE-2025-14177
 - php: CVE-2025-14178: https://nvd.nist.gov/vuln/detail/CVE-2025-14178
 - php: CVE-2025-14180: https://nvd.nist.gov/vuln/detail/CVE-2025-14180
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - python3-aiohttp: CVE-2024-52304: https://nvd.nist.gov/vuln/detail/CVE-2024-52304
 - python3-aiohttp: CVE-2025-53643: https://nvd.nist.gov/vuln/detail/CVE-2025-53643
 - [NEW] python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - [NEW] python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - [NEW] python3-aiohttp: CVE-2025-69225: https://nvd.nist.gov/vuln/detail/CVE-2025-69225
 - [NEW] python3-aiohttp: CVE-2025-69226: https://nvd.nist.gov/vuln/detail/CVE-2025-69226
 - [NEW] python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - [NEW] python3-aiohttp: CVE-2025-69228: https://nvd.nist.gov/vuln/detail/CVE-2025-69228
 - [NEW] python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - [NEW] python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-cbor2: CVE-2025-68131: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
 - python3-configobj: CVE-2023-26112: https://nvd.nist.gov/vuln/detail/CVE-2023-26112
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - python3-eventlet: CVE-2025-58068: https://nvd.nist.gov/vuln/detail/CVE-2025-58068
 - python3-flask-cors: CVE-2024-1681: https://nvd.nist.gov/vuln/detail/CVE-2024-1681
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-gunicorn: CVE-2024-6827: https://nvd.nist.gov/vuln/detail/CVE-2024-6827
 - python3-ldap: CVE-2025-61911: https://nvd.nist.gov/vuln/detail/CVE-2025-61911
 - python3-ldap: CVE-2025-61912: https://nvd.nist.gov/vuln/detail/CVE-2025-61912
 - python3-m2crypto: CVE-2009-0127: https://nvd.nist.gov/vuln/detail/CVE-2009-0127
 - python3-m2crypto: CVE-2020-25657: https://nvd.nist.gov/vuln/detail/CVE-2020-25657
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-pymongo: CVE-2024-5629: https://nvd.nist.gov/vuln/detail/CVE-2024-5629
 - python3-tornado: CVE-2025-47287: https://nvd.nist.gov/vuln/detail/CVE-2025-47287
 - python3-tornado: CVE-2025-67724: https://nvd.nist.gov/vuln/detail/CVE-2025-67724
 - python3-tornado: CVE-2025-67725: https://nvd.nist.gov/vuln/detail/CVE-2025-67725
 - python3-tornado: CVE-2025-67726: https://nvd.nist.gov/vuln/detail/CVE-2025-67726
 - python3-tqdm: CVE-2024-34062: https://nvd.nist.gov/vuln/detail/CVE-2024-34062
 - python3-twisted: CVE-2024-41810: https://nvd.nist.gov/vuln/detail/CVE-2024-41810
 - python3-twitter: CVE-2012-5825: https://nvd.nist.gov/vuln/detail/CVE-2012-5825
 - python3-virtualenv: CVE-2024-53899: https://nvd.nist.gov/vuln/detail/CVE-2024-53899
 - [NEW] python3-virtualenv: CVE-2026-22702: https://nvd.nist.gov/vuln/detail/CVE-2026-22702
 - python3-waitress: CVE-2024-49768: https://nvd.nist.gov/vuln/detail/CVE-2024-49768
 - python3-waitress: CVE-2024-49769: https://nvd.nist.gov/vuln/detail/CVE-2024-49769
 - python3-werkzeug: CVE-2025-66221: https://nvd.nist.gov/vuln/detail/CVE-2025-66221
 - [NEW] python3-werkzeug: CVE-2026-21860: https://nvd.nist.gov/vuln/detail/CVE-2026-21860
 - [NEW] raptor2: CVE-2024-57822: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
 - [NEW] raptor2: CVE-2024-57823: https://nvd.nist.gov/vuln/detail/CVE-2024-57823
 - redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
 - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
 - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
 - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
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
 - wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
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

Removed this week (48): 

 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-44070
 - hplip: CVE-2020-6923: https://nvd.nist.gov/vuln/detail/CVE-2020-6923
 - id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
 - imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-5341
 - imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024-41817
 - imagemagick: CVE-2025-43965: https://nvd.nist.gov/vuln/detail/CVE-2025-43965
 - imagemagick: CVE-2025-46393: https://nvd.nist.gov/vuln/detail/CVE-2025-46393
 - imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-53014
 - imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-53015
 - imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-53019
 - imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-53101
 - imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-55004
 - imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-55005
 - imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-55154
 - imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-55160
 - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
 - imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-57803
 - imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-57807
 - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
 - imagemagick: CVE-2025-65955: https://nvd.nist.gov/vuln/detail/CVE-2025-65955
 - influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
 - krb5: CVE-2025-3576: https://nvd.nist.gov/vuln/detail/CVE-2025-3576
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
 - libcoap: CVE-2025-34468: https://nvd.nist.gov/vuln/detail/CVE-2025-34468
 - libde265: CVE-2023-43887: https://nvd.nist.gov/vuln/detail/CVE-2023-43887
 - libde265: CVE-2023-47471: https://nvd.nist.gov/vuln/detail/CVE-2023-47471
 - libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
 - libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-33643
 - libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-33644
 - libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-33645
 - libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-33646
 - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
 - libwebsockets: CVE-2025-1866: https://nvd.nist.gov/vuln/detail/CVE-2025-1866
 - mtr: CVE-2025-49809: https://nvd.nist.gov/vuln/detail/CVE-2025-49809
 - networkmanager: CVE-2024-6501: https://nvd.nist.gov/vuln/detail/CVE-2024-6501
 - open62541: CVE-2024-53429: https://nvd.nist.gov/vuln/detail/CVE-2024-53429
 - opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-47021
 - proftpd: CVE-2024-48651: https://nvd.nist.gov/vuln/detail/CVE-2024-48651
 - python3-cbor2: CVE-2025-64076: https://nvd.nist.gov/vuln/detail/CVE-2025-64076
 - sox: CVE-2022-50798: https://nvd.nist.gov/vuln/detail/CVE-2022-50798
 - synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-15117
 - tinyproxy: CVE-2025-63938: https://nvd.nist.gov/vuln/detail/CVE-2025-63938
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - vlc: CVE-2024-46461: https://nvd.nist.gov/vuln/detail/CVE-2024-46461
 - wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - znc: CVE-2024-39844: https://nvd.nist.gov/vuln/detail/CVE-2024-39844

