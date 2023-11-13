Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4489BC07545
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3230.1699900443208476427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqPRRbaZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6c431b91b2aso4035674b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900442; x=1700505242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VfyfZl9dZ+xZq/2dH+ip1zN3AFbQeR37mU//PPQ8Zk=;
        b=cqPRRbaZFUCwzmkGpZqL1yrNKllcKAVvA0tQGpPzOCMXUkUyMfK1TssWRWXCrmN9bV
         ABtzuguRbcIX9sCYj+KLQc8ZYQSwkWaaBG/9JyIBES8Z9UuTLpnpwAP2j2IxEX6v0sYX
         n0cad6rrYQtNlQ6TRIad7Pw4uWU28jhXbJvo99LPWrRhlsKb4URKfTcUGBbNiY2a4k9i
         6+mbIqF8hAFyfV+mr03UbwoV9OdHHwoU9biWwjDqf5k0eZ6+kfH5Z6VdNcuD48FFkyUR
         3Ct57WBA1DvpoNgnqa2dDx0XevUDyju+H2ni9OTcvGBEdOo8LYQRQURhdL4N1B9tTZw7
         Pv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900442; x=1700505242;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VfyfZl9dZ+xZq/2dH+ip1zN3AFbQeR37mU//PPQ8Zk=;
        b=qzsY5imNKEbZYOf9bfNoCkGLTx6n2A0kRNUTXBQ6nQXCBkSgnt05maB1ESMK1jXunn
         9kbt3fsz9QaIhbzhEb+0HU6jNkdGZ2lPTTRuIrLJbfcO2r2DNfxVKFXE1ntjAIbGL0WI
         fwF0gBBnzzp0fXqDI2Jq93GxBcFlAJNuaLv+W9xxXrNlurb+7RVsJeiGzUKWNgAvk+d2
         aw/HU6ZzbKbP/RNS4rR2h2YMkXqmeqhElJTKeVu8j+aiQ6FjkL3fdoWDkkrOROwKOs70
         z239jcDcF3oRRmhg+P6k2LBDkQ+7lYStcamdejID3f0QQ9kBcRdp9WyMsZRltY35iOAs
         HBNA==
X-Gm-Message-State: AOJu0YxJmBDTg6XTe57yICErfmT/C6d2wZ7WBLIh242weilEnWLtk9U/
	4zW3+883dbiiZ+9MOczNtV6u2xFWVItCPA==
X-Google-Smtp-Source: AGHT+IFV7GyKXowvOWrvtOgkKfUxZUYMC5iuNRjv1DtQwwY3zDrcotjHFF1jciTkAxszM3KbQetxAg==
X-Received: by 2002:a05:6a21:7748:b0:180:132:e078 with SMTP id bc8-20020a056a21774800b001800132e078mr6327820pzc.31.1699900442146;
        Mon, 13 Nov 2023 10:34:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:34:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112181028.577133-1-alperyasinak1@gmail.com>
References: <20231112181028.577133-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] tinyalsa: upgrade 1.1.1 -> 2.0.0
Message-Id: <169990044134.4418.9727954934035164922.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:34:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106666


On Sun, 12 Nov 2023 21:10:28 +0300, alperak wrote:
> - CMakeList.txt patch deleted because added to the new version.
> 
> Changelog:
> 
> * Miscellaneous bugs fixed.
> * PCM plugin support.
> * Add CMake build support.
> * Add meson build support.
> * tinyplay can now read from stdin.
> * Improved versioning support for library.
> * Improvements to pcm actions (prepare at open time and after overrun, etc.)
> * Improvements/fixes to pcm_get_htimestamp().
> * Fixes for the mixer percent functions.
> 
> [...]

Applied, thanks!

[1/1] tinyalsa: upgrade 1.1.1 -> 2.0.0
      commit: 5086a9b6d1357eb7e039e57a29b5f2bead8d5679

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


