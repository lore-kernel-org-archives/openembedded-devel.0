Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C354EA3F0C
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 05:51:12 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13965.1770702665153099572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 21:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fDdBe3vz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so6342805e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 21:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702663; x=1771307463; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7HGEVo+oyeKrrDY8pU6CmNKVdIQcw6TF54wyCsVeMQ=;
        b=fDdBe3vztA2FAtdamXW66pFF+F+ilfGDovoA12RpM+7IijJYPf8iSTxuJ4hS1V8Uq5
         FuW9t99Kc1WlRZyGfY55Ac9zAlbfp93Sr5T+KaYPMucMdFVY89D9iyahGKbTS8mc2++u
         eWFYa6XqZHkApYuJkwWrbbU+NE8ptBcAIOi98A72yM058UJf+9wjKf5thqM/ie82YWn9
         RLvefR+qlQ2H+mjyC35FhFi105a9uol2GLfMB6hi2vFLk6TgKzaDrsSzzaOcZqflr51D
         32n2Fzet4PguEYGH7+ULCsgIfNSwtRmxXswYocAbL+auspPqiQK9PcEJq5eZG3zN3Fy8
         Q9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702663; x=1771307463;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7HGEVo+oyeKrrDY8pU6CmNKVdIQcw6TF54wyCsVeMQ=;
        b=GrnJy+U6ewoG18wk2LF8xCBEQLxqGnrtiREG4faA83Dhc3OmaZ1Jl0CaAd6lWThpeJ
         tdrq6h2IvLjD9Ia2KpRaFULAEI2UmOFG1Lm06xOtCBdjChnFZ1hOKVU79vtIM6spuYm5
         no5vUFnCAfuhyhh9Vq1Rv1gN/j8OEzR0ZOl5BCoiBFV64xxWShJnOzLVIqSQeRFrV9NP
         k6xQ+5/fAEuTuBUp52Zf0dPabrb/OxZkJCVs8QMAiMcCB1JNv7DR1Vc4SRx12c5hZMPw
         UdRNhgfhXnxW/yKraOzZLEEeh486dPGzK+5X1aAVpeigyMLDTY2mriAHQMDdlKUwSRNn
         AHDA==
X-Gm-Message-State: AOJu0YxOOXaqyohDnZfLNO0ftzHvnHguSfLqo3TLuIQHPInPUZPL7I1l
	SK3bVK2OnI3PNwbKA2+tXhpNJdkO5qLwweG699UcuBlHQcJCCEoaklM9szjLUA==
X-Gm-Gg: AZuq6aL3Irv+0l39W7cQAg52FXudHFKPxfdW2M29j+pSlXE3obgIU7iBZ8Rew26LKEW
	g5gd1F7ADqoes/I09aA4kblJBxnNuctBOeY2tCYHAYyHPqhXtLGnGEM0vxJpadjhVJ0Woq8IHJ2
	E3zwV5tXLbeEfZXy8x6HD01JIPs6uuLOgbiGO03oaiAc/kcTuGgGzkw3hhdTIIRSKf53o+FDjm3
	1fKi+teoni1zxoUuOlt0OjZgYuynU7ObjhIQd6XvE/kId4ovhRHuM1gWMiIzMz/xgidPRj4EbnG
	25hI7BziiD5Y8GixMNidrhoNTgvT3sPV4VAMEwlghl0MlKHJyL6p0Y6FVvVU6cI7huhAL4GvW8k
	XzVfDK6UoqrqI6cZXiwGvO/Cg0GcoHGpcIDwyFwVflXo/STeJJj7reNwWuQHdPTAH2rELOcjYLN
	2kls4ApcxVJkBtiLNtr8+TlOpVhgKK/T0=
X-Received: by 2002:a05:600c:5290:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-4832020023cmr193921265e9.7.1770702663273;
        Mon, 09 Feb 2026 21:51:03 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e64b0sm41949325e9.11.2026.02.09.21.51.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 21:51:02 -0800 (PST)
Message-ID: <69c1dc2d-fa53-4f59-83aa-5677d6ebb7b7@gmail.com>
Date: Tue, 10 Feb 2026 06:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Call for Kirkstone patches for next release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 05:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124317

Hello,

The next PR for meta-oe Kirkstone branch is planned in the first half of
next week.
Patches that arrive until the end of Saturday (14th/Feb, any timezone)
will be considered for inclusion. Patches that arrive after this time
will be part of the next merge cycle.

You can find the currently queued patches here:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Thank you,
Gyorgy

