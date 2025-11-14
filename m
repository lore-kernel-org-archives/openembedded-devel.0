Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6F8CE7A9D
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 09:37:18 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14512.1763113037912147420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 01:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ThqZwccr;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3e37ad3d95aso1103379fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763113037; x=1763717837; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RMbY3sLFgJ98wOZwEv7ID4rH0sTXuyD8WfIEDKe03c=;
        b=ThqZwccrgUKXawZEEJO/Fo4qGvaVuAPWwXJwQXR6I15/BpZbSrP4E8bmMAPYXm7fZS
         Ljdcqvb8+5hd/XDQKb2c5bINJyDTDWXz0JQjBnPhsQ53xctiXhnuwP83Sy8DV5mvALnq
         gf6izpPzxJYrO4CWVoHyEEc2ymUHP6Uri9HIHITIA1RMFnt2pr4VIHto1ewFt1JOZc2A
         UjZdGGzKHtCPj4bGI+BnnpJBv0IZ7LCnx80/Ssg7MsAEdVqGaBDnTMH3oPsyBU1wz8t4
         kr+UyLmfsPC4YLIZtrGyPa1YwmQZfHLN2e2JxmD65i23LsPsM1SCNW0j989d286Hjr9x
         x2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113037; x=1763717837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8RMbY3sLFgJ98wOZwEv7ID4rH0sTXuyD8WfIEDKe03c=;
        b=IqXeQfWOtqG7bUZOACwd0UPtuPwnB4l2GVMtOBC+snLW6t24GuhEAmLELzKUHY9lEI
         SsSCp8xfxUjV6bxNImVHn3u4+Zjyn/08Du764CbNDH/4wcEbqUx2WFnbAmh4vV4FJgbn
         3HcUu78hATMiCvj6uuE8/jOpSLmjZ4vfa5OVEhd3vgrDlc2CseKTnap4mauA1vb2JSCN
         02s89LHFR7aJ60JcxT5Xde1qQM7Wy8YwYEGZ+yuf0SgYPNpyl7KIw7eL7wlvArrRbnC9
         vUHqIHaaR1LCy/rNQaOc4kFef4ir5uG453Bezk0d83vKstkLFRyJTCizNPuS1hLBWr6t
         RmFA==
X-Gm-Message-State: AOJu0YxeyWvx7DU2nDk387WLPXfvu5ccPTdexwhWmyqdTh6MVGIcyQIc
	ADN6molV0CfInphrVWmRhqiCBFFIGQLNXuRlk2JhDDunTCDCS+X8lBc6Yi7szjfprxsEL41YNzI
	1JdY3jXxjxF9f+7aA0Z5vVsQLWhvwvE0=
X-Gm-Gg: ASbGncueQTTxk3D+VcMxCNAtKyDcgX9mpwcXTY2sb5cvBljcxrnD1rr/LFnFYR+/uc9
	0sd4+BODWuyA11Wxa8mCygXUAgw/QeTNRGMiPa0nMl0+uu5fUZizRXbDVlLjxsZJu1jA3iJ41LS
	SdHnOHEc1mLKk3r4wpUQ/hlQjUsXBydko0kWLqPlGiip6BD7rGmJb9J2/balvw+9qWqy+3l3QDx
	kbfhThsL1v8lFoLg39UIEMztbJketHcIOvNxTbCdit1C9PTyS5v9e0b95AekA==
X-Google-Smtp-Source: AGHT+IF94uYCHDbBOulYaKdKQQZ2QJViHBNubWcmViKiQzz3yig8foX3fLdx8qyqCIVBWXKzHaxDMGLZdwqel4JEvl4=
X-Received: by 2002:a05:6808:4702:b0:438:37eb:62c7 with SMTP id
 5614622812f47-4509746c2b9mr1388196b6e.21.1763113036943; Fri, 14 Nov 2025
 01:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
 <20251114035030.4042745-2-ankur.tyagi85@gmail.com> <CAMKF1som4dJ60f=0nv4Mb_ZDZPRmQ9WqJRER=XoSWeJTL1akEQ@mail.gmail.com>
In-Reply-To: <CAMKF1som4dJ60f=0nv4Mb_ZDZPRmQ9WqJRER=XoSWeJTL1akEQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 14 Nov 2025 22:37:05 +1300
X-Gm-Features: AWmQ_bkq1M8CtU1nU0r0bFA1apyqWT126c1QmDe70AHxse2qsNCapRXFNTSZ8-o
Message-ID: <CADySD0ECwShOMybqGxGOevUr-Tipr9fiDXAnZuZymXwN2GzPGw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/5] libtracefs: upgrade 1.8.1 -> 1.8.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 09:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121701

On Fri, Nov 14, 2025 at 5:30=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Thu, Nov 13, 2025 at 7:50=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> New version added trace_sql.bash for tracefs_sql() bash completions.
>>
>> Changelog:
>> https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=3Dlib=
tracefs-1.8.2
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../libtracefs/{libtracefs_1.8.1.bb =3D> libtracefs_1.8.2.bb}   | 4 +++=
-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>  rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.1.bb =3D> libt=
racefs_1.8.2.bb} (89%)
>>
>> diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb b/met=
a-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
>> similarity index 89%
>> rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
>> rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
>> index 6b9e8b9b38..bc7311a634 100644
>> --- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
>> +++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
>> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a7=
5371ba4d16749254a51215d13f97
>>  SECTION =3D "libs"
>>  DEPENDS =3D "libtraceevent bison-native flex-native"
>>
>> -SRCREV =3D "417c2e3aa21af670cc5c13db633dd35292f2d0fa"
>> +SRCREV =3D "03790961bf2e83b7b61fb6d326fb1076a4293adb"
>>  SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;=
branch=3D${BPN};protocol=3Dhttps \
>>             file://0001-makefile-Do-not-preserve-ownership-in-cp-command=
.patch \
>>             "
>> @@ -19,3 +19,5 @@ inherit pkgconfig
>>  do_install() {
>>      oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconf=
ig
>>  }
>> +
>> +FILES:${PN} +=3D "${datadir}/bash-completion"
>
>
> perhaps using inherit bash-completion is all you need.

indeed, thank you for the review.
sending v2 now.
>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121678): https://lists.openembedded.org/g/openembedd=
ed-devel/message/121678
>> Mute This Topic: https://lists.openembedded.org/mt/116287242/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

