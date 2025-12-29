Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC260E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:05:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42073.1767009949452434769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8tmdaOF;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc305914so5975264f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 04:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767009948; x=1767614748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ME8jHy9VJuoZRy1pBN5hbBCBAP4yNx8/2TcL8V400EU=;
        b=N8tmdaOFpx+yA0wQOv0A3QSs9q6UITVEzL2DATSQ7chrdYYuAEZNkYI/D1HJ7AxrTM
         QjN8C9iWNHRzBmLYSU4NbHpJmv1Hhr/JkSx7xQzYskQ+AZFGOVbYAP4hw+qJ5ENTIRsa
         llST4ag0Atcxk8NpALwk+zOFBDpfis8LN2AbtzOyRQ3/6lXnzlYCzDLzsFlwxyoExOod
         7wpNByzdsceYNXGusniVtgVRMqJlLoVSZQ7nVPXagqMF+9bs92jnUTZB6P1W2zkY5qZH
         YbLK6AxrxxYmiaR/K/oxGjlbr1rTIbD83193A2q2EBwduerFrP63mU2l6XMHuPbB4xiU
         aENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767009948; x=1767614748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME8jHy9VJuoZRy1pBN5hbBCBAP4yNx8/2TcL8V400EU=;
        b=MkuKGjYbDpPIo4IF1Gk8uoLKNIlFLj5rUNe8k7RVU7TmQlwdB9Cos++LxfUvlDJ8v/
         9rJX0AAl7TvT/lhbDenFhwvFDMOlJKQyCtFuyZa3hPeV5fuEJWfzYyK4xbqRoeWAr/2M
         oubImUjijYaqO7ZjSQJZGI2gBSbDl9p2MY2ZnTLAbi+w5w8E+KNQXs+wAMLdILd0mMKz
         y5VW+bv/L2ZPGjHaXVzK5BJiqTuIfKe0vlFLcLv2D9a8VioH0ls7V34/pO86N+NbmoNT
         I++ju88OioJYRqtaQNKvqKfBW5DpqwdD7FG59twkAcbFiZUq6WdXiyDkxyALWy6fevfS
         HTXQ==
X-Gm-Message-State: AOJu0YwaoUAkYM8r+qCEnFfgateK9tJ8oCCnZ02F+l6sPR5ATfuxHtdx
	Vyp5BJX9WWstgIZDCYsr/cyfTjP5SdekIo61DzMfDyM8oovaVYXEzaVHKoqe8Q==
X-Gm-Gg: AY/fxX7O6BQLIYucLiF4pfxnO7Jzsf6pEHuM+FymIa1neI647I8hZ5VgQGovPyihf5u
	r8WlMOpOWQ8BUN+gfeQDfCA4v27TDqf5AkbrYUm2B5chLQOXZuVD0i66yBG0Xt+4WqF8e9t1fjc
	Whq+Xe4iUKvr75/cF+Cx9Ae2KVGp1pOVXMaIsQRRPXc2sW8MSENo6KEaN/V/eaNPyv/myRLDvTH
	2d0IBMxt8xWdasoLRpTh2rNgiAyJh1nPt6pr/DCveYCdqmEJlnM9vtpn+KWXKa8WuGRh2IMSOwh
	wj0ZdHMPLr/EA8DjsNAkyGCrddJFw/yTXZ++dMXSy5kW6m0/NqJRdN2YmZA77TKZbqCZc0vApRB
	I8OOxhVDOTF6ayAKuuuN1ZTehDE1ASP3GbpTxeMGpS5qh8JQUwQPrSQ6iiUrgXCL1Fqy+wuOt7d
	48z8SgyZao
X-Google-Smtp-Source: AGHT+IHH7QpOlDbL2cz1VVEvBJmFb3ACIR8KWJvwVynCFeAZA//XKFaG9bjLWZJAz5VmjS9K5akNSw==
X-Received: by 2002:a05:6000:613:b0:430:f704:4da with SMTP id ffacd0b85a97d-4324e70b4bdmr37021170f8f.58.1767009943402;
        Mon, 29 Dec 2025 04:05:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm62494176f8f.24.2025.12.29.04.05.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:05:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-12-29
Date: Mon, 29 Dec 2025 13:05:42 +0100
Message-ID: <20251229120542.602364-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 12:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122978

List of all open CVEs (40, out of which new this week: 4):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
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
 - [NEW] gimp: CVE-2025-14422: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
 - [NEW] gimp: CVE-2025-14423: https://nvd.nist.gov/vuln/detail/CVE-2025-14423
 - [NEW] gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - [NEW] gimp: CVE-2025-14425: https://nvd.nist.gov/vuln/detail/CVE-2025-14425
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
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738

====================

Removed this week (20): 

 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - freerdp: CVE-2025-68118: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2025-12817
 - redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
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
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - wolfssl: CVE-2025-11931: https://nvd.nist.gov/vuln/detail/CVE-2025-11931
 - wolfssl: CVE-2025-12889: https://nvd.nist.gov/vuln/detail/CVE-2025-12889

