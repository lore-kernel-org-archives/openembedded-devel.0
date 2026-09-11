Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1338C88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 11:17:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37290.1789125328416290806
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 04:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=SVJchcLR;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F01D602C2
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 11:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA08F1F000FF
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125326;
	bh=gLehc8uMoxhiGuvT71fkYM+KWdg8f04SqHasHRztFtc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SVJchcLRBbo0i/JkNp68cBuX18dfJa3rWVlnZQUbu2ioG5i8ZyidDImAKppuHe9ZI
	 yKrd+sxkE+/XXXFeRsQL03SAO4H0+d6M7mqUvd1tqYLLyYVwSQ+uMOKSoVI/03TFVT
	 oJKAeDRK1eKwgJqjhITUxA0+ViA11JIOh1QdmTYYr6LRviZStqTQ67jDUNuSVtXsVX
	 Y3M5kHbaDrvC3bJ52bCeBWhu5RARjJt03Vz0CxSSy9KLW2IxMLbiULif59i8FOr2dM
	 sMtpaY0JlETCrkrfxraP+LFp0LzrN1XI73kpcyEN/YRJrF1RjEBLVOktz02nivEBAH
	 GqZmZHhXEtEeg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so866133e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 04:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydFcUEAU/J3QAaEOZpXFTx3GhQblONNt4tPzgWZitNkJ9MYnkIAOYchYMkFd6KeEgz3mzev1u6qssG3wzwWgF/2Yk=@lists.openembedded.org
X-Gm-Message-State: AFuF++lSVOpX9dE5GEHcLnJOywyxulZ90u4YsgHuWlaYM1FbN8qguMws
	Rj6PzaJa9OepQ0TE0ZyXY0V0FQBpjTvWXfEBuO+GfcsIZCpC7ohXupqyRn9buB9Qn70RAox7j8d
	VWrkm6bADlwhnld6n/8VmOR1AgE+FrjFtNcdyidwtPQ==
X-Received: by 2002:a05:6512:1255:b0:5b6:1870:268d with SMTP id
 2adb3069b0e04-5b8a0326b25mr850594e87.62.1789125324325; Fri, 11 Sep 2026
 04:15:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 04:15:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 04:15:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
MIME-Version: 1.0
References: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
Date: Fri, 11 Sep 2026 04:15:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mds=MUhEd0OXQ_7J1d2JYdnuecUhqgaOO2W3dy-eD3wog@mail.gmail.com>
X-Gm-Features: AcwNN1VM0MiY8tyJnJiPsDWbl22EJlJ1sEFAozbUqQrmZvITjne7whzD1GOaieg
Message-ID: <CAMRc=Mds=MUhEd0OXQ_7J1d2JYdnuecUhqgaOO2W3dy-eD3wog@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] libgpiod: handle disappearing chips during iteration for v1.6.x
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 11:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129961

On Fri, 11 Sep 2026 11:15:32 +0200, Potin Lai <potin.lai.pt@gmail.com> said:
> Add a patch fixing an issue where tools like 'gpiofind' incorrectly abort
> with a 'No such device' (ENODEV) error if a hotpluggable GPIO controller
> (like a USB device) vanishes from /dev during the search.
>
> This patch gracefully handles the race condition by ignoring ENODEV errors
> when searching for a line and silently skipping chips that fail to open
> during iteration.
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

