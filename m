Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39381C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 11:34:08 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.5171.1742470442380628939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 04:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wgm28Wi6;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54963160818so951874e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 04:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742470440; x=1743075240; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miQEjC++uj13TMhXax6lfcNrkrd37hYSYSEoA/hynHM=;
        b=Wgm28Wi6rp93TxMXDjjcKiN/VP6KMV5fL6rtsuLTr0pWFE1ARar3KSA46EBzd1Z538
         LdmIVHhVyZhkRhEQ0EDuqu/jMPbKFgVuKeUGSiYEQLyk9mkPMRifnWEn7VcW3NK6FKjL
         TkV6HiHlQd9vd+J+xGQ7DYgPAX4y2vaajiSJOnj2CU/k6Jvbf82rUcrAaH1JOL61aVey
         U4O6l+h3XCV94uxv5/HcOLM54CKtCQiH/WTE/Bl5UPdX50xk8gyY0/2dBzLwizawrxns
         e0sficOmcH9nrI0VfHAdG8NCC/QElBfSjzL8zyT3E0zEZaph5TeOk8SUJwag8zMgx3Fw
         Wxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742470440; x=1743075240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miQEjC++uj13TMhXax6lfcNrkrd37hYSYSEoA/hynHM=;
        b=i0QauClPF7yECdUB6CnyZODF2f6MuoIZWOtB4GQfbO6Uh5/GLzay2SkQXZqPD+c3fb
         wqLoWgtvIFWOg2lkP6N8FZSQKKP8EXP7L7KaFjpIWfEw0pjdDAhlP6dQk5Zfhjyz3UBY
         0mEvTZ4mgALkQ5KsG8ro60jXgiFBfEZbhANGkf/SkEEov0IGV3RpmEMMabYFxE9qDJot
         jUVW91X912pGIaS11z/Ao6ZwYWZeiJrnDrBvuE/k0bgIgt76nwABUSb+5Rf/Dqq+fBwg
         /9tJFLfdWMdlW9mMVYQentTrGDxe+NiP5fDojXCR9mY/uKRLbSCtwvSQUZxNRQhs9G/q
         9JGA==
X-Gm-Message-State: AOJu0YyWZdt6mj9Qec2wf6EwD5LhjAOnNXiUl1EVWdjs6QoMAnNEXkcR
	pGVrV/7bVO4b1vK58C/1vTTF4r8/vPS9VpikJF+IOA0MXRTV4MkqcUb+oG4Z
X-Gm-Gg: ASbGncssqOoVzbA84hMKsCa/yxjnyEuSXDvWRoOy8ZZtIuOkTHSUaSrTOwO7izkoDoi
	ybIqbWg1dpNDyuuGcXa5A6Tm8K1t28lJwxFqcHJhGTkI0KhAfFZu5VDg0LryuBcTpby8lwFmU8+
	+3gZFI9tNicSHLaMk91xkwa60BK1I7b1kifoujhbEi6zRruGujyOkYVfg/nV6sk/JJnE9mzhaNF
	ngJ9DC3Tr7rjUEOTaN4gHASRDrle0UDqfxKnhuuTx8hNCXCwmzWWERJQrEULVZScLt7j9HOO48N
	i+Dw1iadoUNK6QKYBRcH+QeIvprk6U5SNUybui7BxuLpQGHQb1ps99gNetcj
X-Google-Smtp-Source: AGHT+IHmmp29zF/PvJ9UHhpa6lKmKUWnJ0u4o+fiBnAD7oNfyUhI/lLWZj9hSf/cG3eqQFEjJgt69Q==
X-Received: by 2002:a05:6512:3b84:b0:549:6759:3979 with SMTP id 2adb3069b0e04-54ad0629d20mr972080e87.18.1742470439600;
        Thu, 20 Mar 2025 04:33:59 -0700 (PDT)
Received: from [172.16.6.176] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864e24sm2234711e87.107.2025.03.20.04.33.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 04:33:59 -0700 (PDT)
Message-ID: <a296b378-45d9-4cbe-84fd-d562a69e9ca7@gmail.com>
Date: Thu, 20 Mar 2025 12:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2] python3-varlink: Add recipe
To: openembedded-devel@lists.openembedded.org
References: <182E7EEA322A6682.30505@lists.openembedded.org>
Content-Language: en-US
From: Omri Sarig <omri.sarig13@gmail.com>
In-Reply-To: <182E7EEA322A6682.30505@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 11:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116133

Accidentally submitted without the proper prefix, I'm sending the patch 
again, with the proper meta-python prefix in place.

On 3/20/25 12:19, Omri Sarig via lists.openembedded.org wrote:
> Add a python recipe to install the python implementation for the varlink
> interface.
>
> The recipe is using the current master head, instead of the version from
> pypi. This is done as the pypi version is 4 years old, while the master
> is continuously maintained in GitHub.
>
> The runtime dependencies were created by looking at all the import
> statement in the installed files of the repository and looking at the
> relevant packages from the python3 manifest file in meta-poky.
>
> Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
> ---
>   .../ptest-packagelists-meta-python.inc        |  1 +
>   .../python/python3-varlink_git.bb             | 28 +++++++++++++++++++
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 3a1fb13ba7..40df4f08f3 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON = "\
>       python3-unidiff \
>       python3-uritemplate \
>       python3-validators \
> +    python3-varlink \
>       python3-wrapt \
>       python3-wsproto \
>       python3-xlrd \
> diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-python/recipes-devtools/python/python3-varlink_git.bb
> new file mode 100644
> index 0000000000..8b5e01cf44
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = " Python implementation of the Varlink protocol"
> +HOMEPAGE = "https://varlink.org/python/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
> +
> +SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
> +
> +SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit python_setuptools_build_meta ptest-python-pytest
> +
> +DEPENDS += "python3-setuptools-scm-native"
> +
> +RDEPENDS:${PN} += " \
> +    python3-core \
> +    python3-datetime \
> +    python3-io \
> +    python3-json \
> +    python3-netclient \
> +    python3-netserver \
> +    python3-shell \
> +    python3-stringold \
> +    python3-unittest \
> +"
> +
> +PTEST_PYTEST_DIR = "varlink/tests"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116132): https://lists.openembedded.org/g/openembedded-devel/message/116132
> Mute This Topic: https://lists.openembedded.org/mt/111806411/9376131
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [omri.sarig13@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

