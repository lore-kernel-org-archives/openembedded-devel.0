Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389B3C88E6D
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:45:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15184.1769413541461275092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Znry4GUH;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee2715254so20927075e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 23:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769413540; x=1770018340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmI2WrO/gOwZkoviVXVPA+z+tBTJnkmvYa+2oS27oh8=;
        b=Znry4GUHFSxk6fONsj0Xm9lv3YydRrIG0TK3WUsFRjMSk6Jx90jwKpHrXANmnjzGL0
         lDGmc/IdRN6gDy5u+RTkeZPyj+Y5SDmmJMwiSIkYbywzYboE0rfHH7/h73HIcKKpqTML
         0mxiIelHR6GmNRtRG7gjwcCqJB8Zn7kmrf18xLRarA9jUORLQ/RfIj3qCYiMpLxzDUU+
         BEuoK0aO3HWhk1N1Yrbw6l5uNvYPkzHXEAqXbJQ0RS2WAfny0H/6MVp7+ncEin9k3oc9
         2xrTm/l4BYBcd6eQGn64Jn6roNFMIheUlg94C949uoh/OI9h/b8I4sJlhXxzp64cXeKs
         R12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413540; x=1770018340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmI2WrO/gOwZkoviVXVPA+z+tBTJnkmvYa+2oS27oh8=;
        b=pLIYSIzHhpeOiZAYnBwuHE7MLGVbV4xn50CvtG9fisC55XKbgSgev0E1Z9ufOmoRp7
         aRjspx5ptbet3fJe7vQwIMlyzQ0O+NLAKcEBieSFdXh6vyFAJW6txXGAihqG0c1AdnOE
         JWric9YHx8W3Vm1SlUqhlVMu0uT4zpt8ACR7MCgIGAzjJg4CEbGKymALR/8xlcMF6uPw
         dZQ2UqmVx31pcPQub0bsTlVTq/SWaqPEHGQVT0PJiY9SID7Wg0lPH7KPOcUF7f8ZnlG/
         jrNfARBGZv+6U/EPVc6K1aPcqOTfy+r5oPxVPwkfcWoEKuk+TCey4+XpxXe4XUO8Xwl8
         e0sA==
X-Gm-Message-State: AOJu0Yy6B7bWAT0dED11ta6SW8EzZmaucMZt4o3Ip+ob2BYzoWwD/Yyw
	fN1dq7ihFk449J+Vwt9X3HzUM6NhNh7/FVCFNoaeAufcDxUXUlFeiVQBbMmUHA==
X-Gm-Gg: AZuq6aIOPIcyaQvj3LhoBcpM+1DenBVnrtVqy7coEfH/cIJ7IMnDBGLHeVLxTs689iH
	Hpv4YZgtwsLJHYs4At9qo8bL2zrwtDv3QavmJJgMwPcZkwkQ1y2lnLPPSiHKBNRWcavVjatdvtI
	5eIz5mli5ksoDCoGdd0q2Hw/yL0VZC4/bOYgJADcSpAJ34l9gNIR1PWZ750W8w7ZTdpqmQkeueu
	wyyFhy98rqKEyFsshEROGIhYdfLdOG3OQz4l/r8MSuM8ZfgYDrCxkYbj90x8JiOcAWSFEUN/yNy
	FFmIuCh2qeEwFvEfT8vbT02YSb9kjnN59/pZklS+1Cz1+jZbZVW2XupbQMZhqMx0emKOoYJ5ZgY
	7i5onSS6srATArx/t781HWzgbusJoUAzlvTHG/F7b74eu1QFwRc69rmn0Tk/jNj58+KJIN+hvOx
	eEqeGoM63C
X-Received: by 2002:a05:600c:6812:b0:480:3ad0:6509 with SMTP id 5b1f17b1804b1-4805ce4e63cmr58442605e9.12.1769413539727;
        Sun, 25 Jan 2026 23:45:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db8da59sm97527145e9.5.2026.01.25.23.45.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:45:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-01-26
Date: Mon, 26 Jan 2026 08:45:35 +0100
Message-ID: <20260126074537.3480083-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 07:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123861

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (67, out of which new this week: 17):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - [NEW] docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fontforge: CVE-2025-15269: https://nvd.nist.gov/vuln/detail/CVE-2025-15269
 - fontforge: CVE-2025-15270: https://nvd.nist.gov/vuln/detail/CVE-2025-15270
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15275: https://nvd.nist.gov/vuln/detail/CVE-2025-15275
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15279: https://nvd.nist.gov/vuln/detail/CVE-2025-15279
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
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
 - [NEW] freerdp: CVE-2026-23530: https://nvd.nist.gov/vuln/detail/CVE-2026-23530
 - [NEW] freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
 - [NEW] freerdp: CVE-2026-23532: https://nvd.nist.gov/vuln/detail/CVE-2026-23532
 - [NEW] freerdp: CVE-2026-23533: https://nvd.nist.gov/vuln/detail/CVE-2026-23533
 - [NEW] freerdp: CVE-2026-23534: https://nvd.nist.gov/vuln/detail/CVE-2026-23534
 - [NEW] freerdp: CVE-2026-23732: https://nvd.nist.gov/vuln/detail/CVE-2026-23732
 - [NEW] freerdp: CVE-2026-23883: https://nvd.nist.gov/vuln/detail/CVE-2026-23883
 - [NEW] freerdp: CVE-2026-23884: https://nvd.nist.gov/vuln/detail/CVE-2026-23884
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - [NEW] gimp: CVE-2025-15059: https://nvd.nist.gov/vuln/detail/CVE-2025-15059
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - [NEW] imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - [NEW] imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - [NEW] libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - [NEW] libcupsfilters: CVE-2025-64503: https://nvd.nist.gov/vuln/detail/CVE-2025-64503
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
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
 - [NEW] proftpd: CVE-2021-47865: https://nvd.nist.gov/vuln/detail/CVE-2021-47865
 - [NEW] protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-pyjwt: CVE-2025-45768: https://nvd.nist.gov/vuln/detail/CVE-2025-45768
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - [NEW] wireshark: CVE-2026-0962: https://nvd.nist.gov/vuln/detail/CVE-2026-0962
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880

====================

Removed this week (15): 

 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - python3-lief: CVE-2025-15504: https://nvd.nist.gov/vuln/detail/CVE-2025-15504
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-werkzeug: CVE-2026-21860: https://nvd.nist.gov/vuln/detail/CVE-2026-21860
 - raptor2: CVE-2024-57822: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
 - raptor2: CVE-2024-57823: https://nvd.nist.gov/vuln/detail/CVE-2024-57823

