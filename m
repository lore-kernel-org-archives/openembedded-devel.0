Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDE9C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:53:52 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.7714.1700211227340242955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzOat+/V;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50a938dda08so2514222e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211225; x=1700816025; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/EJ01SyAFmC7byQ+Qyj5BXAWDKd5oiXYGARX5dszlk=;
        b=hzOat+/VwnEMmmdI5wGY+tyLkWcIBdlcZUnsaJiMDDAtEeKq+aFpOUrYYfQHIka51A
         ZJz88tpsGO6RbBXvnUsrkZC7oY7bjRA4Aa+ciBAFaaU8+rZwj/ghaLek7z9VS8D9MxCe
         yH1wfd1/uGkqjbFPmPq/x30eizmafksA9ulzvgAwIziTtQAryC1RpHDtNcSnjZMy6/rN
         c9o18UL+WWzvC0Hb3hCEtmG9gqVbrWY2/hhp/9bBQx4laYwfhDqtxOiGVl0JNcul2Q2R
         mcWL43J0FHqRSIT/aM7oJIZzdfcBoF01bjjNa3k6rF+yNwM2olpHqmwhuRRJJvFqPAX4
         CGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211225; x=1700816025;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/EJ01SyAFmC7byQ+Qyj5BXAWDKd5oiXYGARX5dszlk=;
        b=fJpJr3GTgE2xMBuXAxo2RqjM6hVvYjQj6so9juiKdCBmEJCPHPILrQgptCV3BsAqL1
         66FhY1op0dfUi0+DksYkOF8dBGWr8bOWfzMaNXOCJe/c6PCry8Kh1sZntdc1YbSav/+p
         BU/zmaunxb3IObImZw/zHFQ1ew8N5of7SHEUPZV+uq1zFbfmhmbdm3PrBhIlu16Ez3w5
         jHau7Kys1wtztYfxtzUXto3/jg+nFmfl3BMJ/j7xDzrl8DI+kF/Ku42TOYaElnum+13e
         nJ2z5Vlbwfoju5HfdmgwDsIL7QN8qL2vXp8xjhL/Ycwwf1UNBE0iQ+L942X6u3VjJkNW
         yn2g==
X-Gm-Message-State: AOJu0YzfRiIRiuQIwDGrMt8bY+9p8jLbRZlc9FpQOZuJcV2n/Z5QraMO
	E3wTD2pjnN0rav+tbFqLZff+NRRHFVZBbsROM4wYO9BPYUg=
X-Google-Smtp-Source: AGHT+IHGC8QI8APfs/FDIMAzV0RCnw9tSMG9q8McCOFmNGWzdnMFcYSyC78dgYk5OXc3SfimSx6zCIVoSBdfZpq01tw=
X-Received: by 2002:ac2:4889:0:b0:502:fdca:2eaa with SMTP id
 x9-20020ac24889000000b00502fdca2eaamr11412714lfc.52.1700211225321; Fri, 17
 Nov 2023 00:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Nov 2023 09:53:34 +0100
Message-ID: <CA+chaQfNQkunX8pkChGG63zVPE5us+aqY-9wL6kEMJt6jxuhJg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/8] android-tools: drop ${PE}, ${PR} from
 /usr/src/debug paths
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000020e87c060a55469d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106858

--00000000000020e87c060a55469d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All these depend on TARGET_DBGSRC_DIR variable added in pending oe-core
change:
https://lists.openembedded.org/g/openembedded-core/message/190815

On Fri, Nov 17, 2023 at 9:51=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
> index 9278146702..1c66ea4997 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> @@ -92,7 +92,7 @@ do_compile() {
>
>      # Setting both variables below causing our makefiles to not work wit=
h
>      # implicit make rules
> -
> CFLAGS=3D"-ffile-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV=
}-${PR}"
> +    CFLAGS=3D"-ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR}"
>      unset CPPFLAGS
>
>      export SRCDIR=3D${S}
> --
> 2.42.1
>
>

--00000000000020e87c060a55469d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All these depend on=C2=A0<span style=3D"color:rgb(51,51,51=
);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-si=
ze:14px">TARGET_DBGSRC_DIR variable added in pending oe-core change:</span>=
<div><a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
190815">https://lists.openembedded.org/g/openembedded-core/message/190815</=
a></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Nov 17, 2023 at 9:51=E2=80=AFAM Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sig=
ned-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targ=
et=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/android-tools/<a href=3D"http://android-tools_5.=
1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_5.1.1.r37.bb=
</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://andro=
id-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_5=
.1.1.r37.bb</a> b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://=
android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-to=
ols_5.1.1.r37.bb</a><br>
index 9278146702..1c66ea4997 100644<br>
--- a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_5.1.1.r3=
7.bb</a><br>
+++ b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_5.1.1.r3=
7.bb</a><br>
@@ -92,7 +92,7 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Setting both variables below causing our makefiles to=
 not work with<br>
=C2=A0 =C2=A0 =C2=A0# implicit make rules<br>
-=C2=A0 =C2=A0 CFLAGS=3D&quot;-ffile-prefix-map=3D${S}=3D/usr/src/debug/${P=
N}/${EXTENDPE}${PV}-${PR}&quot;<br>
+=C2=A0 =C2=A0 CFLAGS=3D&quot;-ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DI=
R}&quot;<br>
=C2=A0 =C2=A0 =C2=A0unset CPPFLAGS<br>
<br>
=C2=A0 =C2=A0 =C2=A0export SRCDIR=3D${S}<br>
-- <br>
2.42.1<br>
<br>
</blockquote></div>

--00000000000020e87c060a55469d--

