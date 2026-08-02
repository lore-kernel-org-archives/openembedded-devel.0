Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1E3C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 04:48:19 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18277.1785646095869186641
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 21:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EzR3Cunj;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4591f35aff3so269760fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785646095; cv=none;
        d=google.com; s=arc-20260327;
        b=H/04+ZUMzHacbdJqq+cXIs+A2lxZCpF37JOXcvbg14677QxMr2+s8BqiLjyaGCnw1l
         q47ktktVyJAl8GNf869wNUwN9R8WkOaRd6tDvDEub6C07pBF4XjcuIMC3xBCJAa4Ufmt
         NlyIQQkCc3ZHnakR0cADCwV2THbgkNGB4vofYFKRgIWki4LF3XjAMjk4jYFbtoMPl2oh
         5Th8W9+LCViix7qffaYk53/iFvXeAbJaAIMQwjTFht7XAo33DKTnsDW9CsT/lkikrNgS
         ocXchUQKfBKnr5d5mUIvSzZLqZBC84DVTFqvY0blwoRNhGgr8Xgj7sMYxt2C3yLlSbc7
         CoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcvByKAokOXJsmBdH/xZw5q42zwhtTYpS6F34IuN6fc=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=TZ2VmgXzoHlTQTENyw7NP/2EeVDQMVMNnn44VdvolGsq/UBVo2BhswD4WH3Dcuj4Pz
         1JpKZoXmquXkHJWgNn3enNNGiNgPqNocCTXiVGLesMJY8L+kSoj1Hyu9p//XqFrFPqp+
         VYtKFL7tHE00htRrUaj3Tynat6uYkw4TsW9nnYpSLfc1ZwKP0KhHjl1ld0GPQVpG1OzR
         2YC0Hq2yrYPJQQ2oVbahLGZ3O+hbpZtCrlCNMP/HaGa2WdVQD33eQeglU8VZFTEoGZgv
         BC51PAp5j+mn56+kMYhOdzYvRJBok5JPZA+u0rAmFr6yVEmj56o87+B0lCKPJU+TbFKr
         gYJg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785646095; x=1786250895; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcvByKAokOXJsmBdH/xZw5q42zwhtTYpS6F34IuN6fc=;
        b=EzR3CunjOip5i+WmVmC+vmNqBcwB3+p5BXglCdtY3wkzjZtuXfSXQ8p/pLoZgBhFAn
         tdPacdI/+suISKOXABWt3XQSGFdxcJiNrFUBFUViCdHTzu+JR7xGqBdVdxCtGATXZlY8
         3BWkIMYUy5ovVRV+R+93yVPW7ijjQarLJrCEeNwOjuJhF4OXXHgU8ZvuBplTd+T/C4qK
         axar08tRZVt3YjCXzDWe6YHAj3tVe3LoqPR8LgK0Yr0v9WCZVBF4zaRoxHXf5ZpOvec6
         BijFFGaxKIqFDh5ydZvz9VnikLN960py2u5nJu3vUDZioCZKkMd89G5aZcb4xmyVWiup
         ytMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785646095; x=1786250895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcvByKAokOXJsmBdH/xZw5q42zwhtTYpS6F34IuN6fc=;
        b=FQWJ9t5A8owb6n44VP8nAxnyQecxjZ+iN6dE+saRRzgV6uhByKamKxAyySX4s9i8SJ
         yiyYcxc79k6HO/RKUeFafD62yKrt3+5oP7yP3Bc/nSK0xffpJETOmBXpG+7TMUNVOXxW
         2onibu59ImaaGl3LAfWsCkJh+UOiQSdgxmWPJ3j/queO/ZogU1WwvCpRzb8MttIcN622
         6UwrxW7wTM78jR6PuWT4MX9niT2W4WwbuyImAwjc/FyBsYqq7UhmGlFsK5Du5xLPyZkL
         PbtR/c03T/g5M1nYI+n9MAACRw93EPSj/SYIr2mEAJ5lZhx533oreyIHBBLBTA/EN8gX
         jd0g==
X-Gm-Message-State: AOJu0YyClOFJzBodq8NqjtCjdv0uL5PJjZQ5Nvk5ygbAn8x/7XEZY36o
	pddvl6z0YM3sXKJUo9zCDAeS7piyyfs21FMeZSz/lMCKJcG6Q/kw4dY2vjNyvYgWCz1Yy7OyJfw
	u/OqtvL2NzvQnULlXMvoXTU1W/HqAcT0=
X-Gm-Gg: AR+sD12lLHtkZZG0avDbHKjb21EPbecvB1iGz4dkVWoPjScW+TkU21hZTGgbQG1ea13
	fKewCVXd8e5Hax+vepRSU9+UR3jhnZ1F4gI1rZ1hUaco/lrQokZRO9JfFMZF0bfQOp2ZCc/k6oe
	wmxZ2HrhUvKyIjuUYMucqr9c9b8U9rgZ9XpPsysZjrwt0Z7FbTmiQJkw0yHiynAUadLMQWHP42c
	meY9tEGPE8uU59lRpB0klsLNpjlv5uiWpQTPKKYYD3jMB716ptcQFtjlZRPcJrWmzqz7+fE6she
	l3q+k8Ta7svtTne2/kiIrM9bQN62VXBQlJ1MgR1xaZ03RcU=
X-Received: by 2002:a05:6870:8263:b0:456:baee:4819 with SMTP id
 586e51a60fabf-45905dce079mr8898886fac.11.1785646095019; Sat, 01 Aug 2026
 21:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com> <CAMKF1sqfU+AADR--Bria3NnKDCnKbV7Lux1ESx4ccGTx-60tPg@mail.gmail.com>
In-Reply-To: <CAMKF1sqfU+AADR--Bria3NnKDCnKbV7Lux1ESx4ccGTx-60tPg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 2 Aug 2026 16:48:04 +1200
X-Gm-Features: AUfX_mzYXUE0S2N-bqMKXyhjZjmqPsb5euMX14yYQtTazHVc8dt2C7lwsSfTf4o
Message-ID: <CADySD0Gw=nY-BYmgrgiwRy5VRq0Oykgg5O1-6u6kX61vEpzG2g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/20] imagemagick: upgrade 7.1.28 -> 7.1.29
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 04:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128650

sure, I'll do it soon.

On Sun, Aug 2, 2026 at 3:41=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> please rebase this series on top of master-next and resend please.
>
> On Sat, Aug 1, 2026 at 6:11=E2=80=AFAM Ankur Tyagi via lists.openembedded=
.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../{imagemagick_7.1.2-28.bb =3D> imagemagick_7.1.2-29.bb}        | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-28.bb =3D=
> imagemagick_7.1.2-29.bb} (99%)
>>
>> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb=
 b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
>> similarity index 99%
>> rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
>> rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
>> index 7fd34dc54c..0890edb8c5 100644
>> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
>> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
>> @@ -17,7 +17,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.=
git;branch=3Dmain;protocol=3Dhtt
>>             file://imagemagick-ptest.sh \
>>  "
>>
>> -SRCREV =3D "c2068fb3394af17fb9e3a78c712af2ca67141836"
>> +SRCREV =3D "360eda553586e389c9c725fc49df94f209a8a3c7"
>>
>>  inherit autotools pkgconfig update-alternatives ptest
>>  export ac_cv_sys_file_offset_bits =3D "64"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#128595): https://lists.openembedded.org/g/openembedd=
ed-devel/message/128595
>> Mute This Topic: https://lists.openembedded.org/mt/120549559/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

