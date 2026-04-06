Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC428E9D83F
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:39:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49174.1775453977095088405
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BOTQypfj;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso11524065e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 22:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775453975; x=1776058775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ic980R13jfcbOGJEwYtIi4FhcAwYQ4IvbiW0HqzGa8s=;
        b=BOTQypfjIk8JGfskgyHKHjUoBzNl/XeI9Hl3Ev627t2llMt/71sJybHI1NUvEhKQsO
         Uoo/QhKXClY4TmZ7V6JJ/nG9B2a5ZVZKnRgyC6Rz8Y8191C9KTf8PZHIS8U8urs+2nXo
         FUSmiHo+HUZ/nLcXvvSmq9tfpBO4fswUl18whH3a5b9hdFgMmpJuIt1J1ws8mjfUyRFP
         GfnQ/vzYAncHcHPNMgAUpGLBmo26PgtzlrI2QrxCdRb1S3dSvWsAe/ewa8/mWSLQV1zJ
         Ce4qqkF4dpv+0Gzpf2JRF8o8d1lYaago066+HNMpwTmTLq76fxmQw0UBUbZIR3B7BWxR
         VKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775453975; x=1776058775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ic980R13jfcbOGJEwYtIi4FhcAwYQ4IvbiW0HqzGa8s=;
        b=hW4I6xcAYisEYInAxXVIxxVa4K320SUR8lM+26f7BuHi/YLwanUklCYyc3kGA5GJy9
         YOML/S9COG++U9c4g612yQwq/0GVgAXQnNEQFobly2Vlj3RYKW4J0Rl7XNbYCWSyLhP3
         5z9dDN7sXo1ZZLHfDdZpwiTXAeE1EBWbYLC56/+w9DsZO+EfhX2QPRK5BnsZ+MhoNJqL
         KgUNqsdR48xRaW3Hv2YCVMUUlhuC+yKa+OQRjwEXgIOQlM1rRnTvkBd81q6Ht10q/D6C
         57D4n6F2+GkJYsArcE9S4XlCic3YrfTDUxfxIhGNbLtWAkL0aIY3Gyv+Vs0L4oCzC19w
         dL/w==
X-Gm-Message-State: AOJu0YziSobMsxUZGXEU4Hih8lEJ75wBs83DPvK69Ke6JXAKk+oidtTn
	AqMxQbtfXhCaZzDpm5Y+7tr8+7DHSywXGKiI0KfIYq0gcJfb414D+NJDLDdxFw==
X-Gm-Gg: AeBDiesznrcTcItdwMP3AGUNOdU4srDMSnWXHG2dOqp6PKllP9XOoTSoEdjfBWPhXMu
	F4lGrVL162BAPU7crMgHhTDey2SDSPIm6e3c1zy2hvl7t4mQqGR7zm3OxPSBJjvCIYSRDcyqrBN
	L2dUrkqcWdJesv4VmzsiHr8BnU9ekFF28Kam+f7rJVNk+1V//WZ0jHiQTeLXA6aFER0YxBEqFfl
	YqgwBdZRrsUf/H12smWaJCY4uwRo5Td2rm8OiUb+sS7fHC3uex4Os4aIvIVifG6irRRGe+TuzJ8
	X1lqWANDuep4OkC+Gb+V4G87e5AyGzshsoE55NbTMlYNcO++lEDxsiauOPzN0QGd4tv+szrEsB5
	BkVVaTQrRjoBUuyyindDBPR+qEiZXre/mjJ6OYKRpmYA2/xslRxMxqBpI1Kz7piwilERJptjLUS
	iT8BverEteEgm1Gan2gJPd
X-Received: by 2002:a05:600c:638e:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-488997b23c6mr163863405e9.24.1775453974867;
        Sun, 05 Apr 2026 22:39:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fd5594sm83627845e9.3.2026.04.05.22.39.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 22:39:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - kirkstone - 2026-04-06
Date: Mon,  6 Apr 2026 07:39:29 +0200
Message-ID: <20260406053932.3155661-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126026

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (562, out of which new this week: 41):

 - [NEW] botan: CVE-2026-32877: https://nvd.nist.gov/vuln/detail/CVE-2026-32877
 - [NEW] botan: CVE-2026-32884: https://nvd.nist.gov/vuln/detail/CVE-2026-32884
 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - cockpit: CVE-2021-3660: https://nvd.nist.gov/vuln/detail/CVE-2021-3660
 - cockpit: CVE-2021-3698: https://nvd.nist.gov/vuln/detail/CVE-2021-3698
 - dbus-broker: CVE-2022-31213: https://nvd.nist.gov/vuln/detail/CVE-2022-31213
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - dovecot: CVE-2020-28200: https://nvd.nist.gov/vuln/detail/CVE-2020-28200
 - dovecot: CVE-2024-23184: https://nvd.nist.gov/vuln/detail/CVE-2024-23184
 - dovecot: CVE-2025-59031: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
 - dovecot: CVE-2026-0394: https://nvd.nist.gov/vuln/detail/CVE-2026-0394
 - dovecot: CVE-2026-24031: https://nvd.nist.gov/vuln/detail/CVE-2026-24031
 - dovecot: CVE-2026-27855: https://nvd.nist.gov/vuln/detail/CVE-2026-27855
 - dovecot: CVE-2026-27860: https://nvd.nist.gov/vuln/detail/CVE-2026-27860
 - emacs: CVE-2022-45939: https://nvd.nist.gov/vuln/detail/CVE-2022-45939
 - emacs: CVE-2022-48338: https://nvd.nist.gov/vuln/detail/CVE-2022-48338
 - emacs: CVE-2022-48339: https://nvd.nist.gov/vuln/detail/CVE-2022-48339
 - emacs: CVE-2024-30202: https://nvd.nist.gov/vuln/detail/CVE-2024-30202
 - emacs: CVE-2024-30203: https://nvd.nist.gov/vuln/detail/CVE-2024-30203
 - emacs: CVE-2024-30204: https://nvd.nist.gov/vuln/detail/CVE-2024-30204
 - emacs: CVE-2024-30205: https://nvd.nist.gov/vuln/detail/CVE-2024-30205
 - emacs: CVE-2024-39331: https://nvd.nist.gov/vuln/detail/CVE-2024-39331
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - exiv2: CVE-2021-37623: https://nvd.nist.gov/vuln/detail/CVE-2021-37623
 - exiv2: CVE-2025-54080: https://nvd.nist.gov/vuln/detail/CVE-2025-54080
 - exiv2: CVE-2025-55304: https://nvd.nist.gov/vuln/detail/CVE-2025-55304
 - exiv2: CVE-2026-27631: https://nvd.nist.gov/vuln/detail/CVE-2026-27631
 - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - freerdp: CVE-2022-24882: https://nvd.nist.gov/vuln/detail/CVE-2022-24882
 - freerdp: CVE-2022-39283: https://nvd.nist.gov/vuln/detail/CVE-2022-39283
 - freerdp: CVE-2022-39347: https://nvd.nist.gov/vuln/detail/CVE-2022-39347
 - freerdp: CVE-2022-41877: https://nvd.nist.gov/vuln/detail/CVE-2022-41877
 - freerdp: CVE-2023-39354: https://nvd.nist.gov/vuln/detail/CVE-2023-39354
 - freerdp: CVE-2023-39356: https://nvd.nist.gov/vuln/detail/CVE-2023-39356
 - freerdp: CVE-2023-40186: https://nvd.nist.gov/vuln/detail/CVE-2023-40186
 - freerdp: CVE-2023-40188: https://nvd.nist.gov/vuln/detail/CVE-2023-40188
 - freerdp: CVE-2023-40567: https://nvd.nist.gov/vuln/detail/CVE-2023-40567
 - freerdp: CVE-2024-32659: https://nvd.nist.gov/vuln/detail/CVE-2024-32659
 - freerdp: CVE-2024-32660: https://nvd.nist.gov/vuln/detail/CVE-2024-32660
 - freerdp: CVE-2024-32661: https://nvd.nist.gov/vuln/detail/CVE-2024-32661
 - freerdp: CVE-2024-32662: https://nvd.nist.gov/vuln/detail/CVE-2024-32662
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
 - [NEW] freerdp: CVE-2026-33952: https://nvd.nist.gov/vuln/detail/CVE-2026-33952
 - [NEW] freerdp: CVE-2026-33977: https://nvd.nist.gov/vuln/detail/CVE-2026-33977
 - [NEW] freerdp: CVE-2026-33982: https://nvd.nist.gov/vuln/detail/CVE-2026-33982
 - [NEW] freerdp: CVE-2026-33983: https://nvd.nist.gov/vuln/detail/CVE-2026-33983
 - [NEW] freerdp: CVE-2026-33984: https://nvd.nist.gov/vuln/detail/CVE-2026-33984
 - [NEW] freerdp: CVE-2026-33985: https://nvd.nist.gov/vuln/detail/CVE-2026-33985
 - [NEW] freerdp: CVE-2026-33986: https://nvd.nist.gov/vuln/detail/CVE-2026-33986
 - [NEW] freerdp: CVE-2026-33987: https://nvd.nist.gov/vuln/detail/CVE-2026-33987
 - [NEW] freerdp: CVE-2026-33995: https://nvd.nist.gov/vuln/detail/CVE-2026-33995
 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - fwupd: CVE-2022-3287: https://nvd.nist.gov/vuln/detail/CVE-2022-3287
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - [NEW] giflib: CVE-2025-31344: https://nvd.nist.gov/vuln/detail/CVE-2025-31344
 - giflib: CVE-2026-26740: https://nvd.nist.gov/vuln/detail/CVE-2026-26740
 - gimp: CVE-2025-14425: https://nvd.nist.gov/vuln/detail/CVE-2025-14425
 - gimp: CVE-2025-15059: https://nvd.nist.gov/vuln/detail/CVE-2025-15059
 - gimp: CVE-2025-48796: https://nvd.nist.gov/vuln/detail/CVE-2025-48796
 - gimp: CVE-2025-48797: https://nvd.nist.gov/vuln/detail/CVE-2025-48797
 - gimp: CVE-2025-48798: https://nvd.nist.gov/vuln/detail/CVE-2025-48798
 - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
 - gimp: CVE-2026-0797: https://nvd.nist.gov/vuln/detail/CVE-2026-0797
 - gimp: CVE-2026-2044: https://nvd.nist.gov/vuln/detail/CVE-2026-2044
 - gimp: CVE-2026-2045: https://nvd.nist.gov/vuln/detail/CVE-2026-2045
 - gimp: CVE-2026-2048: https://nvd.nist.gov/vuln/detail/CVE-2026-2048
 - gnuplot: CVE-2025-31176: https://nvd.nist.gov/vuln/detail/CVE-2025-31176
 - gnuplot: CVE-2025-31178: https://nvd.nist.gov/vuln/detail/CVE-2025-31178
 - gnuplot: CVE-2025-31179: https://nvd.nist.gov/vuln/detail/CVE-2025-31179
 - gnuplot: CVE-2025-31180: https://nvd.nist.gov/vuln/detail/CVE-2025-31180
 - gnuplot: CVE-2025-31181: https://nvd.nist.gov/vuln/detail/CVE-2025-31181
 - gpsd: CVE-2025-67269: https://nvd.nist.gov/vuln/detail/CVE-2025-67269
 - grpc: CVE-2023-33953: https://nvd.nist.gov/vuln/detail/CVE-2023-33953
 - grpc: CVE-2023-44487: https://nvd.nist.gov/vuln/detail/CVE-2023-44487
 - grpc: CVE-2023-4785: https://nvd.nist.gov/vuln/detail/CVE-2023-4785
 - grpc: CVE-2024-7246: https://nvd.nist.gov/vuln/detail/CVE-2024-7246
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - hdf5: CVE-2017-17506: https://nvd.nist.gov/vuln/detail/CVE-2017-17506
 - hdf5: CVE-2018-17233: https://nvd.nist.gov/vuln/detail/CVE-2018-17233
 - hdf5: CVE-2018-17234: https://nvd.nist.gov/vuln/detail/CVE-2018-17234
 - hdf5: CVE-2018-17237: https://nvd.nist.gov/vuln/detail/CVE-2018-17237
 - hdf5: CVE-2018-17432: https://nvd.nist.gov/vuln/detail/CVE-2018-17432
 - hdf5: CVE-2018-17433: https://nvd.nist.gov/vuln/detail/CVE-2018-17433
 - hdf5: CVE-2018-17434: https://nvd.nist.gov/vuln/detail/CVE-2018-17434
 - hdf5: CVE-2018-17435: https://nvd.nist.gov/vuln/detail/CVE-2018-17435
 - hdf5: CVE-2018-17436: https://nvd.nist.gov/vuln/detail/CVE-2018-17436
 - hdf5: CVE-2018-17437: https://nvd.nist.gov/vuln/detail/CVE-2018-17437
 - hdf5: CVE-2018-17438: https://nvd.nist.gov/vuln/detail/CVE-2018-17438
 - hdf5: CVE-2019-8396: https://nvd.nist.gov/vuln/detail/CVE-2019-8396
 - hdf5: CVE-2020-10809: https://nvd.nist.gov/vuln/detail/CVE-2020-10809
 - hdf5: CVE-2020-10810: https://nvd.nist.gov/vuln/detail/CVE-2020-10810
 - hdf5: CVE-2020-10811: https://nvd.nist.gov/vuln/detail/CVE-2020-10811
 - hdf5: CVE-2020-10812: https://nvd.nist.gov/vuln/detail/CVE-2020-10812
 - hdf5: CVE-2024-29157: https://nvd.nist.gov/vuln/detail/CVE-2024-29157
 - hdf5: CVE-2024-29158: https://nvd.nist.gov/vuln/detail/CVE-2024-29158
 - hdf5: CVE-2024-29159: https://nvd.nist.gov/vuln/detail/CVE-2024-29159
 - hdf5: CVE-2024-29160: https://nvd.nist.gov/vuln/detail/CVE-2024-29160
 - hdf5: CVE-2024-29161: https://nvd.nist.gov/vuln/detail/CVE-2024-29161
 - hdf5: CVE-2024-29162: https://nvd.nist.gov/vuln/detail/CVE-2024-29162
 - hdf5: CVE-2024-29163: https://nvd.nist.gov/vuln/detail/CVE-2024-29163
 - hdf5: CVE-2024-29164: https://nvd.nist.gov/vuln/detail/CVE-2024-29164
 - hdf5: CVE-2024-29165: https://nvd.nist.gov/vuln/detail/CVE-2024-29165
 - hdf5: CVE-2024-29166: https://nvd.nist.gov/vuln/detail/CVE-2024-29166
 - hdf5: CVE-2024-32605: https://nvd.nist.gov/vuln/detail/CVE-2024-32605
 - hdf5: CVE-2024-32606: https://nvd.nist.gov/vuln/detail/CVE-2024-32606
 - hdf5: CVE-2024-32607: https://nvd.nist.gov/vuln/detail/CVE-2024-32607
 - hdf5: CVE-2024-32608: https://nvd.nist.gov/vuln/detail/CVE-2024-32608
 - hdf5: CVE-2024-32609: https://nvd.nist.gov/vuln/detail/CVE-2024-32609
 - hdf5: CVE-2024-32610: https://nvd.nist.gov/vuln/detail/CVE-2024-32610
 - hdf5: CVE-2024-32611: https://nvd.nist.gov/vuln/detail/CVE-2024-32611
 - hdf5: CVE-2024-32612: https://nvd.nist.gov/vuln/detail/CVE-2024-32612
 - hdf5: CVE-2024-32613: https://nvd.nist.gov/vuln/detail/CVE-2024-32613
 - hdf5: CVE-2024-32614: https://nvd.nist.gov/vuln/detail/CVE-2024-32614
 - hdf5: CVE-2024-32615: https://nvd.nist.gov/vuln/detail/CVE-2024-32615
 - hdf5: CVE-2024-32616: https://nvd.nist.gov/vuln/detail/CVE-2024-32616
 - hdf5: CVE-2024-32617: https://nvd.nist.gov/vuln/detail/CVE-2024-32617
 - hdf5: CVE-2024-32618: https://nvd.nist.gov/vuln/detail/CVE-2024-32618
 - hdf5: CVE-2024-32619: https://nvd.nist.gov/vuln/detail/CVE-2024-32619
 - hdf5: CVE-2024-32620: https://nvd.nist.gov/vuln/detail/CVE-2024-32620
 - hdf5: CVE-2024-32621: https://nvd.nist.gov/vuln/detail/CVE-2024-32621
 - hdf5: CVE-2024-32622: https://nvd.nist.gov/vuln/detail/CVE-2024-32622
 - hdf5: CVE-2024-32623: https://nvd.nist.gov/vuln/detail/CVE-2024-32623
 - hdf5: CVE-2024-32624: https://nvd.nist.gov/vuln/detail/CVE-2024-32624
 - hdf5: CVE-2024-33873: https://nvd.nist.gov/vuln/detail/CVE-2024-33873
 - hdf5: CVE-2024-33874: https://nvd.nist.gov/vuln/detail/CVE-2024-33874
 - hdf5: CVE-2024-33875: https://nvd.nist.gov/vuln/detail/CVE-2024-33875
 - hdf5: CVE-2024-33876: https://nvd.nist.gov/vuln/detail/CVE-2024-33876
 - hdf5: CVE-2024-33877: https://nvd.nist.gov/vuln/detail/CVE-2024-33877
 - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
 - hdf5: CVE-2025-2913: https://nvd.nist.gov/vuln/detail/CVE-2025-2913
 - hdf5: CVE-2025-2914: https://nvd.nist.gov/vuln/detail/CVE-2025-2914
 - hdf5: CVE-2025-2915: https://nvd.nist.gov/vuln/detail/CVE-2025-2915
 - hdf5: CVE-2025-2923: https://nvd.nist.gov/vuln/detail/CVE-2025-2923
 - hdf5: CVE-2025-2924: https://nvd.nist.gov/vuln/detail/CVE-2025-2924
 - hdf5: CVE-2025-2925: https://nvd.nist.gov/vuln/detail/CVE-2025-2925
 - hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
 - hdf5: CVE-2025-6269: https://nvd.nist.gov/vuln/detail/CVE-2025-6269
 - hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
 - hdf5: CVE-2025-6516: https://nvd.nist.gov/vuln/detail/CVE-2025-6516
 - hdf5: CVE-2026-26200: https://nvd.nist.gov/vuln/detail/CVE-2026-26200
 - hplip: CVE-2020-6923: https://nvd.nist.gov/vuln/detail/CVE-2020-6923
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - imagemagick: CVE-2023-2157: https://nvd.nist.gov/vuln/detail/CVE-2023-2157
 - imagemagick: CVE-2023-34152: https://nvd.nist.gov/vuln/detail/CVE-2023-34152
 - imagemagick: CVE-2023-3428: https://nvd.nist.gov/vuln/detail/CVE-2023-3428
 - imagemagick: CVE-2023-34475: https://nvd.nist.gov/vuln/detail/CVE-2023-34475
 - imagemagick: CVE-2025-46393: https://nvd.nist.gov/vuln/detail/CVE-2025-46393
 - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - imagemagick: CVE-2025-68469: https://nvd.nist.gov/vuln/detail/CVE-2025-68469
 - imagemagick: CVE-2025-68950: https://nvd.nist.gov/vuln/detail/CVE-2025-68950
 - imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - imagemagick: CVE-2026-24481: https://nvd.nist.gov/vuln/detail/CVE-2026-24481
 - imagemagick: CVE-2026-24484: https://nvd.nist.gov/vuln/detail/CVE-2026-24484
 - imagemagick: CVE-2026-24485: https://nvd.nist.gov/vuln/detail/CVE-2026-24485
 - imagemagick: CVE-2026-25576: https://nvd.nist.gov/vuln/detail/CVE-2026-25576
 - imagemagick: CVE-2026-25637: https://nvd.nist.gov/vuln/detail/CVE-2026-25637
 - imagemagick: CVE-2026-25638: https://nvd.nist.gov/vuln/detail/CVE-2026-25638
 - imagemagick: CVE-2026-25794: https://nvd.nist.gov/vuln/detail/CVE-2026-25794
 - imagemagick: CVE-2026-25795: https://nvd.nist.gov/vuln/detail/CVE-2026-25795
 - imagemagick: CVE-2026-25796: https://nvd.nist.gov/vuln/detail/CVE-2026-25796
 - imagemagick: CVE-2026-25797: https://nvd.nist.gov/vuln/detail/CVE-2026-25797
 - imagemagick: CVE-2026-25798: https://nvd.nist.gov/vuln/detail/CVE-2026-25798
 - imagemagick: CVE-2026-25799: https://nvd.nist.gov/vuln/detail/CVE-2026-25799
 - imagemagick: CVE-2026-25897: https://nvd.nist.gov/vuln/detail/CVE-2026-25897
 - imagemagick: CVE-2026-25898: https://nvd.nist.gov/vuln/detail/CVE-2026-25898
 - imagemagick: CVE-2026-25965: https://nvd.nist.gov/vuln/detail/CVE-2026-25965
 - imagemagick: CVE-2026-25966: https://nvd.nist.gov/vuln/detail/CVE-2026-25966
 - imagemagick: CVE-2026-25967: https://nvd.nist.gov/vuln/detail/CVE-2026-25967
 - imagemagick: CVE-2026-25968: https://nvd.nist.gov/vuln/detail/CVE-2026-25968
 - imagemagick: CVE-2026-25969: https://nvd.nist.gov/vuln/detail/CVE-2026-25969
 - imagemagick: CVE-2026-25970: https://nvd.nist.gov/vuln/detail/CVE-2026-25970
 - imagemagick: CVE-2026-25971: https://nvd.nist.gov/vuln/detail/CVE-2026-25971
 - imagemagick: CVE-2026-25982: https://nvd.nist.gov/vuln/detail/CVE-2026-25982
 - imagemagick: CVE-2026-25983: https://nvd.nist.gov/vuln/detail/CVE-2026-25983
 - imagemagick: CVE-2026-25985: https://nvd.nist.gov/vuln/detail/CVE-2026-25985
 - imagemagick: CVE-2026-25986: https://nvd.nist.gov/vuln/detail/CVE-2026-25986
 - imagemagick: CVE-2026-25987: https://nvd.nist.gov/vuln/detail/CVE-2026-25987
 - imagemagick: CVE-2026-25988: https://nvd.nist.gov/vuln/detail/CVE-2026-25988
 - imagemagick: CVE-2026-25989: https://nvd.nist.gov/vuln/detail/CVE-2026-25989
 - imagemagick: CVE-2026-26066: https://nvd.nist.gov/vuln/detail/CVE-2026-26066
 - imagemagick: CVE-2026-26283: https://nvd.nist.gov/vuln/detail/CVE-2026-26283
 - imagemagick: CVE-2026-26284: https://nvd.nist.gov/vuln/detail/CVE-2026-26284
 - imagemagick: CVE-2026-26983: https://nvd.nist.gov/vuln/detail/CVE-2026-26983
 - imagemagick: CVE-2026-27798: https://nvd.nist.gov/vuln/detail/CVE-2026-27798
 - imagemagick: CVE-2026-27799: https://nvd.nist.gov/vuln/detail/CVE-2026-27799
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
 - [NEW] imagemagick: CVE-2026-33535: https://nvd.nist.gov/vuln/detail/CVE-2026-33535
 - [NEW] imagemagick: CVE-2026-33536: https://nvd.nist.gov/vuln/detail/CVE-2026-33536
 - libass: CVE-2020-26682: https://nvd.nist.gov/vuln/detail/CVE-2020-26682
 - libde265: CVE-2026-33164: https://nvd.nist.gov/vuln/detail/CVE-2026-33164
 - libde265: CVE-2026-33165: https://nvd.nist.gov/vuln/detail/CVE-2026-33165
 - libebml: CVE-2015-8789: https://nvd.nist.gov/vuln/detail/CVE-2015-8789
 - libebml: CVE-2015-8790: https://nvd.nist.gov/vuln/detail/CVE-2015-8790
 - libebml: CVE-2021-3405: https://nvd.nist.gov/vuln/detail/CVE-2021-3405
 - libebml: CVE-2023-52339: https://nvd.nist.gov/vuln/detail/CVE-2023-52339
 - libiec61850: CVE-2023-27772: https://nvd.nist.gov/vuln/detail/CVE-2023-27772
 - libiec61850: CVE-2024-26529: https://nvd.nist.gov/vuln/detail/CVE-2024-26529
 - libiec61850: CVE-2024-45971: https://nvd.nist.gov/vuln/detail/CVE-2024-45971
 - libmatroska: CVE-2015-8792: https://nvd.nist.gov/vuln/detail/CVE-2015-8792
 - libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-2023-27478
 - [NEW] libraw: CVE-2026-5318: https://nvd.nist.gov/vuln/detail/CVE-2026-5318
 - [NEW] libraw: CVE-2026-5342: https://nvd.nist.gov/vuln/detail/CVE-2026-5342
 - libssh: CVE-2025-5372: https://nvd.nist.gov/vuln/detail/CVE-2025-5372
 - [NEW] libssh: CVE-2026-0965: https://nvd.nist.gov/vuln/detail/CVE-2026-0965
 - [NEW] libssh: CVE-2026-0967: https://nvd.nist.gov/vuln/detail/CVE-2026-0967
 - [NEW] libssh: CVE-2026-0968: https://nvd.nist.gov/vuln/detail/CVE-2026-0968
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - libvncserver: CVE-2026-32853: https://nvd.nist.gov/vuln/detail/CVE-2026-32853
 - libvncserver: CVE-2026-32854: https://nvd.nist.gov/vuln/detail/CVE-2026-32854
 - libvpx: CVE-2023-44488: https://nvd.nist.gov/vuln/detail/CVE-2023-44488
 - libvpx: CVE-2023-5217: https://nvd.nist.gov/vuln/detail/CVE-2023-5217
 - libvpx: CVE-2023-6349: https://nvd.nist.gov/vuln/detail/CVE-2023-6349
 - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
 - libwebsockets: CVE-2025-11677: https://nvd.nist.gov/vuln/detail/CVE-2025-11677
 - libwebsockets: CVE-2025-11678: https://nvd.nist.gov/vuln/detail/CVE-2025-11678
 - libwebsockets: CVE-2025-1866: https://nvd.nist.gov/vuln/detail/CVE-2025-1866
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mariadb: CVE-2023-52970: https://nvd.nist.gov/vuln/detail/CVE-2023-52970
 - mariadb: CVE-2026-3494: https://nvd.nist.gov/vuln/detail/CVE-2026-3494
 - [NEW] mbedtls: CVE-2026-34871: https://nvd.nist.gov/vuln/detail/CVE-2026-34871
 - [NEW] mbedtls: CVE-2026-34876: https://nvd.nist.gov/vuln/detail/CVE-2026-34876
 - mongodb: CVE-2023-1409: https://nvd.nist.gov/vuln/detail/CVE-2023-1409
 - mongodb: CVE-2024-1351: https://nvd.nist.gov/vuln/detail/CVE-2024-1351
 - mongodb: CVE-2025-14847: https://nvd.nist.gov/vuln/detail/CVE-2025-14847
 - mongodb: CVE-2025-14911: https://nvd.nist.gov/vuln/detail/CVE-2025-14911
 - mongodb: CVE-2026-1850: https://nvd.nist.gov/vuln/detail/CVE-2026-1850
 - mongodb: CVE-2026-25612: https://nvd.nist.gov/vuln/detail/CVE-2026-25612
 - mongodb: CVE-2026-4147: https://nvd.nist.gov/vuln/detail/CVE-2026-4147
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - netdata: CVE-2023-22496: https://nvd.nist.gov/vuln/detail/CVE-2023-22496
 - nginx: CVE-2026-27651: https://nvd.nist.gov/vuln/detail/CVE-2026-27651
 - nginx: CVE-2026-27654: https://nvd.nist.gov/vuln/detail/CVE-2026-27654
 - nginx: CVE-2026-27784: https://nvd.nist.gov/vuln/detail/CVE-2026-27784
 - nginx: CVE-2026-28753: https://nvd.nist.gov/vuln/detail/CVE-2026-28753
 - nginx: CVE-2026-32647: https://nvd.nist.gov/vuln/detail/CVE-2026-32647
 - nodejs: CVE-2024-22020: https://nvd.nist.gov/vuln/detail/CVE-2024-22020
 - nodejs: CVE-2024-27982: https://nvd.nist.gov/vuln/detail/CVE-2024-27982
 - nodejs: CVE-2025-23166: https://nvd.nist.gov/vuln/detail/CVE-2025-23166
 - nodejs: CVE-2025-55131: https://nvd.nist.gov/vuln/detail/CVE-2025-55131
 - nodejs: CVE-2025-59465: https://nvd.nist.gov/vuln/detail/CVE-2025-59465
 - nodejs: CVE-2026-21637: https://nvd.nist.gov/vuln/detail/CVE-2026-21637
 - [NEW] nodejs: CVE-2026-21712: https://nvd.nist.gov/vuln/detail/CVE-2026-21712
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - openjpeg: CVE-2025-54874: https://nvd.nist.gov/vuln/detail/CVE-2025-54874
 - [NEW] opensc: CVE-2025-49010: https://nvd.nist.gov/vuln/detail/CVE-2025-49010
 - [NEW] opensc: CVE-2025-66037: https://nvd.nist.gov/vuln/detail/CVE-2025-66037
 - [NEW] opensc: CVE-2025-66038: https://nvd.nist.gov/vuln/detail/CVE-2025-66038
 - [NEW] opensc: CVE-2025-66215: https://nvd.nist.gov/vuln/detail/CVE-2025-66215
 - ostree: CVE-2022-47085: https://nvd.nist.gov/vuln/detail/CVE-2022-47085
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - poppler: CVE-2022-38784: https://nvd.nist.gov/vuln/detail/CVE-2022-38784
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69225: https://nvd.nist.gov/vuln/detail/CVE-2025-69225
 - python3-aiohttp: CVE-2025-69226: https://nvd.nist.gov/vuln/detail/CVE-2025-69226
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69228: https://nvd.nist.gov/vuln/detail/CVE-2025-69228
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - [NEW] python3-aiohttp: CVE-2026-22815: https://nvd.nist.gov/vuln/detail/CVE-2026-22815
 - [NEW] python3-aiohttp: CVE-2026-34513: https://nvd.nist.gov/vuln/detail/CVE-2026-34513
 - [NEW] python3-aiohttp: CVE-2026-34514: https://nvd.nist.gov/vuln/detail/CVE-2026-34514
 - [NEW] python3-aiohttp: CVE-2026-34515: https://nvd.nist.gov/vuln/detail/CVE-2026-34515
 - [NEW] python3-aiohttp: CVE-2026-34516: https://nvd.nist.gov/vuln/detail/CVE-2026-34516
 - [NEW] python3-aiohttp: CVE-2026-34517: https://nvd.nist.gov/vuln/detail/CVE-2026-34517
 - [NEW] python3-aiohttp: CVE-2026-34518: https://nvd.nist.gov/vuln/detail/CVE-2026-34518
 - [NEW] python3-aiohttp: CVE-2026-34519: https://nvd.nist.gov/vuln/detail/CVE-2026-34519
 - [NEW] python3-aiohttp: CVE-2026-34520: https://nvd.nist.gov/vuln/detail/CVE-2026-34520
 - [NEW] python3-aiohttp: CVE-2026-34525: https://nvd.nist.gov/vuln/detail/CVE-2026-34525
 - python3-cbor2: CVE-2026-26209: https://nvd.nist.gov/vuln/detail/CVE-2026-26209
 - python3-django: CVE-2025-13473: https://nvd.nist.gov/vuln/detail/CVE-2025-13473
 - python3-django: CVE-2025-14550: https://nvd.nist.gov/vuln/detail/CVE-2025-14550
 - python3-django: CVE-2026-1207: https://nvd.nist.gov/vuln/detail/CVE-2026-1207
 - python3-django: CVE-2026-1285: https://nvd.nist.gov/vuln/detail/CVE-2026-1285
 - python3-django: CVE-2026-1287: https://nvd.nist.gov/vuln/detail/CVE-2026-1287
 - python3-django: CVE-2026-1312: https://nvd.nist.gov/vuln/detail/CVE-2026-1312
 - python3-dnspython: CVE-2023-29483: https://nvd.nist.gov/vuln/detail/CVE-2023-29483
 - [NEW] python3-ecdsa: CVE-2026-33936: https://nvd.nist.gov/vuln/detail/CVE-2026-33936
 - python3-flask: CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-grpcio: CVE-2023-32732: https://nvd.nist.gov/vuln/detail/CVE-2023-32732
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-paramiko: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
 - python3-pyjwt: CVE-2026-32597: https://nvd.nist.gov/vuln/detail/CVE-2026-32597
 - python3-redis: CVE-2023-28858: https://nvd.nist.gov/vuln/detail/CVE-2023-28858
 - python3-redis: CVE-2023-28859: https://nvd.nist.gov/vuln/detail/CVE-2023-28859
 - python3-tornado: CVE-2025-47287: https://nvd.nist.gov/vuln/detail/CVE-2025-47287
 - python3-tornado: CVE-2025-67724: https://nvd.nist.gov/vuln/detail/CVE-2025-67724
 - python3-tornado: CVE-2025-67725: https://nvd.nist.gov/vuln/detail/CVE-2025-67725
 - python3-tornado: CVE-2025-67726: https://nvd.nist.gov/vuln/detail/CVE-2025-67726
 - python3-tornado: CVE-2026-31958: https://nvd.nist.gov/vuln/detail/CVE-2026-31958
 - [NEW] python3-tornado: CVE-2026-35536: https://nvd.nist.gov/vuln/detail/CVE-2026-35536
 - python3-twisted: CVE-2022-39348: https://nvd.nist.gov/vuln/detail/CVE-2022-39348
 - python3-werkzeug: CVE-2023-46136: https://nvd.nist.gov/vuln/detail/CVE-2023-46136
 - samba: CVE-2021-20251: https://nvd.nist.gov/vuln/detail/CVE-2021-20251
 - samba: CVE-2021-20316: https://nvd.nist.gov/vuln/detail/CVE-2021-20316
 - samba: CVE-2021-3670: https://nvd.nist.gov/vuln/detail/CVE-2021-3670
 - samba: CVE-2021-44141: https://nvd.nist.gov/vuln/detail/CVE-2021-44141
 - samba: CVE-2022-1615: https://nvd.nist.gov/vuln/detail/CVE-2022-1615
 - samba: CVE-2022-32743: https://nvd.nist.gov/vuln/detail/CVE-2022-32743
 - samba: CVE-2022-37966: https://nvd.nist.gov/vuln/detail/CVE-2022-37966
 - samba: CVE-2022-37967: https://nvd.nist.gov/vuln/detail/CVE-2022-37967
 - samba: CVE-2022-38023: https://nvd.nist.gov/vuln/detail/CVE-2022-38023
 - samba: CVE-2022-42898: https://nvd.nist.gov/vuln/detail/CVE-2022-42898
 - samba: CVE-2022-45141: https://nvd.nist.gov/vuln/detail/CVE-2022-45141
 - samba: CVE-2023-0614: https://nvd.nist.gov/vuln/detail/CVE-2023-0614
 - samba: CVE-2023-3961: https://nvd.nist.gov/vuln/detail/CVE-2023-3961
 - samba: CVE-2023-4154: https://nvd.nist.gov/vuln/detail/CVE-2023-4154
 - samba: CVE-2023-42670: https://nvd.nist.gov/vuln/detail/CVE-2023-42670
 - samba: CVE-2023-5568: https://nvd.nist.gov/vuln/detail/CVE-2023-5568
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - smarty: CVE-2024-35226: https://nvd.nist.gov/vuln/detail/CVE-2024-35226
 - sox: CVE-2019-8355: https://nvd.nist.gov/vuln/detail/CVE-2019-8355
 - sox: CVE-2019-8356: https://nvd.nist.gov/vuln/detail/CVE-2019-8356
 - sox: CVE-2019-8357: https://nvd.nist.gov/vuln/detail/CVE-2019-8357
 - sox: CVE-2021-40426: https://nvd.nist.gov/vuln/detail/CVE-2021-40426
 - sox: CVE-2022-31650: https://nvd.nist.gov/vuln/detail/CVE-2022-31650
 - sox: CVE-2022-31651: https://nvd.nist.gov/vuln/detail/CVE-2022-31651
 - sox: CVE-2023-34432: https://nvd.nist.gov/vuln/detail/CVE-2023-34432
 - spice: CVE-2021-20201: https://nvd.nist.gov/vuln/detail/CVE-2021-20201
 - sqlite: CVE-2015-3414: https://nvd.nist.gov/vuln/detail/CVE-2015-3414
 - sqlite: CVE-2015-3415: https://nvd.nist.gov/vuln/detail/CVE-2015-3415
 - sqlite: CVE-2015-3416: https://nvd.nist.gov/vuln/detail/CVE-2015-3416
 - sqlite: CVE-2015-3717: https://nvd.nist.gov/vuln/detail/CVE-2015-3717
 - sqlite: CVE-2015-5895: https://nvd.nist.gov/vuln/detail/CVE-2015-5895
 - sqlite: CVE-2015-6607: https://nvd.nist.gov/vuln/detail/CVE-2015-6607
 - sqlite: CVE-2016-6153: https://nvd.nist.gov/vuln/detail/CVE-2016-6153
 - sqlite: CVE-2017-10989: https://nvd.nist.gov/vuln/detail/CVE-2017-10989
 - sqlite: CVE-2018-20346: https://nvd.nist.gov/vuln/detail/CVE-2018-20346
 - sqlite: CVE-2018-20505: https://nvd.nist.gov/vuln/detail/CVE-2018-20505
 - sqlite: CVE-2018-20506: https://nvd.nist.gov/vuln/detail/CVE-2018-20506
 - sqlite: CVE-2018-8740: https://nvd.nist.gov/vuln/detail/CVE-2018-8740
 - sqlite: CVE-2019-19645: https://nvd.nist.gov/vuln/detail/CVE-2019-19645
 - sqlite: CVE-2019-19646: https://nvd.nist.gov/vuln/detail/CVE-2019-19646
 - sqlite: CVE-2020-11655: https://nvd.nist.gov/vuln/detail/CVE-2020-11655
 - sqlite: CVE-2020-11656: https://nvd.nist.gov/vuln/detail/CVE-2020-11656
 - sqlite: CVE-2020-13434: https://nvd.nist.gov/vuln/detail/CVE-2020-13434
 - sqlite: CVE-2020-13435: https://nvd.nist.gov/vuln/detail/CVE-2020-13435
 - sqlite: CVE-2020-13630: https://nvd.nist.gov/vuln/detail/CVE-2020-13630
 - sqlite: CVE-2020-13631: https://nvd.nist.gov/vuln/detail/CVE-2020-13631
 - sqlite: CVE-2020-13632: https://nvd.nist.gov/vuln/detail/CVE-2020-13632
 - sqlite: CVE-2020-15358: https://nvd.nist.gov/vuln/detail/CVE-2020-15358
 - sqlite: CVE-2022-35737: https://nvd.nist.gov/vuln/detail/CVE-2022-35737
 - sqlite: CVE-2023-7104: https://nvd.nist.gov/vuln/detail/CVE-2023-7104
 - sqlite: CVE-2025-6965: https://nvd.nist.gov/vuln/detail/CVE-2025-6965
 - squid: CVE-2023-49288: https://nvd.nist.gov/vuln/detail/CVE-2023-49288
 - squid: CVE-2024-25111: https://nvd.nist.gov/vuln/detail/CVE-2024-25111
 - squid: CVE-2024-25617: https://nvd.nist.gov/vuln/detail/CVE-2024-25617
 - squid: CVE-2024-37894: https://nvd.nist.gov/vuln/detail/CVE-2024-37894
 - squid: CVE-2025-62168: https://nvd.nist.gov/vuln/detail/CVE-2025-62168
 - squid: CVE-2026-32748: https://nvd.nist.gov/vuln/detail/CVE-2026-32748
 - [NEW] squid: CVE-2026-33515: https://nvd.nist.gov/vuln/detail/CVE-2026-33515
 - squid: CVE-2026-33526: https://nvd.nist.gov/vuln/detail/CVE-2026-33526
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tcpreplay: CVE-2024-54192: https://nvd.nist.gov/vuln/detail/CVE-2024-54192
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
 - tigervnc: CVE-2026-34352: https://nvd.nist.gov/vuln/detail/CVE-2026-34352
 - [NEW] tinyproxy: CVE-2026-3945: https://nvd.nist.gov/vuln/detail/CVE-2026-3945
 - unbound: CVE-2023-50387: https://nvd.nist.gov/vuln/detail/CVE-2023-50387
 - unbound: CVE-2024-1488: https://nvd.nist.gov/vuln/detail/CVE-2024-1488
 - unbound: CVE-2024-33655: https://nvd.nist.gov/vuln/detail/CVE-2024-33655
 - unbound: CVE-2024-43167: https://nvd.nist.gov/vuln/detail/CVE-2024-43167
 - unbound: CVE-2024-43168: https://nvd.nist.gov/vuln/detail/CVE-2024-43168
 - unbound: CVE-2024-8508: https://nvd.nist.gov/vuln/detail/CVE-2024-8508
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - wavpack: CVE-2016-10170: https://nvd.nist.gov/vuln/detail/CVE-2016-10170
 - wavpack: CVE-2016-10171: https://nvd.nist.gov/vuln/detail/CVE-2016-10171
 - wavpack: CVE-2016-10172: https://nvd.nist.gov/vuln/detail/CVE-2016-10172
 - wavpack: CVE-2018-10536: https://nvd.nist.gov/vuln/detail/CVE-2018-10536
 - wavpack: CVE-2018-10537: https://nvd.nist.gov/vuln/detail/CVE-2018-10537
 - wavpack: CVE-2018-10538: https://nvd.nist.gov/vuln/detail/CVE-2018-10538
 - wavpack: CVE-2018-10539: https://nvd.nist.gov/vuln/detail/CVE-2018-10539
 - wavpack: CVE-2018-10540: https://nvd.nist.gov/vuln/detail/CVE-2018-10540
 - wavpack: CVE-2018-19840: https://nvd.nist.gov/vuln/detail/CVE-2018-19840
 - wavpack: CVE-2018-19841: https://nvd.nist.gov/vuln/detail/CVE-2018-19841
 - wavpack: CVE-2019-1010315: https://nvd.nist.gov/vuln/detail/CVE-2019-1010315
 - wavpack: CVE-2019-1010317: https://nvd.nist.gov/vuln/detail/CVE-2019-1010317
 - wavpack: CVE-2019-1010319: https://nvd.nist.gov/vuln/detail/CVE-2019-1010319
 - wavpack: CVE-2019-11498: https://nvd.nist.gov/vuln/detail/CVE-2019-11498
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
 - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
 - wireshark: CVE-2022-4344: https://nvd.nist.gov/vuln/detail/CVE-2022-4344
 - wolfssl: CVE-2022-34293: https://nvd.nist.gov/vuln/detail/CVE-2022-34293
 - wolfssl: CVE-2022-38152: https://nvd.nist.gov/vuln/detail/CVE-2022-38152
 - wolfssl: CVE-2022-39173: https://nvd.nist.gov/vuln/detail/CVE-2022-39173
 - wolfssl: CVE-2022-42905: https://nvd.nist.gov/vuln/detail/CVE-2022-42905
 - wolfssl: CVE-2022-42961: https://nvd.nist.gov/vuln/detail/CVE-2022-42961
 - wolfssl: CVE-2023-3724: https://nvd.nist.gov/vuln/detail/CVE-2023-3724
 - wolfssl: CVE-2023-6935: https://nvd.nist.gov/vuln/detail/CVE-2023-6935
 - wolfssl: CVE-2023-6936: https://nvd.nist.gov/vuln/detail/CVE-2023-6936
 - wolfssl: CVE-2023-6937: https://nvd.nist.gov/vuln/detail/CVE-2023-6937
 - wolfssl: CVE-2024-0901: https://nvd.nist.gov/vuln/detail/CVE-2024-0901
 - wolfssl: CVE-2024-1543: https://nvd.nist.gov/vuln/detail/CVE-2024-1543
 - wolfssl: CVE-2024-1544: https://nvd.nist.gov/vuln/detail/CVE-2024-1544
 - wolfssl: CVE-2024-5288: https://nvd.nist.gov/vuln/detail/CVE-2024-5288
 - wolfssl: CVE-2024-5814: https://nvd.nist.gov/vuln/detail/CVE-2024-5814
 - wolfssl: CVE-2024-5991: https://nvd.nist.gov/vuln/detail/CVE-2024-5991
 - wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
 - wolfssl: CVE-2026-0819: https://nvd.nist.gov/vuln/detail/CVE-2026-0819
 - [NEW] wolfssl: CVE-2026-1005: https://nvd.nist.gov/vuln/detail/CVE-2026-1005
 - wolfssl: CVE-2026-2645: https://nvd.nist.gov/vuln/detail/CVE-2026-2645
 - wolfssl: CVE-2026-2646: https://nvd.nist.gov/vuln/detail/CVE-2026-2646
 - wolfssl: CVE-2026-3229: https://nvd.nist.gov/vuln/detail/CVE-2026-3229
 - wolfssl: CVE-2026-3230: https://nvd.nist.gov/vuln/detail/CVE-2026-3230
 - wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - wolfssl: CVE-2026-3547: https://nvd.nist.gov/vuln/detail/CVE-2026-3547
 - wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - wolfssl: CVE-2026-3549: https://nvd.nist.gov/vuln/detail/CVE-2026-3549
 - wolfssl: CVE-2026-3580: https://nvd.nist.gov/vuln/detail/CVE-2026-3580
 - wolfssl: CVE-2026-3849: https://nvd.nist.gov/vuln/detail/CVE-2026-3849
 - wolfssl: CVE-2026-4159: https://nvd.nist.gov/vuln/detail/CVE-2026-4159
 - wolfssl: CVE-2026-4395: https://nvd.nist.gov/vuln/detail/CVE-2026-4395
 - xrdp: CVE-2022-23482: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
 - xrdp: CVE-2023-40184: https://nvd.nist.gov/vuln/detail/CVE-2023-40184
 - xrdp: CVE-2023-42822: https://nvd.nist.gov/vuln/detail/CVE-2023-42822
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
 - zabbix: CVE-2026-23919: https://nvd.nist.gov/vuln/detail/CVE-2026-23919
 - zabbix: CVE-2026-23920: https://nvd.nist.gov/vuln/detail/CVE-2026-23920
 - zabbix: CVE-2026-23921: https://nvd.nist.gov/vuln/detail/CVE-2026-23921
 - zabbix: CVE-2026-23923: https://nvd.nist.gov/vuln/detail/CVE-2026-23923
 - zabbix: CVE-2026-23925: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

====================

Removed this week (2): 

 - python3-protobuf: CVE-2024-7254: https://nvd.nist.gov/vuln/detail/CVE-2024-7254
 - strongswan: CVE-2026-25075: https://nvd.nist.gov/vuln/detail/CVE-2026-25075

