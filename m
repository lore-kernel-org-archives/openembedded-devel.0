Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774CDCEBF9A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:24:46 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2468.1763432682933400051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L5BtRhFJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6574ace76dbso856495eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763432682; x=1764037482; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKMlmuGT2xeO2dgjtnaVtKH41nBkZ14Q/KduhGJ49y4=;
        b=L5BtRhFJQVz0tW7eGoNjsuWn71JX2R1kdm0sKpZLb18Kfed+ObFZuGiHjEU6o5DHEX
         NNDfdnqzPIRUlabk13opgibMeUD7Gb663QM/CO/3pxrRZep9myOL+ZzDsoZ1P81pWRyV
         6ZIraUZ3VX9Qixnjqv8M43fDtSd+hQ4wo9pbmwS5gjxcAnOhddXibaOREDbdIucJKY2D
         tAjK/3N7NunaugRjffzLydy3e047/FyiCUJiackFXbzb9k5XNTkTdmDY9Z6w7CFd7LrD
         8HuQUeG2+20z2Di1kPGhxeMmXWnPk546P0YOqGvwe3dqOSPDV5h4LnC7Ntyt4VcqA12U
         YxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763432682; x=1764037482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKMlmuGT2xeO2dgjtnaVtKH41nBkZ14Q/KduhGJ49y4=;
        b=u8tSS+D7pi4CYt8ebJYhkcjyq13I9DOIv1FBZkZ0bxxeJPxBlKX+hUl7H3MMTSguSR
         +RVrlna8zA+G9HP6NlfxW0K8kV8fQIT6hhyzJAHOba3qIbB1AMiPspyG1UL0yrUsdwkU
         yRwcKutNcnWLii1H/ZUsGsnqkGzXkM2NXxcF+iR8+AJT1cXwIRjkwc2c3gBTWY6XN5y3
         89wC+hqeChuJ0t9BjmhCE4Dldl1UEkDDs8IwI2jMuoyBMNGAa0Xusm8H/AUIZeFd/x6+
         3iak2ex4bnqV+Bx6xIZ3ba1W1SFQLlqbFRVS5QHRJuY76o5FdxvqppgFt79krrR7j2zR
         MjrQ==
X-Gm-Message-State: AOJu0YyW24Son5N1O4MT/3ffmPXW/AyyMrrqL4iAKVfT9AJ1QbbXXww2
	JVsIuWdp2pEELDOcJFuEEIC2tIP2Gp7WqzRQQ5Qi7HA1xPkJ5C7WoNS9+QVszQnLdoMBdNqBO9d
	xeBDhRFgfuxZxSdSHIzk8hsVr8c7jyD59+g==
X-Gm-Gg: ASbGncsUqqNIn9lepekVg61v5eOX34krsjTDvDM2vOLQ6gXf6vrmEPok2NWq1+MS6Yg
	kti5B2/0vCjltQG4cF48QZvXPIs3BOXyf1YqRq0V2+Ex4/iPCTgZhXaGLTkEf/DqUVVBe/JOzoo
	UMi+njQ9FovNiYJeBI71X0JiAj9noCW8Uh67Fie89J7dyrBQs+uYsaT1i8YfG3D8aab+sYPoyMp
	4gfVUFyYHuTZ2sZnxZlaIbTc9/W9MqUHP8v0kCOfgr4HsgjgWrMLU96jHs9poffZoFj+3qzc4Cu
	CBH+r7k=
X-Google-Smtp-Source: AGHT+IENDHjtpdvylvdy5sLeR7P9iRw8h8WlmiAmAvzmMgblBe9yl2/9Wt5ciFQuGKGjNKnnBcQUgwBYN6ZxpHN8n3Y=
X-Received: by 2002:a05:6871:723:b0:3e8:8e56:671b with SMTP id
 586e51a60fabf-3e88e56b13cmr4356299fac.55.1763432682017; Mon, 17 Nov 2025
 18:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
 <20251118002723.829508-2-ankur.tyagi85@gmail.com> <CA+s=J=xiUQufA6Yzzb3hP6nD5CVwGNHWJN1BGY=X8UnCHXQNCQ@mail.gmail.com>
In-Reply-To: <CA+s=J=xiUQufA6Yzzb3hP6nD5CVwGNHWJN1BGY=X8UnCHXQNCQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 18 Nov 2025 15:24:30 +1300
X-Gm-Features: AWmQ_bky8WPJVU5wOj3xUepfy5DurfcQZREEqIl6g2_EhvzCznHYy4oGjDwOt34
Message-ID: <CADySD0ERyR_HgiZ3JcFf=pHAkMfcfTLRbx-WtiTdo123SZXObw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/6] smarty: upgrade 5.4.5 -> 5.6.0
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121800

On Tue, Nov 18, 2025 at 3:15=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
>
>
> On Tue, Nov 18, 2025 at 8:27=E2=80=AFAM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Also update CVE_PRODUCT.
>>
>> Changelog:
>> https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md
>> ---
>>  .../smarty/{smarty_5.4.5.bb =3D> smarty_5.6.0.bb}               | 4 ++-=
-
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb =3D> smarty_5.6.=
0.bb} (82%)
>>
>> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/re=
cipes-support/smarty/smarty_5.6.0.bb
>> similarity index 82%
>> rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
>> rename to meta-oe/recipes-support/smarty/smarty_5.6.0.bb
>> index 047f10589d..88afc55c15 100644
>> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
>> +++ b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
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
>> @@ -34,4 +34,4 @@ FILES:${PN} +=3D "${datadir}/php/smarty3/"
>>
>>  RDEPENDS:${PN} =3D "php"
>>
>> -CVE_STATUS[CVE-2020-10375] =3D "cpe-incorrect: The recipe used in the m=
eta-openembedded is a different smarty package compared to the one which ha=
s the CVE issue."
>> +CVE_PRODUCT =3D "smarty:smarty"
>>
>
> I think this change should be split into a separate patch so it can be ba=
ckported.

thanks Anuj, good suggestion.

