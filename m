Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F306FD0048
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 00:32:03 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.130529.1772325117135289481
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 16:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYziQsoj;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae222d87dso2960314d50.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 16:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772325116; cv=none;
        d=google.com; s=arc-20240605;
        b=I2OR9A91C9VceUe71479n4Y2Cw41ydu4F5ANcEMzxs75q6jYWPWjRlvyx1aypTIewZ
         IqPUQ+ZMBTRpDHYtGSMERpFhPubqOa9oJS++I9ySMrO74Zj3EiYOlLEgxrPh76bhMVYf
         KSV48W4Z5QJbsNLWsgTFFVZl+2gN892fDDhTGUp83Ol+KNsZQrUjScC6oxydz22dBpuF
         mY33gw20dJormicjmm8xNSXi3/3Ybp5woTklIOOJ+1Q9ihGPDkX4Ywh4o7OeWtdprrcp
         va75NTp5ZaX91tHWOoZn1NrzbhbWMtQ1OR/I2O+cXo7eBR3OF7bX/dbmsPEDlbCkXe/s
         RA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9vdA4ddLYYFHhMuHLaXDi6Upr98IYl2VIyL2PI1OKcg=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=InJqmcaIo9q4MVbt0Oml8HslQiR1allcbR47aUTSwJF+QNiVQEMbCTWxLqFZ/K6m+1
         6kiwMQT/OzBcd8y+e4WA6GpX/LDTfeCbgPOFLIySXehf7/IbEI1xMRRPstNBTP8+gvDM
         R7Y7pYOgJpF5tAwh3u96xUy39/dU0HB8KI/SktLocz7sJHqQoOhanlDIJFORY0q+TqZb
         Ne+IhFQFG/Lj/j0xVnu7mVoTuWOH+aY4kByVSzjnesltZ3ImRhWLv7m9/vS1b+/kVLmE
         I/dKISsWjAXYBHqrqrZERjmlJc9Sgw4q7UJZBERz5kvQGRYtJx2DvHTdOiJ4RMZf7s73
         i6pQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325116; x=1772929916; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vdA4ddLYYFHhMuHLaXDi6Upr98IYl2VIyL2PI1OKcg=;
        b=PYziQsojhX7p0FsBXdmlrai/w8Wr/qpy3aVxc3PMtrbbd06ZEa16jTJfIPNJOFO83I
         Kw3Z/m41jmjBrQGrvDja9ytw9fko3uYELLnIktVKS2hsvfdMp+w6IqqKjiw7EsfeRrPz
         cIAec/5vtMietA7J/A07NgQaYuQ2L82pNjgVGmnqRGiMnchNyriTQt7KhpHHUJBDmWiH
         0ezfbw9AXOR4aVx1yW9CVndfvx6FSA14oSrx6QQ8lfRdbRy0sBGycs0UxhouWdZjNfER
         DvQsBZUNXr/hYABGplZvVuYrnux7vPirnF0Cm1VlXO7Ms0H1tYyG/woiUb6xll+VZU30
         IBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325116; x=1772929916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vdA4ddLYYFHhMuHLaXDi6Upr98IYl2VIyL2PI1OKcg=;
        b=ZoCOmOEtCt2z5zdE5OAQxaLVYRT+shlPU06JD8To8VAjNZxb/ZTGki68wVQ72xFYRY
         4jkdtbyikcrdvHKGQxuucuDucV7EIxjTllOAiKWporfj4YRtR61tlqPw2aROBrk7wqNn
         A3NKqRuZvtbwGFKN2MjaXNU2QF5aXECO2V0SXbJjeO83YGj4xUPNfApSRudgn37Bg2LO
         mrFsvrSTRIiyBnSjYRIsNVdMOo5OZh4vur2aJBBWH/W4J37Aepc44d1C4J+Jo9rax2NI
         o1Ih7XEyCF5hQ0WEYoIEtIBzfsfQ8tE2ZIDXb9FaAFJ3bqr4IfZtKzw/lnsnyYlrgjnu
         Y3MQ==
X-Gm-Message-State: AOJu0YwF7UZZwAGxWyvG4ykDJxR9Nvp9x+1doNeWvlxEthk9ApGFUIJO
	BkKheCE0GV2mH0ezva+mkyfkHjmqLeJXYlyooHg3A6WB9OhyGtA9RcvG3wfW8CGEsalziGhwndq
	4ZCj8050M51r4SqvaVcVmfnJg3XsvRCE=
X-Gm-Gg: ATEYQzwpgAELHHT60Bqn4WkofIwXY9y/NdJeAJCrdDd/Uf1VlU7/Eu1kQ3sajGz1kCr
	wu0CA7Pchi9N8z3caMhq/bUsfdQjOyhYKVvkBD93wegP6l+tHRoPBtwfPuXwQwVMpFPchToaxQi
	Tp81g6KVxsXDZFeUTDSx/Z+SQSvVDqEut+UVaSf5z/uMYGnpaS5GdAkgWxS2qSgUQ2EwDyA/4+x
	ZKZ98991hTLlsCcLLn6xNIaSt84hEqXff39KmHSWoKqKn8OtC2gnkvFUg3KKFn8FFnq57Hhvn25
	BvUzgZy/OTAdJFLTKrKE+ORX7cLWK8p4+AoR1Zq26eFq1O2t526Dzl/QgHhD550JwntAzzC8fwh
	qsIiFkdCaMaz0ba2Yvec0d29m
X-Received: by 2002:a53:ecca:0:b0:64c:c616:c356 with SMTP id
 956f58d0204a3-64cc616cab3mr4164799d50.35.1772325116143; Sat, 28 Feb 2026
 16:31:56 -0800 (PST)
MIME-Version: 1.0
References: <1891222EDB0CC87A.3765343@lists.openembedded.org> <3164964e-458a-4a0d-845a-07ad46328a81@gmail.com>
In-Reply-To: <3164964e-458a-4a0d-845a-07ad46328a81@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Feb 2026 16:31:27 -0800
X-Gm-Features: AaiRm50KHMO5SLKOA8WTFfwjfXIQenDAMcZq7hTC5CtxQQZ9E39W_g7v_pGvpzY
Message-ID: <CAMKF1srOGjL0RxXOa9gtcnm-HW5=n5P2hoc2xfaacCZL7pwzsA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] live555: set CVE_PRODUCT
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f96e33064beb98cf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 00:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124791

--000000000000f96e33064beb98cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

staged in master-next thanks for the reminder.

On Sat, Feb 28, 2026 at 12:26=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> ping
>
> On 2/4/26 20:35, Gyorgy Sarvari via lists.openembedded.org wrote:
> > live555 is an old project, it has multiple CPEs associated with.
> >
> > Set the ones in CVE_PRODUCT that are still active.
> >
> > See CVE db query:
> >
> > sqlite> select vendor, product, count(*) from products where vendor lik=
e
> '%live555%' or product like '%live555%' group by 1, 2;
> > live555|liblivemedia|1
> > live555|live555|7
> > live555|live555_media_server|2
> > live555|media_server|1
> > live555|streaming_media|160
> >
> > All of them are relevant to this recipe, although media_server hasn't
> been used since 2007,
> > that one wasn't set.
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  meta-oe/recipes-multimedia/live555/live555_20210824.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> > index 1622a97fe1..cd738f9575 100644
> > --- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> > +++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> > @@ -13,6 +13,8 @@ URLV =3D
> "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
> >  SRC_URI =3D "
> https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz \
> >             file://config.linux-cross"
> >
> > +CVE_PRODUCT =3D "live555 live555_media_server live555:streaming_media
> live555:liblivemedia"
> > +
> >  # only latest live version stays on
> http://www.live555.com/liveMedia/public/, add mirror for older
> >  MIRRORS +=3D "http://www.live555.com/liveMedia/public/
> http://download.videolan.org/contrib/live555/ \n"
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124790):
> https://lists.openembedded.org/g/openembedded-devel/message/124790
> Mute This Topic: https://lists.openembedded.org/mt/117641158/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f96e33064beb98cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">staged in master-next thanks for the reminder.</div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Sat, Feb 28, 2026 at 12:26=E2=80=AFPM Gyorgy Sarvari via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;skandig=
raun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">ping<br>
<br>
On 2/4/26 20:35, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; live555 is an old project, it has multiple CPEs associated with.<br>
&gt;<br>
&gt; Set the ones in CVE_PRODUCT that are still active.<br>
&gt;<br>
&gt; See CVE db query:<br>
&gt;<br>
&gt; sqlite&gt; select vendor, product, count(*) from products where vendor=
 like &#39;%live555%&#39; or product like &#39;%live555%&#39; group by 1, 2=
;<br>
&gt; live555|liblivemedia|1<br>
&gt; live555|live555|7<br>
&gt; live555|live555_media_server|2<br>
&gt; live555|media_server|1<br>
&gt; live555|streaming_media|160<br>
&gt;<br>
&gt; All of them are relevant to this recipe, although media_server hasn&#3=
9;t been used since 2007,<br>
&gt; that one wasn&#39;t set.<br>
&gt;<br>
&gt; Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.=
com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-multimedia/live555/<a href=3D"http://live555_202=
10824.bb" rel=3D"noreferrer" target=3D"_blank">live555_20210824.bb</a> | 2 =
++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-multimedia/live555/<a href=3D"http://live=
555_20210824.bb" rel=3D"noreferrer" target=3D"_blank">live555_20210824.bb</=
a> b/meta-oe/recipes-multimedia/live555/<a href=3D"http://live555_20210824.=
bb" rel=3D"noreferrer" target=3D"_blank">live555_20210824.bb</a><br>
&gt; index 1622a97fe1..cd738f9575 100644<br>
&gt; --- a/meta-oe/recipes-multimedia/live555/<a href=3D"http://live555_202=
10824.bb" rel=3D"noreferrer" target=3D"_blank">live555_20210824.bb</a><br>
&gt; +++ b/meta-oe/recipes-multimedia/live555/<a href=3D"http://live555_202=
10824.bb" rel=3D"noreferrer" target=3D"_blank">live555_20210824.bb</a><br>
&gt; @@ -13,6 +13,8 @@ URLV =3D &quot;${@d.getVar(&#39;PV&#39;)[0:4]}.${@d.=
getVar(&#39;PV&#39;)[4:6]}.${@d.getVar(&#39;PV&#39;)[6:8]}&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://download.videolan.org/pub/c=
ontrib/live555/live.$%7BURLV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank=
">https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz</a>=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://config.linux-cro=
ss&quot;<br>
&gt;=C2=A0 <br>
&gt; +CVE_PRODUCT =3D &quot;live555 live555_media_server live555:streaming_=
media live555:liblivemedia&quot;<br>
&gt; +<br>
&gt;=C2=A0 # only latest live version stays on <a href=3D"http://www.live55=
5.com/liveMedia/public/" rel=3D"noreferrer" target=3D"_blank">http://www.li=
ve555.com/liveMedia/public/</a>, add mirror for older<br>
&gt;=C2=A0 MIRRORS +=3D &quot;<a href=3D"http://www.live555.com/liveMedia/p=
ublic/" rel=3D"noreferrer" target=3D"_blank">http://www.live555.com/liveMed=
ia/public/</a> <a href=3D"http://download.videolan.org/contrib/live555/" re=
l=3D"noreferrer" target=3D"_blank">http://download.videolan.org/contrib/liv=
e555/</a> \n&quot;<br>
&gt;=C2=A0 <br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124790): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124790" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124790</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117641158/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117641158/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f96e33064beb98cf--

