Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2825DCD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:27:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70076.1778570845969308899
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 00:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NNwXFLnc;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44e1860558fso3312508f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 00:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778570844; x=1779175644; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rs5etDNqOPXHSTMlL4eXtsXn6nSzddZw9s/rBLZ84w=;
        b=NNwXFLncwVZmRJqzefYhVLr1jEbHkVC5KdXdV63OysukCMp/13fFopB26o3zC+K7HU
         lOOrJBJXRJjbY/5ghoMwjII4HmyoYMZhBjR2aXQQUIqXiRzG8eI8eigTjbekHE0cF6T3
         NnXQWEOMAEm2DdZXBd2P6NmSq9OCE+FNybkHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778570844; x=1779175644;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rs5etDNqOPXHSTMlL4eXtsXn6nSzddZw9s/rBLZ84w=;
        b=F3aHkR5OCZ+qT4zle/KvrEL75s2cNP8qisOw42A8lrK8MY9n2Yd2qMRB7zrJxs7l3k
         b9ECPeVyazZKRpMCqWKR0QDE8nQr4Uyr3BqjSRKxfFdIX2oc5memNrEA6UhqssQX5Q40
         sELtnR4ybqqCJ88A2wGWNLRgAiMGGRF69E5u9AIMrQ1NBv51ojnRdbIlRdIUua52ra03
         6pK5w5Zm7E1zZ5C4nwUjtWmWt+sygOJJNj/y4k6nHMGdR31vOetv1m6xX0I7UDbVICW4
         ra3bj8hasoliERs9qO7RrCcvPCAqlAve7Cw/FMEn6H6eJrj5+ZW9WmCy+B7tbiuVXbHx
         NrFA==
X-Forwarded-Encrypted: i=1; AFNElJ+pVQnx308t0mS8bfjBt6BO2I1lvMFX2YSTgZjRDuTWEDo0hUUb5/W7izWyYowDnq70+SkHQTQ4lRdeLqqpflJD3+M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwXdTu4nw/k1Hu5qKt8s1mC6mk0j5Oj2PK8Yvk7y/lq5jz1iszs
	Vt8RALB+g2IIYySutLnQkm/ko4BNWHxsBhXr5wj/otcgROnmnO2IPXgrScE4LDbCMLf7MM+o7fw
	LL010Tfg=
X-Gm-Gg: Acq92OHPQJhtMDR1swc++571lBorTsmyC/P/MP+qSXD78EqFzCzTbeeQm0VXZ3YESNh
	4ibch1Qdn6BT4+2WF6VfxF7SfCLPmBDSjklKmccwgc/z/TC5CT7JHPZt22hkSnExaNL8Oif/RSv
	rvvda3ztqimhehYie5w9eQ4vl3oUFIa2n7IAOV8z486q1BOq2DjoVOt6sbGs5pS9LcxbsZlHLO4
	Rv0TO4Wkahpgmeak6ymDWjCx2jTK6IYmjAneY9EwpeSAWuTMDINI6jGL0wrncoNmDpoea3LWDgT
	N7kIkuKHTHTwOCA2Cs2QyZ1u7Zy6L1punUSzmUpQFLritLHNyD6cBLU1siFZQ8BKf8I7dcdIjYk
	j1yRpAXjSVkbtnDhriCYdrvicLsoS2wNYlQ5jRjIZn1NDXggHBcmeK3vXLy9cwtVFrF1dnGCYwd
	ZJ08gJ26Mb46U+N9PccvICfDyn0mQE26L4uwhp6GOcNQkXAdtgc4mYTgLOqeYyXwwHL5mIucQpb
	u8//VVelNY+YfI=
X-Received: by 2002:a05:6000:4013:b0:43d:6787:9934 with SMTP id ffacd0b85a97d-45460e3f3d6mr26588431f8f.9.1778570844235;
        Tue, 12 May 2026 00:27:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120eab7sm30063931f8f.23.2026.05.12.00.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:27:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 09:27:22 +0200
Message-Id: <DIGIQTEBEP9P.237SS5QSX0NT4@smile.fr>
Subject: Re: [oe] [meta-networking][PATCH] nftables: improve reproducibility
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yi Zhao" <yi.zhao@windriver.com>,
 <openembedded-devel@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260511142142.3620917-1-yi.zhao@windriver.com>
 <DIFXDYIPL4EY.3BAEX7B7MNLX0@smile.fr>
 <836eae13-2219-4e9a-82a0-660cd230e687@windriver.com>
 <beba177b-c00d-4ecb-95d3-0b1b64a94dea@windriver.com>
In-Reply-To: <beba177b-c00d-4ecb-95d3-0b1b64a94dea@windriver.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 07:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126860

On Tue May 12, 2026 at 4:02 AM CEST, Yi Zhao wrote:
>
> On 5/12/26 09:00, Yi Zhao wrote:
>>
>> On 5/11/26 22:43, Yoann Congal via lists.openembedded.org wrote:
>>> On Mon May 11, 2026 at 4:21 PM CEST, Yi Zhao via=20
>>> lists.openembedded.org wrote:
>>>> Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the current
>>>> time, thereby improving reproducibility.
>>>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>> =C2=A0 ...-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch | 34=20
>>>> +++++++++++++++++++
>>>> =C2=A0 .../recipes-filter/nftables/nftables_1.1.6.bb |=C2=A0 1 +
>>>> =C2=A0 2 files changed, 35 insertions(+)
>>>> =C2=A0 create mode 100644=20
>>>> meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-set=
-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>>>
>>>> diff --git=20
>>>> a/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-s=
et-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch=20
>>>> b/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-s=
et-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch=20
>>>>
>>>> new file mode 100644
>>>> index 0000000000..7d2f9c0dfe
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-s=
et-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>>> @@ -0,0 +1,34 @@
>>>> +From 77de073b1cc7413b1d230995851338345d56a8f8 Mon Sep 17 00:00:00 200=
1
>>>> +From: Yi Zhao <yi.zhao@windriver.com>
>>>> +Date: Mon, 11 May 2026 15:52:29 +0800
>>>> +Subject: [PATCH] configure.ac: set MAKE_STAMP to SOURCE_DATE_EPOCH
>>>> +
>>>> +If SOURCE_DATE_EPOCH is set, use it to set MAKE_STAMP instead of the
>>>> +current time.
>>>> +
>>>> +Upstream-Status: Inappropriate [embedded specific]
>>> I think that this patch should at least be sent upstream.
>>> Reproducibility is not "embedded specific".
>>> See https://reproducible-builds.org/
>>
>> Thanks.=C2=A0 I will send it upstream.
>
>
> I have checked upstream and found that this commit[1] in development=20
> branch has already resolved the reproducibility issue. However, since=20
> the changes involve multiple patches, backporting them is not appropriate=
.
>
> Therefore, I think we can keep the current Upstream-Status in the patch.=
=20
> It will be dropped upon the next release of nftables.
>
> [1]=20
> https://git.netfilter.org/nftables/commit/?id=3Dca86f206c92704170a295b8dc=
7a41f6448835dde

Awesome news :)

In that case, your patch could be seen as the "Upstream-Status: Backport" o=
f this URL...
At least, please add the URL to the patch as a reference so this
precious information is not lost when the upgrade will happen.

Thanks!
>
>
> //Yi
>
>>
>>
>> //Yi
>>
>>
>>>
>>> Regards,
>>>
>>>> +
>>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> +---
>>>> + configure.ac | 5 ++++-
>>>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/configure.ac b/configure.ac
>>>> +index 6825474..2b147af 100644
>>>> +--- a/configure.ac
>>>> ++++ b/configure.ac
>>>> +@@ -165,7 +165,10 @@ AC_CONFIG_COMMANDS([nftversion.h], [
>>>> + ])
>>>> + # Current date should be fetched exactly once per build,
>>>> + # so have 'make' call date and pass the value to every 'gcc' call
>>>> +-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
>>>> ++AS_IF([test -n "$SOURCE_DATE_EPOCH"],
>>>> ++=C2=A0=C2=A0=C2=A0 [MAKE_STAMP=3D"$SOURCE_DATE_EPOCH"],
>>>> ++=C2=A0=C2=A0=C2=A0 [MAKE_STAMP=3D'$(shell date +%s)'])
>>>> ++AC_SUBST([MAKE_STAMP])
>>>> +
>>>> + AC_ARG_ENABLE([distcheck],
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AS_HELP_=
STRING([--enable-distcheck], [Build for=20
>>>> distcheck]),
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git=20
>>>> a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb=20
>>>> b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>>> index d27e60a18d..5ab31f9b0c 100644
>>>> --- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>>> +++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>>> @@ -12,6 +12,7 @@ DEPENDS =3D "libmnl libnftnl bison-native \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '',=20
>>>> 'gmp', d)}"
>>>> =C2=A0 =C2=A0 SRC_URI =3D=20
>>>> "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
>>>> + file://0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://run-ptest \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>> =C2=A0 SRC_URI[sha256sum] =3D=20
>>>> "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#126851):=20
>>> https://lists.openembedded.org/g/openembedded-devel/message/126851
>>> Mute This Topic: https://lists.openembedded.org/mt/119256992/7283133
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe:=20
>>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>>> [yi.zhao@eng.windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>


--=20
Yoann Congal
Smile ECS


