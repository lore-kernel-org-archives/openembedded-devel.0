Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504D2C3600C
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 01:16:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.1517.1743729364456592226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 18:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fx62GQ/n;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1554730b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 18:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743729364; x=1744334164; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GF+e/EZ8fSxODrRaPKiSwf3lomTGvGVSTFIdLbvFBPQ=;
        b=Fx62GQ/nx41WqydjftHgEDSESbeOShEEaihxkM7KCFfGbt0+9pXpQDD4yBHY981Y8o
         k8FpcGC0n+h26EBm5ZrX39dZVsomfoYsvcyVV5kGV2Eh32R5NEEdQYprioNr0nK8+WmA
         w8opAQFM8EfE6TqfSiqP4jUCtkSigwAb7fEHD3tA0HL0hOxyxRNx/utrn9AQbMC/0tqT
         u0Hu7NHxdXxZUFZX8ijqPq46+OwkuJ1m84GazPyGM1XKPhGq689yI6tthnGUbVpXLdRB
         lgvGlzAQg0a7aQ6U8nou3SxHcODDQYj4B9RXUHu9RQ+NE4qpFalw+vsxVx9HnktQjqlU
         ObQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743729364; x=1744334164;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GF+e/EZ8fSxODrRaPKiSwf3lomTGvGVSTFIdLbvFBPQ=;
        b=wyzMN7KoBgV7SY2/klBat/sUB8dej5mSqmmzt+uPU9eqEhwgh3Yi6WNfCTGyqWeldW
         MzB4XVFsk3iZCcJSCIGfkQ40ok6fcEvYOzpdaI/IU3E/xxluxp2jGefHMQaLzTsyVZrX
         9r3x+TAgN2GolYzPgHNffyiVzYrQFtZbT8cMPfdOffX5TsovAZfdszCyFXvP+c9/c3v5
         HH39rBeZDmXskvH8siE4kF8lCkn72K5PPM0wl02vjpJ/li6ZChsb4wEoULwogq3Mm8HQ
         1cD8osEJQ0OCG4hkkcgxgGFFHs5m4ntpYrVL7GCjG3/s4RYNUeQbyEYr3hHUaAI43Y6K
         +u0A==
X-Gm-Message-State: AOJu0YwP3FTAklmCC4XvW5XqX6bDHP8FUGRhd9b7RZzeN/cj0Xq3simR
	8+LaQnmO9oJXzQi9gPJXfVTO4CskBgH2oTuNnq63eJD9sbBaqG7I
X-Gm-Gg: ASbGnctanWy82leF7Tgj3Wa8HVDJdycgnRjGnS/N8lVKZTU8lfQZmPFB2MSWAj9b/+j
	wmsPlAJDE3yadwQeyDubz+CYGbgDI2Ofq46iA3U8TcKRvayKbpnj0Ga1bavlaJvDNlthOD85phS
	nFTWN6u/odYg6Kyi8wyoSf7rcjgAuIThHSNmB9j6b101Qp5i/prv8xXv4tomw79AtGOE/ilLywQ
	UnFGTZugLoHj+IZOyA6eY8pZRJfee8VbxBu6mLY2DswMPyuz5FJ6JeE5GoV6y4xWZXhRgyYzViz
	tf9GchGfiD/3WAbzrMx4aBs5CunTKW3x+5U2ULvLFPK4JqMLMsOskEqH570WNgYfxIxLqI13/74
	OuAtTHlXlQYc9qlFxbPXAyrpSx6+Kn7Jo0VaTruk7bAGcxQ==
X-Google-Smtp-Source: AGHT+IGN/SiV2bnQ33HZCTd0AYTbgMHpK843+UJ+TKH2tGBZmLEZ6mub2b31GUmyoTXQUTVKxnlPFw==
X-Received: by 2002:a05:6a20:6f8b:b0:1f0:e6db:b382 with SMTP id adf61e73a8af0-200f552549bmr6934142637.8.1743729363767;
        Thu, 03 Apr 2025 18:16:03 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:c9f1:e4a5:727f:b7a? ([2601:646:8201:fd20:c9f1:e4a5:727f:b7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc351371sm1850123a12.40.2025.04.03.18.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 18:16:02 -0700 (PDT)
Message-ID: <297305bc-193f-4fe5-a306-bd05f33933b4@gmail.com>
Date: Thu, 3 Apr 2025 18:16:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Awais Belal <awais.belal@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com>
 <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
 <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
 <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
 <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com>
 <CA+chaQdj4iXwG1bP_ZYJVXJXU1Oq4buzc5hx=YU7DBkXk9uQ0A@mail.gmail.com>
 <CAM=5Ambb1=5rTBYoQQ1y+OwpFRUn2eVmadPYRCsj3NBS1+ucqA@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CAM=5Ambb1=5rTBYoQQ1y+OwpFRUn2eVmadPYRCsj3NBS1+ucqA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WGjRu9saTc65pcP22gev3hCP"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 01:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116556

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WGjRu9saTc65pcP22gev3hCP
Content-Type: multipart/mixed; boundary="------------cOtEnT4mgWlf6VzfdZrPPGo0";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Awais Belal <awais.belal@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <297305bc-193f-4fe5-a306-bd05f33933b4@gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com>
 <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
 <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
 <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
 <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com>
 <CA+chaQdj4iXwG1bP_ZYJVXJXU1Oq4buzc5hx=YU7DBkXk9uQ0A@mail.gmail.com>
 <CAM=5Ambb1=5rTBYoQQ1y+OwpFRUn2eVmadPYRCsj3NBS1+ucqA@mail.gmail.com>
In-Reply-To: <CAM=5Ambb1=5rTBYoQQ1y+OwpFRUn2eVmadPYRCsj3NBS1+ucqA@mail.gmail.com>

--------------cOtEnT4mgWlf6VzfdZrPPGo0
Content-Type: multipart/mixed; boundary="------------8tvgQV1JTjvL7zX1UKfs9W1E"

--------------8tvgQV1JTjvL7zX1UKfs9W1E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8zLzI1IDY6MTQgQU0sIEF3YWlzIEJlbGFsIHdyb3RlOg0KPiANCj4gICAgIEF3YWlz
OiBhbnkgdXBkYXRlIG9uIHRoaXM/IHRoZSAxLzIgaXMgYWxyZWFkeSBhcHBsaWVkIGluIHNj
YXJ0aGdhcCwNCj4gICAgIGJ1dCBpbiB3YWxuYXNjYXIgYW5kIG1hc3RlciBpdCdzIHN0aWxs
IHNraXBwZWQgd2l0aDoNCj4gICAgIFNLSVBfUkVDSVBFW21vbmdvZGJdID89ICJOZWVkcyBw
b3J0aW5nIHRvIHB5dGhvbiAzLjEyIg0KPiANCj4gICAgIGFuZCB0aGVyZSBpcyBhbHNvOg0K
PiANCj4gICAgIEVSUk9SOiBtb25nb2RiLTQuNC4yNC1yMCBkb19wYWNrYWdlX3FhOiBRQSBJ
c3N1ZTogRmlsZSAvdXNyL2Jpbi9tb25nb2QNCj4gICAgIGluIHBhY2thZ2UgbW9uZ29kYiBj
b250YWlucyByZWZlcmVuY2UgdG8gVE1QRElSDQo+ICAgICBGaWxlIC91c3IvYmluL21vbmdv
cyBpbiBwYWNrYWdlIG1vbmdvZGIgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KPiAg
ICAgW2J1aWxkcGF0aHNdDQo+ICAgICBFUlJPUjogbW9uZ29kYi00LjQuMjQtcjAgZG9fcGFj
a2FnZV9xYTogRmF0YWwgUUEgZXJyb3JzIHdlcmUgZm91bmQsDQo+ICAgICBmYWlsaW5nIHRh
c2suDQo+IA0KPiAgICAgZXZlbiBpbiBzY2FydGhnYXAgKHdoZXJlIGl0IHVzdWFsbHkgaXNu
J3QgZmF0YWwgZXJyb3IsIGJ1dCB3aWxsIG5lZWQNCj4gICAgIHRvIGJlIGZpeGVkIGZvciB3
YWxuYXNjYXIgLSBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgbmV3IHZlcnNpb24gZnJvbQ0KPiAg
ICAgdGhpcyByZXZpZXcgeWV0KS4NCj4gDQo+IA0KPiBIaSBNYXJ0aW4sDQo+IEkgYmVsaWV2
ZSB0aGUgb25seSBpc3N1ZXMgbGVmdCBoZXJlIGFyZSB0aGUgVE1QRElSIHJlZmVyZW5jZXMg
YnV0IEkgDQo+IGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHBpY2sgdGhvc2UgdXAganVzdCB5ZXQu
IEkgYWxzbyB0cmllZCBwaW5naW5nIEtoZW0gDQo+IGZvciBzb21lIHBvaW50ZXJzIG9uIFRN
UERJUiBpc3N1ZXMgYXMgSSBteXNlbGYgaGF2ZW4ndCBoYWQgYW4gZW5jb3VudGVyIA0KPiB3
aXRoIHRob3NlIGVhcmxpZXIuIEFuecKgc3VnZ2VzdGlvbnMgb24gaG93IEkgc2hvdWxkIGdv
IGFib3V0IGRlYnVnZ2luZy8gDQo+IGZpeGluZ8KgdGhlbT8NCj4gDQoNCkkgZGlkIG5vdCBp
Z25vcmUgeW91LCA6KSBJIGp1c3QgZGlkIG5vdCBoYXZlIHRpbWUgdG8gaGVscCBvdXQuIFRo
ZXJlIGFyZQ0Kc29tZSBwYXR0ZXJucyBvZiBUTVBESVIgZW1iZWRkaW5nIGludG8gdGFyZ2V0
IHBhY2thZ2VzLCBidXQgaXQgbmVlZHMgdG8gDQpiZSByb290IGNhdXNlZC4gSWYgeW91IGxv
b2sgdGhyb3VnaCByZXBvLCB5b3UgbWlnaHQgZmluZCBzb21lIGhlbHAgb24gDQp3aGF0IGRp
ZmZlcmVudCB1c2UgY2FzZXMgaGF2ZSBiZWVuIGZvdW5kIGFuZCBob3cgdGhleSB3ZXJlIGhh
bmRsZWQuDQoNCj4gLS0gDQo+IFJlZ2FyZHMsDQo+IEF3YWlzIEJlbGFsDQo=
--------------8tvgQV1JTjvL7zX1UKfs9W1E
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------8tvgQV1JTjvL7zX1UKfs9W1E--

--------------cOtEnT4mgWlf6VzfdZrPPGo0--

--------------WGjRu9saTc65pcP22gev3hCP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZ+8y0gUDAAAAAAAKCRC7BTNVkZ0zFEFb
AJkBAbQGyncprG7sFZ2K58UFSjLdkwCeJq9mcgTz9azwGg5yU7VrPaWz6Og=
=ZSDx
-----END PGP SIGNATURE-----

--------------WGjRu9saTc65pcP22gev3hCP--

