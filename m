Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9812D58E74
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 07:06:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154870.1772435188046854057
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 23:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gvGRX7Zd;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439afc58ac7so1182481f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 23:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772435186; x=1773039986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTkQxEH0X5l356vz2k8lOoj/ggHXBLkHkqjQLE8tlM4=;
        b=gvGRX7ZdO7Aj4lJgVI0/DS2OwVik8I9W9lVY6eTQty/8qhHnzCqGRimbn+I/p8x8KA
         VWcBN623RxirxYWmpuHlrAJ8YPzvPl+mXYoQeg7+66I+FA/2BVXimbr2jm5nue11XJaQ
         iShi1Fv5SzWBp3jMnd1yPnL3anC9lEMdOJsaUJawHGZAaRuukna3MHtIZ7syiyxF5LUL
         rQA3tdyuJcIxlqGTPGojKU4BbuVaQKyn1WjK3FVMBBZtzvsPkETceWgmzNR96DMUlIWT
         eW1BaXBzj8RwNJVxSDUu+luxhddhg5romWH7ufMQw53T0o0/utTlZJY5ctqRWd43B8IP
         lkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772435186; x=1773039986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTkQxEH0X5l356vz2k8lOoj/ggHXBLkHkqjQLE8tlM4=;
        b=A06Qwm21oP5o/wj49c0JU2TPXY74xgJLU9BHhIoWN7B6TD+PtY77bGh5Knl3WZah2Y
         Jwrrl5ZALmaB9TGBpytroMDzGWk3ld8BHr5bCVZ2BRV3j6pSkld9TvG1thPE8Xa+u+r8
         Rrpb4wujG+C8wNaimzLmGgtkMU/2GaaThiU5QcAriTlAJooHRk+V+s19GHKBGcAQw88f
         Q9hIGW4RajtbxbOTt5ijGxbNYBPZHZSiB1f5cxyRoqXizv0GlTe7v4hhekCkEHmoOJH9
         nKULoHRmW3y8Ww0dkIRRi4H+/QEZ4maCYjWOJq+/e5Br1/NRaRbS+eqx3OrYu/AjEkY9
         vGsg==
X-Gm-Message-State: AOJu0YyxW71bNx3/gQzVGXNVbjoEZrVN2KaaRmk4nLiMcsMEQxLBt1Ky
	PtO/iAxuQmhQW+oWnZVyQqaojhXBZwpKGFRh/xDtEAebCX+LxgxM4aG4QRpI3g==
X-Gm-Gg: ATEYQzwjFjJ8Jf53uAJ8xGk9RATQ9p16o0pNHBslMJs2ZBnDwZNeR+SznGgQpkg+Jv7
	xSP0GrLWRRsJPj8rhl6pzA5xr5v90OgTwXILdegBSCEjTm+4dC/35+d+5wlYsMUpufT6JR+xOeY
	hZ5sldl7yt/RdoUc5/vVwRTF+nMxmsX2+Smg+ztfMJFMes4RcFRUvkEHmvaOVZvhcNMsvsSqQzV
	cadURVYYmJgTtTJWDWUav3f7vNKQDKMQE012M/oheUno/F/MPGC+X5lo/ffeyXUJbB3Q+uFQzt8
	NzW4eLbXfds+1jbBEp0LBV8PrkFh89Edy3NDNJRw9mTaY6FouzZbY9zrQbo4DqEK+VTF7q15/mL
	o2wKrjJ6XyE1QLW6XEpnefIzrD0Re7pl3v2daOcfATf1tDwWxEXAPX5vTiEsCzcEYoJSYuLLOBk
	iZjeFN53h6gvBtSbOGQTdN
X-Received: by 2002:adf:f68f:0:b0:439:a8c0:1d43 with SMTP id ffacd0b85a97d-439a8cf6942mr7621936f8f.47.1772435186173;
        Sun, 01 Mar 2026 23:06:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm24766058f8f.24.2026.03.01.23.06.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:06:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-03-02
Date: Mon,  2 Mar 2026 08:06:22 +0100
Message-ID: <20260302070624.1505272-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124801

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (141, out of which new this week: 62):

 - [NEW] bit7z: CVE-2026-27117: https://nvd.nist.gov/vuln/detail/CVE-2026-27117
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - [NEW] exiftool: CVE-2026-3102: https://nvd.nist.gov/vuln/detail/CVE-2026-3102
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
 - [NEW] freerdp: CVE-2026-25941: https://nvd.nist.gov/vuln/detail/CVE-2026-25941
 - [NEW] freerdp: CVE-2026-25942: https://nvd.nist.gov/vuln/detail/CVE-2026-25942
 - [NEW] freerdp: CVE-2026-25952: https://nvd.nist.gov/vuln/detail/CVE-2026-25952
 - [NEW] freerdp: CVE-2026-25953: https://nvd.nist.gov/vuln/detail/CVE-2026-25953
 - [NEW] freerdp: CVE-2026-25954: https://nvd.nist.gov/vuln/detail/CVE-2026-25954
 - [NEW] freerdp: CVE-2026-25955: https://nvd.nist.gov/vuln/detail/CVE-2026-25955
 - [NEW] freerdp: CVE-2026-25959: https://nvd.nist.gov/vuln/detail/CVE-2026-25959
 - [NEW] freerdp: CVE-2026-25997: https://nvd.nist.gov/vuln/detail/CVE-2026-25997
 - [NEW] freerdp: CVE-2026-26271: https://nvd.nist.gov/vuln/detail/CVE-2026-26271
 - [NEW] freerdp: CVE-2026-26955: https://nvd.nist.gov/vuln/detail/CVE-2026-26955
 - [NEW] freerdp: CVE-2026-26965: https://nvd.nist.gov/vuln/detail/CVE-2026-26965
 - [NEW] freerdp: CVE-2026-26986: https://nvd.nist.gov/vuln/detail/CVE-2026-26986
 - [NEW] freerdp: CVE-2026-27015: https://nvd.nist.gov/vuln/detail/CVE-2026-27015
 - [NEW] freerdp: CVE-2026-27950: https://nvd.nist.gov/vuln/detail/CVE-2026-27950
 - [NEW] freerdp: CVE-2026-27951: https://nvd.nist.gov/vuln/detail/CVE-2026-27951
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2026-0797: https://nvd.nist.gov/vuln/detail/CVE-2026-0797
 - gimp: CVE-2026-2044: https://nvd.nist.gov/vuln/detail/CVE-2026-2044
 - gimp: CVE-2026-2045: https://nvd.nist.gov/vuln/detail/CVE-2026-2045
 - gimp: CVE-2026-2047: https://nvd.nist.gov/vuln/detail/CVE-2026-2047
 - gimp: CVE-2026-2048: https://nvd.nist.gov/vuln/detail/CVE-2026-2048
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - [NEW] hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - [NEW] imagemagick: CVE-2026-24481: https://nvd.nist.gov/vuln/detail/CVE-2026-24481
 - [NEW] imagemagick: CVE-2026-24484: https://nvd.nist.gov/vuln/detail/CVE-2026-24484
 - [NEW] imagemagick: CVE-2026-24485: https://nvd.nist.gov/vuln/detail/CVE-2026-24485
 - [NEW] imagemagick: CVE-2026-25576: https://nvd.nist.gov/vuln/detail/CVE-2026-25576
 - [NEW] imagemagick: CVE-2026-25637: https://nvd.nist.gov/vuln/detail/CVE-2026-25637
 - [NEW] imagemagick: CVE-2026-25638: https://nvd.nist.gov/vuln/detail/CVE-2026-25638
 - [NEW] imagemagick: CVE-2026-25794: https://nvd.nist.gov/vuln/detail/CVE-2026-25794
 - [NEW] imagemagick: CVE-2026-25795: https://nvd.nist.gov/vuln/detail/CVE-2026-25795
 - [NEW] imagemagick: CVE-2026-25796: https://nvd.nist.gov/vuln/detail/CVE-2026-25796
 - [NEW] imagemagick: CVE-2026-25797: https://nvd.nist.gov/vuln/detail/CVE-2026-25797
 - [NEW] imagemagick: CVE-2026-25798: https://nvd.nist.gov/vuln/detail/CVE-2026-25798
 - [NEW] imagemagick: CVE-2026-25799: https://nvd.nist.gov/vuln/detail/CVE-2026-25799
 - [NEW] imagemagick: CVE-2026-25897: https://nvd.nist.gov/vuln/detail/CVE-2026-25897
 - [NEW] imagemagick: CVE-2026-25898: https://nvd.nist.gov/vuln/detail/CVE-2026-25898
 - [NEW] imagemagick: CVE-2026-25965: https://nvd.nist.gov/vuln/detail/CVE-2026-25965
 - [NEW] imagemagick: CVE-2026-25966: https://nvd.nist.gov/vuln/detail/CVE-2026-25966
 - [NEW] imagemagick: CVE-2026-25967: https://nvd.nist.gov/vuln/detail/CVE-2026-25967
 - [NEW] imagemagick: CVE-2026-25968: https://nvd.nist.gov/vuln/detail/CVE-2026-25968
 - [NEW] imagemagick: CVE-2026-25969: https://nvd.nist.gov/vuln/detail/CVE-2026-25969
 - [NEW] imagemagick: CVE-2026-25970: https://nvd.nist.gov/vuln/detail/CVE-2026-25970
 - [NEW] imagemagick: CVE-2026-25971: https://nvd.nist.gov/vuln/detail/CVE-2026-25971
 - [NEW] imagemagick: CVE-2026-25982: https://nvd.nist.gov/vuln/detail/CVE-2026-25982
 - [NEW] imagemagick: CVE-2026-25983: https://nvd.nist.gov/vuln/detail/CVE-2026-25983
 - [NEW] imagemagick: CVE-2026-25985: https://nvd.nist.gov/vuln/detail/CVE-2026-25985
 - [NEW] imagemagick: CVE-2026-25986: https://nvd.nist.gov/vuln/detail/CVE-2026-25986
 - [NEW] imagemagick: CVE-2026-25987: https://nvd.nist.gov/vuln/detail/CVE-2026-25987
 - [NEW] imagemagick: CVE-2026-25988: https://nvd.nist.gov/vuln/detail/CVE-2026-25988
 - [NEW] imagemagick: CVE-2026-25989: https://nvd.nist.gov/vuln/detail/CVE-2026-25989
 - [NEW] imagemagick: CVE-2026-26066: https://nvd.nist.gov/vuln/detail/CVE-2026-26066
 - [NEW] imagemagick: CVE-2026-26283: https://nvd.nist.gov/vuln/detail/CVE-2026-26283
 - [NEW] imagemagick: CVE-2026-26284: https://nvd.nist.gov/vuln/detail/CVE-2026-26284
 - [NEW] imagemagick: CVE-2026-26983: https://nvd.nist.gov/vuln/detail/CVE-2026-26983
 - [NEW] imagemagick: CVE-2026-27798: https://nvd.nist.gov/vuln/detail/CVE-2026-27798
 - [NEW] imagemagick: CVE-2026-27799: https://nvd.nist.gov/vuln/detail/CVE-2026-27799
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - [NEW] libde265: CVE-2025-61147: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
 - [NEW] libheif: CVE-2025-68431: https://nvd.nist.gov/vuln/detail/CVE-2025-68431
 - libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - [NEW] python3-flask: CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-nltk: CVE-2025-14009: https://nvd.nist.gov/vuln/detail/CVE-2025-14009
 - python3-pillow: CVE-2026-25990: https://nvd.nist.gov/vuln/detail/CVE-2026-25990
 - python3-werkzeug: CVE-2026-27199: https://nvd.nist.gov/vuln/detail/CVE-2026-27199
 - [NEW] redis: CVE-2025-32023: https://nvd.nist.gov/vuln/detail/CVE-2025-32023
 - [NEW] redis: CVE-2025-48367: https://nvd.nist.gov/vuln/detail/CVE-2025-48367
 - [NEW] redis: CVE-2025-49844: https://nvd.nist.gov/vuln/detail/CVE-2025-49844
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - streamripper: CVE-2020-37065: https://nvd.nist.gov/vuln/detail/CVE-2020-37065
 - [NEW] valkey: CVE-2026-27623: https://nvd.nist.gov/vuln/detail/CVE-2026-27623
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - [NEW] wireshark: CVE-2026-3201: https://nvd.nist.gov/vuln/detail/CVE-2026-3201
 - [NEW] wireshark: CVE-2026-3202: https://nvd.nist.gov/vuln/detail/CVE-2026-3202
 - [NEW] wireshark: CVE-2026-3203: https://nvd.nist.gov/vuln/detail/CVE-2026-3203
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880

====================

Removed this week (6): 

 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - postgresql: CVE-2026-2003: https://nvd.nist.gov/vuln/detail/CVE-2026-2003
 - postgresql: CVE-2026-2004: https://nvd.nist.gov/vuln/detail/CVE-2026-2004
 - postgresql: CVE-2026-2005: https://nvd.nist.gov/vuln/detail/CVE-2026-2005
 - postgresql: CVE-2026-2006: https://nvd.nist.gov/vuln/detail/CVE-2026-2006

