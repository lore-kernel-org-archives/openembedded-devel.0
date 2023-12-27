Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107F6C47079
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.97664.1703665306381928431
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5JqnSmv;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so1257642a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665306; x=1704270106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doSd1dTxIukt3adUF6GHVaV2HZob5kr7yza7zs/JD3M=;
        b=i5JqnSmvmm0GLyNO37IrfNjhJkEqjprBgu58FWkH1Rfxo6WGi3LkrNv8VpcC7Y+s4u
         N7SJyf8DAa3Mrl6iAWrGR9ezGNgLOBuwsNKhFO/HjoK6zLj/IQ/Xk46vLb00Wok5XZ/g
         xFcL973/2utc3l47KAr8/rfM3xg46PTtrIDKVzsgLh+Cpnstfe6FyOQtD0GPddXbqaPP
         e55f+md+QsYGBNuSDHQZeI3g1Iij3LDsp8a7trp/p5wcCYwhO6og4K6283PXIP9YybcB
         3h+TewkL/iQfxwXrgefxrOVti6mVbqL8/F6d1Bb96vgmwnvla/dQf4ZfEq3LDL3m9cGm
         Mohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665306; x=1704270106;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doSd1dTxIukt3adUF6GHVaV2HZob5kr7yza7zs/JD3M=;
        b=K7MR4zTtJmJntN8/i+Oz4/TAofJdaO81UQdkuW+lJzamAhyoDYzCeZ+IM5kBd9o0Jg
         yd8QTocv0RUtXP1Z2+8Mgy79rU7H3GiIZKrMecfvlaUEg6DyKXLcdKZLL9toUmC1Ug/y
         gZfxoky2clIy4kcRLwPhAp7wgXtYE+yEbD4UqDIzD5uNF3XmDZBTfHr/69RMeGrKc8ci
         VHub8gJ9Xtcfs2v/sTmsyYs3ls0wms3wqh2nohMXNdd53PjUnbBfw6RVg1e6GLy7YXb0
         KSEg6pbiFHLzUpZP7KIbP2Bcwl7DUkX14ik2MgJPkWMiAJ8JPTugLrQvd5EpaWp7JoPq
         PF8Q==
X-Gm-Message-State: AOJu0YwMleLYGa3KICwbURFI1YaC4X7g8Q9eOlxJBjn63cLBTYeCrvW6
	GUoJpuMM8W5KMlO4V4QvqGauEmxexUY=
X-Google-Smtp-Source: AGHT+IHflpBXruz+WExKf80sUX686FHb6A2lRqZmCX41ok/9zlEOpzdz5Nq6JvDaxvBeZZq1J/TWMA==
X-Received: by 2002:a17:90a:8501:b0:28c:6720:9ed4 with SMTP id l1-20020a17090a850100b0028c67209ed4mr844981pjn.16.1703665305750;
        Wed, 27 Dec 2023 00:21:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221181726.3904826-1-derek@asterius.io>
References: <20231221181726.3904826-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-wpa-supplicant: fix upstream uri
 and version check
Message-Id: <170366530510.1947762.394549024629899452.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107852


On Thu, 21 Dec 2023 18:17:26 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-wpa-supplicant: fix upstream uri and version check
      commit: a28ead8652868a978bfcd99c4a366739d7c8fd70

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


