Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD20CE8E87
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:56:28 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.16603.1729781782139688685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJOvoq2C;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e5fa17a79dso619594b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729781781; x=1730386581; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TI+J9QhObYk3rpmpmM5i0iZWto/XD8NeozR57ZnsE6s=;
        b=IJOvoq2CiCUucltLDOKaJvXV25QI2c1GFywCnWtkLfjC5+2Z9lM7YQMV88fQmepiMV
         qnxQ+ZDIUvOhQqF4wTnPI1YYifzYL8xk5c57nOT4SkoZYQq/ZAIzS5dgrMt2eW9qTYzT
         cKllNym69C9goLweCCy5e75QDiWrYkGdQQ6iLSgjqaOeMJZABM4S5RI08v4OQZsLSz8Q
         f5SQ/nRUEHps6jxhHr5PbaWxscuDUgYfqcWhygLj98iRH7yVZ2y/d8MzXhv2Cdb3uUwF
         8YD5zahuwTckoGJcTpxFEaCfyouquTg/hQ2WR7DWkoG1JB+LGa2sIl0VA+KCx5sFYeS/
         pX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729781781; x=1730386581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI+J9QhObYk3rpmpmM5i0iZWto/XD8NeozR57ZnsE6s=;
        b=mjLzvQxuFVQD4j/z4vS1Rh9BzPDDbbLdMK1M8oS0kB4uCgCsFqS6HGK+D8A64upidS
         WL7Ef009g80M8Mz6ie7ko73Su09UVirPZc8W/k2bwoyfrSaa7/3FnMBA96XgWn5JZ2Jd
         WNV8xwgReijLNU/puayqsg/p4NmybBcBm7bI+4HZ9UX1rBhOoy4hyZizPRLzY9I2Wk+7
         BhVIEh53MDPqUaCwomWLnKghVJru0IaEI3oc/mUtjB4o0N3V3BthHslL9WthWYde//bw
         JFS8xmLa+jLRpL25UaVw8rzdCOyol0l5M7xrCRmTFWbq/ai6WwNfAtbhWg5Iu8ga4xbQ
         nOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJAvwiQ1o5ZZLxr5MxOwfTW2BPO8ahnsQJc0l3U0+f61lPPH63aRaoFDTZF4jzp4Xlo/7W9StS90oUpR03IyKBGtE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxV0xIwJC6dys4JTGCwd0Jdrttzv//b6bRDn2h7mz/llY5lEDFG
	RtcYUWqsxLlMyxQ0zdeefz0IB8XMPw/0QeLCplSlUcJy9iBQdjh8rYAyNtCWf5PTjLAj+wfRwjY
	bvZkPEmeIPTAL7UUYsDB8xDtGYNE=
X-Google-Smtp-Source: AGHT+IGSkKftmG2e6Vm9YFL7AfezofAxOvLizeRUw9F4ziABki6ZQ5Y4r9TXO67Q+eamedPMX7mqyZUAkR/Rnu+cJyA=
X-Received: by 2002:a05:6808:220b:b0:3e5:f534:ddc4 with SMTP id
 5614622812f47-3e62451718bmr6567034b6e.13.1729781781362; Thu, 24 Oct 2024
 07:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
 <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
 <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com> <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com>
In-Reply-To: <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2024 07:56:10 -0700
Message-ID: <CAMKF1soJEgMf=NgcV483TL3K5drTBD_AxfKGz_QKa4zY8wQ+iA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	openembedded-devel@lists.openembedded.org, 
	Thang Nguyen <thang@os.amperecomputing.com>, Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: multipart/alternative; boundary="0000000000009dff7c06253a347f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 14:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113173

--0000000000009dff7c06253a347f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 7:47=E2=80=AFAM Chanh Nguyen <
chanh@amperemail.onmicrosoft.com> wrote:

>
>
> On 24/10/2024 19:18, Khem Raj wrote:
> > Please test it and wait it to merge before sending pull request here,
> > feature branches are temporary and usually not something we use in OE
> >
>
> Yes Khem, it is only temporary for CI build checking.


In this case please mark them so in subject line
So we know what they are intended for


>
> Can you please help run CI build? If any other errors, we'll fix.
>
> Thanks,
> Chanh
>
> > On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
> > <chanh@amperemail.onmicrosoft.com> wrote:
> >>
> >> Hi Khem,
> >>
> >> This is only a temporary patch. It helps check CI build errors on the
> >> MCTP repo. Please help run the CI build; if any error you can show her=
e,
> >> then Jeremy will update the mctp repo to fix errors.
> >>
> >> Please don't merge this patch. When the CI builds completely without a=
ny
> >> errors, I will push a new patch with the latest version on the MCTP
> repo.
> >>
> >> Thanks,
> >>
> >> Chanh
> >>
> >> On 24/10/2024 13:51, Chanh Nguyen wrote:
> >>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> >>> ---
> >>>    meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb
> b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>> index c6aa7c104..793afe755 100644
> >>> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
> >>>
> >>>    LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> >>>
> >>> -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
> >>> +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
> >>>
> >>> -SRC_URI =3D "git://
> github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps"
> >>> +SRC_URI =3D "git://
> github.com/CodeConstruct/mctp;branch=3Ddev/cross-fixes;protocol=3Dhttps"
> >>>
> >>>    S =3D "${WORKDIR}/git"
> >>>
> >>
>
>

--0000000000009dff7c06253a347f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 24, 2024 at 7:47=E2=80=AFAM Chanh Nguyen &lt;<a=
 href=3D"mailto:chanh@amperemail.onmicrosoft.com">chanh@amperemail.onmicros=
oft.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 24/10/2024 19:18, Khem Raj wrote:<br>
&gt; Please test it and wait it to merge before sending pull request here,<=
br>
&gt; feature branches are temporary and usually not something we use in OE<=
br>
&gt; <br>
<br>
Yes Khem, it is only temporary for CI build checking.</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">In this case please mark them so in s=
ubject line</div><div dir=3D"auto">So we know what they are intended for=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><br>
<br>
Can you please help run CI build? If any other errors, we&#39;ll fix.<br>
<br>
Thanks,<br>
Chanh<br>
<br>
&gt; On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen<br>
&gt; &lt;<a href=3D"mailto:chanh@amperemail.onmicrosoft.com" target=3D"_bla=
nk">chanh@amperemail.onmicrosoft.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Khem,<br>
&gt;&gt;<br>
&gt;&gt; This is only a temporary patch. It helps check CI build errors on =
the<br>
&gt;&gt; MCTP repo. Please help run the CI build; if any error you can show=
 here,<br>
&gt;&gt; then Jeremy will update the mctp repo to fix errors.<br>
&gt;&gt;<br>
&gt;&gt; Please don&#39;t merge this patch. When the CI builds completely w=
ithout any<br>
&gt;&gt; errors, I will push a new patch with the latest version on the MCT=
P repo.<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt;<br>
&gt;&gt; Chanh<br>
&gt;&gt;<br>
&gt;&gt; On 24/10/2024 13:51, Chanh Nguyen wrote:<br>
&gt;&gt;&gt; Signed-off-by: Chanh Nguyen &lt;<a href=3D"mailto:chanh@os.amp=
erecomputing.com" target=3D"_blank">chanh@os.amperecomputing.com</a>&gt;<br=
>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 meta-networking/recipes-support/mctp/<a href=3D"h=
ttp://mctp_2.0.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.0.bb</a> | 4=
 ++--<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta-networking/recipes-support/mctp/<a href=3D"h=
ttp://mctp_2.0.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.0.bb</a> b/m=
eta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">mctp_2.0.bb</a><br>
&gt;&gt;&gt; index c6aa7c104..793afe755 100644<br>
&gt;&gt;&gt; --- a/meta-networking/recipes-support/mctp/<a href=3D"http://m=
ctp_2.0.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.0.bb</a><br>
&gt;&gt;&gt; +++ b/meta-networking/recipes-support/mctp/<a href=3D"http://m=
ctp_2.0.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.0.bb</a><br>
&gt;&gt;&gt; @@ -5,9 +5,9 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4=
cc91856b08b094b4f406a29dc61db21&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -SRCREV =3D &quot;f110926b082731b25720b444378ad55d7a9d451d&quo=
t;<br>
&gt;&gt;&gt; +SRCREV =3D &quot;089dc53fa7387cca517cd713061c323ca06fb6dd&quo=
t;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/CodeCons=
truct/mctp;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps</a>&quot;=
<br>
&gt;&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/CodeCons=
truct/mctp;branch=3Ddev/cross-fixes;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/CodeConstruct/mctp;branch=3Ddev/cross-fixes;prot=
ocol=3Dhttps</a>&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--0000000000009dff7c06253a347f--

