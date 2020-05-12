Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.1661.1589318710223187411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 14:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JcFUiBhG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id g12so25588275wmh.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8UR1f2AF+AlUy9aLo/cZDl88feuHbeP4uO69AAQ9H48=;
        b=JcFUiBhGbnHQF9VIaqaSkvVPsyEARJ1LpHOOS8kybZzuynCHSJ21+0yufjt2XjLoZf
         CVKHe1hbrMLpcwxEoL63TfHFS758crl9gyoZOkt1U3kMZyPBWvW2v7ddHJHYAA5pjmpI
         ljNx4XXD5J1Rck9UiuLlTOFCFb7M22z4so8nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8UR1f2AF+AlUy9aLo/cZDl88feuHbeP4uO69AAQ9H48=;
        b=RGzNKBm9TALhVnxJJ2SWXNOJasrgnXDRu0UG7409Z0m0QVAWbTHcmWHcOlT46Y94cx
         +9ueYEihAum+3Dxt3UqdcsaKctxKlqfD0xHzqLwInkGpTliYIEpYIj5Ls+g0aPtnkAIG
         kqhEsIT2STzH52D5AJ4gsw2aqfaca+thzhRfvGAzRcNEAETKy2dF8l4A8e95J4VKFAe5
         pxQn2awbYSL0Nt/f4P8tmxBe4sL9A2pPrE1BEB2jqZljKwvF22i7Rnp6fonKcKZ+qkW7
         y3F6IeyYSX9BfDIkissV2rE4NrbYMxo8zkvo6QNkSSwi9Derae0Y1Vy993Ds3qJLHV0k
         hR1w==
X-Gm-Message-State: AGi0PuYOw3B9kBG3nY8x0jCGrvzcfFp9PyJykJE3jVVwp7BkcXPe6BF5
	JyaX8+qMqMYJp8xpnHqKASEgDxcy+Vw=
X-Google-Smtp-Source: APiQypKjiZLxzZwMCWtKUh/8n2nSu53BrTiZnyoFNm7Bdc5lU/dX0Lfslc6g+0W87uDbInIR9pn5JA==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr39057313wmq.175.1589318708468;
        Tue, 12 May 2020 14:25:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t6sm8888850wma.4.2020.05.12.14.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:25:07 -0700 (PDT)
Message-ID: <3b88b310444e4e1d90014d9e647e9534af3d6b08.camel@linuxfoundation.org>
Subject: Re: [oe] meta-openembedded dunfell maintainer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Date: Tue, 12 May 2020 22:25:06 +0100
In-Reply-To: <b7017ef93f45a7a825d42d1ae3f4c5082ea45186.camel@linuxfoundation.org>
References: 
	<b7017ef93f45a7a825d42d1ae3f4c5082ea45186.camel@linuxfoundation.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 14:18 +0100, Richard Purdie wrote:
> The OE TSC would like to ask if there is anyone interested in stepping
> up to look after the dunfell branch of meta-openembedded?
> 
> dunfell is an LTS release for Yocto Project and it would be good to
> have some kind of plan for meta-openembedded as well.
> 
> We believe the 'policy' for the branch would be broadly similar to the
> one being used for openembedded-core, 
> https://wiki.yoctoproject.org/wiki/LTS.
> 
> If anyone is interested, please reply here or talk to Khem in the first
> instance as the layer maintainer. He can no doubt answer questions if
> anyone does want to discuss what the role would involve. Its usually
> for the layer maintainer to choose the maintainer but the OE TSC would
> be the final decision maker if needed.

There was a little bad timing and after the TSC was asked to do this,
Armin stepped forward to maintain dunfell but the TSC didn't realise.
Thanks Armin!

Cheers,

Richard

