Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E3CC5B563
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.43653.1700452295941579430
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/FSGGoR;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ca369acbb3so5567887b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452295; x=1701057095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG0R1RoLr2pjKLw8fatRFRUZy4nQYLQQPGL0peln+7Y=;
        b=H/FSGGoRPusiQp2b/Y71x+h/5NKPhu3OAaTp8plsVynw3rBBSg24d/Et2FLcqwxqom
         dlQbiL4O6RZQEuVIv3zsCVLwV4XtzJDGzN+nugOcmACpYLYCZdjSHNqmpfYLl4zb1P1/
         Z6GPVUU/WfrDRe/3yvTumqzSi/QZOm0sm++B37OCVQ16mie9LKpfmfCaFvutbMRxrZ1H
         q/wa+FCK06zpFYEGZrEe/FSN0IH7trPCxQl0HPiSXjDkN5aHXSyt6foRT+WLoW0cIP8W
         s2kEgtrThPhokm3Le4hUBX8MOW1VJwt7/Gb35a7sdk7/Hn6oyokEmutsaw1Dwf6ExGks
         lS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452295; x=1701057095;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xG0R1RoLr2pjKLw8fatRFRUZy4nQYLQQPGL0peln+7Y=;
        b=tawB0W9IRWm5ud0GcxLlmmgk1iWJM+Vm9m/YhrO9DRhfL84N7SWmHbufB9SuJ1/fQg
         r3QfK+93zMDYDajNukBzfbSje26orFRgIqkLuHe2S3J/LB6LHbFioTKzvq8fePMZnJYr
         35jnJsdORXS1TDgt2+oyOszhJOtI8XXF3OxuP7vvOmeDxVpJRLDbia1tMfU2Ddgywa2A
         MmQwGCAtZ4yRQj5E4DcVdPUxL5CVefVzIN4AhM+/utU7c7JJeCw3hLgC1+8enGooJRz4
         xUPVp37kerIyDS9UPMSkcT17AjJw2h7NusSxIOYd79l0W2/zc2JS6Z78mmkRPYd+VqwS
         aJ6w==
X-Gm-Message-State: AOJu0YwBT5Ut/K1jZKJ1dBxGzYWEZHIREfg2AK5SPZt4zNIznJ1fxITF
	Ih6xFQfQc8/S2Dc6a17W85em3FH5F+7xiQ==
X-Google-Smtp-Source: AGHT+IEDxubSWFYEQ7k/GS28rmohQiEUHRP8xGXtA4Ox1e+9z1N98Dw32BUYGi3wZRTKTthLnDr4AA==
X-Received: by 2002:a81:be12:0:b0:5ca:151:1cf5 with SMTP id i18-20020a81be12000000b005ca01511cf5mr2810363ywn.15.1700452294878;
        Sun, 19 Nov 2023 19:51:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yoann Congal <yoann.congal@smile.fr>
In-Reply-To: <20231116223001.425992-1-yoann.congal@smile.fr>
References: <20231116223001.425992-1-yoann.congal@smile.fr>
Subject: Re: [meta-python][PATCH] python3-soupsieve: Break circular
 dependency with beautifulsoup4
Message-Id: <170045229399.1416826.13672294286875886141.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106950


On Thu, 16 Nov 2023 23:30:01 +0100, Yoann Congal wrote:
> python3-beautifulsoup4 does depend on python3-soupsieve but
> python3-soupsieve does not depend on python3-beautifulsoup4.
> 
> 

Applied, thanks!

[1/1] python3-soupsieve: Break circular dependency with beautifulsoup4
      commit: 9d695a1f261e5d5f6aa9aa4cb3eafe54d45eedce

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


