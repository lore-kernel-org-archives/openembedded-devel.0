Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1502FF4943
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 05:28:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44234.1774848482764215392
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 22:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a8thwz1b;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fb112c09so39404415e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 22:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774848481; x=1775453281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0025jBeo52/fZbVDeeRHnGg4BNljUelnS7yRgheHQM=;
        b=a8thwz1bzLA89niIrT4pwwpnFUIuX983oWrRyUqQKfWeMhKPNDBtJ6vDPi//fJMgZf
         8Ybmowg6eCFYJDLHRhpP4FaVGfj3O02DyMgDTH1mC7oGkmSkqYYZkdILubrrcuYOSbiE
         +WRv5k1DqzPk0V8OcYvUS7oY2WP2+YTfotqE+CQ5cuqawNsybF4MwkBovEQJTghCMa5k
         KFiio/glZW6muj01DdlaNZCYvcYgdgpDauKaogXBIXkYDpMSundrKpmJNGcyvcPQI1Nn
         o4RFZvmxmYB1tRC2GPcguUWDD+ciY46A7X8B36eArjHJEx5Nusra+5iT4Jc0w2EKUBuh
         8cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848481; x=1775453281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0025jBeo52/fZbVDeeRHnGg4BNljUelnS7yRgheHQM=;
        b=aHrPZD/xQp98EjGWOZ7iba2R4IFfk0fu6yqCK3jAOuuvu8VEwfzZICq/6E5yLDrFsu
         JzBq+1mUoPiWt27fGKa3SAMDnWl387oybwJ9QGHFoHKqSWfHvwuzOwHz+7JFEY2q63DK
         PCsPVCM0jjAPV6niIKktB58p1pTUDy3iTzgSsvsiD6iasx7p/NDlHmNQSMC9yGo3Oita
         pl+ct7c3jtuAdodiAoFnDIXT6wtXsA1FZJ5QpX1pi34CT0uNz90tu0bV4Rjm6QtxxtJo
         UkoUrFYcpZVEgt7Q/MZr0VQBmtGNQLe50q8SHyCh4Tq6mzJNcitKwqycg1/fBTwB/ED/
         8Ygw==
X-Gm-Message-State: AOJu0YyZNhs7MLBe5TbTF3kC2kZyqcA1ssqO6NDV4v33krR7hfWLa7io
	Dcsl0KKcnnxx6y6kTyOmQVaEUy1N7lcFaRzwIRMlcVpkHpT9PTvHF6KckqVUtw==
X-Gm-Gg: ATEYQzwNjkpJorKFeBUZsWQtf2LAWBsQQkjCA5RuHLlkjzAaH0ivFHFwPCwP8pIm3Yk
	HE1xdsET9mFJpIXSpdNPrB3BYr1j/a7xFslfSqoGliyEw+nnCkYnIkJz1ofqIXDfyy0LZ/w5XGT
	CIhBC6RShFovq2QCEjNGf0ajlhdaZR4EqwB2pn2EQXQ11BJ//6qnwyIkKbXc/rsU1NmddFrwV50
	Dc7KQunXbp0h8h2ZVI+eNd9hJtbRxG2R8e2s1SVI1k/eUUvMz9VtqSm7b8ATqLO4gZC6zB8OSoq
	XiwH4ZJGl7Qdoypne9SBtbA9dwRsohjNYlnVH1VflzVpoqmegMosDZiT5U5Kmq8eQQMG4wo5B1A
	VL34FgEXtuNxExRJ0tNm5G9GQi6FSGhLTSXWG4GgCOdOwaPZdOMhoBWw8bwxwv3LQTJnsx40uor
	MPjixw/uRkti/4a9Fh/u8p
X-Received: by 2002:a05:600c:8b77:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-48727f17035mr174613025e9.15.1774848480715;
        Sun, 29 Mar 2026 22:28:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm475907265e9.9.2026.03.29.22.28.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 22:28:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-03-30
Date: Mon, 30 Mar 2026 07:27:56 +0200
Message-ID: <20260330052758.2775911-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 05:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125826

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (117, out of which new this week: 29):

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
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
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
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-nltk: CVE-2026-33230: https://nvd.nist.gov/vuln/detail/CVE-2026-33230
 - [NEW] python3-nltk: CVE-2026-33231: https://nvd.nist.gov/vuln/detail/CVE-2026-33231
 - python3-nltk: CVE-2026-33236: https://nvd.nist.gov/vuln/detail/CVE-2026-33236
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - [NEW] strongswan: CVE-2026-25075: https://nvd.nist.gov/vuln/detail/CVE-2026-25075
 - [NEW] tigervnc: CVE-2026-34352: https://nvd.nist.gov/vuln/detail/CVE-2026-34352
 - wolfssl: CVE-2026-0819: https://nvd.nist.gov/vuln/detail/CVE-2026-0819
 - wolfssl: CVE-2026-2646: https://nvd.nist.gov/vuln/detail/CVE-2026-2646
 - wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - [NEW] zabbix: CVE-2026-23919: https://nvd.nist.gov/vuln/detail/CVE-2026-23919
 - [NEW] zabbix: CVE-2026-23920: https://nvd.nist.gov/vuln/detail/CVE-2026-23920
 - [NEW] zabbix: CVE-2026-23921: https://nvd.nist.gov/vuln/detail/CVE-2026-23921
 - [NEW] zabbix: CVE-2026-23923: https://nvd.nist.gov/vuln/detail/CVE-2026-23923

====================

Removed this week (9): 

 - freerdp: CVE-2026-25941: https://nvd.nist.gov/vuln/detail/CVE-2026-25941
 - python3-black: CVE-2026-32274: https://nvd.nist.gov/vuln/detail/CVE-2026-32274
 - wolfssl: CVE-2026-3229: https://nvd.nist.gov/vuln/detail/CVE-2026-3229
 - wolfssl: CVE-2026-3230: https://nvd.nist.gov/vuln/detail/CVE-2026-3230
 - wolfssl: CVE-2026-3547: https://nvd.nist.gov/vuln/detail/CVE-2026-3547
 - wolfssl: CVE-2026-3549: https://nvd.nist.gov/vuln/detail/CVE-2026-3549
 - wolfssl: CVE-2026-3580: https://nvd.nist.gov/vuln/detail/CVE-2026-3580
 - wolfssl: CVE-2026-3849: https://nvd.nist.gov/vuln/detail/CVE-2026-3849
 - wolfssl: CVE-2026-4159: https://nvd.nist.gov/vuln/detail/CVE-2026-4159

