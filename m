Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EA1C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.3231.1699900443548756621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QL/f/+AX;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6c398717726so3988208b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900443; x=1700505243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GmEbdsxWsssPru50krRyJtoxpdwPEzM0zQFd5E3HLE=;
        b=QL/f/+AXlA3Q9z67xaWIJpiu0Ptg42YRsrYMC8xCxIKmCn/9Nk/dngj0DVe0KllUD/
         geQ9iQdlQAye3ykMZKjFbvSCkythiqBb9cnxFSY5WU+u1iMQgM4N7HJRG/VIXAbb0j+q
         +HkJ9FyEF3gwMUP1CStRbSM9GvsaE5lVFKkQZc4OZ3Fnb2+j/BUZmGcXahwsN1/8y0+t
         6rdnyQH1Uy6sJPCGt2hlGbxVxQ9fDa4JyX2o1EyJBhkYeZsv5N0TZ3hLAhH0QFmA3X66
         E/89mp+OHElB2QBwn7UJTlsInQmAM2lQ92MGD4MMEGH0C6i74JLt2tKCVDGrXLA11Kif
         pv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900443; x=1700505243;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GmEbdsxWsssPru50krRyJtoxpdwPEzM0zQFd5E3HLE=;
        b=MUypWYDmdV4Sjq4NQwIFgwCNxyXDdixAYVrYB6IMSEUGeRD0/Hr5thJSzN4qdRPNg9
         PaQ1/KGY1ydVHXErtyWQJhiNpwBr/BHGnq9r2NqMLvzrRaCBVWaiv96KRDT4yp7fnsf1
         RhhdUrnWhSL8I6Y0xvm67M4mXAG3uzjIzbt2qSWFMmAhhmJM0EhNUI5RUScVwqJg0p4M
         PWkPhbDwZXkdkUT5pijmKW95WD4cUQkrXDLmW/iScTidZPgGdRUDIkyivW7law/Ci7+N
         lGDlPUOkENZsPU+nZdbaDUJ+DOKEICW0uMYH/ig8/4t8f5PkFt0Roa8mzpXYMDXrSpsI
         BIWQ==
X-Gm-Message-State: AOJu0Yx7001sFZc4WoFpCgruZ2Hwd5FlaxNGgscNeUDBOn/ZLZugXTj5
	DB7rZZG7V7yZOZYA9gqyG4uFmQB7/tItIg==
X-Google-Smtp-Source: AGHT+IFeyoEkfpMFYIpz8PlD9zBCuWfsmzyhiV+SVWusU8Qoa4Mgxu06yG/lxcIjzm+LQhn9qvb5cw==
X-Received: by 2002:a05:6a00:bea:b0:6bd:e39c:aad5 with SMTP id x42-20020a056a000bea00b006bde39caad5mr5115425pfu.15.1699900442799;
        Mon, 13 Nov 2023 10:34:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:34:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112191146.595362-1-alperyasinak1@gmail.com>
References: <20231112191146.595362-1-alperyasinak1@gmail.com>
Subject: Re: [meta-networking][PATCH] cannelloni: upgrade 1.0.0 -> 1.1.0
Message-Id: <169990044225.4418.3376728114834922337.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:34:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106667


On Sun, 12 Nov 2023 22:11:46 +0300, alperak wrote:
> Changelog:
> 
> - Typo fix in cannelloni.h
> - workflows: add nix-test.yml
> - Add TCP mode
> - No peer checking
> - Add -Wall switch and fix all warnings
> 
> [...]

Applied, thanks!

[1/1] cannelloni: upgrade 1.0.0 -> 1.1.0
      commit: 5e59c274c2661f9c3ecd6da3dc51a309dd2f4c30

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


