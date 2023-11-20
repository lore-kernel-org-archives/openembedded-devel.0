Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627DBC5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:46 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.43631.1700452300821246579
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbXhXIyv;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso3522210b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452300; x=1701057100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQuW7l5xhYUwBw73Jm/F385WySRcgVTdyJt2XqetkXA=;
        b=PbXhXIyvV71ABW9trinO+J9MVexK2SPftqw2zYfEVg2TW//f8ancoEPpGMGF1Voekf
         EPvJrWH4WGDQrw9hQ0ucouPWIbr6tVa3OFraRjkdwmsFC6UpOT5Hb/V98fNwSmxiyaBP
         0njsXhw4BP33IB3MWv+4P5dATrO9CPH3XauOmNkOch6ZwUTkfFYRJ1oxKUgbjFdQQf+S
         R6GkG085pUVwHcq/Gt6IddHsl85NEmBKgOGyMYCjYALHH8EZBERGAVSiibQKj5esOOW5
         OQ7nhMfdWMwRHKyDElHVzBqtg95KfIrIAvYVMGHNLQI96r2iJ24KN2QRimOo7rdcDXyA
         NRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452300; x=1701057100;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQuW7l5xhYUwBw73Jm/F385WySRcgVTdyJt2XqetkXA=;
        b=MVZLd8QFbA1pgBU7BvLjV0YqByiVLJTDl9oK4rZ9FdavLoeG7i89V/l9jqhoIGAZWB
         YjLmrDhDg9G5CQmhyd2J0jPrFsjvibP91Ser0cxvmkp3511LJwu47OjvjtnFuNSNR5sf
         uwQhuTYWKth09biRB/ZVCArSno7QAO9Ypdo9iWgOo+U4Ci437faVkVm62akFLcyb6EO2
         6hYybmlMhLK0iZUcJRk4wRxXLiEQbApERXDnQI7tDyPEZmQS3C7WnvUvugq9qlTMPfnV
         0ZtNtxHXXLQcP0ijDMDRotrj71+bBqqklkVSmzn0yK6TyeLL3Yxp7o/JtJkRGbFfcjVR
         8QaQ==
X-Gm-Message-State: AOJu0Yy4Sd4SKHX0Gy+WJf0muYT1xBH7O4ZpQ7aLGfQ6gLAH0iBg/wHz
	2gStuBfHeFUSGr5Wby+4wZ4=
X-Google-Smtp-Source: AGHT+IHklnrnG3HidUrQKVqpugPKHx24tl/FLBRyujkBEgR6+ckaekvXhfGa57Bhm7CQJ7k6T2mpjg==
X-Received: by 2002:a05:6a20:42a4:b0:17d:faed:603c with SMTP id o36-20020a056a2042a400b0017dfaed603cmr7585749pzj.11.1700452300106;
        Sun, 19 Nov 2023 19:51:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231118142845.573701-1-f_l_k@t-online.de>
References: <20231118142845.573701-1-f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH] flatpak: Upgrade 1.15.4 -> 1.15.6
Message-Id: <170045229935.1416826.16468446049564691511.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106955


On Sat, 18 Nov 2023 15:28:45 +0100, Markus Volk wrote:
> - add a patch to fix build for the newly added wayland_security_context feature
> - build wayland_security_context according to wayland distro_feature
> 
> Dependencies:
> 
>     In distributions that compile Flatpak to use a separate bubblewrap (bwrap)
>     executable, version 0.8.0 is now required.
> 
> [...]

Applied, thanks!

[1/1] flatpak: Upgrade 1.15.4 -> 1.15.6
      commit: de1d2cbbe435be8fb8da097fbd7cbc67266cd4f6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


