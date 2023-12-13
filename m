Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D25C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.30706.1702451259030254099
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gp3VyJIn;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ceb93fb381so4804655b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451258; x=1703056058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAhW71+hzLhdE4/riyqXQZTaYd73KL1J6JKFg1Jn1e0=;
        b=gp3VyJInnAXkH4ne+zrOKbDXau7yJHREZq+tVNvFlzpsplB+lJ6m2ZMOugw5RORZDO
         suJ40LXhN+B545WEIeu/u9XJoWOXziVYIGJcD70Do8G9H67RT0+XULXfQ00B3T/PWa8n
         PubbKX+9t4cRWyDv0IEVOm4dfTpwWB2dXKBS4JPaSY8yDvkypc//1nPZHYz0dIecO9Rm
         wumXzAYRTU64RnL+qduAeldU7vKNYQvoTrm5HKmWZ5ElmMRMeHM2421hQ+baMB1OgHdC
         jEiyFlEvlhhUdyW3OEKTtnMdn7BRfIMH13j8jg5lvC3A26UhZh9XOcD1vFxUkz/pqkKv
         SxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451258; x=1703056058;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAhW71+hzLhdE4/riyqXQZTaYd73KL1J6JKFg1Jn1e0=;
        b=jZbFKocOsnN8HZtpt+Re5WdyF+wxNrUROor4b2XjXfBTwoaPbKZk891NR8lkfE/X/g
         wVss9CshGoKV6aRNvUODc+GiU44YUtp17mzVeorPcb1Lv4OirGbg9wVKFeSwpjYR7c3k
         TPG6d45Dgk5ACBnbpdOSn4PzI49WjiXCULb3RiezKr9NKDq7PK1gxRf7YqEocGduy/q4
         4Qw5KhrBxicjGM9mdUKfy4R8SWEI5XSTVsmyeZI3XYpn7xpT6epSD2IkLZh5u/ZZJaCM
         1OzHvXirSjWHChb3dE20x97fgBadFAwzx4NqItgVoDKO2qefPeKHqRTLN5FlRx43Z/GN
         p69g==
X-Gm-Message-State: AOJu0YzoOpXPytD21Gw3z4okG2KC4dLc/R+/5FnM3aUVCEH2oYrIx/HY
	7sxhPtQ+3bOxjzqnM0W64xx8oPhRWi0=
X-Google-Smtp-Source: AGHT+IGNlWR7S+iM5FM2+xsDIgyuzC7pMzz2mNO0lUOJXeqlD2smCLIkHejEbuFqUnrBtjZCidPeOA==
X-Received: by 2002:a05:6a00:4b47:b0:6cd:d312:b767 with SMTP id kr7-20020a056a004b4700b006cdd312b767mr8176067pfb.6.1702451258173;
        Tue, 12 Dec 2023 23:07:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231208082952.248187-1-alperyasinak1@gmail.com>
References: <20231208082952.248187-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv2] snappy: upgrade 1.1.9 -> 1.1.10
Message-Id: <170245125737.133993.12831748530943416023.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107377


On Fri, 08 Dec 2023 11:29:52 +0300, alperak wrote:
> * 0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch removed because fixed in the new version
> * Added fix-build-on-32bit-arm.patch to fix arm build
> 
> Changelog:
> 
> * Performance improvements
> * Compilation fixes for various environments
> 
> [...]

Applied, thanks!

[1/1] snappy: upgrade 1.1.9 -> 1.1.10
      commit: 0f0c4c96d90d0eaf78ef6fa93a150dd5fa8fa182

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


