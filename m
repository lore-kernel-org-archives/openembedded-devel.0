Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B082DC47070
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.6737.1702967226213557071
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SVzVfizg;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3c76ee799so11801435ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967226; x=1703572026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQ6aqgOCvkLF3iCWWR0SXUbOrrjsiLLwYK7sFhYSKg0=;
        b=SVzVfizg8pjJOu203sNvKllyjDUGBRk2n7+8tzDeHIXKSiCs9Dp6rQUoFhvatoO2Fu
         jfSmOZEv4TVzkzbAuj7rNGSJOxeC+jR/wGnoJHvQgr7obFz8+Vh5vIkEkhznOT6wC9Ul
         VPpPS7aYxjEMfSiMeWtZBoebekbt9UcdaQrqdGJ4S4CQuzG3veuVVqrmYf8GbAxT3X8B
         87/Fpi2U8SwhgMpG+RnCh351Ysj+H5QTnESOiKIYaXqLvN+li42GmOgAeIE+VtlgCpnP
         TnCK4t45k8adonWs0ymhCzJYJt0Lzl1ugv0/CIIwNjfzADriMk0Rzh4bHSWJ/mIjeW2c
         1kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967226; x=1703572026;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQ6aqgOCvkLF3iCWWR0SXUbOrrjsiLLwYK7sFhYSKg0=;
        b=ugR/POxlFWpbyXtwW6PNOQRfiq19UzX8nFzM5/eeD2DEjAiss6sXKNhZ//55dk+4yL
         Kdwa4QoPsQtGvrBdjha5sjsgIVePReJ2rGho7lX3+PJkYIktEyx+c6ae4xmWK9KQGBN1
         C+3QipjhEK9euZl7x3lwHlaSTnoPuZ1Y0vsagL8ZZBXRBUj8N3uBfdD/oIwPtKxUCZN8
         zLRhiRHgG6F3N8iJJq5trEH7AxToUjSoz22s7jwsuPj6mEVX93hvFZSboGTs+PGD2Wug
         M0+8rjG54Rw7CSN+TCmJ+fM+C6ffJrIeuhl4x1hqzkrK05cSuz8f/MwIftwFJ2WbRPDo
         CuSw==
X-Gm-Message-State: AOJu0YzDUKvx8ccCbbcL3ddTXf73Pi8bSTD3ltDyYZYiYyMgNdsOc0Xx
	wTCwBqS98th2PetexRiPySCtCYqrjE4=
X-Google-Smtp-Source: AGHT+IFJByPMhGWt27Rx3tru+z5Xhb0lhCoP/MLpKGDaeZZmtxTCeQaOa12HLQg9iGZ6JGmgZ/t/sg==
X-Received: by 2002:a17:902:7c04:b0:1d3:5990:fd4a with SMTP id x4-20020a1709027c0400b001d35990fd4amr3928929pll.56.1702967225534;
        Mon, 18 Dec 2023 22:27:05 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214002735.1137483-1-derek@asterius.io>
References: <20231214002735.1137483-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-pint: upgrade to 0.23
Message-Id: <170296722485.1627685.10663552647861071135.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107560


On Thu, 14 Dec 2023 00:27:35 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-pint: upgrade to 0.23
      commit: 82523b1fff8715a74c2313af50fef3fee3f249d7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


