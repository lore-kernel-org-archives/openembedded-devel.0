Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05F4CD1299
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:15 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.82094.1712504585849509288
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D69I7F5r;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso3238413b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504585; x=1713109385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Utm5sras+rmNBNkJwhVUAyG2SPZw+yUrLUo6v1TIHN4=;
        b=D69I7F5rA5jhi69ogT/QOpCwgwmbXQhc3BtqMgRPQmjdXZsHGj4sc5N+8HxJWQ9vnN
         zBOagdxWwyvbKW+VeieXPzN/1KOsx3bIqBK9WDxFWU/XJP+/s35QZV6HdYsGlTkC5S4W
         X+TIxSBsm7gcJ04YsbFVvXJEEdOv7G6mt7Dh653EUzk/Ysx6aD0g9qBodyIT4bMVuftB
         5y99YN+gnEVG9nPCHZPHkGOFVz7Hgng/r0WxYamr0fpacvySnEMr0JLT147a1i+v8jsf
         jO6/+YX5oUG2w3p0vxYSgxUCx+GvR7+1TdXPJuJ/GsKVkvLATDZzHEUNS2MFNNvG/sCW
         LohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504585; x=1713109385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Utm5sras+rmNBNkJwhVUAyG2SPZw+yUrLUo6v1TIHN4=;
        b=UqjgRNlsY/nhVjz62zuMCKv2eacLKBkP9enRRuNIahjn5mLK1RXmGI4wG4wy7thZSP
         y5iZ5DTmetraQaAt6i5Jyc8BAGeAdGi1LkZhE8hx5cBELS34pd8wVvdT/KiVBsVQUHt1
         FIqPsOXjnB6OA6JdXh8Ci+5hRfpaqiZYcQrD07bOvxT8slHOpsi4eg4jxXw8TzYPaotn
         AnfPxUDM8r0ijb+if3x2vOk8TRtB4Q/balJ5zVKGU9HyFkLTmV3L+pMU4tstWuCniBFW
         HezlV6JMLucotGSeFHPlrvHYJbrtaLtyJP1PvwBv5lP/bUre0a2TCLjcDvfbYV8k/WhD
         n7QQ==
X-Gm-Message-State: AOJu0YySB6ie5BGM+b7qBNUaeACPrxOyD8zK9X2Gxx02wJpLA1RA6003
	yrzGqnTnGiGyyhXMkcyWPpbj6ds88F4Z+yz6IXha5Gq7C8YlsPCRwWsgsTN5
X-Google-Smtp-Source: AGHT+IEV/aqIOHTJM91PYBnVqX3U9eaGCO9PSPhe9QXnLLL1FI1U8ZwygUGsjWSBdkvd/iHPKoX35Q==
X-Received: by 2002:a05:6a00:1951:b0:6ea:e841:5889 with SMTP id s17-20020a056a00195100b006eae8415889mr8634567pfk.33.1712504585000;
        Sun, 07 Apr 2024 08:43:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	alperak <alperyasinak1@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-python][PATCH] python3-bleak: enable ptest and add missing runtime dependency
Date: Sun,  7 Apr 2024 08:42:51 -0700
Message-ID: <171250415789.900727.17180583294427420572.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405215254.1338168-1-alperyasinak1@gmail.com>
References: <20240405215254.1338168-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109842


On Sat, 06 Apr 2024 00:52:54 +0300, alperak wrote:
> * Ptest tested on qemux86-64 and qemuarm64
> 
> * Add ptest into PTESTS_FAST_META_PYTHON
> 
> qemux86-64:
> 
> Testsuite summary
> TOTAL: 14
> PASS: 14
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 9
> END: /usr/lib/python3-bleak/ptest
> 2024-04-05T18:44
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
> 
> [...]

Applied, thanks!

[1/1] python3-bleak: enable ptest and add missing runtime dependency
      commit: dce392b58826d1aff643196f05e592c9f40e9636

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

