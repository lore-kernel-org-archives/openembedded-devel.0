Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B32C5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 17:49:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.5330.1700502575641256748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 09:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+AhmX5z;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ce5e76912aso26758165ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 09:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700502575; x=1701107375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgXFK10y698SEkutBGebRFbfGTXiA4exj7xw90wNJ98=;
        b=U+AhmX5zwTd/r5VjwhTnKfaXWABhru4LpnjyNfJtHQ9dOmf5/0lUliiv0NvNbFi5P0
         K+biFrcQkVfPo+ZXLAgclYheRsH3xpTHQw167chXC7+oI1dcFtErDeo7hUcUkEwMloGW
         S/ctW+bcCdUuEhEYutEHuwgzmnLzP+QJRnu0gpTvfzU3XXCBDcx+NS0iS3Mq8lU2bCmR
         DQ4NI7Dvdjye2vssWv9KaMWBcPT2aFXw68hjv6Aj3gRceLLIYyPfz7gaRMyKPFT01UMH
         vOIJAkKdsXAkbBwz8T1ce3jnczmjaktuZZ/D/sPVWmjScc3WZzZ5/hM4iwv9pAcet/0i
         umAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700502575; x=1701107375;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgXFK10y698SEkutBGebRFbfGTXiA4exj7xw90wNJ98=;
        b=AKG3K9NYjsc5Owzr9T5jVuUIyhUspxKor8vw5G1Sv/LcKvJtNj91XCAORqgQKJ1w3r
         ynZzPXbfaoxR3KTUhb+euimbXatHbJoJFotGvTlvQqNKvkoYUNoUoQCEg3+Rr6Y2l+MQ
         IL1bviLNlnL++4AMIwmvKHxTJtJSvkh4+FvUsYVPFjfE2UJEx9DRwuyWEpzi3O1GpVo4
         hT8dHz7MeEOT55qfwGWcU2LWmu3dPyHEDr+Mqzzxggzxcxtxno978MGyJpIhIh7Mc3gC
         sASu6ru4pUCcR0blYxzAK3J1qrMgO2hK8sV52h75jmkuZB3NCbsBwSaBfBWpfQeGl48O
         S1Vg==
X-Gm-Message-State: AOJu0Yy0hTcgoYEvqOTxUAbxizdExv0SIAVvYyr4taRNS0JiLlkQ+sbT
	T5WFcR4eMdF+wjRSIHHbvhM=
X-Google-Smtp-Source: AGHT+IEZLEE9jHLvkiIe5Oa1AgEie0YINFr6+7cid4H/CHGK6BzlBfvBwEJ/IDeOAqSMliYkxp+qqg==
X-Received: by 2002:a17:902:694a:b0:1ca:57ff:9bfa with SMTP id k10-20020a170902694a00b001ca57ff9bfamr8432504plt.24.1700502574676;
        Mon, 20 Nov 2023 09:49:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::4898])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902e84d00b001c465bedaccsm426112plg.83.2023.11.20.09.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:49:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH 1/8] android-tools: drop ${PE}, ${PR} from
 /usr/src/debug paths
Message-Id: <170050257416.303586.11752580917334038370.b4-ty@gmail.com>
Date: Mon, 20 Nov 2023 09:49:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 17:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106966


On Fri, 17 Nov 2023 09:51:36 +0100, Martin Jansa wrote:
> 


Applied, thanks!

[1/8] android-tools: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: 3c20415c1a77336cfc23550ab89e424737fc0710
[2/8] minifi-cpp: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: 54689e1468356e41d7ad5ae69fd588e4ca93ab73
[3/8] xmlrcp-c: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: dd0676e657e2f7dc84c8af7d97be01a2233f7496
[4/8] fluentbit: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: 4f84234a272666e49579bc7468d67b257260c221
[5/8] ntpsec, net-snmp: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: 2487442cfb7158183d868c1022d5183bc85aa166
[6/8] aom, x265: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: 5d577748ca8b24e2408bda51a464ed3d7207cc6b
[7/8] python3-{h5py,pandas}: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: 445b33e9b33ef56d517cb892b871b2272a4becf4
[8/8] evince, gnome-calendar, tracker: drop ${PE}, ${PR} from /usr/src/debug paths
      commit: 09142fe47984bd7ae0e00697404131dcd18f712f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


