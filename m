Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F37E7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 17:11:20 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.12584.1735837874732029719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jan 2025 09:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kIHFx3Dd;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-29f9e76802aso6268026fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735837874; x=1736442674; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIXXZNzQYDd4wweCE2an7eg5wTBkktM6ZfWulNhI7p0=;
        b=kIHFx3DdsFKzHsjw6UgpX+wQoyP1xmQRKpPrlBf6MB4n2TENyqkyosQJYyoMpeTA4r
         TR1loK7b9Mx9uyQAZK1TifDOTxKd7fiBOIdATl9SGX0rfc4WXp/CWFm4VjNmF3m1PZ96
         1Sk1UrReDvSLVStptoXTAiQfklpGq+8OeSFP3XzTe9CdYuYWvcph+FN+b2F4ObpjyoMY
         R2LAAgKVwq58+qmPHMAt4bpgVnLHQZAGFq3dCKStdD4gPbfUzk94j9jgGJYNYGDXD+gA
         s49EjSvA2hjFtix99EoVjtSUO+0b+Ml04ZYXbGB5OyHNDDV6iSsDGQaL0PbNjUbrAaX7
         oyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735837874; x=1736442674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIXXZNzQYDd4wweCE2an7eg5wTBkktM6ZfWulNhI7p0=;
        b=E6WCQEkOMe3S2W0P6p8fumoasU6mKDMf4DfYwkPe/snFAV6I1tsx2Qyav46yrsQVZc
         Gx3hsnaBlKL6XeBNQR9892OEsIv73A3R247QkiDNLe1BL/NkZRDdm8gJJ4oCjRvztuJJ
         EMNOuubOUtAI7tiZUmgShz6iVVy3+HjdrsnsdlUifTeOkoUygsxjiFCWzCwkbLOx9OS4
         hk/25kzD6rfwiRJW7MJPZs8wi7IO8245p5BSuU+F8+xOG/7mmtqeuIDfgNHLsnFL+eoH
         Sbf7ovdbwYrQXS63t86z/1mBpKauElhFfkHIULhLAGB06SFV5JSBJmU1ThczLZ6/nFAC
         pQdg==
X-Gm-Message-State: AOJu0Yw5GalkXOq7htg9gbwXYtIlLlqCgXh1L7dXpU9qKTQ+nVT28Hty
	jDljnL7qTrzcOw2nNP1dp4aOuWXDIknmY6yuWEyfKOCHPoO+/HJ7IcmQc0TY3pAJ9AJuE6/6vRk
	h6RbwFK+yYy9OGQR2HAPIn6ocz5E=
X-Gm-Gg: ASbGnctG/N3HAblsAf2TYA5m48Ux+XoqicMyZgs2tDeoNuKTu1o/5XoOjdlo7Zd6x7Q
	uFvNPuqOPndXPDqeztPb6iuFTAsD/dRVg7Q6OMw==
X-Google-Smtp-Source: AGHT+IG/KVFDh8iqox/NEpahi5l+OmFVrhFvK7isVmwx1g6gkBI33DUNTxBDYHpJE156/dz6AOwcRf2iWD6xU/WzxmE=
X-Received: by 2002:a05:6871:89:b0:29d:ecd6:cee9 with SMTP id
 586e51a60fabf-2a7fcab93a4mr24505117fac.5.1735837872335; Thu, 02 Jan 2025
 09:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20250101233112.2219927-1-yi.zhao@windriver.com> <20250101233112.2219927-2-yi.zhao@windriver.com>
In-Reply-To: <20250101233112.2219927-2-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2025 09:10:46 -0800
Message-ID: <CAMKF1srKdkUZ3PDCTUB8GLHgjExHe+xhEDO5BmxDENErGoFMvw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] snort3: upgrade 3.3.4.0 -> 3.6.1.0
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 17:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114620

this fails with clang with libc++ runtime instead of libstdc++

| In file included from
/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/git/src/s=
ervice_inspectors/http2_inspect/http2_hpack_cookie_header_buffer.cc:24:
   | In file included from
/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/git/src/s=
ervice_inspectors/http2_inspect/http2_hpack_cookie_header_buffer.h:24:
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/string:820:42:
error: implicit instantiation of undefined template
'std::char_traits<unsigned char>'
   |   820 |   static_assert(is_same<_CharT, typename
traits_type::char_type>::value,
   |       |                                          ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/git/=
src/service_inspectors/http2_inspect/http2_hpack_cookie_header_buffer.h:48:=
14:
note: in instantiation of template class 'std::basic_string<unsigned
char>' requested here
   |    48 |     u8string buffer =3D (const uint8_t*)"";
   |       |              ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/__fwd/string.h:23:29:
note: template is declared here
   |    23 | struct _LIBCPP_TEMPLATE_VIS char_traits;
   |       |                             ^
   | In file included from
/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/git/src/s=
ervice_inspectors/http2_inspect/http2_hpack_cookie_header_buffer.cc:24:
   | In file included from
/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/git/src/s=
ervice_inspectors/http2_inspect/http2_hpack_cookie_header_buffer.h:24:
   | In file included from
/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/recipe-sy=
sroot/usr/include/c++/v1/string:647:
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/string_view:300:42:
error: implicit instantiation of undefined template
'std::char_traits<unsigned char>'
   |   300 |   static_assert(is_same<_CharT, typename
traits_type::char_type>::value,
   |       |                                          ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/__type_traits/is_convertible.h:22:99:
note: in instantiation of template class
'std::basic_string_view<unsigned char>' requested here
   |    22 | struct _LIBCPP_TEMPLATE_VIS is_convertible : public
integral_constant<bool, __is_convertible(_T1, _T2)> {};
   |       |
                                        ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/string:745:29:
note: in instantiation of template class 'std::is_convertible<const
std::basic_string<unsigned char> &, std::basic_string_view<unsigned
char>>' requested here
   |   745 |     : public _BoolConstant< is_convertible<const _Tp&,
basic_string_view<_CharT, _Traits> >::value &&
   |       |                             ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/string:1151:27:
note: in instantiation of template class
'std::__can_be_converted_to_string_view<unsigned char,
std::char_traits<unsigned char>, std::basic_string<unsigned char>>'
requested here
   |  1151 |
__enable_if_t<__can_be_converted_to_string_view<_CharT, _Traits,
_Tp>::value &&
   |       |                           ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/string:1154:93:
note: while substituting prior template arguments into non-type
template parameter [with _Tp =3D std::basic_string<unsigned char>]
   |  1154 |   _LIBCPP_METHOD_TEMPLATE_IMPLICIT_INSTANTIATION_VIS
_LIBCPP_CONSTEXPR_SINCE_CXX20 explicit basic_string(const _Tp& __t)
   |       |
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   |  1155 |       : __r_(__default_init_tag(), __default_init_tag()) {
   |       |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   |  1156 |     __self_view __sv =3D __t;
   |       |     ~~~~~~~~~~~~~~~~~~~~~~~
   |  1157 |     __init(__sv.data(), __sv.size());
   |       |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   |  1158 |   }
   |       |   ~
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/string:752:7:
note: while substituting deduced template arguments into function
template 'basic_string' [with _Tp =3D std::basic_string<unsigned char>,
$1 =3D (no value)]
   |   752 | class basic_string {
   |       |       ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/git/=
src/service_inspectors/http2_inspect/http2_hpack_cookie_header_buffer.h:31:=
7:
note: while declaring the implicit copy constructor for
'Http2CookieHeaderBuffer'
   |    31 | class Http2CookieHeaderBuffer final
   |       |       ^
   | /home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/snort3/3.6.1.0/reci=
pe-sysroot/usr/include/c++/v1/__fwd/string.h:23:29:
note: template is declared here
   |    23 | struct _LIBCPP_TEMPLATE_VIS char_traits;

On Wed, Jan 1, 2025 at 3:31=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> https://github.com/snort3/snort3/releases/tag/3.6.1.0
> https://github.com/snort3/snort3/releases/tag/3.6.0.0
> https://github.com/snort3/snort3/releases/tag/3.5.2.0
> https://github.com/snort3/snort3/releases/tag/3.5.1.0
> https://github.com/snort3/snort3/releases/tag/3.5.0.0
> https://github.com/snort3/snort3/releases/tag/3.3.7.0
> https://github.com/snort3/snort3/releases/tag/3.3.6.0
> https://github.com/snort3/snort3/releases/tag/3.3.5.0
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../snort/{snort3_3.3.4.0.bb =3D> snort3_3.6.1.0.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/snort/{snort3_3.3.4.0.bb =3D=
> snort3_3.6.1.0.bb} (95%)
>
> diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb=
 b/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
> similarity index 95%
> rename from meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
> rename to meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
> index 0f3d0e986f..622ab56ae9 100644
> --- a/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://github.com/snort3/snort3.git;protoco=
l=3Dhttps;branch=3Dmaster \
>             file://0001-cmake-Check-for-HP-libunwind.patch \
>             file://0001-cmake-Pass-noline-flag-to-flex.patch"
>
> -SRCREV =3D "5598e8dd87829cb1bbb478a7b6d4f6fb8b5dabfe"
> +SRCREV =3D "2f8c230d6605279b19dac8fe59e27f034ee81510"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114611): https://lists.openembedded.org/g/openembedde=
d-devel/message/114611
> Mute This Topic: https://lists.openembedded.org/mt/110381845/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

