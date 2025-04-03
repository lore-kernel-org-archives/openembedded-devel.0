Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE270C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 13:14:21 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.12990.1743686052764372336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 06:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c07GqU4Q;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: awais.belal@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c2dc6c30c2so223643fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686052; x=1744290852; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4WckggPZJ64FY3dY3A7RoNj5uqIO0XklQkPJYsRAs/Y=;
        b=c07GqU4QI37SM8RKAPKDVoQDnEADDMR79KOm1gQAFQL4E/htqS3h43gZnCMC5xPZ1c
         vEqDDMCuqWn604B0jlSVvCtMXYGUCg3xcTRiY8W9fdUpbTpHUU6B6Aa1wMxOEo+A44rF
         TcQ6B6OU0wbLwcT4ckx0PscYnEZ5qwFfX5CSVtSaMcK8DeXXXid9nIXoMNNprv74NfcT
         5O0h297NcaHB+JdOrFWtHfiSM7XEwNw4bBqlghkRHxliqGH3epUM7dlRlPGFI6HDA4Vy
         e1Vvsv1pTHpDE17nuwWrbMZac5zGESQN/cJE7lQ7MRjsLHTrGuPLXxpe6i9PnI4N2yrS
         p/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686052; x=1744290852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WckggPZJ64FY3dY3A7RoNj5uqIO0XklQkPJYsRAs/Y=;
        b=dnPNUncpW0AUnJ0d6popZtkHRXd9ZXDgJbJKfrlim+Q1ww6d1rtHgEwzcHsnwip2T8
         2T89d9LjaSdUu/eg8sUqnIFfEn+XgeQRC8XzJfMaYmUKwuiWG5/MpQhNbEhajmkA7g6y
         xmf0IkZRTtx7UGrC1HagEyiIIz9qQ+kfKsbOmTkBN5s2bksvOElVWZi34rd4U3VbbSsF
         hOsAVcCGzXd4mfk83Eu5Plf29SDn/d8+87rGN7RV4xEgn8xdMpocqCtA9w7kS0s2ffmn
         m3qCU+idxl2V/sBOvtDV5DHP2WHEx8UP5EqE+q/+LbqkgMJqVttptZ8GsJ50WK+yLZ0t
         IiVg==
X-Forwarded-Encrypted: i=1; AJvYcCWBF675N8qhqH/g0N9jEeKU0EJOVP1xhnyqzVWyyemDTDNVQJkckzScbcCtgsYuGfzkEa77B0dgC73r5bpLQUZ6G9c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZam5aGqWKzOA7gfRx5pllkT/uv2V1vqQqslIqRu/PgjVd0lKT
	hXgYOqFTd06gkMDM4lGKuw4xugBnnceysZRoMXFBwRqBi4zk2UGpo/uh6sC0XEeUURvBYGrrykC
	H+uIWyrqVEmI56Ub5QSGVFvr8Mgs=
X-Gm-Gg: ASbGncuN7j7nagCBno9+jl6bxpJAViMplcB06zD8aH/duWLKDp+3dXviXOthCV6ZdrX
	B/c2mmk0uw4PPUOcdfOYvyeaOBYdWZHy0jFGCP49j5iSDnH3PfHvOHOTLzPwVVj6Ai4AiKAaGqB
	/ODoSaWHFpLvplACxclxq4/Cl3EQg=
X-Google-Smtp-Source: AGHT+IGF0ie6qSBLlY2MnN/f2rSeAX8M6OpEOy6oPNLTpzPmKNe2rGSsuNROQXhK5CVs8X4XVuq6L9ARVrMKyFudGF0=
X-Received: by 2002:a05:6871:b09:b0:2bc:75aa:aeae with SMTP id
 586e51a60fabf-2cc60acbc16mr2555334fac.10.1743686051954; Thu, 03 Apr 2025
 06:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
 <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
 <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
 <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com> <CA+chaQdj4iXwG1bP_ZYJVXJXU1Oq4buzc5hx=YU7DBkXk9uQ0A@mail.gmail.com>
In-Reply-To: <CA+chaQdj4iXwG1bP_ZYJVXJXU1Oq4buzc5hx=YU7DBkXk9uQ0A@mail.gmail.com>
From: Awais Belal <awais.belal@gmail.com>
Date: Thu, 3 Apr 2025 18:14:00 +0500
X-Gm-Features: AQ5f1JoVjqneAT-E6VoYHB52Vwh18OYLSVm2B2nisl4lL4YbVjpSr9k0LzcgLnc
Message-ID: <CAM=5Ambb1=5rTBYoQQ1y+OwpFRUn2eVmadPYRCsj3NBS1+ucqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ba0ade0631df8b73"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 13:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116542

--000000000000ba0ade0631df8b73
Content-Type: text/plain; charset="UTF-8"

>
>
> Awais: any update on this? the 1/2 is already applied in scarthgap,
> but in walnascar and master it's still skipped with:
> SKIP_RECIPE[mongodb] ?= "Needs porting to python 3.12"
>
> and there is also:
>
> ERROR: mongodb-4.4.24-r0 do_package_qa: QA Issue: File /usr/bin/mongod
> in package mongodb contains reference to TMPDIR
> File /usr/bin/mongos in package mongodb contains reference to TMPDIR
> [buildpaths]
> ERROR: mongodb-4.4.24-r0 do_package_qa: Fatal QA errors were found,
> failing task.
>
> even in scarthgap (where it usually isn't fatal error, but will need
> to be fixed for walnascar - I haven't checked the new version from
> this review yet).
>
>
Hi Martin,
I believe the only issues left here are the TMPDIR references but I haven't
been able to pick those up just yet. I also tried pinging Khem for some
pointers on TMPDIR issues as I myself haven't had an encounter with those
earlier. Any suggestions on how I should go about debugging/fixing them?

-- 
Regards,
Awais Belal

--000000000000ba0ade0631df8b73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>Awais: any update on this? the=
 1/2 is already applied in scarthgap,<br>
but in walnascar and master it&#39;s still skipped with:<br>
SKIP_RECIPE[mongodb] ?=3D &quot;Needs porting to python 3.12&quot;<br>
<br>
and there is also:<br>
<br>
ERROR: mongodb-4.4.24-r0 do_package_qa: QA Issue: File /usr/bin/mongod<br>
in package mongodb contains reference to TMPDIR<br>
File /usr/bin/mongos in package mongodb contains reference to TMPDIR<br>
[buildpaths]<br>
ERROR: mongodb-4.4.24-r0 do_package_qa: Fatal QA errors were found,<br>
failing task.<br>
<br>
even in scarthgap (where it usually isn&#39;t fatal error, but will need<br=
>
to be fixed for walnascar - I haven&#39;t checked the new version from<br>
this review yet).<br>
<br></blockquote></div><div><br></div><div>Hi Martin,</div><div>I believe t=
he only issues left here are the TMPDIR references but I haven&#39;t been a=
ble to pick those up just yet. I also tried pinging Khem for some pointers =
on TMPDIR issues as I myself haven&#39;t had an encounter with those earlie=
r. Any=C2=A0suggestions on how I should go about debugging/fixing=C2=A0them=
?</div><div><br></div><span class=3D"gmail_signature_prefix">-- </span><br>=
<div dir=3D"ltr" class=3D"gmail_signature">Regards,<br>Awais Belal</div></d=
iv>

--000000000000ba0ade0631df8b73--

