Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC93C61D98
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 20:46:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.4438.1700599562036500428
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 12:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=meywFpds;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6c39ad730aaso4925402b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 12:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700599561; x=1701204361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1fv3Os7Syu+6qXk+lVe9lNdVxjxEKq8UTuTXh60nT8=;
        b=meywFpdsLmdBJigtsKCwY1DoQaBjBJd2kF1HdpS6KZS51TPop/djqcWvSu6Fo/QgSH
         YaEdWfYHVw/2QFnednAbkTUyfzqMn/Zd1K+iTTeVu+aAfYhU0lSmW5djFHjKz83mCokL
         RHH7VmxMBpZHyWTaDYbbtBS/XXr1+Sc1Co285KrUbtsTbfAKxbUFqVRKf1nV/kLl+9+0
         C4r39hnp/G/Z6mNyYg0x3lo2/iXWnqGzJ/dG2bXYORCb9zCoOqcg57776oac0dAu30BH
         NqCxnwLFWn1Zaf596LdCIkjJ9O3ca1hbZ0d0CDYTZmPLBZCLA72zZP/Aza9AGJ2SkMpf
         SLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599561; x=1701204361;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1fv3Os7Syu+6qXk+lVe9lNdVxjxEKq8UTuTXh60nT8=;
        b=OA3T1H4GSZOzRuIcRaBIpj/W0kkq/WWiPlvCYvsUo7SBxYsEvqxHkvAKS/em6DKQ6x
         4SzNU9mpxrAcgmqHHShogM2SN/glO+72pRUMfwsB4IqgTM+jA5/Q/HopFrGaXxHH/ft5
         MbnkYXzQVU3uKAnak7CweXd5vHBL4NVUuL7LHgnj3Ufe8hNHJ5tiWMDK+IJ2bkfTzQrL
         4/oFBx+oSU2P+suEtwt4oxidRB6I2ywFuKUuuHjquVzB2QsneIM07lNk+tSVmJW61BaS
         xjBsrAfIaFuCDWdNOFg6zXyHbc8lcclTZIQLYDnZb59J+4VpJqaG2esr3eplu7BKdKUo
         3Czw==
X-Gm-Message-State: AOJu0Yw0hLX1LgX1Sp9kYv7e2c9v+rnI8y4N8w9nkPbAzzb71CqImxKq
	SiDeBYtO6CSbAJAj8CpbK/zC8c6VeTuaGQ==
X-Google-Smtp-Source: AGHT+IHRbic8cd3rnVr9IDFXyMWxDVxw+4D8S///xai3FzkPRCRQOUitaEdTwOqJiM43ShrV78URRA==
X-Received: by 2002:a05:6a21:6d82:b0:187:152d:c1e2 with SMTP id wl2-20020a056a216d8200b00187152dc1e2mr193940pzb.46.1700599561123;
        Tue, 21 Nov 2023 12:46:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id cl19-20020a056a02099300b005c1ce3c960bsm7142465pgb.50.2023.11.21.12.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:46:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231120174725.2758863-1-f_l_k@t-online.de>
References: <20231120174725.2758863-1-f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCHv2] musicpd: unbreak build with ffmpeg
 6.1
Message-Id: <170059956046.4811.15600370170233032797.b4-ty@gmail.com>
Date: Tue, 21 Nov 2023 12:46:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 20:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106984


On Mon, 20 Nov 2023 18:47:25 +0100, Markus Volk wrote:
> 


Applied, thanks!

[1/1] musicpd: unbreak build with ffmpeg 6.1
      commit: 1e086c487d4e68ec011479884de17d3503d64f76

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


