Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22305CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 05:50:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43955.1778478619346443834
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2026 22:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ivdh5mEE;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so44677345e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2026 22:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778478618; x=1779083418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeEleRa1fnSoPmOyk5Y5CbIN1C1vuvb7f/V/eWIdqVg=;
        b=ivdh5mEEzX0SseTxu3m3BmBrYarC401xu1Nae4hDW3Q1aUa2VNqNjS60hI9hZeM4hL
         HXpeHsP86GSU6pIX8kfIt+/SzJ4TbkySoYQq/7alBveqz7IR6eGpPgeEer0UgbXXR/fI
         Klh9YwZ4XLu+p6MhlMksbBdsSLjMTf7DxT4BO4WufWh7nHjEqX+2Llr+CPPVwIKah1JP
         xAYnKPLi3JacCWAJYdBT7vdcfZS0XdV6VcOLzFmyr+qTzFPpgoYzPTvQFBJdY8LP8PTZ
         AM/Gii9KDK3D5Ka2mDnSmeO00kH2KXn2dDjW3ehLNBZiv56FsFaCk4aaGRN0C71nwCsW
         xbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778478618; x=1779083418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeEleRa1fnSoPmOyk5Y5CbIN1C1vuvb7f/V/eWIdqVg=;
        b=ftT1CiZyr9HLNHZxWnelc9VhxFealtrJjnSltNT689IdNQEWWwT4kyWc+oCpQz49iU
         OwJDJdAVuolFbQIt0WtEj34RLym4R/tiyEyzwPhp8qZhYG28Q6/cUKZ+EqhQ33/284hS
         qTDXobiyjPfnIsrTXwQ0UEzVBXvQrHydorC7WrkNBN9lygeoyE3TMzwwLoss4PWIM25S
         Gwt8x6JyM0TqWqLpmdYHaaPbc9UPZZsdX4wWdS6fYH6Q0YwAjoPhC78Tb0/FjRCdKiTW
         /WpH5mKzaST8flxTDDmg1B748LaJ1HyM6lmEGB/YJs8gV1mpWKH5FxP2zUnc7RYWO7Bt
         WpHg==
X-Gm-Message-State: AOJu0Yw5mJGcQHdFex7TuRZJRbZm8yQCOOVMpFZx65HwWJIrczfO4V7Z
	H4tMgX9JiA5JfegM8ENNvvPCzfbCproxoAJQLvu1KmxWv5MG6YiMrH1Uk7joTw==
X-Gm-Gg: Acq92OEF+yg0UqIiZ0Xvc5TaBJbjkbodpFEOlZuvBftIP5sMyJ3nWP8X7Z8WChTlRC9
	yz4ZqK5Y5U+uB5wOXEiz0qMXF48wryNWcPMUIa9GpH2MuJ8BBruAIv8NUGzSwvASScsUoRKdRDc
	JhH39fSQVTSGkQ1jXYLaHPDs7OVMVM6XJqBZb4jZfC+mYFJHGspCbYzcf7jJ1z1ECuuVD5+WCdY
	s6kxx5ViycOLELvwIRN0MD/GfRwUs5msQMgTEMBiV2Eaxhw4v11rfuWXCdtZN5onKd/5Qs/XoIv
	jQ5jIv3EtU6+ISNFd1A0LrIIjV/o3E6cusmH9lVxy8DZ1edS4SZELrOh8Gw1Y9iv7jx73Pg8hAb
	K4lpHwwjdYr8dIAyzKO3hgTAfqFMF3mtSVcgVdv0ZR/mx/8vGUuuwjlGK+zQkLe5sOZpXue5gl7
	266uDRh7qfzidqm924KFus
X-Received: by 2002:a05:600c:8286:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-48e706ad01emr133067175e9.2.1778478617485;
        Sun, 10 May 2026 22:50:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6daf039esm78303255e9.3.2026.05.10.22.50.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 22:50:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-05-11
Date: Mon, 11 May 2026 07:50:13 +0200
Message-ID: <20260511055013.1806816-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 05:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126838

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (285, out of which new this week: 43):

 - [NEW] apache2: CVE-2026-23918: https://nvd.nist.gov/vuln/detail/CVE-2026-23918
 - [NEW] apache2: CVE-2026-24072: https://nvd.nist.gov/vuln/detail/CVE-2026-24072
 - [NEW] apache2: CVE-2026-28780: https://nvd.nist.gov/vuln/detail/CVE-2026-28780
 - [NEW] apache2: CVE-2026-29168: https://nvd.nist.gov/vuln/detail/CVE-2026-29168
 - [NEW] apache2: CVE-2026-29169: https://nvd.nist.gov/vuln/detail/CVE-2026-29169
 - [NEW] apache2: CVE-2026-33006: https://nvd.nist.gov/vuln/detail/CVE-2026-33006
 - [NEW] apache2: CVE-2026-33007: https://nvd.nist.gov/vuln/detail/CVE-2026-33007
 - [NEW] apache2: CVE-2026-33523: https://nvd.nist.gov/vuln/detail/CVE-2026-33523
 - [NEW] apache2: CVE-2026-33857: https://nvd.nist.gov/vuln/detail/CVE-2026-33857
 - [NEW] apache2: CVE-2026-34032: https://nvd.nist.gov/vuln/detail/CVE-2026-34032
 - [NEW] apache2: CVE-2026-34059: https://nvd.nist.gov/vuln/detail/CVE-2026-34059
 - bit7z: CVE-2026-27117: https://nvd.nist.gov/vuln/detail/CVE-2026-27117
 - [NEW] cannelloni: CVE-2026-37539: https://nvd.nist.gov/vuln/detail/CVE-2026-37539
 - civetweb: CVE-2026-5789: https://nvd.nist.gov/vuln/detail/CVE-2026-5789
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - [NEW] dovecot: CVE-2025-59028: https://nvd.nist.gov/vuln/detail/CVE-2025-59028
 - [NEW] dovecot: CVE-2025-59032: https://nvd.nist.gov/vuln/detail/CVE-2025-59032
 - dovecot: CVE-2026-24031: https://nvd.nist.gov/vuln/detail/CVE-2026-24031
 - dovecot: CVE-2026-27855: https://nvd.nist.gov/vuln/detail/CVE-2026-27855
 - dovecot: CVE-2026-27856: https://nvd.nist.gov/vuln/detail/CVE-2026-27856
 - [NEW] dovecot: CVE-2026-27857: https://nvd.nist.gov/vuln/detail/CVE-2026-27857
 - [NEW] dovecot: CVE-2026-27858: https://nvd.nist.gov/vuln/detail/CVE-2026-27858
 - [NEW] dovecot: CVE-2026-27859: https://nvd.nist.gov/vuln/detail/CVE-2026-27859
 - dovecot: CVE-2026-27860: https://nvd.nist.gov/vuln/detail/CVE-2026-27860
 - [NEW] emacs: CVE-2026-6861: https://nvd.nist.gov/vuln/detail/CVE-2026-6861
 - [NEW] exiftool: CVE-2026-7580: https://nvd.nist.gov/vuln/detail/CVE-2026-7580
 - [NEW] firewalld: CVE-2026-4948: https://nvd.nist.gov/vuln/detail/CVE-2026-4948
 - flatpak: CVE-2026-34078: https://nvd.nist.gov/vuln/detail/CVE-2026-34078
 - flatpak: CVE-2026-34079: https://nvd.nist.gov/vuln/detail/CVE-2026-34079
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
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
 - freerdp: CVE-2026-29774: https://nvd.nist.gov/vuln/detail/CVE-2026-29774
 - freerdp: CVE-2026-29775: https://nvd.nist.gov/vuln/detail/CVE-2026-29775
 - freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-29776
 - freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-31806
 - freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-31883
 - freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-31884
 - freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-31885
 - freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-31897
 - freerdp: CVE-2026-33952: https://nvd.nist.gov/vuln/detail/CVE-2026-33952
 - freerdp: CVE-2026-33977: https://nvd.nist.gov/vuln/detail/CVE-2026-33977
 - freerdp: CVE-2026-33982: https://nvd.nist.gov/vuln/detail/CVE-2026-33982
 - freerdp: CVE-2026-33983: https://nvd.nist.gov/vuln/detail/CVE-2026-33983
 - freerdp: CVE-2026-33984: https://nvd.nist.gov/vuln/detail/CVE-2026-33984
 - freerdp: CVE-2026-33985: https://nvd.nist.gov/vuln/detail/CVE-2026-33985
 - freerdp: CVE-2026-33986: https://nvd.nist.gov/vuln/detail/CVE-2026-33986
 - freerdp: CVE-2026-33987: https://nvd.nist.gov/vuln/detail/CVE-2026-33987
 - freerdp: CVE-2026-33995: https://nvd.nist.gov/vuln/detail/CVE-2026-33995
 - freerdp: CVE-2026-40254: https://nvd.nist.gov/vuln/detail/CVE-2026-40254
 - [NEW] frr: CVE-2026-28532: https://nvd.nist.gov/vuln/detail/CVE-2026-28532
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - giflib: CVE-2026-26740: https://nvd.nist.gov/vuln/detail/CVE-2026-26740
 - gimp: CVE-2026-40915: https://nvd.nist.gov/vuln/detail/CVE-2026-40915
 - gimp: CVE-2026-40916: https://nvd.nist.gov/vuln/detail/CVE-2026-40916
 - gimp: CVE-2026-40917: https://nvd.nist.gov/vuln/detail/CVE-2026-40917
 - gimp: CVE-2026-40918: https://nvd.nist.gov/vuln/detail/CVE-2026-40918
 - gimp: CVE-2026-40919: https://nvd.nist.gov/vuln/detail/CVE-2026-40919
 - gimp: CVE-2026-4150: https://nvd.nist.gov/vuln/detail/CVE-2026-4150
 - gimp: CVE-2026-4151: https://nvd.nist.gov/vuln/detail/CVE-2026-4151
 - gimp: CVE-2026-4152: https://nvd.nist.gov/vuln/detail/CVE-2026-4152
 - gimp: CVE-2026-4153: https://nvd.nist.gov/vuln/detail/CVE-2026-4153
 - gimp: CVE-2026-4154: https://nvd.nist.gov/vuln/detail/CVE-2026-4154
 - gimp: CVE-2026-4887: https://nvd.nist.gov/vuln/detail/CVE-2026-4887
 - gimp: CVE-2026-6384: https://nvd.nist.gov/vuln/detail/CVE-2026-6384
 - grpc: CVE-2026-33186: https://nvd.nist.gov/vuln/detail/CVE-2026-33186
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - [NEW] lcms: CVE-2026-42798: https://nvd.nist.gov/vuln/detail/CVE-2026-42798
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libde265: CVE-2026-33164: https://nvd.nist.gov/vuln/detail/CVE-2026-33164
 - libde265: CVE-2026-33165: https://nvd.nist.gov/vuln/detail/CVE-2026-33165
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libraw: CVE-2026-20884: https://nvd.nist.gov/vuln/detail/CVE-2026-20884
 - libraw: CVE-2026-20889: https://nvd.nist.gov/vuln/detail/CVE-2026-20889
 - libraw: CVE-2026-24450: https://nvd.nist.gov/vuln/detail/CVE-2026-24450
 - libraw: CVE-2026-24660: https://nvd.nist.gov/vuln/detail/CVE-2026-24660
 - libraw: CVE-2026-5318: https://nvd.nist.gov/vuln/detail/CVE-2026-5318
 - libraw: CVE-2026-5342: https://nvd.nist.gov/vuln/detail/CVE-2026-5342
 - libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-1536
 - libsoup-2.4: CVE-2026-2436: https://nvd.nist.gov/vuln/detail/CVE-2026-2436
 - [NEW] libsoup-2.4: CVE-2026-2708: https://nvd.nist.gov/vuln/detail/CVE-2026-2708
 - libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-3099
 - libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-3632
 - libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-3633
 - libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-3634
 - libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-4271
 - libsoup-2.4: CVE-2026-5119: https://nvd.nist.gov/vuln/detail/CVE-2026-5119
 - [NEW] libssh2-native: CVE-2026-7598: https://nvd.nist.gov/vuln/detail/CVE-2026-7598
 - libssh: CVE-2025-14821: https://nvd.nist.gov/vuln/detail/CVE-2025-14821
 - [NEW] libssh: CVE-2026-0964: https://nvd.nist.gov/vuln/detail/CVE-2026-0964
 - [NEW] libssh: CVE-2026-0966: https://nvd.nist.gov/vuln/detail/CVE-2026-0966
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mbedtls: CVE-2025-66442: https://nvd.nist.gov/vuln/detail/CVE-2025-66442
 - mbedtls: CVE-2026-25833: https://nvd.nist.gov/vuln/detail/CVE-2026-25833
 - mbedtls: CVE-2026-25834: https://nvd.nist.gov/vuln/detail/CVE-2026-25834
 - mbedtls: CVE-2026-25835: https://nvd.nist.gov/vuln/detail/CVE-2026-25835
 - mbedtls: CVE-2026-34871: https://nvd.nist.gov/vuln/detail/CVE-2026-34871
 - mbedtls: CVE-2026-34872: https://nvd.nist.gov/vuln/detail/CVE-2026-34872
 - mbedtls: CVE-2026-34873: https://nvd.nist.gov/vuln/detail/CVE-2026-34873
 - mbedtls: CVE-2026-34874: https://nvd.nist.gov/vuln/detail/CVE-2026-34874
 - mbedtls: CVE-2026-34875: https://nvd.nist.gov/vuln/detail/CVE-2026-34875
 - mbedtls: CVE-2026-34876: https://nvd.nist.gov/vuln/detail/CVE-2026-34876
 - mbedtls: CVE-2026-34877: https://nvd.nist.gov/vuln/detail/CVE-2026-34877
 - minio: CVE-2026-33419: https://nvd.nist.gov/vuln/detail/CVE-2026-33419
 - minio: CVE-2026-34204: https://nvd.nist.gov/vuln/detail/CVE-2026-34204
 - miniupnpd: CVE-2026-5720: https://nvd.nist.gov/vuln/detail/CVE-2026-5720
 - ntfs-3g-ntfsprogs: CVE-2026-40706: https://nvd.nist.gov/vuln/detail/CVE-2026-40706
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - opensc: CVE-2025-66215: https://nvd.nist.gov/vuln/detail/CVE-2025-66215
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - polkit: CVE-2026-4897: https://nvd.nist.gov/vuln/detail/CVE-2026-4897
 - [NEW] postfix: CVE-2026-43964: https://nvd.nist.gov/vuln/detail/CVE-2026-43964
 - proftpd: CVE-2026-42167: https://nvd.nist.gov/vuln/detail/CVE-2026-42167
 - [NEW] proftpd: CVE-2026-44331: https://nvd.nist.gov/vuln/detail/CVE-2026-44331
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2026-22815: https://nvd.nist.gov/vuln/detail/CVE-2026-22815
 - python3-aiohttp: CVE-2026-34513: https://nvd.nist.gov/vuln/detail/CVE-2026-34513
 - python3-aiohttp: CVE-2026-34514: https://nvd.nist.gov/vuln/detail/CVE-2026-34514
 - python3-aiohttp: CVE-2026-34515: https://nvd.nist.gov/vuln/detail/CVE-2026-34515
 - python3-aiohttp: CVE-2026-34516: https://nvd.nist.gov/vuln/detail/CVE-2026-34516
 - python3-aiohttp: CVE-2026-34517: https://nvd.nist.gov/vuln/detail/CVE-2026-34517
 - python3-aiohttp: CVE-2026-34518: https://nvd.nist.gov/vuln/detail/CVE-2026-34518
 - python3-aiohttp: CVE-2026-34519: https://nvd.nist.gov/vuln/detail/CVE-2026-34519
 - python3-aiohttp: CVE-2026-34520: https://nvd.nist.gov/vuln/detail/CVE-2026-34520
 - python3-aiohttp: CVE-2026-34525: https://nvd.nist.gov/vuln/detail/CVE-2026-34525
 - python3-binwalk: CVE-2026-7179: https://nvd.nist.gov/vuln/detail/CVE-2026-7179
 - python3-black: CVE-2026-31900: https://nvd.nist.gov/vuln/detail/CVE-2026-31900
 - python3-black: CVE-2026-32274: https://nvd.nist.gov/vuln/detail/CVE-2026-32274
 - python3-cbor2: CVE-2026-26209: https://nvd.nist.gov/vuln/detail/CVE-2026-26209
 - [NEW] python3-django: CVE-2026-35192: https://nvd.nist.gov/vuln/detail/CVE-2026-35192
 - [NEW] python3-django: CVE-2026-5766: https://nvd.nist.gov/vuln/detail/CVE-2026-5766
 - [NEW] python3-django: CVE-2026-6907: https://nvd.nist.gov/vuln/detail/CVE-2026-6907
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-nltk: CVE-2026-0846: https://nvd.nist.gov/vuln/detail/CVE-2026-0846
 - python3-nltk: CVE-2026-33230: https://nvd.nist.gov/vuln/detail/CVE-2026-33230
 - python3-nltk: CVE-2026-33231: https://nvd.nist.gov/vuln/detail/CVE-2026-33231
 - python3-nltk: CVE-2026-33236: https://nvd.nist.gov/vuln/detail/CVE-2026-33236
 - python3-orjson: CVE-2025-67221: https://nvd.nist.gov/vuln/detail/CVE-2025-67221
 - python3-pillow: CVE-2026-40192: https://nvd.nist.gov/vuln/detail/CVE-2026-40192
 - [NEW] python3-pillow: CVE-2026-42309: https://nvd.nist.gov/vuln/detail/CVE-2026-42309
 - [NEW] python3-pillow: CVE-2026-42310: https://nvd.nist.gov/vuln/detail/CVE-2026-42310
 - [NEW] python3-pillow: CVE-2026-42311: https://nvd.nist.gov/vuln/detail/CVE-2026-42311
 - python3-python-multipart: CVE-2026-40347: https://nvd.nist.gov/vuln/detail/CVE-2026-40347
 - [NEW] redis: CVE-2026-23479: https://nvd.nist.gov/vuln/detail/CVE-2026-23479
 - [NEW] redis: CVE-2026-23631: https://nvd.nist.gov/vuln/detail/CVE-2026-23631
 - [NEW] redis: CVE-2026-25243: https://nvd.nist.gov/vuln/detail/CVE-2026-25243
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - squid: CVE-2026-32748: https://nvd.nist.gov/vuln/detail/CVE-2026-32748
 - squid: CVE-2026-33515: https://nvd.nist.gov/vuln/detail/CVE-2026-33515
 - squid: CVE-2026-33526: https://nvd.nist.gov/vuln/detail/CVE-2026-33526
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - thrift: CVE-2025-48431: https://nvd.nist.gov/vuln/detail/CVE-2025-48431
 - thrift: CVE-2026-41602: https://nvd.nist.gov/vuln/detail/CVE-2026-41602
 - thrift: CVE-2026-41603: https://nvd.nist.gov/vuln/detail/CVE-2026-41603
 - thrift: CVE-2026-41604: https://nvd.nist.gov/vuln/detail/CVE-2026-41604
 - thrift: CVE-2026-41605: https://nvd.nist.gov/vuln/detail/CVE-2026-41605
 - thrift: CVE-2026-41606: https://nvd.nist.gov/vuln/detail/CVE-2026-41606
 - thrift: CVE-2026-41607: https://nvd.nist.gov/vuln/detail/CVE-2026-41607
 - thrift: CVE-2026-41636: https://nvd.nist.gov/vuln/detail/CVE-2026-41636
 - [NEW] thrift: CVE-2026-43868: https://nvd.nist.gov/vuln/detail/CVE-2026-43868
 - [NEW] thrift: CVE-2026-43869: https://nvd.nist.gov/vuln/detail/CVE-2026-43869
 - [NEW] thrift: CVE-2026-43870: https://nvd.nist.gov/vuln/detail/CVE-2026-43870
 - tinyproxy: CVE-2026-31842: https://nvd.nist.gov/vuln/detail/CVE-2026-31842
 - tinyproxy: CVE-2026-3945: https://nvd.nist.gov/vuln/detail/CVE-2026-3945
 - unbound: CVE-2025-11411: https://nvd.nist.gov/vuln/detail/CVE-2025-11411
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - uriparser: CVE-2026-42371: https://nvd.nist.gov/vuln/detail/CVE-2026-42371
 - [NEW] uriparser: CVE-2026-44928: https://nvd.nist.gov/vuln/detail/CVE-2026-44928
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - wolfssl: CVE-2026-2645: https://nvd.nist.gov/vuln/detail/CVE-2026-2645
 - wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - wolfssl: CVE-2026-3549: https://nvd.nist.gov/vuln/detail/CVE-2026-3549
 - wolfssl: CVE-2026-3849: https://nvd.nist.gov/vuln/detail/CVE-2026-3849
 - wolfssl: CVE-2026-5187: https://nvd.nist.gov/vuln/detail/CVE-2026-5187
 - wolfssl: CVE-2026-5194: https://nvd.nist.gov/vuln/detail/CVE-2026-5194
 - wolfssl: CVE-2026-5263: https://nvd.nist.gov/vuln/detail/CVE-2026-5263
 - wolfssl: CVE-2026-5264: https://nvd.nist.gov/vuln/detail/CVE-2026-5264
 - wolfssl: CVE-2026-5295: https://nvd.nist.gov/vuln/detail/CVE-2026-5295
 - wolfssl: CVE-2026-5393: https://nvd.nist.gov/vuln/detail/CVE-2026-5393
 - wolfssl: CVE-2026-5448: https://nvd.nist.gov/vuln/detail/CVE-2026-5448
 - wolfssl: CVE-2026-5460: https://nvd.nist.gov/vuln/detail/CVE-2026-5460
 - wolfssl: CVE-2026-5466: https://nvd.nist.gov/vuln/detail/CVE-2026-5466
 - wolfssl: CVE-2026-5477: https://nvd.nist.gov/vuln/detail/CVE-2026-5477
 - wolfssl: CVE-2026-5479: https://nvd.nist.gov/vuln/detail/CVE-2026-5479
 - wolfssl: CVE-2026-5500: https://nvd.nist.gov/vuln/detail/CVE-2026-5500
 - wolfssl: CVE-2026-5501: https://nvd.nist.gov/vuln/detail/CVE-2026-5501
 - wolfssl: CVE-2026-5503: https://nvd.nist.gov/vuln/detail/CVE-2026-5503
 - wolfssl: CVE-2026-5504: https://nvd.nist.gov/vuln/detail/CVE-2026-5504
 - wolfssl: CVE-2026-5507: https://nvd.nist.gov/vuln/detail/CVE-2026-5507
 - xdg-desktop-portal: CVE-2026-40354: https://nvd.nist.gov/vuln/detail/CVE-2026-40354
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - xrdp: CVE-2026-32105: https://nvd.nist.gov/vuln/detail/CVE-2026-32105
 - xrdp: CVE-2026-32107: https://nvd.nist.gov/vuln/detail/CVE-2026-32107
 - xrdp: CVE-2026-32623: https://nvd.nist.gov/vuln/detail/CVE-2026-32623
 - xrdp: CVE-2026-32624: https://nvd.nist.gov/vuln/detail/CVE-2026-32624
 - xrdp: CVE-2026-33145: https://nvd.nist.gov/vuln/detail/CVE-2026-33145
 - xrdp: CVE-2026-33516: https://nvd.nist.gov/vuln/detail/CVE-2026-33516
 - xrdp: CVE-2026-33689: https://nvd.nist.gov/vuln/detail/CVE-2026-33689
 - xrdp: CVE-2026-35512: https://nvd.nist.gov/vuln/detail/CVE-2026-35512
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
 - zabbix: CVE-2026-23920: https://nvd.nist.gov/vuln/detail/CVE-2026-23920
 - zabbix: CVE-2026-23921: https://nvd.nist.gov/vuln/detail/CVE-2026-23921
 - zabbix: CVE-2026-23923: https://nvd.nist.gov/vuln/detail/CVE-2026-23923
 - [NEW] zabbix: CVE-2026-23926: https://nvd.nist.gov/vuln/detail/CVE-2026-23926
 - [NEW] zabbix: CVE-2026-23927: https://nvd.nist.gov/vuln/detail/CVE-2026-23927

====================

Removed this week (27): 

 - freeipmi: CVE-2026-33554: https://nvd.nist.gov/vuln/detail/CVE-2026-33554
 - lcms: CVE-2026-41254: https://nvd.nist.gov/vuln/detail/CVE-2026-41254
 - libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-29013
 - libsoup-2.4: CVE-2026-1467: https://nvd.nist.gov/vuln/detail/CVE-2026-1467
 - libsoup-2.4: CVE-2026-1539: https://nvd.nist.gov/vuln/detail/CVE-2026-1539
 - libsoup-2.4: CVE-2026-1801: https://nvd.nist.gov/vuln/detail/CVE-2026-1801
 - libsoup-2.4: CVE-2026-2369: https://nvd.nist.gov/vuln/detail/CVE-2026-2369
 - libsoup-2.4: CVE-2026-2443: https://nvd.nist.gov/vuln/detail/CVE-2026-2443
 - nodejs: CVE-2026-21710: https://nvd.nist.gov/vuln/detail/CVE-2026-21710
 - protobuf: CVE-2026-6409: https://nvd.nist.gov/vuln/detail/CVE-2026-6409
 - python3-django: CVE-2026-25673: https://nvd.nist.gov/vuln/detail/CVE-2026-25673
 - python3-django: CVE-2026-25674: https://nvd.nist.gov/vuln/detail/CVE-2026-25674
 - python3-django: CVE-2026-33033: https://nvd.nist.gov/vuln/detail/CVE-2026-33033
 - python3-django: CVE-2026-33034: https://nvd.nist.gov/vuln/detail/CVE-2026-33034
 - python3-django: CVE-2026-3902: https://nvd.nist.gov/vuln/detail/CVE-2026-3902
 - python3-django: CVE-2026-4277: https://nvd.nist.gov/vuln/detail/CVE-2026-4277
 - python3-django: CVE-2026-4292: https://nvd.nist.gov/vuln/detail/CVE-2026-4292
 - python3-ecdsa: CVE-2026-33936: https://nvd.nist.gov/vuln/detail/CVE-2026-33936
 - wolfssl: CVE-2026-1005: https://nvd.nist.gov/vuln/detail/CVE-2026-1005
 - wolfssl: CVE-2026-3580: https://nvd.nist.gov/vuln/detail/CVE-2026-3580
 - wolfssl: CVE-2026-5188: https://nvd.nist.gov/vuln/detail/CVE-2026-5188
 - wolfssl: CVE-2026-5392: https://nvd.nist.gov/vuln/detail/CVE-2026-5392
 - wolfssl: CVE-2026-5446: https://nvd.nist.gov/vuln/detail/CVE-2026-5446
 - wolfssl: CVE-2026-5447: https://nvd.nist.gov/vuln/detail/CVE-2026-5447
 - wolfssl: CVE-2026-5772: https://nvd.nist.gov/vuln/detail/CVE-2026-5772
 - wolfssl: CVE-2026-5778: https://nvd.nist.gov/vuln/detail/CVE-2026-5778
 - xdg-dbus-proxy: CVE-2026-34080: https://nvd.nist.gov/vuln/detail/CVE-2026-34080

