Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9D2C47258
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.98051.1703665290514390053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4TBgJSn;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28c0df4b42eso2227939a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665290; x=1704270090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoN3Y1TV+89O7GxNUwzDrWIK3o8PLI6aIn+HFBDRulI=;
        b=K4TBgJSnojVf/F1H8KDs7DP+sKI6H83FXv+xalCbvc+1f/UmrSn++NasE9By1A+OxN
         uIZshd5aurIXOWfOoZWNcsvmp8ZxVr6DUqIj7bS/cBW7P5bLJ8GRZEZA66JWTAXW709+
         idRRjETBbAPscBUzyiWurZ9j2sUFsDtHSmF72fHyQ3QjrFFN9PIxqbpPVG5g3puVL5Yt
         lRzknKwogqgTiRymothkA1Vi9SiWu+WAYoA5/vml1gctQM9PTtCUzVDIox5jVCyIBvJv
         RGt+Yir4EWgAxrjQ1iq0fQNzGUmOGfeoVFQ83OinmzW9Q2HUTV/L62fGb9SQ7ThjHZUL
         ff5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665290; x=1704270090;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoN3Y1TV+89O7GxNUwzDrWIK3o8PLI6aIn+HFBDRulI=;
        b=EsceXdfVpwecoPmcWRS+OgxsNpDdGD/94ERLzNiCPdCW1IGWOltLWc71SYdXS6WnT4
         rM4Vz0bZ1JoRB7cTK0uv/C0XWcIFioJzuKu41MsqRtU/tvQ+H/9Em4dTcRFsUB0tN7qj
         1+HvAmIcEZv3kjTNGbWUNRKlon6uf2ZDWMBPQ0Lr92ishsrgnX2P8RG/JHmm/msH4mBX
         W0vwGX4zztY4TqxRv4P8EYIufwohaloZowGHysyG4Neq8w0MERUacwCW0mfhzJae0LGB
         ir3/beO5qxCTv1t7Ph+bWdKrZOQRX8gQ28xGReQxsgNgB7gH09meCEcwhjQPRBOe8x8l
         I6+g==
X-Gm-Message-State: AOJu0Yyfs5a1guJ4qyi0fMmdrO/Do6dgto+ZmnAFcwgu0ksFBRD8MTe2
	s6ZKN2eFMjNDR3phCAivCCM=
X-Google-Smtp-Source: AGHT+IGyz/rWRAwu2dJDgvonKtV0YIb/gmRcZTqmjuq7jSnr9H3ZF+Aziah/O6lbfWkNJamZWo3xPg==
X-Received: by 2002:a17:90a:850b:b0:28b:bbc0:c555 with SMTP id l11-20020a17090a850b00b0028bbbc0c555mr10736028pjn.8.1703665289935;
        Wed, 27 Dec 2023 00:21:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220231312.3842099-1-derek@asterius.io>
References: <20231220231312.3842099-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-apiflask: update to version 2.1.0
Message-Id: <170366528917.1947762.14075844919511869260.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107835


On Wed, 20 Dec 2023 23:13:12 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-apiflask: update to version 2.1.0
      commit: 01d5c8c626e2baea0b37f1a5591cf86ab7294d1b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


