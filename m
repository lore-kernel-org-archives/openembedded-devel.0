Return-Path: <ninette@neighbourhood.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971EDC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 17:44:27 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.56575.1720028663122375383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 10:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=3B3s9tlg;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.43, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a77b4387302so3227766b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720028661; x=1720633461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BceLGDSyDXbOQbxQKfd1EnSXFxHjU+kgcN/IH7RZwNU=;
        b=3B3s9tlgBMlDnLwphoBmC6Xe6Z3anaxl9BW4JQ/ts4rC9cryqyNWbzLjdI3CJGyV37
         cXa9QKa3luKYj3AQQTBvNKKbjlypKBmqBVyXnANAlpSFpr7UP9APd90bGWhXzjFoGKVl
         FvpzxWChpOcUnkb6UbYT9CJS1pj+r/ayJOcd7ipSSMUZ/De+dzTpO/jkzkJvPYmxVgNT
         eYE24wTcRZpd/HCK44rxUPiaZOwGsSMK5H3KxTnQvbjPZPkJfBdT/4vGLDb4tOPWiy4t
         A9BwlTct10cNWCWSsZYv2YDAr0+cAxQIzyPZ+M4MwQoxYyNO4yvQVa6+fFCTHZLNOFHk
         /zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720028661; x=1720633461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BceLGDSyDXbOQbxQKfd1EnSXFxHjU+kgcN/IH7RZwNU=;
        b=ieh6Gt/GfgVViwXWCwBbYwBcYHYaFd27pUzpBX6kK8sXjMS1RGtphnpOac9rFzX0tn
         Pbnili2+M74IfB9DgBziWag4pwSYdTYW+cfmKrbY8tXcKkiniFJgClTMPk4nlsE0omde
         wlUwYurX2I3JX2qRKlw5NxlF/d+nuiz2qhoFadfMZsWeJ40vjg8OCJZUpDealDOellMN
         vy49K5wf8N/EtHvzuUeskqqJUqvFIYah26Pd849ZZKvMKFYq2V7x42K2RUSf5A3BEGDK
         6aX63f49xUYzI/FnKYEWKIVmkzzYhB4y0NtqtC0FYd31bObNPbkc+cOzlUWUxNoNPj8L
         qHqA==
X-Gm-Message-State: AOJu0YxaR/+iYdT/+b6S9MKAx5hJXpsbQs+2GLfDrop2D+8QeYa2rUym
	bpa4iWXKsHDMsBf2N1olAvz2hq7KWJ6Yy2svJSn3EwIUT/11KckfUZUvIdJERoCtHv+f0vfqlmW
	AbOwT/ZdM0+bvagJsUvczSupW0nFlwER18chKnA==
X-Google-Smtp-Source: AGHT+IESArTo0vemdT1TZ9md1x41jJGFoolApAusEqXtKgzrSMSmoF8SzLBwxCx1EmoyV9Z0rc4XJX7F/wy+rRcche4=
X-Received: by 2002:a17:906:f289:b0:a77:b3f7:2757 with SMTP id
 a640c23a62f3a-a77b3f7289fmr5236666b.50.1720028661073; Wed, 03 Jul 2024
 10:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240703164042.20929-1-ninette@thehoodiefirm.com> <CAMKF1soc6CDz51w76z+jbK4Py-xRpjZJi48mksyJw1Y65teSAw@mail.gmail.com>
In-Reply-To: <CAMKF1soc6CDz51w76z+jbK4Py-xRpjZJi48mksyJw1Y65teSAw@mail.gmail.com>
From: Ninette Adhikari <ninette@neighbourhood.ie>
Date: Wed, 3 Jul 2024 10:44:09 -0700
Message-ID: <CAG1aeW1Q5QoWcNRUZGYLPpO0L7Q0jFErxEV260iQffPV=mfEPg@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/1] apache2:apache2-native: CVE status update
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, engineering@neighbourhood.ie
Content-Type: multipart/alternative; boundary="00000000000058e151061c5b616c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 17:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111236

--00000000000058e151061c5b616c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,
This is meant for the 'master' branch. It is a status update for some CVEs.
I'll make sure to include the branch name in the subject for future
patches. For this patch, do I need to resend it with an updated subject
line? Please let me know. Thanks so much!

Ninette

On Wed, Jul 3, 2024 at 9:49=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:

> which branch is it for ?
> Please mark it accordingly in subject line see -
>
> https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#s=
ubmitting-changes-to-stable-release-branches
>
> On Wed, Jul 3, 2024 at 9:40=E2=80=AFAM Ninette Adhikari via
> lists.openembedded.org
> <ninette=3Dthehoodiefirm.com@lists.openembedded.org> wrote:
> >
> > Update status for: CVE-2007-0450, CVE-2010-0425
> >
> > The current version (2.4.59) is not affected. It only applies for
> Windows.
> >
> > Ninette Adhikari (1):
> >   apache2:apache2-native: CVE status update
> >
> >  meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > --
> > 2.44.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111229):
> https://lists.openembedded.org/g/openembedded-devel/message/111229
> > Mute This Topic: https://lists.openembedded.org/mt/107022825/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000058e151061c5b616c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Khem,</div><div>This is meant for=
 the &#39;master&#39; branch. It is a status update for some CVEs.</div><di=
v>I&#39;ll make sure to include the branch name in the subject for future p=
atches. For this patch, do I need to resend it with an updated subject line=
? Please let me know. Thanks so much!</div><div><br></div><div>Ninette <br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Jul 3, 2024 at 9:49=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">which branch is it=
 for ?<br>
Please mark it accordingly in subject line see -<br>
<a href=3D"https://docs.yoctoproject.org/dev/contributor-guide/submit-chang=
es.html#submitting-changes-to-stable-release-branches" rel=3D"noreferrer" t=
arget=3D"_blank">https://docs.yoctoproject.org/dev/contributor-guide/submit=
-changes.html#submitting-changes-to-stable-release-branches</a><br>
<br>
On Wed, Jul 3, 2024 at 9:40=E2=80=AFAM Ninette Adhikari via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;ninette=3D<a href=3D"mailto:thehoodiefirm.com@lists.openembedded.org" t=
arget=3D"_blank">thehoodiefirm.com@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Update status for: CVE-2007-0450, CVE-2010-0425<br>
&gt;<br>
&gt; The current version (2.4.59) is not affected. It only applies for Wind=
ows.<br>
&gt;<br>
&gt; Ninette Adhikari (1):<br>
&gt;=C2=A0 =C2=A0apache2:apache2-native: CVE status update<br>
&gt;<br>
&gt;=C2=A0 meta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2_2=
.4.59.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.59.bb</a> | 2 ++=
<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; --<br>
&gt; 2.44.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111229): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111229" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/111229</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10702282=
5/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107022825/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>
</div>

--00000000000058e151061c5b616c--

