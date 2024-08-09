Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089A0C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 21:13:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.94294.1723238023576954250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 14:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TnRbyqnB;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-710cad5778fso1941023b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723238023; x=1723842823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVTcPL+vxkLKVjUdhrfWipBBQZeG4i9nHsQlDhDtAEE=;
        b=TnRbyqnB44AWu9FBkhW5cBRyAL4275aw7WU5gRcIejsJ72PAEic/0miNC7zMSGUOjX
         L6fQf0YcsmXAbhjSRIHHgPSqREDHnWw+ZZhGsH7+Scw8RlM5QZeP/sh2lNFQGZEmuMq3
         Oh2vjc/Wej+ObfJ7gvaHjmb4zP8CNVYvla/FHppxBE/k6M3O3AJ/wEKoSC2Gx1gemOwV
         96M5B2Di1qo4NbohRyh7YgjJ/nQey3WmXnW/1eUZQNstrVqrsVjYwOri/LY3QzO9tsHS
         N+MbxwzBxgLeSjY1eP9excZsR3WeUx98BSZsTN1lYZeBJSCQkh5vdAUcWV3VnNF9YF5/
         kA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723238023; x=1723842823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVTcPL+vxkLKVjUdhrfWipBBQZeG4i9nHsQlDhDtAEE=;
        b=lOKDmPLqe8zsH2doGHwJ1oF21WxdG8ZMRQafipxT7q36Dx6J0cL4PDOfJBrWWjH6Fd
         dWEC7Z1NAbahVjENxsLUN3nWCh4yXEyCrLVnkk3zsOxLMQuMkXNaVBqhFH9vGeZ2gA6Q
         wNbPGw9T2qCQHadYSv75dB1X6vZtGyrFnn/az3j9W/Q8pcfDolEAnSXAH3ICzSB0KX0z
         fQYwEqZrGiOE0Cq0hYSzqOAI5Y05CZJDxetLlrl4oR0kemlxPlPCkmtwYl7nRxX1nhv/
         1dOyF9Uc0n0r++qE6GVFEUZ8xSC/HLhuII4xaCLMINfLykRfM2NBDeEp7VLcq/EJPtzY
         JlZw==
X-Gm-Message-State: AOJu0YxUhc6/COSn5WhvySpg15fISVNlo98bQFVGAPkVAxI4NuQ1rir6
	UQSLD1ri4tzAIZqg3q1IVqPoeoOErV07dRStc1S0MLL3kGO/RsJF24FqhQ==
X-Google-Smtp-Source: AGHT+IFHVZD8e+MAjHLuFU1n/PYCiwrqQgH2WjCfa1+G1Y9S8NWumztd+h5PnDmnPKSBpWsKd7pMTw==
X-Received: by 2002:a05:6a21:3a94:b0:1c4:b4d5:e140 with SMTP id adf61e73a8af0-1c8a0277a18mr3716882637.47.1723238022578;
        Fri, 09 Aug 2024 14:13:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cae3sm111225a12.62.2024.08.09.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:13:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: gudnimar@noxmedical.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-python] [PATCH 37/60] python3-incremental: upgrade 22.10.0 -> 24.7.2
Date: Fri,  9 Aug 2024 14:13:41 -0700
Message-ID: <20240809211341.1854649-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <30467.1722942452178350507@lists.openembedded.org>
References: <30467.1722942452178350507@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 21:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111728

would you mind sending a patch on top of this one to remove the dep

