Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBBEC61DF7
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.121189.1700784072598875053
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LD9MBtdD;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cf6bdf8274so17214465ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784072; x=1701388872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ACzZNwOYSe2tLFqo11EhCYwVEP9oPEc1DxqVe6YRIA=;
        b=LD9MBtdDJcqe02PwFdn0zdAtTV2F5GYqm7Q6std+LES9E8o1l2JrqppuyBRSYRK0ls
         SiPkKNU4fihzXq522kgyijglzHNWMBYMtB6gSi9/XUzy17KyRUAFRjARWJ1ZqNNBGLky
         g9nkjuwBtKFMkOiOppHAuBqRLnnRz3EpRm9VL7HNZRgxg4N+a04DHLa0jz1bntkzteQz
         3o4THUs9GRjlMumr+e0N2PgC08KPG/MNUpkysSo/XqCWwx93F17aShYFO4XJpm08wPF6
         yUGDZfC8ULz0ofWbsDlaVvrnIu+mOCWQcAJXt0Ar+PVHbWTtBr5Qw3RTnfk1ElMvrqq3
         XqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784072; x=1701388872;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ACzZNwOYSe2tLFqo11EhCYwVEP9oPEc1DxqVe6YRIA=;
        b=fmZEdozDIUFLahaddFEUfBBYZMW+HT9G/nGIS9eFwRjKmo+ouUmMWSceOdIFxd6wLW
         v29A3cuKHbT106q4S3y7kKY2wGQ9A/sBdUfVfk3lauIdHSuFg0hLL2LMsnKjcCgW28Te
         grQ0D2FjUq+2QeIfJ47q6KpyysMYiYiENnezybUTnRH19XhP3gSvtkjm1FjgvZigx01c
         Np1fPbAHSuMB3utTCapUi1rUFD+aiyUQuHEQvv0St58hivwnBWDfr6JqcP4Js4CDHYs+
         mwYMot2jMS0JCMhnH3Zh9V+N5z6moPEQTNd4a+E+5VvCpdiew4JVkrYRWczFPZIrVp0H
         Gchg==
X-Gm-Message-State: AOJu0Yw7669WY+mLcdZg46LyorRYgOLfPGlTw0deJ+4DJPJAXF5Vw5nk
	dj6IvQLMHYjzzmb6XRno+TqIeNg4LE1J7Q==
X-Google-Smtp-Source: AGHT+IH3FdVVI93UTAMoaCvcwxDo83eLjUn1sgyNy8NcayeDGNp+M0L+nMGidPGl0VG2bcdQ4dTyuQ==
X-Received: by 2002:a17:902:db09:b0:1ce:6630:1585 with SMTP id m9-20020a170902db0900b001ce66301585mr1083842plx.23.1700784071854;
        Thu, 23 Nov 2023 16:01:11 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jonas Gorski <jonas.gorski@bisdn.de>
In-Reply-To: <20231122093934.117102-1-jonas.gorski@bisdn.de>
References: <20231122093934.117102-1-jonas.gorski@bisdn.de>
Subject: Re: [meta-networking][PATCH] frr: fix CVEs CVE-2023-4675{2,3} and
 CVE-2023-4723{4,5}
Message-Id: <170078407105.3118595.4289198157117362825.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107042


On Wed, 22 Nov 2023 10:39:34 +0100, Jonas Gorski wrote:
> Add patches fixing CVE CVE-2023-46752, CVE-2023-46753, CVE-2023-47234,
> and CVE-2023-47235 to FRR 9.0.
> 
> Patch order is commit order, not CVE numerical order, to avoid fuzz /
> need for rebasing of the patches.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-46752
> https://nvd.nist.gov/vuln/detail/CVE-2023-46753
> https://nvd.nist.gov/vuln/detail/CVE-2023-47234
> https://nvd.nist.gov/vuln/detail/CVE-2023-47235
> 
> [...]

Applied, thanks!

[1/1] frr: fix CVEs CVE-2023-4675{2,3} and CVE-2023-4723{4,5}
      commit: 00e928bcb7e933ada8e67f3bfa887988d1ca9d61

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


