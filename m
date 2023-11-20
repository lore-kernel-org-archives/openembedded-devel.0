Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4FCC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.43639.1700452272620238565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aB+6sOnA;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5ca055de41dso6266307b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452272; x=1701057072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltETM7bYHYl8T1JsGkM5TQHJLZKp7IsCN86He5TRjSs=;
        b=aB+6sOnAQodPGMOSf93rZimkxMvxEXGXC1vNpGmwsvfdtTrvfy3CldC75vJOBGVj3y
         0O8u6FqF3gcEh3lvbGFzANaFAEbHcWJ6ADAW2DlnF3qFVsZodDMcM8mNTnqMLA9lVEt9
         hrJjdH4Q5XWDLPSG3HxhwFTzI8J+5/oqeEq3X46S92lJGCvrbeTcDENfo+aQCdO9MVXf
         jfXhDVK9AQs84lnUTCILpa8GsnmMWR3R4AwGz7SKktxAKie8UbOAxb/l1O5X9eDfSAkM
         TPFIEfRdfkLaj6LnRuRhOty4t/2xm9ROxgEqReDTJBDFm/QWr3Ewe7dhyv+B+O529215
         IYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452272; x=1701057072;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltETM7bYHYl8T1JsGkM5TQHJLZKp7IsCN86He5TRjSs=;
        b=ZW9IebZuO0n43xc1c5WYolgj16S0PdKg/A00Mwg7u21tOH8eao7qRRSOR96NAtdGWs
         hBqntOcqHhDMUgYYSHLw8SW2QQrEvnDKQmlmfaxXbOKdEtvyDrI3VcKqG///9xGzp8yK
         SPN2A4dfrYvawLKTFWbd0Z6jsGRh3tNeGw1L0MJ6lw7moKCWlIYYaYMN12LxL4TYjS7s
         7r9gdRImwraje53Er0lhGWf7/KWKcti5HSNlz28Q2h6BYAOiRvrGokpotTbmbG0mtJZQ
         UN5PoLZeRPtGPuyUZl+egrBjsXqeLocDXVqo4shRkjPt0uc2pYcF1fijAqn2XZPHzr/6
         TGsA==
X-Gm-Message-State: AOJu0YyYQixjBoCypfIqJXwrI2K0MWLQGyTwLiIQe6F7euoj2WPOlhmA
	vdhNdobiVQmyXrwxAsJHivI=
X-Google-Smtp-Source: AGHT+IEvkWTcqqTtFEX2SwTBAjG4JTrD4+73lUGQXMfiE9CoaUoqTuJNWiHmHez7sIZUcYtwqX0qSA==
X-Received: by 2002:a05:690c:460e:b0:5c9:de69:9471 with SMTP id gw14-20020a05690c460e00b005c9de699471mr695954ywb.17.1700452271747;
        Sun, 19 Nov 2023 19:51:11 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700124041-22730-1-git-send-email-wangmy@fujitsu.com>
References: <1700124041-22730-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.5.0 -> 4.5.1
Message-Id: <170045227058.1416826.12559794264316539198.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106927


On Thu, 16 Nov 2023 16:40:41 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ser2net: upgrade 4.5.0 -> 4.5.1
      commit: 5244536ba710d485dc5d43945eea1cefcef0d553

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


