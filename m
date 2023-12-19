Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6707AC46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6736.1702967225628589449
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acm/kdZf;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d3ddccfaffso2083425ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967225; x=1703572025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwl2VCJu4Gr4kV6h0zn1zvzuzyv9IvZ0Kh+6npMw+3E=;
        b=acm/kdZfV/IsrbJg1S2ZTHILhWemmEBSIj1r1SQDaiTwpzEbJExx1xlaxKuEgDkUNF
         mtyYn8iwKdsyhZkeRx+mzyXduM3O/C6ao9+q9/2sD+TjfB+VSgBYEQ6FrixcKjgqtDR3
         7HgEzZL8sg3VHACeCiIBW3fhGO29RLhomialMwNar5LQRDUXNLOZy+J0chfzapnJkzpX
         bM+826+TFrnBXnOdnyuwqQPa9A3q1AoznKE61QtCerJ8+zDMa7HFH6C+uwDUWmaGuCM8
         ZMHx0pqj/fcsnZNSGznqufteCYmgoKcEag9V/eG4F8xPHAD+M27S9OexGaCe9c59TO6X
         KjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967225; x=1703572025;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwl2VCJu4Gr4kV6h0zn1zvzuzyv9IvZ0Kh+6npMw+3E=;
        b=EagCIy9zVBhxpgVjQd5AnlbNVKJZCg9afNsrTBZIEWsGDrOkO4UYXYx7S+VCJhKx1R
         cRP6YKgTRQAQIg8wskVk8wsX2neAuwNgRlEzk0c5NBfXwBugfM1MiiwwYAUIlllo7mxw
         I2IPxQQzEQPm13A7QrqtxYhkVkqBL/V4LaHy5AdDQVB6dPotNhPB7/eFJhF6613iVWk+
         Oo3/8kNOrpwwMXrvgNPDr7hvLCDpcp6mPkjCCofangeBfjmw+Py0CihoOGQeyayaoIX6
         rSnXNjjBLsFlBRkAtiU16EiI+LQc+O9epny9WwiZ0WSql0inRP7WJL2tu0Xi0N/KzHy3
         Pibg==
X-Gm-Message-State: AOJu0YyDJ1yvm0mHnDikFx+qICGJEucuySANyVJw9FmFpt8JGkxMxx0T
	fBskg8x5O1WAewl9JFoRMifaLbVgaDc=
X-Google-Smtp-Source: AGHT+IEgcbze7aUALs7Z6wwiWbb4MxkHR0PimoPrWp/tuyfjnAncuewWKKVqYil1TtQaetAU8b3ZRA==
X-Received: by 2002:a17:903:40ca:b0:1cf:e100:a96b with SMTP id t10-20020a17090340ca00b001cfe100a96bmr19223910pld.9.1702967224754;
        Mon, 18 Dec 2023 22:27:04 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214002208.1136041-1-derek@asterius.io>
References: <20231214002208.1136041-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-cmake: update to version 3.28.0
Message-Id: <170296722396.1627685.4967939253967293113.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107559


On Thu, 14 Dec 2023 00:22:08 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-cmake: update to version 3.28.0
      commit: 2e864f1e201c39aeb9821f03ac7fcf24f19393c2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


