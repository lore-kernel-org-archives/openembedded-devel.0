Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAD6C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 18:20:58 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2787.1788200447920397710
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 11:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bgGYHIvH;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-867a943b149so13525787b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 11:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788200447; cv=none;
        d=google.com; s=arc-20260327;
        b=SBqSXaMlDeqpz5gSZa6IfBpVlNdhSb1IF6rw0wsDy9hCorVtBRPMMrCZPoIKs5bxcw
         9AqwMUQkROsvagVyXDwHo1B+7hsf33qm7/a/CbwvvUpy+1l9wea38H/ffg6HJWvyfmR5
         4mNRlAYZyr8iUX5Cz2Xwrmovfk4Rb7TwuMsCBH/WkyYNspvyhj8L5q7C6RnTK6sRaa6m
         21pJZJDAKzEGKDI3mz78QOEjp1qoQpydBr38hy1QZH3hhHFU8NtyOI1VX6XKJnTk/Y3P
         DDuW5wK9BcJLTdjULsFytPEDOIj6W2CkYEQvxdl4fw2TyDWjdeA2wvfYR9TLrU5VW1Bu
         r2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HL9BT29o6XHCx7uG1nxRLmmWcL93uwTQL3zsb50iUgk=;
        fh=XyteQOs12r/HTT1NfTJVcWKVKgrmlF3PZh/pATJLdJk=;
        b=IYoCPnh9vvqIjJDvTjNEBgjdOf/9zditHntCREMOSy2YfuGSqCs676/Hw/hYtNX/QP
         vcxpScOfEfW2W/tZlxK1OQafuHf7sOj7tBHPfkmQPuAOvTmJRN/uZLag4Xfsq/nm1C9w
         LNDr8ogoToauU7hUjo3Ibpmhq2zuMQubCJbcC/FM5RS/9iceZF0XyHZjL0/S98Y+QGtA
         TQOTiXVLDCb9tB8TKwxL3+oJiGTQTPb7wCYsIsd4YeoDrRxZ+CosX4KfeuEvQA5UADcJ
         oK87UCin0GrQnXvU12GwVghjw+zZCvEBHCtu/qzac7XXpRWSzR7qM1Yms3E53W63sY1P
         NRaw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200447; x=1788805247; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HL9BT29o6XHCx7uG1nxRLmmWcL93uwTQL3zsb50iUgk=;
        b=bgGYHIvH2rPr5D+l690lksza9kBrQa/WKD5xG8Y67qQq9Ots1oBOIRb+OTxbYAMfvd
         hl2Z+Ta4OPurkwAwJHfgWmWYHdmWjc+ZIk12R9E6GZXbR7qP6EeTwtgurueBdI5EsxGY
         IqYSwybfWj6vj0XucVy2uYTFEgslXuWRv2eG7fUEwED8Z2cNoeXT8UeMcWkceNMsKCXv
         xnWiCo2LdB6arpHFEcP/OEEliEo3t18FQe5RmnRZ/Bjuac41cNvBVnTTRSrj9gJAY0Xz
         725uyiZeX6OumdOq/68VI1hxsA0aNIDOE37/rcsIz/DMQ1q2g4eStKeTLtG/zQ2RALHI
         1VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200447; x=1788805247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL9BT29o6XHCx7uG1nxRLmmWcL93uwTQL3zsb50iUgk=;
        b=mMkw1KSVCxQb1lyOI6Bj5RlMMhJmqi0HwiIJfTeHT9fxi4gHtjo+8+FDkKPLBIgOKa
         8RBPU4EF7KC+SYoYzrjIiFpPM10+G78Okd/1PHZCGvBieek8EUjnIWVjx1VtwbNCf0Xh
         gTD5tYlkQEqgDm8fr5dhWcEVFFrA4FjA7hQkLKDwZveCGl8e+ikH4JQIouNp6SIUpmAc
         QKjkQuS5+8CuOXu/6n5gjNWAClMkBC1plkdefU0evKDyhZIr15pjfj9bLc7U1EUIrKoL
         Y36E0q/4/h+EklUxVhY0Dhet1gsRcTPQaqogpTshm5F8CDnfjipnmolwebVYl1rjst7d
         wLpQ==
X-Gm-Message-State: AFuF++mFl5Ywf+uAyfOr7J4afeUOnXSrf82x0X2f27waGNSJXjSVrvfS
	q+guvdtiDsBtjtbsFfVRx0VYuCnSlPJMME7PBMzL+ATWiNUQi3U0ZoQEh6nCPiL73kPlYkaow/M
	wWmMnUQ0NTmKQKUDivc2FECJHy48utaw8BRtO
X-Gm-Gg: AYBFou3Z8FQy+VhMYUTun4cOP6dRqWHLJRpZ7pryUIv8X9D/1UOm0/GqJaMs62hyIP0
	cfDP5NjqYxgi80uKAzgd80Nv2Dooz2qBwCvjQl+HFUZigFIUQqlKgrzMA5Awe8zMIYLkj8RAbPT
	WqmG8JRahvusj1pNe0lPdv25h4DaSei5nip/gNkmi/eQPgZrKHoLkGnNGlqkFgPFpf6X1oq7rxX
	lBPNDc6/g8Z7HQXFxNRAagf62SSXwS8t2cku0ovE6QONw8+hsyQ46Sr8ogQUmons8YlRg3Vn3ay
	y4dihNIYUjKsXprXSneAI7OTF9ssGplvSEh+e/r+r27SasZXjVcXHXmRXPbHt4Uxp6S05PcZhys
	P4XV94+IhbQ4VYelSJnX5jAnEuzmHqyau
X-Received: by 2002:a05:690c:4017:b0:85d:42c3:d00b with SMTP id
 00721157ae682-8686f52b910mr14399017b3.9.1788200441946; Mon, 31 Aug 2026
 11:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=yheHCLAo=jCHROfC6k99652Kg73tZBJie1woRcgA8ccFw@mail.gmail.com>
 <CABF_=yird-Xz_nEWtVbgeve0WC2FH_Bq8Nu39kx2-DveyaHZZA@mail.gmail.com> <CAMKF1spidgd5zZgf98evVWEHgPeMXTg99tc6F7pojOhnuZZVLw@mail.gmail.com>
In-Reply-To: <CAMKF1spidgd5zZgf98evVWEHgPeMXTg99tc6F7pojOhnuZZVLw@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 31 Aug 2026 20:20:17 +0200
X-Gm-Features: AcwNN1WrpoQmUID9BG81cu10XHSDKaCI-tnr21iAWF4wBz3aCBR1_6aNk6SQnew
Message-ID: <CABF_=yi3d7PaBu+ps1yHFx42PtPKMJRhziJJJ25HDmr1uA2YxQ@mail.gmail.com>
Subject: Re: [oe] When can a recipe scattered around be ready to promote to meta-openembedded?
To: raj.khem@gmail.com, Tom Geelen <t.f.g.geelen@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 18:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129614

Tom,

Would you mind if I bring your version of python3-construct of
meta-homeassistant to meta-python?
And update to the latest release?

br

On Sun, Aug 30, 2026 at 8:31=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Being in multiple layers is a good argument to bring it into common layer=
s along with that it should be a maintained package upstream. I would also =
suggest to add ptests when bringing in and update to latest version. Once m=
erged, notify the respective layers about the move as they might need to ad=
just for future releases. Ensure that it does not create additional layer d=
ependency for the target layer where it is being proposed for.
>
> On Sun, Aug 30, 2026 at 11:22=E2=80=AFAM Jan Vermaete via lists.openembed=
ded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Let me redo, without sending it too fast :-(
>>
>> For example the recipe python3-construct
>> (https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dp=
ython3-construct)
>> exist in 5 different layers.
>>
>> Although it didn't had a release in the near past
>> (https://pypi.org/project/construct/), those 5 layers kind of prove
>> it's a useful thing to have.
>>
>> So, when and how to promote this to meta-python?
>>
>> On Sun, Aug 30, 2026 at 8:19=E2=80=AFPM jan vermaete <jan.vermaete@gmail=
.com> wrote:
>> >
>> > For example the recipe python3-construct
>> > (https://layers.openembedded.org/layerindex/branch/master/recipes/?q=
=3Dpython3-construct)
>> > exist in 5 different layers
>> >
>> >
>> > openembedded-devel@lists.openembedded.org
>> >
>> > --
>> > Jan Vermaete
>> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el
>>
>>
>>
>> --
>> Jan Vermaete
>> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129599): https://lists.openembedded.org/g/openembedde=
d-devel/message/129599
> Mute This Topic: https://lists.openembedded.org/mt/121002496/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
an.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

