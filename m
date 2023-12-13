Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE95C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:19 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.30689.1702451234088843329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jb/hpUNB;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2030fbc2417so750272fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451233; x=1703056033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+ZSxYaEaMNMpK1WukvP8ktUK5iZ+gxFU7wMLEkbIx8=;
        b=Jb/hpUNB6mr7pls5JTHveMe077x7SemmcODWa8SQSl0oV5Zmh34m3f82RXGWqYcDoW
         jjoNX4YSWRwc8B2NumGqWH0Q6MyvPpcxbMPg7BT+R3rvsCFCpXLUT3hpr1cvo8Pc2Tsl
         k0NA1MuU9unKkHMPtUyYL8UXGqkXGU1NNUlUl6cu4vYd2peX53eHrwiMy2NfsC1MQ9kc
         iB+AWL6AGyr9Hnl5jbI0ePOJHqLRBbNBUJUuY2QrUpszc6F/R6NrrF0zJnG71auJzN7q
         RBahvq2N0+M8309ZAjofiMOSGH59yxMpaadDFyB3jbHyiiv5MTuFJX+a/jIYDuFRWPNA
         UHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451233; x=1703056033;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+ZSxYaEaMNMpK1WukvP8ktUK5iZ+gxFU7wMLEkbIx8=;
        b=m1jGgZP5v6BGUpA8Tc3OY3FzSi3M6GGSdLCXj6IhCw/E761yB/9kPkBMQmx5D/MnbW
         q3UJE600DNv5e7pwDK8nyq6vCoTf2rHGWP/Txk2TotyqjjEEndLZp7QATMKhvg+Xlve7
         zbwMwydESlerM/xi1j6n/ZdWeyROEJs8FXmiz5c837IBeySTFCupw7cbJQEpyebkwUDA
         So7xNS4DNnsmcOw2JzuP/4tBiLGN4GkrZZj7tawpUVBSKNDSJ4THDOpcjVLQZ3idVSxy
         /9Jpy2OsWMh5Z2rYxTOJ36j93BsUoTT16Gky9xczUeCGR9ap/iGRpzzrYTQzzLv/TzbN
         QjQA==
X-Gm-Message-State: AOJu0Yw49KTNqZWtj9XJBos28FV4I+/Fgok8/l/3nStqJk9M3vtd1WTR
	AJ6cwNEXhq4DOu/kRT3T3p66okXgvao=
X-Google-Smtp-Source: AGHT+IGwO/6T4Thtk3qd61WVXLcBOfRnvZDlGxaz3rTKjwpTTe4SE7w/5vy1hyiljHHSTFE79ZQunw==
X-Received: by 2002:a05:6870:e256:b0:1fa:f230:4c63 with SMTP id d22-20020a056870e25600b001faf2304c63mr9113465oac.30.1702451232886;
        Tue, 12 Dec 2023 23:07:12 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231204075356.26863-1-alperyasinak1@gmail.com>
References: <20231204075356.26863-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] snappy: upgrade 1.1.9 -> 1.1.10
Message-Id: <170245123213.133993.15838022858933941353.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107349


On Mon, 04 Dec 2023 10:53:56 +0300, alperak wrote:
> * 0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch removed because fixed in the new version
> 
> Changelog:
> 
> * Performance improvements
> * Compilation fixes for various environments
> 
> [...]

Applied, thanks!

[1/1] snappy: upgrade 1.1.9 -> 1.1.10
      commit: 0f0c4c96d90d0eaf78ef6fa93a150dd5fa8fa182

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


