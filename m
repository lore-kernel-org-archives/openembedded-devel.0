Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC7BE63F3A
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:25:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15421.1771230329866123468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S666pjvc;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f1defeso21240125e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771230328; x=1771835128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTJbfCKvHRgKcD725hNKWzvNZ+zbWUh26EumsDgYIJQ=;
        b=S666pjvctKNh07fLrrPTPYTtjBDX9RXmdnEzWufcGyhClwd7PBYHf7G8ia4SwsZMuO
         x0T3q8jSXzhmXWn1qp/EPJaB01kv9D3Yx18LttnLRiQNxgiPdPDqCWXPD40A0oyu83Bp
         0jK6nAJa4Ubpt1AC2TRtmCS8VzGBxG5VIawejMJKyZCTG0cTFJSEhaksHOMjwZww3Mv8
         n846l23frvlLVjPkqmkpGy3fW0B+2Djh4+qvRkzjSQ84UQ+nox9VEkU5uuFiMcHnoc/2
         eQ4BFlEH0+3d1MWUYTp6GtmmBnhyDMgF8KgeSjuYHY5KAT4OwJHi7YVAQTCVlR0re0b1
         3s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230328; x=1771835128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTJbfCKvHRgKcD725hNKWzvNZ+zbWUh26EumsDgYIJQ=;
        b=tPmWqGQmKrjr4W54vsJPqKoVB+qp0EaVRqhfEgUNqOrKXo1rdZh+kVqvcBoP0YOki7
         gJ0a1Gb+2wPNzc9jX7geDuc/aR+nKIWPtUDOIvnuewBKXSrGaGTwf7kfwEmd/zYDY9ES
         uoD4YPSvdPMmLUuwjDGGZNtVpqR4NrHDK/j4MOPGny9+ekSqXjB3kcW32EtOzhlwLd2T
         kO3RriejMPUD70s90A63eCKB2xPTqpXMBNnPXlJQ4NO8wPtlksoP3ZjeYnrnjJdrp9+U
         egkrkBdLEWtxUJ4vmr0HdQok2UwH+KfjTSVOMpE2RSiQH6sG/1GOnTra1PK/urW3nC10
         nkFA==
X-Gm-Message-State: AOJu0YwhBB6B5Ap0E/ooTsQ6XJn0ZqwrNpdGo3r6k1AHQI/Ke2sCQj5z
	x209cwTHWj/A7b8ssZca5JKgAdB9lLosQqR26jFMylyIpGI6j5eTseVpqH/NjQ==
X-Gm-Gg: AZuq6aJrLX9sAHRXgMRUKq9GFt5ZjdRCIEZNQCm+toZEcz7CZYjMkYKowK56bmtKfbj
	rnLbk/6PSEOttRO7nEv+nb+6INxOQDgCqKw6FaDJv+OAUXy1Abjo2dPRmVMIQpnJKJQ7PeoM+Ij
	4bTRjViYBOtEiEHe7T2x+y49iqNDjw3EIzOUScdBhaaT82P93Fdm0oE8/ogmzkYvl7DR6V1NhxM
	dEShsXWe240xHKkm+wpC7Caz/rpy6X8HwmjnWSXa9UZV7rxuNPkBNbDk+wMHdTdeIQ1iG7AKRrj
	VzafoJ7trdZ8xK9jf02LCA4DirARJgpc+BubyZUt/9avikiYNQ28AIA5ioQIK3tCJhcCDbXntVP
	Ul0aYsYTdzeaFgCHfQOIT6HT/gbhtfw/KpgxVaG6+8BRZmB5CvqR+mHmrop2/zDExrUmaeUQXa5
	sy1qPDfl3krwTmGDqpitA1bZHi+dLuDyo=
X-Received: by 2002:a05:6000:2283:b0:435:e451:39d4 with SMTP id ffacd0b85a97d-4379792bf73mr18172331f8f.44.1771230327933;
        Mon, 16 Feb 2026 00:25:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm26740523f8f.16.2026.02.16.00.25.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:25:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2026-02-16
Date: Mon, 16 Feb 2026 09:25:24 +0100
Message-ID: <20260216082525.1473394-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 08:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124410

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (174, out of which new this week: 22):

 - botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
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
 - [NEW] freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
 - [NEW] freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
 - [NEW] freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
 - [NEW] freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
 - [NEW] freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
 - [NEW] freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
 - [NEW] freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
 - [NEW] freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
 - [NEW] freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
 - [NEW] freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
 - [NEW] freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
 - [NEW] freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - gimp: CVE-2025-15059: https://nvd.nist.gov/vuln/detail/CVE-2025-15059
 - gimp: CVE-2025-2760: https://nvd.nist.gov/vuln/detail/CVE-2025-2760
 - gimp: CVE-2025-2761: https://nvd.nist.gov/vuln/detail/CVE-2025-2761
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - imagemagick: CVE-2025-68618: https://nvd.nist.gov/vuln/detail/CVE-2025-68618
 - imagemagick: CVE-2025-68950: https://nvd.nist.gov/vuln/detail/CVE-2025-68950
 - imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - imagemagick: CVE-2026-23874: https://nvd.nist.gov/vuln/detail/CVE-2026-23874
 - imagemagick: CVE-2026-23876: https://nvd.nist.gov/vuln/detail/CVE-2026-23876
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41184
 - libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
 - [NEW] libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - [NEW] libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - [NEW] mongodb: CVE-2026-1850: https://nvd.nist.gov/vuln/detail/CVE-2026-1850
 - [NEW] mongodb: CVE-2026-25612: https://nvd.nist.gov/vuln/detail/CVE-2026-25612
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - nginx: CVE-2026-1642: https://nvd.nist.gov/vuln/detail/CVE-2026-1642
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2026-2003: https://nvd.nist.gov/vuln/detail/CVE-2026-2003
 - [NEW] postgresql: CVE-2026-2004: https://nvd.nist.gov/vuln/detail/CVE-2026-2004
 - [NEW] postgresql: CVE-2026-2005: https://nvd.nist.gov/vuln/detail/CVE-2026-2005
 - [NEW] postgresql: CVE-2026-2006: https://nvd.nist.gov/vuln/detail/CVE-2026-2006
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-13473: https://nvd.nist.gov/vuln/detail/CVE-2025-13473
 - python3-django: CVE-2025-14550: https://nvd.nist.gov/vuln/detail/CVE-2025-14550
 - python3-django: CVE-2026-1207: https://nvd.nist.gov/vuln/detail/CVE-2026-1207
 - python3-django: CVE-2026-1285: https://nvd.nist.gov/vuln/detail/CVE-2026-1285
 - python3-django: CVE-2026-1287: https://nvd.nist.gov/vuln/detail/CVE-2026-1287
 - python3-django: CVE-2026-1312: https://nvd.nist.gov/vuln/detail/CVE-2026-1312
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-gunicorn: CVE-2024-6827: https://nvd.nist.gov/vuln/detail/CVE-2024-6827
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - [NEW] python3-pillow: CVE-2026-25990: https://nvd.nist.gov/vuln/detail/CVE-2026-25990
 - python3-virtualenv: CVE-2024-53899: https://nvd.nist.gov/vuln/detail/CVE-2024-53899
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
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
 - streamripper: CVE-2020-37065: https://nvd.nist.gov/vuln/detail/CVE-2020-37065
 - [NEW] tcpreplay: CVE-2024-54192: https://nvd.nist.gov/vuln/detail/CVE-2024-54192
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
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
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - xrdp: CVE-2025-68670: https://nvd.nist.gov/vuln/detail/CVE-2025-68670
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

Removed this week (2): 

 - tigervnc: CVE-2024-0408: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
 - tigervnc: CVE-2024-0409: https://nvd.nist.gov/vuln/detail/CVE-2024-0409

