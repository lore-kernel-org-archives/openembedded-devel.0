Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C70BC61DF7
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.120982.1700784057878411728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D6+oLpQ4;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cf5901b4c8so11338415ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784057; x=1701388857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2cnZNszhzKl5lQ2rYvMsu99Z1/w0nkzQRSbF8PJOlI=;
        b=D6+oLpQ4EEvfVLjCLSZ3j7ffWxqJ5Dl4uVqEIJvRRtc3ad3PDx2HPTLX5otfWPtCii
         vMGsH4sd88j1HC17o5wbgNGxCon3HGYTg+IiWGr9oquGf5pqR42qL5ajd35PY3vCasqZ
         uTR+eTBKy9lPWW/Xt6hxqdt1oYJQ07hwc0QVaNBDwAnTIyb1Ags9G+INncwUmtQeTyNS
         NNuY/gwOxw+zkpQDGlrE7oAOYB7SJmx2gMw1TFblAGeBtCuAOShB8xKNK3vW7NCphtMh
         C23byZRyVwjovvLG/2LqbEG9RvtAoFanwayPnWh+xpLIOFCYZKYXISzsm0Ax8AIlRDnC
         tQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784057; x=1701388857;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2cnZNszhzKl5lQ2rYvMsu99Z1/w0nkzQRSbF8PJOlI=;
        b=lJhJ8z6VzUokZWyYkr0KoxGKmsOvehhxLycg/sd96DSlzUyal2x4vIt2hu97RGwAci
         tEAGiXTNR/kBcV4mSMRCu5T1cQ6vj8WHysuz1C1JqaA9+tsyK7QuTyhFGMyxzIOQ8xQs
         qsW/93nACRP8aOq3rAbj2o5APoam1iiAh3jOORDOdHTlqcyj9zksbd6d0JSa92tXCH8q
         DLorhIvoUW6TlQmRrG7eG8gw1Xrkk3iamDNq0uazSlJ8mwewp7VMV0LWp6btKSveGULB
         iwiLYILwaz+wEKbvg+vDmf4hVp/RJvpqVmYni4fU1Z/3rhZeMNaliVDHJvEEIsilJTfS
         PBVg==
X-Gm-Message-State: AOJu0YwSV75Fpbsmc2r4dF/3Zf8jpL9bP3PyeQsfJI/pDZ9hbUO2xiMo
	hA+TJp1pAnw4TDaZWg1OCYZtsnL+bkUU1w==
X-Google-Smtp-Source: AGHT+IEgn7D3IDy7Zs+peCsf36oFz+MzTISQXLCVet24rmhu+hjBvw6mSDsm7AzDdy/i6qJADgPi1g==
X-Received: by 2002:a17:903:2783:b0:1cc:43af:f568 with SMTP id jw3-20020a170903278300b001cc43aff568mr1073329plb.6.1700784057058;
        Thu, 23 Nov 2023 16:00:57 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:00:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700633709-7666-1-git-send-email-wangmy@fujitsu.com>
References: <1700633709-7666-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.22.0 -> 1.22.1
Message-Id: <170078405618.3118595.12449578816507575098.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:00:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107026


On Wed, 22 Nov 2023 14:15:09 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Fix /etc/hosts processing performance with all entries using same IPaddress.
> -Fix typos in manpages
> -Fix OpenWatcom building
> 
> 
> [...]

Applied, thanks!

[1/1] c-ares: upgrade 1.22.0 -> 1.22.1
      commit: cfb3134cfb9b22ff3fb0b3d202a93b3f659fbb0d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


