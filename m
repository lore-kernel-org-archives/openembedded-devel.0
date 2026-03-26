Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B8B10A88F9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:57:50 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54022.1774547868727032315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qcL7ZhDX;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so20956831fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 10:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774547866; cv=none;
        d=google.com; s=arc-20240605;
        b=eq2tppjoYStNOaUczai6Qg1JcYhvBbKnrcbZwaQa/wAdbwpUHr/a2hnb8+TBRmBw0t
         XN9zy3aJSrG5we0yWsSezVlxmFC+F1QIhAl8UGrnQxgBzA+VDcgORThEPz9kRLlmuV2+
         K5IE9rjzlaLkIxRcli+EGL57mQZ320XH9ilLyp9b4bUZXmrrvOC6ms/4rm8/Sf+bEwrd
         Z9zYSB/OnUpBaY/dqbxEVaFd+I9AJdfTDFQQTYRGLyYNtpet0/XJhUdBxmhAjCg4zHkk
         qA95thN6BGGV/POio4EMppVgt1QHTNgdC7aso7TbHLwnqJuO9/VkK5Q/HnyKA81phwd3
         TebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1eJr/UY2+PaLBUwHAh7Hrh42B77G08KlLXmtDyhw2c=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=P7xNE5USrNYV05FReuip6Q+bHZYmHErTLTEpJUu7jGeBZkx129IBOOtElRZsUKVS5A
         FXISBoxxgsb30EZ0ROtOaLSTasGuG6si6jUQo9bqiV505yxjzvmR0lOm/LmpiBiWcLLz
         BKtcKO9iKdca+PaIUbIqr8qGfwsMLz9yCYfVcmLcuQdpqESIUeSelolLrGmNPYCQfd0O
         mNPZBmw4BOllBPOXpBTO+oVuwak6KSMvTtFJwKI9W6WuxMcEoPedVi2npHJtgKiGxCSN
         ur4cXHMj8EhzAxxjEUVOug0ey3IthQDRpa5m2Y0HpqU2Qn2Sgfl73+5apx/Y05qYckvZ
         2B7w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774547866; x=1775152666; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1eJr/UY2+PaLBUwHAh7Hrh42B77G08KlLXmtDyhw2c=;
        b=qcL7ZhDXhf6W4bVDZCcVjw8Yi7OAqJF1Z9Kh6joRJTlNn1y7zctpc6hS+0WWH8gQ6F
         OKfDYmJ302fBlwzLRq3H36ZMUF8CLE0gaOzASf2gOuIXnzL3B2gX9fDHamaOAoPloE/j
         whZOZm3+HwOiRUIlmaup61cav6Ufjpjr0fNw2sIXke3FZRYT46NaG0uCfuswyToA9LCA
         O/E3P4FNHWQrAQiZoa80waFnq8EN18+7TEqqIOy5Y263MbnhIvvAAxKP6m6OogsBhoJS
         HUD9O2ip3XjHXwyDPk8Zo6vkqbvnmEHd0DuwSBhPPAQmbHuf0HuRjXkBBMZ+BUTORVD5
         uWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547866; x=1775152666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1eJr/UY2+PaLBUwHAh7Hrh42B77G08KlLXmtDyhw2c=;
        b=oScDxoxLBYJIig4XEAYog3WJHU2QUSo4ubcKmMHjyBjItIPlLgcp/23Gan3mIL85Tv
         /EEHz1bovDRsFtTQvqBpFlyJjEXpNLeViG726aHBVRj7yZSwGgLebk4648Xg4Wzsp4LL
         bZiCtwOefAaUZJ3zchyAFVi4dO6hsOQ+LVmqJ1sG2oN9tpzF2WE34K+yT66HBOH10EHN
         uN+RbsGq8uks0RFWRZQDGKoa/an/nYYNfF/cjpReTUtDLPsGG9QTZUJ9AUlgzSGs2dSm
         6SEj6oJTnQeHS9pAibzpZONYaRf2rkGdu52Famcr0bf466N5xWvucGx51Xh1jKmDsAoH
         md6g==
X-Gm-Message-State: AOJu0YwVEyschFk+jZdhk2G8TRCyDS+V9jhznAOo08Bvf88QBycMx0IE
	B23uAd4VBzVU9mH4D9VyILq8Kn111pfEqcCSGyetoxS/1Ms9Txfc87IxseXy8auwUeCxmqDu7tn
	CUTJ39/J1CvnJut6zpr646aj3yEQkJSo=
X-Gm-Gg: ATEYQzzLr27+A4DKPmqp0Uet2N/Daa5U9rlcl7z8xxRD6yTUDQ5c8rc1D3bakhWjkCT
	A99YdlsuPPzDOW6E+PE5PQZrWzOKgeFZWnhwTbMIKbhk8mrTuHo9KZM/ha4kwG/aXRnRnxpaQjo
	tS3lOcWxbv+zSDdDd3xZBc9Rc21d4EJCwrsX2DWDklh30KzJrNGG1nTiY2pOVXgzfXXrwqX1sap
	CBdE2hg5yAPg+HZlglTWL5Xu156563RUymO7pMXnxozHjkDs+0rH7LL7Mik/uIr4kGwyv2q0cAb
	Z68ncWhuww==
X-Received: by 2002:a05:6512:1394:b0:5a1:17a6:7268 with SMTP id
 2adb3069b0e04-5a2a5061ac4mr965782e87.11.1774547866109; Thu, 26 Mar 2026
 10:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260326174714.3811074-1-martin.jansa@gmail.com> <CAMKF1sqoLKKC0QBJbY1+ZVodCx2sh+Z4cDWy97ykrugzZN-a3w@mail.gmail.com>
In-Reply-To: <CAMKF1sqoLKKC0QBJbY1+ZVodCx2sh+Z4cDWy97ykrugzZN-a3w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Mar 2026 18:57:32 +0100
X-Gm-Features: AQROBzDsPTEKUC2QTvfMHAp9UemvyMNdK3uy2wVXVmDjukIaUWf-d8gaG4Luss4
Message-ID: <CA+chaQd_czRQTf_S11BzCdcZMx3ywpsb1GUKwGO2tevYjEnnfg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freerdp: remove 0001-Fix-const-qualifier-error.patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125768

I'm sorry, I've missed [scarthgap] in subject, the issue is I think
only in scarthgap after
https://git.openembedded.org/meta-openembedded/commit/?h=3Dscarthgap&id=3De=
7dcdee56806f08175ed9516c6febdae36a465a1
merged yesterday, haven't tried 2.11.8 in master (which looks
different than what was merged in scarthgap unfortunately)

On Thu, Mar 26, 2026 at 6:54=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Ankur sent a patch earlier, does that fix it ?
> https://lore.kernel.org/openembedded-devel/20260324192553.2628357-2-ankur=
.tyagi85@gmail.com/T/#u
>
> On Thu, Mar 26, 2026 at 10:47=E2=80=AFAM Martin Jansa via lists.openembed=
ded.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> Instead of fixing the build with clang this is now breaking it after 2.1=
1.8 commit:
>> https://github.com/FreeRDP/FreeRDP/commit/67818bddb31900cdf3acb26cb0b673=
cc90b71cc9
>>
>> freerdp/2.11.8/git/client/Wayland/wlfreerdp.c:637:19: error: incompatibl=
e function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(const=
 void *)') from 'void *(void *)' [-Wincompatible-function-pointer-types]
>>   637 |         obj->fnObjectNew =3D uwac_event_clone;
>>       |                          ^ ~~~~~~~~~~~~~~~~
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>  .../0001-Fix-const-qualifier-error.patch      | 57 -------------------
>>  .../recipes-support/freerdp/freerdp_2.11.8.bb |  1 -
>>  2 files changed, 58 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-con=
st-qualifier-error.patch
>>
>> diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qual=
ifier-error.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-=
qualifier-error.patch
>> deleted file mode 100644
>> index 87a456d16d..0000000000
>> --- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-e=
rror.patch
>> +++ /dev/null
>> @@ -1,57 +0,0 @@
>> -From 761b4df04a141cc8c9507c741e4046c6c6b00491 Mon Sep 17 00:00:00 2001
>> -From: Wang Mingyu <wangmy@fujitsu.com>
>> -Date: Mon, 11 Sep 2023 09:00:39 +0000
>> -Subject: [PATCH] Fix const qualifier error
>> -
>> -Fixes clang error
>> -error: incompatible function pointer types assigning to 'OBJECT_NEW_FN'=
 (aka 'void *(*)(void *)') from 'void *(const void *)' [-Wincompatible-func=
tion-pointer-types]
>> -|         obj->fnObjectNew =3D uwac_event_clone;
>> -|                          ^ ~~~~~~~~~~~~~~~~
>> -
>> -https://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0baa65430ec=
eddebd9dee8
>> -Upstream-Status: Backport
>> -
>> -Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ----
>> - libfreerdp/codec/rfx.c            | 4 ++--
>> - winpr/include/winpr/collections.h | 2 +-
>> - 2 files changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
>> -index ccbc5af..eec7365 100644
>> ---- a/libfreerdp/codec/rfx.c
>> -+++ b/libfreerdp/codec/rfx.c
>> -@@ -153,7 +153,7 @@ static void rfx_tile_init(void* obj)
>> -       }
>> - }
>> -
>> --static void* rfx_decoder_tile_new(void* val)
>> -+static void* rfx_decoder_tile_new(const void* val)
>> - {
>> -       RFX_TILE* tile =3D NULL;
>> -       WINPR_UNUSED(val);
>> -@@ -184,7 +184,7 @@ static void rfx_decoder_tile_free(void* obj)
>> -       }
>> - }
>> -
>> --static void* rfx_encoder_tile_new(void* val)
>> -+static void* rfx_encoder_tile_new(const void* val)
>> - {
>> -       WINPR_UNUSED(val);
>> -       return calloc(1, sizeof(RFX_TILE));
>> -diff --git a/winpr/include/winpr/collections.h b/winpr/include/winpr/co=
llections.h
>> -index 807f011..b8c8d9d 100644
>> ---- a/winpr/include/winpr/collections.h
>> -+++ b/winpr/include/winpr/collections.h
>> -@@ -36,7 +36,7 @@ extern "C"
>> - {
>> - #endif
>> -
>> --      typedef void* (*OBJECT_NEW_FN)(void* val);
>> -+      typedef void* (*OBJECT_NEW_FN)(const void* val);
>> -       typedef void (*OBJECT_INIT_FN)(void* obj);
>> -       typedef void (*OBJECT_UNINIT_FN)(void* obj);
>> -       typedef void (*OBJECT_FREE_FN)(void* obj);
>> ---
>> -2.34.1
>> -
>> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb b/meta-oe=
/recipes-support/freerdp/freerdp_2.11.8.bb
>> index 9c3d532438..c596aaa328 100644
>> --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
>> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
>> @@ -16,7 +16,6 @@ PKGV =3D "${GITPKGVTAG}"
>>  SRCREV =3D "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
>>  SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;p=
rotocol=3Dhttps \
>>             file://winpr-makecert-Build-with-install-RPATH.patch \
>> -           file://0001-Fix-const-qualifier-error.patch \
>>             file://0002-Do-not-install-tools-a-CMake-targets.patch \
>>             file://CVE-2024-32661.patch \
>>             "
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#125765): https://lists.openembedded.org/g/openembedd=
ed-devel/message/125765
>> Mute This Topic: https://lists.openembedded.org/mt/118522890/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

