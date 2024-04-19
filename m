Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50A7C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 17:27:03 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.27269.1713547617559931641
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 10:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VRpuZ7kV;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-238e171b118so1229415fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 10:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713547617; x=1714152417; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wWuEbsEg408QZVRFPxanSQ7IRiZfKfLu6agWCkmGkc=;
        b=VRpuZ7kVEs6Ir6sympK3Iks+x/QzsvYEoL11ylav6gDE4vYRYw39NUSJVBHTTkcS9B
         /asPRyShym1HuhEbfDZlVHpUk4MyVG7ZdDq7PmHLm5v/LrA5juze+oUznfTxMJ1QkGDg
         vBY7FUl37crCDT90bm8muVrTgdTGXCWyf0PdQaQFziLDZFLFTh6fBJRO4naDacP/8e+M
         eyW/RPx8d8PfHerI03nzkCFcGMjxf3eQh2KX/tsahBaGd0N5gB9zv+NwQ7vBoeecLHR1
         j04uB2/RULcWdHbd1/+aQzcE7ctmNjiARYnd/iWvO3+EopSNNPFLwCRZC8Kdaq7DqURP
         OZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713547617; x=1714152417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wWuEbsEg408QZVRFPxanSQ7IRiZfKfLu6agWCkmGkc=;
        b=OlJern6+JxXw9o+7OUpGURRe11THVD4n/VnmA2svukMrWAFCS6WamAq+MxKRzj2/GA
         MU5vayTgRbNOBus/NqGPPTFYrWU+jSPoPjq1q8ahm9Uk3yqlLJtYSoRmUjwGNXzFkyjh
         3mqPEAQ2vI6+/oCHPM2zWzLk3cDwGMgPAZh4g2oQ+gHNfBLFCCt7pKAOlVeC0kXYmjwd
         Q9cGYMCPrpBD5MdjmaDbPmviegM79NXgCoqRvVAFqrfrO553Kzn0oQlH7cp2EfVC4l+Y
         fcWyeWFE1C0GNm4VDH1z4fTzB7LZhsResAOKizvqjcWSe8OSEkLeO7JfXukFpUTgEtBo
         j2UA==
X-Gm-Message-State: AOJu0Yy8wav2vvHCozEgM5yW6KRalkKV7S700dzWuQBjU5o/3FJyRfA2
	DYoR3bcKJVWRQxnmzl9gABEvYQmeVvLVlRph566q5nH71gXqCkKG1lwocLIPh4EpHlnTaUiYADy
	qdldrGTHPxR7E0nB9trFk2nC7nC6cUz37
X-Google-Smtp-Source: AGHT+IHupQgIMHxjDL3tTcwWXSPmuEOwN0uOnUyg6HCGkJ8rwnq4uouY+eiFel32CpBKY5QLU0j7e0YRI4HJmRVIOxw=
X-Received: by 2002:a05:6870:658f:b0:21f:9c60:dba8 with SMTP id
 fp15-20020a056870658f00b0021f9c60dba8mr3317439oab.4.1713547616781; Fri, 19
 Apr 2024 10:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sp6qeka7U4Ocb1vfq5u+x4Fg-3F3vVs7L62QvH5KHfZ7g@mail.gmail.com>
 <7441.1713513902920754891@lists.openembedded.org>
In-Reply-To: <7441.1713513902920754891@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Apr 2024 10:26:45 -0700
Message-ID: <CAMKF1sqHHnvM-5k5ytSHwAkw_9mYTxkYZ_TB0PRaDBhZ5vbshw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-twisted: upgrade 22.10.0 -> 24.3.0
To: gudnimar@noxmedical.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000010c970616766544"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 17:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110066

--000000000000010c970616766544
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 1:05=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via lis=
ts.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:

> On Thu, Apr 18, 2024 at 11:33 PM, Khem Raj wrote:
>
> master-next is staging many patches and is always in flux and
> primarily meant for CI, so please send a v2 of this with the feedback
> addressed.
>
> Hi Khem,
> Thank you for the reply, I did not know this. I will then submit a new
> patch. I'm currently travelling but will post the patch likely next Monda=
y.
> :)


That is fine


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110057):
> https://lists.openembedded.org/g/openembedded-devel/message/110057
> Mute This Topic: https://lists.openembedded.org/mt/105594516/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000010c970616766544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 19, 2024 at 1:05=E2=80=AFAM Gu=C3=B0ni M=C3=A1r=
 Gilbert via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;gudnimar=3D<a href=3D"mailto:noxmedical.com@lists.openembedded.o=
rg">noxmedical.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Thu, Apr 18, 2024 at 11:33 PM, Khem Raj wrote:<br>
<blockquote>master-next is staging many patches and is always in flux and<b=
r>primarily meant for CI, so please send a v2 of this with the feedback<br>=
addressed.</blockquote>
Hi Khem,<br>Thank you for the reply, I did not know this. I will then submi=
t a new patch. I&#39;m currently travelling but will post the patch likely =
next Monday. :)
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That is fine=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110057): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110057" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110057</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105594516/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105594516/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000010c970616766544--

