Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0865C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.3217.1699900432620922157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jjFeKbkU;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c34e87b571so3891274b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900432; x=1700505232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIiSa0rf9k8uOUEWaLTqdYUczYbhYL9PB5WOoPfuMDE=;
        b=jjFeKbkUDp9W5GOSN5Rccw23s7S9hr4Ce6IA2wRe99A7kTvvOu4CVXEWJhYhVxoMDF
         a8PI+k7Zk6HSFCW7hdNwHm4WJTR8gZtq9NwV4F5Uu0tbBThrUv98tTAcY6oPe+dOjFnN
         47lxzh3qxboVfTNSbGgQawA8Hfcr5FGm7ZVqulW3etZS17KkMBjyEN3EmbaOhzwa3pTe
         mLx8onwH7lz2qOXC3XvAA09N/61TM6FuiajO9BW7g0h2Kqt5S3gcoi6mRg5dDmTpuSsO
         d3ihD58LlGdPufKOaN9va1ZFfX6RD2L8uK+/O1pdZY/y+BI/cdMwaVp3qqmOoCosI8Sy
         bvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900432; x=1700505232;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIiSa0rf9k8uOUEWaLTqdYUczYbhYL9PB5WOoPfuMDE=;
        b=q8Ugd0K+an54/wzKeq1ZYAgIspqwNCAGKMJqUJZzp2dkrdtI3BkBOvDdRY5PUSxjTa
         G0r8MF8bxeI0TjxjAaxa0HIbdw6SKNlWK1cZ93QIqXTkFUca8JwF0aoBvYudDvIDkzji
         stKgrRhyAfQu56sEf9zx6yhSiqYr8x+eZgswopOt7gtQyv1ZolkFH8U31MsSUmvSuF9f
         RCQhs8T2yYi2cKXcaBpNTFKEROuXhI0FvYqO51XiKlMXBl8ZKbqciySOO/C5QuUP54/I
         FhZJEnEvMOLqaYjAE4GBZSW7gJpvHBIQYsQHJ0uLWtiHCgVgkae1fG3abcFYSXlSVQIR
         +67g==
X-Gm-Message-State: AOJu0Yw5M45xkjZGWeBMq0wVxoNfc0No//TWr31wrjr9wz8DoppIuTmC
	Ro2snedtPBb+9UcMGSKsApiiDebF4YpB4g==
X-Google-Smtp-Source: AGHT+IHKFkuAlD0h4e3AkJ0WNF8ARdjW1VCpS5wQMzZCOmcCegPZbK0ots4osQH1AUJo98TISWUGDQ==
X-Received: by 2002:a62:b403:0:b0:6bc:b13c:35d5 with SMTP id h3-20020a62b403000000b006bcb13c35d5mr4966530pfn.13.1699900431785;
        Mon, 13 Nov 2023 10:33:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112093249.107673-1-alperyasinak1@gmail.com>
References: <20231112093249.107673-1-alperyasinak1@gmail.com>
Subject: Re: [meta-filesystems][PATCH] libisoburn: 1.5.4 -> 1.5.6
Message-Id: <169990043056.4418.7516173541230663629.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106655


On Sun, 12 Nov 2023 12:32:49 +0300, alperak wrote:
> Changelog:
> 
> * Bug fix: False -status failure with -boot_image --interval:appended_partition
> * Bug fix: -no_rc prevented pre-scanning of arguments for stdio output and
>            others. Introduced by mistake in a62f6af5, 2011.10.18.162119.
> * Bug fix: -not_leaf and -not_paths were not applied to -extract and alike
> * Bug fix: -report_system_area cmd misperceived -part_like_isohybrid with
>            -isohybrid-gpt-basdat
> * Bug fix: -report_system_area cmd misperceived combination of isohybrid and
>            appended partition in GPT
> * Bug fix: -as mkisofs option -part_like_isohybrid did not cause a MBR
>            partition table if the partitions are data files in the ISO
>            rather than appended
> * Bug fix: Split file directories (-split_size) were created with wrong
>            permissions
> * Bug fix: libisofs did not mark clones of imported files as imported.
>            This could cause that original and clone occupy data storage
>            in the newly written session. Thanks to Ivan Shmakov.
> * Bug fix: Partition offset was preserved from -indev rather than from -outdev
> * Bug fix: libisofs could misrepresent Rock Ridge information if many
>            symbolic links or AAIP data were recorded in a directory
> * Bug fix: Data files named /boot.catalog or ./boot.cat could be left out of
>            the emerging ISO if the boot catalog was set to be hidden
> * Bug fix: -toc reported wrong track LBA with overwritable media with
>            unrecognized content (pseudo-closed)
> * Bug fix: -find test -has_xattr matched "isofs." attributes
>            in -xattr mode "any"
> * New API call isoburn_assess_written_features()
> * New API calls isoburn_igopt_set_max_ce_entries(),
>   isoburn_igopt_get_max_ce_entries()
> * New flag bit12 with isoburn_read_iso_head():
>   Read even if start of multi-session emulation is damaged
> * New -boot_image settings gpt_iso_bootable= and gpt_iso_not_ro=
> * New -as mkisofs options --gpt-iso-bootable and --gpt-iso-not-ro
> * New -as cdrecord option --obs_pad. Automatic no_emul_toc with -as cdrecord.
> * New parameters "obs_pad" and "bdr_obs_exempt" for -dvd_obs
> * New -as cdrecord option --bdr_obs_exempt
> * New command -assess_indev_features
> * New -find test -size
> * New -compliance rules max_ce_entries=, max_ce_drop=
> * Allowed lseekable device files with -cut_out.
>   Proof-of-concept by Ivan Shmakov on bugs.debian.org. (Closes: #1010098)
> 
> [...]

Applied, thanks!

[1/1] libisoburn: 1.5.4 -> 1.5.6
      commit: 6b8877c3aca1e909878a80a9c9a6a7c684bf3a58

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


