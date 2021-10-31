Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B143C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 20:57:35 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.35929.1635713854876507759
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 13:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TN6h/NSk;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 75so15443201pga.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KdDVyzI2eOg8wQ4nZYGTxbtOLo1lnK/va9H/pxWaMWY=;
        b=TN6h/NSkhyPWZ3NUvHm3VcOK13gE8HV64Z1FRfV95+8akvAVdL5PIC0FHo8crJBWLp
         Z32DdOnlv5OcRFvmROnJWf9Tx2WookX5h8chmAh7CV0F1UeGjOt/gqjsa8im6Y/Q2Hkd
         21i13d6N/0bDRfYVZw2lh0F/4ZAcN4Z72AmH39XXVjXmYI14onb752jF12Kd2oZ/QW6r
         Fq/ljpZRxKRxQwJKFCoV/Llt2dDT06A3p7rnRvMcTRJdep+A4rlvHRj+oIZvSJk8jp3F
         ndzJPpJNFOOz05fdLj0xJeqj3U1+nYtSZ5MJR/MGY/GfGXE2MxFJsGOb8D/85VKnnIu+
         hOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KdDVyzI2eOg8wQ4nZYGTxbtOLo1lnK/va9H/pxWaMWY=;
        b=sHkeqTM4g4ATc6zWREAqaDRlk1B5PyGpWZa2tdE7jIiliJl8bC5GZPVq3NGVnHzsqb
         F/sdRTnS+t0kIlkbxawD48Vncc99tSV+12x7VEa9buVSVUjydn/wU7sMwflJp6WkLQqR
         Nm82DfQ7cr51pUtrIFhcQCmqPmGmh3ofdbiSx7tgaxJeu0VNus9N2mY1y8ZQ6cKzGRQG
         Hv6H2lrw9xRNl5GWJg4A5PrJY4q+ZiTcbswfB5L0e5DoEWB0AWJD9GY36x+3U48dzLVA
         apksdABYgn2TYFfZS1R+9+WdlhCLMnDQfemaRdIvvUmhsHJaMsg49cTWRs5jZTmg450D
         dX5A==
X-Gm-Message-State: AOAM530KV5z09Dpvb6+ph87umBlXmMHaE+QgO3WLiR82woC1IBC30FPZ
	d14/ZNYFpg7GFD9tBySOrujja0/fTH68BLT3SAE=
X-Google-Smtp-Source: 
 ABdhPJz3RZVEwPbWj8qsn6fKfzqG6Yh0jaCf+M1SLntBzQK+jzURA2tlpqFjrMXgoJeIJTnpn6pVPjebEdO/+Vjye2o=
X-Received: by 2002:a05:6a00:1681:b0:46f:6fc0:e515 with SMTP id
 k1-20020a056a00168100b0046f6fc0e515mr24248986pfc.11.1635713854188; Sun, 31
 Oct 2021 13:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <1a982ca4-a237-d4c7-bc1d-ae3669f3dd0f@gmail.com>
 <CA+chaQe6wMKxfRqq9GcP++d8nRtpBw+iWBSewN5QzwvfeBoe3w@mail.gmail.com>
 <e2c81c9e-7862-61c7-3f19-199e90adf800@gmail.com>
In-Reply-To: <e2c81c9e-7862-61c7-3f19-199e90adf800@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 31 Oct 2021 21:57:23 +0100
Message-ID: 
 <CA+chaQfyUxcxhCryhbN12WwSzn-2CBgD8er7o_Z9sowq+i6JpQ@mail.gmail.com>
Subject: Re: [oe] dunfell-next merge request Oct 19th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003bae3c05cfac4f22"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Oct 2021 20:57:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93683

--0000000000003bae3c05cfac4f22
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 31, 2021 at 9:04 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 10/31/21 11:30 AM, Martin Jansa wrote:
> > FYI: The same is now needed for hardknott as well after last
> > oe-core/hardknott update.
> If you mean the gattlib, yes. That is in
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut


Yes, just the 2 commits in this pull-request, not the parent commit. Thanks.


>
> or do you mean tcpdump?
>
> -armin
> >
> > On Tue, Oct 19, 2021 at 5:22 PM Armin Kuster <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     The following changes since commit
> >     3cf22d15885cf0e3e16078705e9a20f3d21f12db:
> >
> >       tcpdump: Update CVE-2020-8037 tag (2021-10-01 14:49:10 -0700)
> >
> >     are available in the Git repository at:
> >
> >       https://git.openembedded.org/meta-openembedded
> >     <https://git.openembedded.org/meta-openembedded> dunfell-next
> >
> >     for you to fetch changes up to
> >     814eec96c2a29172da57a425a3609f8b6fcc6afe:
> >
> >       gattlib: Place pkgconfig file in correct package (2021-10-14
> >     13:57:41
> >     -0700)
> >
> >     ----------------------------------------------------------------
> >     Konrad Weihmann (1):
> >           gattlib: remove includedir from base package
> >
> >     Richard Purdie (1):
> >           gattlib: Place pkgconfig file in correct package
> >
> >      meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> >     <http://gattlib_git.bb> | 4 ++--
> >      1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#93471):
> >     https://lists.openembedded.org/g/openembedded-devel/message/93471
> >     <https://lists.openembedded.org/g/openembedded-devel/message/93471>
> >     Mute This Topic:
> >     https://lists.openembedded.org/mt/86442364/3617156
> >     <https://lists.openembedded.org/mt/86442364/3617156>
> >     Group Owner: openembedded-devel+owner@lists.openembedded.org
> >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-devel/unsub
> >     <https://lists.openembedded.org/g/openembedded-devel/unsub>
> >     [Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>]
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--0000000000003bae3c05cfac4f22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 31, 2021 at 9:04 PM akuster80=
8 &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@=
gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
<br>
On 10/31/21 11:30 AM, Martin Jansa wrote:<br>
&gt; FYI: The same is now needed for hardknott as well after last<br>
&gt; oe-core/hardknott update.<br>
If you mean the gattlib, yes. That is in<br>
<a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log/?h=3D=
stable/hardknott-nut" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Dstable/hardknott-nut</a></b=
lockquote><div><br></div><div>Yes, just the 2 commits in this pull-request,=
 not the parent commit. Thanks.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
or do you mean tcpdump?<br>
<br>
-armin<br>
&gt;<br>
&gt; On Tue, Oct 19, 2021 at 5:22 PM Armin Kuster &lt;<a href=3D"mailto:aku=
ster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">a=
kuster808@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The following changes since commit<br>
&gt;=C2=A0 =C2=A0 =C2=A03cf22d15885cf0e3e16078705e9a20f3d21f12db:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tcpdump: Update CVE-2020-8037 tag (2021-10-0=
1 14:49:10 -0700)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 <a href=3D"https://git.openembedded.org/meta=
-openembedded" rel=3D"noreferrer" target=3D"_blank">https://git.openembedde=
d.org/meta-openembedded</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.openembedded.org/meta-op=
enembedded" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/meta-openembedded</a>&gt; dunfell-next<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0for you to fetch changes up to<br>
&gt;=C2=A0 =C2=A0 =C2=A0814eec96c2a29172da57a425a3609f8b6fcc6afe:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gattlib: Place pkgconfig file in correct pac=
kage (2021-10-14<br>
&gt;=C2=A0 =C2=A0 =C2=A013:57:41<br>
&gt;=C2=A0 =C2=A0 =C2=A0-0700)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---------------------------------------------------=
-------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0Konrad Weihmann (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gattlib: remove incl=
udedir from base package<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Richard Purdie (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gattlib: Place pkgco=
nfig file in correct package<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-connectivity/gattlib/<a href=
=3D"http://gattlib_git.bb" rel=3D"noreferrer" target=3D"_blank">gattlib_git=
.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gattlib_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://gattlib_git.bb</a>&gt; | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 2 insertions(+), 2 deletions(=
-)<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#93471):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-devel/message/93471" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-devel/message/93471</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93471" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93471</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/mt/864423=
64/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/mt/86442364/3617156</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/86=
442364/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/86442364/3617156</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-devel%2=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-devel%252=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel%2Bowner=
@lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-devel/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=3D"_blank">Martin.Jansa@gmail.com</a> &lt;mailto:<a href=3D"mailto:Martin.=
Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--0000000000003bae3c05cfac4f22--

