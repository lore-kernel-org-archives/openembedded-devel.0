Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4038EC46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6766.1702967254228591336
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fF62D/9X;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so18497515ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967254; x=1703572054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/k8sP5y3S5TaWvB6MSf8VVDZxziZ5uHtfr9mOakowh8=;
        b=fF62D/9XNkHQhdsqGcChF2s8eCE6aH+F8AczE3Chc7kkRrbHIzu5qw1P6FmUHwlT/l
         uij98Zrni9vYvPkJG4SU3yNvmcbJd5Jwp3PiOmbmYGRw2hMbtNFdvgeR5odIz/t2Qcq+
         15kqaVFsaSG8g5EeJgZF2b2FkJPz64Hn9jxWIlsEz+X5OtUnJDZMfls77bsUTh8q7kz5
         08egsR2gbYBQcTguYDJ1K13S10KzRZmUGVy19iMVwhinElgtdToo+ziMHo5Ku2VA3UoE
         8EugWzBJwkuiL8wYvTppPUjru1lD78M9M3SF9GSygqaU/XVd5FmFMee9bVVIpBhageeW
         aRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967254; x=1703572054;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k8sP5y3S5TaWvB6MSf8VVDZxziZ5uHtfr9mOakowh8=;
        b=tsDjOABlAvzi25caKIusBMugnmZ7ivc9qZB8Ff6v+IcrKa+cBaMIP35vqI/Y8LbGls
         EYDuAb4yVakLA8bRSNGoiT0RCYX76X+GkeSXiILhLdVBKtBYZQiqGQ23smzo/IsavE5E
         4zo8H+6lrNqJ54MRGU7l1RTnRhWp5WQac+OTWpVuNdU0YKCEAGGcCq65XdPimLWvs5gs
         DRSlRaimQnm7jX9BFLfJ3WMLRpiRvNEfJOrE5UIH2EQoY9SUs2qCn6blW02YFvJ8oboT
         Ls04KUEB9/Zexo6L/v7MnCclHlasxCWPXj+OnUfMDVI0+wbqY1bLiCphCxQB3EoMnffV
         9gHQ==
X-Gm-Message-State: AOJu0Yz7acEfG6FT8FwXyBfJ5VZdN/9fBtfy4soJumACnAphpK/i+6SK
	kz9JwBzZ+MATEo8eflHqcekkXclzgPE=
X-Google-Smtp-Source: AGHT+IEGhzaL788phXsHSfyAChWwZNyJgGm2Sl2a80p5IqY8DUTnRHO9WFro0brSkiaPkB5/OQSBDg==
X-Received: by 2002:a17:902:b18f:b0:1d3:4cbe:5dd7 with SMTP id s15-20020a170902b18f00b001d34cbe5dd7mr4719822plr.85.1702967253650;
        Mon, 18 Dec 2023 22:27:33 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 mgupta1 <meenali.gupta@windriver.com>
In-Reply-To: <20231214103812.512113-1-meenali.gupta@windriver.com>
References: <20231214103812.512113-1-meenali.gupta@windriver.com>
Subject: Re: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgrade
 1.25.2 -> 1.25.3
Message-Id: <170296725288.1627685.15808203001904107897.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107593


On Thu, 14 Dec 2023 10:38:12 +0000, mgupta1 wrote:
> Changelog:
> ===========
> https://nginx.org/en/CHANGES
> 
> *) Change: improved detection of misbehaving clients when using HTTP/2.
> 
> *) Feature: startup speedup when using a large number of locations.
>        Thanks to Yusuke Nojima.
> 
> [...]

Applied, thanks!

[1/1] nginx: upgrade 1.25.2 -> 1.25.3
      commit: dc4bef4648ea5ff73230ff2d343f498c93bd333b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


