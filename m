Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC989C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 19:51:52 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.3690.1672948310951081976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 11:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mmPD71HV;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso3103431pjf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 11:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuWx3xjDiNsOJsYPVTisTVSO6UjY4930NTSQ018tKfc=;
        b=mmPD71HVfDgGDRjf5HoJgkB7Q4FnbhagQvJvJ+2n+HVtWNdDTF3jxzqugbRDeWTNog
         Nn9aAviI641XA1JvMYKuQ7rashmmX8ROttojp/pV93urUmldJ8rD1kAfeGQ1N9uYGlgz
         H9FcHdub6Jg4tFuxr384Tt8yKvNejHG5I+V/hDkRTiyxc1VMfgEMXnslaQ0nq1tvSU4G
         0ySu6EbhSmwVWYaDrwMH/EU7OU7bw9cedj5UhlSU+dpuu15PJfAJEaHZwfxM03WZgw7c
         FxUs2pJhKqv5Yc+006/uXsRi668YVBTaTsIAW6AAZOFUe3LzPmjvm/Hu4pssLqWmphVD
         8Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zuWx3xjDiNsOJsYPVTisTVSO6UjY4930NTSQ018tKfc=;
        b=3pgh8+PalKaMtqMnkMNtk9z/fMmV3E+siHOZlIAUVnvQcjl6l5EXDsO9ChNsw91NXe
         3hNjVvIq22oZRxiZF251hRofCtsv6X0lrhiILBQoQb8PnxNamlQZiWgveSftJ4qQE9t6
         fXT7P6ZSw2Ho8IiVxj8DdWaSe9E2LXJc1rvzfSf7dW8rqtIa845MfR6BI6gk13oAiVtx
         Q4mCnPxQ4zAHsv9p3T9IMYMjZRyW+fYZTEgYw+e4Mr1MJU6/0uMlo+xV+QpiyxK+KACn
         kHMrLIVZbBVMqu5Cmks/OYisggBumtmebyh7xz1CeU1RxrPaLVaHu4p5x7X26q/yELEy
         FSrw==
X-Gm-Message-State: AFqh2ko1NQpL+5q57Usp6s8XTNCrpB765WKy+Df4dpTghmpIINe2a3aF
	pvhkgCn9tZA5xnELGwclcGw=
X-Google-Smtp-Source: AMrXdXs/HsxCI8PnPf6rgFrW/6fquGhWQ69sXFZcYvf5SFngItLHb6KuOsmwyjct+HdljW3FvV9cWA==
X-Received: by 2002:a17:902:b70f:b0:192:bd3b:5720 with SMTP id d15-20020a170902b70f00b00192bd3b5720mr18463934pls.68.1672948309902;
        Thu, 05 Jan 2023 11:51:49 -0800 (PST)
Received: from ?IPV6:2601:646:9181:1cf0:3402:e7af:2a33:dac3? ([2601:646:9181:1cf0:3402:e7af:2a33:dac3])
        by smtp.gmail.com with ESMTPSA id l2-20020a170903244200b001888cadf8f6sm26508003pls.49.2023.01.05.11.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 11:51:49 -0800 (PST)
Message-ID: <f5506158-946d-d49d-040c-2536f62ec445@gmail.com>
Date: Thu, 5 Jan 2023 11:51:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [oe] [meta-oe] dnf-plugins/rpm.py: Fix grammar when
 RPM_PREFER_ELF_ARCH doesn't exit.
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1672478484-3244-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <1672478484-3244-1-git-send-email-wangmy@fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YB0yaB2L0I02v0DBIiZ6nVO3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 19:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100420

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YB0yaB2L0I02v0DBIiZ6nVO3
Content-Type: multipart/mixed; boundary="------------OUW6nw2JIw9BSPtn4iz0kVQ4";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
Message-ID: <f5506158-946d-d49d-040c-2536f62ec445@gmail.com>
Subject: Re: [oe] [meta-oe] dnf-plugins/rpm.py: Fix grammar when
 RPM_PREFER_ELF_ARCH doesn't exit.
References: <1672478484-3244-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1672478484-3244-1-git-send-email-wangmy@fujitsu.com>

--------------OUW6nw2JIw9BSPtn4iz0kVQ4
Content-Type: multipart/mixed; boundary="------------hWJ9UpqQWwz06eYotjT4AXl0"

--------------hWJ9UpqQWwz06eYotjT4AXl0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpUaGUgdGltZSBpcyBpbiBwYXN0IG9uIHRoaXMgcGF0Y2guIFBsZWFzZSBmaXggaXQgb24g
eW91ciBtYWNoaW5lIGJlZm9yZSANCnNlbmRpbmcvY3JlYXRpbmcgcGF0Y2hlcy4gSSBjYW4g
ZWFzaWx5IG1pc3MgdGhlbSBzaW5jZSB0aGV5IGRvIG5vdCBzb3J0IA0KcHJvcGVybHkgaW4g
bXkgcXVldWUuDQoNCk9uIDEyLzMxLzIyIDE6MjEgQU0sIHdhbmdteSB3cm90ZToNCj4gRnJv
bTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgIG1ldGEt
b2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1Z2luLXR1aV9naXQu
YmIgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYiBiL21ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gaW5kZXgg
OWY5NjE4ODJhLi5jYTJiMjAxMDggMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gKysrIGIv
bWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVp
X2dpdC5iYg0KPiBAQCAtNCw3ICs0LDcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiDQo+
ICAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1
ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiDQo+ICAgDQo+ICAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRo
dWIuY29tL3ViaW51eC9kbmYtcGx1Z2luLXR1aS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyINCj4gLVNSQ1JFViA9ICJiMGQ4MGI3MTI5ZjFkODRjYzU2M2E0MDk4ZDg2OWU3
NDIwYmNmNGJjIg0KPiArU1JDUkVWID0gIjhkMjFmNTI1NzdhYTAzOTU4NzMyYTVhMzQ2YTY3
OGM2OTllOThjYjYiDQo+ICAgUFYgPSAiMS4zIg0KPiAgIA0KPiAgIFNSQ19VUkk6YXBwZW5k
OmNsYXNzLXRhcmdldCA9ICIgZmlsZTovL29lLXJlbW90ZS5yZXBvLnNhbXBsZSINCj4gDQo+
IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5l
ICgjMTAwNDA5KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL21lc3NhZ2UvMTAwNDA5DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk2MDY4NDMxLzE5OTc5MTQNCj4gR3JvdXAgT3du
ZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gDQo=
--------------hWJ9UpqQWwz06eYotjT4AXl0
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------hWJ9UpqQWwz06eYotjT4AXl0--

--------------OUW6nw2JIw9BSPtn4iz0kVQ4--

--------------YB0yaB2L0I02v0DBIiZ6nVO3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCY7cqUwUDAAAAAAAKCRC7BTNVkZ0zFFpf
AJ4g7bc3EKAdQF9f9LlzhX0VoK+PMwCfcQfQJLuM1t0G35Bn+uWTsQzcFpw=
=ESCA
-----END PGP SIGNATURE-----

--------------YB0yaB2L0I02v0DBIiZ6nVO3--

