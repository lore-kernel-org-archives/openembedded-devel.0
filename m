Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC81BC54E60
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.27098.1710706705845528510
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i9u9rgTj;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1def89f0cfdso12995135ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706705; x=1711311505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXfAGC7ahNEZM0mhsdPHy5YMiTCXiqv02DQaeIjVsfI=;
        b=i9u9rgTjuubAO6HWkEsq1Uf4zOzqDn2ILqKietTRwaop9pPLe1lXd6+UcXebQ3auy0
         S0vn2XYcaoACQSgoS3+SOkCSZuczQlLfIdqIQeBSJpzDgn8z2j/hMRG6GPYxeFpgX9lC
         55RT0dgBmtM4+9Ld88vpOKqqH/HM4OSs0Zxs9iYzPHnGbZTP5QJPVmTzflDoEtoVQ5F0
         RIoW7WKMaA9ATvAf8NEHE/N5NHCoyfntqni1D8uU+gIS/5NBKtueyUk/22bLnGFB6WzX
         pSuu53B+oiaznriUpk2Sm9Fj6ORl4h+nzYC1MhFdnKC/Z16mLGJVLukN6hsyzbzxgwIx
         faZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706705; x=1711311505;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXfAGC7ahNEZM0mhsdPHy5YMiTCXiqv02DQaeIjVsfI=;
        b=w4XeyRRznhDf2fN5T1bKfUsRzzPMasODhJtBela0zGwpA2e0I9yyy/iuSnfBwGNR38
         wcmA9OnDJOyWUJdE6YtvaK32w/YuCbiGHY3JM1pUxfcMTrI1om5l7Xqld858/peDaZEF
         2WOCrJ6TDX7ea7g3UItgkTPFcyPiRqw18IMlPRkWNz6C+caQ+VCQMivGB0SaNJt5K+Lp
         q3TpE7/BQCeRlpZw3ANceyt5Fwvfky3oOd4SNO1b9M+jQwkfhVBn7gjRFHp65WsiAfmN
         BSuGcIGgVAY8KliCHpxrTpFSFO86BprNZ37P189RQbcXLGMjwWh7epGOJohpfM3Lo/t8
         QMMw==
X-Gm-Message-State: AOJu0Yw03z9kY8Kpr1FkNORvkA4k6V4Z3kFoF0qqEkCvm0TWsEMXXAko
	Opc1zqWJhRasXs5yUkQ8MmOOMRhBvA0Ohm4Vzpaph7zdwmlhzwQMgVaTxiF9
X-Google-Smtp-Source: AGHT+IHEqiiNHZc45CqsdGoN6Ln+WlT4+xFS2Lp6ZGVTvyXfZz9tOrqrZCN+jrtRcqEDPULuXL5GAA==
X-Received: by 2002:a17:902:ce85:b0:1de:ef87:63a0 with SMTP id f5-20020a170902ce8500b001deef8763a0mr10910343plg.22.1710706704995;
        Sun, 17 Mar 2024 13:18:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
In-Reply-To: <b25d5c76ac9cab023880ad8bb9ab2e729bf26227.1710407405.git.joerg.sommer@navimatix.de>
References: <b25d5c76ac9cab023880ad8bb9ab2e729bf26227.1710407405.git.joerg.sommer@navimatix.de>
Subject: Re: [meta-multimedia][PATCH] spandsp: new telephony DSP library
Message-Id: <171070670357.939783.15066228098655611709.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109383


On Thu, 14 Mar 2024 10:10:05 +0100, joerg.sommer@navimatix.de wrote:
> 


Applied, thanks!

[1/1] spandsp: new telephony DSP library
      commit: 6a2b29e98d77de46a2885eff15bc8e4bc42e9396

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


