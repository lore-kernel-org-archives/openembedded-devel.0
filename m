Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4E0C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 22:01:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.4618.1654552911788251962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bx345Ap3;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id q1so31564181ejz.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2Ejw/zd+wHLsTt+d5RSQKBlt1n2egZBtVEBR+lCay8=;
        b=Bx345Ap3LHpXoQnpQjdoLmOvhoT4Vvs+HuPPlSPnhz4nGy2SKHTEXbeZYWh0Gmqxcn
         EMFJXilWaDSeAVk8aN1WlPCa5/TF+niDdZ04qXaz3xdr8gCUu9559h+UbQrzR8gTrn7S
         bdq8qoxRxUVKTZf3o4T82VVcxwFuUftU32pey0weYzqi7CDHkUkes8r/+UIrg8urBaOt
         JxxYg5KdT0tcQ0vW9oFsr7kyAs4EPwgYwFA356Z3ZtfyWFTR/9R+s+aQhyKsdA5SWmAS
         iXNQYpqgz/0wQyVOTStScp2nXtkg4f12W30x24ka1+HpGY04DtQhlQSlOeHsd2H5hqti
         1lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2Ejw/zd+wHLsTt+d5RSQKBlt1n2egZBtVEBR+lCay8=;
        b=L8WIN4y7kbzhcdO6V/9AxqdWUpioEjMd5pELOksi30+0XOjQZSALwKGeZv6A0YPXz1
         CPpSjr5CSuDA61B3D3JHpjoEgEwIgsBFeZrgr62ljHGeJf91QsHAimWn+PT+1BddB82l
         9eJUgfYIEJV06a6pJO5StHSeqP5s1j/UxImZKEusICCLMwUejMfmq8ilTDrhsDHw2/3v
         wm4tfO/Bpd7tLtVZiJt6WEPVDptMCgFKVN43XA3jSLKp1hpHVtUmQOGOrFNlfwnvn5fG
         Cw+MKmTo4fKQ5uhpqNArDIxy0x9Io3EyiZBFoyJvMy9BlMUF208q1OzSXapD9Zhy+sjQ
         QV9Q==
X-Gm-Message-State: AOAM532PX3FkY1LylKNO5Svl/HDnV6MUeZpmqO5Y2VSuefYG02NRiiDb
	r71aAPb6bWIMmGqmRX9LX3vYqK3LkCmj5g==
X-Google-Smtp-Source: 
 ABdhPJzJZ4LGzhtCigYDqVpAOcMD4pzu6WXve+3pAOhfQcIa/tlp8MW2S6fQzB7Ja/qoMRie0nliAw==
X-Received: by 2002:a17:907:7f21:b0:6ff:10b:9cee with SMTP id
 qf33-20020a1709077f2100b006ff010b9ceemr23601283ejc.302.1654552909871;
        Mon, 06 Jun 2022 15:01:49 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b0042dd4ccccf5sm9134826edv.82.2022.06.06.15.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 15:01:49 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH 0/5] networkmanager modemmanager updates
Date: Tue,  7 Jun 2022 00:01:32 +0200
Message-Id: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 22:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97431

Update NetworkManager to 1.38
- Fix some dependencies between plugins and related services
- Make it more flexible and easier to use only some packages

The patch "networkmanager: improve dependency handling" should go to
kirkstone and to master

Adrian Freihofer (5):
  networkmanager: improve dependency handling
  networkmanager: simplify selective installation
  networkmanager: use nftables by default
  networkmanager: udpate to 1.38.0
  modemmanager: update to 1.18.8

 ...t-add-dependency-libnm_client_public.patch |  34 -----
 ...ger_1.36.2.bb => networkmanager_1.38.0.bb} | 136 ++++++++++++------
 ...-shell-scripts-to-use-bin-sh-for-use.patch |  42 +++---
 ...-Make-scripts-POSIX-shell-compatible.patch | 100 -------------
 ...nager_1.18.6.bb => modemmanager_1.18.8.bb} |   5 +-
 5 files changed, 117 insertions(+), 200 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.36.2.bb => networkmanager_1.38.0.bb} (69%)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.6.bb => modemmanager_1.18.8.bb} (92%)

-- 
2.35.3


