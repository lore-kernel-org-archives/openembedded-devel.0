Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4C2C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:07:37 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.95663.1673633248304047421
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 10:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id s66so17661097oib.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 10:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTeCFrkM4TzeqFtc8kwuv7LjIvR9DK9dG4vhmTzB6gc=;
        b=eoZD1MF15bbHFDEdGv6LQXYcXdMGS+5uT1sC5kKxvxd0RH6R8fTQNudVJk1pBO7kRB
         CXDE8kg0YTjUOyxPBovptH1lvocQJMFjbIZDfsD0phLgZjMCV1jWpvse1/L+XkqIEeU0
         k8WqOoToNkftoyKD+PS0Ob33pLNT/Jbl/LKBYkhMX1bKpbJGjNIRg2fbPrBGbNRG+RdI
         BV65LTlwVUC9GAKd0P2Q1/vPNiyGdyi3MNy8cQZ3sa/MqNBXX/ftI95R5eBl8xLbxTNU
         9GwwJAkKFuj5Exfo9Zcp4p4ZMEDQGy2CTnGfrp88TUQGoqfwFS6WZN8mENH5WozNnejG
         m/ww==
X-Gm-Message-State: AFqh2kpN5VB9bBHmTp5U1120bDG7/cBUBrLZhn9mp6iWIFcM2zYR8qfr
	TiNG4c77KYPeQeJwIoKK0VvGic/qk4pu/g==
X-Google-Smtp-Source: AMrXdXtdxVkdBft8fmKIkAVijIjDI73CpfhtRgQ7hy3JCtrWwToQmGQDOqimtlYo5jMjxTF9HWNd0A==
X-Received: by 2002:aca:908:0:b0:35b:dc12:548a with SMTP id 8-20020aca0908000000b0035bdc12548amr35692226oij.39.1673633247353;
        Fri, 13 Jan 2023 10:07:27 -0800 (PST)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id w15-20020a056808018f00b00364747aafcasm3513182oic.14.2023.01.13.10.07.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 10:07:27 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1442977d77dso23106488fac.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 10:07:26 -0800 (PST)
X-Received: by 2002:a05:6870:6b0d:b0:14f:e12a:d6fc with SMTP id
 mt13-20020a0568706b0d00b0014fe12ad6fcmr4730354oab.51.1673633246701; Fri, 13
 Jan 2023 10:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20230113172727.2565686-1-alejandro@enedino.org> <CAMKF1sriKSe2VaH_gFTYDfL=Neg9kvWvY_2A-F9YKRPUwiFs3w@mail.gmail.com>
In-Reply-To: <CAMKF1sriKSe2VaH_gFTYDfL=Neg9kvWvY_2A-F9YKRPUwiFs3w@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Fri, 13 Jan 2023 11:07:14 -0700
X-Gmail-Original-Message-ID: <CAHMutrbuTtYcrD_q=ihC5vO4nJtL12xXM5ibfTa7w2YFaPni7g@mail.gmail.com>
Message-ID: <CAHMutrbuTtYcrD_q=ihC5vO4nJtL12xXM5ibfTa7w2YFaPni7g@mail.gmail.com>
Subject: Re: [oe] [PATCH] imapfilter: update 2.7.6 -> 2.8.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000027713b05f2291bd0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 18:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100571

--00000000000027713b05f2291bd0
Content-Type: text/plain; charset="UTF-8"

Oops, didnt see that, thanks Khem

Alejandro

On Fri, Jan 13, 2023, 11:04 AM Khem Raj <raj.khem@gmail.com> wrote:

> I have
>
>
> https://lists.openembedded.org/g/openembedded-devel/message/100507?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cimapfilter%2C20%2C2%2C0%2C96171776
>
> already staged in master-next.
>
> On Fri, Jan 13, 2023 at 9:27 AM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > - Changes in this release [1]
> >
> > - License checksum changed because dates got updated.
> >
> > [1] https://github.com/lefcha/imapfilter/compare/v2.7.6...v2.8.1
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../imapfilter/{imapfilter_2.7.6.bb => imapfilter_2.8.1.bb} | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.6.bb =>
> imapfilter_2.8.1.bb} (78%)
> >
> > diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
> b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
> > similarity index 78%
> > rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
> > rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
> > index eb23816e8..3ab87f498 100644
> > --- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
> > +++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
> > @@ -1,9 +1,9 @@
> >  SUMMARY = "IMAPFilter is a mail filtering utility that processes
> mailboxes based on IMAP queries"
> >  LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c11d4fd926d3ce7aac13b0ed1e9b3a63"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
> >
> > -# v2.7.6
> > -SRCREV = "b39d0430f29d7c953581186955c11b461e6c824f"
> > +# v2.8.1
> > +SRCREV = "e6372b88e09a4d1c573b57270de6b40846825a8b"
> >  SRC_URI = "git://
> github.com/lefcha/imapfilter;protocol=https;branch=master \
> >             file://ldflags.patch \
> >  "
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#100568):
> https://lists.openembedded.org/g/openembedded-devel/message/100568
> > Mute This Topic: https://lists.openembedded.org/mt/96250964/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000027713b05f2291bd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Oops, didnt see that, thanks Khem</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Alejandro=C2=A0<br><br><div class=3D"gmail=
_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 13, =
2023, 11:04 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I have<b=
r>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/1005=
07?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cimapfilter%2C20%2C2%2C0%2=
C96171776" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-devel/message/100507?p=3D%2C%2C%2C20%2C0%2C0%=
2C0%3A%3Acreated%2C0%2Cimapfilter%2C20%2C2%2C0%2C96171776</a><br>
<br>
already staged in master-next.<br>
<br>
On Fri, Jan 13, 2023 at 9:27 AM Alejandro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noref=
errer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; - Changes in this release [1]<br>
&gt;<br>
&gt; - License checksum changed because dates got updated.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/lefcha/imapfilter/compare/v2.7.6...v=
2.8.1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/l=
efcha/imapfilter/compare/v2.7.6...v2.8.1</a><br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../imapfilter/{<a href=3D"http://imapfilter_2.7.6.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">imapfilter_2.7.6.bb</a> =3D&gt; <a h=
ref=3D"http://imapfilter_2.8.1.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">imapfilter_2.8.1.bb</a>} | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/imapfilter/{<a href=3D"http://ima=
pfilter_2.7.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imapfilte=
r_2.7.6.bb</a> =3D&gt; <a href=3D"http://imapfilter_2.8.1.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">imapfilter_2.8.1.bb</a>} (78%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/imapfilter/<a href=3D"http://imap=
filter_2.7.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imapfilter=
_2.7.6.bb</a> b/meta-oe/recipes-support/imapfilter/<a href=3D"http://imapfi=
lter_2.8.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imapfilter_2=
.8.1.bb</a><br>
&gt; similarity index 78%<br>
&gt; rename from meta-oe/recipes-support/imapfilter/<a href=3D"http://imapf=
ilter_2.7.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imapfilter_=
2.7.6.bb</a><br>
&gt; rename to meta-oe/recipes-support/imapfilter/<a href=3D"http://imapfil=
ter_2.8.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imapfilter_2.=
8.1.bb</a><br>
&gt; index eb23816e8..3ab87f498 100644<br>
&gt; --- a/meta-oe/recipes-support/imapfilter/<a href=3D"http://imapfilter_=
2.7.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imapfilter_2.7.6.=
bb</a><br>
&gt; +++ b/meta-oe/recipes-support/imapfilter/<a href=3D"http://imapfilter_=
2.8.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imapfilter_2.8.1.=
bb</a><br>
&gt; @@ -1,9 +1,9 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;IMAPFilter is a mail filtering utility that pr=
ocesses mailboxes based on IMAP queries&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc11d4fd926d3ce7aac13b=
0ed1e9b3a63&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df8d2fc4954306888fd0e4=
b27bef83525&quot;<br>
&gt;<br>
&gt; -# v2.7.6<br>
&gt; -SRCREV =3D &quot;b39d0430f29d7c953581186955c11b461e6c824f&quot;<br>
&gt; +# v2.8.1<br>
&gt; +SRCREV =3D &quot;e6372b88e09a4d1c573b57270de6b40846825a8b&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/lefcha/imap=
filter;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">github.com/lefcha/imapfilter;protocol=3Dhttps;branch=3Dmaster=
</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ldflags.patch \<=
br>
&gt;=C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#100568): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/100568" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/100=
568</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96250964=
/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/96250964/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--00000000000027713b05f2291bd0--

