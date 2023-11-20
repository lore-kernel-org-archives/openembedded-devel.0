Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139F1C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.43620.1700452286434806350
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AGq1+rD9;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cb7951d713so530584b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452286; x=1701057086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrygFNCCDUq5OUJjNJ7sa5bwmQpojM9UG2PMCowNVSY=;
        b=AGq1+rD9jlBX4Rg3hMEjaUfZYxlPhkFO08hr1l125f6WAMfjgrtzF5iW7f0t4EpOTX
         EB9zYDlcRUWiCPVCvOwA+SE0XrhaifDhFP03r5KbF6fnSJDMVkaAsw83ryy7HM6gE05M
         DkiqBLcpe7ociFg70Ztbq8kprWe/aLcyIRW387f66iC+vkXMOAsP1qR9NZHwKPjfC5q9
         1/UW7kVolmtAFsMo5RLW1Dt2odMtPI5zjYJkfLZDmBs7y2gWvr0mA82kvaUFLPwRgL3K
         UWAzXD3pfxBzEBSmC3uR6ykZVRlDzx50J1EkSOob+fplEzVRtylyfWwOCU1GVeNY2pFi
         TZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452286; x=1701057086;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrygFNCCDUq5OUJjNJ7sa5bwmQpojM9UG2PMCowNVSY=;
        b=quVSYp5vWGACSApXgpeJOp9kBc5BC5iOLrnfc4FLlnb4lQaVrB6IpUFwGERNYFEV+E
         /MV5rU7jIABkbwmA1VJzCgKAsNu7tOD+aOMkSomjtDf30KhmHvZhpMwIcIzFbehCqiH/
         5m9ZnWT8QFqNso2CbEaQ8YjHyToL4htgAtmtY4QhdP015Abl01qyaFYxKpiGa4IQfPmN
         rEVLggZKe3abUnu2/jw5po5v8n09/lmGSc0+yvYmdUa2vwfzc7jxXgW28oI8r4iMj9Jx
         zp6dlk3jZwT21P3n+cx0uG3A+sW2wUmdmBjce+4eqQj11IE9Phui0BCOT20LytpyymfS
         qt1Q==
X-Gm-Message-State: AOJu0Yw7bz/7D99N3wC6e+R/Ic8iAfidmZzOv7rhQ5KBmpPMsQAEZa2p
	CaNNDfDh+xltyU2Lps1+9Acjb2KxqpcOEw==
X-Google-Smtp-Source: AGHT+IH7e+A4UHeVcGvK5zYns2iOeWMzNSo4D7xGvNYbv+mdt7ucjKgwyxHdEup9W7CPT0GnjEU6Iw==
X-Received: by 2002:a05:6a00:8b0e:b0:68f:cbd3:5b01 with SMTP id if14-20020a056a008b0e00b0068fcbd35b01mr15144534pfb.13.1700452285843;
        Sun, 19 Nov 2023 19:51:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116170523.1202934-1-alperyasinak1@gmail.com>
References: <20231116170523.1202934-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] cpuid: upgrade 20211129 -> 20230614
Message-Id: <170045228504.1416826.8432531679226081318.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106941


On Thu, 16 Nov 2023 20:05:23 +0300, alperak wrote:
> Changelog:
> 
> https://fossies.org/linux/cpuid/ChangeLog
> 
> 

Applied, thanks!

[1/1] cpuid: upgrade 20211129 -> 20230614
      commit: a9f56dcce3f605c6e8fda9f9672177f3f37731f8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


