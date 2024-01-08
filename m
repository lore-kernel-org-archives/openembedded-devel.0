Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C68C47DA9
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.31425.1704682009699789369
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7d26xuY;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7ba737ee9b5so156045239f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682009; x=1705286809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHbDMfJ25JT8LFm4YDg/zK31j0OSoD6lDHYtpDoMR4Y=;
        b=F7d26xuYyxV+oo9mmzfwrJLhP6tIIovHP1vvRqKgAEnJUIXECzWlPwXOriFGB6UVBE
         ANwLJjKlClthDYGJUMYxxlt9uN7HlB8scleEU5JpmwBaxTM16xbFJ/qBS9UgvXeKeVfI
         qXkqIdyv6Ne6OwuR5LSkppOVwBHdY6Fiq59DZ9oBEGcfqLcUaeEymMyDrXsAqz0ZgVnh
         2pR/IaZvFMY9CC1O3ADxpG3jZga+gjsi8ZIhu36NrBPAYUR/A2QZbTo/Jxaxt+IBKnVn
         TLEZKJONg93BuXCfxFo/DyA+KGGHX3Idek8hfshL9Nh8lh8dX6RERsZkYWA+czqLwc4g
         L+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682009; x=1705286809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHbDMfJ25JT8LFm4YDg/zK31j0OSoD6lDHYtpDoMR4Y=;
        b=FIQy9VOSNsNyS8kPDLpZ+YKrrck2faLkDE/TXYxogshUoUgFKeqHn5Mm8IGxZCB/ip
         ENEmqKFSDf2bpGyiKLHeqTrxIkT419fDA1buigSQ/r3Do8NjycZDe45pIOmEfcC7urit
         zuLEatnlhJrXx0dvtuRu1YDvH6y10MuvInhC83YESY2k3bbj2lHI0xu9uJL3LpvlE7cD
         pAt8YYKSkMSrM13VBo4ixnDfo322/E5W0fOq5cScwZCEfeaLXNliNmp0ZtYL7wwWll5c
         eg/aXy2bh8N0pZJyAFetKEd0UEzWSqbHo/Rqi9nOJQ03fDp6iUAi1NqlhNXDrdHPV0np
         MRaw==
X-Gm-Message-State: AOJu0Yy6TetGGXbjivbZivWPfFThFtd25y7Lu2kGYw8C6/79ooGfLwP6
	eo40Oj86Hw7xEWu+fMQQBEmnulmWXN8=
X-Google-Smtp-Source: AGHT+IHiNteAL0fCqdpqTBBq9YGOAleXXrA9GNuYa7sec0R62W9efF1g1SVwj4gmBEPBaV1Vbca6tQ==
X-Received: by 2002:a05:6e02:198e:b0:360:17a7:d882 with SMTP id g14-20020a056e02198e00b0036017a7d882mr6420985ilf.121.1704682008768;
        Sun, 07 Jan 2024 18:46:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704176882-7543-1-git-send-email-wangmy@fujitsu.com>
References: <1704176882-7543-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] exiftool: upgrade 12.71 -> 12.72
Message-Id: <170468200779.912276.94493274337650004.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108090


On Tue, 02 Jan 2024 14:28:02 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> - Added read support for AAC audio files
> - Added a new QuickTime Keys Android tag
> - Added a number of new values for some Ricoh GR III tags
> - Decode timed metadata from Intsa360 Ace Pro MP4 videos
> - Decode GPSDateTime milliseconds in timed Insta360 metadata
> - Decode timed metadata from INNOV K5 TS videos
> - Decode a number of new GoPro timed-metadata tags
> - Decode a few new Xiaomi EXIF tags
> - Fixed writing of JPG/ARW images from some newer Sony models to preserve
>   HiddenData
> 
> [...]

Applied, thanks!

[1/1] exiftool: upgrade 12.71 -> 12.72
      commit: ff674dc99211c927fa4d4ee352ec21deeef3158d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


