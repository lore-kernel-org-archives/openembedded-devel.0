Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C99C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 08:25:58 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.26260.1652689551026523259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 01:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yn3Z098z;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id s14so13753113plk.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SdvYt5Mq3sU/TG5o5oxTmQwuEFU2HgyVvw3BGZA0viY=;
        b=Yn3Z098ziw5OqE9lv0zpEOvi9HLCex0G4BWI/Ob3EDQ7l1c/G2WGWycC6UG6GSa8mJ
         wKLEygl0iWpBShiz5kHC4d5M3CLQCf0yIUtiT3RZM/MzJ7fqm+Nklt7v7SVKarzSHOMI
         lP6cUrFvQIUwY3/zNeRAa+FmlHeh1FCXb2FE9r5ryrUBcx5AF0IrVm8QebThGUb7DFal
         jwtvj1rf/zXFOorLG8O+lO4sJhI1WjaqHJfgWX1ogHxyT9PFviWqsgK+1rM4DKNBZ5wE
         QQ+ncjDPH5VKCYPsfjbUlYvyT/wFH3He9PTdWGJYeoSWvuRFQfXRWyrXWi8I1QhQvGSu
         hTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SdvYt5Mq3sU/TG5o5oxTmQwuEFU2HgyVvw3BGZA0viY=;
        b=i70ipVopYi5UBPqXiw8hmSCJqdRmdXey3Pum3LRNYnJieMAUalPmCZw82B+3/VA8qi
         v9Dke3dXHAqBJW+7brjyHGi5KspNXZ4cAojp/edX1za34VAkfbhXwizHl00mZejapFud
         fYwUN1ZD6VqXaFalqsVMIZxu36mKWn8K6Th94A7pP5H+dhLpCCwJ/YWhV9Zmph1h1FMh
         aAvkgv/ToSm4h71Dpiw0Trw5g5Mp/K+lAn7wTUlUMNAoJcqAENLKFV81NubFUzOemCT3
         pLfFlfysQ+2Cm5xBsH2PAobCvgnnvksOG1EQXSVByJ/YQAGXrhfHTYjFSq+rfsZjOCXp
         cQ3g==
X-Gm-Message-State: AOAM531gDSPpE2qRH7ORygsgeeJINloKxOvuMf70/d/K1FJwo88bRQBB
	Qs6sol8rGJc/b3u2bu0ozYbuiPVhXyusmIpOVKU=
X-Google-Smtp-Source: 
 ABdhPJyXyH6b1Y5EIDkvzBzUSMdTwvWF2VaMt5WZT59ckevXWrPbKJnVrZaryLFHR7Q0iI2QLEgupP0l38p2XZYauiE=
X-Received: by 2002:a17:90a:9505:b0:1df:2162:2bb5 with SMTP id
 t5-20020a17090a950500b001df21622bb5mr9986641pjo.73.1652689550372; Mon, 16 May
 2022 01:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220516072323.27316-1-sanakazisk19@gmail.com>
In-Reply-To: <20220516072323.27316-1-sanakazisk19@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 16 May 2022 10:25:38 +0200
Message-ID: 
 <CAApg2=QUb3Aaw2-Twwe-SBNx2L+6-UBWbwPgiSnD-ATYPAD+Yw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] openjpeg: Whitelist CVE-2020-27844
 and CVE-2015-1239
To: sana kazi <sanakazisk19@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000092f11105df1cc55c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 08:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97123

--00000000000092f11105df1cc55c
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 9:24 AM sana kazi <sanakazisk19@gmail.com> wrote:

> From: Sana Kazi <Sana.Kazi@kpit.com>
>
> Whitelist CVE-2020-27844 as it is introduced by
>
> https://github.com/uclouvain/openjpeg/commit/4edb8c83374f52cd6a8f2c7c875e8ffacccb5fa5
> but the contents of this patch is not present in openjpeg_2.3.1
>
> Link: https://security-tracker.debian.org/tracker/CVE-2020-27844
>
> Whitelist CVE-2015-1239 as the CVE description clearly states that
> j2k_read_ppm_v3 function in openjpeg is affected due to CVE-2015-1239
> but in openjpeg_2.3.1 this function is not present.
> Hence, CVE-2015-1239 does not affect openjpeg_2.3.1.
>
>
I agree with the analysis, thank you for looking into it! It seems that it
will be better to add that information to the NVD database. Sending the
change information right now.

Kind regards,
Marta

--00000000000092f11105df1cc55c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 16, 2022 at 9:24 AM sana =
kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com">sanakazisk19@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=3D"_blank">S=
ana.Kazi@kpit.com</a>&gt;<br>
<br>
Whitelist CVE-2020-27844 as it is introduced by<br>
<a href=3D"https://github.com/uclouvain/openjpeg/commit/4edb8c83374f52cd6a8=
f2c7c875e8ffacccb5fa5" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/uclouvain/openjpeg/commit/4edb8c83374f52cd6a8f2c7c875e8ffacccb5fa5</a><=
br>
but the contents of this patch is not present in openjpeg_2.3.1<br>
<br>
Link: <a href=3D"https://security-tracker.debian.org/tracker/CVE-2020-27844=
" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/=
tracker/CVE-2020-27844</a><br>
<br>
Whitelist CVE-2015-1239 as the CVE description clearly states that<br>
j2k_read_ppm_v3 function in openjpeg is affected due to CVE-2015-1239<br>
but in openjpeg_2.3.1 this function is not present.<br>
Hence, CVE-2015-1239 does not affect openjpeg_2.3.1.<br>
<br></blockquote><div><br></div><div>I agree with the analysis, thank you f=
or looking into it! It seems that it will be better to add that information=
 to the NVD database. Sending the change information right now.</div><div><=
br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--00000000000092f11105df1cc55c--

