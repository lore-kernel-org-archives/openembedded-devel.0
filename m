Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52E4CEE350
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 19:21:20 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5213.1763493674039113199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 11:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hudr7n99;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4505b05e7b5so1352675b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763493673; x=1764098473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3z8mv6WQZGhAWzOeWtAmV3chuM/9dHc77MJuJmJj32w=;
        b=Hudr7n99TWgadQW0ON23yA1dw4UlK6SfdnJAHqOIWF34fQyEtgYSjjYUk264hR218j
         vwcrSbd6MfBXJd5cFfbaDm3muhFTdjAazgZjOTciZZiEY3cW3m4RgBbjUrMA1wEh2vQE
         Z+YHT56uWqo3R45GH9vbPcRiANfhPmW4Tw5Rf3CqVQFjVpl9kZZEsm1Qn8brwbdg7EwZ
         /UM8CH1HB5gBmD5dCpebA6PYC4fvZSHqItMjecUh8WPLizF7SNzKtAmz2rxste3JnvH6
         6RGnf3Ztj8OIGyPD2VDfZZ0EkUjeFirM9K+XBr3t+ZZq9EQdpbcH8Jyi3/xa+Fc2wLXs
         70Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493673; x=1764098473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3z8mv6WQZGhAWzOeWtAmV3chuM/9dHc77MJuJmJj32w=;
        b=f3IujYGN/RmyF4vpcgllqCwxpGnbyPWy//7N1DaHd/WGA/9d0lsAvnyJzi4FeMYjqX
         QfW+j6blUYjGDYTh9Ljt1fdku6Y/lZ1UnKFw7fXJGhuSdhcS4jqVJGQ4p99UMU3cP9w6
         nieTzXZVz7iPrKzmeVCqCUJxanBC2BvWyCw5PKMuAuInqrifLg0k4Et5unvFJS+NTpOg
         LNZAHME/Z5xUYRVYc0foaf5vNSNy+4HyydeeEcRWTxXSfZ/H2c3/3d2XH+SvfTfG08AH
         1NEuZvPDgT39gZpAuqiUypFSOP0USg64msO82J08/7SEY8WHJWuFmivDC4YSxcdv9t2K
         dWAw==
X-Gm-Message-State: AOJu0YzCBTBaUejxJlZSeyKdzacUBwY6ZGea8KNjLH0QcMbjQACx33SF
	YCRzy4CKaRDnOvk67SHI3kS1v7+EPPBEsP0qxcsMP9ZPOIn8Chnt3nqXZW9c4DYhZFAjzELQqW8
	pzN9zsK0YD7Wk1CeparHThR25/H93dvA=
X-Gm-Gg: ASbGncv2VxGJxgmSBfWdCBZ6lc14L2pW2fQ6xuieNmWvE3b7Rz3Tep98UdDCtr/BvtW
	hx8VR5dsWKZvlRLCbst26e+5sMLgqSlDIMCLUqFbXqrNNXyNS32C6Fw74v0atjFBx5EN0Ry3KG0
	IXL4/Kd5GgYoPh3Kcyaa0naRfyRRDoL3GM7HaWOdPBzy36iAp+avZh2xlubDKg0vDudvfU73kx+
	UZ7Q9lYVZb7g6iVvzubqMP8uDStZBTz8EjWLP7+O45Zr/nqdF69mkLbHfZbFJIEj+XYvCtfZQ==
X-Google-Smtp-Source: AGHT+IH916h3MP+z+lTN3YaK/2dXJ4oSLPBHMRCpqEIYWh9kVQGhceWSplwBYbnIRTItJQXJbDVk3xdffH7FN8eTNgc=
X-Received: by 2002:a05:6808:3096:b0:44f:e5c8:2902 with SMTP id
 5614622812f47-450973bf04bmr7613669b6e.9.1763493673046; Tue, 18 Nov 2025
 11:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20251118025448.952479-1-ankur.tyagi85@gmail.com>
 <20251118025448.952479-2-ankur.tyagi85@gmail.com> <CAMKF1sqEFDtRnmHU=97FUDxvHV_x1zSCGb_cvV9Xohs0cEkmzQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqEFDtRnmHU=97FUDxvHV_x1zSCGb_cvV9Xohs0cEkmzQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 19 Nov 2025 08:21:02 +1300
X-Gm-Features: AWmQ_bmJxwV4vF4QuBksWNGDkbMeHJrCuq6cuJaDXNIZ2fpgs-h8R7JL3hhj4Js
Message-ID: <CADySD0FVvJf0aEAQw0rPjsDoPX3T+tui5Gigx+UmeSOqqnzPXQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 2/2] smarty: upgrade 5.4.5 -> 5.4.6
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 19:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121871

On Wed, Nov 19, 2025 at 5:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> some builds are failing
>
> https://errors.yoctoproject.org/Errors/Details/888473/
>

thanks Khem, sent v3 to fix them

> On Mon, Nov 17, 2025 at 6:55=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Changelog:
>> https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>> changes in v2:
>> - CVE_PRODUCT change in a separate patch
>> ---
>>  .../recipes-support/smarty/{smarty_5.4.5.bb =3D> smarty_5.4.6.bb} | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb =3D> smarty_5.4.=
6.bb} (95%)
>>
>> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/re=
cipes-support/smarty/smarty_5.4.6.bb
>> similarity index 95%
>> rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
>> rename to meta-oe/recipes-support/smarty/smarty_5.4.6.bb
>> index 7f99b9b5d7..88afc55c15 100644
>> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
>> +++ b/meta-oe/recipes-support/smarty/smarty_5.4.6.bb
>> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c0f216b212=
0ffc367e20f2b56df51b3"
>>
>>  SRC_URI =3D "git://github.com/smarty-php/smarty.git;protocol=3Dhttps;br=
anch=3Dmaster;tag=3Dv${PV}"
>>
>> -SRCREV =3D "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
>> +SRCREV =3D "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
>>
>>
>>  INHIBIT_DEFAULT_DEPS =3D "1"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121803): https://lists.openembedded.org/g/openembedd=
ed-devel/message/121803
>> Mute This Topic: https://lists.openembedded.org/mt/116350977/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

