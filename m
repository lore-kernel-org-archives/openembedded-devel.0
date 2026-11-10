Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15149.1794296871252795042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=S7o/3MPE;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67be9601f31so1645851d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 23:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794296870; cv=none;
        d=google.com; s=arc-20260327;
        b=hioKJBIr+AZrRO068brMDLCT3JmobvGubtdomQgIil8k1y3VfPE+R2NccUdwUHO4v5
         SbdC3Q6r+QihPp+BvtsaWXk9sL5vnblQefznMEKIyi9ggwdYZbzlz8Dlgdu6PDHVS0c/
         TAsu1qfARzqIdLiaJyk3+HT4wg2FSF0VXxUdEkg3+AK3jXxwE2PqDixrPSVstxayq4Nu
         6QmdRZrc6zzyeV5TTUB4EREZmH8URFvuBJjdmPZSLcJtXH4VQlpPQSxXDmxoX07sXWXL
         /IircAPNGEeQQwIU2x/yWNCfz99e+c9wmJoTwXjn/XhY9dGYyYEgAgBk+A8r2uiN5vvw
         xqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IFTikBdx24tuQ2NZsgX2bNTqL4GhCWqw4XFY7ebucFU=;
        fh=VD2Xf9JlQuLMcCcvtuDQCLVYdA4ERSFPUZnFrsdABUE=;
        b=oUKvfsRUpYr2zlFoPXLQ/UyScc9aosWZ1CpDPLWw5CyVjF69FaMMMV/bUO7UY13W63
         BqGNOu5aR41m9wPDzjAzWOqOk6fAanljOzSn/WCfuRV3BvO/1D7uXOdYyN2szd99Ngyp
         RXXg3eMd/AuTsiONnPzEUPOQ6qz4beVCA70Db5ZSEI5x1VCMBDSATjZmIPktCJEvVpVq
         GE1wAlA3qFkxplozUoOxNSlCVxzWUoi7Xexxq1y19fh2cV7FewOVJI7WwYD1bL2h0Kje
         ixuwtHL9JKc/9XivoUOXB5hId1mb+LRFl2VeMWDw1iSqoL4vqTGWqQqrYht/vozupzLl
         PI5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296870; x=1794901670; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFTikBdx24tuQ2NZsgX2bNTqL4GhCWqw4XFY7ebucFU=;
        b=S7o/3MPEVKpcD459GstDJ+tYK8nIel1jjgKobejk4HjdxcKgr9mGvbZ+3aDieLE6yC
         25Di9TF8M26ouLoyA2lw6g2Wcth+krgqMI+b1GiEocmpwJvyovBGHH/bWwIBSB3BEZhZ
         RGws0TEGLKfBFnJCfBlLFNSN24VZSYGK6mY2Tet8zRR4RYQMWR+phWnn1e+FjXvaHOZ3
         Fb343duY9edkSRexABgvycwFZmmYkAP5ZCVb1FZOVDLgPtViOLpXEqOiMJC5wHLgHhPz
         xwV5kqBsbOvW9D1ieuQ6J0zQyp2kLW7uwlZnc5KHEO/fEfkweY2ntxK5E4C+fdmzEqOS
         N7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296870; x=1794901670;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IFTikBdx24tuQ2NZsgX2bNTqL4GhCWqw4XFY7ebucFU=;
        b=TnVqTVyoOwvy465dBJwPuPabNvDinYjoi95s8IaM6X0tSpccXU5kP17PiFAodqhOu2
         PXOB5Nl4KlPEij5KLqroDbm/UemMusVbBFc7EQSptafF8AFfF6lsY4XiaCme5/K4xuFY
         1+eQJz9tbszMvsOakzcl+fYiHiA/waEZ4iparu4PtwPi2jiA8WANITJVvxvZxssb3p3Z
         YmuUxXlrpmQ5YA2JRPRBwFfZVBRtMA6Beuf2YCMniAeqaNeptpe7RbCIAxpnfYujbMWJ
         uUrFUzBWQHMpxgrkoq3UqX7ZWIsCzvaUZT28+P12Zbdnw4RJGIzQsbjc/Ip9LPmNSoSL
         NB1Q==
X-Gm-Message-State: APuU4Z86mhKWeOZF3JjzM6piZV6s2d7BSwllTmaTbM1cgq2laYZaBt2/
	Q9EHAb19t4taZ/zmY1YiWidsJ58p7TUluTUEf78nzI75WKlI6+Z4kwXdbtb42FAIHZ5hxmVfDmT
	RkV9KGdr0G4bCCrt2csj0fj+UDSTpEkuwWg==
X-Gm-Gg: AYBFou0gQyM8yl3BsV24IGe0SfOhLdXPq5YHbX4+OUZI//3wh/rYx2M3eehPnhs3hy4
	TI8QoMe25S/Vh2T7vijlOyt/C+yQ/hAzil2skwgO+O3t5Yqwhcog9Kct+cqapv0KQnUqXyNUxOu
	+zFOrv8onWgvjB28N73L8OENif/IWroTpOwrrtl3xzqRSzZySNbPsqTPdBr2YBsY1kOPTkLXQCa
	wvJMgU7MIYTWsffQ7srfQq7+MGE5xna8bgTzXqO83YHLIGlnyV0sYOD65lqLvyww2dZJl+h6/q/
	EJk4JpOLGKs9AgNbMeZIBSyfZPNggVhm2XfPAEnrLkEXbOY0CsYbav8kgvmTI/NuOpv7bSgFP/D
	LkxbeGbCEtIWNEBFpKbs0J3nNzbpPBvM25wDFy1I/+iLpxa/4iKyhDGPZ6xEsueNaF+eKxwcHf6
	eMSApo/5YeJV/qH+3fBlDdECOe6Rhdj+k2EbzjeT7Hawan+m7GRCu3d7BcKoslzz0r27MmwzRyR
	taE95PQukGGaMoNFzChhTPi6Da/w63p1jc3OqjRawTgN3dkx+YoZjw+KkLR+yoZiIRPBuwoN+H+
	SlwCASaMhF2rqWxIFBpG54prwPmxcULekqGpl+IFrykYdHuQxi39D2G3tSSB5lAnmbwTLYw2QTw
	ga0UWQ2HgIgd0MvNFTPFrJHLMvaZRI1jiQc/Od5G8Uif8
X-Received: by 2002:a05:690e:1382:b0:679:cc49:55c4 with SMTP id
 956f58d0204a3-67c568829camr1014693d50.78.1794296870151; Mon, 09 Nov 2026
 23:47:50 -0800 (PST)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.60c45970-bf59-4753-942e-e3561e9c5a75@emailsignatures365.codetwo.com>
 <20261109081800.69803-1-mike.looijmans@topic.nl> <CAMKF1soWj4FYR=Kq-mMRXjMnUzMkztdO9Epss9D61RWPE5nS0g@mail.gmail.com>
 <eedf7b3e-36c7-49b0-bea2-2abbe74026a7@topic.nl>
In-Reply-To: <eedf7b3e-36c7-49b0-bea2-2abbe74026a7@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Nov 2026 23:47:23 -0800
X-Gm-Features: AclHuK-2wsPs6AR2W3RLnY1_RExEiSyCrXOszP3OVnGOVgwp_RUvqGUxSCHplj0
Message-ID: <CAMKF1spaQc--uVEevw2S4vrKJd5wSMSSOYxzv5aOEsb+SqLqKQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/4] Apply the mongodb patches from the scarthgap
 branch, which is ahead
To: mike.looijmans@topic.nl
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091296d065fe74bf1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132070

--00000000000091296d065fe74bf1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:02=E2=80=AFPM Mike Looijmans via openembedded-dev=
el
<mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:

> I know, I also wrote in the description (second line) that it wouldn't
> build.
>
> But at least this brings it up to the "scarthgap" level. It's weird to
> have to start several commits behind the previous LTS.
>
> I have a workaround for  the pkg_resources error, but that's still not
> enough...
>

I have sent a patch which addresses bunch of these issues.I wonder if we
should
upgrade mongo to latest release as well.


>
> Mike.
>
> On 09-11-2026 16:41, Khem Raj via openembedded-devel wrote:
> > fails to build -
> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1947/s=
teps/18/logs/stdio
> >
> >
> > | scons: Reading SConscript files ...
> > | ModuleNotFoundError: No module named 'pkg_resources':
> >
> > On Mon, Nov 9, 2026 at 12:18=E2=80=AFAM Mike Looijmans via openembedded=
-devel
> > <mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
> >
> >     of the current state and was apparently lost in master.
> >
> >     As wrynose introduces new build issues, this still won't build yet.
> >
> >
> >     Awais Belal (2):
> >       mongodb: fix build with python 3.12
> >       mongodb: update to 4.4.29
> >
> >     Gyorgy Sarvari (2):
> >       mongodb: upgrade 4.4.29 -> 4.4.30
> >       mongodb: ignore CVE-2025-14911
> >
> >      ...001-free_mon-Include-missing-cstdint.patch | 28 ---------
> >      ...econfig.py-python-3.12-compatibility.patch | 57
> >     +++++++++++++++++++
> >      .../recipes-dbs/mongodb/mongodb_git.bb <http://mongodb_git.bb>
> >         | 11 ++--
> >      3 files changed, 62 insertions(+), 34 deletions(-)
> >      delete mode 100644
> >
>  meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free=
_mon-Include-missing-cstdint.patch
> >      create mode 100644
> >
>  meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-modu=
leconfig.py-python-3.12-compatibility.patch
> >
> >     ---
> >     base-commit: c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e
> >     branch: wrynose-mongodb
> >
> >     --
> >     2.43.0
> >
> >
> >     Met vriendelijke groet / kind regards,
> >
> >     Mike Looijmans
> >
>
> --
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69 <+31%20499%20336%20969>
> E: mike.looijmans@topic.nl
> W: www.topic.nl
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132066):
> https://lists.openembedded.org/g/openembedded-devel/message/132066
> Mute This Topic: https://lists.openembedded.org/mt/122170765/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000091296d065fe74bf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 9, =
2026 at 10:02=E2=80=AFPM Mike Looijmans via openembedded-devel &lt;mike.loo=
ijmans=3D<a href=3D"mailto:topic.nl@lists.openembedded.org">topic.nl@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">I know, I also wrote in the description (second line) that =
it wouldn&#39;t <br>
build.<br>
<br>
But at least this brings it up to the &quot;scarthgap&quot; level. It&#39;s=
 weird to <br>
have to start several commits behind the previous LTS.<br>
<br>
I have a workaround for=C2=A0 the pkg_resources error, but that&#39;s still=
 not <br>
enough...<br></blockquote><div><br></div><div>I have sent a patch which add=
resses=C2=A0bunch of these issues.I wonder if we should</div><div>upgrade m=
ongo to latest release as well.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Mike.<br>
<br>
On 09-11-2026 16:41, Khem Raj via openembedded-devel wrote:<br>
&gt; fails to build=C2=A0- <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81=
/builds/1947/steps/18/logs/stdio" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1947/steps/1=
8/logs/stdio</a> <br>
&gt;<br>
&gt;<br>
&gt; | scons: Reading SConscript files ...<br>
&gt; | ModuleNotFoundError: No module named &#39;pkg_resources&#39;:<br>
&gt;<br>
&gt; On Mon, Nov 9, 2026 at 12:18=E2=80=AFAM Mike Looijmans via openembedde=
d-devel <br>
&gt; &lt;mike.looijmans=3D<a href=3D"mailto:topic.nl@lists.openembedded.org=
" target=3D"_blank">topic.nl@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the current state and was apparently lost in mas=
ter.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0As wrynose introduces new build issues, this still =
won&#39;t build yet.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Awais Belal (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: fix build with python 3.12<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: update to 4.4.29<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Gyorgy Sarvari (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: upgrade 4.4.29 -&gt; 4.4.30<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mongodb: ignore CVE-2025-14911<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...001-free_mon-Include-missing-cstdint.patch=
 | 28 ---------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...econfig.py-python-3.12-compatibility.patch=
 | 57<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-dbs/mongodb/<a href=3D"http://mon=
godb_git.bb" rel=3D"noreferrer" target=3D"_blank">mongodb_git.bb</a> &lt;<a=
 href=3D"http://mongodb_git.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/mongodb_git.bb</a>&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 | 11 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A03 files changed, 62 insertions(+), 34 deletio=
ns(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/dynamic-layers/meta-python/recipes-dbs/mong=
odb/mongodb/0001-free_mon-Include-missing-cstdint.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/dynamic-layers/meta-python/recipes-dbs/mong=
odb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0base-commit: c734c2cb9713dbd6d50697a9f6c25ebdf3ae58=
9e<br>
&gt;=C2=A0 =C2=A0 =C2=A0branch: wrynose-mongodb<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.43.0<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Met vriendelijke groet / kind regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mike Looijmans<br>
&gt;<br>
<br>
-- <br>
Mike Looijmans<br>
System Expert<br>
<br>
TOPIC Embedded Products B.V.<br>
Materiaalweg 4, 5681 RJ Best<br>
The Netherlands<br>
<br>
T: <a href=3D"tel:+31%20499%20336%20969" value=3D"+31499336969" target=3D"_=
blank">+31 (0) 499 33 69 69</a><br>
E: <a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijm=
ans@topic.nl</a><br>
W: <a href=3D"http://www.topic.nl" rel=3D"noreferrer" target=3D"_blank">www=
.topic.nl</a><br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132066): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132066" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132066</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122170765/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122170765/1997914</a><br>
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

--00000000000091296d065fe74bf1--
