Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0A0C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:05 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.6733.1702967221596003136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5EKyyQ1;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d3e2972f65so263765ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967221; x=1703572021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcSZcwVQgBpCaMeZMQbNqDfLvHonrgJ8KEVjf+wSX2k=;
        b=g5EKyyQ1Wh67zBkx7hlUGbTLpbeOxgD3Q5vcJ8BH4t+JBTuL/nZf4suwkFE2DqBLmL
         FreDJuDGTHGoMEhEj8RGMhV8nCSbBa2vSRRpUK32Eq/Rh42U9T7jBSyfnP/SrESiuhR0
         ly0H9mS0JmE+IAyscAe57oHsbl6dEMOwGR7/nShzRMApTxqKsim89GkGzXilF3tL99gc
         buE+rAEckFm22zdhpE/uJu/8F1QWXtKUa+ys8Gh+UsbnbSPVBS/UWIyPgjrNe0p0pX52
         P7wD0D9kSI+BpjZQDD8ZGJvF62Gg/hG872H0wRP9XiQUikHz3m6k/YKD/4J70JQffKXZ
         V83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967221; x=1703572021;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcSZcwVQgBpCaMeZMQbNqDfLvHonrgJ8KEVjf+wSX2k=;
        b=YqFYQCS2L629wK/CnRz5A6oRxBId2uM/OlrFo+RLqtlFhdMMLn4TupNiEWjILW8Byd
         Rg+MgmruhvemvWo/m69gp3ldHHYC7XcnUjvw1QstfRwv0wxzijM/LSXFSxbhpkgk47p1
         f5P4UCY8uDv+RkUDYoJrs9jfV4cRCD2tevvTUEmW3U+hZzvj3cjSlcbVIbeCJOpv36/c
         NtFd5w91jtTX6cjcR0o/SO+HfBjWoQU9YCiPR2XNZEsdtw4qI/Vw+bWBe0qQNeUueC4x
         aqk2b2SueXFH68rIk2vx+UsSGqF2PikcvZyvS2I+vMtKsARcYvG6Qz2jHcaYVTkBqff2
         Gu+g==
X-Gm-Message-State: AOJu0Yy4h0uX6oT4qloy1yRYurwfAcUyj0B75KOPn9YeW6w0ENnHydPR
	zUpcXM4Nwqr7UjIryd6QN2U=
X-Google-Smtp-Source: AGHT+IHrUZ0BMQCBHXQhlNNl2K1cje3HmoGVO1MXwYVFJjv3KwK8O0MB709MTCCSF4+TwAJATR99JA==
X-Received: by 2002:a17:902:cec7:b0:1d3:df5f:65fd with SMTP id d7-20020a170902cec700b001d3df5f65fdmr115852plg.126.1702967220842;
        Mon, 18 Dec 2023 22:27:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Samuli Piippo <samuli.piippo@gmail.com>
In-Reply-To: <20231213084327.1840248-1-samuli.piippo@qt.io>
References: <20231213084327.1840248-1-samuli.piippo@qt.io>
Subject: Re: [meta-oe][PATCH] jasper: enable opengl only wih x11
Message-Id: <170296722018.1627685.18365831827811753541.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107555


On Wed, 13 Dec 2023 08:43:27 +0000, Samuli Piippo wrote:
> The opengl PACKAGECONFIG depends on freeglut, but after commit
> f721876add48dccfd228cc09ef261909afeb2d25 that's only available
> with x11. Enable it only when both openg and x11 are available.
> 
> 

Applied, thanks!

[1/1] jasper: enable opengl only wih x11
      commit: 5f76240e8810e681e822e51ea40c8332b5e6d978

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


