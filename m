Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2768FCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:38:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5760.1763372330108722350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dTtWPB6Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so11595375e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 01:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763372328; x=1763977128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+89d37u3Igv74JB4XtQlG35a8mZtncEKA/q6RVX5x0=;
        b=dTtWPB6YvGwRIREUunMqGxksCVv1I5nmX1pLIPqq2RncyuJTDODpWAEozLt8XIJpaX
         6MY27Wh3RiLy/UEKRkGRx5oaw2lpv9LxIhxByUsWA9fEatS0gQuWmPoscmlvZNPNWgMe
         3qJxhvQ5y+Hqr0C73asiEPWzSsn/yMU2ZmijVBT54U4Ub2uDaMgllT6IcLhakDVdzUho
         WOBVM1ZIEdG0wg/EHlsQJZ1A7ig2ieGJukx15iDjD0PWzrBq7o8wOwyYoS+OYcpjMrwy
         +7FFgIkotPwUGhM20c5fsBhgxQVvkPCWbcpMe3nvGPu+nWPkGU10wzzNZ0M+eqXN3b89
         RFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372328; x=1763977128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+89d37u3Igv74JB4XtQlG35a8mZtncEKA/q6RVX5x0=;
        b=PXEx8OoSGkfsCnkQDtwi46WR+yiVK2gkv7TWlyfLjs6hL5T6vY47n+LWf+RX40H5+l
         IIGAzZT60QmoqnoUIkxNQ9eLGKB/vMZpmawCGIKAJV6tSwWTPIt4aC1k+eN5kWnrv1Kg
         +KG0/3KJKlQG9WobSYPL1mV0fxGfdkf7JPexvI6R89xy6Gtf4HWViVDXpZcXEy+MKKgI
         +1a4zJYhl08Usruj0xncs5zHfIvOl2kbquz9wdiryKr7FY//P5DL9LCofQt3De8UUyu8
         Pa6/4QCBFSBNCCd3lhcFRLyzvXpycQ3lbNz8VjSzZlDbgLeng+Chj/6Rbf9HwTOsBVDf
         TsqA==
X-Gm-Message-State: AOJu0YwHqb8HMei215/Yq6gJ4c+RI6NTF5wEO9zJpUK9SyBa26mLhqWn
	Hjswkif8lwCbMLD8+5dwGS31XfC6NvS9wxrLQdSpOQB23h8YoauLGqUURg/LhH3m
X-Gm-Gg: ASbGnctb5dlaKbyko80yc4SBWDl/X37vf8jt0ZGx/HT3OHyA+X/H1HJCS+TJFS6AqCC
	CzNzXGkadzbJveFrkGxbHzXrJ4nZJWezFahQYyeiJ5K3+VvnD2MH871s+56OzFinEq5hEe/n/NA
	L3Vxvnr+jaUIymdft02+7gb3Kd7u+z3JIrtfUuG2mjv+5EJk5Nep1UWtPO+EGcFa6nwLjo5mamK
	1h3HOPhVDyKWpba4ugDMWzTMgUUyNOMt3wZoV5n1j454c8AsYHwtixuMqN+w+E9X1+lpt5MUCiO
	Sy1kFHcj4cYRjUfwGlGJQ6mLyvSb6rXcxQ95h1HC8RKPLzPqBWQcjlIQB/k6NFv2iPdjq6euXoc
	1FWEkFdS5JVaL5lUa+BBz8iBKXaXP54Y4/klO9EhlnisVIGNO7z4ZfMx7bFFre9kKCFpGdnutSA
	==
X-Google-Smtp-Source: AGHT+IES9brFltemWMF/qUVYM+WUy31BeZ5p5Br3xB0ORpJRabefcf+G/ghnLvli6im805OWZkc9Ig==
X-Received: by 2002:a05:600c:c177:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4778fe683d6mr100943375e9.13.1763372328331;
        Mon, 17 Nov 2025 01:38:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477975022ecsm138375425e9.4.2025.11.17.01.38.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:38:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2025-11-17
Date: Mon, 17 Nov 2025 10:38:47 +0100
Message-ID: <20251117093847.844119-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 09:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121769

List of all open CVEs (138, out of which new this week: 1):

 - apache2: CVE-2025-3891: https://nvd.nist.gov/vuln/detail/CVE-2025-3891
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - botan: CVE-2024-50382: https://nvd.nist.gov/vuln/detail/CVE-2024-50382
 - botan: CVE-2024-50383: https://nvd.nist.gov/vuln/detail/CVE-2024-50383
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - freerdp3: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
 - [NEW] frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-44070
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
 - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
 - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
 - hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
 - hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
 - id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
 - imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-5341
 - imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024-41817
 - imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-53014
 - imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-53015
 - imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-53019
 - imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-53101
 - imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-55004
 - imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-55005
 - imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-55154
 - imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-55160
 - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-57803
 - imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-57807
 - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - iptraf-ng: CVE-2024-52949: https://nvd.nist.gov/vuln/detail/CVE-2024-52949
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
 - libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-2023-27478
 - libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
 - libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-33643
 - libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-33644
 - libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-33645
 - libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-33646
 - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
 - libwmf: CVE-2009-1364: https://nvd.nist.gov/vuln/detail/CVE-2009-1364
 - libwmf: CVE-2015-0848: https://nvd.nist.gov/vuln/detail/CVE-2015-0848
 - libwmf: CVE-2015-4588: https://nvd.nist.gov/vuln/detail/CVE-2015-4588
 - libwmf: CVE-2015-4695: https://nvd.nist.gov/vuln/detail/CVE-2015-4695
 - libwmf: CVE-2015-4696: https://nvd.nist.gov/vuln/detail/CVE-2015-4696
 - libwmf: CVE-2016-9011: https://nvd.nist.gov/vuln/detail/CVE-2016-9011
 - links: CVE-2008-3319: https://nvd.nist.gov/vuln/detail/CVE-2008-3319
 - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42861
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - nbdkit: CVE-2025-47711: https://nvd.nist.gov/vuln/detail/CVE-2025-47711
 - nbdkit: CVE-2025-47712: https://nvd.nist.gov/vuln/detail/CVE-2025-47712
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-47021
 - p7zip: CVE-2022-47069: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
 - redis: CVE-2022-0543: https://nvd.nist.gov/vuln/detail/CVE-2022-0543
 - redis: CVE-2025-27151: https://nvd.nist.gov/vuln/detail/CVE-2025-27151
 - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
 - smarty: CVE-2020-10375: https://nvd.nist.gov/vuln/detail/CVE-2020-10375
 - sngrep: CVE-2024-35434: https://nvd.nist.gov/vuln/detail/CVE-2024-35434
 - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
 - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
 - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-15117
 - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
 - uw-imap: CVE-2018-19518: https://nvd.nist.gov/vuln/detail/CVE-2018-19518
 - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
 - webmin: CVE-2017-15644: https://nvd.nist.gov/vuln/detail/CVE-2017-15644
 - webmin: CVE-2017-15645: https://nvd.nist.gov/vuln/detail/CVE-2017-15645
 - webmin: CVE-2017-15646: https://nvd.nist.gov/vuln/detail/CVE-2017-15646
 - webmin: CVE-2017-17089: https://nvd.nist.gov/vuln/detail/CVE-2017-17089
 - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
 - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
 - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
 - webmin: CVE-2019-15642: https://nvd.nist.gov/vuln/detail/CVE-2019-15642
 - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
 - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
 - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
 - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
 - webmin: CVE-2022-0824: https://nvd.nist.gov/vuln/detail/CVE-2022-0824
 - webmin: CVE-2022-0829: https://nvd.nist.gov/vuln/detail/CVE-2022-0829
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
 - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33456: https://nvd.nist.gov/vuln/detail/CVE-2021-33456
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33464: https://nvd.nist.gov/vuln/detail/CVE-2021-33464
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

Removed this week (18): 

 - audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
 - audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
 - audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
 - audiofile: CVE-2020-18781: https://nvd.nist.gov/vuln/detail/CVE-2020-18781
 - audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
 - hostapd: CVE-2022-37660: https://nvd.nist.gov/vuln/detail/CVE-2022-37660
 - jasper: CVE-2023-51257: https://nvd.nist.gov/vuln/detail/CVE-2023-51257
 - proftpd: CVE-2001-0027: https://nvd.nist.gov/vuln/detail/CVE-2001-0027
 - pure-ftpd: CVE-2024-48208: https://nvd.nist.gov/vuln/detail/CVE-2024-48208
 - redis: CVE-2022-3734: https://nvd.nist.gov/vuln/detail/CVE-2022-3734
 - redis: CVE-2025-21605: https://nvd.nist.gov/vuln/detail/CVE-2025-21605
 - redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
 - redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
 - redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
 - rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
 - rtmpdump: CVE-2015-8270: https://nvd.nist.gov/vuln/detail/CVE-2015-8270
 - rtmpdump: CVE-2015-8271: https://nvd.nist.gov/vuln/detail/CVE-2015-8271
 - rtmpdump: CVE-2015-8272: https://nvd.nist.gov/vuln/detail/CVE-2015-8272

