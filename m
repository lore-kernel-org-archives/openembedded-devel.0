Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5BAC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 08:24:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.21280.1664958261572887490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=O9MexVbD;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.51,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f51.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so1681373wmb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=D9AwiQNoN+CJA56qZfTrZgXxmjvxpr4XSrak33MVY0M=;
        b=O9MexVbDcNzX0QBbDyEziEnM4P0S4p7xLysJOLCyyki9SDEij2qttkpQs+3AdZAikS
         1Wa1BO95FAIUeyZHNnMXOB0QC4u2uY6qoKR8IaO+oSCVo4JNgnpIU1k+mORkZhqqVEU6
         Pc5RuRjrh8tfMptL83+if++axFzm03jYq19TypoKlscL/IMQayKM3ig6zbIcdurhu0o8
         6/A2QG/ufvGfiGz2IFyXmRNsl5agyrsE9sSNWOoURAlY2enoojJnO0i/JouOjPjlHGct
         mKbsaKGGvIIUN4YkxZC1xLIFJ1SOSezlBXsQ0sbSAmOC9lIdbilObemayRSZz5Zcutxa
         ryiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=D9AwiQNoN+CJA56qZfTrZgXxmjvxpr4XSrak33MVY0M=;
        b=Fwss9wANE8WGTR0zz64xifgybTop4A4XvqdYXQu+VSgAyZ/gXW2nAPBBOkPh1heTDR
         Q5mgwX2OkOcG4A5NFhz21k/WPGvo7/pIqXr5CCgkPKi9gniVnqnbyhfPNmij2R1r2c0f
         VEPGZo9IzLKTMrJaRW4HIq7u8JHPka96xk4zeHPW39QLHnTyjyb8QA+F7kcYyoN+GK7w
         4T1gs5lWjr5qEt+EE5aM5tTX2zZNbQdFURz1bgjQoEnSAsOD/4VhR/GeGefe2I2D5if9
         /TrqVa2aiwOHAiULGVC2xhXrHzpjarX15tk+FWTf9VP/Xc7JnkqS0Ysbx1gAoo03W4zx
         Q7/g==
X-Gm-Message-State: ACrzQf1kIxn62L9EMZkHdnsrBoIAKjhYAqeOmsol+5YZMfLX+sa56RfB
	DRtMw1TS4tsMbJHXlyvTwhwcrw==
X-Google-Smtp-Source: 
 AMsMyM4maK942jqZVnCQDWyI6AS13e8t68xDRQqPeJvQevX075xVIP69CA5Jg60az3yWUxmc9+YwfA==
X-Received: by 2002:a05:600c:2191:b0:3b4:868a:aad3 with SMTP id
 e17-20020a05600c219100b003b4868aaad3mr2519433wme.112.1664958259531;
        Wed, 05 Oct 2022 01:24:19 -0700 (PDT)
Received: from WIPC21110265 ([2a04:cec0:106f:7e5:30ab:9650:2c19:c65b])
        by smtp.gmail.com with ESMTPSA id
 c13-20020adfed8d000000b0022dc6e76bbdsm14018095wro.46.2022.10.05.01.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 01:24:18 -0700 (PDT)
Date: Wed, 5 Oct 2022 10:24:15 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: Re: [meta-networking][dunfell][PATCH 2/4] mbedtls: Update to 2.16.12
 stable version
Message-ID: <Yz0/LyUoeJSfdSNQ@WIPC21110265>
References: <20221004062843.2541778-1-mbriand@witekio.com>
 <20221004062843.2541778-2-mbriand@witekio.com>
 <9d4accb4-515f-0b72-9670-7c5aad728ef4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d4accb4-515f-0b72-9670-7c5aad728ef4@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 08:24:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99062

On Tue, Oct 04, 2022 at 02:16:35PM -0400, akuster808 wrote:
> Why did the LIC_FILES_CHKSUM change?
> 

Oh yeh, good question !

Previous LICENSE file was Apache 2.0 license, now we have three files:
- LICENSE, who basically says "SPDX-License-Identifier: Apache-2.0 OR
  GPL-2.0-or-later". https://github.com/Mbed-TLS/mbedtls/blob/v2.16.12/LICENSE
- apache-2.0.txt, well the Apache 2.0 license.
- gpl-2.0.txt, that I choose to not include in LIC_FILES_CHKSUM, as
  LICENSE only refer to Apache.

Now, saying this, maybe I should switch LICENSE to
"GPL-2.0-or-later|Apache-2.0" and use all three files in
LIC_FILES_CHKSUM ?

Best regards,
Mathieu

