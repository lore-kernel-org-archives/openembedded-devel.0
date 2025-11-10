Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C3CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 12:06:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46584.1762776359413189210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 04:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9fZqJih;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47755de027eso19949015e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 04:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762776358; x=1763381158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQBxoaqGk3UIJcWIUenmHqNwmZJZnnIx8xk7M5NOOfg=;
        b=C9fZqJihqZqDsQJ7UxaipkXM0/nOoW2tjoyWrrWGngmc5Cz77WjKbnELYiUtGMLovB
         Z15aH6HkniK+Gu3AKeuhUrzCe31iJzpNuYoa6wMzrrFlNjCWTrWdGmD3mFb6zqyuKLEO
         YG5KX3c+gCa4CmySRuZmrZYUu4Xe1mcAp4T5XhoM340r6tAe3ynpPZVlHEf1a/SnhsgA
         +ma5Z3Fw1CHCIPE6PqEXgwvu5XMdgDMGRqJsGAAlJK2Lk1MLKDW7uAbAR4E+0UdWpyNE
         g6B0CvH7nFjgEvouAeTm9VPfmvdW2rX/Z6D714LrQCPKPUn5/pmBfDBTQ6+yQfLva2Du
         wFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776358; x=1763381158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQBxoaqGk3UIJcWIUenmHqNwmZJZnnIx8xk7M5NOOfg=;
        b=LsEJyBnNu8ebkwy1p3Fjx0exijCyKhE06I902Md39IznJPJerdPk0uhKKql3kx0tgy
         4q2azx47MaJnxUVznVcLNLZVBH30L3zQ+oZl/EatzhWzFrHYR9Je03kK/m4vwp8bxYTD
         vZ+HYmF7iBSn+YzSzM7+YAHlnmrl46ibX7+363wZbhLLbUmaDFs1gDhrZNoJnOjlZTsX
         dGoVuxopZ/zMs/5wVrRBrBss6XNma2L1IOA3yD8rLGg28k3ywtEYicSLDxC7A5d9YYmd
         a01s0R+Uy3V8lQnjONSbd9CAX9fzaYmcd2P97ADali4667wM68DXc9D0u0oHAUozfXkR
         XTFw==
X-Gm-Message-State: AOJu0YwVgXvhj3TBTxkobu4IFQkJhEBY/giGKneVtldlrEvp8GNWlb3O
	cI7V2uorkaQy8K0mclXNkmlTKYv5/3XGQ9l02Eh5Fr6AL/ufaOY+7fisS4IWPyvD
X-Gm-Gg: ASbGncuo2oqCxfoefdrJbLnnld8yKi4+mlPxfq4p128KqgxuRXHeLt79W0EgfXXTsUS
	Gt3SmdfZoQ3+fOzQvARMWhygJhDrD7I3rYL6BcT079+wwvqCSghXvu08o9IAp4BUY9F0lfP0/fv
	DEPB2LFuq7sCKsgV4GCrytz1Yh02nNlV//fyBNkqHBONIQjlZaqa6O3Tj817zjOkVLkKK/psJ8v
	835digZQKY99BMSAJOtwsJzWI18+Bs15ybCzBMmNazbLfLId3Hb0tvY4ZlNECcpyYJyTqn7B49c
	I405DmQvyVLtnPDo02VLiZd8IKEJ+u7JfnnowDWJElJi8e65H+pIRXSuuMNvEAPxELH/Ardz6hC
	7x7LCrzobK+/RIHqkROU1liGALcKl48XlsWLcEO1kd+SzJR7pKRBGaZND4ZFBNRG+DGNNSmsz2P
	sq3j2D9aho
X-Google-Smtp-Source: AGHT+IEWfgZ6ZI065LVtvUOrtgB9f1/2H0/dJZRhqlJKXd/DnR4YTZvdM8C6WgD120X+YgPboRlxCg==
X-Received: by 2002:a05:600c:19c7:b0:477:5b0a:e61a with SMTP id 5b1f17b1804b1-47773224faemr56257705e9.1.1762776357598;
        Mon, 10 Nov 2025 04:05:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm22077836f8f.20.2025.11.10.04.05.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:05:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2025-11-10
Date: Mon, 10 Nov 2025 13:05:56 +0100
Message-ID: <20251110120556.2268929-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 12:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121460

List of all open CVEs (155, out of which new this week: 7):

 - apache2: CVE-2025-3891: https://nvd.nist.gov/vuln/detail/CVE-2025-3891
 - audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
 - audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
 - audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
 - audiofile: CVE-2020-18781: https://nvd.nist.gov/vuln/detail/CVE-2020-18781
 - audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - botan: CVE-2024-50382: https://nvd.nist.gov/vuln/detail/CVE-2024-50382
 - botan: CVE-2024-50383: https://nvd.nist.gov/vuln/detail/CVE-2024-50383
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - freerdp3: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
 - [NEW] frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - [NEW] frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - [NEW] frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - [NEW] frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - [NEW] frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
 - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
 - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
 - hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
 - hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
 - hostapd: CVE-2022-37660: https://nvd.nist.gov/vuln/detail/CVE-2022-37660
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
 - [NEW] imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - iptraf-ng: CVE-2024-52949: https://nvd.nist.gov/vuln/detail/CVE-2024-52949
 - jasper: CVE-2023-51257: https://nvd.nist.gov/vuln/detail/CVE-2023-51257
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
 - proftpd: CVE-2001-0027: https://nvd.nist.gov/vuln/detail/CVE-2001-0027
 - proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
 - pure-ftpd: CVE-2024-48208: https://nvd.nist.gov/vuln/detail/CVE-2024-48208
 - redis: CVE-2022-0543: https://nvd.nist.gov/vuln/detail/CVE-2022-0543
 - redis: CVE-2022-3734: https://nvd.nist.gov/vuln/detail/CVE-2022-3734
 - redis: CVE-2025-21605: https://nvd.nist.gov/vuln/detail/CVE-2025-21605
 - redis: CVE-2025-27151: https://nvd.nist.gov/vuln/detail/CVE-2025-27151
 - redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
 - redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
 - redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
 - rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
 - rtmpdump: CVE-2015-8270: https://nvd.nist.gov/vuln/detail/CVE-2015-8270
 - rtmpdump: CVE-2015-8271: https://nvd.nist.gov/vuln/detail/CVE-2015-8271
 - rtmpdump: CVE-2015-8272: https://nvd.nist.gov/vuln/detail/CVE-2015-8272
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
 - [NEW] webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
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

Removed this week (2): 

 - python3-django: CVE-2025-26699: https://nvd.nist.gov/vuln/detail/CVE-2025-26699
 - python3-django: CVE-2025-27556: https://nvd.nist.gov/vuln/detail/CVE-2025-27556

