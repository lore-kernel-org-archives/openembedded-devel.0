Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16036.1793816417593807075
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 10:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bTYQlGqr;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab4354db11so8866661fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 10:20:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793816415; cv=none;
        d=google.com; s=arc-20260327;
        b=ni1uQJ7ovIuNXgZVYDAH6fJFyRZkJvMOJn7Zk4xxWAymXP/Jg3z3UjZ2clzrAW7qmh
         XxcJHstYoGpq/Hxwn7UPxME4///+kNrUyEEhIxXtlpWPtTl7h1VE+fuM468tmvskIgXp
         rafjrg3UiQbmRaBitYTv/Z0GFPKxaIK37Th7U51sEGdtlAr5C+gD5GbnZNMqjLvvqpm1
         WixRfV0bOi8x7fBVCBzx3RPLolxFf7pbbYgtMP6wj8UwwS5w/RIS2Ie43FctZ9EUFDC5
         kDDO0VHaBUfEG0dx4Hbm/1kpun0rv3TrYtVulk4cWTTx+kB7KLp5h6t4dTYu0IanGLBH
         yNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEA0bxY0bzIuIp8JQPHaI55UItgLJzs2eOpZ194BvQU=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=d/d+DYrAkiQgeMEq8Q+/UrrjgPNI9t4cBklNxmSkTjIAg0YegEazkcsoipjH8Lsgdi
         cOGXAXKZMGe0yuKcmuCtxQfyQpGcjoqoqU/NKTTGTjg23ma5/ANQx+jN2yTmkJPwFva1
         3hhwXH8H5423EfgsCfX+pkSD6oY68M0t3HtDk5BEZcu4L/qQUQUqpvGJyq5sodhJmSaj
         6Yz2J4WeTnq9UYTr8cUVP7q/X5vYtLhVnsBv8l05I7OG2zNjP+HdXIA9LvoZmODQLmbN
         EX9U6c9KUwPAC5HCZJKrIpzZXD7ao1rg1gwNCI1kXaJbMP+nC4gv9r7rrkp0kvDr1sM+
         6jzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816415; x=1794421215; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oEA0bxY0bzIuIp8JQPHaI55UItgLJzs2eOpZ194BvQU=;
        b=bTYQlGqr9BXIkeAbW3QTvQJf6pbNAnHl8NOE7YES7uFxZ2qTFGp4t5tKGV3YfAh9pK
         YN6LPyrYDahhvd29H0eUetRrbQyYFZInFmzmnDgTFqkZsNwFjKT10D1JhNrELsrtFPSZ
         px1Yh85LO7f2v6xcFFPzAN+jDrlRodsazYpSTLbFecvPPUIGbjhxGTU0xAQ0Onz5qSJR
         t+Nic/TIsnFpEo5LjoKQMLk0stDV3f6F+6UxWcxLBV0vUy2spJp+aLkJLlkiL/GTv/Kn
         jEQbzHKeWbFoO7yC8RMJ/AaJLPtI1wjKZbsAs8AMZ8PJgYaZAPTrcs0P9n4alMPR/FPv
         0++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816415; x=1794421215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEA0bxY0bzIuIp8JQPHaI55UItgLJzs2eOpZ194BvQU=;
        b=V5Yib/Tzfds25QIwToUbTt7SoVHdIwp/HIFTYa0XZTEkFObn30/EcCg4Pq8LM1vn0m
         ImG4aRly28t/v4WoeBDiRoCgBBhTpk0NXK8hlrvF7bCUUUuvuDQsR3lvd+B45j7Kw/hE
         1BW26+fi+2uS9lI87N6XGfVlGGHSO1O3cfZ0ORFLo0XNT8TW56zDACaFoC5Z9u6PLL9U
         6Uka0pgHzEp+8VKh4755yixwRlak6M9Et6P6hkLMbt+HAX6aW3VzHEeaPpCKORfJoEoO
         GolJ1fEH37tZfLdR07/HhxwWbHZJa8/ynvNdYtz3k15jrHstMtT3ocFIeFFQYTT5bNha
         VWZg==
X-Gm-Message-State: APuU4Z/vnV+NtZcQMY6dvuaWgZugo8xD+Hk7dLtKSsx/vEJ3i58oYruo
	T/x8I0smfWtS8t941ig/21rH20PQ1+CsiD1J69tGRFnXNguqGDOn5vpBGBNooNFhnUxE4Ql7fI+
	OCvupDwxlJ4JzT/OQeavtoNOvWXhAxgE=
X-Gm-Gg: AYBFou1LdQwJ2qAGd+hDSg+gDXB5IMs4K3oz/Rck5kBFgsLfOBLLA/nBxfwjBWpyXEo
	PM3g8bdpqQ35fz0JRNFjSNlbs+xqsh3g+CvNKXOpazh8elskeITNE6a93Z9MyxUbXzWlgvpw9Dr
	5HwIsqlJfN6MTCilMkzR8VCe5nPd4vmOFvq2hAKDdGLIvBFsBl20OR/KNBeOyDwOKnDdLQIu89U
	jk495QZY5FLFAY8WG087liAkPyTntl2J4qHtnbiSqsdMZ0BvEEftCe9Yzyi9jCcvMkaYgjmswvf
	w2q5am1TLoNzSmUpw3SZicXJFMEg3CF/gWnlwdQb0nVqRZgrBDQ5dBt0IZcx/emMdJLBBHfbuLU
	Cqo8G2wxsImcgOBgTjPCHHzBpqovb/QEqs/ENAj/Od4hePNXXvXJTyNPeVoJ9eRxeGTVtQmGIgx
	pR+mjkD60FCZFwag0BrQ==
X-Received: by 2002:a05:6512:4607:b0:5bf:e246:d38e with SMTP id
 2adb3069b0e04-5bfe246d6bbmr3829386e87.36.1793816414963; Wed, 04 Nov 2026
 10:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20261104124017.889577-1-martin.jansa@gmail.com> <CAMKF1sosUPXfomcbRayHRppyGmEEUCW1T9z4vGbi0WDQ_jv62Q@mail.gmail.com>
In-Reply-To: <CAMKF1sosUPXfomcbRayHRppyGmEEUCW1T9z4vGbi0WDQ_jv62Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Nov 2026 19:20:01 +0100
X-Gm-Features: AclHuK9vulrfZ9kztStZotTlb40gqa9CrL-iSW-ODUHJ1CTl_xtMvcR79kCQ5AY
Message-ID: <CA+chaQfGH2EP=78y_5Zc2nA2YTgZS_eW7HkfsHH_pVSYoY_=sA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ctags: set CLEANBROKEN
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 18:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131846

Hi Khem,

looking at https://github.com/universal-ctags/ctags/compare/p6.2.20261011.0=
...p6.2.20261101.0
I'm pretty sure it is still needed, but will verify it with a build
test tomorrow as well and send rebased version on top of master-next.

The issue was introduced in p6.2.20260802.0 version with:
https://github.com/universal-ctags/ctags/commit/05a8061a581f626deada11da530=
0822bee20e458

Cheers,

On Wed, Nov 4, 2026 at 6:29=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Martin
>
> there is a version upgrade staged in master-next to 6.2.20261101.0 please=
 check if this patch is needed with the upgrade as well.
>
> On Wed, Nov 4, 2026 at 4:40=E2=80=AFAM Martin Jansa via openembedded-deve=
l <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> Tries to call sphinx-build during clean in docs directory and fails when
>> not installed on host nor included in HOSTTOOLS
>>
>> Fixes do_configure failure when re-executed in existing WORKDIR
>>
>> ...
>> rm -f ./*.gcov
>> make[2]: Entering directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.=
20261011.0/sources/ctags-6.2.20261011.0/docs'
>> /bin/sh: 1: sphinx-build: not found
>> make[2]: Leaving directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.2=
0261011.0/sources/ctags-6.2.20261011.0/docs'
>> make[2]: *** [Makefile:20: clean] Error 127
>> make[1]: *** [Makefile:8218: clean-local] Error 2
>> make[1]: Leaving directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.2=
0261011.0/sources/ctags-6.2.20261011.0'
>> make: *** [Makefile:7175: clean-recursive] Error 1
>> ERROR: oe_runmake failed
>> WARNING: exit code 1 from a shell command.
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb b/me=
ta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
>> index e2f6b309ef..b419a158c0 100644
>> --- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
>> +++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
>> @@ -33,3 +33,6 @@ PACKAGECONFIG[yaml] =3D "--enable-yaml,--disable-yaml,=
libyaml"
>>  PACKAGECONFIG[manpages] =3D ",,python3-docutils-native"
>>
>>  BBCLASSEXTEND =3D "native"
>> +
>> +# calls sphinx-build during clean
>> +CLEANBROKEN =3D "1"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#131843): https://lists.openembedded.org/g/openembedd=
ed-devel/message/131843
>> Mute This Topic: https://lists.openembedded.org/mt/122091537/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
