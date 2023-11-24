Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC81C61D85
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.121177.1700784056730562704
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dg36HZ3h;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cf8720c6b7so10425125ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784056; x=1701388856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9upwNDf//CIaHAo5TlqIenggaUF77Py7arFIUrXCc84=;
        b=dg36HZ3hUV181zNoITvSfNXr3yqFxwWulDjx8ZRjPhg4CWP/5f8JZ1hQUQKRQFn1tg
         /ZMrBSwH/ijWvB1DWuuc2GCjY5+2UZ0XPAtj5y1RkCTcvexTr3v3M9s3sglx0oI+g4Y3
         VKzDKS2yAYduGeLQyJm+JE6zifAifmRXRvlxHeR0sTDElLQk6V0vsAq+8zhvJFd2jsVu
         7V8Gmv56ekrV7eCKIq9SwKDb7wFMsHWtGiptkezE0y5MWllLVQm3z4sB3lLGcZc7JL+o
         BTOXLMcy97fE5ZmSTYSuPkuwzPM2M3cQyFE4NCan6sI3Embnf3uv2wRaw8W6nGRS+eYe
         KuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784056; x=1701388856;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9upwNDf//CIaHAo5TlqIenggaUF77Py7arFIUrXCc84=;
        b=q5pExWuCTzvCWgVbDRHlRDcBtl45Zs2ZpJ9hQfNuyH4JINwYF1JK7kUsbq6p7GFQHo
         Tit7E/dTY/vcZZ6D8fnAATnyFjXWCglMcY2GC9j971jD+1GQ9eZu3Z03nHA7hsPjORJG
         3LKKqL3zRldAtU/QbNrMumQyuMZkbfqP2S/qLCDcowFBip0oBtfECEExodxke9+ojNBl
         rD+n99nLjzeVlmtpILGVdAKZTQ1VDFUj/ydf2/DaYwKNTt0Ur3cJ8GL70lHsA1E5KHbx
         S2IIkB7gMW9xWQDCZVlifaAlWE0/cBjkS8sI6ybGz7iDtUBS8k0ERBW1krHOaI7x9ZfW
         INTg==
X-Gm-Message-State: AOJu0YxoTeXxomjbYELnxUbeTn1Vib7qnazlaRtFZa3mouC+J9FakrYH
	qMnkme2WRUsxB3hoINL1csc=
X-Google-Smtp-Source: AGHT+IFWxsIgvP/ormRatBJjFV2PKHXQDXdcVj4wOBd+Yp6vWa0nsROufrAVyuIPiXpdX9wRciG/Ig==
X-Received: by 2002:a17:903:1209:b0:1ce:67fa:b398 with SMTP id l9-20020a170903120900b001ce67fab398mr1134295plh.16.1700784056082;
        Thu, 23 Nov 2023 16:00:56 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:00:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Peter Kjellerstedt <pkj@axis.com>
In-Reply-To: <20231122005042.2445624-1-pkj@axis.com>
References: <20231122005042.2445624-1-pkj@axis.com>
Subject: Re: [meta-oe][PATCH] zeromq: Update to 4.3.5
Message-Id: <170078405541.3118595.12317507402159594237.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:00:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107025


On Wed, 22 Nov 2023 01:50:42 +0100, Peter Kjellerstedt wrote:
> A backported patch has been removed as it is no longer needed.
> 
> 

Applied, thanks!

[1/1] zeromq: Update to 4.3.5
      commit: 837b2b346c9b711c566e425e436730fa04ac36b3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


