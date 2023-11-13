Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460D3C07524
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.3161.1699900445772378383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=azLqYhEa;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35809893291so19928265ab.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900445; x=1700505245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1kuORroblHT95Ej1Vi4NtmwK0fsGEgs4dtQ/Wy4STU=;
        b=azLqYhEaW+E62pGDA5sYi/Sz1rHlxgScmK2E2JOCubPzYYl9zsIWMmCuBuqnnXXz8Y
         k1EIOklOcUjDzUrLGwOjZbwT9R04oXmpSkv1KfF3BYHFxOKnuM+dda/kjc/8xd5rX5MD
         7mtVmgWHTCVRr/iEL9I/jY51Kc02sZ+LMnDG5AhD08Jo2IMIcQtqm2RubCNrW3tYJAcj
         WHw0h6RJ1hp2/tET1xdrxs5xqNfC580sXieASV1XNVqkzDmJYJYyJ0VhC6oE/nrGakZ4
         l4EO6ys3TZIRqgDD2nCpDwrzXHeHgnHysTCBrEP1lDDbyf0yCcJgmM7hm8CpRAYvixEW
         jxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900445; x=1700505245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1kuORroblHT95Ej1Vi4NtmwK0fsGEgs4dtQ/Wy4STU=;
        b=KvAVUpNWYuLpPvVE+LQV3fhX4Pl7NeHeUm/ZoBxvteIc9hwcuTKhP0oevDdbaar+fa
         7YNlikBuhFkURR+Vopuk9XLRJdJKQtdZwq3d6dRLBjZoNlq+tjseIBDJEFNu1yJHo2yY
         7G6IEyE8Oqj33EtG1SUBqKDenhIYKpdw3ohidQ4+N1k9w2mo5OWq59jvMRptTQwtWMqH
         kzJ9AlMt/DQdm+xyKwxWNtk5ymBnZP4xqjmL7z+aV8cf3PN63GxwAtCXtntu2ntqiBzE
         /tj7ye0a147EF0otkrx1WvQHQoAOWTgleBD86wIBlAHVOdIuU8ITZSAcCIEKYIDK3KT6
         b2pQ==
X-Gm-Message-State: AOJu0YximiyBVyBHKyAJ9De37H36Ry49Qm6u8wqvTU6ECxoe9Xny0Y6Y
	QZ8GnkyMsID4W3i/QQy2XfH0bwSZsQQDNA==
X-Google-Smtp-Source: AGHT+IF8xnM7NQwsUa9y3/oiJpzmb3s3+EwxAU6o7J2PV4XyU/i/f6xJakBsVgYXi3cHzxYg2pWM8Q==
X-Received: by 2002:a05:6e02:216a:b0:357:a049:91c4 with SMTP id s10-20020a056e02216a00b00357a04991c4mr7965383ilv.22.1699900444790;
        Mon, 13 Nov 2023 10:34:04 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:34:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112202525.633823-1-alperyasinak1@gmail.com>
References: <20231112202525.633823-1-alperyasinak1@gmail.com>
Subject: Re: [meta-networking][PATCH] libdnet: upgrade 1.16.3 -> 1.17.0
Message-Id: <169990044388.4418.12837826567646961649.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:34:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106669


On Sun, 12 Nov 2023 23:25:25 +0300, alperak wrote:
> Patches removed because fixed in the new version.
> 
> Changelog:
> 
> - Various fixes around the build process (esp. cmake support + string.h include fixes)
> - Stronger cmake support, updated autotools and a few smaller fixes.
> 
> [...]

Applied, thanks!

[1/1] libdnet: upgrade 1.16.3 -> 1.17.0
      commit: 7d65ad61e06e76c3f49b7f44644360cf50f43f43

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


