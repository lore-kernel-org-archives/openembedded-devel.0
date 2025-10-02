Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E59BCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 16:30:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13614.1759422630160578773
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 09:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=kKUcP1xB;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.214.170, mailfrom: jester@theyoctojester.info)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27c369f898fso12645185ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1759422629; x=1760027429; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FXd+3bmgzFKOxSsARkU947DO5x1ocL+VU1rjRq3EgQM=;
        b=kKUcP1xBKFapttrPeaYUBgy0L/4FB5Sri5ZObrkRftNWV6ObRJdIaAZa/XPzooVkn/
         B4ITV7yLcyO++c3L3p+tzy2BHUHveYT1UWIDaiQPgdxLD4B8sfzIoBKqwzDuro+z7GkN
         W0BZU/x1Qol/2abp0HC+dcGp+CDeswpvkFinEOS6Ir44IdZY01GGtqWkT6Rldu5qUGvX
         6mgAkVwHvygbcl0WU8+QsOCLttzgSV/0JCAsfPYeFWar1TyjOx+wFW76DjLrRerLIuPm
         NkRxkIGZljZ+iq3RGUktbYVgI/hVTpf1/RuMpEhFOOAqYyrPu9piC0hTpSQVuynx4Zet
         eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422629; x=1760027429;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXd+3bmgzFKOxSsARkU947DO5x1ocL+VU1rjRq3EgQM=;
        b=SEUoZA7lmL2WshHCVSrY7usXAU7dQdpjv4VyC/f8ztfInVMV0iE/on11ZBLULznYQq
         k7pyTEC/HDUmugQisNCOWrfckmKd53froO8vhz1/fOYmFGZ/hLIUJUAtJLw0o/v14+9G
         EY3NWt8tkjHlknuQAVU1CUe8Pov/ETLrj8GalassV4oasQJ/2mi6hwcMjEE1p+IJx56k
         qnzoGlEyB/UDd00hNCgLrgV/Sj/gynLznm4T8cZ33k/aX8Pzga+wF5bWnkkrBocAGMg1
         Tn1eUBOEr8lFvjWxIBzGAfyq3N036RUbBXSFce8J26LjHpHRMFg6mRH4mVlrgtKHMaXm
         4CdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmvpSDc3BpgrWoTj7gFE+CVCTtEmoYW4BLSoLhBNIdziGxdMBLXgUKxT33Zf/1p7S/0VIelXmGbBVt9Cw4Os4OLvY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbYFKgm3e7IJp6CnkI0aZnVzlP+CUdfY0mGBL1eg3eMDrocTlu
	K1MQXt7jQJaseZIygEPkEwK57WLnGOdFX/97jJAHnkEncWGJI5vMkqNvsWdylfwIH6mbNNJKKdT
	vDNJ5dEnWrTjH5vbk5PffMvu2/YZ+BuFdTuy2iX8KCw==
X-Gm-Gg: ASbGncubQf7vcBG0qEs/AgGdW+52XCth+pDJloOoqUwy/EOeoOYYkDrwNEUUKWyrTqv
	A3xsfSvkRsT6A4LoVPvaeKfdJR0YQufvpVpYute2pubm2IGYr31jG9DH1ocXld/Rx7EXUrWlWud
	xh32LV2JNZ+yOQ4DTx1ivildBIAgnEswE64oGfoxkXIAHRKjcyFj43pbySKzKmmIKUngjzfefZZ
	ToBmpD/YHyFdgKgJ4bMfBkuHzfZB26C/2TK+ze9Pl0q/GXLDxXP3BAHwlxr2SUFWEKbVxGpwK5c
X-Google-Smtp-Source: AGHT+IF0oLXMb5y4l+iqwomp3/f6AbSlTUJJgwgOKRg/ure+4t9JwIHBllhnlntkUlX1vLY1ODQTW5x5tB+U3dXVC20=
X-Received: by 2002:a17:903:fa7:b0:264:ee2:c40f with SMTP id
 d9443c01a7336-28e7f45448dmr91775455ad.52.1759422629498; Thu, 02 Oct 2025
 09:30:29 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 2 Oct 2025 18:30:03 +0200
X-Gm-Features: AS18NWCirtmmLQolD9eh5lHCW3i4_X_96mndztU259OD8IgaRfw068bI4rNroXM
Message-ID: <CAEt6Nwrci00muZsVX0aCyeQcW3GD1aYDntwei4Goxpm3qudnow@mail.gmail.com>
Subject: Shh... RFQ
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	members <members@lists.yoctoproject.org>, members@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 16:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120202

Shhhh... have you heard of our opening as Ecosystem and Engineering
Operations Lead? If not, hurry up! Applications will close on October
6th.

https://jobs.smartrecruiters.com/LinuxFoundation/744000080228346-ecosystem-engineering-and-operations-lead-remote-contractor

