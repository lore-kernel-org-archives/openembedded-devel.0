Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBEBC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 15:43:19 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.856.1632757398384395618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UKU7xnaC;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y5so9611040pll.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=t702SqYCOzlxkNeg/22lADmzvTY7h7d/1QUbxutxGGM=;
        b=UKU7xnaCT5FBXBFYkD5dHUr9ifDv6e0BcZGXpvCd9fmQn48fSF4XLt63W913raeZ6n
         Rc2CNLBqOXWl1WEZ9JPr2/nbM5q5LOTq0Yavk9YOFfVxD7jRDiUGrExfvhX3UKrFERS6
         k/iwalxRrVaf8OOtASA88NanCedsDGaTnL+cX+b/ew2+RU9vGlhDQ3Bu2aMWkVpbmkmj
         da9gBCuQ7nPPxlHz9efLgIBJGFR6pcaA475q+pkJNX1v8Zbnggpf2iaQM2EbEJcXGzMt
         Ee1V98yLWUS52ku4JSgr8yd2ZXoBfub4Y6s9qIh+FEwp+tsfSUFF5uDU4YtaO9j+j763
         QfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=t702SqYCOzlxkNeg/22lADmzvTY7h7d/1QUbxutxGGM=;
        b=BTZDl/51p2Vys6qRzD7k8jIbtA0mFRZC4aOnS6bC26XEVK4LRJp01ui+MIrMTDbbVx
         l/ZQgYui8+UtZgp1nPF3PkMkmjVMzO7pPlp72aWagRQiiRV+iCK9rmRwbIM2sEOckN1F
         q+stU/m8OsSlhqrEINSHlstOov49lfpfHj+abG2MDrJ4nHgRArSGVTTlxOJ+tYoEKHaJ
         RoS4oAhGFGSUp46VFsH1aPmnPldu1PrEc7L397o7MtelZeag5TzsFbFQhTnxIyKklKXS
         ZD+PhbDIe6vHPA+X8Q+Sv7vH+lLdlW8Fos9YPcBlKo5AZ6ztmHXhuP83vFJlGmRnNx30
         470g==
X-Gm-Message-State: AOAM530vgPb93mT4DUPTlbw7Qva7H2HBtVNoKwjtcAodJxFoBzApRCe4
	OXTtLUlyJfvpwm09KbEk6tM=
X-Google-Smtp-Source: 
 ABdhPJxaqqJWluvT+G+AAdfdhDw3019RcaDMsKVauCJQRFQOB+Y7YHm1aXX0wD7IJkeoVTsZ5AC2oA==
X-Received: by 2002:a17:902:7d89:b0:13c:a5e1:f0f1 with SMTP id
 a9-20020a1709027d8900b0013ca5e1f0f1mr218415plm.24.1632757397793;
        Mon, 27 Sep 2021 08:43:17 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:15c7:3503:63b:40fb?
 ([2601:646:9200:a0f0:15c7:3503:63b:40fb])
        by smtp.gmail.com with ESMTPSA id
 n18sm17494506pfa.42.2021.09.27.08.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:43:17 -0700 (PDT)
Message-ID: <107383eb-3eed-35e0-03f3-e46d427ab8c8@gmail.com>
Date: Mon, 27 Sep 2021 08:43:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [oe] [meta-oe] [PATCH] libjs-jquery-cookie: Add recipe
Content-Language: en-US
To: zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1632708170-7789-1-git-send-email-zangrc.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1632708170-7789-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 15:43:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93154



On 9/26/21 7:02 PM, zangrc wrote:
> A simple, lightweight JavaScript API for handling browser cookies.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   .../libjs/libjs-jquery-cookie_3.0.1.bb        | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
> 
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
> new file mode 100644
> index 0000000000..e10c6c4d33
> --- /dev/null
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "A simple, lightweight JavaScript API for handling cookies."
> +HOMEPAGE = "https://github.com/js-cookie/js-cookie"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
> +
> +SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=http"
> +
> +SRCREV = "0ba77141dd215782cc7770347a457906908c66ff"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} = "rpm"

Please use new override syntax. Secondly, does it really depend on rpm ?

> +
> +JQUERYCOOKIEDIR = "${datadir}/javascript/jquery-cookie"
> +JQUERYCOOKIEDOCDIR = "${docdir}/libjs-jquery-cookie"
> +
> +do_install() {
> +        install -d ${D}${JQUERYCOOKIEDIR}
> +        install -m 0644 ${S}/*.js ${D}${JQUERYCOOKIEDIR}
> +        install -m 0644 ${S}/src/*.mjs ${D}${JQUERYCOOKIEDIR}
> +        install -m 0644 ${S}/*.json ${D}${JQUERYCOOKIEDIR}
> +
> +        install -d ${D}${JQUERYCOOKIEDOCDIR}
> +        install -m 0644 ${S}/*.md ${D}${JQUERYCOOKIEDOCDIR}
> +
> +}
> +
> +FILES:${PN} += "${datadir}/javascript/jquery-cookie"
> +FILES:${PN}-doc += "${docdir}/libjs-jquery-cookie"
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93136): https://lists.openembedded.org/g/openembedded-devel/message/93136
> Mute This Topic: https://lists.openembedded.org/mt/85891855/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

