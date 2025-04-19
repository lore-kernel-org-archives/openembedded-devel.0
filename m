Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B340C369BD
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 14:27:24 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.8836.1745072839810399197
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 07:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tkpHN2Gb;
 spf=pass (domain: konsulko.com, ip: 209.85.208.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so3937108a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745072838; x=1745677638; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/n86ZdqHBLwLZcfEzSu5lBqvLnC1Q76gPcPFBZ3IJBU=;
        b=tkpHN2GbLjfKpo4uTh0fPRwPTXmPm0t8Gkr3Nih57D3a75tWRzL260+GPYooYta17s
         kLKYM9uR++Wy2TVrZ9e1BCvZ7Va/MhpD0t9oXx3ZGdPbaQ1zxpgJBrQWCcUhVjNSWUAz
         co773pnbfoT7eM3+WgvR8uADZ9UlkbswwYorQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745072838; x=1745677638;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/n86ZdqHBLwLZcfEzSu5lBqvLnC1Q76gPcPFBZ3IJBU=;
        b=Ny5U6ulf76gHj3lTlEybFB4wzhAZGPdwwn21ccg6nnI679pDrIVPBU4zPIuTDcAqN4
         XC6NWdZjMLvcbYdCSH7A/p6HbEd8snqQF28rBlXM3bY5o7Wn/qOaXcsE8ZFEyWnNvym2
         oh1W9sNDNd1Jf6QOC+4rv6x4SfF45odVKrIl3o+UnVvNy7lwoFQPPRdz3hQ6Ut+LzJ1T
         bqhICm944Mc3l74fby/EJssugWg4DQ66pSZGgixthFwypA11fYXf31rykQiOinGo0UBr
         PJnf+ETBO36cw32CKPKSuHy+U2AP4P0ESmlCL3J4lCtVSJnFlq4OkMHtHhc3cixJrX2x
         cbxA==
X-Gm-Message-State: AOJu0YxtNL92xXuU1SxM/uNmPkWLMpIFo2pW/nqVpgrsz1ZRTw5o+ybT
	UPdfXu7TjZkD0cz86wEIi6D8MCzQFSbvyFRvZddl3PQGJOP8ZjDXcSRpihzZww8=
X-Gm-Gg: ASbGncuSuYcyqG8XbZPcw2MYunK4KxqS5B5NjNhqiw7Y/VQTtV7jL3yEBZytz5f2Zpi
	GHrCuDFTOQ0yz538NOpC3PN5yLXKmG0bz3Zv/8h3KEJmFePBWgTK3q0k9W4/EGglUwz3DTdowPE
	Jm3WkkOkR948wFaYpRg0R40TWPXPDd3MzlRlZ0Su5Xqm9geSDoajjZIb5gc+0qhdXr13tCsZJ52
	ZiOmqDfYCGW7FxPlC655T0dGl9q+t+tGdPxgUw6tMV4rir+Y7zjlf7+CUzj9N0ChfNYAmhS3HJL
	zgxlgl1pOxaKL78ExeeVluzmFNFtPyzpdpIo+wkd9xBah5zd
X-Google-Smtp-Source: AGHT+IF9AamG7Z2YtFIXvY31MeRQm6yUF8axGAoUr41iioWQlCpTwjyNn9RyvPMxNCq6RIQfetA5eg==
X-Received: by 2002:a17:907:2d0b:b0:ac1:791c:1532 with SMTP id a640c23a62f3a-acb74e1dbdfmr534105366b.51.1745072837744;
        Sat, 19 Apr 2025 07:27:17 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0c64csm276081166b.13.2025.04.19.07.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 07:27:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------E7UYdbVXR1e7Z6ovYZli50BM"
Message-ID: <862e05f0-7dc3-42d0-8609-151117f52305@konsulko.com>
Date: Sat, 19 Apr 2025 17:27:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCHv2] python3-eth-utils: Upgrade 5.2.0 ->
 5.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250418105119.3211549-1-leon.anavi@konsulko.com>
 <CAMKF1sqhR5FRsw3cfM1J1V4qhbdo4YYgf+NQ3CODAk9O9nD4iA@mail.gmail.com>
 <CAMKF1sqjHe7JoGBTQrOfzUi_em8nXw5yVrDhNWTHzy+mFo0HEg@mail.gmail.com>
 <321017f0-7d50-44af-a391-126d3d4d9ff0@konsulko.com>
 <CAMKF1sqL3tYOx2JR5MVs5+-RXDYeDpRYfvNbsoryTpoQMVq8uA@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sqL3tYOx2JR5MVs5+-RXDYeDpRYfvNbsoryTpoQMVq8uA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 14:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116983

This is a multi-part message in MIME format.
--------------E7UYdbVXR1e7Z6ovYZli50BM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 19.04.25 г. 17:19 ч., Khem Raj wrote:
>
>
> On Sat, Apr 19, 2025 at 7:07 AM Leon Anavi <leon.anavi@konsulko.com> 
> wrote:
>
>     Hi Khem,
>
>     On 18.04.25 г. 21:55 ч., Khem Raj wrote:
>     > Here is further recipes which need this check
>     I saw that in the mean time you submitted a patch that enables
>     pydantic
>     risc-v builds because python3-pydantic-core has been fixed. Regarding
>     these circumstances do we need to check these recipes?
>
>
> Yeah I fixed pydantic I will now take v1

OK, thank you very much for resolving the issue with pydantic and for 
your hard work maintaining these layers.

Thanks, Leon


>
>
>     Best regards,
>     Leon
>
>     > ERROR: Nothing RPROVIDES 'python3-eth-utils' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
>     <http://python3-eth-abi_5.2.0.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
>     <http://python3-eth-keys_0.5.0.bb>,
>     > /home/yoe/sources/meta-openembedded/meta-
>     >     ↪
>     python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
>     <http://python3-eth-rlp_2.1.0.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
>     <http://python3-rlp_4.1.0.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     python3-eth-utils was skipped: incompatible with host
>     > riscv32-yoe-linux (not in COMPATIBLE_HOST)
>     >     NOTE: Runtime target 'python3-eth-utils' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-utils']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-abi' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
>     <http://python3-eth-abi_5.2.0.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-abi'
>     >     NOTE: Runtime target 'python3-eth-abi' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was: ['python3-eth-abi']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-abi-dev' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
>     <http://python3-eth-abi_5.2.0.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-abi-dev'
>     >     NOTE: Runtime target 'python3-eth-abi-dev' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-abi-dev']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-keys' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
>     <http://python3-eth-keyfile_0.8.0.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
>     <http://python3-eth-keys_0.5.0.bb>,
>     > /home/yoe/sources/meta-openembedded/
>     >     ↪
>     meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-keys'
>     >     NOTE: Runtime target 'python3-eth-keys' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-keys']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-keyfile' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
>     <http://python3-eth-keyfile_0.8.0.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-keyfile'
>     >     NOTE: Runtime target 'python3-eth-keyfile' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-keyfile']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-keyfile-dev' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
>     <http://python3-eth-keyfile_0.8.0.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-keyfile-dev'
>     >     NOTE: Runtime target 'python3-eth-keyfile-dev' is
>     unbuildable, removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-keyfile-dev']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-keys-dev' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
>     <http://python3-eth-keys_0.5.0.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-keys-dev'
>     >     NOTE: Runtime target 'python3-eth-keys-dev' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-keys-dev']
>     >     ERROR: Nothing RPROVIDES 'python3-rlp' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
>     <http://python3-eth-rlp_2.1.0.bb>,
>     > /home/yoe/sources/meta-openembedded/meta-
>     >     ↪ python/recipes-devtools/python/python3-rlp_4.1.0.bb
>     <http://python3-rlp_4.1.0.bb> RDEPENDS on
>     > or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-rlp'
>     >     NOTE: Runtime target 'python3-rlp' is unbuildable, removing...
>     >     Missing or unbuildable dependency chain was: ['python3-rlp']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-rlp' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>,
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
>     <http://python3-eth-rlp_2.1.0.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-rlp'
>     >     NOTE: Runtime target 'python3-eth-rlp' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was: ['python3-eth-rlp']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-account-dev' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-account-dev'
>     >     NOTE: Runtime target 'python3-eth-account-dev' is
>     unbuildable, removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-account-dev']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-account' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
>     <http://python3-eth-account_0.12.1.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-account'
>     >     NOTE: Runtime target 'python3-eth-account' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-account']
>     >     ERROR: Nothing RPROVIDES 'python3-eth-rlp-dev' (but
>     >
>     /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
>     <http://python3-eth-rlp_2.1.0.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-eth-rlp-dev'
>     >     NOTE: Runtime target 'python3-eth-rlp-dev' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was:
>     ['python3-eth-rlp-dev']
>     >     ERROR: Nothing RPROVIDES 'python3-rlp-dev' (but
>     >
>     /home/oe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
>     <http://python3-rlp_4.1.0.bb>
>     > RDEPENDS on or otherwise requires it)
>     >     No eligible RPROVIDERs exist for 'python3-rlp-dev'
>     >     NOTE: Runtime target 'python3-rlp-dev' is unbuildable,
>     removing...
>     >     Missing or unbuildable dependency chain was: ['python3-rlp-dev']
>     >
>     > On Fri, Apr 18, 2025 at 8:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>     >> On Fri, Apr 18, 2025 at 3:51 AM Leon Anavi via
>     lists.openembedded.org <http://lists.openembedded.org>
>     >> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>     >>> Upgrade to release 5.3.0:
>     >>>
>     >>> - Replace arg["name"] with arg.get("name") to correctly handle
>     >>>    optional names
>     >>> - Add new methods: to_wei_decimals, and from_wei_decimals which
>     >>>    take a number instead of a string
>     >>> - Add CamelModel pydantic model for validating objects and
>     >>>    serializing to camelCase when used with by_alias=True, with
>     >>>    the general expectation of a well-formed JSON-RPC object.
>     >>>
>     >>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>     >>> ---
>     >>>   ...python3-eth-utils_5.2.0.bb
>     <http://python3-eth-utils_5.2.0.bb> => python3-eth-utils_5.3.0.bb
>     <http://python3-eth-utils_5.3.0.bb>} | 5 ++++-
>     >>>   1 file changed, 4 insertions(+), 1 deletion(-)
>     >>>   rename
>     meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb
>     <http://python3-eth-utils_5.2.0.bb> => python3-eth-utils_5.3.0.bb
>     <http://python3-eth-utils_5.3.0.bb>} (76%)
>     >>>
>     >>> diff --git
>     a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
>     <http://python3-eth-utils_5.2.0.bb>
>     b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>     <http://python3-eth-utils_5.3.0.bb>
>     >>> similarity index 76%
>     >>> rename from
>     meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
>     <http://python3-eth-utils_5.2.0.bb>
>     >>> rename to
>     meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>     <http://python3-eth-utils_5.3.0.bb>
>     >>> index 435d032a84..3b71684820 100644
>     >>> ---
>     a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
>     <http://python3-eth-utils_5.2.0.bb>
>     >>> +++
>     b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>     <http://python3-eth-utils_5.3.0.bb>
>     >>> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>     >>>   LICENSE = "MIT"
>     >>>   LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
>     >>>
>     >>> -SRC_URI[sha256sum] =
>     "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"
>     >>> +SRC_URI[sha256sum] =
>     "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"
>     >>>
>     >>>   PYPI_PACKAGE = "eth_utils"
>     >>>   UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>     >>> @@ -16,4 +16,7 @@ RDEPENDS:${PN} += " \
>     >>>       python3-eth-typing \
>     >>>       python3-setuptools \
>     >>>       python3-toolz \
>     >>> +    python3-pydantic \
>     >>>   "
>     >>> +
>     >>> +COMPATIBLE_HOST:riscv32 = "null"
>     >> this should also be applied to recipes which depend upon
>     python3-eth-utils
>     >>> --
>     >>> 2.39.5
>     >>>
>     >>>
>     >>> -=-=-=-=-=-=-=-=-=-=-=-
>     >>> Links: You receive all messages sent to this group.
>     >>> View/Reply Online (#116947):
>     https://lists.openembedded.org/g/openembedded-devel/message/116947
>     >>> Mute This Topic:
>     https://lists.openembedded.org/mt/112328943/1997914
>     >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     >>> Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     >>> -=-=-=-=-=-=-=-=-=-=-=-
>     >>>
>
--------------E7UYdbVXR1e7Z6ovYZli50BM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19.04.25 г. 17:19 ч., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqL3tYOx2JR5MVs5+-RXDYeDpRYfvNbsoryTpoQMVq8uA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Sat, Apr 19, 2025 at
            7:07 AM Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi
            Khem,<br>
            <br>
            On 18.04.25 г. 21:55 ч., Khem Raj wrote:<br>
            &gt; Here is further recipes which need this check<br>
            I saw that in the mean time you submitted a patch that
            enables pydantic <br>
            risc-v builds because python3-pydantic-core has been fixed.
            Regarding <br>
            these circumstances do we need to check these recipes?</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Yeah I fixed pydantic I will now take v1 <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>OK, thank you very much for resolving the issue with pydantic and
      for your hard work maintaining these layers.<br>
      <br>
      Thanks, Leon<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAMKF1sqL3tYOx2JR5MVs5+-RXDYeDpRYfvNbsoryTpoQMVq8uA@mail.gmail.com">
      <div>
        <div class="gmail_quote gmail_quote_container">
          <blockquote class="gmail_quote"
style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"
            dir="auto"><br>
            <br>
            Best regards,<br>
            Leon<br>
            <br>
            &gt; ERROR: Nothing RPROVIDES 'python3-eth-utils' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-abi_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-abi_5.2.0.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-keys_0.5.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-keys_0.5.0.bb</a>,<br>
            &gt; /home/yoe/sources/meta-openembedded/meta-<br>
            &gt;     ↪ python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-rlp_2.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-rlp_2.1.0.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-rlp_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-rlp_4.1.0.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     python3-eth-utils was skipped: incompatible with
            host<br>
            &gt; riscv32-yoe-linux (not in COMPATIBLE_HOST)<br>
            &gt;     NOTE: Runtime target 'python3-eth-utils' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-utils']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-abi' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-abi_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-abi_5.2.0.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for 'python3-eth-abi'<br>
            &gt;     NOTE: Runtime target 'python3-eth-abi' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-abi']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-abi-dev' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-abi_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-abi_5.2.0.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for
            'python3-eth-abi-dev'<br>
            &gt;     NOTE: Runtime target 'python3-eth-abi-dev' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-abi-dev']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-keys' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-keyfile_0.8.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-keyfile_0.8.0.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-keys_0.5.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-keys_0.5.0.bb</a>,<br>
            &gt; /home/yoe/sources/meta-openembedded/<br>
            &gt;     ↪ meta-python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for 'python3-eth-keys'<br>
            &gt;     NOTE: Runtime target 'python3-eth-keys' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-keys']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-keyfile' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-keyfile_0.8.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-keyfile_0.8.0.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for
            'python3-eth-keyfile'<br>
            &gt;     NOTE: Runtime target 'python3-eth-keyfile' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-keyfile']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-keyfile-dev'
            (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-keyfile_0.8.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-keyfile_0.8.0.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for
            'python3-eth-keyfile-dev'<br>
            &gt;     NOTE: Runtime target 'python3-eth-keyfile-dev' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-keyfile-dev']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-keys-dev'
            (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-keys_0.5.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-keys_0.5.0.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for
            'python3-eth-keys-dev'<br>
            &gt;     NOTE: Runtime target 'python3-eth-keys-dev' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-keys-dev']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-rlp' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-rlp_2.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-rlp_2.1.0.bb</a>,<br>
            &gt; /home/yoe/sources/meta-openembedded/meta-<br>
            &gt;     ↪ python/recipes-devtools/python/<a
              href="http://python3-rlp_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-rlp_4.1.0.bb</a>
            RDEPENDS on<br>
            &gt; or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for 'python3-rlp'<br>
            &gt;     NOTE: Runtime target 'python3-rlp' is unbuildable,
            removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-rlp']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-rlp' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a>,<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-rlp_2.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-rlp_2.1.0.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for 'python3-eth-rlp'<br>
            &gt;     NOTE: Runtime target 'python3-eth-rlp' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-rlp']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-account-dev'
            (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for
            'python3-eth-account-dev'<br>
            &gt;     NOTE: Runtime target 'python3-eth-account-dev' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-account-dev']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-account' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-account_0.12.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-account_0.12.1.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for
            'python3-eth-account'<br>
            &gt;     NOTE: Runtime target 'python3-eth-account' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-account']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-eth-rlp-dev' (but<br>
            &gt;
            /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-rlp_2.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-rlp_2.1.0.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for
            'python3-eth-rlp-dev'<br>
            &gt;     NOTE: Runtime target 'python3-eth-rlp-dev' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-eth-rlp-dev']<br>
            &gt;     ERROR: Nothing RPROVIDES 'python3-rlp-dev' (but<br>
            &gt;
            /home/oe/sources/meta-openembedded/meta-python/recipes-devtools/python/<a
              href="http://python3-rlp_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-rlp_4.1.0.bb</a><br>
            &gt; RDEPENDS on or otherwise requires it)<br>
            &gt;     No eligible RPROVIDERs exist for 'python3-rlp-dev'<br>
            &gt;     NOTE: Runtime target 'python3-rlp-dev' is
            unbuildable, removing...<br>
            &gt;     Missing or unbuildable dependency chain was:
            ['python3-rlp-dev']<br>
            &gt;<br>
            &gt; On Fri, Apr 18, 2025 at 8:26 AM Khem Raj &lt;<a
              href="mailto:raj.khem@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">raj.khem@gmail.com</a>&gt;
            wrote:<br>
            &gt;&gt; On Fri, Apr 18, 2025 at 3:51 AM Leon Anavi via <a
              href="http://lists.openembedded.org" rel="noreferrer"
              target="_blank" moz-do-not-send="true">lists.openembedded.org</a><br>
            &gt;&gt; &lt;leon.anavi=<a
              href="mailto:konsulko.com@lists.openembedded.org"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">konsulko.com@lists.openembedded.org</a>&gt;
            wrote:<br>
            &gt;&gt;&gt; Upgrade to release 5.3.0:<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; - Replace arg["name"] with arg.get("name") to
            correctly handle<br>
            &gt;&gt;&gt;    optional names<br>
            &gt;&gt;&gt; - Add new methods: to_wei_decimals, and
            from_wei_decimals which<br>
            &gt;&gt;&gt;    take a number instead of a string<br>
            &gt;&gt;&gt; - Add CamelModel pydantic model for validating
            objects and<br>
            &gt;&gt;&gt;    serializing to camelCase when used with
            by_alias=True, with<br>
            &gt;&gt;&gt;    the general expectation of a well-formed
            JSON-RPC object.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;<br>
            &gt;&gt;&gt; ---<br>
            &gt;&gt;&gt;   ...<a
              href="http://python3-eth-utils_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.2.0.bb</a>
            =&gt; <a href="http://python3-eth-utils_5.3.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-utils_5.3.0.bb</a>}
            | 5 ++++-<br>
            &gt;&gt;&gt;   1 file changed, 4 insertions(+), 1
            deletion(-)<br>
            &gt;&gt;&gt;   rename meta-python/recipes-devtools/python/{<a
              href="http://python3-eth-utils_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.2.0.bb</a>
            =&gt; <a href="http://python3-eth-utils_5.3.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-eth-utils_5.3.0.bb</a>}
            (76%)<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; diff --git
            a/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-utils_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.2.0.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-utils_5.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.3.0.bb</a><br>
            &gt;&gt;&gt; similarity index 76%<br>
            &gt;&gt;&gt; rename from
            meta-python/recipes-devtools/python/<a
              href="http://python3-eth-utils_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.2.0.bb</a><br>
            &gt;&gt;&gt; rename to meta-python/recipes-devtools/python/<a
              href="http://python3-eth-utils_5.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.3.0.bb</a><br>
            &gt;&gt;&gt; index 435d032a84..3b71684820 100644<br>
            &gt;&gt;&gt; --- a/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-utils_5.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.2.0.bb</a><br>
            &gt;&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a
              href="http://python3-eth-utils_5.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-eth-utils_5.3.0.bb</a><br>
            &gt;&gt;&gt; @@ -4,7 +4,7 @@ SECTION = "devel/python"<br>
            &gt;&gt;&gt;   LICENSE = "MIT"<br>
            &gt;&gt;&gt;   LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182">"file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"</a><br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; -SRC_URI[sha256sum] =
            "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"<br>
            &gt;&gt;&gt; +SRC_URI[sha256sum] =
            "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;   PYPI_PACKAGE = "eth_utils"<br>
            &gt;&gt;&gt;   UPSTREAM_CHECK_PYPI_PACKAGE =
            "${PYPI_PACKAGE}"<br>
            &gt;&gt;&gt; @@ -16,4 +16,7 @@ <a class="moz-txt-link-freetext" href="RDEPENDS:$">RDEPENDS:$</a>{PN} += " \<br>
            &gt;&gt;&gt;       python3-eth-typing \<br>
            &gt;&gt;&gt;       python3-setuptools \<br>
            &gt;&gt;&gt;       python3-toolz \<br>
            &gt;&gt;&gt; +    python3-pydantic \<br>
            &gt;&gt;&gt;   "<br>
            &gt;&gt;&gt; +<br>
            &gt;&gt;&gt; +COMPATIBLE_<a class="moz-txt-link-freetext" href="HOST:riscv32">HOST:riscv32</a> = "null"<br>
            &gt;&gt; this should also be applied to recipes which depend
            upon python3-eth-utils<br>
            &gt;&gt;&gt; --<br>
            &gt;&gt;&gt; 2.39.5<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
            &gt;&gt;&gt; Links: You receive all messages sent to this
            group.<br>
            &gt;&gt;&gt; View/Reply Online (#116947): <a
href="https://lists.openembedded.org/g/openembedded-devel/message/116947"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/message/116947</a><br>
            &gt;&gt;&gt; Mute This Topic: <a
              href="https://lists.openembedded.org/mt/112328943/1997914"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/mt/112328943/1997914</a><br>
            &gt;&gt;&gt; Group Owner: <a
href="mailto:openembedded-devel%2Bowner@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
            &gt;&gt;&gt; Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-devel/unsub"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href="mailto:raj.khem@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
            &gt;&gt;&gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
            &gt;&gt;&gt;<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------E7UYdbVXR1e7Z6ovYZli50BM--

