Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2697BE677F6
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 16:49:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83903.1766422159587979471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 08:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FpXLgBFR;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so41990615e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 08:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766422158; x=1767026958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSJw4M+zl8YFDhj+6tezgw4APfLJzAZiHBAQhqL7dO4=;
        b=FpXLgBFRb7sSotpB0yCeKJJhGERaMgREh77BOVBaQaewTrqAAj0QxB2B3F1pfwxl7V
         U/l0Z6FvdJkslCyBw7iM9CCjbBoy+z1tsj1ePMSfxAmlLwrcI+EaQg4jlr3hqH5JUAWh
         5+IPBGmFMrLXuJ5jWZP3FAp75lvSzcMg0K8TfxmUPnEQ5hpRYDrUW4f6SPMM+tN/6K4T
         Vt/sjOBCzwOw62NkY7HQBPgpAC16jbj7jozmLhz/wXAujZzyDyh4gyw6ZTQ5o0SlCr/9
         bZ/NR2RlSfl+jYmvJzXJ7xM3k6/3PT+mpTtMthndM/NNHCaVGuOzqlwp1ywSac4f5ZiX
         C2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422158; x=1767026958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSJw4M+zl8YFDhj+6tezgw4APfLJzAZiHBAQhqL7dO4=;
        b=BIBFjd595ViLtBIoxSMPx/AbT18d4Sbe+DjpfTeWhxkzI96cFdZxXdudxpKdxYHpdB
         PX6ZPysZGT9ve30dSnhGClqJhV2dPWt4o0z/CUpqfDk5MUzXQtUHdYvKz/dabxrjQghh
         J3WHbm5FhxSBtII0MSo7zQGYd15mRBsSZa54GQavjNsg9mBSojBK7JbDBRxWr9PSrI7Q
         g9jOqtIAwoQzEbbzDVswJ8eiPe28HGw659OCrq3VJ4Cyxt27hsVnaAYg7Ewe5ZRcCYTv
         CEd3Fobfe4HoWhZfTyT2OdCHob2Fs4lfcYW4Th2pECEh9W2ss3eSKIIeNxVLX7vYr9m5
         SSiA==
X-Gm-Message-State: AOJu0YyficTWYe+vWikjIseG8/tQ3MEnfdx/t4/gwAbAlL83nR1TPLFf
	SNRbb0mfk4shQPSCrWmZEOmS/qc7tAZOWfy56FID/MaVhl4XD1TdTqb8zGPr1Q==
X-Gm-Gg: AY/fxX6eJiPkwSQX2gRejkvjus3I4FBn7e9XIiODTrGC8+ZHBr1hTC6VvYFLO3qpVl+
	u7nc4ZJZA2/XXSlH8dWzwYue/gMYefswrMX3ImObQX8FbkWkEVGEUQRaywvrL5fzeCGC9EojdDz
	tPGH9o+yyAyaPbOor8k3ue2irMilkJ90yIj+b9uNiUiCjkly3P2nHMFgSIyTI3TnB+JzlD1nYdW
	5eVhI5zp4r4rpZSY2Et2y7ox1LQRZfdM4qd9MfGWfpyPPekccfHCqJ/H6AQzIdbu3KAM9tLUVC3
	oqA818odfzgHf35K5hBAOzOPjkZRbgNopY62pNb0ygPiOnOhss01N4AT1CqSCZKSd88nwMB+B4J
	QdEE504zeXhgKR7FqNIMFsZFyUcz/SSX0gRFjvfjc5Iq9YRIQdp/qEdF/XUvK80cBDG40gFEm9i
	wZ2zGlp6U9
X-Google-Smtp-Source: AGHT+IHemPBgsXUye3avjhNocwVg7f12BRlHfrE2cszVJdgOV4Q+dI2YpSospoRmOmOhtoRDmcwx0w==
X-Received: by 2002:a05:600c:5246:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47d1957f707mr131978225e9.21.1766422157878;
        Mon, 22 Dec 2025 08:49:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272eaf8sm250378625e9.5.2025.12.22.08.49.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:49:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-12-22
Date: Mon, 22 Dec 2025 17:49:16 +0100
Message-ID: <20251222164916.435849-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 16:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122796

List of all open CVEs (56, out of which new this week: 2):

 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - [NEW] freerdp: CVE-2025-68118: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
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
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2025-12817
 - redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
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
 - tinyproxy: CVE-2025-63938: https://nvd.nist.gov/vuln/detail/CVE-2025-63938
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - [NEW] uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - wolfssl: CVE-2025-11931: https://nvd.nist.gov/vuln/detail/CVE-2025-11931
 - wolfssl: CVE-2025-12889: https://nvd.nist.gov/vuln/detail/CVE-2025-12889

====================

Removed this week (22): 

 - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
 - imagemagick: CVE-2025-65955: https://nvd.nist.gov/vuln/detail/CVE-2025-65955
 - libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
 - libwebsockets: CVE-2025-11677: https://nvd.nist.gov/vuln/detail/CVE-2025-11677
 - libwebsockets: CVE-2025-11678: https://nvd.nist.gov/vuln/detail/CVE-2025-11678
 - libwebsockets: CVE-2025-11680: https://nvd.nist.gov/vuln/detail/CVE-2025-11680
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - minio: CVE-2024-36107: https://nvd.nist.gov/vuln/detail/CVE-2024-36107
 - musl: CVE-2025-26519: https://nvd.nist.gov/vuln/detail/CVE-2025-26519
 - postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395

