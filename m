Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963B6E63F3D
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:25:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15481.1771230329349536201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXnyHg6P;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4834826e555so29747835e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771230328; x=1771835128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVJ69bW9i7gglDQKmcxrtEcYca08L1Skf9TofnB4zYU=;
        b=aXnyHg6PQGCt8jlnk3umv1umq714Ve71w1bmxAST0vHB4Ru24WAuUuhtmFod/tiB/E
         MzqHMhLQnpwqI5fiAWvr8UfgXxUqeEUehyo60cblEOboliJwVgFN2JJhIbz17mz8g/Hm
         9XgRfncTuXl5McUW929+kbHJhRCd2G+L2PKlidid1c1SD+E7TY74Jq4A5lPAzJ/LZfWv
         dPyaKl2vrHszLnGWX/j4mad1qSucVG+0kTeDMJSJQHlsKXaXhq0GPrR6KwyjVI81gkeB
         LtqwrsC+mUtwTKnRNYAstXeQdsaBbDnCo7Y/MxosrI6lhdsMcmMPBhndHvWm2xVwDEIV
         BmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230328; x=1771835128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVJ69bW9i7gglDQKmcxrtEcYca08L1Skf9TofnB4zYU=;
        b=uW2Y/K4qQ/PVzkn29QOJVj8QLaiG5aYq7WUR2Aq5+wmHeYIOKF3XsbPzVase29s4Ko
         ejzFTvnWLENhOpRf/QEqy3VLPEbzDv3G7wspRw1R0HXh9PSXbg7I1WMI7HTVV5WXR/Tm
         CQtwwfxCYabnnZcZ8ZnJP8Aotq4tHbk860ZiAeZdJXUqdBMul/JYa/PRWbEs7BhDGDfV
         etxSnE3uS55se3IuaVQMi27Oq2eaMFtHhXEttfaS/OhulQG1KENmEbqT7PetcCVyPvYR
         a8FmWscdeXTR9IklwqSZOSr15eMiPGZy5wyLg6URuvfMuEvYDGrersuDO9XWC9PJoSym
         eTJg==
X-Gm-Message-State: AOJu0YxR4ACCeItE5r0nSJC1cBFdRyX/vCpAMNAc96zV+l+MTaswV/pD
	MVhOfSoUrjyHzXR4Ld8E/A3GGpI9a9PTv4l5+ZQDROQW3oOxM36/Kgj3b+atlA==
X-Gm-Gg: AZuq6aJpDa8Y6jktnKG0mW9KGO2MFN8cTgKjP89HZWRXkidoiL1i0bmj3rsl2HojrvP
	xf7QUxvyft8bLZrL+48dYYBliVT59iAk/SaOesTx5RpG+9OljVJB8nu+f7ll8q7xjga/IhP6fsr
	QZ4xoPcZ8b81XeqSERFmmR27Hk3mXITDew9snxxYkfM/qpBFTuxQavY20wmDx75F6xFACpjo660
	enQpmTaugsq+1lWxe7nRMsr4DhkJ5U9GTQYVVFOVs+AUZcj+fiTTF2kWjcsBkqmL41uO5g3Q2Il
	scebZ57vTpUsPnFdi3QsC77y9D2k49HvBbn1UrPhgR2/HLG/xe2xdmRCN9Z728ldXuw+QEebN1+
	42aXWLy8hkVlU0OxND+bxiJDuZZuP1LYv99mdZTJI+9KZKqQlt1WxfKB6cAvKLAJ++B5UZc7Xgr
	JpG1QvAR53ny0s/pF6m4u1
X-Received: by 2002:a05:600c:8119:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-48379be8248mr111903575e9.18.1771230327288;
        Mon, 16 Feb 2026 00:25:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm26740523f8f.16.2026.02.16.00.25.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:25:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-02-16
Date: Mon, 16 Feb 2026 09:25:23 +0100
Message-ID: <20260216082525.1473394-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 08:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124409

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (80, out of which new this week: 19):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
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
 - [NEW] freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
 - [NEW] freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
 - [NEW] freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
 - [NEW] freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
 - [NEW] freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
 - [NEW] freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
 - [NEW] freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
 - [NEW] freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
 - [NEW] freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
 - [NEW] freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
 - [NEW] freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
 - [NEW] freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - [NEW] libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - [NEW] libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
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
 - nginx: CVE-2026-1642: https://nvd.nist.gov/vuln/detail/CVE-2026-1642
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2026-2003: https://nvd.nist.gov/vuln/detail/CVE-2026-2003
 - [NEW] postgresql: CVE-2026-2004: https://nvd.nist.gov/vuln/detail/CVE-2026-2004
 - [NEW] postgresql: CVE-2026-2005: https://nvd.nist.gov/vuln/detail/CVE-2026-2005
 - [NEW] postgresql: CVE-2026-2006: https://nvd.nist.gov/vuln/detail/CVE-2026-2006
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - [NEW] python3-pillow: CVE-2026-25990: https://nvd.nist.gov/vuln/detail/CVE-2026-25990
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - streamripper: CVE-2020-37065: https://nvd.nist.gov/vuln/detail/CVE-2020-37065
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880

====================

Removed this week (9): 

 - freerdp: CVE-2026-22854: https://nvd.nist.gov/vuln/detail/CVE-2026-22854
 - freerdp: CVE-2026-22855: https://nvd.nist.gov/vuln/detail/CVE-2026-22855
 - hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - python3-django: CVE-2025-13473: https://nvd.nist.gov/vuln/detail/CVE-2025-13473
 - python3-django: CVE-2025-14550: https://nvd.nist.gov/vuln/detail/CVE-2025-14550
 - python3-django: CVE-2026-1207: https://nvd.nist.gov/vuln/detail/CVE-2026-1207
 - python3-django: CVE-2026-1285: https://nvd.nist.gov/vuln/detail/CVE-2026-1285
 - python3-django: CVE-2026-1287: https://nvd.nist.gov/vuln/detail/CVE-2026-1287
 - python3-django: CVE-2026-1312: https://nvd.nist.gov/vuln/detail/CVE-2026-1312

