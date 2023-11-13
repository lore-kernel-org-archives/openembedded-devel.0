Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E6BC07D59
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.3148.1699900431370856086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iU9FMzc8;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6c10f098a27so3629281b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900430; x=1700505230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvDWVk2AFOHeeM5lmINEJfypGa18bHDd4kOmfKwH/4Q=;
        b=iU9FMzc896fUBHJFYbXh7GhmL81RsMmHMlF8u/Ie49io+Z1WbtpLpQrfl5eafJlxH1
         RATTARBW3n8OttuJiZweCGHIEIGxbPemOF4vncK6O6wveZpSCei4A0TX6DSNk/ZvokgR
         FHCMRJIYNfr2EpnNkAZdBCc80rgjNERaxtvEJ5EL2DKtsMpQrd582dOI/2/av09riU0I
         245PUwEwWW/5iW5TbJ4dJcPXQiptB9R+T3r/x0lig+KY9UMcq1Sz/vrGJ63hwd2Treba
         PMbPnFhGNV9IZc+CDL+ZqX2o3IHqFnugoHqJV4h5pWk+8f+SW9U3rE2qjNVI1H1MfQwq
         +i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900430; x=1700505230;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvDWVk2AFOHeeM5lmINEJfypGa18bHDd4kOmfKwH/4Q=;
        b=oHmxpF+PrlYiZ/F1wMZKIdZhXBCCC2OuQaOPjN9t109Knus/gFM4qZvoXhsmscy8vJ
         B0+S92mjE3hVOhkeG5HjuBYzmWHIOat5+bFFg2ZiSsYncYdIdh09nvkhRM532+l/oojM
         H3dWSeLGCGLH/8JQqb3hUhx4GB0bLNnnXQY/KCX3d1VzgvTyJ5SiHRVqTxE+Wr+T+dom
         TWKbd2XokvfTUR8oBtpmbXeWhnI0Qbi5zPNOsy3aR9M5Iw2yR74rhiU5KrOjCc+A0gPU
         hmL9JmZSIZl7lmvUKxvut5D8X+A/T7O0FpafACZ9HvMhaoWtpTmUgVbVZAeY/BqppQMA
         ljaQ==
X-Gm-Message-State: AOJu0YzBJLaVGdQ2lmvVDI4aRQMhHc0o/HZcuVX+F7Qwcv0JGRimbnxL
	5ry+EoJN0m0bOIFXh13wMZvo95RrcnrfDw==
X-Google-Smtp-Source: AGHT+IFhS3zGiqgW6tMUihNhgq9PH84ylSav3tNKnAqFsWECxemoWOPAkNo9TO9nwLWfcN3Hp6FG5g==
X-Received: by 2002:aa7:8048:0:b0:6be:18a9:8f60 with SMTP id y8-20020aa78048000000b006be18a98f60mr4839808pfm.16.1699900430437;
        Mon, 13 Nov 2023 10:33:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112092620.101889-1-alperyasinak1@gmail.com>
References: <20231112092620.101889-1-alperyasinak1@gmail.com>
Subject: Re: [meta-filesystems][PATCH] libisofs: upgrade 1.5.4 -> 1.5.6
Message-Id: <169990042928.4418.10300597437642937097.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106654


On Sun, 12 Nov 2023 12:26:20 +0300, alperak wrote:
> Changelog:
> 
> * Bug fix: iso_write_opts_set_part_like_isohybrid() did not cause a MBR
>            partition table if the partitions are data files in the ISO
>            rather than appended
> * Bug fix: The lseek methods of IsoFileSource for local filesystem and loaded
>            ISO returned libisofs error codes as positive off_t numbers
> * Bug fix: Freshly cloned data files from imported image were not marked as
>            imported. Thanks to Ivan Shmakov. (Closes: #1022851)
> * Bug fix: Size of further CE area was calculated wrong if its CE entry ended
>            exactly at a block boundary
> * New iso_write_opts_set_system_area() option bits 16:
>   GPT "Legacy BIOS bootable" and 17: GPT writable
> * New API calls iso_assess_written_features(), iso_read_image_feature_named(),
>   iso_read_image_features_text()
> * Allowed lseekable device files with iso_tree_add_new_cut_out_node().
>   Proof-of-concept by Ivan Shmakov.
> * New API call iso_write_opts_set_max_ce_entries()
> 
> [...]

Applied, thanks!

[1/1] libisofs: upgrade 1.5.4 -> 1.5.6
      commit: cf05b1a2589f6ec0a571709e26f4526fc00e8ca7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


