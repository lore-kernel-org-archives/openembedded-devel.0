Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.9795.1599874760287003867
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 18:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=thAdPyDh;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id u3so2501389pjr.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 18:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Obslwvj5uu8Y/KdeE/PBZNODXew85uKRYSj6EYtF2To=;
        b=thAdPyDhJ6DKw4+XigoTLDc9YR21Jk3IyNuMNY/Oj4Hkrze9hNSIUv3yNVVRdLn1O7
         7fPhPxmJczA3k9DomTp/vN3/NYRkeLCXO/AOFptPUgvjFqYEhqFoKww0WBGW4D71oKmS
         zXpIYMH0GnCjVkgO5t96orUOGWx07H1fEP003am9dmRtf1sBEOTv3Pn7/rIRbfkf3qBW
         1GHf/N8LSNWM6MYcfaGHhw+OEQ5YPD1cs2YsmjS9DppR7pDCnM1WcGsOVP/9klBKsG2/
         9BgoIfdjhmIjRPKtbOzyBUOzj4Q9ThcXiU6V+CtGPZc0OdMDsawJrY7AKuJkTEX+mDpE
         JmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=Obslwvj5uu8Y/KdeE/PBZNODXew85uKRYSj6EYtF2To=;
        b=a34cPhh7yImz/ZcNl5BxddgdmECht54lTYyJVV9nOOXSXO+d1Efdmn1iIn6vWYOnmD
         S7UDhfj1nVdqI4q7b3MKSGdpuHFYAewqG3/9qBlFu6NNDVfEyBiOAlCPGoQQPvsdeOQE
         9bzEvQnutMSfDIzfYCAp5m9GPovR9PGSMOxUpBfbCoCq8YX5SbJJgbU304zEUhIZM/pB
         lVl8b1PmRO50Tio+7XvqnJkSvc3hNfPGkt5rb3xl39DJatoIsv46yAOaGqhmqWirO7Pi
         7QOvrOwGJ6uTtp1uDte6C8gZYu6TUJgcz2/hGAfYTuSAb3qiO8iOuaY20t7LOTtZt5/J
         kCWA==
X-Gm-Message-State: AOAM5307gNw/uUgBVxCf+0H04wZZsSUGeSI7Xp4D41TaJczY0MapsoL2
	687BHy2aMvmp1NKUxIGVe81QXlmm8SG4SQ==
X-Google-Smtp-Source: ABdhPJyeIYNntJhznMPnM4/GXMrz/PkYmAVRNYX4UTTqG4XLfspKJvG2fjQ/66XyA8YFZQc7An/SaA==
X-Received: by 2002:a17:902:7c0e:b029:d0:89f3:28d4 with SMTP id x14-20020a1709027c0eb02900d089f328d4mr5150958pll.16.1599874759494;
        Fri, 11 Sep 2020 18:39:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::6014? ([2601:646:9200:4e0::6014])
        by smtp.gmail.com with ESMTPSA id v205sm3392525pfc.110.2020.09.11.18.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 18:39:18 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-django: add recipe for 3.1.1
To: Tim Orling <ticotimo@gmail.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20200911142637.1435646-1-trevor.gamblin@windriver.com>
 <CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <08385696-ddaf-d96b-1c84-d14d7d0b2be5@gmail.com>
Date: Fri, 11 Sep 2020 18:39:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com>
X-Groupsio-MsgNum: 87017
Content-Type: multipart/mixed;
 boundary="------------B78716573676C7CE02B7F304"
Content-Language: en-US

--------------B78716573676C7CE02B7F304
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9/11/20 2:02 PM, Tim Orling wrote:
> The reason for Django 2.2 is it is LTS. This version will now override
> unless the user sets PREFERRED_VERSION. The thrash on non-LTS Django is
> a PITA to support...

If we want to keep LTS as default but still offer newer releases as
second options, we can use DEFAULT_PREFERENCE =3D "-1" in newer releases
which folks can override in their custom layers.

>=20
> On Fri, Sep 11, 2020 at 7:26 AM Trevor Gamblin
> <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com>> wro=
te:
>=20
>     meta-python only contains a recipe for django 2.2.x, so
>=20
>     add a recipe file for the newest branch.
>=20
>=20
>=20
>     Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>=20
>     ---
>=20
>     =C2=A0.../recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>=C2=A0 =C2=A0 =C2=A0 | 9 +++++++++
>=20
>     =C2=A01 file changed, 9 insertions(+)
>=20
>     =C2=A0create mode 100644
>     meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>=20
>=20
>=20
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>     b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>=20
>     new file mode 100644
>=20
>     index 000000000..b36cfb699
>=20
>     --- /dev/null
>=20
>     +++ b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>=20
>     @@ -0,0 +1,9 @@
>=20
>     +require python-django.inc
>=20
>     +inherit setuptools3
>=20
>     +
>=20
>     +SRC_URI[md5sum] =3D "d5e894fb3c46064e84e9dc68a08a46d0"
>=20
>     +SRC_URI[sha256sum] =3D
>     "59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f"
>=20
>     +
>=20
>     +RDEPENDS_${PN} +=3D "\
>=20
>     +=C2=A0 =C2=A0 ${PYTHON_PN}-sqlparse \
>=20
>     +"
>=20
>     --=20
>=20
>     2.26.2
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

--------------B78716573676C7CE02B7F304
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------B78716573676C7CE02B7F304--
