Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE07ECA6011
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 17:55:05 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.832.1791482104578946225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 10:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pI89t0jz;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5cdb9cb8019so2355027e0c.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 10:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791482103; cv=none;
        d=google.com; s=arc-20260327;
        b=c0SC8IQrClbpfNT8GgsCRPlg90zzvIuO3vGHuWhyw6XGo24hArP13WHsCBs3waSodn
         r3DRWsqg5Uhs2JM4ASDWVdtYXJ8pF1tmno74bJTlkFGPkkDSQ6i/MpN08saDPrheCke7
         +rLEjIm5qFyh+KJKdzaShUskSEgEFF3LzAWsUmchxIYFu0Ps3cnM99tD1TVW+ZN1jOJ1
         +bnvhina7yMJ79y2+y2bKOpcTKzQZH3NsROy7+iJSXO2ltked1tcjLm+0qZBs0SAqjwN
         XYHxJKJGJPNkOyM9QdEziVUuiEU+h5HXBkcie6sO9TmMzZBYRJS6rGKNBzGY4JoOyQoO
         v1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gAZWPN5radrnz2wLTFAXSryhqjPZEVs/etb0cR0BZvY=;
        fh=J19R/TjFCL1cumQsjcLd1x0F5Pak44Cx1SMliNr2o5Y=;
        b=YyrLsSxgxEIMgo1LlajAT7+tej+NCSgibgFZCfRuyDhzpGcfQbpddZSE+3fnpqNjns
         F0m5CK8oMldRmgi5NcF6UCgA1joFQV3hrf0ZFIAVMpf0F07oT8BlfbRdqabxgU3bYzLK
         FkXuHj39uKhQPC5aHT5CHdDS027At+JfBN35gqN86Hg5gA2g393pEjAjB9oqVaUxq1/D
         GN4Ru9ST2s2yQuRaoVr61uCG95F5ClqGLy+e3hk4psCUliEOaHLXaKB7nf09oHQYuSms
         +AFTjNfPmIwZArQnR0QMA/JJR7Kj5hyI+/lKUutmrmmaq+cWc1MIm37sanUDh8Kqzuqp
         tp+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482103; x=1792086903; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gAZWPN5radrnz2wLTFAXSryhqjPZEVs/etb0cR0BZvY=;
        b=pI89t0jz2XRMNsSboTlSXX6Zr+w99ehvnLiADiBhbpoh5loCI5999sG0FDVLJZhi9/
         Cy5ALisexlKtZL8T5y3ZpRt4PkHOhEQxYbsMwcCzuSM72PoL7ah1qBAqDP/BUSJxiW3k
         1CCeWJemqLyiLSKfv72mn5L35AKsYd1JZ2WFQ45ggCZuWO7Oz45i79cjD1SEVts6fagM
         yd89vADKSO0OPDdv+lJIgYqIhVu9CwSDVZxKPsmCd6afYhbFByglayNuF2EF7BOk9vJv
         RLXWXli6MtEaZRh6h1QCoV4JHYzACGdhq3T6QYYK8HIyrAa40TgGLczCbzBqNNHtZv+J
         b5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482103; x=1792086903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAZWPN5radrnz2wLTFAXSryhqjPZEVs/etb0cR0BZvY=;
        b=Odz1NbR4dT4EQYcJBiTGX7Kd3bmcw80CdTpgwz30D4FrIYNHKzOzI5tETPJtQwE6A7
         /T/N0OCo3fvGnDru6Awyj/NUg3vHYv7ETc0K41AZdhcQzZ0cERDahJ1zgmSTd4jf6B7b
         VbDDoZOlWbYMztpLu+l9YmCsDsn1X09PpVbXGPxL4t/oqTyDi8Vn+vi+5dRcVJJyRZ34
         dZueXiHCNdIzA02uv6dhEvdu4IMNafqJnywWkE4ax2CJXVJ6DxgqIegr0DWD7AmR6R28
         0o6SfmWkai/wtZig/0pWDc0gAljKTREmltmTq+YtB4IEiIMMOlcVvmPJRlO5xGFwfsnh
         BxJw==
X-Gm-Message-State: AFq9FYKJ2X3xj5xP7f9Vxs6qSMVOQCVtmcVyNijzDcKDIN0FjFuCt4Cr
	rAoHpPJHkkdimXu2JP3OBMZR0FGxmwDT+a9jhoPXl/TrNhXVqirEqlvvP75m9EEwnIsfq2QBEzT
	PK1G4xqaYaeSexJgqzW7NoLMtLbyeR4E=
X-Gm-Gg: AYBFou1MK1KeqE385k89pS4lormUpR/qx4M5yyVHcv6A3gvm2sOIDuk0KWfEGDPce1L
	UeO2Dr5KqTw/g8QWpL4OzBPgx0mPCHxJIrgV3r8FI9dca/gxNrpdyHx7VDo8PdKTIAZeD+/oCo7
	Pwq33B3lE3qFJFTuq9ATkW+eLavnwl4+Ph3sF5Kf9/KNbTp79yyNQFDbyJkwCuQURlQd3GGMtkV
	uQ6prbiZnS0mtTkQem+Sh96MYZMwhRDBtnBQ1x4csBcxIhftEdTLyT71+vc57iVAz6+uJP+Bllg
	bKkkneg1OUwS436JuIkkGQ5wcNAG/FrQZ3gZcDqWkrd3ywkL9XOeFp83ZCdFE8yLQVzzn8THNIW
	lpPOj/WEvaSG0Us0+tlZthdf1S2/T+jmzL+je
X-Received: by 2002:a05:6102:6416:b0:7cb:288a:b678 with SMTP id
 ada2fe7eead31-7cb288ac797mr74692137.19.1791482103267; Thu, 08 Oct 2026
 10:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkPKpncAuB=yJu=t300xLae3X0VpixOYMOMrX3Nx-DpEpBQ@mail.gmail.com>
 <CABKMkPJz-gaF88E_x7RAmZLY-fntZGoDTODXhb84TXNUQXA7=Q@mail.gmail.com>
In-Reply-To: <CABKMkPJz-gaF88E_x7RAmZLY-fntZGoDTODXhb84TXNUQXA7=Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Oct 2026 19:54:48 +0200
X-Gm-Features: AclHuK_4JUCxFRKjeQ7D6VV-VlbzpTB0KSBMLtn0oq8dxczZSoUbE02aamTQ1Ss
Message-ID: <CA+chaQfaicns7ffqtXJQiho=ApiLNDdoFU64qnUmst0=Jm1D0w@mail.gmail.com>
Subject: Re: [oe] meta-python: 30 recipes fetch a 404 after oe-core's
 PYPI_PACKAGE change
To: joel.winarske@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 17:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130672

Hi Joel,

pytz should be resolved by
https://lists.openembedded.org/g/openembedded-devel/message/130579
which is already in master-next.

For PYPI_PACKAGE change I've sent a fix for some recipes included in
my builds (https://patchwork.yoctoproject.org/project/oe/patch/202610070606=
20.442458-1-martin.jansa@gmail.com/
and https://patchwork.yoctoproject.org/project/oe/patch/20261006083554.2712=
998-1-martin.jansa@gmail.com/
)

Thank you for sending fixes for the remaining recipes.

There might be a bit longer delay getting them applied due to Khem and
many other people attending the conference this week.

Cheers,

On Thu, Oct 8, 2026 at 7:43=E2=80=AFPM Joel Winarske via
lists.openembedded.org
<joel.winarske=3Dgmail.com@lists.openembedded.org> wrote:
>
> Correction to the numbers. Two mistakes, both mine.
>
> I scanned a tree from 17 August rather than master, and I only looked for=
 recipes that set a hyphenated PYPI_PACKAGE. The class derives the
> name from BPN when it is unset, so a recipe with a hyphen in its name is =
affected without containing the string I grepped for. python3-async-
> timeout no longer sets PYPI_PACKAGE and still fetches async_timeout-4.0.3=
.tar.gz, which is a 404.
>
> On master at ca3cf5fe14, 71 recipes inheriting pypi have a hyphen in the =
effective PYPI_PACKAGE and 70 of them 404 today. 23 set PYPI_PACKAGE, 47
> take the derived default. 69 are in meta-python, the last is meta-oe/reci=
pes-connectivity/gammu/python3-gammu_3.2.4.bb.
>
> python3-tomli-w is the only candidate that is fine: its sdist is already =
tomli_w-1.2.0.tar.gz.
>
> Cause and fix are unchanged. Patches to follow for meta-python and meta-o=
e separately.
>
> Unrelated, I found this while testing: nothing in oe-core or meta-openemb=
edded provides python3-pytz, and 18 meta-python recipes name it
> -- 9 in RDEPENDS:${PN}, 8 in RDEPENDS:${PN}-ptest, and one in DEPENDS (py=
thon3-python-xmp-toolkit). bitbake stops at
>
>   ERROR: Nothing RPROVIDES 'python3-pytz'
>
> So, python3-flask-restx, python3-google-api-core, python3-pydantic and th=
e rest have no buildable providers.  I can start a new thread on this one.
>
> On Wed, Oct 7, 2026 at 8:06=E2=80=AFAM Joel Winarske <joel.winarske@gmail=
.com> wrote:
>>
>> oe-core 98049bf86 redefined PYPI_PACKAGE as the normalized name and deri=
ves the sdist name from it:
>>
>>   PYPI_PACKAGE_SDIST ?=3D "${@d.getVar("PYPI_PACKAGE").replace("-", "_")=
}"
>>
>> 264698b8a migrated oe-core's own recipes, 48 files under meta/recipes-de=
vtools. meta-python was not migrated, so every recipe there with a hyphenat=
ed PYPI_PACKAGE builds a URL that does not exist: the sdists predate PEP 62=
5 and are still hyphenated.
>>
>>   ERROR: python3-absl-native-2.1.0-r0 do_fetch: Fetcher failure:
>>   Fetch command ['wget', ...,
>>   '.../source/a/absl_py/absl_py-2.1.0.tar.gz'] failed with exit code 8
>>
>> The file is absl-py-2.1.0.tar.gz. Checksums are unaffected, only the URL=
.
>>
>> All 30 affected recipes need the appropriate setting. 11 of them also ca=
rry uppercase in PYPI_PACKAGE, which needs normalizing as well; those are s=
hown with both lines.
>>
>> python3-absl_2.1.0:
>>   PYPI_PACKAGE_SDIST =3D "absl-py"
>> python3-antlr4-runtime_4.13.1:
>>   PYPI_PACKAGE_SDIST =3D "antlr4-python3-runtime"
>> python3-async-timeout_4.0.3:
>>   PYPI_PACKAGE_SDIST =3D "async-timeout"
>> python3-dateutil_2.9.0:
>>   PYPI_PACKAGE_SDIST =3D "python-dateutil"
>> python3-decouple_3.8:
>>   PYPI_PACKAGE_SDIST =3D "python-decouple"
>> python3-editor_1.0.4:
>>   PYPI_PACKAGE_SDIST =3D "python-editor"
>> python3-flask-bootstrap_3.3.7.1:
>>   PYPI_PACKAGE =3D "flask-bootstrap"
>>   PYPI_PACKAGE_SDIST =3D "Flask-Bootstrap"
>> python3-flask-httpauth_4.8.0:
>>   PYPI_PACKAGE =3D "flask-httpauth"
>>   PYPI_PACKAGE_SDIST =3D "Flask-HTTPAuth"
>> python3-flask-jsonpify_1.5.0:
>>   PYPI_PACKAGE =3D "flask-jsonpify"
>>   PYPI_PACKAGE_SDIST =3D "Flask-Jsonpify"
>> python3-flask-jwt_0.3.2:
>>   PYPI_PACKAGE =3D "flask-jwt"
>>   PYPI_PACKAGE_SDIST =3D "Flask-JWT"
>> python3-flask-login_0.6.3:
>>   PYPI_PACKAGE =3D "flask-login"
>>   PYPI_PACKAGE_SDIST =3D "Flask-Login"
>> python3-flask-nav_0.6:
>>   PYPI_PACKAGE_SDIST =3D "flask-nav"
>> python3-flask-restful_0.3.10:
>>   PYPI_PACKAGE =3D "flask-restful"
>>   PYPI_PACKAGE_SDIST =3D "Flask-RESTful"
>> python3-flask-sijax_0.4.1:
>>   PYPI_PACKAGE =3D "flask-sijax"
>>   PYPI_PACKAGE_SDIST =3D "Flask-Sijax"
>> python3-flask-uploads_0.2.1:
>>   PYPI_PACKAGE =3D "flask-uploads"
>>   PYPI_PACKAGE_SDIST =3D "Flask-Uploads"
>> python3-flask-user_0.6.19:
>>   PYPI_PACKAGE =3D "flask-user"
>>   PYPI_PACKAGE_SDIST =3D "Flask-User"
>> python3-flask-versioned_0.9.4-20101221:
>>   PYPI_PACKAGE =3D "flask-versioned"
>>   PYPI_PACKAGE_SDIST =3D "Flask-Versioned"
>> python3-flask-xstatic_0.0.1:
>>   PYPI_PACKAGE =3D "flask-xstatic"
>>   PYPI_PACKAGE_SDIST =3D "Flask-XStatic"
>> python3-gnupg_0.5.5:
>>   PYPI_PACKAGE_SDIST =3D "python-gnupg"
>> python3-gpsd-py3_0.3.0:
>>   PYPI_PACKAGE_SDIST =3D "gpsd-py3"
>> python3-idna-ssl_1.1.0:
>>   PYPI_PACKAGE_SDIST =3D "idna-ssl"
>> python3-nmap_1.9.1:
>>   PYPI_PACKAGE_SDIST =3D "python3-nmap"
>> python3-periphery_2.4.1:
>>   PYPI_PACKAGE_SDIST =3D "python-periphery"
>> python3-pkcs11_0.7.0:
>>   PYPI_PACKAGE_SDIST =3D "python-pkcs11"
>> python3-pytest-json-report_1.5.0:
>>   PYPI_PACKAGE_SDIST =3D "pytest-json-report"
>> python3-rapidjson_1.19:
>>   PYPI_PACKAGE_SDIST =3D "python-rapidjson"
>> python3-robotframework-seriallibrary_0.4.3:
>>   PYPI_PACKAGE_SDIST =3D "robotframework-seriallibrary"
>> python3-snappy_0.6.1:
>>   PYPI_PACKAGE_SDIST =3D "python-snappy"
>> python3-systemd_235:
>>   PYPI_PACKAGE_SDIST =3D "systemd-python"
>> python3-uinput_1.0.1:
>>   PYPI_PACKAGE_SDIST =3D "python-uinput"
>>
>> Nothing in Bugzilla or master-next.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130671): https://lists.openembedded.org/g/openembedde=
d-devel/message/130671
> Mute This Topic: https://lists.openembedded.org/mt/121629518/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

