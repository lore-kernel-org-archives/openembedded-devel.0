Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B99FC55180
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 15:52:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25419.1785685931709622138
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 08:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I+pWJV2H;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: iwanicki92@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so11060775e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785685930; x=1786290730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4KpYlZiPlXIZEzhtBnB/tGv6lz6luRA6zOdOFleiUc=;
        b=I+pWJV2HDORt7Z1kVjGWYZ7SARecYsHa8m/ImviBBkaxepBPKmZCChuGUcFuh6lUPa
         1pOkSHRu1qHIbv2Itb3sh/URpZW81zKC2pHfHKd2TPhSiDu1mTRkSllKtqG4XZHtCdCd
         Ot3e9BxgS/S0aM9+oEZJfkNrh4KhzJhfYdMTblJI7+O96Isu7mJQFRIrEaqiavc/606S
         44bjnYG0h+/gWTkWngjkgFhhWU6NvulqNOz3ou50C/FnovxV/D4lr6LnAu7CT7GKcVln
         FezV+PCrGjzYiLtsChbuD4SNrKVvml3XNpq4mrfUs//2BCI0nIez+3azLYqeDB2B9Ui2
         qylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685930; x=1786290730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O4KpYlZiPlXIZEzhtBnB/tGv6lz6luRA6zOdOFleiUc=;
        b=GmqyuDG16FmjfjZCfxkMDjhf/Opwsan+mxpARa0Ao6NUmOX7JsfkfRF98+P9awiQRN
         P3MP+4BseVqG6kVPeQqwYJ+DwYj4CBltM+J1maXRmdMPt+ieEg5uKbZk47lDMUuU+uv+
         Ligr9em60UVM2jq5NYarTmfqCCgBRoopp+kNGCaLZ71Xgm9KbpaK4ux50qOe75owWi/7
         u54fCzONmmsj3KNjfHFUnwfaoPmjezEKUBZrhfRJRkv3PnTcutRE2ZeJOL6fSMDJ21WU
         5TP3ma5xyfmxL3uMsx/T2YAeoMjDLKQfAhHmf2rasgh8rxula2NEJiO0nrQCIZW4P94g
         uLNg==
X-Gm-Message-State: AOJu0YyytVKVeMloUDXUdbzgely3L9qPBqqORk+lJTi5Sxjp2EYyjYj0
	2bCdooZnSjwJnut4br76dwk9XNBTETTlk/l3fFgEQpKi3vfEHCY69km3TwlG5YID
X-Gm-Gg: AR+sD12d/Ax0nYmS716su1XtIujJvRKu/bAD4FF7b6Ey80eawAxJM03RaBRzO4F/VpR
	ybNdwhiqR9nDGqy8Jnw1obZerQSOMJaNivsFgzEoqC2HvlRWUaUXk+aLpcAC7M3hk20MrbDHnXj
	qV5SqCwKYzIspbX+NmH7Ofvj8f+tSu+wjYjORKprc8aWbhkXWrxePd2WuOcIftH4PJ3azQmhLkX
	bNNQ9dWibqqPdgZgGMQWc+mkKdZMcyHvQTrBeI8rp/cXttOWGXSUhep2z4VujXhxatBny573GEg
	13Mk/d7WParz14PrqQHCULALHOO0HUAX0bUlWB43T7wQDHcWOW2wse9ttxObZAKQzzkCw+4E2SZ
	nijFU9mNZSmyfMaj2PnmNCEIVJU8Yf7QRgCHFWF5wM7xTK02twMMFwU6lnNSWYtiC7e/NGnQ8wB
	LchHfnZw4MQyr85aNQf2cW2tRyGimNjFQsPx4v6Fr5ZlDXcS4NXJs0JWAHwYFK0PBwjTL9ngI3F
	U+NVAdzCjs4osuz1x/+e9HNRVc7vRU=
X-Received: by 2002:a05:600c:46c3:b0:494:1f7:8057 with SMTP id 5b1f17b1804b1-4980eb8d081mr110712425e9.1.1785685929632;
        Sun, 02 Aug 2026 08:52:09 -0700 (PDT)
Received: from iwans-fedora.play.pl (89-73-147-156.dynamic.play.pl. [89.73.147.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm143350235e9.4.2026.08.02.08.52.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 08:52:08 -0700 (PDT)
From: iwanicki92 <iwanicki92@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/2] Fix runtime dependencies of 2 python packages
Date: Sun,  2 Aug 2026 17:51:37 +0200
Message-ID: <20260802155139.4128822-1-iwanicki92@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 15:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128667

Those packages are python3-rich and python3-typer.
Packages are completely unusable if they are the
only python packages installed due to missing many
runtime dependencies.

iwanicki92 (2):
  python3-rich: add missing runtime dependencies
  python3-typer: add missing runtime dependencies

 .../python/python3-typer_0.27.0.bb            | 13 ++++++++----
 .../python-rich/python3-rich_15.0.0.bb        | 21 ++++++++++++++-----
 2 files changed, 25 insertions(+), 9 deletions(-)

-- 
2.55.0


