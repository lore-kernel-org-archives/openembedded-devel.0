Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC44C64990
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 14:44:09 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web09.24857.1661438642587591338
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o/4oa0oN;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-324ec5a9e97so546580607b3.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DUSTN05Vvd7n0ObMrE9MY90NM9BPm3NRVWDgUx8ZSZs=;
        b=o/4oa0oNaf78LjE7d5UqUeb4yg3oJ6pM7XQ3CC+pozuwwW4aNUAgvvsztzTXD7s/sa
         M2wySWKpJwDqOenkkDuFZ/yBjrwdr5WsNOB0VxTxqMnIWEENSkzA6ioSJWZZ33BtRQRK
         kFItO059nm3Sjq5pp9WwUtFMSBIGKZYV7W6GNYT3jL+OKEBZiw+bp9Nyp4FyKwtLuj5J
         EvhJIQxtXyHsOcIowlj6tce8k7PWLCKwavviFo+ETDC1YEI7qnkFK1XeLHiIhjQw4fh+
         p4Vn+5wIDnWnrSW8c7oeHyUjtD24l+VdKuBLADE3F1AWPcYMPtZjRViGpD79z+vVu+ff
         8PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DUSTN05Vvd7n0ObMrE9MY90NM9BPm3NRVWDgUx8ZSZs=;
        b=4Hy6195OexwgQSkcsIXGSzBQzJp3SOpWonQARtPleokw1LUI92+RkAPX1Gw22mAvQY
         89tGbfPNq/lCoPjVRY/8XtjuliubSg6Mv+KDZAc6zskZ63X0C/MXa9gb97oumHT1rRFy
         dK23Yfn69RR17c9nlwcj2H6fmHv4vaILCWJV0EGVqyXGoAc7ZGQbiQIBn7vCUJ8v8ONe
         bInqUdbdRbS4auH9Gc1lvwvO6fP7pumtcX43UcqiRzHcxgFgk7YEY8ZE3ZLw264OWe7D
         cANYqO/gFp0yO1nsvGmb5XWeW8R7lz7b5YzLSig/9Rsl7LZ/TKJhHhZA5c6Tdb8l2yK/
         m9Dg==
X-Gm-Message-State: ACgBeo2yZsThXrsN4ZoWUyMjoGsWde0WMZLDplm6QVC/J8xcAUQ2x28s
	qWlw0muDnBuCgqomTWP7mDhra9LHvZI3uiGwJUw=
X-Google-Smtp-Source: 
 AA6agR6+3rHUJwfPvGQae7gYFuggWMFG75XtfA7UAMCcrMs2E5F434Il5NzujXzUhKVsN1eD0DGEGU7xj8eSBaUGtmo=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr4233355ywf.71.1661438641687; Thu, 25 Aug
 2022 07:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104223.12730-1-atanas.bunchev@gmail.com>
In-Reply-To: <20220825104223.12730-1-atanas.bunchev@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 07:43:35 -0700
Message-ID: 
 <CAMKF1srJ1c5ys63Zxz7zXCC4KJ_f2oLE5bf88CL_T-oyXuvsqg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-twitter: Upgrade 4.8.0 ->
 4.10.1
To: Atanas Bunchev <atanas.bunchev@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 14:44:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98434

On Thu, Aug 25, 2022 at 3:41 AM Atanas Bunchev <atanas.bunchev@gmail.com> wrote:
>
> Upgrading python3-twitter to 4.10.1 and adding
> missing dependency ${PYTHON_PN}-requests-oauthlib
>
> Changelog:  (https://github.com/tweepy/tweepy/releases)
>
> New Features / Improvements:
>  - Add support for Direct Message typing indicator
>    and read receipts
>    - Add API.indicate_direct_message_typing and
>      API.mark_direct_message_read
>  - Fallback to "detail" response value for HTTPException message
>  - Handle "error" key of response being a string in HTTPException
>  - Add asynchronous interfaces for Twitter API v2
>    - Add asynchronous.AsyncClient
>      - Add async_lru as requirement for async extra
>    - Add asynchronous.AsyncStreamingClient
>  - Add support for reverse chronological home timeline
>    with Twitter API v2
>    - Add Client.get_home_timeline and AsyncClient.get_home_timeline
>  - Update the User-Agent header based on AsyncStream.user_agent
>    even if AsyncStream.session is already initialized/set
>
> Bug Fixes
>  - Fix AsyncBaseClient rate limit handling
>  - Fix handling of StreamRule when passed in list to
>    StreamingClient.delete_rules or AsyncStreamingClient.delete_rules
>  - Add support for media_fields, place_fields, and poll_fields
>    parameters for Client.get_list_tweets and
>    AsyncClient.get_list_tweets
>  - Ignore AsyncClient method parameters explicitly passed as None
>
> Twitter API Deprecations:
>  - Deprecate Stream.sample and note deprecation of compliance
>    messages for Stream.filter
>  - Deprecate AsyncStream.sample and note deprecation of compliance
>    messages for AsyncStream.filter
>
> Misc:
>  - Use setup.cfg for coverage.py configuration
>    - Explicitly specify coverage >= 4.4.2 requirement for dev extra
>  - Use setup.cfg for tox configuration
>    - Update lower bound for dev extra tox requirement to >= 3.21.0
>  - Remove tests_require from setup.py
>  - Stop creating universal wheels
>  - Update and improve various documentation and tests
>  - Log text of HTTP response when handling request error in BaseStream
>  - Update Requests documentation URL for Intersphinx linking
>  - Correct typo in documentation for StreamingClient and
>    AsyncStreamingClient add_rules and delete_rules methods
>
> Signed-off-by: Atanas Bunchev <atanas.bunchev@gmail.com>
> ---
>  .../{python3-twitter_4.8.0.bb => python3-twitter_4.10.1.bb}  | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-twitter_4.8.0.bb => python3-twitter_4.10.1.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
> index 247b4e584..b283aef56 100644
> --- a/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
> @@ -2,9 +2,9 @@ SUMMARY = "Twitter for Python"
>  DESCRIPTION = "Python module to support twitter API"
>
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
>

What changed in the license text ?

> -SRC_URI[sha256sum] = "8ba5774ac1663b09e5fce1b030daf076f2c9b3ddbf2e7e7ea0bae762e3b1fe3e"
> +SRC_URI[sha256sum] = "310193775d7fc381abd6f37021a9af27f7e9edfcce5ec51bd73ea5f30c21fa61"
>
>  PYPI_PACKAGE = "tweepy"
>
> @@ -14,5 +14,6 @@ RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-pip \
>      ${PYTHON_PN}-pysocks \
>      ${PYTHON_PN}-requests \
> +    ${PYTHON_PN}-requests-oauthlib \
>      ${PYTHON_PN}-six \
>  "
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98429): https://lists.openembedded.org/g/openembedded-devel/message/98429
> Mute This Topic: https://lists.openembedded.org/mt/93245298/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

