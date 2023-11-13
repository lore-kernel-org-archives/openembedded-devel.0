Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DE1C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.3234.1699900446348065664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JcUdQDvb;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6c320a821c4so3993701b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900445; x=1700505245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7jxKOc4Rg1kVPOgQqPCLS9XZnKROajb2amAJNEVzx0=;
        b=JcUdQDvbQurx7k39IclrW4YdaKIakRLOZS/ZsYodES0OGC+hvPUOaIpfcCraBlrvkD
         Y7LZzLPKW5eS4t4Db5vMYRExPJ2otqouXE3KW5um4VVxlOhlDXywzZfstqy8ULOKSWkK
         fgwAIhL73WEhD9wj6NZj1pH9G6ZlU3ry/zOrbvP9fAf99gnL4PzcWdg57Fr1AtlgBT+4
         vM3Y08W9u+cEiL+xRf7JtdPOnE8J6mNYlkX8xOAn+UK5Wr5ERuo9IxEweZ0xcum0Lb/6
         Y4/AJGJFy2MHibtHHPqBr6lUBDc9HBVKQTOH4As2NLwaaccMSVomSO+LHWJh1328Bs19
         gjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900445; x=1700505245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7jxKOc4Rg1kVPOgQqPCLS9XZnKROajb2amAJNEVzx0=;
        b=Uklt02HnXVV6i30VM/fFIquKFcMObXCZMHbgAQUABvBDP/2thRTUfqC/849PERWF8p
         fbyC6PvBnroe0MxV7LpYd1LlPUG1slLjUU7FhJaz1x9pEpLLYWFKRN6rFOMM1Ony2gy+
         JPhil17/5XDhvXhrZ/17+v4XsWhgwdEP+hgUnx/9CoCdWy+taf+7OX7vhhh07n+vd/cR
         4BKBOOPOng28nwN3kjnOhWsoUuFtfQx4LxuuQ+H93bj/6RRivc4snVMnlbYL520DkQwQ
         njn4z+0QKEFcc0Z/sOBQqTWX1TlO4R0OByT4ebZ4RNWpqoLSt9d/tH3TROQQJrogwiVz
         2HRg==
X-Gm-Message-State: AOJu0YwtKLuBjZAJG96e9G8TxeM0G6p2Kjr3NZvBpNl3tWH8pu4F4Uy7
	WHfv7QGieT/WPXd6EGl0Dl8T/W7uk7ATew==
X-Google-Smtp-Source: AGHT+IGyW+eI6KiAVL5kB9c8XLnv4OeueUsEurX3t9DDghB2w/HBU+c1gyf8hv1xOCdj2IJxnw4xOw==
X-Received: by 2002:a05:6a20:442a:b0:186:7842:ad46 with SMTP id ce42-20020a056a20442a00b001867842ad46mr3373862pzb.34.1699900445565;
        Mon, 13 Nov 2023 10:34:05 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:34:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112204408.652490-1-alperyasinak1@gmail.com>
References: <20231112204408.652490-1-alperyasinak1@gmail.com>
Subject: Re: [meta-networking][PATCH] openfortivpn: upgrade 1.20.5 ->
 1.21.0
Message-Id: <169990044488.4418.12509621823544961426.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:34:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106670


On Sun, 12 Nov 2023 23:44:08 +0300, alperak wrote:
> Changelog:
> 
> * fix "Peer refused to agree to his IP address" message, again
> * deprecate option --plugin
> * better masking of password in logs
> * break on reading 0 from ppp pty, for non-Linux systems
> 
> [...]

Applied, thanks!

[1/1] openfortivpn: upgrade 1.20.5 -> 1.21.0
      commit: f13b5120ab030620d001ab36b0d1b822aa247556

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


