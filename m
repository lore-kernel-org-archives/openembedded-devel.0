Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79DDEE369A
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:46:58 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62541.1770950812127409358
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nrK5s9kU;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7963b25e0ffso5842657b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 18:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770950811; cv=none;
        d=google.com; s=arc-20240605;
        b=d4bzVDCW7Cjpck4rELQiDz5hmbWf3W/VtiQLgqJTOIje0ZONsKSv3jhxmv5l4wBLSB
         ihHvGmwbMilkDcJ0EEjRuR+Bdhhv5FVUipvjA9lUFySkJ3cRTVpCrXWUwvWs3BNdumWN
         WuXnlYJLPi7vOjHx7WmfVq7o6xivUDbaoNOJtbNRPzHjFM6yQT1jx1XYLNpfzsproE9p
         G2Jed7UrZ6fHHntk44xwaFfUV+GxXk3MW6iHxaWEf0GbTnR4+66sg3REIXBpgeQvJhrY
         F7lkYdK0lz6ajJQ9r7ABtu9laf+7plD1QWSiB2xgOEl0KfRRUUd7yQ4cZkvvAVQfzME1
         k9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pNIpi3OvXmEhnlZ+t0SgEaRJLizM3/Dav4b1/pAVlNE=;
        fh=N0FNVbapGkDmEwVQd+q9HV3rUfK8py2ZR42cHsquY0s=;
        b=LuR0cOlGVUfPoyij5CWTNHnYU9fZvfO5KVne6jV8p+kluuI+vooNDZJRUUO5wlmPvQ
         HM4GmsJNyGVyOo5l5Mzf++yDa/cdYQmaxlBBltLrtwcX49cbJF9H23cI7SJGnYcUpWrg
         R6WUuc8+QfRBeWMSNBouvOfazsak6nB8zic90WhjxkoAQHkXL9MtTg6fS3qjVSwBP17B
         hksmonsxeG4McWjsdL6R6+DHNSifJEY8BaMlnSKBJflEGDTGKt/gdvfoKRtKwBVhigMb
         qybiPGHnK7Mo+9bFyr7YLjXxgC5qjCsUTlxJFKVF7EyEzfKI9mjrrc12WA8BFC6YBZM9
         aZIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770950811; x=1771555611; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNIpi3OvXmEhnlZ+t0SgEaRJLizM3/Dav4b1/pAVlNE=;
        b=nrK5s9kUtn1hIElimHyxXIszCNLQFDs5wfyWd4RnSBgA31cGBWxIeUrPJyuf9o1vTC
         yY2QkzFJPUlaKS8tXyMuQD7PXCTTQ3rFAOFqn4J1gHRW9lvPJPuYprCnm+8ndEeHSJFH
         XVT1X3N2BSJRhj/rAHR/K0+9XjndZfnlZrS/gmE9QDMKDbGOv3+nBqhWkGS4Rr7JW8aJ
         Bni2FwbLUBJNIyLI6T7GFVQgYZXH6nBt1KIU3n06b1B/MSbasiC2RP0+sy65CqQJCtb5
         eBCIdrPlx+fDtr5dyAO3gQpzSIKvV8HJoREzT26A9WutTNodYP4Iz+13BTCRQxP59H7D
         qu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770950811; x=1771555611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNIpi3OvXmEhnlZ+t0SgEaRJLizM3/Dav4b1/pAVlNE=;
        b=p1eooPioIdF6cpCQ37l70hs2tKAV+bNa//TCP8WAUdtP0mrdOpC1E+QL1A0kV0gbGX
         sw44mg/+eYEjzlUneBzWbIKt0lGymYVmMKigVjuZjIoqduqtsTO6HqxywOM/tkGKVZq9
         9TaHu/jE7zkgTt+w87tdzM28GrNMOp8D+l8Lhmw369mvr5B9UWKdk0tiqsPGkZ/OcD7Z
         9sOqTanj+O6SvOjyG87YiZYmBsSzHWUFbt6Aelx5q++xxvZ+F2m6xEWMIzNipibjBhkh
         aU4CwbiCimNLXfH7LISdkLTYm4OAnLATcxSXa6IrSeweY3GkqVVp3JLsQJ34V91tg4Zm
         xTuA==
X-Forwarded-Encrypted: i=1; AJvYcCV5BlWMyU7qkY0tWtC6BeARopekgUZvLiSl/6fE1dMTTAI3BqmuV/uv1AZcHJiJLOIdGI0HGw/UC+0x+x/1+jQ9BT0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGeTS4shcy5E31OTGKn/6XIanclKEotUtForKhNHS56aGsTkPj
	cr7taQCuwhGXlzOKln6C9J4cdL8P9iJ+BK65ykoxT5sADyAmGD1J3tOR1AahjjIZ/Si0Y9U9CHY
	udaf2WHzyYlpoWcwrtiBNwCSFJLy2k+M=
X-Gm-Gg: AZuq6aIRpWfXOkQZlBQnizP7xRT7dxSarjBG2nn6afIzJ1z1qmVRhotqxPEAOAlp9Dr
	ae5mdCO6nOJErC/KAs67OP8VAGek1pVQrpmvQr4BrDtu9tCwRzb8VMBJdNkj9gbqBg9Utt83I5B
	0bDKkTHECR3QabiDizfiB0ivAkOIE8YYoZYfnB+oTtMRguCYDi9U3xO5zXir3/CVqZWxH4waJ//
	bW8R8QplyPWcJioEFObqvTH8HXSb1YLIoI7xsS7Te0dRbjnLbWsz6vftjS5OzHwtFg2N4keRajT
	1Mc6VyPhMdrNAxnIMN3U2JZqDigwhxhREXfd78OmGOfZdB8gXlz2Z1vawmn0iVBpypptJykpZWM
	v1vGxbFD/+P45m0AVGxzcgUYO
X-Received: by 2002:a05:690c:dc9:b0:794:c679:1d1d with SMTP id
 00721157ae682-7979e803dc0mr9456177b3.24.1770950811188; Thu, 12 Feb 2026
 18:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20260212182929.8047-1-eric.meyers@arthrex.com>
 <18939BFE647A0E33.653184@lists.openembedded.org> <7814b942-6309-48eb-8151-658f107f1cb2@gmail.com>
In-Reply-To: <7814b942-6309-48eb-8151-658f107f1cb2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Feb 2026 18:46:24 -0800
X-Gm-Features: AZwV_Qi83Uwo2x2ts6Ekp2gzY8m0Tpw0Duzf6KREUwJW71YVZMQJJooPDPP10W8
Message-ID: <CAMKF1sogR_FXy3By7w9sKtH-rCzL5V1=rf1EoXs6wwHFocLssw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] redis: Remove debug paths to avoid
 TMPDIR [buildpaths] errors
To: skandigraun@gmail.com
Cc: eric.meyers15310@gmail.com, openembedded-devel@lists.openembedded.org, 
	Eric Meyers <eric.meyers@arthrex.com>
Content-Type: multipart/alternative; boundary="000000000000040295064aab9ea2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124373

--000000000000040295064aab9ea2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 2:39=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> On 2/12/26 22:09, Gyorgy Sarvari via lists.openembedded.org wrote:
> > On 2/12/26 19:29, Eric Meyers via lists.openembedded.org wrote:
> >> Takes similar approach to valkey recipe seen here:
> >>
> >>
> https://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c88=
1822beb9057162dc67ecb386
> >>
> >> Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
> >> ---
> >>  meta-oe/recipes-extended/redis/redis_7.2.12.bb | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> >> index 8abf758930..589ffd6fb2 100644
> >> --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> >> +++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> >> @@ -52,6 +52,11 @@ do_compile:prepend() {
> >>  }
> >>
> >>  do_install() {
> >> +    # Remove debug paths to avoid TMPDIR [buildpaths] errors
> >> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-benchmark
> >> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-server
> >> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-cli
> >> +
> > If I check the file type of these files, I get this:
> >
> https://gist.githubusercontent.com/OldManYellsAtCloud/5892bde7408475a93d2=
faa699ae65aea/raw/3309eb40e0467bd7e2a2bcbd540c822b071242d4/gistfile1.txt
> >
> > These are binary files, cutting out parts with sed will break them most
> > probably. I think this will need another solution (will take a look at
> > valkey also, if it has the same)
> >
>
> I have sent an alternative proposal[1] - do you think you could test it
> if works for you also?
>
> [1]: https://lists.openembedded.org/g/openembedded-devel/message/124363
>
>
yeah I think this would ensure that LDFLAGS behaviour prior to OE-core
change so I would
take the patch proposed in [1]


> >
> >>      export PREFIX=3D${D}/${prefix}
> >>      oe_runmake install
> >>      install -d ${D}/${sysconfdir}/redis
> >> @@ -71,6 +76,8 @@ do_install() {
> >>      fi
> >>  }
> >>
> >> +INSANE_SKIP:${PN} +=3D "already-stripped"
> >> +
> >>  CONFFILES:${PN} =3D "${sysconfdir}/redis/redis.conf"
> >>
> >>  INITSCRIPT_NAME =3D "redis-server"
> >>
> >>
> >>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124364):
> https://lists.openembedded.org/g/openembedded-devel/message/124364
> Mute This Topic: https://lists.openembedded.org/mt/117779563/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000040295064aab9ea2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 12,=
 2026 at 2:39=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2/12/26=
 22:09, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org" rel=3D=
"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On 2/12/26 19:29, Eric Meyers via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt;&gt; Takes similar approach to valkey recipe seen here:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/openembedded/meta-openembedded/commi=
t/1b820b98afd55c881822beb9057162dc67ecb386" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openembedded/meta-openembedded/commit/1b820b98afd5=
5c881822beb9057162dc67ecb386</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Eric Meyers &lt;<a href=3D"mailto:eric.meyers@arthr=
ex.com" target=3D"_blank">eric.meyers@arthrex.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a> | 7 +++++++<=
br>
&gt;&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/redis/<a href=3D"http://redi=
s_7.2.12.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a> b/met=
a-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">redis_7.2.12.bb</a><br>
&gt;&gt; index 8abf758930..589ffd6fb2 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a><br>
&gt;&gt; @@ -52,6 +52,11 @@ do_compile:prepend() {<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 do_install() {<br>
&gt;&gt; +=C2=A0 =C2=A0 # Remove debug paths to avoid TMPDIR [buildpaths] e=
rrors<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/src/redis-b=
enchmark<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/src/redis-s=
erver<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/src/redis-c=
li<br>
&gt;&gt; +<br>
&gt; If I check the file type of these files, I get this:<br>
&gt; <a href=3D"https://gist.githubusercontent.com/OldManYellsAtCloud/5892b=
de7408475a93d2faa699ae65aea/raw/3309eb40e0467bd7e2a2bcbd540c822b071242d4/gi=
stfile1.txt" rel=3D"noreferrer" target=3D"_blank">https://gist.githubuserco=
ntent.com/OldManYellsAtCloud/5892bde7408475a93d2faa699ae65aea/raw/3309eb40e=
0467bd7e2a2bcbd540c822b071242d4/gistfile1.txt</a><br>
&gt;<br>
&gt; These are binary files, cutting out parts with sed will break them mos=
t<br>
&gt; probably. I think this will need another solution (will take a look at=
<br>
&gt; valkey also, if it has the same)<br>
&gt;<br>
<br>
I have sent an alternative proposal[1] - do you think you could test it<br>
if works for you also?<br>
<br>
[1]: <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/124363" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/124363</a><br>
<br></blockquote><div><br></div><div>yeah I think this would ensure that LD=
FLAGS behaviour prior to OE-core change so I would</div><div>take the patch=
 proposed in [1]</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 export PREFIX=3D${D}/${prefix}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake install<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/redis<br>
&gt;&gt; @@ -71,6 +76,8 @@ do_install() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +INSANE_SKIP:${PN} +=3D &quot;already-stripped&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 CONFFILES:${PN} =3D &quot;${sysconfdir}/redis/redis.conf&quo=
t;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 INITSCRIPT_NAME =3D &quot;redis-server&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124364): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124364" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124364</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117779563/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117779563/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000040295064aab9ea2--

