Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2A0EFCBD1
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 06:31:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45049.1773642694860024353
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 23:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lPBTG4Ca;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so50015655e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 23:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773642693; x=1774247493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VHiZOibyRGGYtTI+2kvr9+7faKeYBjIJFp05G0ZDI4=;
        b=lPBTG4CaAneRkiQ3umi+V9j0hB4Zb9lRfOgjCZTrJ5X37dMpoEAqEsGPj36HwITClO
         3saZ7X6wpyy1bw18kCaOYsolhzJ6qmUjy98P/VwoGksL6sqcCKuImJEGAJWO4RZj/5wO
         KI3BUdzPPvsnl3WwFXVuC9OtkRB9zNpkjvw3FT9sSSRDb4a6pdROVzAC699eAaGx6Dka
         slQb7eUW+kjfYKFHuS4Q1B4sg69EHTLjANW6cmSqygNYfBuQN2fRqBH6GpDbIkfy+NKF
         QFMiIs+FURq/fMcm43ZVvgDHHxB2fe/SYcteM11VhfXxhm9sbu0vSA+4+1JFjXuAhGpZ
         Uk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773642693; x=1774247493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VHiZOibyRGGYtTI+2kvr9+7faKeYBjIJFp05G0ZDI4=;
        b=WKeOoBa1l0noQl55UIHmo1yk6TxoDlLquNwiKxRuMNZkBFZwuvqDSywb2rumxHxIQY
         XREFgE6gNLDdB8pmjOHxtebHYbGbJUgHH+GnClHC53xDnw2DmJx7aGOv29GkHnQrrdJ6
         cwRoKJkUzBcNFZGCTBh4pvda6PT43O67lK/G+DBn2GIw4HAQa/Ou3DmhN7RQ4gORp4QO
         /jJiDhSaMQZlcrMpyclnk3xlZ7t3cZpAeUOqQs6yXBH3JLaFbMP+VtQM7gXqL+DiLajv
         OB1QQt3BMUUSa0bSPJ6NqdFX5ISWSVvWl2JiWjujGXVWeH2XVzTmkofNw4Pf/aKpD5lh
         1VfA==
X-Gm-Message-State: AOJu0Yy7AAUmkO2D1kVkMIL3iWRClIkyS9FKH0AfLlTEniIV9R3V/KNP
	3c1/qk4wVIAU1h9+Jx7yQ+e+UOOZQtdE9N1s/uEIeCQqM/7BQlWIceidQNaE3A==
X-Gm-Gg: ATEYQzxhaz21yl5+1bv1KjEKWsZF2FOOYnY4nbGMRl1TzYPwmYzJq1Khz6GwcO5Hzxg
	COEsmoSpaMcDgMxeB1HQ+EMlXZ+/zrJNsEp3ejSH5+EDONLFvQSf2eIWkevyO1EvxKM7C1/5HHn
	AO3678FXQi7Cvddcwrr3Plan7qMfIywM3cX3+duV1kWdGauiznavCpXpx0YEl5k6n5DCBAqJuH8
	87zjmLfSsAzrZQiNVzyp/G0H79MQKcAoUBErLfQszMCZQNlbwFOTn3qzURwDnLihDq6ISAMCgK6
	I6zJr1nWy9VWCRsWMoQGHWT5HCKuuV9Z6ZHpCYNLFVjrlfNVuxRZyG7APTJ9IAWvCIk7Vzx7cGp
	BpV3FqeLp1nn22YDTrSxmEoEf464hAGwJvrY9e6kDnGNqyRm5KQwQAfyA7heQeUoXvIUPvHITmx
	7P6WckN/3M/+VNKNYxGKzF
X-Received: by 2002:a05:600c:8b45:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-485566cf8abmr200408245e9.4.1773642692843;
        Sun, 15 Mar 2026 23:31:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm1027701795e9.2.2026.03.15.23.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:31:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-03-16
Date: Mon, 16 Mar 2026 07:31:28 +0100
Message-ID: <20260316063130.515051-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 06:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125251

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (127, out of which new this week: 32):

 - [NEW] capnproto: CVE-2026-32239: https://nvd.nist.gov/vuln/detail/CVE-2026-32239
 - [NEW] capnproto: CVE-2026-32240: https://nvd.nist.gov/vuln/detail/CVE-2026-32240
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - ettercap: CVE-2026-3606: https://nvd.nist.gov/vuln/detail/CVE-2026-3606
 - exiftool: CVE-2026-3102: https://nvd.nist.gov/vuln/detail/CVE-2026-3102
 - exiv2: CVE-2026-25884: https://nvd.nist.gov/vuln/detail/CVE-2026-25884
 - exiv2: CVE-2026-27596: https://nvd.nist.gov/vuln/detail/CVE-2026-27596
 - exiv2: CVE-2026-27631: https://nvd.nist.gov/vuln/detail/CVE-2026-27631
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
 - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
 - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
 - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
 - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
 - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
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
 - [NEW] freerdp: CVE-2026-29774: https://nvd.nist.gov/vuln/detail/CVE-2026-29774
 - [NEW] freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-29776
 - [NEW] freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-31806
 - [NEW] freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-31883
 - [NEW] freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-31884
 - [NEW] freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-31885
 - [NEW] freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-31897
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - [NEW] imagemagick: CVE-2026-28493: https://nvd.nist.gov/vuln/detail/CVE-2026-28493
 - [NEW] imagemagick: CVE-2026-28494: https://nvd.nist.gov/vuln/detail/CVE-2026-28494
 - [NEW] imagemagick: CVE-2026-28686: https://nvd.nist.gov/vuln/detail/CVE-2026-28686
 - [NEW] imagemagick: CVE-2026-28687: https://nvd.nist.gov/vuln/detail/CVE-2026-28687
 - [NEW] imagemagick: CVE-2026-28688: https://nvd.nist.gov/vuln/detail/CVE-2026-28688
 - [NEW] imagemagick: CVE-2026-28689: https://nvd.nist.gov/vuln/detail/CVE-2026-28689
 - [NEW] imagemagick: CVE-2026-28690: https://nvd.nist.gov/vuln/detail/CVE-2026-28690
 - [NEW] imagemagick: CVE-2026-28691: https://nvd.nist.gov/vuln/detail/CVE-2026-28691
 - [NEW] imagemagick: CVE-2026-28692: https://nvd.nist.gov/vuln/detail/CVE-2026-28692
 - [NEW] imagemagick: CVE-2026-28693: https://nvd.nist.gov/vuln/detail/CVE-2026-28693
 - [NEW] imagemagick: CVE-2026-30883: https://nvd.nist.gov/vuln/detail/CVE-2026-30883
 - [NEW] imagemagick: CVE-2026-30929: https://nvd.nist.gov/vuln/detail/CVE-2026-30929
 - [NEW] imagemagick: CVE-2026-30931: https://nvd.nist.gov/vuln/detail/CVE-2026-30931
 - [NEW] imagemagick: CVE-2026-30935: https://nvd.nist.gov/vuln/detail/CVE-2026-30935
 - [NEW] imagemagick: CVE-2026-30936: https://nvd.nist.gov/vuln/detail/CVE-2026-30936
 - [NEW] imagemagick: CVE-2026-31853: https://nvd.nist.gov/vuln/detail/CVE-2026-31853
 - [NEW] imagemagick: CVE-2026-32259: https://nvd.nist.gov/vuln/detail/CVE-2026-32259
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libde265: CVE-2025-61147: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
 - libheif: CVE-2025-68431: https://nvd.nist.gov/vuln/detail/CVE-2025-68431
 - [NEW] libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - [NEW] libssh: CVE-2026-3731: https://nvd.nist.gov/vuln/detail/CVE-2026-3731
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - [NEW] mariadb: CVE-2026-3494: https://nvd.nist.gov/vuln/detail/CVE-2026-3494
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - python3-django: CVE-2026-25673: https://nvd.nist.gov/vuln/detail/CVE-2026-25673
 - python3-django: CVE-2026-25674: https://nvd.nist.gov/vuln/detail/CVE-2026-25674
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - [NEW] python3-nltk: CVE-2026-0846: https://nvd.nist.gov/vuln/detail/CVE-2026-0846
 - python3-protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - [NEW] python3-pyjwt: CVE-2026-32597: https://nvd.nist.gov/vuln/detail/CVE-2026-32597
 - [NEW] python3-tornado: CVE-2026-31958: https://nvd.nist.gov/vuln/detail/CVE-2026-31958
 - redis: CVE-2025-32023: https://nvd.nist.gov/vuln/detail/CVE-2025-32023
 - redis: CVE-2025-48367: https://nvd.nist.gov/vuln/detail/CVE-2025-48367
 - redis: CVE-2025-49844: https://nvd.nist.gov/vuln/detail/CVE-2025-49844
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - vlc: CVE-2026-26227: https://nvd.nist.gov/vuln/detail/CVE-2026-26227
 - vlc: CVE-2026-26228: https://nvd.nist.gov/vuln/detail/CVE-2026-26228
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - wireshark: CVE-2026-3201: https://nvd.nist.gov/vuln/detail/CVE-2026-3201
 - wireshark: CVE-2026-3202: https://nvd.nist.gov/vuln/detail/CVE-2026-3202
 - wireshark: CVE-2026-3203: https://nvd.nist.gov/vuln/detail/CVE-2026-3203
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - zabbix: CVE-2026-23925: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

====================

Removed this week (0): 


