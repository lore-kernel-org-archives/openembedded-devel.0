Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2741CC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:51:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.19044.1700171479575627001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TRrr6nrk;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-282ff1a97dcso1030897a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171479; x=1700776279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdiyfuGIdxBnDOQUrshT2QvjT+pt2FdTcwXVnTtC+M4=;
        b=TRrr6nrkHFraNM60s8I2wfOfQm5Npb3HA2th+Xoy6vywK5WbyglMoLbO6v49xa3Y9X
         QjRkUljj4i+hc8N9Oisux2n5aQHjCFRi1UrYCtiD+8sYi8K2YqdaWdEIAN79Vg01L/i0
         /WIRmSyGgOFykFPbkpu/eDYeKkQlxyUz1i4urTPjdvAkcF7wJEjaLEMOXHdRnaaJnqNF
         /mcHapfkaWGZ1J9T217HYJwTHWWYJnaKvZXkt676rfs39t2wSoRfCubxP66paQLd4tBK
         I35ZfwOaA13JV11Iz2IurZ2LcjHrj1Fv8ocE01oExfW6rGb5FLAU8XgMTTawTbgYvBhd
         oedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171479; x=1700776279;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdiyfuGIdxBnDOQUrshT2QvjT+pt2FdTcwXVnTtC+M4=;
        b=rCNj/yjMYbT+EathJ2C9DpiToXkCefYcAQcbXL5L7BtMpiRcnudQ+mruq3BiDeKp5C
         yrMw8DvdJZ7BqlzaiUA5k7vfX83FjTC8iCiRjTodO/1eSAAYHGIy+7cxvkNq+oa14O9H
         t5DWafgla1yryBysP0B/Q/c/wyGuqLmRZhduDJ86XwI6Kg1bWp06ZhWD1jyfQVGNcAAD
         jX+7ZkFtlvnpNbLJVSymkl/sXcOKVuNQeoVuHIFL6pORFPK73ShW3EGXjdRt9sVLMJRI
         XYK8W5u6Y8azE7Sz8T+5AbaYGMsKZTcCs8eq0rUgkB7MIjkwDEdOx6bovoEXxYjTl3MS
         XMXw==
X-Gm-Message-State: AOJu0YxcfC0I50qo5qjbwoRN8EPDtFqH+9xSXC5TxhB8n3BcvyC0hrLH
	WajW0QExPVVhv3trZaZpSYg=
X-Google-Smtp-Source: AGHT+IHKh/MrlUENMJSskdOqb53yC2sUC71FYaqgJ9rDv2HZKOghcxHqPzvrRi3frjRZyTyAoY7I+g==
X-Received: by 2002:a17:90a:e7c1:b0:281:40b:5a84 with SMTP id kb1-20020a17090ae7c100b00281040b5a84mr15238678pjb.4.1700171478825;
        Thu, 16 Nov 2023 13:51:18 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090ab89100b00280469602bcsm1997692pjr.2.2023.11.16.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:51:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231115062120.47939-1-alperyasinak1@gmail.com>
References: <20231115062120.47939-1-alperyasinak1@gmail.com>
Subject: Re: [meta-filesystems][master][PATCHv3] fuse-exfat: Dropped md5sum
Message-Id: <170017147818.249256.11959493450961619099.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:51:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106831


On Wed, 15 Nov 2023 09:21:20 +0300, alperak wrote:
> We do not need md5sum anymore.
> 
> 

Applied, thanks!

[1/1] fuse-exfat: Dropped md5sum
      commit: 48e1843be8f1847ee1472ff0aa4ba9d4905a5113

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


