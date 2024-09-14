Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EA2FC618A
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 02:17:04 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.88631.1726280223749772087
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 19:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=awJChxBc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.51, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53661ac5ba1so3002522e87.2
        for <Openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 19:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726280222; x=1726885022; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Nk5yCiHeim3ys9RQ7ZTEvDzMRNqaDI8pmHAHha82TQ=;
        b=awJChxBc212IOuRIITxKwZr9/f7yasZvYtBDivSnd1oxn69c0iDY/6pphVPr/XgAEZ
         d0F9cydfT0PDahjCzelTUecFirQFAP48dbzK/NFfSrUH50Zju3z4VZKoIglg+mn/5OJ1
         Ys33k95SR9/98KJPb/mbEzbtqnEYaora5yChk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726280222; x=1726885022;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Nk5yCiHeim3ys9RQ7ZTEvDzMRNqaDI8pmHAHha82TQ=;
        b=B+FUIJKRlYXM/hhZOirUQxm18eby008g5WbgCWB43FJQ5XkatgPd1gh8kcAnrNmERA
         OPweIAgJczakHlOcfgQnKazAodHGJ1KV3UAerxs7pByLRoNajjKRz6UYahvJOtKFnCBv
         clQVLWpweSqd4SS5Fj/HRs/B7++xqLIpxb8Om+KgiE2CADdKCeV+jYyEUhU+j78u/6jE
         8bdRZ5jXOqgXmQYt2KR9vMr7L41x/2Bxv28lIkniPCtdHNBweCw68CSMddIrvtuzjF9z
         oTatBeuGuhVEjLq1d31nfvwvaiBPL4j8S0dcAFGDdbLzYErqmU3OAkfq8aaR317O5+sK
         WilQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxU0cwDh8s/uETyTkNYwxTJ6L5GRl09rtGZ5lPFVF6pYG26AQ7qdrPv1HTFYLCgxrxr7Dio9jv6Vn0PmwhD2KTI7U=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPwOAzWm0Bfxz1g0TBvd490oMHAWeRJp6aKfdpQ93IPvBi4OVR
	PwWXtFeiCH3k7RL5fg06P/HqKZ+UJ3WAcZKB/+JkJmfua4QePxExF5A9xWEL1zxTZ84KoZNVvsX
	cbT+/5zzeO/WMA3cko2K8ofA3ApekSOqdovDOagepEGKrs+dopX4=
X-Google-Smtp-Source: AGHT+IGdNv+T1H9p4cMI+RJ2nOZlyjh4BsXo+E8+Sz8InJ7MlF7JiuXQZRikNH1aQTU77EjxlTsYsRAmbK8zXeZQCGo=
X-Received: by 2002:a05:6512:350f:b0:533:c9d:a01b with SMTP id
 2adb3069b0e04-53678fc9a5dmr4362689e87.29.1726280220972; Fri, 13 Sep 2024
 19:17:00 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Fri, 13 Sep 2024 19:16:49 -0700
Message-ID: <CADfgfoZxy=abmDitj4r7QX537DJmXR9bpDj1St4Fr9f=44sN6g@mail.gmail.com>
Subject: Temporary bad tags in the yocto-4.0.21 release
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005ab84206220aef72"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 02:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112281

--0000000000005ab84206220aef72
Content-Type: text/plain; charset="UTF-8"

Due to a mistake in git configuration 4 repos received tags signed with my
GPG key instead of the Yocto Project's release key. The tags were present
for about an hour and have already been replaced with corrected tags.

If you or an automated system fetched the incorrect tags before they were
removed those repos will need to be cleaned up to ensure smooth operation
going forward.

The repos that may need attention are:

https://git.openembedded.org/bitbake/
https://git.openembedded.org/openembedded-core/
https://git.yoctoproject.org/meta-gplv2/
https://git.yoctoproject.org/yocto-docs/

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--0000000000005ab84206220aef72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Due to a mistake in git configuration 4 repos received tag=
s signed with my GPG key instead of the Yocto Project&#39;s release key. Th=
e tags were present for about an hour and have already been replaced with c=
orrected tags.<div><br></div><div>If you or an automated system fetched the=
 incorrect tags before they were removed those repos will need to be cleane=
d up to ensure smooth operation going forward.</div><div><br></div><div>The=
 repos that may need attention are:</div><div><br></div><div><a href=3D"htt=
ps://git.openembedded.org/bitbake/">https://git.openembedded.org/bitbake/</=
a><br></div><div><a href=3D"https://git.openembedded.org/openembedded-core/=
">https://git.openembedded.org/openembedded-core/</a><br></div><div><a href=
=3D"https://git.yoctoproject.org/meta-gplv2/">https://git.yoctoproject.org/=
meta-gplv2/</a><br clear=3D"all"><div><a href=3D"https://git.yoctoproject.o=
rg/yocto-docs/">https://git.yoctoproject.org/yocto-docs/</a><br></div><div>=
<br></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</div><div>Sy=
stems Operations Engineer</div></div></div></div></div>

--0000000000005ab84206220aef72--

