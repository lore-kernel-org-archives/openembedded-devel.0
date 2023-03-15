Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F08C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:17:10 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.9248.1678889822686202297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FxK7WpFT;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id cn21so45991851edb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678889821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGzzySlGygxcxcwn7kqvvnuNxK84Fnjg8NR+fDRy7nM=;
        b=FxK7WpFTMw2oBBTB1N+5F+UDR9zFtszqiChIJGrh+8fgapLHaCIbP6iVoghYG0cOlt
         3kwkVfaLzui/QAIczltz/WQIxPQLksRI5Cx1GBvXcGw7aVoW5eDS1cx63hrZijuBZCaa
         /Bw20IJ+1JzloEFLNUCGD75H4qic/Kud/9dDoeJQTU+ghWfacuJ0h/3ff7PE91r4rCJv
         VGW11z3OdfcHc8tpc97MlNGRwtPL6CR62v4bRySTIB+7JPJnS7ugbO2m9Oj35BVef96T
         vsQ4JJVXHe+YjXQgC9mYrNT6dYRpbqEB5kyt24YFJu+oKKXohmVeLrYm/d/fH1c2YYGR
         DtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGzzySlGygxcxcwn7kqvvnuNxK84Fnjg8NR+fDRy7nM=;
        b=ahIAKQzosa1QIxlZqCzczpFeS8d2CMRSijlIys6scz38dYcZ576In5URlL1tuiRkdL
         xkGAgzWoQ483To1mLiJE3YAuYruOcsi6yo0PJnmxFpkN+xbmdmohksbOuyfgVaSqe1ls
         2IWl/z8+ecvlSoNbr4EAVD1gtlG9k6xLPmcAAlOHh9jm+nw9ETIK0l4yfP6HojeEmJts
         Zv0LsBFAo4moOM2cHG215YFFX2gd9uIWk/I77EtdoEleQLckyhpWUa2M0IGJY9C8HH55
         EGe2Y4SAfx3EmgzEZAAuzhOKRA2NcW+X1ejAsiXcDrG2cvgJ9cJVVkpNMJq95nT8XvOq
         cqjA==
X-Gm-Message-State: AO0yUKWDP3lFdFXV0sQCQbEXbCmOSNPTC/b9ur05jLu7BM0fuCvjIVmi
	4VCD9QilSYtjff05U1++5atnFA0Fk5A=
X-Google-Smtp-Source: AK7set/ZZpUb20LEv2Fs8X/sGZpmSIR2paLGFrTfkwAV20Kmb+JZEwjkrEp2IPKvxn7Q0tGY1WZN4Q==
X-Received: by 2002:a17:906:7745:b0:924:64f9:f8dd with SMTP id o5-20020a170906774500b0092464f9f8ddmr6158797ejn.28.1678889821021;
        Wed, 15 Mar 2023 07:17:01 -0700 (PDT)
Received: from [192.168.1.143] ([188.36.64.204])
        by smtp.gmail.com with ESMTPSA id qb8-20020a1709077e8800b0092ed6b8cd5bsm961966ejc.158.2023.03.15.07.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 07:17:00 -0700 (PDT)
Message-ID: <ef5796b4-41a9-1eb4-fa5b-8a30d12c509e@gmail.com>
Date: Wed, 15 Mar 2023 15:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-python][PATCH 1/4]
 python_setuptools_build_meta_mesonpy.bbclass: New class
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230315080429.2722555-1-zboszor@gmail.com>
 <25DB9C8C-6830-4DBB-9B27-4FB04C393F38@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <25DB9C8C-6830-4DBB-9B27-4FB04C393F38@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101561

2023. 03. 15. 13:46 keltezéssel, Ross Burton írta:
> On 15 Mar 2023, at 08:04, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> Some python modules (e.g. SciPy, scikit-image) use meson-python
>> (a.k.a. mesonpy) in pyproject.toml:
>>
>>     [build-system]
>>     build-backend = 'mesonpy'
>>
>> This class, together with python3-meson-python and its dependencies
>> will allow building such modules.
> So the pep517 build thing provides dependencies (which we ignore),

Does this mean recipes using this class would specify the
build dependencies themselves instead of having them
brought in via the class?

> build isolation (which we disable), and automatic use of the right tooling (which we have to specify manually).

Not sure what this means, please elaborate.
Please instruct me what clean up in this class to get this acceptible.

meta-scipy has a quite old SciPy version and the latest version uses this thing.
I have a working scikit-image 0.20.0 recipe also using this.

> So what does the meson-python integration bring?  Can we just run meson directly?

Unfortunately, no.

meson itself does not provide a PEP517 compliant build backend.
meson-python (mesonpy, https://pypi.org/project/meson-python/) does that as a wrapper over 
meson.

I tried just using meson, but while it the .so parts were built,
none of the .py files were properly owned and no egg metadata
was generated. While the first issue is fixable in the recipe,
the second isn't.

This resulted in that the presence of the mesonpy and its version
were not detected by a dependee module's build system e.g.
scikit-image. I would expect any project using build-backend = 'mesonpy'
would fail without the detecting the meson-python module.

>> +DEPENDS += "python3-setuptools-native python3-wheel-native ${@'' if d.getVar('PN') == 'python3-meson-python-native' else 'python3-meson-python-native’}"
> FWIW, all the other pep517 classes have a “neat” depends without logic and expect the recipe (python3-meson-python-native in this case) to remove itself from the DEPENDS.

Thanks for the pointer, I will make this change.


