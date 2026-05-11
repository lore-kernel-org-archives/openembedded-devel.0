Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235C0CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 05:50:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43954.1778478618725151208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2026 22:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gZsPwsWD;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so4941195e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2026 22:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778478617; x=1779083417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=svVmCWHhELwH/tS3sNePtzTUZB971+r9Cyj0qBwts7w=;
        b=gZsPwsWDUPBhdETzzdlmzhH2lALfDeVO8AHD84tWzbQqcIXRcDtm9xc0mFS6qQVefD
         XF74eFvuSh3Q35F57ix4O/XtOfFxB8b4nUi0+xt9y+M552XvVzCkmulMjuNeOWicv/IB
         NOvBDUQZvveUdsULs3j9LQd8d3DuFzZ4H+5HuO53GV6IqjXtpHAgJzTCXnuKRzz9f6GY
         Cnct9v77BxV2jXIXVGlxbsPr35F1ydiwN5C0C3SX/i+6nXqVACtLAzYD0HhHW32svtcc
         0mdrDN5H/QSfpkzeSqce27M8lu8xrUl5EwrimgNvwgzKYS5p8aYtR8HFVEF+gjZ0PBcb
         gg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778478617; x=1779083417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svVmCWHhELwH/tS3sNePtzTUZB971+r9Cyj0qBwts7w=;
        b=YJHc8wy+Zn26yRJiC1cTNLO9ULEUuxoPbj+7qP+RjfwvVrsjGRTzuvbTp6+amUZm64
         jyg+tfxnmFDx2fUjo8euiNA8TIZoVgw49KQT30tUkCb8GTaVstOjqi8CpjPwmZ2xCuzH
         VsQocTYIBkEAbWaC73b9PgFVL910Qf3I074bOr7jxJuNl8tjaUbsQhoZ0pP6LXRmr3KE
         T3jXVxV8ZSdE9puewkGMRUKk8+fnYLw2iECioA1y3ZDQBKcvlGzlnxo5909tATxBG6ea
         7nT1gqoKM9oCNwHWpP6xSIMgC95VU/WJ29AiLmw/AEoEjyBQMXHP3JyzDHIo13x7MTcR
         haDw==
X-Gm-Message-State: AOJu0YxsfP99RLQ/1y4QEYB7W2aAaz2ujYBVnDYkZGpT1yJ5u+joJ5sP
	1E1edJyYwjVmtVYBi6/LfngqDx2td27Hi16ODv0YTEj9PvFyEDUHNpCD+dKOVg==
X-Gm-Gg: Acq92OHCAX4c4vfNDL9jbJntHJxwRXVw+mtjy7pzAGlIXSNhGouvIyJfOR58rg8mVpE
	zoGnTpxbC64w1Jvh2ER6K1g6LmBKoWuprPG61GtCuICIyaw14KPjF3CH/navVnOI1C8TZQ7aHiG
	AYFm6nAr+xtl1RgIbO/rd/TMbm3854UftZzIrH/9mreBjykla8ZFxNEDJI3dnNaxaX1OXGmC+Vd
	QNf3/4md4qNI2+hwosl4eb903xSkpHtyK3N5upA99Hz8zRBKXl1mVCdaDA0IgnT2mZk8PcurTuG
	ud8BmO3QvIBeHDkOoLkFPC4RRLt7EFnLdMmEeHGgbmuyrPug7r21UNIowiukd8+dBy36vrJNHBW
	D6PbNL+KG/ebhjpsU/Lj1XmtUETnezquTleGBxFhhz//vKjQYnkCl6nPl6kYTWhDPsFxguNKe5U
	EtfYBQXQKeyfUmC4qx9QdcKPPqTmRHKdE=
X-Received: by 2002:a05:600c:8012:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-48e5fb8fac9mr270901815e9.24.1778478616818;
        Sun, 10 May 2026 22:50:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6daf039esm78303255e9.3.2026.05.10.22.50.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 22:50:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2026-05-11
Date: Mon, 11 May 2026 07:50:12 +0200
Message-ID: <20260511055013.1806816-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 05:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126837

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (391, out of which new this week: 36):

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
 - botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - botan: CVE-2026-32877: https://nvd.nist.gov/vuln/detail/CVE-2026-32877
 - botan: CVE-2026-32883: https://nvd.nist.gov/vuln/detail/CVE-2026-32883
 - botan: CVE-2026-32884: https://nvd.nist.gov/vuln/detail/CVE-2026-32884
 - botan: CVE-2026-34582: https://nvd.nist.gov/vuln/detail/CVE-2026-34582
 - [NEW] cannelloni: CVE-2026-37539: https://nvd.nist.gov/vuln/detail/CVE-2026-37539
 - civetweb: CVE-2026-5789: https://nvd.nist.gov/vuln/detail/CVE-2026-5789
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - [NEW] dovecot: CVE-2025-59028: https://nvd.nist.gov/vuln/detail/CVE-2025-59028
 - dovecot: CVE-2025-59031: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
 - [NEW] dovecot: CVE-2025-59032: https://nvd.nist.gov/vuln/detail/CVE-2025-59032
 - dovecot: CVE-2026-0394: https://nvd.nist.gov/vuln/detail/CVE-2026-0394
 - dovecot: CVE-2026-24031: https://nvd.nist.gov/vuln/detail/CVE-2026-24031
 - dovecot: CVE-2026-27855: https://nvd.nist.gov/vuln/detail/CVE-2026-27855
 - dovecot: CVE-2026-27856: https://nvd.nist.gov/vuln/detail/CVE-2026-27856
 - [NEW] dovecot: CVE-2026-27857: https://nvd.nist.gov/vuln/detail/CVE-2026-27857
 - [NEW] dovecot: CVE-2026-27858: https://nvd.nist.gov/vuln/detail/CVE-2026-27858
 - [NEW] dovecot: CVE-2026-27859: https://nvd.nist.gov/vuln/detail/CVE-2026-27859
 - dovecot: CVE-2026-27860: https://nvd.nist.gov/vuln/detail/CVE-2026-27860
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - [NEW] emacs: CVE-2026-6861: https://nvd.nist.gov/vuln/detail/CVE-2026-6861
 - etcd: CVE-2026-33343: https://nvd.nist.gov/vuln/detail/CVE-2026-33343
 - etcd: CVE-2026-33413: https://nvd.nist.gov/vuln/detail/CVE-2026-33413
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
 - gimp: CVE-2026-4887: https://nvd.nist.gov/vuln/detail/CVE-2026-4887
 - gimp: CVE-2026-6384: https://nvd.nist.gov/vuln/detail/CVE-2026-6384
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - imagemagick: CVE-2026-23874: https://nvd.nist.gov/vuln/detail/CVE-2026-23874
 - imagemagick: CVE-2026-23876: https://nvd.nist.gov/vuln/detail/CVE-2026-23876
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - imagemagick: CVE-2026-24484: https://nvd.nist.gov/vuln/detail/CVE-2026-24484
 - imagemagick: CVE-2026-24485: https://nvd.nist.gov/vuln/detail/CVE-2026-24485
 - imagemagick: CVE-2026-25576: https://nvd.nist.gov/vuln/detail/CVE-2026-25576
 - imagemagick: CVE-2026-25637: https://nvd.nist.gov/vuln/detail/CVE-2026-25637
 - imagemagick: CVE-2026-25971: https://nvd.nist.gov/vuln/detail/CVE-2026-25971
 - imagemagick: CVE-2026-25983: https://nvd.nist.gov/vuln/detail/CVE-2026-25983
 - imagemagick: CVE-2026-25989: https://nvd.nist.gov/vuln/detail/CVE-2026-25989
 - imagemagick: CVE-2026-27798: https://nvd.nist.gov/vuln/detail/CVE-2026-27798
 - imagemagick: CVE-2026-27799: https://nvd.nist.gov/vuln/detail/CVE-2026-27799
 - imagemagick: CVE-2026-28493: https://nvd.nist.gov/vuln/detail/CVE-2026-28493
 - imagemagick: CVE-2026-28494: https://nvd.nist.gov/vuln/detail/CVE-2026-28494
 - imagemagick: CVE-2026-28686: https://nvd.nist.gov/vuln/detail/CVE-2026-28686
 - imagemagick: CVE-2026-28687: https://nvd.nist.gov/vuln/detail/CVE-2026-28687
 - imagemagick: CVE-2026-28688: https://nvd.nist.gov/vuln/detail/CVE-2026-28688
 - imagemagick: CVE-2026-28689: https://nvd.nist.gov/vuln/detail/CVE-2026-28689
 - imagemagick: CVE-2026-28690: https://nvd.nist.gov/vuln/detail/CVE-2026-28690
 - imagemagick: CVE-2026-28691: https://nvd.nist.gov/vuln/detail/CVE-2026-28691
 - imagemagick: CVE-2026-28692: https://nvd.nist.gov/vuln/detail/CVE-2026-28692
 - imagemagick: CVE-2026-28693: https://nvd.nist.gov/vuln/detail/CVE-2026-28693
 - imagemagick: CVE-2026-30883: https://nvd.nist.gov/vuln/detail/CVE-2026-30883
 - imagemagick: CVE-2026-30929: https://nvd.nist.gov/vuln/detail/CVE-2026-30929
 - imagemagick: CVE-2026-30931: https://nvd.nist.gov/vuln/detail/CVE-2026-30931
 - imagemagick: CVE-2026-30935: https://nvd.nist.gov/vuln/detail/CVE-2026-30935
 - imagemagick: CVE-2026-30936: https://nvd.nist.gov/vuln/detail/CVE-2026-30936
 - imagemagick: CVE-2026-30937: https://nvd.nist.gov/vuln/detail/CVE-2026-30937
 - imagemagick: CVE-2026-31853: https://nvd.nist.gov/vuln/detail/CVE-2026-31853
 - imagemagick: CVE-2026-32259: https://nvd.nist.gov/vuln/detail/CVE-2026-32259
 - imagemagick: CVE-2026-32636: https://nvd.nist.gov/vuln/detail/CVE-2026-32636
 - imagemagick: CVE-2026-33535: https://nvd.nist.gov/vuln/detail/CVE-2026-33535
 - imagemagick: CVE-2026-33536: https://nvd.nist.gov/vuln/detail/CVE-2026-33536
 - imagemagick: CVE-2026-33899: https://nvd.nist.gov/vuln/detail/CVE-2026-33899
 - imagemagick: CVE-2026-33900: https://nvd.nist.gov/vuln/detail/CVE-2026-33900
 - imagemagick: CVE-2026-33901: https://nvd.nist.gov/vuln/detail/CVE-2026-33901
 - imagemagick: CVE-2026-33902: https://nvd.nist.gov/vuln/detail/CVE-2026-33902
 - imagemagick: CVE-2026-33905: https://nvd.nist.gov/vuln/detail/CVE-2026-33905
 - imagemagick: CVE-2026-33908: https://nvd.nist.gov/vuln/detail/CVE-2026-33908
 - imagemagick: CVE-2026-34238: https://nvd.nist.gov/vuln/detail/CVE-2026-34238
 - imagemagick: CVE-2026-40169: https://nvd.nist.gov/vuln/detail/CVE-2026-40169
 - imagemagick: CVE-2026-40183: https://nvd.nist.gov/vuln/detail/CVE-2026-40183
 - imagemagick: CVE-2026-40310: https://nvd.nist.gov/vuln/detail/CVE-2026-40310
 - imagemagick: CVE-2026-40311: https://nvd.nist.gov/vuln/detail/CVE-2026-40311
 - imagemagick: CVE-2026-40312: https://nvd.nist.gov/vuln/detail/CVE-2026-40312
 - lcms: CVE-2026-41254: https://nvd.nist.gov/vuln/detail/CVE-2026-41254
 - [NEW] lcms: CVE-2026-42798: https://nvd.nist.gov/vuln/detail/CVE-2026-42798
 - libcap-native: CVE-2026-4878: https://nvd.nist.gov/vuln/detail/CVE-2026-4878
 - libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
 - libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-29013
 - libde265: CVE-2026-33164: https://nvd.nist.gov/vuln/detail/CVE-2026-33164
 - libde265: CVE-2026-33165: https://nvd.nist.gov/vuln/detail/CVE-2026-33165
 - libgphoto2: CVE-2026-40333: https://nvd.nist.gov/vuln/detail/CVE-2026-40333
 - libgphoto2: CVE-2026-40334: https://nvd.nist.gov/vuln/detail/CVE-2026-40334
 - libgphoto2: CVE-2026-40335: https://nvd.nist.gov/vuln/detail/CVE-2026-40335
 - libgphoto2: CVE-2026-40336: https://nvd.nist.gov/vuln/detail/CVE-2026-40336
 - libgphoto2: CVE-2026-40338: https://nvd.nist.gov/vuln/detail/CVE-2026-40338
 - libgphoto2: CVE-2026-40339: https://nvd.nist.gov/vuln/detail/CVE-2026-40339
 - libgphoto2: CVE-2026-40340: https://nvd.nist.gov/vuln/detail/CVE-2026-40340
 - libgphoto2: CVE-2026-40341: https://nvd.nist.gov/vuln/detail/CVE-2026-40341
 - libraw: CVE-2026-20884: https://nvd.nist.gov/vuln/detail/CVE-2026-20884
 - libraw: CVE-2026-20889: https://nvd.nist.gov/vuln/detail/CVE-2026-20889
 - libraw: CVE-2026-24450: https://nvd.nist.gov/vuln/detail/CVE-2026-24450
 - libraw: CVE-2026-24660: https://nvd.nist.gov/vuln/detail/CVE-2026-24660
 - libraw: CVE-2026-5342: https://nvd.nist.gov/vuln/detail/CVE-2026-5342
 - libssh: CVE-2025-14821: https://nvd.nist.gov/vuln/detail/CVE-2025-14821
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mbedtls: CVE-2025-66442: https://nvd.nist.gov/vuln/detail/CVE-2025-66442
 - minio: CVE-2026-33419: https://nvd.nist.gov/vuln/detail/CVE-2026-33419
 - minio: CVE-2026-34204: https://nvd.nist.gov/vuln/detail/CVE-2026-34204
 - miniupnpd: CVE-2026-5720: https://nvd.nist.gov/vuln/detail/CVE-2026-5720
 - mongodb: CVE-2026-1850: https://nvd.nist.gov/vuln/detail/CVE-2026-1850
 - mongodb: CVE-2026-25612: https://nvd.nist.gov/vuln/detail/CVE-2026-25612
 - mongodb: CVE-2026-4147: https://nvd.nist.gov/vuln/detail/CVE-2026-4147
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - nodejs: CVE-2026-21712: https://nvd.nist.gov/vuln/detail/CVE-2026-21712
 - ntfs-3g-ntfsprogs: CVE-2026-40706: https://nvd.nist.gov/vuln/detail/CVE-2026-40706
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - polkit: CVE-2026-4897: https://nvd.nist.gov/vuln/detail/CVE-2026-4897
 - [NEW] postfix: CVE-2026-43964: https://nvd.nist.gov/vuln/detail/CVE-2026-43964
 - proftpd: CVE-2026-42167: https://nvd.nist.gov/vuln/detail/CVE-2026-42167
 - [NEW] proftpd: CVE-2026-44331: https://nvd.nist.gov/vuln/detail/CVE-2026-44331
 - protobuf: CVE-2026-6409: https://nvd.nist.gov/vuln/detail/CVE-2026-6409
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
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
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-13473: https://nvd.nist.gov/vuln/detail/CVE-2025-13473
 - python3-django: CVE-2025-14550: https://nvd.nist.gov/vuln/detail/CVE-2025-14550
 - python3-django: CVE-2026-1207: https://nvd.nist.gov/vuln/detail/CVE-2026-1207
 - python3-django: CVE-2026-1285: https://nvd.nist.gov/vuln/detail/CVE-2026-1285
 - python3-django: CVE-2026-1287: https://nvd.nist.gov/vuln/detail/CVE-2026-1287
 - python3-django: CVE-2026-1312: https://nvd.nist.gov/vuln/detail/CVE-2026-1312
 - python3-django: CVE-2026-4277: https://nvd.nist.gov/vuln/detail/CVE-2026-4277
 - python3-flask: CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-gunicorn: CVE-2024-6827: https://nvd.nist.gov/vuln/detail/CVE-2024-6827
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - [NEW] python3-pillow: CVE-2026-42310: https://nvd.nist.gov/vuln/detail/CVE-2026-42310
 - [NEW] python3-pillow: CVE-2026-42311: https://nvd.nist.gov/vuln/detail/CVE-2026-42311
 - python3-tornado: CVE-2026-31958: https://nvd.nist.gov/vuln/detail/CVE-2026-31958
 - python3-virtualenv: CVE-2024-53899: https://nvd.nist.gov/vuln/detail/CVE-2024-53899
 - [NEW] redis: CVE-2026-23479: https://nvd.nist.gov/vuln/detail/CVE-2026-23479
 - [NEW] redis: CVE-2026-23631: https://nvd.nist.gov/vuln/detail/CVE-2026-23631
 - [NEW] redis: CVE-2026-25243: https://nvd.nist.gov/vuln/detail/CVE-2026-25243
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sox: CVE-2019-8355: https://nvd.nist.gov/vuln/detail/CVE-2019-8355
 - sox: CVE-2019-8356: https://nvd.nist.gov/vuln/detail/CVE-2019-8356
 - sox: CVE-2019-8357: https://nvd.nist.gov/vuln/detail/CVE-2019-8357
 - sox: CVE-2021-40426: https://nvd.nist.gov/vuln/detail/CVE-2021-40426
 - sox: CVE-2022-31650: https://nvd.nist.gov/vuln/detail/CVE-2022-31650
 - sox: CVE-2022-31651: https://nvd.nist.gov/vuln/detail/CVE-2022-31651
 - sox: CVE-2023-34432: https://nvd.nist.gov/vuln/detail/CVE-2023-34432
 - squid: CVE-2026-32748: https://nvd.nist.gov/vuln/detail/CVE-2026-32748
 - squid: CVE-2026-33515: https://nvd.nist.gov/vuln/detail/CVE-2026-33515
 - squid: CVE-2026-33526: https://nvd.nist.gov/vuln/detail/CVE-2026-33526
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tcpreplay: CVE-2024-54192: https://nvd.nist.gov/vuln/detail/CVE-2024-54192
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
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
 - tigervnc: CVE-2026-34352: https://nvd.nist.gov/vuln/detail/CVE-2026-34352
 - tinyproxy: CVE-2026-31842: https://nvd.nist.gov/vuln/detail/CVE-2026-31842
 - tinyproxy: CVE-2026-3945: https://nvd.nist.gov/vuln/detail/CVE-2026-3945
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - uriparser: CVE-2026-42371: https://nvd.nist.gov/vuln/detail/CVE-2026-42371
 - [NEW] uriparser: CVE-2026-44928: https://nvd.nist.gov/vuln/detail/CVE-2026-44928
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
 - wolfssl: CVE-2026-0819: https://nvd.nist.gov/vuln/detail/CVE-2026-0819
 - wolfssl: CVE-2026-1005: https://nvd.nist.gov/vuln/detail/CVE-2026-1005
 - wolfssl: CVE-2026-2645: https://nvd.nist.gov/vuln/detail/CVE-2026-2645
 - wolfssl: CVE-2026-2646: https://nvd.nist.gov/vuln/detail/CVE-2026-2646
 - wolfssl: CVE-2026-3229: https://nvd.nist.gov/vuln/detail/CVE-2026-3229
 - wolfssl: CVE-2026-3230: https://nvd.nist.gov/vuln/detail/CVE-2026-3230
 - wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - wolfssl: CVE-2026-3547: https://nvd.nist.gov/vuln/detail/CVE-2026-3547
 - wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - wolfssl: CVE-2026-3549: https://nvd.nist.gov/vuln/detail/CVE-2026-3549
 - wolfssl: CVE-2026-3580: https://nvd.nist.gov/vuln/detail/CVE-2026-3580
 - wolfssl: CVE-2026-3849: https://nvd.nist.gov/vuln/detail/CVE-2026-3849
 - wolfssl: CVE-2026-4159: https://nvd.nist.gov/vuln/detail/CVE-2026-4159
 - wolfssl: CVE-2026-4395: https://nvd.nist.gov/vuln/detail/CVE-2026-4395
 - wolfssl: CVE-2026-5187: https://nvd.nist.gov/vuln/detail/CVE-2026-5187
 - wolfssl: CVE-2026-5188: https://nvd.nist.gov/vuln/detail/CVE-2026-5188
 - wolfssl: CVE-2026-5194: https://nvd.nist.gov/vuln/detail/CVE-2026-5194
 - wolfssl: CVE-2026-5263: https://nvd.nist.gov/vuln/detail/CVE-2026-5263
 - wolfssl: CVE-2026-5264: https://nvd.nist.gov/vuln/detail/CVE-2026-5264
 - wolfssl: CVE-2026-5295: https://nvd.nist.gov/vuln/detail/CVE-2026-5295
 - wolfssl: CVE-2026-5392: https://nvd.nist.gov/vuln/detail/CVE-2026-5392
 - wolfssl: CVE-2026-5393: https://nvd.nist.gov/vuln/detail/CVE-2026-5393
 - wolfssl: CVE-2026-5446: https://nvd.nist.gov/vuln/detail/CVE-2026-5446
 - wolfssl: CVE-2026-5447: https://nvd.nist.gov/vuln/detail/CVE-2026-5447
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
 - wolfssl: CVE-2026-5772: https://nvd.nist.gov/vuln/detail/CVE-2026-5772
 - wolfssl: CVE-2026-5778: https://nvd.nist.gov/vuln/detail/CVE-2026-5778
 - xdg-dbus-proxy: CVE-2026-34080: https://nvd.nist.gov/vuln/detail/CVE-2026-34080
 - xdg-desktop-portal: CVE-2026-40354: https://nvd.nist.gov/vuln/detail/CVE-2026-40354
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - xrdp: CVE-2025-68670: https://nvd.nist.gov/vuln/detail/CVE-2025-68670
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
 - zabbix: CVE-2026-23919: https://nvd.nist.gov/vuln/detail/CVE-2026-23919
 - zabbix: CVE-2026-23920: https://nvd.nist.gov/vuln/detail/CVE-2026-23920
 - zabbix: CVE-2026-23921: https://nvd.nist.gov/vuln/detail/CVE-2026-23921
 - zabbix: CVE-2026-23923: https://nvd.nist.gov/vuln/detail/CVE-2026-23923
 - zabbix: CVE-2026-23925: https://nvd.nist.gov/vuln/detail/CVE-2026-23925
 - [NEW] zabbix: CVE-2026-23926: https://nvd.nist.gov/vuln/detail/CVE-2026-23926
 - [NEW] zabbix: CVE-2026-23927: https://nvd.nist.gov/vuln/detail/CVE-2026-23927
 - [NEW] zabbix: CVE-2026-23928: https://nvd.nist.gov/vuln/detail/CVE-2026-23928

====================

Removed this week (0): 


