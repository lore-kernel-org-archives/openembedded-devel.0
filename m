Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD90C46CD8
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.6745.1702967235177891039
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bpJ7tBej;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d39afa1eecso24231345ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967234; x=1703572034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TCYNoVtFSF6aLRGkRYvwDP8w304wLQnpNBXu7i3plY=;
        b=bpJ7tBejiBPWyE94C4X97h6ZDWFt//i0eERPM7IwqnPFvOYEJl6EnDWitwcNFYlH8H
         xi/2lowpCJkYfM7U1KhAdRpe2tiiAVCesF2vMrh5kOlpfAhRGUo4G7yDCKulpzZILhcz
         p6qn+g/wxE4YmJKVU83wO7PrxqxkPIQisAFfMPUFlVqDeWAIBOgcRnzXm+PB6NluAAG+
         yAmwvx+JQpZpfQbc7DxAoAnYqSRWHZYFazPTdatwGOnGdSuegyCLoQEzG/1i7LamLakU
         GFBvoWzZK3ARAbFB8Oa3jMGwe3ezXTgIOcCXSJ1hp1HwWxhqQhejdnwMetUSZRA/vIKo
         A9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967234; x=1703572034;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TCYNoVtFSF6aLRGkRYvwDP8w304wLQnpNBXu7i3plY=;
        b=Mf+ANVxbS/uPNujuPeKuwqp3gm9kWJ+C6cNGjE9jaLRCNMy7ggu/9Ci5L/aQ6ZSwym
         0p087u2GwY3ztGIYd9QOXvE7Ex3w31QBitacZBpEcGEDvuHv2bExormo7AcBTMUQUtdJ
         43pcotBvxr9DS+w2r2b30XHhru/LHx5FdXzeLKLW/J2CSCrYh/7/ZcN+abDEd7152vP9
         8F2tWlwWZT67VEPenafdvlsqiMrNTdoQzffscmr7Ij3eCJZFCJwnKy+wrVR+WRqeo/f6
         kDHAALaJzrR/YB6u8CpD6v/qDkliSc5kLlh+C+cAdn1oXdGkar4pFWd7B2z0vdIUcAPQ
         Z45g==
X-Gm-Message-State: AOJu0YxoBbSOSgAjKPAf06JpsIPSl7s8loSrC6sFQVO2EwvnLHfEA0mj
	gIvjfooNSyOqzuPeyjG1O6c/YocC12E=
X-Google-Smtp-Source: AGHT+IHSexJ4Vs96H0vkhpDu881GWnTqyFsq0/CSVk4lpiVxWDYBkQv9S4jVxDyWi2a5Q93opQkF7A==
X-Received: by 2002:a17:902:7ec1:b0:1d0:7d0b:555c with SMTP id p1-20020a1709027ec100b001d07d0b555cmr14857969plb.10.1702967234480;
        Mon, 18 Dec 2023 22:27:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214052140.1209348-1-derek@asterius.io>
References: <20231214052140.1209348-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-gmqtt: update to version 0.6.13
Message-Id: <170296723376.1627685.4367118555540088104.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107570


On Thu, 14 Dec 2023 05:21:40 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-gmqtt: update to version 0.6.13
      commit: 4497eb3096d803216dde00b2628992cf01b83afe

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


