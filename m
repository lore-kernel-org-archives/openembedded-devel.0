Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1A0D3C536
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 16:34:50 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.26867.1729269288495140976
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 09:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AzLAQ8oG;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-288916b7fceso1230388fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 09:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729269288; x=1729874088; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F5ux0KKiIqp/pOLv8Ww8WeGPYC/9ENUtGt6EMi0/Z1k=;
        b=AzLAQ8oG2TE+EwQe5yqtrXzNbbhstdnV+hCXtZXgEjm6gM7H4mXPcADOxQTvCWE/nn
         nKi9NZTiGtnojRqyQkN9FdArm06/HB0hoAr566DqMWOKb1ZvqHUPFRl7QuWNOw4zkQYP
         PYxZbKw0t66UvZG4e/SFhI2o91i0vqoHS1eEsStz2c8ENZdkP/PKxFi86EPVupeaAMvk
         bcxPkyJhwzi2AQyvFzN3MEM8wOxY3tuiuG6A4SBzSoLf5v1O42N+ALUkGpj1T3nyu57h
         kDiF18HD5RG2TRMvexm3OcfPLpfFfeve2H13EyM2FotIjbus8/9HtObj8haOU3buPkVz
         GiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729269288; x=1729874088;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5ux0KKiIqp/pOLv8Ww8WeGPYC/9ENUtGt6EMi0/Z1k=;
        b=DLOFVHiWoTxq0WsY2zIzDCGgSeToHt5rKV8lYe5z7ZJyn71N6PMwjX4kuKmPpC+wSZ
         /rYi5Mmwa0hega1eIxraDuV2WifXvK3s3ObB1QMlldk44TDw3BHEafzELMq0GXynPZVV
         K1UqAEWkL5qm9RoNuEFq+FTM2gEH97H0bHSdZOrpY0I7xLq0YgGCABmjfdk9jCxHBeBI
         gfy+kc6KgmZPr6/HEXj54HlKO5kVKkPISnFLEsixt7huMpLXLMmUCJBUVDG1mvv4DEPI
         s6EY0Jafco3Ed7jEaWua6UfVH8l1G4p4f4GhEo+0S4xEloM0JZpqQo4WmiVRTRdekhZQ
         lVlw==
X-Forwarded-Encrypted: i=1; AJvYcCVE6fnNOczB96GF1TirKRcD2q9nGRpGG2G83+7m319aOHT9Vba3PaXDlYCFDUiRk6IGS075U52OYPDdzDk+nwM45Ng=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyC0LYWo1D2rxrEAxm5642y6FaLMx9DCauzCxXik1CdHpAFWbzH
	jB0LeP/Lh+W1ioHWTzOLc8fw8GFiBl43aD89jR4jA8W2R4BjDOTw
X-Google-Smtp-Source: AGHT+IHxgQvWUQtPOSKKaxeikvtvNbaEEFqIpwoPJG998r3fQf6EX4Z17AIWVt49yew7UpFs5+hMug==
X-Received: by 2002:a05:6870:1650:b0:277:f93b:2123 with SMTP id 586e51a60fabf-2892c2d0b94mr3121478fac.19.1729269287472;
        Fri, 18 Oct 2024 09:34:47 -0700 (PDT)
Received: from ?IPV6:2601:646:9d80:4380:116f:c3c5:1068:53d4? ([2601:646:9d80:4380:116f:c3c5:1068:53d4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-718195428c4sm382088a34.8.2024.10.18.09.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 09:34:47 -0700 (PDT)
Message-ID: <b83eb7f4-63e8-47b4-982c-4fbf6ffabb43@gmail.com>
Date: Fri, 18 Oct 2024 09:34:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][meta-oe][scarthgap] xmlsec1: fix do_fetch error
To: jiaying.song.cn@windriver.com, openembedded-devel@lists.openembedded.org
Cc: changqing.li@windriver.com
References: <20241018061416.2483243-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20241018061416.2483243-1-jiaying.song.cn@windriver.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rnjumYpDpY0uli6HwiXYqcUK"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112986

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rnjumYpDpY0uli6HwiXYqcUK
Content-Type: multipart/mixed; boundary="------------ssFR0ZYA0JEZcvHyiPW8ZrDv";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: jiaying.song.cn@windriver.com, openembedded-devel@lists.openembedded.org
Cc: changqing.li@windriver.com
Message-ID: <b83eb7f4-63e8-47b4-982c-4fbf6ffabb43@gmail.com>
Subject: Re: [PATCH][meta-oe][scarthgap] xmlsec1: fix do_fetch error
References: <20241018061416.2483243-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20241018061416.2483243-1-jiaying.song.cn@windriver.com>

--------------ssFR0ZYA0JEZcvHyiPW8ZrDv
Content-Type: multipart/mixed; boundary="------------sJ3yyxUr3uwOvkr7uvaCiriu"

--------------sJ3yyxUr3uwOvkr7uvaCiriu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMTcvMjQgMTE6MTQgUE0sIGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29tIHdy
b3RlOg0KPiBGcm9tOiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIu
Y29tPg0KPiANCj4gQ2hhbmdlIHRoZSBTUkNfVVJJIHRvIHRoZSBjb3JyZWN0IHZhbHVlIGR1
ZSB0byB0aGUgZm9sbG93aW5nIGVycm9yOg0KPiANCj4gV0FSTklORzogeG1sc2VjMS1uYXRp
dmUtMS4zLjQtcjAgZG9fZmV0Y2g6IEZhaWxlZCB0byBmZXRjaCBVUkwgaHR0cDovL3d3dy5h
bGVrc2V5LmNvbS94bWxzZWMvZG93bmxvYWQveG1sc2VjMS0xLjMuNC50YXIuZ3osIGF0dGVt
cHRpbmcgTUlSUk9SUyBpZiBhdmFpbGFibGUNCj4gDQoNCg0KSSBoYXZlIHNlbnQgYSBwYXRj
aCBbMV0gd2hpY2ggc3dpdGNoZXMgU1JDX1VSSSB0byB1c2UgZ2l0aHViIHJlbGVhc2VzDQp3
aGljaCBzaG91bGQgYXZvaWQgdGhlc2UgaXNzdWVzIGFuZCBzaG91bGQgYmUgYmFja3BvcnQg
d29ydGh5LCBwbGVhc2UgDQpsb29rIGludG8gdGhhdCBwYXRjaCBhbmQgdGVzdCBpdCBvdXQg
b24gc2NhcnRoZ2FwDQoNClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5lbWJl
ZGRlZC1kZXZlbC8yMDI0MTAxODE2MjUxMi4zMzA0MDc4LTEtcmFqLmtoZW1AZ21haWwuY29t
L1QvI3UNCg0KPiBTaWduZWQtb2ZmLWJ5OiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5j
bkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gICBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC94
bWxzZWMxL3htbHNlYzFfMS4zLjQuYmIgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQveG1sc2VjMS94bWxzZWMxXzEuMy40LmJiIGIvbWV0YS1vZS9y
ZWNpcGVzLXN1cHBvcnQveG1sc2VjMS94bWxzZWMxXzEuMy40LmJiDQo+IGluZGV4IDc2Mzky
MDllMTkuLmEzZTY2Yzk2ZGYgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L3htbHNlYzEveG1sc2VjMV8xLjMuNC5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC94bWxzZWMxL3htbHNlYzFfMS4zLjQuYmINCj4gQEAgLTEyLDcgKzEyLDcgQEAg
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MzUyNzkxZDYyMDkyZWE4
MTA0ZjA4NTA0MmRlN2Y0ZDAiDQo+ICAgDQo+ICAgU0VDVElPTiA9ICJsaWJzIg0KPiAgIA0K
PiAtU1JDX1VSSSA9ICJodHRwOi8vd3d3LmFsZWtzZXkuY29tL3htbHNlYy9kb3dubG9hZC8k
e0JQfS50YXIuZ3ogXA0KPiArU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbGVrc2V5LmNvbS94
bWxzZWMvZG93bmxvYWQvb2xkZXItcmVsZWFzZXMvJHtCUH0udGFyLmd6IFwNCj4gICAgICAg
ICAgICAgIGZpbGU6Ly9maXgtbHRtYWluLnNoLnBhdGNoIFwNCj4gICAgICAgICAgICAgIGZp
bGU6Ly9jaGFuZ2UtZmluZGluZy1wYXRoLW9mLW5zcy5wYXRjaCBcDQo+ICAgICAgICAgICAg
ICBmaWxlOi8vbWFrZWZpbGUtcHRlc3QucGF0Y2ggXA0K
--------------sJ3yyxUr3uwOvkr7uvaCiriu
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------sJ3yyxUr3uwOvkr7uvaCiriu--

--------------ssFR0ZYA0JEZcvHyiPW8ZrDv--

--------------rnjumYpDpY0uli6HwiXYqcUK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZxKOJQUDAAAAAAAKCRC7BTNVkZ0zFCjq
AJ97SsnSAl01ImAzL8Dg6GGEArKWkgCfeTV9k76ypTmqxv0DFTQMQxHa2gc=
=pnF9
-----END PGP SIGNATURE-----

--------------rnjumYpDpY0uli6HwiXYqcUK--

