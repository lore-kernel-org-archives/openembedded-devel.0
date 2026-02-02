Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6CAD172D6
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 06:25:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46922.1770013524372894077
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 22:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MpFq37ym;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so3399525f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 22:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770013523; x=1770618323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCPxv6tPUwZVZxdDDszg0/o9jVAh8f6RaybF84ApDtY=;
        b=MpFq37ymIi29Ttn1lYC213mgR84H7DtfVB9c92VV48yU6/BsPEIqXvhwaPQh7OPN67
         tfDE2MpniIVEINyFI3OSTARpSce+HTGUh4uuV9b0KiR8TncaxxcqcPLlO7LD5V7yaYAT
         /D5XkVFmsLQqH7vXEFq/w7yS9VMamXO5suYfyB4BFT1D0X1QxsSDUW+4Fbd0BhJDlEvu
         wzBFnGgIGpxLvXH8ZC+kx5OHYMPu2z6vsU7JDujYsoJXYCXW0GGnMAaQq4mGRIjdmbeG
         0hH6p+Z40X5TM9AId7HJXhLsQ9rWo395DnvpLE3Q7N2ABHsQY0cR2m9/aGBYbvXhIgHb
         S+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013523; x=1770618323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCPxv6tPUwZVZxdDDszg0/o9jVAh8f6RaybF84ApDtY=;
        b=tsoKKuPDB+JL8tKUbKXo4524GtWwMUYbK3RgOiC45YRoy+GGXoOK/tmwKmwNKoyCBF
         pfqiig1/LwljUBqTvYQgcQCZ5jZYDlK/scqix1t6IOIQcTn3sojGLg1kBHUbvVjT+U3M
         QKklEQ9c4BzTplAieOy5B4/46ZgXCJoB8ZcMwc1T2c/u32JHDca8YJLmOHv89BtTjbzt
         V0X2eldCrqBmyZY4APDJUvJh9HQXv+Z1E/cUnokmMF8m5M7nLfLkcAmwPcEk8KGRX9f6
         1TLQ3CaT3xeboRzxIHnz30FTucsD8j+FOrkpbE3DdSLI2V6klLEVMjn1dx+Dq0cjE+2w
         pSQg==
X-Gm-Message-State: AOJu0YxZahp5KvxF3ViPGwKnUBT1t6NhTyeQkOcY5sSykelEh4sPIvHK
	RIhM8MrH63uB94r+5ayhqg3AFlRypR2U9ganhcijVwsdHl0gMbFAY3z6NbfdXA==
X-Gm-Gg: AZuq6aKPSPfUwhRYSkd/AvnWDOrUzkLvKPNgpGDB44dOLinPCsSL7eWg2h520fvH2p4
	+J5KQ0IJ+zAPNl3CcezYm4YKBCsyskr43/dIIjmc1P8KUGtTybYtau1np59Z73k1ECNQzaEbcTi
	uuTtDjC3UgsudXc249Dg6OpqnBcM8kGWV4IdnqXMJzoI6fFGZn3aR/2pI2+lt/ILwFXH3EJQCdo
	accs7fOvF/Zv2I1rqEuRgZKXq/PzL8TUtao/G3oHzrqj6wyGp8RN1Crw7GDstlvQbAV8heNWgvj
	CQHHvapOib/IJYO9zcfw6fIvviM5Og713rqucOzLeWkdszgPUY40QJakfm+e0iCUREEgCzzPdVw
	XMETaJRc2PUOFOFf4KuFNnXNbAbzfvTUmCLEPg4XzgmJ+2q71YE32j6ZxvzUh/iph5UkhyPm89B
	hIl4Bwo31V
X-Received: by 2002:a5d:4e8e:0:b0:436:b45:749c with SMTP id ffacd0b85a97d-4360b4574a2mr949157f8f.6.1770013522202;
        Sun, 01 Feb 2026 22:25:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e476dsm40864614f8f.4.2026.02.01.22.25.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:25:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-02-02
Date: Mon,  2 Feb 2026 07:25:18 +0100
Message-ID: <20260202062520.1325307-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 06:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124045

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (68, out of which new this week: 13):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fontforge: CVE-2025-15270: https://nvd.nist.gov/vuln/detail/CVE-2025-15270
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
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2025-15059: https://nvd.nist.gov/vuln/detail/CVE-2025-15059
 - [NEW] hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - [NEW] hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - [NEW] hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - libcupsfilters: CVE-2025-64503: https://nvd.nist.gov/vuln/detail/CVE-2025-64503
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - [NEW] monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - [NEW] monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - [NEW] monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - [NEW] monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - [NEW] monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - [NEW] monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - [NEW] monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - [NEW] monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - [NEW] monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - proftpd: CVE-2021-47865: https://nvd.nist.gov/vuln/detail/CVE-2021-47865
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
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - [NEW] xrdp: CVE-2025-68670: https://nvd.nist.gov/vuln/detail/CVE-2025-68670

====================

Removed this week (12): 

 - fontforge: CVE-2025-15269: https://nvd.nist.gov/vuln/detail/CVE-2025-15269
 - fontforge: CVE-2025-15275: https://nvd.nist.gov/vuln/detail/CVE-2025-15275
 - fontforge: CVE-2025-15279: https://nvd.nist.gov/vuln/detail/CVE-2025-15279
 - freerdp: CVE-2025-68118: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - wireshark: CVE-2026-0962: https://nvd.nist.gov/vuln/detail/CVE-2026-0962

