Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE60C624DA
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 11:27:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11790.1771759624770161544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Feb 2026 03:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2jNd5JvP;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4359a302794so2553135f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 03:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771759623; x=1772364423; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BVxxfjKSD6N22rlUmr2jHP5nTNhUUx3hyEMIohFl/M=;
        b=2jNd5JvPMrPvf//ziRU2zhpjQC4hAb2Qlzcd0p5/byNerAlEoaqMLHmYbmRYplW2F0
         3JnQmFtPrhdJfVa1Z6hUTVh+xHdJ6FSkDqIDzr+HZPGJS1dwQXFJamUZ/YPwAI/Up0hF
         PzhH8E27UEDYwpsr9V3RwPOMdgPrh8EI+QdxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771759623; x=1772364423;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BVxxfjKSD6N22rlUmr2jHP5nTNhUUx3hyEMIohFl/M=;
        b=pSBia2aZC1tLpc3/HRAp7DfgjQmlVvDwm2hpvArQGsGOIwK4D03jYkoY33X8PrqYws
         AkMe9zmx8Lsudao/TfjLCmaDn762IKYwboIR9bSS7ciXsS81+FAj/oYxe0JaIP4i20sR
         1h0qy4C1JcT6GFyDLUgv6ZUu3EDBmzer5L+IBR2FQRO+18QjpBtSPlo3mp00+bpcBtT2
         D9ZHGev/a7P+4e9C1B9TwlL9tR8H1APsnsTvbJHa6OgKqaMCr0e/thmK9irH6s38DVi4
         ocWLN7db+C9b3sYMY8YKhShfnra0RyOQMXEVo3KwaB65fpg1Vjp2dT9mLDIYMP5Hc9qF
         4aMA==
X-Forwarded-Encrypted: i=1; AJvYcCWtPaAt3fpe3NmA1RIbayQYQHv8Z8yBjO/jK4T9MwRl9vODpI1ofJoz5vdRmSw46+47FJHCHlnF2fQs8gFVthlJIyA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHvBJKvO7YnaX9ciG5p/XDoTGaz6lzb8yy8F9NO4qKcXYJgqYu
	+T16p7B80hXQv2c+LVIBK8qTwc83h0DArAYK6rbI6m4x6mbUtycMyg/G8OMLFUombII=
X-Gm-Gg: AZuq6aJ2Tf7ryTIVU1XWQU984o/sJYtluQJ49+8OK7WgWr30I431YYcmP4X6UXFtBxx
	3TKm4QZic92SKtOmu8i+4Afla0OWxk+rxeTTAv0pKvAa/oYPAoe9i+G+fhuNUXNv0I4fcplu7O6
	YGcHiLto8UDigRh1QhIkf8WTuT5js4z4QboCoHaDWoyba7qzGrOqBisLrenRoEBwl2iUAvaWvfY
	JBmeNqTQeg7ZzihqQM3meh2OQNflsT09fJW9h+rIvbQD238YAagFATr2divUH/qcVKve7bA6wSX
	xzRseANI8QX3zcPqeedd2sxasrL7wyppLzpn1DywFZryJVk/FEPYa+o6XiJYTz5qOtM1s8f5RTw
	4ZsSxIMd8Z7j+gKy5zKBeOpYeu/4gB9DoB2q02UChB+ovRuLCvtSCt2TSWFSQCwS0yp/pSQieE1
	MCHp5IoHM/SUqvQpd18vNSjqXbK6s7510St+S9FcCQ3S5JF8w1laabV7ECpPGOwApO3aCjgnT39
	h8uJ1NefEeZrpQ=
X-Received: by 2002:a05:6000:4026:b0:437:681e:cbc3 with SMTP id ffacd0b85a97d-4396f15e475mr9356593f8f.13.1771759623007;
        Sun, 22 Feb 2026 03:27:03 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9fb2sm12226309f8f.1.2026.02.22.03.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 03:27:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 12:27:02 +0100
Message-Id: <DGLGDA7LUHFX.1NWYI6IKVASBF@smile.fr>
Cc: <anuj.mittal@oss.qualcomm.com>,
 <openembedded-devel@lists.openembedded.org>
To: "Ankur Tyagi" <ankur.tyagi85@gmail.com>, "Gyorgy Sarvari"
 <skandigraun@gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update
 SRC_URI
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com>
 <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
 <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr>
 <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
 <cfd43b84-61a3-41ba-8931-42d2ca77c44d@gmail.com>
 <CADySD0HMEs5e9aQq7fKwtjhSFrc4orJ0r46vWAaDt6Hpk+8kmw@mail.gmail.com>
 <8f30d396-53c0-4aa0-af90-914b9e7eb1aa@gmail.com>
 <CADySD0Hq2n---EM4HgghtAjZRmzbJCFeb5FGD2regv21zAE5FA@mail.gmail.com>
In-Reply-To: <CADySD0Hq2n---EM4HgghtAjZRmzbJCFeb5FGD2regv21zAE5FA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 11:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124531

On Sun Feb 22, 2026 at 11:10 AM CET, Ankur Tyagi wrote:
> On Sat, Feb 21, 2026 at 8:48=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
>>
>>
>>
>> On 2/21/26 02:38, Ankur Tyagi wrote:
>> > On Fri, Feb 20, 2026 at 7:45=E2=80=AFPM Gyorgy Sarvari <skandigraun@gm=
ail.com> wrote:
>> >>
>> >> On 2/20/26 04:34, Ankur Tyagi via lists.openembedded.org wrote:
>> >>> On Thu, Feb 19, 2026 at 9:19=E2=80=AFPM Yoann Congal <yoann.congal@s=
mile.fr> wrote:
>> >>>> On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembed=
ded.org wrote:
>> >>>>> On Wed, Feb 11, 2026 at 8:01=E2=80=AFPM Ankur Tyagi via lists.open=
embedded.org
>> >>>>> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>> >>>>>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> >>>>>>
>> >>>>>> The previous one became inaccessible.
>> >>>>>>
>> >>>>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> >>>>>> ---
>> >>>>>>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 =
++-
>> >>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >>>>>>
>> >>>>>> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2=
.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>> >>>>>> index f172168335..a90a33ada4 100644
>> >>>>>> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>> >>>>>> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>> >>>>>> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
>> >>>>>>  HOMEPAGE =3D "http://tomoyo.sourceforge.jp/"
>> >>>>>>  SECTION =3D "System Environment/Kernel"
>> >>>>>>
>> >>>>>> -SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-2=
0210910.tar.gz"
>> >>>>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
>> >>>>> How do we know it's -20210910?
>> >>>> Also, please put add a downloadfilename containing "${PV}". If not,=
 it
>> >>>> will break the mirroring test at the next upgrade.
>> >>>>
>> >>>> Thanks!
>> >>> Thanks Anuj, Yoann.
>> >>>
>> >>> Let's drop this patch for now as existing SRC_URI seems to be workin=
g again.
>> >> Is it working though? When I visit it, it offers me to buy the domain=
,
>> >> and the direct SRC_URI[1] gives me http 403. Is it geo-dependent?
>> >>
>> > hmm, maybe it is.
>> >
>> >> That "-20210910" comes from the original filename. IMO the full BPN
>> >> should be tomoyo-tools-2.6.1 (this number refers to another software)=
,
>> >> and the version is 20210910, but didn't want to start messing with th=
e
>> >> versions with such an old recipe.
>> >>
>> >> [1]:
>> >> http://jaist.dl.sourceforge.jp/tomoyo/70710/tomoyo-tools-2.6.1-202109=
10.tar.gz
>> >>
>> > I tested with following SRC_URI which addresses all comments
>> >
>> > SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BPN}-${PV}.tar.gz"
>> > PV .=3D "-20210910"
>> >
>> > If ok then I will send v2.
>>
>> I'm a bit confused about this too... BP already contains PV, it's
>> definition is:
>>
>> BP =3D "${BPN}-${PV}"
>>
>> Does this patch really need change?
>>
>
> ah right, went in circles...
>
> So question for Anuj and Yoann to help understand the concern with the
> patch when existing SRC_URI already uses "{BP}-20210910.tar.gz"

Sorry I got confused seing version information getting removed from the
filename. ${BP} inside the filename should be fine since it contains ${PV}.

Regards,

>>
>> >
>> > cheers
>> > Ankur
>> >
>> >>> I will monitor the situation and send a new patch if needed.
>> >>>
>> >>> cheers
>> >>> Ankur
>> >>>
>> >>>>>>  SRC_URI[sha256sum] =3D "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869=
aeefd42fd311c4022b78010a"
>> >>>>>>
>> >>>>>> +PV .=3D "-20210910"
>> >>>>>>  S =3D "${UNPACKDIR}/${BPN}"
>> >>>>>>
>> >>>>>>  LICENSE =3D "GPL-2.0-only"
>> >>>>>>
>> >>>>>>
>> >>>>>>
>> >>>> --
>> >>>> Yoann Congal
>> >>>> Smile ECS
>> >>>>
>> >>>>
>> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>>> Links: You receive all messages sent to this group.
>> >>>> View/Reply Online (#124520): https://lists.openembedded.org/g/opene=
mbedded-devel/message/124520
>> >>>> Mute This Topic: https://lists.openembedded.org/mt/117754895/608444=
5
>> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [skandigraun@gmail.com]
>> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>>>
>>


--=20
Yoann Congal
Smile ECS


