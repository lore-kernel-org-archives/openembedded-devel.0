Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37733C46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.6759.1702967246673724461
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=La2l76l/;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3aa0321b5so19909205ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967246; x=1703572046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk52M759WYg8xTYV2V0Whl9FL/A6LWf21v0jxEHMZqI=;
        b=La2l76l/12lNysM8QlmU9o54nxuY60L/ykUOVOJ/0VlVbROrnJKby08JITPBpOKsdF
         OmARJabECQ2E3Z3QLspRRjUDaZLcVC2MnrSVuiP/JcB+mp6a+77U+Yc1Zolni9oVXXR1
         Bp2pnKp997e1zb/J+APQsssv1rOIpYPjzFSrqamd8tFwG1BRQGaH5uJklCzPGwwtlR8A
         hVtvjYyPR02jfbJ0R6B+Za1Dk/DGTt/jrms8jRFcX0EcEFAjKiU7HKb5onicmgkmhG8I
         AX4JA6Lc6273GwYOi8lUa7OT7lNwTLzXMTEhmVysinAaZwHFH1+GCOIaT4mTkC6hqyjm
         jbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967246; x=1703572046;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk52M759WYg8xTYV2V0Whl9FL/A6LWf21v0jxEHMZqI=;
        b=ulZ+1Z1K4PjBFjG5DrCUGOzFmThCE6D/zrvIu1Yy3gmJfbLogmlZltLsycXuxyr0us
         8Uj8LMvM96HVxOfFwAIwXK6cQk6OAw3prGDYdlghcVTIveljpCPU6jhSfzjQCm15CzjI
         sy42p8ErNZkXzPwPtpufWItPzaw1lRKM8wdBtbJbNqJkM4zRVN3xIDNCJnv1tp+Ols0y
         FJkJnPY31bnyKXv2xQaKx4BoBLSMR+F+LhboAbduL5SIptv8f/gQM/V52wPx3xK4UCvw
         vdqjaFbFok8vRmMyGJOyDWH0nkb5Bg8Fx06kHetRlICQQsL59gkAZeAFjNPHPa7T95mU
         OPQA==
X-Gm-Message-State: AOJu0YwBG00Pz2bqsz67pQJ/sIZt+en8zpOl8hqFNuBSUFXJ5C789KT7
	feK1AvDWvlNngdSxDvHx6U5DJLeyJ+U=
X-Google-Smtp-Source: AGHT+IGh3BQLLftSobUHbWXmgTSM0VFboOwAkfESqaB9AF84gjJLpSbFliXwuuvxmX6O1WyWp6IGhg==
X-Received: by 2002:a17:902:d547:b0:1d3:5b0b:b049 with SMTP id z7-20020a170902d54700b001d35b0bb049mr14387285plf.33.1702967246034;
        Mon, 18 Dec 2023 22:27:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544077-27916-1-git-send-email-wangmy@fujitsu.com>
References: <1702544077-27916-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-googleapis-common-protos:
 upgrade 1.61.0 -> 1.62.0
Message-Id: <170296724528.1627685.7562786846535812283.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107584


On Thu, 14 Dec 2023 16:54:37 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Add auto_populated_fields field of MethodSettings in google/api/client_pb2
> -Add support for Python 3.12
> -Migrate to native namespace packages
> 
> 
> [...]

Applied, thanks!

[1/1] python3-googleapis-common-protos: upgrade 1.61.0 -> 1.62.0
      commit: 2e0a01b9cf72d49926ab46107438db0cdc9583e7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


