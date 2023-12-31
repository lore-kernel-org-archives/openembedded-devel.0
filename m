Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAC5C4707C
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.198993.1703983124499238192
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+NxsAIB;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28cbca6dc81so251347a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983124; x=1704587924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6fd+zunnzpQNI/MQjt8B+fP2BsvE+1FYStnCvVWP+0=;
        b=h+NxsAIBEokL69Ouv7PxR10G/G9XsaDPfHrHW34/pC89Uhg88pyOoUr6nd9il7KwLd
         UY2K2h8Il/bgd6PRuEb+tV7fRfhA1jc9pBFktOtdEJMwINpXD8V7Wfq3ppYBFeO5jZWk
         7+3ATQMOgFVHrQkSGpl6ilByiJHJJaVBWaNnMqqok2goC11S9ZVeL6ef/tbfGR3QtM6I
         bCOThMkviaLjECXxxA41Z8DhKrc2ASJfU8qGFVKI+S7sRGBygX2O5uw9riFQoK11pFd1
         VucMZY6HFOPghcP0uz1D/BmKtxSxS8Kn9ozbMPvapl9q4N0PyQKqB+0JxZh2J1mIwI0D
         vbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983124; x=1704587924;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6fd+zunnzpQNI/MQjt8B+fP2BsvE+1FYStnCvVWP+0=;
        b=wNos8pvOlU7AQ7CiJXr9f61DfPmS57LrvK2ufyYEC6yDmqTBqg30Wh3kpO1iO0Y5G3
         x7lTSBT0HhSa5NjKSr0pQEtesgYq+hhMZtuo6ONb0QAUsXPyZDg/4XPmY+4BWRyWgshr
         sCPwtlj6KkwJkgHf9RJtynBgPQEkUc5AsCN1TCkKvbO1I6/a/bb2uPhfvuwN9P5QMPin
         WsfjVxMxdYfQk+LR/jwLx1UgrN+s9wS4Z5rCz2L4wpQpz//SJlBVJ9k17kZALJ4m77xQ
         oQ8RmB3bFed2j/jHUwuCoNxuB3RP5NIBOD73F1N6yaV0O0p1Zl7ILNV1q8V7MXsbuL8u
         jk0g==
X-Gm-Message-State: AOJu0YyJze1l/aw2hZdHBRqreGRSqL7sGuLerOQcluc3IZ3h+b9XSKVb
	PL0yIe+q3x+Lc9uMQrZYXJdE4/y0fig=
X-Google-Smtp-Source: AGHT+IFhHD0JzyE+2Ti8Ss/g3ECE+HhGAdgyx4fS+2xrp4tFAnn7XE86VXTTCacWaF8AZVOFWiPpcw==
X-Received: by 2002:a17:90a:6788:b0:28c:aad9:ac6d with SMTP id o8-20020a17090a678800b0028caad9ac6dmr1494900pjj.15.1703983123878;
        Sat, 30 Dec 2023 16:38:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, changqing.li@windriver.com
In-Reply-To: <20231227025557.2872013-1-changqing.li@windriver.com>
References: <20231227025557.2872013-1-changqing.li@windriver.com>
Subject: Re: [PATCH][meta-oe] redis: upgrade 6.2.13 -> 6.2.14
Message-Id: <170398312312.873206.5178401155605773681.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107940


On Wed, 27 Dec 2023 10:55:57 +0800, changqing.li@windriver.com wrote:
> Upgrade urgency SECURITY: See security fixes below.
> 
> Security fixes:
> (CVE-2023-45145) The wrong order of listen(2) and chmod(2) calls creates a
> race condition that can be used by another process to bypass desired Unix
> socket permissions on startup.
> 
> [...]

Applied, thanks!

[1/1] redis: upgrade 6.2.13 -> 6.2.14
      commit: 5b34766daadf8f1e8ef3d55b24e0037c4d0727f5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


