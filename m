Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B91C46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.14745.1701215716254154035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKKMujga;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cf98ffc257so46508765ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215715; x=1701820515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R97LinKJTC+DJFIp1D34AHR/DO7edyuuvB/gymY1i+M=;
        b=KKKMujgaLcpxrIPCJ3AGKD3BMLQQT/ZqjhQfn0WkFMMtcQYVdZKDNEnJaVhcevIGI3
         zNWkE0YiZlsTcwJcQrgyMcnwAHR1/V0qJMe3Zr0VIW9pSz/pDqYdhlJJ4Yetik1zlOK7
         DXEFt+3XSWorhA9sgf3cihndTbAqV76AUu5G5R8oPuP43ESfCS6uD5s7G/HCNWeHWH1b
         JE/Y9W5/gaXPBdqYMfZauLMA1F95o2Ezdb2fGI+vsNYjAJnt5pH4G1MoI27RWZvY8tDd
         yxRjS7a5igEfIPSJcgnMmdJauKFU0PGrwYOr9/JkqlAeB+yNS3E0ZhMO6VSg79iLw5Ol
         MLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215715; x=1701820515;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R97LinKJTC+DJFIp1D34AHR/DO7edyuuvB/gymY1i+M=;
        b=GnIPJac9vHIQac7U8EWAo6XBPT58jljsbuylQ7J1iDjAGU/8Yb85MOp9ba7KSW7h5h
         uv5df4VNNXaUcvpH6fKXtcwihW6TSKI8QTchvxm18SZ9Rdx7k6WGOKSZVOzghe8GKBre
         nSE7/bu8x48qLsMkvjw8xpco25viO6XwPL24xKh4RHN6DRIid/w8ods7wYV6kG6935pQ
         A7i5ZTXEAq0H0jo6b8hogyGIj2ripmBt/mWUC6+4vIHceVUfvwYC6wHICwAz2y7L/iz9
         XkUqBQF2MLmmMyzoy5tnPidKSGQ3WfqAaSRxlynkrVNII8Gx+hbAcxt3bdaFWrLyNUKN
         EuzA==
X-Gm-Message-State: AOJu0YyoeYJboBY1DCuCUc5+4hYZSd01B5GUNwzUD8LFs2+C96x9h2GO
	i4kVh+sy3nXGLqaL42aZ9lG0qTcw32PP9g==
X-Google-Smtp-Source: AGHT+IFJ8p9Txf/HbAlXnezHC3rFFzMReQbCFaPHTYpwWfo6BK71RmiwapoDXn5sEZF3EoiCpzyuOQ==
X-Received: by 2002:a17:902:9a0a:b0:1cf:a9c9:4893 with SMTP id v10-20020a1709029a0a00b001cfa9c94893mr17496036plp.38.1701215715366;
        Tue, 28 Nov 2023 15:55:15 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159526-27824-1-git-send-email-wangmy@fujitsu.com>
References: <1701159526-27824-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] capnproto: upgrade 1.0.1 -> 1.0.1.1
Message-Id: <170121571414.1187527.15155086723176561480.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107105


On Tue, 28 Nov 2023 16:18:46 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] capnproto: upgrade 1.0.1 -> 1.0.1.1
      commit: 5c9927db548496dba06cd76c324ea9e8c056348c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


