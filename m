Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A47CC369CF
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 21:34:58 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.5211.1745098493042362721
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 14:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AUQf8hiY;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-604f0d27c24so1356046eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745098492; x=1745703292; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZ/ci5NtUVIy4fG6vd8cz4NezH5b9Vyf4GqitqwuRY4=;
        b=AUQf8hiYgAB1JWKTKZZO2sVuvZQxC17rV4DNlNzPw/6DgFukVMMPRYAsac96kRLXYc
         4hDXLNeaBeZkNODeyf4Lryxv5/GtNvpzthEXsrrhxq9boC4UEEgV+5ryCK7sydKT4kAF
         GVtdjw/vO/aw0YwMbkzmeNCg1HH3WIgMC0k/UlEnN6qZL1fChS82HqWWChgBvaZAwsLZ
         XjXep2r2cYTp6l6JvBcejSVrgrMXUXZFjCY2WlZQR/k+KTvgcc2NzrV+TlS9WCZD+o10
         yrbpRl5evk0NSGuemaVngymcW8blE/w4egvNkScbXAGYmwt98HzLN7BALEyur/KN03xK
         TtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745098492; x=1745703292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ/ci5NtUVIy4fG6vd8cz4NezH5b9Vyf4GqitqwuRY4=;
        b=BXdtVw4+v1ZVheYib0YKN/fLu5QOtpeXET+U+Kwqe2nAMbfS44qa9GOYTXlbv2pil6
         Y5UOMaDTHJqXBv7FLvqzS+dk72uTYIfFauOCTHZA8XZv/GjwaBRlFBIQCDI+cZA2Hl7I
         gr/nRVB0F+10wxL/DiD25tK8Jb7gRGBKCnxlUBgGp16V50cxXxqM+DoSAtPGRwPc51lN
         f/Y0/VYRgpz1uwSQaUGX3X3Q3FHlj6Or91L1W3OtSObFoe0O7M8AYzO/P43BEubTzTti
         1A5+fRefAfCzg92RQyOQ7WRBfd/tF5dO2XX2QxqpuOJvL3gnvkAxbsDEEOckXg/vpxxU
         ulCg==
X-Gm-Message-State: AOJu0YzShc3jEvfPtwt3qM88+cZJ/xqj3jNHEM0jY9RMjPY3WFao17l9
	pSjqGg+me7k0y0dIZti457eqVx9H880jA8fOsS5HOtSS2/+bQxct3Jyk1I1VM6FN7RToJIHqOim
	+UWkpw/oorrvFIlAIl65Trk32BTZrYX9JuDg=
X-Gm-Gg: ASbGncstqjTEpyvwadYjG+cyAghNHZjMxTHpIJHwCCbCpOPws+mdXnBbYcrVJ7BiPQw
	juV7Eg/fGPlL+7rlrSLtTi1Bf4prTjaUQW2yeLQ456vf35rI7x/wq5n9c9Xr+Cgyhybsy1X19Mx
	5LDzRo8RRz0da5CWc+W+xcNHeFpyVlfqPeuG8z
X-Google-Smtp-Source: AGHT+IElsbzrxk/22VBoLGbYeZ3mqDmOwcP4bltnMMr94S81XjXXwmAAE+vRVd41Xzvdqg169wzvyS3crXEGtwNNs7U=
X-Received: by 2002:a4a:e911:0:b0:603:f526:5e76 with SMTP id
 006d021491bc7-6060055bb2emr4299425eaf.6.1745098492224; Sat, 19 Apr 2025
 14:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com> <1744794136-908-12-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744794136-908-12-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Apr 2025 14:34:25 -0700
X-Gm-Features: ATxdqUFCoL6-ukfK1n7bnsa_64GbwYajwaKhDYMWN4debYrwuAeo9gwnmwysd9c
Message-ID: <CAMKF1sos6A8icWE-GG58QK15XjWdD_+=gwLOOTvSPpmRhUc-XA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 12/31] nlohmann-json: upgrade 3.11.3 -> 3.12.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 21:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116985

it fails ptests

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
/usr/src/debug/nlohmann-json/3.12.0/tests/src/unit-locale-cpp.cpp:134:
TEST CASE:  locale-dependent test (LC_NUMERIC=3Dde_DE)
  check if locale is properly set

/usr/src/debug/nlohmann-json/3.12.0/tests/src/unit-locale-cpp.cpp:142:
ERROR: CHECK( std::string(buffer.data()) =3D=3D "12,34" ) is NOT correct!
  values: CHECK( 12.34 =3D=3D 12,34 )

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

On Wed, Apr 16, 2025 at 2:02=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Updata: Copyright year updated to 2025
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{nlohmann-json_3.11.3.bb =3D> nlohmann-json_3.12.0.bb}  | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.11.3.bb =
=3D> nlohmann-json_3.12.0.bb} (84%)
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.=
bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> similarity index 84%
> rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.b=
b
> rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> index 194e80546e..340b314925 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> @@ -2,16 +2,16 @@ SUMMARY =3D "JSON for modern C++"
>  HOMEPAGE =3D "https://nlohmann.github.io/json/"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Df969127d7b7ed0a8a63c2bbea=
e002588"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3D3b489645de9825cca5beeb9a7=
e18b6eb"
>
>  CVE_PRODUCT =3D "json-for-modern-cpp"
>
> -SRC_URI =3D "git://github.com/nlohmann/json.git;branch=3Ddevelop;protoco=
l=3Dhttps \
> +SRC_URI =3D "git://github.com/nlohmann/json.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV} \
>             git://github.com/nlohmann/json_test_data.git;destsuffix=3Dgit=
/json_test_data;name=3Djson-test-data;branch=3Dmaster;protocol=3Dhttps \
>             file://run-ptest \
> -"
> +           "
>
> -SRCREV =3D "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
> +SRCREV =3D "55f93686c01528224f448c19128836e7df245f72"
>  SRCREV_json-test-data =3D "a1375cea09d27cc1c4cadb8d00470375b421ac37"
>
>  SRCREV_FORMAT .=3D "_json-test-data"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116884): https://lists.openembedded.org/g/openembedde=
d-devel/message/116884
> Mute This Topic: https://lists.openembedded.org/mt/112291818/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

