Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5B4EB64D9
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 01:16:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.750.1687223762869667700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 18:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pBmcp9aq;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666e6541c98so3368469b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 18:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687223762; x=1689815762;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=23xOUK2e5hAliJei6lREafXa3xK/mMtr360PhVvs5VE=;
        b=pBmcp9aq2yK3dF3MLcBxdhKmWUd91A2vQbla++GiuwYyyIlIuFuBMjtjPKcZbbd+N8
         x0jKZ6hioon2yfGV6FuyCJOphzm5UUxnesh/Ft3NlxxlSD4Jrtn4+DdhO4qTrsW3BEX4
         gfi0yPDIAw26fIoJpURt0qoxJ8A5HilIcP9zYpGijnE9H3d6F5n4oqiL2UKpIJmqxy0t
         eWbSAmxXqogjbdxJ3l/cklGZcCjUKA8+vulBCvTIifwhx3UCDSs3y90SyaXqn9ykXrIv
         mjLcB5+pM/CqrP57I4O8w/oLA6t4QHam4xbHnYzhpCGN2qE2PK+aHVNDFbkJxxqUjZw0
         O2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687223762; x=1689815762;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23xOUK2e5hAliJei6lREafXa3xK/mMtr360PhVvs5VE=;
        b=Bj9/jbP1eVsN2Ns9+apMknPUhWg7ItnDX6CATcuZqeKCYXpnmKPQjOi9qHjor0NqbP
         qZsF7N63V307ryGZXJuS9q17ZW2qwhtksrhz5Ja8XZ9JyJD919xbdkNySdixMaFnTGoi
         V2alpLAu2ZBp0omUHKQslNT6yBoCg3jQctmd6561Oa2MjKD5fKBQXY6rebe5ODujETgi
         +1hd4s/N+tqRQuSk0K61gjgiOs+XGnPAYP9R+KoNb/HfKwOj3u+0pBa6N6/QtUUeyVWh
         7nmibNAXT82DY3hSX6+6kRVo++2gii+ANbxCnUHfKNPIdkS1SxAlrGRSYnwud/jUTmP1
         JQeQ==
X-Gm-Message-State: AC+VfDwJ8FLni1rqhM/BygeQjtqe+bp6nDgz4DRIiUe0EdLMhoaqGT5K
	Kydcgp48kjJKh6HiOlkoP9Y=
X-Google-Smtp-Source: ACHHUZ5dNAQ9Q5DLn5p+d2zx1FfyZ8PfO+dziWpVFYx1Y637wsSGBBcoh9oWCjnuB4+8L25T4/zmvw==
X-Received: by 2002:a05:6a00:139a:b0:668:725c:32aa with SMTP id t26-20020a056a00139a00b00668725c32aamr8854626pfg.3.1687223761998;
        Mon, 19 Jun 2023 18:16:01 -0700 (PDT)
Received: from ?IPV6:2601:646:9181:d380:24a9:570:d99d:a23c? ([2601:646:9181:d380:24a9:570:d99d:a23c])
        by smtp.gmail.com with ESMTPSA id j7-20020aa78dc7000000b0063aa1763146sm243543pfr.17.2023.06.19.18.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 18:16:01 -0700 (PDT)
Message-ID: <5a677745-c6a2-bd0a-5507-98bc3b185877@gmail.com>
Date: Mon, 19 Jun 2023 18:15:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [meta-python][RESEND PATCH 01/54] python3-pywbem: drop unneeded
 class from RDEPENDS
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230619132214.213417-1-brgl@bgdev.pl>
 <20230619132214.213417-2-brgl@bgdev.pl>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230619132214.213417-2-brgl@bgdev.pl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y5aSvyI0TWfvn0HsyxHldmfJ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 01:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103447

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Y5aSvyI0TWfvn0HsyxHldmfJ
Content-Type: multipart/mixed; boundary="------------YO4DdmQGyLH81UOHg4cbetTt";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Message-ID: <5a677745-c6a2-bd0a-5507-98bc3b185877@gmail.com>
Subject: Re: [meta-python][RESEND PATCH 01/54] python3-pywbem: drop unneeded
 class from RDEPENDS
References: <20230619132214.213417-1-brgl@bgdev.pl>
 <20230619132214.213417-2-brgl@bgdev.pl>
In-Reply-To: <20230619132214.213417-2-brgl@bgdev.pl>

--------------YO4DdmQGyLH81UOHg4cbetTt
Content-Type: multipart/mixed; boundary="------------BbSyqAIy07cqHLeu7gnPd2Z6"

--------------BbSyqAIy07cqHLeu7gnPd2Z6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNi8xOS8yMyA2OjIxIEFNLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBGcm9t
OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
DQo+IA0KPiBUaGUgbmF0aXZlIHBhY2thZ2UgaGFzIHRoZSBzYW1lIGRlcGVuZGVuY2llcy4g
RXZlbiBpZiBub3JtYWxseSB0aGV5IGFyZQ0KPiBzYXRpc2ZpZWQgYnkgcHl0aG9uMy1uYXRp
dmUsIHdlIHNob3VsZCBzdGlsbCB1c2UgYSBnbG9iYWwgUkRFUEVORFMuDQo+IA0KDQpUaGlz
IHdpbGwgZGVlcGVuIHRoZSBkZXBlbmRlbmN5IGxpc3QgZm9yIG5hdGl2ZSBwYWNrYWdlcy4g
V2h5IHNob3VsZCB3ZSANCmRvIHRoaXMgPw0KDQo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+
ICAgbWV0YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9weXdiZW0vcHl0aG9uMy1weXdiZW1f
MS42LjEuYmIgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1l
eHRlbmRlZC9weXdiZW0vcHl0aG9uMy1weXdiZW1fMS42LjEuYmIgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWV4dGVuZGVkL3B5d2JlbS9weXRob24zLXB5d2JlbV8xLjYuMS5iYg0KPiBpbmRl
eCA3MWFmMDY4ODEuLjhiMDM4M2NmNiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1weXRob24vcmVj
aXBlcy1leHRlbmRlZC9weXdiZW0vcHl0aG9uMy1weXdiZW1fMS42LjEuYmINCj4gKysrIGIv
bWV0YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9weXdiZW0vcHl0aG9uMy1weXdiZW1fMS42
LjEuYmINCj4gQEAgLTI3LDcgKzI3LDcgQEAgREVQRU5EUyArPSAiIFwNCj4gICAgICAgJHtQ
WVRIT05fUE59LXdoZWVsLW5hdGl2ZSBcDQo+ICAgIg0KPiAgIA0KPiAtUkRFUEVORFM6JHtQ
Tn06Y2xhc3MtdGFyZ2V0ICs9ICJcDQo+ICtSREVQRU5EUzoke1BOfSArPSAiXA0KPiAgICAg
ICAke1BZVEhPTl9QTn0tZGF0ZXRpbWUgXA0KPiAgICAgICAke1BZVEhPTl9QTn0taW8gXA0K
PiAgICAgICAke1BZVEhPTl9QTn0tbmV0Y2xpZW50IFwNCg==
--------------BbSyqAIy07cqHLeu7gnPd2Z6
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------BbSyqAIy07cqHLeu7gnPd2Z6--

--------------YO4DdmQGyLH81UOHg4cbetTt--

--------------Y5aSvyI0TWfvn0HsyxHldmfJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZJD90AUDAAAAAAAKCRC7BTNVkZ0zFPRS
AJ9BEBRL4faV5VXj9hc5WJyttaFLpACfbPWGgNiK0vSgA/FXV8D601bS7lM=
=YXg4
-----END PGP SIGNATURE-----

--------------Y5aSvyI0TWfvn0HsyxHldmfJ--

