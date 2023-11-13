Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EB8C0755A
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3142.1699900426873910907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EiwxrPOG;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6c34e87b571so3891193b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900426; x=1700505226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zol8MWqpp+74VmVT1dDKElZGbzNRYemVP6M8Av9Kafc=;
        b=EiwxrPOGDmMhvB9QphweMzqIZAgbszNANIrubuQbUcT0vAGIj41jplwSOV3rEZN9e7
         pYJuen1/fltJ42qlHJHnb6ewj8FSNIp94nzmKso/RhNgngOeo15Rn4R6jHh2QgpLOyx9
         iRQnT2IXNzVWktDt8ZnO3EBjDECRN+4IoO8l2X/N9iLo+cO0FYNVoMAFOngKauAufp2u
         d5VVAOZX2iWJGiQCs+LIrogdU86gYwHNwZrC192Rgfa+OpmognK+TZWZo0PUxA7Zn0QP
         Ivq7UbJ9XHS/eb2cl7KnwHk4SleQa+IJo37ljU74li7siyyp9TeKGw0D9CdbAl3qI00e
         oeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900426; x=1700505226;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zol8MWqpp+74VmVT1dDKElZGbzNRYemVP6M8Av9Kafc=;
        b=GVgqMKXV5lclmcH3NlV8lD50AkxfqgKHSTvyWo0diWBLEBveq8+7Kz6vW80ldORwDb
         vNUyKMgrkQX7+xsMU4stul8jzNHzsctNc9dng02bQN8R5/Dk1aHBBlbtXcpK7NIF+BEZ
         NlGlZ4okGREkql8OAhUdwKqUHWuOO2Jq0ZzP+s9tmetRYakH76AkOmEZwSAC1a7A5iuM
         9DoouwDGouEFVVulQopEAgae3BoKPLz8M9tsRzcEJwqUV1yrRn3b5uBHjIi0nVJNFxh0
         Ysfuto+YLPJOGaC1JXUQkpWrzHQtIYl4bm7CSzHIFNCSWxiIqzdU86Q1dPaN9NmZwIlV
         NpHg==
X-Gm-Message-State: AOJu0YyzvpQU/3NujjSg9lmLMtoU6aRTXnra7QThGgvljUs8A67Mm3u4
	wpI5ZWwKl8kCrBjTAp47l0XtWLAyWI9bhQ==
X-Google-Smtp-Source: AGHT+IHMpJAgE90s/Y3BFyLLe5kCSsCg5kZzNzyZLDnUQKGKqC1uGiiL5kmKPHlV4UsZrYIEXjMDgA==
X-Received: by 2002:aa7:8005:0:b0:6b3:55fd:d851 with SMTP id j5-20020aa78005000000b006b355fdd851mr4283872pfi.10.1699900425929;
        Mon, 13 Nov 2023 10:33:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231111205914.942045-1-f_l_k@t-online.de>
References: <20231111205914.942045-1-f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] gnome-terminal: Upgrade 3.48.1 -> 3.50.1
Message-Id: <169990042457.4418.3669708701363599100.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106650


On Sat, 11 Nov 2023 21:59:14 +0100, Markus Volk wrote:
> 


Applied, thanks!

[1/1] gnome-terminal: Upgrade 3.48.1 -> 3.50.1
      commit: 3d7d59893bd73b41eb58c4aaa1b629f88b97a94a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


