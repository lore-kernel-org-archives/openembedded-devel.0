Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED67DC07548
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3152.1699900436018433214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1NFJSYl;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so4897295b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900435; x=1700505235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlkSTdTDI5ZJ44YiCBo2DxJBtE6PDirG4q/jlAvqHX8=;
        b=U1NFJSYlzBhNMXad+/zdEr8Xt48ElyWjQEx6Vs4SeUSqJOPD5T6Xyfdtvy/Yp5nNg3
         BiuFFuppcbjy1jmtSp11Yj8vQ/pQz03ziiQ8tmOYHwcNHFv37BYfALxyELbd80hptblV
         ru5QfZgfUaSAlxzgnqPPeSZpxsZuV2FHLHfIm7qOoWAAiFk2bcyJFo8hrQlYgXyFdgX7
         +wp9xtJck0rf9SpnH9ii48W97FsiplUgFjCqZQOkw/pzEBOGUjtEJpuNX6HG3z3FPjWL
         whuYaEJ8Cd8P6gGE62pj3v+xL86SUFqRjsRxu9r7dmq9trnHCKPozsAYtqC2047Bb1nU
         yXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900435; x=1700505235;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlkSTdTDI5ZJ44YiCBo2DxJBtE6PDirG4q/jlAvqHX8=;
        b=iHdZBVy+WFiP8xsUZvuvqGNJDZ2Yzt+BV13jrnE2+fbHts8NyrbRFQ5BIT2upV37Q5
         Fbfcqi8aLCKZVflxCOT2HEsDNW2vfs16SDObFStY7NsUqfNK9jsncCgmDmrVesplrQmk
         v83MMYHIoSklWEw/WedOJ23Yt0CFPJ/8RZZVFn5Jx224FYPE/I//e403aRqfsL6H1ycI
         5/8kPOnYXogDgQfiJbNIQ3VX04XlORfY3IG+bFHDt3F9GuclfufjSImAbWH50FiuxY53
         cSm9gM6SmBifU5BXjAUY1waWWb8G8Q31U4x97PRkbjq5FOVdz6NEzjR15HB4OzqD11hL
         d4Lw==
X-Gm-Message-State: AOJu0Yww9xe+xvTvxOM2oVUFXpMMbGmv1OqJHlaQk04T+SwsU8nGMFYk
	m2k7juAKubblAOFyso7HszqHnwaoDv5Iag==
X-Google-Smtp-Source: AGHT+IER3sGawW2OOz8IBeCBFPzOrjiWPPY0gJUuub9S4QloWsvLC/d2XWOJbO+dnoml9eMvJEWVmg==
X-Received: by 2002:a05:6a20:244e:b0:186:3083:4a5f with SMTP id t14-20020a056a20244e00b0018630834a5fmr7353525pzc.59.1699900435129;
        Mon, 13 Nov 2023 10:33:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112110026.139849-1-alperyasinak1@gmail.com>
References: <20231112110026.139849-1-alperyasinak1@gmail.com>
Subject: Re: [meta-filesystems][PATCH] ufs-utils: upgrade 3.12.3 -> 4.13.5
Message-Id: <169990043449.4418.12948776576429824367.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106658


On Sun, 12 Nov 2023 14:00:26 +0300, alperak wrote:
> 


Applied, thanks!

[1/1] ufs-utils: upgrade 3.12.3 -> 4.13.5
      commit: f946e6ab92d0fd1fd3d52b06e05eb374d6dedec1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


