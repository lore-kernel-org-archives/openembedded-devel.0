Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6313C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:00:14 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.56921.1671559212632822064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nA4j3lHt;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id c133so4286170oif.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d7Zw3vqagsHmTQ4owCfJhYbSTeJemDDBD2f1bPuc1tM=;
        b=nA4j3lHt0+lsgL/6gu+JYHWFUI1qpyC8iu4Zzi4O+B2s0iGT8yLrxUgDI4QflU0vy4
         37Gf9NN8/toeEVBA0V39UZlUa0v/91IJ+ng5y7vOOZuNIBJtsz78kYrYgWw7ozAG5v0k
         Bh3T8ECkGqJl2RsHypFbOMXn07H3bog/h3J5bB9jHp2tYhRj54m5U3NIN/9MuNq5AeB2
         aOfu2SasckzVxSQTRnMM4jXvMEi+wC79rWJbYLhMOtlqBUB0ynpKY8ze12ZM3lbceSZo
         bx483AiqBVAd/UnFVA7A9Lnd1uhY9M7VdKn5qAQvX9jvTADBscP4Y0LP5mZZ2ppfh1PI
         zttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7Zw3vqagsHmTQ4owCfJhYbSTeJemDDBD2f1bPuc1tM=;
        b=4ljHUgMyWMOMZP6BBcupB8Xw8X8Bq8dZYrldHffvHnLzfI2IJRcV3LVN+TjemWL+G8
         aDND/vQBxjtGd6JYiNHDVe4LfGi5HY8GuezXBPsjEcCNZEhQ2VaABMPvEn4to4OoQUiG
         VNZAcXBNEUbVITDheU+Z9FbKZaXNwkyRzIPvhm+eT6pvz9x+ZW8Lj/zGvVsDfvpovMv7
         d0I4T+JZXSU+sD5dcljo8YFO4r9x6Iyd9fg3NJ/t5a7jC7Vs7ZmdLLzQdjRfEoMMsVdV
         qiRukTM01HkatKY/gmi1gmfB78F4QZ87sjHLtBEgpN1liZZZv0VLjpexf1Y+DI40FixG
         zkkA==
X-Gm-Message-State: ANoB5pkrP+H6daAQqqFtRRtGOWLC86+c3PkDrElDJNwq6j0Lw1K0KgyI
	MeqCG2reS6J9G6f5NajTkcRts0XqUEBD06u77mk=
X-Google-Smtp-Source: AA0mqf4N5RvWofFdnOoAyR0asX5c9fbMmceXInUrhpJBAZfePo32m0xjubs5BKSrfzyB+O0iOiqdtMceSMHZoE4rS6s=
X-Received: by 2002:a05:6808:1999:b0:35c:53a9:5513 with SMTP id
 bj25-20020a056808199900b0035c53a95513mr1376026oib.262.1671559211757; Tue, 20
 Dec 2022 10:00:11 -0800 (PST)
MIME-Version: 1.0
References: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com> <1671538789-7206-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1671538789-7206-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2022 09:59:45 -0800
Message-ID: <CAMKF1sqsU1hJ8mP3KmvvZ4KXag6f=vrQRdtaDWGydY2n+ojbyw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.10.1 -> 5.11.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 18:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100162

This ends with checksum mismatch

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2253/steps/14/logs/errors

On Tue, Dec 20, 2022 at 4:20 AM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> ===========
>  Fixed #2007: settings for py3.11 (#2040)
>  Fixed #2038: packaging pypoetry (#2042)
>  Docs: renable portray (#2043)
>  Ci: add minimum GitHub token permissions for workflows (#1969)
>  Ci: general CI improvements (#2041)
>  Ci: add release workflow (#2026)
>  Hotfix #2034: isort --version is not accurate on 5.11.x releases (#2034)
>  Hotfix #2031: only call colorama.init if colorama is available (#2032)
>  Added official support for Python 3.11 (#1996, #2008, #2011)
>  Dropped support for Python 3.6 (#2019)
>  Fixed problematic tests (#2021, #2022)
>  Fixed #1960: Rich compatibility (#1961)
>  Fixed #1945, #1986: Python 4.0 upper bound dependency resolving issues
>  Fixed Pyodide CDN URL (#1991)
>  Docs: clarify description of use_parentheses (#1941)
>  Fixed #1976: black compatibility for .pyi files
>  Implemented #1683: magic trailing comma option (#1876)
>  Add missing space in unrecoverable exception message (#1933)
>  Fixed #1895: skip-gitignore: use allow list, not deny list
>  Fixed #1917: infinite loop for unmatched parenthesis (#1919)
>  Docs: shared profiles (#1896)
>  Fixed build-backend values in the example plugins (#1892)
>  Remove reference to jamescurtin/isort-action (#1885)
>  Split long cython import lines (#1931)
>  Update plone profile: copy of black, plus three settings. (#1926)
>  Fixed #1815, #1862: Add a command-line flag to sort all re-exports (#1863)
>  Fixed #1854: lines_before_imports appending lines after comments (#1861)
>  Remove redundant multi_line_output = 3 from "Compatibility with black" (#1858)
>  Add tox config example (#1856)
>  Docs: add examples for frozenset and tuple settings (#1822)
>  Docs: add multiple config documentation (#1850)
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-isort_5.10.1.bb => python3-isort_5.11.3.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-isort_5.10.1.bb => python3-isort_5.11.3.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb b/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
> index 27977821c..4b99c1755 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
> @@ -4,7 +4,7
>  SECTION = "devel/python"
>  LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>
> -SRC_URI[sha256sum] = "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
> +SRC_URI[sha256sum] = "a8ca25fbfad0f7d5d8447a4314837298d9f6b23aed8618584c894574f626b64b"
>
>  inherit pypi python_poetry_core
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100142): https://lists.openembedded.org/g/openembedded-devel/message/100142
> Mute This Topic: https://lists.openembedded.org/mt/95784531/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

