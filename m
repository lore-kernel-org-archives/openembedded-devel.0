Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97393C47422
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.98049.1703665288051347779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iNB2FX6s;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5943a178d57so2320850eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665287; x=1704270087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2bo15epQrqYUMDgu5uSyMlJsojz6LWtDJ53hfBJwIU=;
        b=iNB2FX6saI3CWfBLMGHZR9H5zIjTJ7S2enIjMm9/Wshr7h6mn8iVTNgowOVCYL+Ggw
         2kcYkHzi45/JP1cH5lq/otant3DClzIOaXqlhEebYqjEbIhDkOnt431Muiob0FuM2dO7
         BEjvNfvX0oxidlwiRgbst/jjy//xVdI3OiAPbPUV7S0mN4MVyxxSjDNljtaLlsEQefrN
         SVPlhPnlpTL4CZ5ajOmDE957SFIMfmxotfLWIznJ3U3WA1Mo3AokFcUdpOLAWF0ejW4G
         ibLmUe7WR0AA5n93iS75tj/o91Aa8jdkcXv3jjwYZX9k2+F9NldlJbI/XbnCZWx6M2TD
         1yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665287; x=1704270087;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2bo15epQrqYUMDgu5uSyMlJsojz6LWtDJ53hfBJwIU=;
        b=nwuhYZCTaEu5Pqjn76ecWLtwF0WSIgdijc5Hh0DCy68JXX3bAM9xVQruhZmFIifnfI
         E8N691xa9icUiEGbGpU/pbn6KGNIKRgwyBpcUB/sK7LlNDlymzdMkujOI0WJSNjASgaH
         k7vOsPsDzO+9/JOSLBx7/fLKaaO9sYJJVFgpyZxTjFbuj+na3sNJP1zjyEufSfDu0Wej
         tMuG+qanFw7luy+6LMWC+MIFr4pfc7HarwxD8ESr1rPHqx/dfyWsPXg7qLpj4wb3XoYJ
         tXfOXSW5YBQrxA6vjSk80D6v84kucHdCoG4ekaaDlGQhojmf+zJoiOrjFcRm6dMTByzB
         7wSg==
X-Gm-Message-State: AOJu0Yy/eEst/KyICUPnBhg0Bk1wL3Gs3n4ZFgv6LMuIJ0m1yNLdyKgS
	XS+SgPj2t6NOVUaZY1er4Sg=
X-Google-Smtp-Source: AGHT+IGdP31UhDmpcI4ge9OXrnn/6qPpb7U/aq8teu3Gj5yqLKGpuVBwicbJstsXjPpxrguNHzVBow==
X-Received: by 2002:a05:6358:63a5:b0:175:710:d56f with SMTP id k37-20020a05635863a500b001750710d56fmr359502rwh.36.1703665287257;
        Wed, 27 Dec 2023 00:21:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220230618.3833009-1-derek@asterius.io>
References: <20231220230618.3833009-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-cantools: update to version
 39.4.0
Message-Id: <170366528656.1947762.6816748463895686660.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107832


On Wed, 20 Dec 2023 23:06:18 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-cantools: update to version 39.4.0
      commit: 7b3b4532a26519416ce7428cc40c6857919ec984

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


