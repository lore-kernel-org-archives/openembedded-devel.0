Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5C4CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 08:47:00 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6885.1790930817074749665
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 01:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gnVWr2KR;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d821901872so3174516eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 01:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930816; cv=none;
        d=google.com; s=arc-20260327;
        b=pGwOjhNitMrKqaNNKsqYz8Nnzbc976qNy9nsv7o0BLBIO1NSPJjklBEHLu/Uuh+3f7
         TMtwHrMCN3brxsj4HymREvtYwD5kS+3ijKuxhLbXYTjz77BNXYbxRyvpeG7O/qBHDQc+
         6S6TSNFOpn+Rfg2ZcSMRz5N/Iz1pk7mX8Nb8/fBN+W2GJxKcb4FImUGmO0XWDipLU78y
         Lu8ZTvoyzUgN3PeVJktsyll1YOLWmSsg0EFbApVhaFIIT2v0mhtCKeeej6HwI2Jzw3Uq
         IoAI6DWROyNoAY1G6hISf+H5m8IFmwF+x1L1/C6z2V2NsGAKVjNO9x5khTb5GLJYOpNF
         62Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ll0gUj5EASqv269T9Pzr/+cBX0UZVbZuhJ7RHqJ0aVE=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=HqhpOqrAxtdXKzncTtphOHLed2SMzOxMScmv9OVRHMGkqr7QZPbva/FGbTyoQsv+Pg
         6LSZAKOt5l1INtYNP3IF4BVBFLxXmzVAbOrOiI43/YWU/ZXMuhvYGxBQ6m3Y3wm1/PBJ
         dMdlpsLSD5bumJ6bXxHctxYPvIVVjj0+6KwSFHk7/odafvV4JE24iRiYuNf2f0USDc9R
         X0dp9mXW83WlPyDfc/VCRF8kJpky6CAi6TBxvnVgtORO0XLJO7UK4pV5NclSmodLylfV
         fHnC7xBNDZWcHDV/tK74O6hXKmcmJZ8cGwIrKyrCy0K2PhoK/sw+XRBH/wIF2fFj20QQ
         UERg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930816; x=1791535616; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ll0gUj5EASqv269T9Pzr/+cBX0UZVbZuhJ7RHqJ0aVE=;
        b=gnVWr2KRzC6w558b/Cf7lt/DzqmoUgFJBNhdnLDIKPxg+zRz25uupjmU/Hq4veP2Ph
         L7KRH5y4Ocv6o+eEDz0we07O4y5KS6LA+RxRrbd92kDrnj5LbGrwnbYnpflYUexRMHin
         Pcru3gAtHHzStTtC8D89nbObl5RQbTfw0GFpCIIHZsLuXUlfCVFsIAxFE/CWHWOCHJTo
         gYlt0AFeJlabT7dFjU3kwD4liVGqkMC3+NAADH8JIVxBfzLtZ+XpSc53CYJs7cUo5RVC
         LjfrdjBISAdu0HWvTwp+nnP78wpFOaL09ugLbehAItbnSWH0zJEi/kWhxo4pjEvIoMaW
         OUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930816; x=1791535616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ll0gUj5EASqv269T9Pzr/+cBX0UZVbZuhJ7RHqJ0aVE=;
        b=Y/Wn8//47uNpdSM53vX0KfucMzUA70n0v0WK3i5zE1RfwDhdLwYCxGamLwo2AFR5Od
         gM287QgF2oLPKIrTUxet4n3Ez4fVnSf/+CJAOhT7Qz9h4KiaV0z9/78wi6KOwYcmVidF
         6WZY8Yy6Kj2gwEc6AsGsk37Wf+cTbMWm55gX0BvHHA7eKbnviYQ/Mc6OBN3f3lOdZQG4
         2+IOLnASRiB56HL8KZoZRbsHPN/tc3ye8B0mh7h4sU2TtvcjUWomaReB/46QBzI7DFKr
         Jmarw32F0SYrt8M2PlvShz27fC8bZ7+Bxc+VM/VYhoLqOkDzv8P9qKF2vBqJ981yzKbo
         RYhQ==
X-Gm-Message-State: AFuF++nQD3ZSeKaUL7FxV1WFS/7T6Qy/3XbM/vjuol1JAyYh/sqsCfU/
	Q5NUBR4Z4247LR7GXjZQwJYhViHIV2fF60Uq8Noksl1+TiIllrZWy4C8I+I5ahIEggqEn/EcU2C
	+s6nZOKEhKIUPI6fM600rl90896JVhCc=
X-Gm-Gg: AYBFou1JLrY+jBWx/VQzbaW8Ux88kS396D0NAWaJ9UGVTKHXFIfpAt3pcDzcbRpshAT
	hPPAROODZzpiIOlNPMF3rNawO0jZbY1xdn7PGq6ycivASHC6vOg/3B1xey/LWjjeZss5ZyhZ0SD
	LR1LAgJA/sAeaQ3otmlc1PZWWgweC5X1CE9EMnC0O96jnGjpDW5QSrguF2FYOjAlEOnKE6fqOdZ
	efXSR/uhtkNDIiDrI0tiX3jrgNNhRkA40UopjzP7G3z0Tlv4brFDOBFJQ1KfdqyottVc/qZaA3v
	gJViBEDeZzNeeSgMMY5douJMga+YbrfmvqUMB7uaUcbjZraWrL8vaOxcJTuuUlJMMcrYwQ==
X-Received: by 2002:a05:6820:150b:b0:6d9:5232:1774 with SMTP id
 006d021491bc7-6ddbb1b07cemr4128692eaf.28.1790930816196; Fri, 02 Oct 2026
 01:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
 <20260927105002.1832451-31-ankur.tyagi85@gmail.com> <CAMKF1sqU2Uu=-YJKr6My-KOd4kdbkths23TMuGqq3g4-XQtM6Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqU2Uu=-YJKr6My-KOd4kdbkths23TMuGqq3g4-XQtM6Q@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 2 Oct 2026 21:46:45 +1300
X-Gm-Features: AclHuK_Xwj0PVxs-B-0TFWstPFajBpDaKYjwZE9OxyCRqqS4ybRdG4RG8mLA0EE
Message-ID: <CADySD0E2DKJqByC+Le2=2icY7FcEUiKQFAyrFo+4eFktJRkayA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 31/35] librelp: upgrade 1.12.0 -> 1.13
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 08:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130602

On Fri, Oct 2, 2026 at 3:25=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is failing ptests  ( running meta-oe-image-ptest-librelp )
>
> AssertionError:
> Failed ptests:
> {'librelp': ['tls-ossl-connect-failure-vg.sh']}
>

I can see you already fixed it, thank you

> On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Changelog:
>> https://github.com/rsyslog/librelp/blob/v1.13/ChangeLog
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../rsyslog/{librelp_1.12.0.bb =3D> librelp_1.13.bb}            | 4 ++-=
-
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-extended/rsyslog/{librelp_1.12.0.bb =3D> librelp=
_1.13.bb} (97%)
>>
>> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb b/meta-o=
e/recipes-extended/rsyslog/librelp_1.13.bb
>> similarity index 97%
>> rename from meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
>> rename to meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
>> index 21ec9f25f7..479905f728 100644
>> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
>> @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1fb9c10ed9f=
d6826757615455ca893a9"
>>
>>  DEPENDS =3D "gmp libidn zlib"
>>
>> -SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;bran=
ch=3Dstable \
>> +SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;bran=
ch=3Dmain;tag=3Dv${PV} \
>>             file://run-ptest \
>>  "
>>
>> -SRCREV =3D "dab30db5108ef4bb5b6f9135e0428b57be7c4085"
>> +SRCREV =3D "bedc657e519568b25f611c8efc83eab6ac1068e9"
>>
>>  CVE_PRODUCT =3D "rsyslog:librelp"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#130365): https://lists.openembedded.org/g/openembedd=
ed-devel/message/130365
>> Mute This Topic: https://lists.openembedded.org/mt/121453686/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

