Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B72D3B7F8
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:28:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.972.1765211298687089594
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 08:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fahrkxm3;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2b90ad22so1744434f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 08:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765211297; x=1765816097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8YRlpP+5w4uSlymt8zCHc9ouNe312PmlZOLcJdxHJ0=;
        b=fahrkxm32ULeAr+nAGBGt3dAHXT2QwaJQyG0PZoKDzAdUOlwCbc42Qt+nhrwYjdm+S
         gaG3aLdnL7u/TFx6uj4DhayMr72kvQ//9T3nTbXpQQIuMplJRm1EKgsi+iCFmuhZj3XF
         dfWdIbqgnM2xY72zHBr2RgmdgvUHZBJaxTpqnRyMl/fRE/RIwvCyF9ayOTBf9xrBJH8q
         mhOKgwdZNYBb2S3b08gB+alnol+pG8jR6r5AhGkhXAo45Q0NHfmnpr2PKz9S+XYW1MKY
         R/9Ck09eRH5zO1014DvzbO22xDHCnY3LcjNZgwAy5+cysIgq0TuQtZMslt8i9r6sgQJL
         Irew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211297; x=1765816097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8YRlpP+5w4uSlymt8zCHc9ouNe312PmlZOLcJdxHJ0=;
        b=r6pU9XR6BJs5DI7qsMcIJnJk9c4U1Kuupjiu/WuKAWMiU4aOYt1dEl+jx0uFsxOYwZ
         jEY6NiKlj+tNtzqX2i5ANzC28XZTzB4nVGJlTCOvg3vJTW49zSPM19AmJ1cBPkWaNMlm
         WBtfGw/44/KivNM73a30+QL7Iczmqv8v0W7lFdaGJoGkSLklWd64BkPP73MlcoW1drN3
         etM3kOA3Y269xQ02SGIwIUvolKUNSag0xdxsJOWDfhSDnMuRZSpn/JHpANeeSL+GGV3A
         weLc6M7v5h2RxBjsPvTSiTI60G1IiyEE8IWIQvvhDliEIaZLqA4caA1o4WiSjbwrbtbn
         pdgg==
X-Gm-Message-State: AOJu0YwwgMy6g0v0FJFDWPX9TJM7O+YJUhoCuriXzMr4Q1GMJcAJ+KqQ
	2+YHkYj8DdRoKntVtQHEXK92GsoCz6Ba6TJYzbRbSzmrbhE1Bpya1zSrtSF16g==
X-Gm-Gg: ASbGnctdDbmtSN4xjTgvFaxelXSvQ4q6zUMHwzHOn4aP8pAtibb6JOzylEo+RvJXgr4
	sauUPMHWBdmxb/nIaMYfsKEMQbrgtREtCz8SqB++PUttlaHgFHADxX8GNVYhea4nfZS5mVb7kqK
	xN2faGBthAfY5YpZz+uvfzw+Ict9lit2qLWGxg/lY1c9CIf6vwx1uu/bbvqLsOe88VgGM3qGVRs
	npj6QpRmLCBvstcT05H9XV6EDRNK2+psMFyyXIziDKRRn97sh+LNss0rE8TH6UxOBiZqp1qeely
	yeiEccVBzDUeoTJzJGm9MiW5OBVqawm2ZBu+XpzUmFr9G0Ppn0g3Oyjo+jy3ALN3RTppJWEDdvN
	dmFQ8X8Y6QWJMuGuRdfxz+0jD21P/o+5JSIxFT2Zz/Jbbt1orQvQGSRC9xP3odT5dzkg579V5/8
	fI2ztx4DlJ
X-Google-Smtp-Source: AGHT+IEyILejCp2X2ig4mywzrkaQx6xWUAK5t33XKiDEHo6QZu6rMBsHTVsG+2wtz7vIbCWTLFdjQg==
X-Received: by 2002:a05:6000:25c6:b0:42b:30f9:79b6 with SMTP id ffacd0b85a97d-42f89f65bd8mr9370982f8f.58.1765211296926;
        Mon, 08 Dec 2025 08:28:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222506sm28213231f8f.28.2025.12.08.08.28.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 08:28:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-12-08
Date: Mon,  8 Dec 2025 17:28:15 +0100
Message-ID: <20251208162815.3599592-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 16:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122381

List of all open CVEs (73, out of which new this week: 34):

 - [NEW] accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
 - [NEW] cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - [NEW] civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - [NEW] cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE-2025-64524
 - [NEW] dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - [NEW] fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - [NEW] fex: CVE-2012-0869: https://nvd.nist.gov/vuln/detail/CVE-2012-0869
 - [NEW] fex: CVE-2012-1293: https://nvd.nist.gov/vuln/detail/CVE-2012-1293
 - [NEW] fex: CVE-2014-3875: https://nvd.nist.gov/vuln/detail/CVE-2014-3875
 - [NEW] fex: CVE-2014-3876: https://nvd.nist.gov/vuln/detail/CVE-2014-3876
 - [NEW] fex: CVE-2014-3877: https://nvd.nist.gov/vuln/detail/CVE-2014-3877
 - [NEW] fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
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
 - [NEW] gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - [NEW] libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
 - [NEW] libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - [NEW] libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - [NEW] libwebsockets: CVE-2025-11677: https://nvd.nist.gov/vuln/detail/CVE-2025-11677
 - [NEW] libwebsockets: CVE-2025-11678: https://nvd.nist.gov/vuln/detail/CVE-2025-11678
 - [NEW] live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - [NEW] minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - [NEW] openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - [NEW] polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - [NEW] python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - [NEW] python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - [NEW] samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - [NEW] samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
 - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
 - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
 - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
 - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
 - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
 - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
 - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
 - [NEW] tinyproxy: CVE-2025-63938: https://nvd.nist.gov/vuln/detail/CVE-2025-63938
 - [NEW] unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - [NEW] webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - [NEW] webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - [NEW] webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - [NEW] wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - [NEW] wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395

====================

Removed this week (17): 

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

