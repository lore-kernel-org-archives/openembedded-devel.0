Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE1BEF4EDC
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:03:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53489.1775477007266028460
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IFzWqNZw;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so3467427f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477006; x=1776081806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Doa4N3qrJ/SBJ6VTfTmUzxo+p/ZmxoOzheOvZtGMKUA=;
        b=IFzWqNZwTMakJhRgF+rmZQF1Ab5wiTWkVKsAjJUrwicBGil1FXspSeAQcyxUBwpviz
         d+vrJmjDBFYfNSj4fJwuF+qR4EICV2eMa7qEpIqMZ26HvOuIM2crj0YBQ5mTkSj+wdlm
         HCxCVHWZQ5Intq21pWTDZgrqYDC386CUvaaASLjiQhu0XPmi0GhKtu8tGOAkW9pdExi0
         Bww5Kpd/d5Ri9i849wdnZGSGySZIjHAQ844hdi3GuFH9zT2FXPvveaAosDPceoZT4EVb
         ADCq4qFFcaUewvAi2KeKBYT37pWiWaNl1/pdekEhj+pTFIjNshWWxsCcU1GMFINW4DNr
         F7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477006; x=1776081806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Doa4N3qrJ/SBJ6VTfTmUzxo+p/ZmxoOzheOvZtGMKUA=;
        b=d8QU0TGLp0w7qTmTllHaO7urjm0AVkaxbSKGR8mHqZrW0hkP3msf4J5/jw/VLtnK6F
         oh9w5iEnICI5a6ZLQwoU5SL7HAyg1VMP7M6JyN8IzA0iRx4z+frpIxH9Wq1lHtQ7NbW3
         nPgbKz8gtYpOfqjb9TiRU8Q9lxT4X4XcKxgP5WgsSHfRC0lkYLJTHW0ledOap7bIOEBV
         MUrs6YOAg8Ph0Sd6oNlhpkBt4QnFCtxxOynkxtA77E8zxGehPHu7YdFEs5tLQTs9igp0
         MTdw5YY4yZJeO1XoHmuZKTRWHEzEUro15pbDdacHddASs3kFk/gvaN4J8TU5dnHNCMFd
         33dA==
X-Gm-Message-State: AOJu0YzmdLn4PM75i1fUJJkA4ZcOUQaqXVy0hyR7tfFxgAdHuhioQtlU
	CGKtvcZaSLa6F+A89SSPh4cIdRPR6fwSAY7sEWG+GwCo8qvJmyKnx+gIbK4sZQ==
X-Gm-Gg: AeBDiesuTVW6ghvuZXjlVyVQYnOBIpBfUb4m0hUXeXv1hbVDZAGVoxO+d5EyO3JecGP
	s4kFmgDcdFYExfgsMgwQIf2kBdVD0E+Aztd17kdUnyYjJ4hckPL2nYGZZ+COEmiTpFa59BJytO2
	A9ZpsAOrjxPnGLHhgjRL1tSimhz9bjMzgGoXTBK0Ua5GJ1tMwBnTmxw2YxgTgvMe/uMXNXadqaY
	Rg7y2kD2E1tGvna7BVCR+SfrYEFh+HFEeiONg+Q8aKfkwF4rjT0yzuLTytOE2z49z3VGr4Rf6NO
	eHlU3u+cP+RKiNCaab6x4Sr0GZRtWSyBZVWk72s36zZbkzHVYoW5tQUmkSAxhy0IEvqH7ybh+RH
	sd8IFeeV4cazepXHuvpRGv342RiansTcuEXUGZm4AFJM0Jz6hgn+Tz/YlYKUXA8t6mlUMlktsOU
	zd2czSdtojXDot+r3nB7uipEl/FsR9bMM=
X-Received: by 2002:a05:6000:40da:b0:439:bd70:610f with SMTP id ffacd0b85a97d-43d292ecc9amr17260683f8f.44.1775477005489;
        Mon, 06 Apr 2026 05:03:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm38673310f8f.37.2026.04.06.05.03.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:03:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/7] freeipmi: mark CVE-2026-33554 patched
Date: Mon,  6 Apr 2026 14:03:11 +0200
Message-ID: <20260406120314.3514982-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406120314.3514982-1-skandigraun@gmail.com>
References: <20260406120314.3514982-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126041

The CVE is tracked by NVD without version info. It's description
confirms that it is fixed in version 1.6.17.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index 50a1877c0e..7970e0f563 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -23,3 +23,4 @@ inherit pkgconfig autotools
 
 EXTRA_OECONF = "--without-random-device"
 
+CVE_STATUS[CVE-2026-33554] = "fixed-version: fixed since 1.6.17"

