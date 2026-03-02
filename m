Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F35D58E73
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 07:06:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155099.1772435188919204362
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 23:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y5RPnA6u;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so291919f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 23:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772435187; x=1773039987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/sKKifWO/xQygv5XTNVpaIzP0bDl4hAvByhg1gccHF0=;
        b=Y5RPnA6uiO+i96eHbW+fKjf7j3cGiD3RM0AsaeV4H2XuBq62raH9mAjILLyEVixrOY
         Z5M+IJuW8RCvB+9xFbPIiTlo7v5JhEQc7PffQlU6DYYPSJ8yH4XiujH+1K0wi8i1JoOy
         WviWkt+0hB6GK0S3QrZQSB8ZWcsSDrC4EJEyfFCUNp39KU8YsGpglBNbI+8xA4O5r75H
         tOl05fgmlDkYR1AUsSLSt0UriX6+gsvSQDq8qq4g0Meew+AbpDHKVKkcmHN6NiU1G606
         kELCIxfLzJHMovTtp6Y+NbhfHp/Zyb+AEhxbaIa6y7hBXaHLauVk2dFqhGiqNxVPuxzF
         mj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772435187; x=1773039987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sKKifWO/xQygv5XTNVpaIzP0bDl4hAvByhg1gccHF0=;
        b=Fvu6iE2WNG1NL+DZ763OpdWiVYqGYlyuxRlYW/ZhJTCAMqySCLwmX1JgycUmuFwEoT
         aeUbaWvWnlyWTjaTzYKsdexnD8PRLv1IHV3noSMYxgClRwXlYmSP9U6X22/PboYmpNpj
         4DLAn7TVHvNWXdQ5K7E5mS45/3Q/7eVxoGZOiWooj5NqfUv5/aK/HWVZYJR7DtmngM2Q
         rRwDe1pwVmHIkpWl2nlCcxXW13H4x85lNhuu0Ol7uoKPf4OL96hjJLxU0PVF47IAWW4a
         S/lY9x9GBFZcqWK+Etf+g3b5YAIM1uViZ+SS8QmZ0BgMK+drK7f4CqNxUmgq7mfPelE1
         /Xqg==
X-Gm-Message-State: AOJu0YwUUAvKOkS7wnAugrcTs3+1hgEToZhr9xDKujacvo/NpvebBElz
	2S6NTHPh/VKYseGpOz/VscdQCiQEWKrMo7ZkMr6X+JcbQsAvvJPH05LDAdVFKQ==
X-Gm-Gg: ATEYQzw7K4aBMO6Bs6BAY5YHIHDsaQEHZCU4vRDdTVYwu6NrmZPC8hvXMZsMxWBVmNH
	iWQYObb3Pyz+XN7JKhWZxjyyzWQUdOs+wkliOGaPpIdeOzKgiwHhb5++6FPBRVoAB3rBsG1GzFz
	Ihia6LJhMgTgmDu0cqEwAX72wgLNwXL/JMp/Px84DXgyPrk5UmL60P/QfDpFBjMqgYxVBC+mfWj
	P5vlHySb7GQp/2aOu18gIwlPzTS4F4K82KkEgIpojiY27aZGP9d/fBdBz9xTUPhggJ82//gGKT/
	SNgeSd4HsfcDv4KP4W3DYq/LnEmoGx1ougf4NSy4+GqaV3J3DXTJ03aMQBdxqgBK1KONpLQaNt9
	lpxGdUouONu7fDmL6H++3NdLKHmoclxuJ+Gii/eh5CyBWZMzmcBywxPjomyD8UNyB6N55Vjdbdh
	NKen5b2LEBh91FdFfmjdIg
X-Received: by 2002:adf:fec5:0:b0:439:ac32:9117 with SMTP id ffacd0b85a97d-439ac3291camr8365966f8f.6.1772435186854;
        Sun, 01 Mar 2026 23:06:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm24766058f8f.24.2026.03.01.23.06.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:06:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2026-03-02
Date: Mon,  2 Mar 2026 08:06:23 +0100
Message-ID: <20260302070624.1505272-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124802

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (228, out of which new this week: 53):

 - [NEW] abseil-cpp: CVE-2025-0838: https://nvd.nist.gov/vuln/detail/CVE-2025-0838
 - botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - [NEW] exiftool: CVE-2026-3102: https://nvd.nist.gov/vuln/detail/CVE-2026-3102
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
 - [NEW] freerdp: CVE-2026-25941: https://nvd.nist.gov/vuln/detail/CVE-2026-25941
 - [NEW] freerdp: CVE-2026-25942: https://nvd.nist.gov/vuln/detail/CVE-2026-25942
 - [NEW] freerdp: CVE-2026-25952: https://nvd.nist.gov/vuln/detail/CVE-2026-25952
 - [NEW] freerdp: CVE-2026-25953: https://nvd.nist.gov/vuln/detail/CVE-2026-25953
 - [NEW] freerdp: CVE-2026-25954: https://nvd.nist.gov/vuln/detail/CVE-2026-25954
 - [NEW] freerdp: CVE-2026-25955: https://nvd.nist.gov/vuln/detail/CVE-2026-25955
 - [NEW] freerdp: CVE-2026-25959: https://nvd.nist.gov/vuln/detail/CVE-2026-25959
 - [NEW] freerdp: CVE-2026-25997: https://nvd.nist.gov/vuln/detail/CVE-2026-25997
 - [NEW] freerdp: CVE-2026-26271: https://nvd.nist.gov/vuln/detail/CVE-2026-26271
 - [NEW] freerdp: CVE-2026-26955: https://nvd.nist.gov/vuln/detail/CVE-2026-26955
 - [NEW] freerdp: CVE-2026-26965: https://nvd.nist.gov/vuln/detail/CVE-2026-26965
 - [NEW] freerdp: CVE-2026-26986: https://nvd.nist.gov/vuln/detail/CVE-2026-26986
 - [NEW] freerdp: CVE-2026-27015: https://nvd.nist.gov/vuln/detail/CVE-2026-27015
 - [NEW] freerdp: CVE-2026-27950: https://nvd.nist.gov/vuln/detail/CVE-2026-27950
 - [NEW] freerdp: CVE-2026-27951: https://nvd.nist.gov/vuln/detail/CVE-2026-27951
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - gimp: CVE-2025-15059: https://nvd.nist.gov/vuln/detail/CVE-2025-15059
 - gimp: CVE-2025-2760: https://nvd.nist.gov/vuln/detail/CVE-2025-2760
 - gimp: CVE-2025-2761: https://nvd.nist.gov/vuln/detail/CVE-2025-2761
 - gimp: CVE-2026-0797: https://nvd.nist.gov/vuln/detail/CVE-2026-0797
 - gimp: CVE-2026-2044: https://nvd.nist.gov/vuln/detail/CVE-2026-2044
 - gimp: CVE-2026-2045: https://nvd.nist.gov/vuln/detail/CVE-2026-2045
 - gimp: CVE-2026-2047: https://nvd.nist.gov/vuln/detail/CVE-2026-2047
 - gimp: CVE-2026-2048: https://nvd.nist.gov/vuln/detail/CVE-2026-2048
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - imagemagick: CVE-2025-68618: https://nvd.nist.gov/vuln/detail/CVE-2025-68618
 - imagemagick: CVE-2025-68950: https://nvd.nist.gov/vuln/detail/CVE-2025-68950
 - imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - imagemagick: CVE-2026-23874: https://nvd.nist.gov/vuln/detail/CVE-2026-23874
 - imagemagick: CVE-2026-23876: https://nvd.nist.gov/vuln/detail/CVE-2026-23876
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - [NEW] imagemagick: CVE-2026-24481: https://nvd.nist.gov/vuln/detail/CVE-2026-24481
 - [NEW] imagemagick: CVE-2026-24484: https://nvd.nist.gov/vuln/detail/CVE-2026-24484
 - [NEW] imagemagick: CVE-2026-24485: https://nvd.nist.gov/vuln/detail/CVE-2026-24485
 - [NEW] imagemagick: CVE-2026-25576: https://nvd.nist.gov/vuln/detail/CVE-2026-25576
 - [NEW] imagemagick: CVE-2026-25637: https://nvd.nist.gov/vuln/detail/CVE-2026-25637
 - [NEW] imagemagick: CVE-2026-25638: https://nvd.nist.gov/vuln/detail/CVE-2026-25638
 - [NEW] imagemagick: CVE-2026-25794: https://nvd.nist.gov/vuln/detail/CVE-2026-25794
 - [NEW] imagemagick: CVE-2026-25795: https://nvd.nist.gov/vuln/detail/CVE-2026-25795
 - [NEW] imagemagick: CVE-2026-25796: https://nvd.nist.gov/vuln/detail/CVE-2026-25796
 - [NEW] imagemagick: CVE-2026-25797: https://nvd.nist.gov/vuln/detail/CVE-2026-25797
 - [NEW] imagemagick: CVE-2026-25798: https://nvd.nist.gov/vuln/detail/CVE-2026-25798
 - [NEW] imagemagick: CVE-2026-25799: https://nvd.nist.gov/vuln/detail/CVE-2026-25799
 - [NEW] imagemagick: CVE-2026-25897: https://nvd.nist.gov/vuln/detail/CVE-2026-25897
 - [NEW] imagemagick: CVE-2026-25898: https://nvd.nist.gov/vuln/detail/CVE-2026-25898
 - [NEW] imagemagick: CVE-2026-25965: https://nvd.nist.gov/vuln/detail/CVE-2026-25965
 - [NEW] imagemagick: CVE-2026-25966: https://nvd.nist.gov/vuln/detail/CVE-2026-25966
 - [NEW] imagemagick: CVE-2026-25967: https://nvd.nist.gov/vuln/detail/CVE-2026-25967
 - [NEW] imagemagick: CVE-2026-25968: https://nvd.nist.gov/vuln/detail/CVE-2026-25968
 - [NEW] imagemagick: CVE-2026-25969: https://nvd.nist.gov/vuln/detail/CVE-2026-25969
 - [NEW] imagemagick: CVE-2026-25970: https://nvd.nist.gov/vuln/detail/CVE-2026-25970
 - [NEW] imagemagick: CVE-2026-25971: https://nvd.nist.gov/vuln/detail/CVE-2026-25971
 - [NEW] imagemagick: CVE-2026-25982: https://nvd.nist.gov/vuln/detail/CVE-2026-25982
 - [NEW] imagemagick: CVE-2026-25983: https://nvd.nist.gov/vuln/detail/CVE-2026-25983
 - [NEW] imagemagick: CVE-2026-25985: https://nvd.nist.gov/vuln/detail/CVE-2026-25985
 - [NEW] imagemagick: CVE-2026-25986: https://nvd.nist.gov/vuln/detail/CVE-2026-25986
 - [NEW] imagemagick: CVE-2026-25987: https://nvd.nist.gov/vuln/detail/CVE-2026-25987
 - [NEW] imagemagick: CVE-2026-25988: https://nvd.nist.gov/vuln/detail/CVE-2026-25988
 - [NEW] imagemagick: CVE-2026-25989: https://nvd.nist.gov/vuln/detail/CVE-2026-25989
 - [NEW] imagemagick: CVE-2026-26066: https://nvd.nist.gov/vuln/detail/CVE-2026-26066
 - [NEW] imagemagick: CVE-2026-26283: https://nvd.nist.gov/vuln/detail/CVE-2026-26283
 - [NEW] imagemagick: CVE-2026-26284: https://nvd.nist.gov/vuln/detail/CVE-2026-26284
 - [NEW] imagemagick: CVE-2026-26983: https://nvd.nist.gov/vuln/detail/CVE-2026-26983
 - [NEW] imagemagick: CVE-2026-27798: https://nvd.nist.gov/vuln/detail/CVE-2026-27798
 - [NEW] imagemagick: CVE-2026-27799: https://nvd.nist.gov/vuln/detail/CVE-2026-27799
 - keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41184
 - libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
 - [NEW] libde265: CVE-2025-61147: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
 - libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mongodb: CVE-2026-1850: https://nvd.nist.gov/vuln/detail/CVE-2026-1850
 - mongodb: CVE-2026-25612: https://nvd.nist.gov/vuln/detail/CVE-2026-25612
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
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
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
 - [NEW] python3-flask: CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-gunicorn: CVE-2024-6827: https://nvd.nist.gov/vuln/detail/CVE-2024-6827
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-pillow: CVE-2026-25990: https://nvd.nist.gov/vuln/detail/CVE-2026-25990
 - python3-virtualenv: CVE-2024-53899: https://nvd.nist.gov/vuln/detail/CVE-2024-53899
 - python3-werkzeug: CVE-2026-27199: https://nvd.nist.gov/vuln/detail/CVE-2026-27199
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
 - tcpreplay: CVE-2024-54192: https://nvd.nist.gov/vuln/detail/CVE-2024-54192
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

Removed this week (7): 

 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - nginx: CVE-2026-1642: https://nvd.nist.gov/vuln/detail/CVE-2026-1642
 - postgresql: CVE-2026-2003: https://nvd.nist.gov/vuln/detail/CVE-2026-2003
 - postgresql: CVE-2026-2004: https://nvd.nist.gov/vuln/detail/CVE-2026-2004
 - postgresql: CVE-2026-2005: https://nvd.nist.gov/vuln/detail/CVE-2026-2005
 - postgresql: CVE-2026-2006: https://nvd.nist.gov/vuln/detail/CVE-2026-2006
 - wireshark: CVE-2026-0962: https://nvd.nist.gov/vuln/detail/CVE-2026-0962

