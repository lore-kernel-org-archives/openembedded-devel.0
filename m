Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A311BCF8857
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 19:29:50 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.129.1728061985936457717
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 10:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhBKqQeq;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: kamalgmbh32@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so37845051fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728061984; x=1728666784; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RZqhd7YY3iQXzEHKMAw/x+sOuAAmRpSWdVWJ2H9J5aQ=;
        b=HhBKqQeqdngef0uM4HGiq6RqNu7oKFF3/oobmvTXAkmNLNxEcbVH2a+Q/ZbRnbAE7r
         utpJBd5zMgkGgBGTILkEtVlZ5KbfaUqqVT00L+yrvJCInjpaz6JzO2cEqtbWx2mlf5sa
         cqtuMiRocS6V90APLVRe0Kclh65x3HHVtjjxsOp79ERD3s3Kexpg29qK4jYSsWEa7OUd
         JmxKG4jH8eG7sMuvJNeKxphz6IioUiCJFlMzRAOA97Xl1pvi3LUfNpNcu3pPamlV9yI7
         ghtD8qxUxSrQ/kjVTgv/YSth6RKRDKZeO2d7s2TwXhcK20AjM6PlyYg/MTEXwereohLh
         CSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728061984; x=1728666784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZqhd7YY3iQXzEHKMAw/x+sOuAAmRpSWdVWJ2H9J5aQ=;
        b=RUjvac2pf/cuiw8xVsbKlWNQ5Jqkkx5fqFL8j2fW6a9r35+9+TPhCrtvXaZJImNPHf
         N28VernyUvJmNS21o3bBznpogZeYMkTudDxpJriNiJL648XvYvshIxdBG4jhRL/YLYrK
         4/8GCBwpFBpxaB4LgsS/mDssQk+1rApSrVGyjbzFiSnT1ZpBG1aA13RmGDlCEW+iMdPZ
         d48z6ZqaGrYccDVpacHuAvpN9FOyRynTHaN0sNCYK5883sw5ZOfgiJa/LmHnzO6Tpl90
         1C/2ZXpryen16bs4bTJjJELVneDwwmg8aH8BN++olglLQ9yV8vKkAYm7LZn40al99Cdy
         49fQ==
X-Gm-Message-State: AOJu0YxyrbX1qBD+w/OtD8vnd3Fx4uYLwt+mi3aV06has4J11eGBkLVV
	Zkx+gV5Om/V6PTx9B9YNHa0DMbCNkQ5CeuytpZJZe8sqwn7eQoeoFAR2e3/9/DXGJNBScKoYJvo
	O4XzRxD0UsDTI2IVywlt27o4yaZ8=
X-Google-Smtp-Source: AGHT+IGhju46/CJsB9nXquK1NtOYa7Aprd68I+ZV9DBRx/YyvFUOGLecXZFyAGr7MEMtA2oRuLC31f5bwZqi4+KNfPY=
X-Received: by 2002:a05:6512:1256:b0:539:983b:ea75 with SMTP id
 2adb3069b0e04-539ab9ec262mr2231625e87.57.1728061983335; Fri, 04 Oct 2024
 10:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+u1R=QDJdsJXHpU-3AHaeF6-V20RZdLufjBupCOY6Nv0zeNig@mail.gmail.com>
 <CAMKF1sromogM_ArSgp1fa18dnMVXMvhkdQZhv-c8cWbHv43arQ@mail.gmail.com> <CA+u1R=T_MRemJ56H1uM_=h9m+Va-s3svp7Af=a=JtKKVRryWFA@mail.gmail.com>
In-Reply-To: <CA+u1R=T_MRemJ56H1uM_=h9m+Va-s3svp7Af=a=JtKKVRryWFA@mail.gmail.com>
From: "Kamal GMBH" <kamalgmbh32@gmail.com>
Date: Fri, 4 Oct 2024 22:42:52 +0530
Message-ID: <CA+u1R=RN4ZNOBfSUW5DBgR-rEaUkRVtbRtxgvsKMnYEu0OxuiQ@mail.gmail.com>
Subject: Re: [oe] Need support: Turbostat is not compiling in 6.8 custom kernel!
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aaacf30623a9c88a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 19:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112667

--000000000000aaacf30623a9c88a
Content-Type: text/plain; charset="UTF-8"

Hello Raj,

I used *https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb?h=master#n81
<https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb?h=master#n81>*
 = master branch turbostat

and i addded* IMAGE_INSTALL:append = " turbostat"*
i am getting below error

*error*:

ERROR: turbostat-3.4-r0 do_populate_lic: QA Issue: turbostat:
LIC_FILES_CHKSUM points to an invalid file:
/media/nvme1/umesha/kamal/poky-amd-scarthgap/build-v2000a-scarthgap/tmp-glibc/work/v2000a-oe-linux/turbostat/3.4/sources/COPYING
[license-checksum]
ERROR: turbostat-3.4-r0 do_populate_lic: Fatal QA errors were found,
failing task.
ERROR: Logfile of failure stored in:
/media/nvme1/umesha/kamal/poky-amd-scarthgap/build-v2000a-scarthgap/tmp-glibc/work/v2000a-oe-linux/turbostat/3.4/temp/log.do_populate_lic.902144
ERROR: Task
(/media/nvme1/umesha/kamal/poky-amd-scarthgap/meta-openembedded/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb:do_populate_lic)
failed with exit code '1'
NOTE: Tasks Summar

Regards,
Kamal

>

--000000000000aaacf30623a9c88a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Raj,</div><div dir=3D"ltr"><br>I us=
ed <b><a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-o=
e/recipes-kernel/turbostat/turbostat_3.4.bb?h=3Dmaster#n81">https://git.ope=
nembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/turbostat/turbo=
stat_3.4.bb?h=3Dmaster#n81</a></b> =C2=A0=3D master branch turbostat<br><br=
>and i addded<b> IMAGE_INSTALL:append =3D &quot; turbostat&quot;</b><br>i a=
m getting below error<br><br><b>error</b>:<br><br>ERROR: turbostat-3.4-r0 d=
o_populate_lic: QA Issue: turbostat: LIC_FILES_CHKSUM points to an invalid =
file: /media/nvme1/umesha/kamal/poky-amd-scarthgap/build-v2000a-scarthgap/t=
mp-glibc/work/v2000a-oe-linux/turbostat/3.4/sources/COPYING [license-checks=
um]<br>ERROR: turbostat-3.4-r0 do_populate_lic: Fatal QA errors were found,=
 failing task.<br>ERROR: Logfile of failure stored in: /media/nvme1/umesha/=
kamal/poky-amd-scarthgap/build-v2000a-scarthgap/tmp-glibc/work/v2000a-oe-li=
nux/turbostat/3.4/temp/log.do_populate_lic.902144<br>ERROR: Task (/media/nv=
me1/umesha/kamal/poky-amd-scarthgap/meta-openembedded/meta-oe/recipes-kerne=
l/turbostat/turbostat_3.4.bb:do_populate_lic) failed with exit code &#39;1&=
#39;<br>NOTE: Tasks Summar<br></div><div dir=3D"ltr"><br></div><div>Regards=
,</div><div>Kamal</div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
</blockquote></div></div>

--000000000000aaacf30623a9c88a--

