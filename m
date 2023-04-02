Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC62C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:10 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.56494.1680474601046998486
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yz5LoFnp;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id d22so16389182pgw.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rGfd6Z5zhiiTfeHMj/4lRjQ5mQhS9Y+lGiSWnkA680=;
        b=Yz5LoFnpWnRZwq5QytkkYC7S9gYumMCNdcmLenRUqpdi2McZzZuMX74Q2DYjfL7I92
         kGH+VRwhNAFjbhkTXu1W2ZD244eabhxKCxZjzQBQxF7Ee7gQXvlnCsK0hWzJdro5lHqD
         r5anTcS4dTvhqPau72qo9h2YUUQY+s1Cs6dMpCOFXRpwFETieQ+sVICGE4hHcE/GU+L4
         +hregqucHg1kz4hKe5y3V0kz+LxMn9HBEGBMFxmG8k/P9J0fUHSmk51hGfCUNUVYZQPH
         LS36c/nWCPtHbP1lawxVPI62LEnT66Jlkv5IWqSsvR0kWANDschrpYmQ1KhfISTDVYif
         0v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rGfd6Z5zhiiTfeHMj/4lRjQ5mQhS9Y+lGiSWnkA680=;
        b=oukmdNqaYlfkeQVitFdQMBDNM2aAoPYQNPCuxNB/FmZO38FaNqNrCNHOdNhuP9Nc1R
         87gAi2INq+UuPm/cZaxvceL8SXtqja8OVShZsaPuFrMGWaL0spyjklhzRUuVUHgmHnoN
         z+PSVAA0C0RUPsNbLfrbWsDYugp9M2kwIpz6not8LCjD86Ru2H6nlZ/igcqjDESwOjoU
         sL82KbXtkR8IUEhZpnK4WNjV1hQemzI+TOapFoJJJff8l7V67yZRh0fs1razm7RFb9Aw
         Qne2DaS7NvTXdN9AKTFCBnLA9PTNHW+WEyThQ3KbHlvQbfYKwt3Mv/31fG+iQBI89rAS
         Tjhg==
X-Gm-Message-State: AAQBX9ftPlp/812qKF1BGysZlowCSaOttPp8qja+9Z+usY3UJHG52p/8
	DS9pcNAF11Yn/me4gE62+Pm7IL7oPI8=
X-Google-Smtp-Source: AKy350Z14P+hleTn0lqEEGCnxX6I9CpmjbytWFhP9LS+IDTatzUDMB38AFD8aCqSVnL4DR1xCyrbNg==
X-Received: by 2002:a62:1711:0:b0:62d:dad9:3d74 with SMTP id 17-20020a621711000000b0062ddad93d74mr11301304pfx.23.1680474599936;
        Sun, 02 Apr 2023 15:29:59 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.29.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:29:59 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 02/11] span-lite: do not inherit ptest
Date: Sun,  2 Apr 2023 15:29:34 -0700
Message-Id: <7013d64531ae0214cabe338c5b37c05ba158198c.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101880

This recipe provides no run-ptest script.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
index 0d9a8c93d..15380f5d7 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
@@ -9,4 +9,3 @@ SRCREV = "cbb9c3c5162a0d7018c7b3e053153a04d4fbbbb9"
 S = "${WORKDIR}/git"
 
 inherit cmake
-inherit ptest
-- 
2.34.1


