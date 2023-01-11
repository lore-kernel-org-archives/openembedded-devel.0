Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7123C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 17:16:21 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.30057.1673457372329847221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 09:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FXkZPfoR;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-15bb8ec196aso4451982fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 09:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRw0nqoSmcI6la7SHjmbx8d3/pIzdcPCOoHShH7DvTg=;
        b=FXkZPfoR9OmP3b+2enRqzqkpdMKL/KVoAA+93XXzWHMOe3hFWyjO+touYDKtZ4MRy2
         IFxqIE6MCNizfAWcyy1zqxau9qbEXvmYW/NITZDr20X1LVe688H+G7ksyiDWmLu2NEet
         op+VamHQYbVySAqqG1YBI7SOwWcWuaMJGjHZGMFWa8eQPG/0od6MypGRxzcv/WKP6mSu
         xOaFIYgfAcZRLESkPz3omfFaSFgTa+y96Nar8y2zOBuhXGAZz84ZeFk29NYewAdpYuDL
         taPGkhvsiTuKddTeQslQa0f9eEy162MHzmRhmFzq5CnsNqSjiyDfOhTUkzMkcI7DcyXG
         D+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DRw0nqoSmcI6la7SHjmbx8d3/pIzdcPCOoHShH7DvTg=;
        b=Z1z0rqRpzJYknxocf5z2vdPp818a9Mevczcn2AfNwojLh85hws5xREhG+I+ujiLz0d
         eEJunlOhzEPH+GunagwmCko+T+KdhAbU/GEYYoEMIlFG2oOAjCTun50X1C5Oarqh8PFv
         yF6j8/uwyKrF8eR1hD+qo5dYj8vItVwHNu7ALpceagSuP1YjWcmCjou7nzGIqjdVBVjK
         TGUApYJL/xJHDNH71VN8xt+hVMjme6gBLltNRnL/hCb+PKABIKQZ418Vp+zoKprI7dbf
         JBhMYH1Hw6dpd3yuFrHDdVQME4Qk3SpgoWU6+6tLxNqcQDR7FLrNJkHlYsd6MvIM3yEH
         dEZg==
X-Gm-Message-State: AFqh2kqY3f+JzzAVJNcWQnLkt6DWJ/tYW1Ly+1c62aIDTxBmBdovv6hs
	Xsgw1/g/mPYp5McNhNyVKis=
X-Google-Smtp-Source: AMrXdXud6NqgBFdoB588Gd7cajlRcN+72fySIdToMz6eqo7ROricPKt0/bX4jLZ6qgUf/7y3MnXtbw==
X-Received: by 2002:a05:6870:9592:b0:148:2c02:5322 with SMTP id k18-20020a056870959200b001482c025322mr37121687oao.26.1673457371636;
        Wed, 11 Jan 2023 09:16:11 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:826d:df1d:b0a7:6601? ([2600:1700:9190:ba10:826d:df1d:b0a7:6601])
        by smtp.gmail.com with ESMTPSA id bc31-20020a056820169f00b0049f8b4b2095sm7295253oob.44.2023.01.11.09.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 09:16:11 -0800 (PST)
Message-ID: <ec4b606e-aa99-edab-0303-2525dee8339a@gmail.com>
Date: Wed, 11 Jan 2023 12:16:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Jan 11th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 17:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100554

The following changes since commit a9c25bef8882a69fd35ea7dbac3d978ce440fe06:

   mariadb: Upgrade to 10.7.7 (2023-01-04 11:46:45 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 1f31570d0795da90083d1dbf28127c90908e30ee:

   multipath-tools: fix QA "dev-so" regression (2023-01-10 09:26:26 -0500)

----------------------------------------------------------------
S. Lockwood-Childs (1):
       multipath-tools: fix QA "dev-so" regression

  meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)


