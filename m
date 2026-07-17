Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F326AC44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:48:57 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8105.1784270928777881399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R54kpoLQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: lianux.mm@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so85518075ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270928; x=1784875728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CjsRzfVQXL1NZmJst31gJhuScJk6s6i9mPZJEwqdXo=;
        b=R54kpoLQY18CVn7V9QMFOSODzXSNyktfvqamhOaXP2X+IMlGMu+O/XN4zTka+2DfVU
         2RHGeIh2HN54t/bAbozSfbIV8JpXr01306FalDBClZmB3M9FGiq4YOPG4DmCmUwlImLU
         LUgnRpLqmwKq92NhL1vR/fK415yAScpc7dOdVgY8oW3uWlLAhKXJAF0JzE0GIMNaRN3L
         5di8IFtkwXHQf6nTqUW4a4vmHyjn8mnLFlK6s0TlxmX4usguIXnLRsmpFAKKWoPz6Y5x
         If9AHW2Pvf6j0A8P3yhe8oqtmq7qsfNge7z/GpRm/Dlat9fOl9CtrOXYxzF1JEeGJl11
         /GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270928; x=1784875728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CjsRzfVQXL1NZmJst31gJhuScJk6s6i9mPZJEwqdXo=;
        b=Yuil6eTJGnJIFcah/ZTDsG2k/zsON23hMr023ss9LKqpZbmQM2vH5h0HGgCxC5IBp8
         rODuQZEPyt4FH82QqnjlM1SAj9YZ6umwkOxUAvbgPUL8taheG48qmkxUEWhdhaRHKx3C
         rwG3tzW8wshbTuBpO34Tv8m20VEaIJ3JVEApVACEheDlgk6o9gmIoSRMRAUDTCUq0ixN
         AcO1VTjTn/mld85RJCd7bUNpB6tMmxPJndLmIUbCGXJLiSRlSJX2oo9mnkzTOUXhdPgn
         k+OjM6GxWZOAJNQlZH3fXCV07yJajXwOfji2d5oQ15kPY95kXKv3krovkLp383G/okUF
         1fIw==
X-Gm-Message-State: AOJu0YwAUAvTGw6Ucz5pdgfGiT1szG1Xfs3lhRLSCL3as2rHo3i6M8ET
	GgC3Vwu7RDa6k3lwOSlgFUqPBFzMoqxZJVLJrLAQX2H5J4saTrjHL3jB3PZxEs6R7fY=
X-Gm-Gg: AfdE7cl2A4mTtZihxyECZOEMwAM6/d06tZ07VU2yoU9kSj3qWOIyOq5umVUPBXrtkO4
	vmD/6aR+L9JXoo4dokzQzqk2A7gXQVvOJdpVY9LbtT4yU7GIct2I2HdYWS5rUy9eSi7d5fbXOYb
	clFk+LInkg76BXpDAnG+QSK2vIlfF4+oNrKSvoecfX3hg2W7GK1Tq9IL3/fA3ToE09EnhV2fRzC
	v6Eo+jxLqAnuaH/xwX53YDB+A12+3WgTgd+TymYgN0+/yCtMLl67uvAJ7O/woKnWYMhf2/FYohM
	AWUcKbnfe8cY0PU2Q8T0n1mI6RNXTkzRlomidVfWUGMgTxZis/jk0Lt2lsp34RysW+TAI6TvKKk
	1h4KTh1gRf30sG3acZrmb5X1PqMr0qlyjcLBzQ4kWHhFuI+ilL/8TgKAgB7vAGG2eC50fKVisKC
	nbNjXZEwyLxQ==
X-Received: by 2002:a17:903:2ec5:b0:2cc:77f3:a927 with SMTP id d9443c01a7336-2cf34961e63mr16376705ad.26.1784270928009;
        Thu, 16 Jul 2026 23:48:48 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db2d9sm5111405ad.43.2026.07.16.23.48.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 23:48:47 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: Re: [oe] [PATCH 1/2] wolfssl: upgrade 5.7.2 -> 5.9.2
Date: Fri, 17 Jul 2026 14:48:34 +0800
Message-ID: <20260717064834.51179-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 06:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128248

Hi Khem,

Thank you for the review. I've rebased on master as requested:
- wolfssl 5.9.1 -> 5.9.2 v2 sent to master
- opensc (2/2) is already at 0.27.1 on master, no upgrade needed
- tcpdump is already at 4.99.6 on master, no upgrade needed

Thanks for the guidance on the branch policy.

Thanks,
Lian

