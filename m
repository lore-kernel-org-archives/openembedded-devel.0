Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833DECCD19F
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:48:42 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.5348.1761029314602381251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=dPAIyxJu;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.214.173, mailfrom: jester@theyoctojester.info)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2909448641eso50633175ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1761029314; x=1761634114; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cvqaVoQF1ZUFci9r95yWAvneKHeajbpGEOXKYJm5orw=;
        b=dPAIyxJuh36gPn7y6oJH1BpXWFG/n8czB6B50CXXbtsl4LL/jjq28ALwONPpe3T3kw
         HQokojKfX3yCWlZdPy/+tJTdNret78Oj8hI7vrFzMOgw5gawHkVlEF+MsxFhpURm2Qk6
         IiUXRZDyI0efNGZyC+4uT87/zGt1Eez48crHiIjcZ/iZxfhg0NH6PJdakIpAFIGx6C/A
         2mT1i0usQVBBrnHy163LS4x7vPsm0r4CBtNQGIhseKth9r8HKtfpe2Nu7wlkVgmyqQCd
         DXQfJtzuOxBeGkMVMcqK5ils7TSx4vTO2dgvUv0LSbIS0Wrb4BGwhw+4TRapzT9ClEve
         +bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761029314; x=1761634114;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cvqaVoQF1ZUFci9r95yWAvneKHeajbpGEOXKYJm5orw=;
        b=qPGKoivs89YmjB2C7yH/KDCzIDkM5tJIatXfNIbNQ60u/WQUoWaRBql8AIIpTAxrcr
         dd9mkTIWLvatkBMWEBKlmP8dzq56i/WmK7i4uczi7lGcUrR9kGjEWeCBBIyBDgLxi8Yd
         oUkOZVP5i2fVq+d1bXT92fPLq+omt0dGidX4+OtnLCpiyqGS7jYrqL8SY5I6/c9RZDEG
         J/gUcA9A/flZqBBgEUwTiJydrCcT1TBiGGpRhfENa4npz7PWdcstdGWp5qMAU0wLWLtC
         uYR7t9QHlj4hBBmMVXB2YtBFVnE46TjX4anSu+mx+V5nS5qU0SBB2i4L+Owf4e8PcDFE
         TDIw==
X-Forwarded-Encrypted: i=1; AJvYcCUTXwBBvuHUyK5LZWJkJhbuM984dNSQBEPmFeBb6lW5v5hr4AymIv0prAzOV/lLEsrmFubzOzmx6B4lgkigwzbqTxs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy0rJWHhgLOT6zStXXf9VmLP/PcgCOswEEWwtsMdi2+sK0Dro5m
	3T8rCpsXbovHvIQj/Nva8MNxtQB/HbPm7SVBJ+K88bxWluC+twUfHoA/fz+svAN0rGgcbI348z/
	tIQ4f5krgshTTTFerlx4BUa2NpheSxNMe1zS6AwusJg==
X-Gm-Gg: ASbGnct8pC8eZQGjuMud7fH/K9UiDcUhRboWwxhMil5H46xUYc9AbuEyYL7M63MC0SN
	0DpnGQ1rJJNV+6z+4z4lRqs8v68/s4BiYc/0NPgHE2VqdbyK2Pm4Kr0oa+xmqIB9R25iK/+yopq
	/PTTU8IwuKMtWCQr3RnifVrLuRoWfGoTuEUrmZs3OzzBs46GHlx4j475NlPeTMWWHoYH2Fx/BQb
	8TaI1AN8PvRcbaOVes7YMv1d0iTYgLuizE6ZAScwbYXqYkizUj5McEIPVP9qPCxKX32BPP/HRUC
	E2rs
X-Google-Smtp-Source: AGHT+IHYgHU+NSyIkack+OKOos2WKaJuT+Vv9S3Vfvg9ohlz3sfem6Z45spzdHopWQnHKvEuPqI2vOEqPImL5nELuDw=
X-Received: by 2002:a17:903:1a23:b0:271:9b0e:54c7 with SMTP id
 d9443c01a7336-29091af3a9cmr270259095ad.11.1761029314019; Mon, 20 Oct 2025
 23:48:34 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Tue, 21 Oct 2025 08:48:07 +0200
X-Gm-Features: AS18NWDQ1ICZC2NQxyj7po85yviO0GwpDt736hA59chTbFoo4i62CGvOZF0eewU
Message-ID: <CAEt6NwpsO3gbHLJWs8mW7T7_4-GZKvxsDAs4m9R+8E8afxDSog@mail.gmail.com>
Subject: =?UTF-8?B?8J+rtSBXZSB3YW50IHlvdSAob24gRmVicnVhcnkgMikg8J+rtQ==?=
To: openembedded-members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120832

What are you counting the days down to? Christmas? New Years Eve?
FOSDEM? The OE Workshop on February 2nd?

We're counting the days until *YOU* submit your learning, war story,
experience, plans for world domination to your wonderful group of
fellows.

Let us know at https://pretalx.com/openembedded-workshop-2026-2025/cfp

Josef

