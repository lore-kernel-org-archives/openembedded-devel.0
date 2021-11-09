Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA6CC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 17:09:33 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.15241.1636477772259761096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 09:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DJhJ6FR6;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id p18so22012107plf.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 09:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=H2UU7mxhIgl6CwNPnQslzx7FXU5aExEAaqLaNuYt7co=;
        b=DJhJ6FR63gJUb5PGseZRirLV/OGgOWxRxq5e9kIH5gsvBCDaLDGbflBjyG7x2J45dq
         TfTIGlonOmnZdggUq0JMmECV8I5cIsT2QzLr/lYVN4MpOamQsgXd2ex3dW5jsCGB1z0C
         BIuHFyrNUEIOU3lDLMAR2uND/X+vDE43GrTCkKAdNM8lOWuOAMsIaAR7yeBNIiJT6GY8
         9aO3yY1rb8jA5xrZ10X00+ftzSkwaZ+h+TYwmtHp1mP1dAZcjd6b5fPgn/tgJ+cgUVG0
         7Ti9IJRnrCV6g70YIphX5ZXkgmMtEhHgXeGASXW3vqtT6bcBWuIjnXoFYV1iOVur8kyW
         B4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=H2UU7mxhIgl6CwNPnQslzx7FXU5aExEAaqLaNuYt7co=;
        b=mYf57hlzGJGV3KIyDi3ZjNpM8uAfxhVQblaAA67sXpdNYqFvI+goQPEuHQa/Mw4ryV
         RSLuSm+8b3nFmrG9znYwQRU6uXtO+ngOKYkeuWZZGdR/q9R/fhwRxEGzvcdjpL7/ZA9c
         H4px8M39Hn/Y6c4XjKQdqQ+niZe6jM6cszYUekfhZBcb0/aeJ0OvNZ5cbp5FWlBXBA+7
         UilzVtYqjHe3T+2DVCUmN2CyUfFyE03V2ZLZ58pI5P8DbjxC5C9SfK5iwPpcy1xWGFoq
         YtXLNlghmD/hGHAHhq2fXdji7B36Bc1OtDIjEOMHBy7PH8z0nIh+F8SbHS3gLhJxQz2g
         0gIw==
X-Gm-Message-State: AOAM532Cx5RpQs1pGY7+3k9v5FlbyJ0C2DzF+AxTn422StSDeOs06zb3
	L44a7/Zvw7re+zenb0ewgb0lxL/rU0A=
X-Google-Smtp-Source: 
 ABdhPJzV/UJvhky5J8bnTgOCG2hmUoyMww55CVN0CTDnlWI+RShMlbXZVqs0suxj8VoIM29OAUcZ6w==
X-Received: by 2002:a17:90a:b107:: with SMTP id
 z7mr8836729pjq.104.1636477771656;
        Tue, 09 Nov 2021 09:09:31 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:16ce:5a14:d81a:4e0d?
 ([2601:202:4180:a5c0:16ce:5a14:d81a:4e0d])
        by smtp.gmail.com with ESMTPSA id
 d9sm7820799pfh.65.2021.11.09.09.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 09:09:31 -0800 (PST)
Subject: Re: [oe] [meta-oe][v3][honister][PATCH]
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20211109170140.40651-1-akuster808@gmail.com>
 <CA+chaQeN2EH=nWrhH9eWH9hGs=U632ULx0WRa7Tz8wXharddNg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fe7f63b2-f639-6259-7031-8a19e2bac362@gmail.com>
Date: Tue, 9 Nov 2021 09:09:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CA+chaQeN2EH=nWrhH9eWH9hGs=U632ULx0WRa7Tz8wXharddNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 17:09:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93890



On 11/9/21 9:06 AM, Martin Jansa wrote:
> On Tue, Nov 9, 2021 at 6:01 PM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Missed tabs and spaces in the SRC_URI during
>     'Update SRC_URI branch and protocols' translation.
>
>     [V2]
>     Fix typo in imagemagick, change "gitk" to "git"
>
>     [v3]
>     Give a typo, fix a typo
>
>
> [v4]
> Give a commit summary (it was there in v2), but now there is only:
> Subject: [oe] [meta-oe][v3][honister][PATCH]
>

time for a vacation


