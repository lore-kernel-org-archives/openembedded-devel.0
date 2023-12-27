Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD862C4707C
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.98055.1703665294761880477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Meo74qo9;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28c467446f0so1395231a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665294; x=1704270094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgWEo+vrOvuFU3MDuLVZxr5/shgITtAdhF+B4pRvnfg=;
        b=Meo74qo9TyDSxBgNT+G/9+no+/sWPh+8xgIYlN0vXQPZYWMsuoL7nuFRgrERemUxS+
         DTJc5gUSQAL6jrTQv53b4d2Y4HpycBg36deebqcVKBp0lCWjQATBBRolNfSpDHPXu00b
         U45CFSx3voB47CfLvZSZIKoLuALJ+AuGnjgoq7+tpuY20J3bpgzVm5fY+S4hofjE7IMS
         RbEYuknpMjncKm1vsL/rNfjw26g6CtTtgbohUPqiy/6Z4/KmvYX7PYVhO8y/Zlv79RwC
         B9yMg3jtw3yoeLpXdOhM/rgIqUckiax/sshf3Do+CTBm7tufwNNyq/uHZ+W5qQ2xw57g
         zO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665294; x=1704270094;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgWEo+vrOvuFU3MDuLVZxr5/shgITtAdhF+B4pRvnfg=;
        b=ZtdLTzcjR5v0TGrzyxuaZfGo2yxEXJ3m0xIxUUQ2eZfQEJt0xNd1B/Bg6nc/p4Z9yV
         LZNzJ6zq8o0wxiMAOYBlX8K3KASX/V5Fl7/fSzUTUnkSRCL6ZQIIB01S1zrbXxbq1pN0
         LVy9EJQod/RbnEzagNYps8JGb/CG1SgoGjrUyleJjZrTVZU2LkOoU+D2COBTS8aCDPZr
         Ea1SVYpY+5Mu/v2yhrYwlqaJMFvJFto+FCr9r7tG6l1AwlBWEexNtJi8dzqo8Va1MfYT
         ADYndWH8we7ccuNQDlk9m4onqJ5pSrzYdE8ohsVZqgvXf2zmfmPOEe+PDKb5KkGv9Z3o
         iNjQ==
X-Gm-Message-State: AOJu0YxAkwL93j2CWByw9iMOjwxcgbkqasAjiMnvERzFRi4D/ttoEh9N
	evhYU0AZyXOwaEcR0Q+2enqJy8Feo4M=
X-Google-Smtp-Source: AGHT+IEV4U2c/R4N6xsLvzXP+6PiDR7YsYgilK+9EgRYcivKFPqAwEwRv4CVRMc+Tm6BJ0kOZrUJ8A==
X-Received: by 2002:a17:90a:2b48:b0:28b:ec53:4019 with SMTP id y8-20020a17090a2b4800b0028bec534019mr10950508pjc.17.1703665294207;
        Wed, 27 Dec 2023 00:21:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yoann Congal <yoann.congal@smile.fr>
Cc: Ny Antra Ranaivoarison <nyantra.ranaivoarison@smile.fr>, 
 Alexander Kanavin <alex.kanavin@gmail.com>
In-Reply-To: <20231221094100.1516262-1-yoann.congal@smile.fr>
References: <20231221094100.1516262-1-yoann.congal@smile.fr>
Subject: Re: [meta-python][PATCH] python3-click-spinner: backport patch
 that fixes deprecated methods
Message-Id: <170366529349.1947762.4194522670171481274.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107840


On Thu, 21 Dec 2023 10:41:00 +0100, Yoann Congal wrote:
> This allows build with python 3.12.
> 
> 

Applied, thanks!

[1/1] python3-click-spinner: backport patch that fixes deprecated methods
      commit: a50c63e2b7d78687aae48f25eec88442c4ecddfa

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


