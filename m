Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D8FC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 05:10:27 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.53166.1715577017980987399
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 22:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c1Q0RHYd;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f43ee95078so3821564b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 22:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715577017; x=1716181817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/1wacoKBs9LsoXTo7heOwxtz6Y53hohWgog8bazf2Q=;
        b=c1Q0RHYdui1FWdAI56Ivoh45GAOMvkBujVYJXnFmMgKVh0EEorldSpRiiODFjbOkhX
         JLwrZIZjajkMtgcJehGIDHpGqGBwznMlXlPE1kAzxSBvDh2lCtseZwttupJ621iEytD7
         z+5mLJoWM9csGoeSoDrvJIJxLUukLIdmlGr0L8nZbPgja7fdWvkJQWntnixwmAFrTY89
         6AF75WH/L1sWbeLUl05IUWO1iUzA8OmR1bZ4oOUZOrmOVYXDI23/Bp83e2ifFleZroGB
         FrHSl0Z65WC61ZDP8PtJPaoKSP4kuZzBg8TQQekd2zZmutkOXlQF7h58TJenn14uz3JO
         mJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715577017; x=1716181817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/1wacoKBs9LsoXTo7heOwxtz6Y53hohWgog8bazf2Q=;
        b=lKxpzV3SHJ1sYAqUiNfwLcbBsz6lIFni4sMxGzHI3ziCgulAUCXTMRV1jVHtj/oUGF
         TAwScs1IoxZgNYubVWA106qY4INoD39HEuuFoqa5baMnTZG12TihT2dDH9JrrnUddiCK
         Cm2fzDaREfbHWZViHx17mHNKJG92gZtQx7qWEr1m8OukRfmD+XwivGpxXAZtjSWmDpl7
         thaoOg+TEVKOOaDFVG+wTgEFiHrOW7LkObcejnqaaikxPgOjQR1T0fRAZ4md+U72bhBF
         yc07EJdqMEb565e/SI4swqfpkXJixiBcDiUNiOWe/R2MRiZGd5G9Dd6SwsRVgz+MERoL
         05Hg==
X-Gm-Message-State: AOJu0YxhAwpSWePfUMvTjAC6xB0svUUGh7r81ADXpd7NLE1O4rbG9YaQ
	IAQM6fsaDU5Yue/HtqQKxITzNDkPHh6R1sGwKNZyGkN7LSE6yeZxMBpW5RQay7Y=
X-Google-Smtp-Source: AGHT+IHZ7/bPNvcddb8ggwTXeTR2vcQfK9OG2/0XDKqvgwHmZQP9ZDOcG68DoUYkL480+27MpI62Uw==
X-Received: by 2002:a05:6a00:1311:b0:6ec:f282:f4ea with SMTP id d2e1a72fcca58-6f4e03a3adamr9259356b3a.34.1715577017091;
        Sun, 12 May 2024 22:10:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4fff45ce3sm1271395b3a.197.2024.05.12.22.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 22:10:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] python3-looseversion: Move to meta-oe
Date: Sun, 12 May 2024 22:10:14 -0700
Message-ID: <20240513051014.215076-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 05:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110332

its needed by fuse3 and right now its only needed by fuse3
in meta-openembedded layers, move it to meta-oe along with
fuse3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 .../python3-looseversion/python3-looseversion_1.3.0.bb            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-filesystems => meta-oe}/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb (100%)

diff --git a/meta-filesystems/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb b/meta-oe/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb
similarity index 100%
rename from meta-filesystems/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb
rename to meta-oe/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb
-- 
2.45.0


