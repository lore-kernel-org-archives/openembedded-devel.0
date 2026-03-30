Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC932FF4943
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 05:28:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44462.1774848485010143811
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 22:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nffy8C7x;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so33254295e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 22:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774848483; x=1775453283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xo2uZ0jZXwZzL8g20Q0NLFkCWAx6mlT2rTqcT7UyHQA=;
        b=nffy8C7xd9d3QiLDr+b6j/JHtefLtc3XLuMddm9HyRzoeIsJf1hMhs5wYtrNaEw2Xa
         40D7nXtZQhqt+Dc3WokoqJdKoc/NMmQQsI2ZvGwBdppFiipO2Sg2Cu9gQaCmD9IqTL2N
         h7f+wAm8WfML2WA7+p5SkCDn1sdCeHMGkIlWt4Kjrbhem2JaifB0G9GkxPm/DLcejExL
         sr99iLFd2vuzhBCmxS/vspuKu1wgnPhPbiJqq7jTzdP9oRE2VKxZX3pmgu4YgmLN1z3b
         d97NUn/A2ddh068PuCPsv1g4c7TWky8Wly55UM+EctJCI7VfGsgEcyJ0ferQHcwhFMJL
         5zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848483; x=1775453283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xo2uZ0jZXwZzL8g20Q0NLFkCWAx6mlT2rTqcT7UyHQA=;
        b=apDqfKwS7Z4U7JH5NbDkH8Cv/1N53RFqm6x+/xxKMKgioft/xIzidgm/ktZHV+5pLR
         3CI3kEp7qAJ0OXgMrsES2j2ER3pn9o6/Lr9z09U+OtvshLmReAYlGZNlbOIyHpT+8bfL
         rsZS/c1c+j6WkN16clGZ6vXmCFcp+doAmixu5A9K/Y/JWtBule6cMUOofbCB9u8tHd3t
         Qakk/7D84AHk0yoOl2tcpu3j5CbSz1FCLuzDIonEeW2jkQyQUB5XSft1gE5rlrDCFsdV
         nHDyW/z2x0gxK6TGWtg844u9SeQYoXcTPfIEKgkKighhePMfQb7ZIoQ6sz9UJQc+c8iR
         T+JA==
X-Gm-Message-State: AOJu0Yzx3RKg9ipEfVAXRQjj71Gh3w66rBDWbJmF4ThTW63YT1Aj4PO4
	uG4S8BTK9pWWr8XkI3eRBV1df8Fp8+s61K1agtEod77a+u+0Kjv1qrhNmqCBQw==
X-Gm-Gg: ATEYQzxeasCsamhAebd3EOBGQx03IMRx75ZA2go/oeRYmhqGsMq8fO5yws51lMznC3/
	chkWOgkLypTZBDh/axM+zSzFfivaQlWm9+IYn//L1B/8pDyyuX5wr7mOdVaW26viHxjEk0oW6jV
	bojW/zj//slMz6SJIMpyFFdYLLGR5Ftdq0L865s0YDIX1MwxBd1/JL/QSxqIVMHXX9MvK3aCXKk
	a3D6do/hBPZ8wBKeRoxjSSXhgO7MCY996BGfd9eSg9hVIJJDz7BIrhOkGDVuz+xchwOxeG4WviJ
	pJMZHAB8+W87IyLimx3Qc+dtulfcdDA8HzBndofPj863KOgTpglWDrd3uPkc5DGfBnvm9oQJn67
	LvwWxFUZQOJPkKI+L3THCK8DsavRouJlIqZFAgjORDoyAXk7Y0lNUhdZ3bpjnYDnWZjKK48y7VC
	77Yprm7QoBirsj7Ylle4k+
X-Received: by 2002:a05:600c:16ca:b0:485:3ae8:2231 with SMTP id 5b1f17b1804b1-48731faed9cmr71134855e9.30.1774848483156;
        Sun, 29 Mar 2026 22:28:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm475907265e9.9.2026.03.29.22.28.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 22:28:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-03-30
Date: Mon, 30 Mar 2026 07:27:58 +0200
Message-ID: <20260330052758.2775911-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 05:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125828

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (175, out of which new this week: 37):

 - bit7z: CVE-2026-27117: https://nvd.nist.gov/vuln/detail/CVE-2026-27117
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - [NEW] dovecot: CVE-2025-59031: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
 - [NEW] dovecot: CVE-2026-0394: https://nvd.nist.gov/vuln/detail/CVE-2026-0394
 - [NEW] dovecot: CVE-2026-24031: https://nvd.nist.gov/vuln/detail/CVE-2026-24031
 - [NEW] dovecot: CVE-2026-27855: https://nvd.nist.gov/vuln/detail/CVE-2026-27855
 - [NEW] dovecot: CVE-2026-27860: https://nvd.nist.gov/vuln/detail/CVE-2026-27860
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - [NEW] freeipmi: CVE-2026-33554: https://nvd.nist.gov/vuln/detail/CVE-2026-33554
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
 - freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
 - freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
 - freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
 - freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
 - freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
 - freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
 - freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
 - freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
 - freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
 - freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
 - freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
 - freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
 - freerdp: CVE-2026-25941: https://nvd.nist.gov/vuln/detail/CVE-2026-25941
 - freerdp: CVE-2026-25942: https://nvd.nist.gov/vuln/detail/CVE-2026-25942
 - freerdp: CVE-2026-25952: https://nvd.nist.gov/vuln/detail/CVE-2026-25952
 - freerdp: CVE-2026-25953: https://nvd.nist.gov/vuln/detail/CVE-2026-25953
 - freerdp: CVE-2026-25954: https://nvd.nist.gov/vuln/detail/CVE-2026-25954
 - freerdp: CVE-2026-25955: https://nvd.nist.gov/vuln/detail/CVE-2026-25955
 - freerdp: CVE-2026-25959: https://nvd.nist.gov/vuln/detail/CVE-2026-25959
 - freerdp: CVE-2026-25997: https://nvd.nist.gov/vuln/detail/CVE-2026-25997
 - freerdp: CVE-2026-26271: https://nvd.nist.gov/vuln/detail/CVE-2026-26271
 - freerdp: CVE-2026-26955: https://nvd.nist.gov/vuln/detail/CVE-2026-26955
 - freerdp: CVE-2026-26965: https://nvd.nist.gov/vuln/detail/CVE-2026-26965
 - freerdp: CVE-2026-26986: https://nvd.nist.gov/vuln/detail/CVE-2026-26986
 - freerdp: CVE-2026-27015: https://nvd.nist.gov/vuln/detail/CVE-2026-27015
 - freerdp: CVE-2026-27950: https://nvd.nist.gov/vuln/detail/CVE-2026-27950
 - freerdp: CVE-2026-27951: https://nvd.nist.gov/vuln/detail/CVE-2026-27951
 - freerdp: CVE-2026-29774: https://nvd.nist.gov/vuln/detail/CVE-2026-29774
 - freerdp: CVE-2026-29775: https://nvd.nist.gov/vuln/detail/CVE-2026-29775
 - freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-29776
 - freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-31806
 - freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-31883
 - freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-31884
 - freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-31885
 - freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-31897
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - giflib: CVE-2026-26740: https://nvd.nist.gov/vuln/detail/CVE-2026-26740
 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - [NEW] libde265: CVE-2026-33164: https://nvd.nist.gov/vuln/detail/CVE-2026-33164
 - libde265: CVE-2026-33165: https://nvd.nist.gov/vuln/detail/CVE-2026-33165
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - [NEW] libsoup-2.4: CVE-2026-1467: https://nvd.nist.gov/vuln/detail/CVE-2026-1467
 - [NEW] libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-1536
 - [NEW] libsoup-2.4: CVE-2026-1539: https://nvd.nist.gov/vuln/detail/CVE-2026-1539
 - [NEW] libsoup-2.4: CVE-2026-1801: https://nvd.nist.gov/vuln/detail/CVE-2026-1801
 - [NEW] libsoup-2.4: CVE-2026-2443: https://nvd.nist.gov/vuln/detail/CVE-2026-2443
 - [NEW] libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-3099
 - [NEW] libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-3632
 - [NEW] libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-3633
 - [NEW] libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-3634
 - [NEW] libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-4271
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - [NEW] nginx: CVE-2026-27651: https://nvd.nist.gov/vuln/detail/CVE-2026-27651
 - [NEW] nginx: CVE-2026-27654: https://nvd.nist.gov/vuln/detail/CVE-2026-27654
 - [NEW] nginx: CVE-2026-27784: https://nvd.nist.gov/vuln/detail/CVE-2026-27784
 - [NEW] nginx: CVE-2026-28753: https://nvd.nist.gov/vuln/detail/CVE-2026-28753
 - [NEW] nginx: CVE-2026-28755: https://nvd.nist.gov/vuln/detail/CVE-2026-28755
 - [NEW] nginx: CVE-2026-32647: https://nvd.nist.gov/vuln/detail/CVE-2026-32647
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-black: CVE-2026-31900: https://nvd.nist.gov/vuln/detail/CVE-2026-31900
 - python3-black: CVE-2026-32274: https://nvd.nist.gov/vuln/detail/CVE-2026-32274
 - [NEW] python3-cbor2: CVE-2026-26209: https://nvd.nist.gov/vuln/detail/CVE-2026-26209
 - python3-django: CVE-2026-25673: https://nvd.nist.gov/vuln/detail/CVE-2026-25673
 - python3-django: CVE-2026-25674: https://nvd.nist.gov/vuln/detail/CVE-2026-25674
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-nltk: CVE-2026-0846: https://nvd.nist.gov/vuln/detail/CVE-2026-0846
 - python3-nltk: CVE-2026-33230: https://nvd.nist.gov/vuln/detail/CVE-2026-33230
 - [NEW] python3-nltk: CVE-2026-33231: https://nvd.nist.gov/vuln/detail/CVE-2026-33231
 - python3-nltk: CVE-2026-33236: https://nvd.nist.gov/vuln/detail/CVE-2026-33236
 - python3-orjson: CVE-2025-67221: https://nvd.nist.gov/vuln/detail/CVE-2025-67221
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - [NEW] squid: CVE-2026-32748: https://nvd.nist.gov/vuln/detail/CVE-2026-32748
 - [NEW] squid: CVE-2026-33526: https://nvd.nist.gov/vuln/detail/CVE-2026-33526
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - [NEW] strongswan: CVE-2026-25075: https://nvd.nist.gov/vuln/detail/CVE-2026-25075
 - [NEW] tigervnc: CVE-2026-34352: https://nvd.nist.gov/vuln/detail/CVE-2026-34352
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - wolfssl: CVE-2026-0819: https://nvd.nist.gov/vuln/detail/CVE-2026-0819
 - [NEW] wolfssl: CVE-2026-2645: https://nvd.nist.gov/vuln/detail/CVE-2026-2645
 - wolfssl: CVE-2026-2646: https://nvd.nist.gov/vuln/detail/CVE-2026-2646
 - wolfssl: CVE-2026-3229: https://nvd.nist.gov/vuln/detail/CVE-2026-3229
 - wolfssl: CVE-2026-3230: https://nvd.nist.gov/vuln/detail/CVE-2026-3230
 - wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - [NEW] wolfssl: CVE-2026-3547: https://nvd.nist.gov/vuln/detail/CVE-2026-3547
 - wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - wolfssl: CVE-2026-3549: https://nvd.nist.gov/vuln/detail/CVE-2026-3549
 - wolfssl: CVE-2026-3580: https://nvd.nist.gov/vuln/detail/CVE-2026-3580
 - wolfssl: CVE-2026-3849: https://nvd.nist.gov/vuln/detail/CVE-2026-3849
 - [NEW] wolfssl: CVE-2026-4159: https://nvd.nist.gov/vuln/detail/CVE-2026-4159
 - [NEW] wolfssl: CVE-2026-4395: https://nvd.nist.gov/vuln/detail/CVE-2026-4395
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
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
 - [NEW] zabbix: CVE-2026-23919: https://nvd.nist.gov/vuln/detail/CVE-2026-23919
 - [NEW] zabbix: CVE-2026-23920: https://nvd.nist.gov/vuln/detail/CVE-2026-23920
 - [NEW] zabbix: CVE-2026-23921: https://nvd.nist.gov/vuln/detail/CVE-2026-23921
 - [NEW] zabbix: CVE-2026-23923: https://nvd.nist.gov/vuln/detail/CVE-2026-23923

====================

Removed this week (34): 

 - capnproto: CVE-2026-32239: https://nvd.nist.gov/vuln/detail/CVE-2026-32239
 - capnproto: CVE-2026-32240: https://nvd.nist.gov/vuln/detail/CVE-2026-32240
 - ettercap: CVE-2026-3606: https://nvd.nist.gov/vuln/detail/CVE-2026-3606
 - exiv2: CVE-2026-25884: https://nvd.nist.gov/vuln/detail/CVE-2026-25884
 - exiv2: CVE-2026-27596: https://nvd.nist.gov/vuln/detail/CVE-2026-27596
 - exiv2: CVE-2026-27631: https://nvd.nist.gov/vuln/detail/CVE-2026-27631
 - imagemagick: CVE-2026-28493: https://nvd.nist.gov/vuln/detail/CVE-2026-28493
 - imagemagick: CVE-2026-28494: https://nvd.nist.gov/vuln/detail/CVE-2026-28494
 - imagemagick: CVE-2026-28686: https://nvd.nist.gov/vuln/detail/CVE-2026-28686
 - imagemagick: CVE-2026-28687: https://nvd.nist.gov/vuln/detail/CVE-2026-28687
 - imagemagick: CVE-2026-28688: https://nvd.nist.gov/vuln/detail/CVE-2026-28688
 - imagemagick: CVE-2026-28689: https://nvd.nist.gov/vuln/detail/CVE-2026-28689
 - imagemagick: CVE-2026-28690: https://nvd.nist.gov/vuln/detail/CVE-2026-28690
 - imagemagick: CVE-2026-28691: https://nvd.nist.gov/vuln/detail/CVE-2026-28691
 - imagemagick: CVE-2026-28692: https://nvd.nist.gov/vuln/detail/CVE-2026-28692
 - imagemagick: CVE-2026-28693: https://nvd.nist.gov/vuln/detail/CVE-2026-28693
 - imagemagick: CVE-2026-30883: https://nvd.nist.gov/vuln/detail/CVE-2026-30883
 - imagemagick: CVE-2026-30929: https://nvd.nist.gov/vuln/detail/CVE-2026-30929
 - imagemagick: CVE-2026-30931: https://nvd.nist.gov/vuln/detail/CVE-2026-30931
 - imagemagick: CVE-2026-30935: https://nvd.nist.gov/vuln/detail/CVE-2026-30935
 - imagemagick: CVE-2026-30936: https://nvd.nist.gov/vuln/detail/CVE-2026-30936
 - imagemagick: CVE-2026-30937: https://nvd.nist.gov/vuln/detail/CVE-2026-30937
 - imagemagick: CVE-2026-31853: https://nvd.nist.gov/vuln/detail/CVE-2026-31853
 - imagemagick: CVE-2026-32259: https://nvd.nist.gov/vuln/detail/CVE-2026-32259
 - imagemagick: CVE-2026-32636: https://nvd.nist.gov/vuln/detail/CVE-2026-32636
 - libde265: CVE-2025-61147: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
 - libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libssh: CVE-2026-3731: https://nvd.nist.gov/vuln/detail/CVE-2026-3731
 - mariadb: CVE-2026-3494: https://nvd.nist.gov/vuln/detail/CVE-2026-3494
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-pyjwt: CVE-2026-32597: https://nvd.nist.gov/vuln/detail/CVE-2026-32597
 - python3-tornado: CVE-2026-31958: https://nvd.nist.gov/vuln/detail/CVE-2026-31958
 - zabbix: CVE-2026-23925: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

