Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECADFEA71BC
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 04:29:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12641.1776659378701351199
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 21:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CjqItIH7;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d43e09de5so1320570f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 21:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776659377; x=1777264177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDHRYZKVp/4gQWhN08P0gk46zwaoPLilTwr2k7SPdnA=;
        b=CjqItIH7/eAYeqMKxN4OvGmG5/0L5OiSRPSMzY/fD3vBxP+ElUbKI8tvbvNlfwUWMN
         sS6Ok5V4GC11rSc9XKXlHo/id7Ahv9U9LeBB88Sgv9LEREGpTBMT2nmlz2WICQm5ypls
         DxG8em+d/ISwEaoK15r8zEzUBIT/4zs/GyWhl4HvfcAnzA+hzF7k3V0BtxSdFdGaCaVb
         xAAcSWa6AeXW+auADVpkRH2w0vJRIZErsTYYL7DyXfNTaRfrnW7YXL3u38iF9nwjqBkC
         SQE+nRW6Wa4xJGVKvNImWlVr25ULx8qtkanNzC5dOmSB/Of9fDtqQza67yvonywG131s
         W9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776659377; x=1777264177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDHRYZKVp/4gQWhN08P0gk46zwaoPLilTwr2k7SPdnA=;
        b=g8jRicHXQOINuDIzTfoRsBfW2EoFqlL7+czjXShUg49Ih2kM2+6pdJMgAKc20MYiag
         xPdAhf+pEsb4G7fMfkbjzGv7Jeomclv6UbwtYR25Vww0JhlAK8NRCX4oZAuPMY4oEzL2
         e0uEjGGXHhuzvUy82VAFi+3r50CBGnAnhl8p4SMThheH8CyL0k9tA2uXGPKhQywNBwUT
         JY1Rzy6HOXMqKZgO+NG2wZzu9gL91Jhkii6P5mxYnMgV+A2pFm0WgDCQa+frlh/6RtUa
         ivBuB1P/vyQKdW9JSZ4UtVxQ0Br/8MQsmZq3c8Uz+i2VOzeVWrJ86qIgHsv2LEP/w8b4
         99Lg==
X-Gm-Message-State: AOJu0Yzr69qi14uCct/T1grLjY7nGYqf3qNPhI0Sf5WxKLlql3Z26DlT
	SGKKZjd7/onYvqtvSuXKKviTnJPBYb29APUtuO8vdXEBbulm7LCfaPD3I4koyw==
X-Gm-Gg: AeBDievrWwAFj88SAXd5CJFmpApWn4fFAkartYKQWYubC8hNs8+cbYn22MyZbPdw44U
	49VRin10pCrzbTBoILupEKhTdsYxf6bkQCaoAjiPZdjISK4doVL6d1OXBKQ+r3sJXlTIa08v7TY
	jQXkJY4VY1+53ZlB2kuX5AYN08Jod8DKZiLtHKrhH/Dss/akuIIVKDbbPWY0TJeG4oOj9xL6rQ8
	2VXw3ML2n0vk6otWHZDraeRIrLVLJY860aDfm7LhTQ90uM9kE7yV4cUY4rmyItvcGoNyaTf/32j
	tVrXRfyj2rh4JVGpbS8tDxvfXZiPFDWOMhJTrUj2c82T1XMgwyRpfmQvcN4KgDL0Ecqnp8eGzO7
	uRj5kyM+JHfBbgqRKGV3wMRbgF1z0Q+7eXtHTr35k/iLK0iy7O63wgA9jCnDfzfi1Rwi1fk2lEQ
	LWMLZ9FJT4mlLh/eEw3JYIL6iC5VWm3Bg=
X-Received: by 2002:a05:6000:258a:b0:43f:f25a:f8b8 with SMTP id ffacd0b85a97d-43ff25af8d9mr2688891f8f.23.1776659376623;
        Sun, 19 Apr 2026 21:29:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d112sm28874349f8f.29.2026.04.19.21.29.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:29:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-04-20
Date: Mon, 20 Apr 2026 06:29:33 +0200
Message-ID: <20260420042933.3621580-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 04:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126464

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (315, out of which new this week: 60):

 - bit7z: CVE-2026-27117: https://nvd.nist.gov/vuln/detail/CVE-2026-27117
 - botan: CVE-2026-32877: https://nvd.nist.gov/vuln/detail/CVE-2026-32877
 - botan: CVE-2026-32883: https://nvd.nist.gov/vuln/detail/CVE-2026-32883
 - botan: CVE-2026-32884: https://nvd.nist.gov/vuln/detail/CVE-2026-32884
 - botan: CVE-2026-34582: https://nvd.nist.gov/vuln/detail/CVE-2026-34582
 - corosync: CVE-2026-35091: https://nvd.nist.gov/vuln/detail/CVE-2026-35091
 - corosync: CVE-2026-35092: https://nvd.nist.gov/vuln/detail/CVE-2026-35092
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - dovecot: CVE-2025-59031: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
 - dovecot: CVE-2026-0394: https://nvd.nist.gov/vuln/detail/CVE-2026-0394
 - dovecot: CVE-2026-24031: https://nvd.nist.gov/vuln/detail/CVE-2026-24031
 - dovecot: CVE-2026-27855: https://nvd.nist.gov/vuln/detail/CVE-2026-27855
 - dovecot: CVE-2026-27860: https://nvd.nist.gov/vuln/detail/CVE-2026-27860
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
 - freeipmi: CVE-2026-33554: https://nvd.nist.gov/vuln/detail/CVE-2026-33554
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
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - giflib: CVE-2025-31344: https://nvd.nist.gov/vuln/detail/CVE-2025-31344
 - giflib: CVE-2026-23868: https://nvd.nist.gov/vuln/detail/CVE-2026-23868
 - giflib: CVE-2026-26740: https://nvd.nist.gov/vuln/detail/CVE-2026-26740
 - [NEW] gimp: CVE-2026-4150: https://nvd.nist.gov/vuln/detail/CVE-2026-4150
 - [NEW] gimp: CVE-2026-4151: https://nvd.nist.gov/vuln/detail/CVE-2026-4151
 - [NEW] gimp: CVE-2026-4152: https://nvd.nist.gov/vuln/detail/CVE-2026-4152
 - [NEW] gimp: CVE-2026-4153: https://nvd.nist.gov/vuln/detail/CVE-2026-4153
 - [NEW] gimp: CVE-2026-4154: https://nvd.nist.gov/vuln/detail/CVE-2026-4154
 - [NEW] grpc: CVE-2026-33186: https://nvd.nist.gov/vuln/detail/CVE-2026-33186
 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - imagemagick: CVE-2026-33535: https://nvd.nist.gov/vuln/detail/CVE-2026-33535
 - imagemagick: CVE-2026-33536: https://nvd.nist.gov/vuln/detail/CVE-2026-33536
 - [NEW] imagemagick: CVE-2026-33899: https://nvd.nist.gov/vuln/detail/CVE-2026-33899
 - [NEW] imagemagick: CVE-2026-33900: https://nvd.nist.gov/vuln/detail/CVE-2026-33900
 - [NEW] imagemagick: CVE-2026-33901: https://nvd.nist.gov/vuln/detail/CVE-2026-33901
 - [NEW] imagemagick: CVE-2026-33902: https://nvd.nist.gov/vuln/detail/CVE-2026-33902
 - [NEW] imagemagick: CVE-2026-33905: https://nvd.nist.gov/vuln/detail/CVE-2026-33905
 - [NEW] imagemagick: CVE-2026-33908: https://nvd.nist.gov/vuln/detail/CVE-2026-33908
 - [NEW] imagemagick: CVE-2026-34238: https://nvd.nist.gov/vuln/detail/CVE-2026-34238
 - [NEW] imagemagick: CVE-2026-40169: https://nvd.nist.gov/vuln/detail/CVE-2026-40169
 - [NEW] imagemagick: CVE-2026-40183: https://nvd.nist.gov/vuln/detail/CVE-2026-40183
 - [NEW] imagemagick: CVE-2026-40310: https://nvd.nist.gov/vuln/detail/CVE-2026-40310
 - [NEW] imagemagick: CVE-2026-40311: https://nvd.nist.gov/vuln/detail/CVE-2026-40311
 - [NEW] imagemagick: CVE-2026-40312: https://nvd.nist.gov/vuln/detail/CVE-2026-40312
 - [NEW] jq: CVE-2026-32316: https://nvd.nist.gov/vuln/detail/CVE-2026-32316
 - [NEW] jq: CVE-2026-33947: https://nvd.nist.gov/vuln/detail/CVE-2026-33947
 - [NEW] jq: CVE-2026-33948: https://nvd.nist.gov/vuln/detail/CVE-2026-33948
 - [NEW] jq: CVE-2026-39979: https://nvd.nist.gov/vuln/detail/CVE-2026-39979
 - [NEW] lcms: CVE-2026-41254: https://nvd.nist.gov/vuln/detail/CVE-2026-41254
 - [NEW] libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-29013
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libde265: CVE-2026-33164: https://nvd.nist.gov/vuln/detail/CVE-2026-33164
 - libde265: CVE-2026-33165: https://nvd.nist.gov/vuln/detail/CVE-2026-33165
 - [NEW] libgphoto2: CVE-2026-40333: https://nvd.nist.gov/vuln/detail/CVE-2026-40333
 - [NEW] libgphoto2: CVE-2026-40334: https://nvd.nist.gov/vuln/detail/CVE-2026-40334
 - [NEW] libgphoto2: CVE-2026-40335: https://nvd.nist.gov/vuln/detail/CVE-2026-40335
 - [NEW] libgphoto2: CVE-2026-40336: https://nvd.nist.gov/vuln/detail/CVE-2026-40336
 - [NEW] libgphoto2: CVE-2026-40338: https://nvd.nist.gov/vuln/detail/CVE-2026-40338
 - [NEW] libgphoto2: CVE-2026-40339: https://nvd.nist.gov/vuln/detail/CVE-2026-40339
 - [NEW] libgphoto2: CVE-2026-40340: https://nvd.nist.gov/vuln/detail/CVE-2026-40340
 - [NEW] libgphoto2: CVE-2026-40341: https://nvd.nist.gov/vuln/detail/CVE-2026-40341
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libraw: CVE-2026-20884: https://nvd.nist.gov/vuln/detail/CVE-2026-20884
 - libraw: CVE-2026-20889: https://nvd.nist.gov/vuln/detail/CVE-2026-20889
 - libraw: CVE-2026-24450: https://nvd.nist.gov/vuln/detail/CVE-2026-24450
 - libraw: CVE-2026-24660: https://nvd.nist.gov/vuln/detail/CVE-2026-24660
 - libraw: CVE-2026-5318: https://nvd.nist.gov/vuln/detail/CVE-2026-5318
 - libraw: CVE-2026-5342: https://nvd.nist.gov/vuln/detail/CVE-2026-5342
 - libsoup-2.4: CVE-2026-1467: https://nvd.nist.gov/vuln/detail/CVE-2026-1467
 - libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-1536
 - libsoup-2.4: CVE-2026-1539: https://nvd.nist.gov/vuln/detail/CVE-2026-1539
 - libsoup-2.4: CVE-2026-1801: https://nvd.nist.gov/vuln/detail/CVE-2026-1801
 - libsoup-2.4: CVE-2026-2443: https://nvd.nist.gov/vuln/detail/CVE-2026-2443
 - libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-3099
 - libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-3632
 - libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-3633
 - libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-3634
 - libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-4271
 - libsoup-2.4: CVE-2026-5119: https://nvd.nist.gov/vuln/detail/CVE-2026-5119
 - libssh: CVE-2026-0965: https://nvd.nist.gov/vuln/detail/CVE-2026-0965
 - libssh: CVE-2026-0967: https://nvd.nist.gov/vuln/detail/CVE-2026-0967
 - libssh: CVE-2026-0968: https://nvd.nist.gov/vuln/detail/CVE-2026-0968
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
 - [NEW] miniupnpd: CVE-2026-5720: https://nvd.nist.gov/vuln/detail/CVE-2026-5720
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - nginx: CVE-2026-27651: https://nvd.nist.gov/vuln/detail/CVE-2026-27651
 - nginx: CVE-2026-27654: https://nvd.nist.gov/vuln/detail/CVE-2026-27654
 - nginx: CVE-2026-27784: https://nvd.nist.gov/vuln/detail/CVE-2026-27784
 - nginx: CVE-2026-28753: https://nvd.nist.gov/vuln/detail/CVE-2026-28753
 - nginx: CVE-2026-28755: https://nvd.nist.gov/vuln/detail/CVE-2026-28755
 - nginx: CVE-2026-32647: https://nvd.nist.gov/vuln/detail/CVE-2026-32647
 - nodejs: CVE-2026-21710: https://nvd.nist.gov/vuln/detail/CVE-2026-21710
 - nodejs: CVE-2026-21712: https://nvd.nist.gov/vuln/detail/CVE-2026-21712
 - nodejs: CVE-2026-21713: https://nvd.nist.gov/vuln/detail/CVE-2026-21713
 - nodejs: CVE-2026-21714: https://nvd.nist.gov/vuln/detail/CVE-2026-21714
 - nodejs: CVE-2026-21715: https://nvd.nist.gov/vuln/detail/CVE-2026-21715
 - nodejs: CVE-2026-21716: https://nvd.nist.gov/vuln/detail/CVE-2026-21716
 - nodejs: CVE-2026-21717: https://nvd.nist.gov/vuln/detail/CVE-2026-21717
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - [NEW] openjpeg: CVE-2026-6192: https://nvd.nist.gov/vuln/detail/CVE-2026-6192
 - opensc: CVE-2025-49010: https://nvd.nist.gov/vuln/detail/CVE-2025-49010
 - opensc: CVE-2025-66037: https://nvd.nist.gov/vuln/detail/CVE-2025-66037
 - opensc: CVE-2025-66038: https://nvd.nist.gov/vuln/detail/CVE-2025-66038
 - opensc: CVE-2025-66215: https://nvd.nist.gov/vuln/detail/CVE-2025-66215
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] protobuf: CVE-2026-6409: https://nvd.nist.gov/vuln/detail/CVE-2026-6409
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
 - python3-black: CVE-2026-31900: https://nvd.nist.gov/vuln/detail/CVE-2026-31900
 - python3-black: CVE-2026-32274: https://nvd.nist.gov/vuln/detail/CVE-2026-32274
 - python3-cbor2: CVE-2026-26209: https://nvd.nist.gov/vuln/detail/CVE-2026-26209
 - python3-django: CVE-2026-25673: https://nvd.nist.gov/vuln/detail/CVE-2026-25673
 - python3-django: CVE-2026-25674: https://nvd.nist.gov/vuln/detail/CVE-2026-25674
 - [NEW] python3-django: CVE-2026-33033: https://nvd.nist.gov/vuln/detail/CVE-2026-33033
 - [NEW] python3-django: CVE-2026-33034: https://nvd.nist.gov/vuln/detail/CVE-2026-33034
 - [NEW] python3-django: CVE-2026-3902: https://nvd.nist.gov/vuln/detail/CVE-2026-3902
 - python3-django: CVE-2026-4277: https://nvd.nist.gov/vuln/detail/CVE-2026-4277
 - [NEW] python3-django: CVE-2026-4292: https://nvd.nist.gov/vuln/detail/CVE-2026-4292
 - python3-ecdsa: CVE-2026-33936: https://nvd.nist.gov/vuln/detail/CVE-2026-33936
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-nltk: CVE-2026-0846: https://nvd.nist.gov/vuln/detail/CVE-2026-0846
 - python3-nltk: CVE-2026-33230: https://nvd.nist.gov/vuln/detail/CVE-2026-33230
 - python3-nltk: CVE-2026-33231: https://nvd.nist.gov/vuln/detail/CVE-2026-33231
 - python3-nltk: CVE-2026-33236: https://nvd.nist.gov/vuln/detail/CVE-2026-33236
 - python3-orjson: CVE-2025-67221: https://nvd.nist.gov/vuln/detail/CVE-2025-67221
 - [NEW] python3-pillow: CVE-2026-40192: https://nvd.nist.gov/vuln/detail/CVE-2026-40192
 - [NEW] python3-python-multipart: CVE-2026-40347: https://nvd.nist.gov/vuln/detail/CVE-2026-40347
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - squid: CVE-2026-32748: https://nvd.nist.gov/vuln/detail/CVE-2026-32748
 - squid: CVE-2026-33515: https://nvd.nist.gov/vuln/detail/CVE-2026-33515
 - squid: CVE-2026-33526: https://nvd.nist.gov/vuln/detail/CVE-2026-33526
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - strongswan: CVE-2026-25075: https://nvd.nist.gov/vuln/detail/CVE-2026-25075
 - tigervnc: CVE-2026-34352: https://nvd.nist.gov/vuln/detail/CVE-2026-34352
 - tinyproxy: CVE-2026-3945: https://nvd.nist.gov/vuln/detail/CVE-2026-3945
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
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
 - [NEW] wolfssl: CVE-2026-5187: https://nvd.nist.gov/vuln/detail/CVE-2026-5187
 - [NEW] wolfssl: CVE-2026-5188: https://nvd.nist.gov/vuln/detail/CVE-2026-5188
 - wolfssl: CVE-2026-5194: https://nvd.nist.gov/vuln/detail/CVE-2026-5194
 - wolfssl: CVE-2026-5263: https://nvd.nist.gov/vuln/detail/CVE-2026-5263
 - wolfssl: CVE-2026-5264: https://nvd.nist.gov/vuln/detail/CVE-2026-5264
 - [NEW] wolfssl: CVE-2026-5392: https://nvd.nist.gov/vuln/detail/CVE-2026-5392
 - [NEW] wolfssl: CVE-2026-5393: https://nvd.nist.gov/vuln/detail/CVE-2026-5393
 - wolfssl: CVE-2026-5446: https://nvd.nist.gov/vuln/detail/CVE-2026-5446
 - [NEW] wolfssl: CVE-2026-5447: https://nvd.nist.gov/vuln/detail/CVE-2026-5447
 - [NEW] wolfssl: CVE-2026-5448: https://nvd.nist.gov/vuln/detail/CVE-2026-5448
 - [NEW] wolfssl: CVE-2026-5460: https://nvd.nist.gov/vuln/detail/CVE-2026-5460
 - [NEW] wolfssl: CVE-2026-5466: https://nvd.nist.gov/vuln/detail/CVE-2026-5466
 - [NEW] wolfssl: CVE-2026-5479: https://nvd.nist.gov/vuln/detail/CVE-2026-5479
 - [NEW] wolfssl: CVE-2026-5500: https://nvd.nist.gov/vuln/detail/CVE-2026-5500
 - wolfssl: CVE-2026-5503: https://nvd.nist.gov/vuln/detail/CVE-2026-5503
 - wolfssl: CVE-2026-5504: https://nvd.nist.gov/vuln/detail/CVE-2026-5504
 - wolfssl: CVE-2026-5507: https://nvd.nist.gov/vuln/detail/CVE-2026-5507
 - wolfssl: CVE-2026-5772: https://nvd.nist.gov/vuln/detail/CVE-2026-5772
 - wolfssl: CVE-2026-5778: https://nvd.nist.gov/vuln/detail/CVE-2026-5778
 - xdg-dbus-proxy: CVE-2026-34080: https://nvd.nist.gov/vuln/detail/CVE-2026-34080
 - [NEW] xdg-desktop-portal: CVE-2026-40354: https://nvd.nist.gov/vuln/detail/CVE-2026-40354
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - [NEW] xrdp: CVE-2026-32105: https://nvd.nist.gov/vuln/detail/CVE-2026-32105
 - [NEW] xrdp: CVE-2026-32107: https://nvd.nist.gov/vuln/detail/CVE-2026-32107
 - [NEW] xrdp: CVE-2026-32623: https://nvd.nist.gov/vuln/detail/CVE-2026-32623
 - [NEW] xrdp: CVE-2026-32624: https://nvd.nist.gov/vuln/detail/CVE-2026-32624
 - [NEW] xrdp: CVE-2026-33145: https://nvd.nist.gov/vuln/detail/CVE-2026-33145
 - [NEW] xrdp: CVE-2026-33516: https://nvd.nist.gov/vuln/detail/CVE-2026-33516
 - [NEW] xrdp: CVE-2026-33689: https://nvd.nist.gov/vuln/detail/CVE-2026-33689
 - [NEW] xrdp: CVE-2026-35512: https://nvd.nist.gov/vuln/detail/CVE-2026-35512
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

====================

Removed this week (0): 


