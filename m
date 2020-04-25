Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.1870.1587790831689839752
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 22:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D2BmiKRa;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id o127so12765045iof.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 22:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yd8BBximz1HrHEYYuYgUmAUweMLRELNJoRc/H9havwE=;
        b=D2BmiKRatadp6l42+RvpcOTxEMUkUOASu3Ev2KcDPvmJX4MK8fPhFYzN5WFBz8ATyW
         6tu9wFgP55J+4W4G8vCp6GJ8rQ8y+BSD/+6nDgD9nXK5O1ZJh/g/XYg9LHA3HqlAC8sV
         xuU0t+19NqBqSR2bJ/C0FSz0rKnbGVpNcAi+dUefDzfrbhxKBIzaE/ooQBJiro6xLrru
         DVALyW61KKZCL3xYqmptXthjGppQWZ+7lEppz7om6Syj4s6c+Yhe8y05S2u124RzewKI
         xqyMVeSRDX82cq8hApcuT1lFm6hI9zCipD1XAFE5YdpXV5qLDQF0H4PjDzQb9qDOsucp
         D5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yd8BBximz1HrHEYYuYgUmAUweMLRELNJoRc/H9havwE=;
        b=FdeqwCnHCbsrRZYpudhtB/jWSSsLvDSO3YdUl1YfZ2jGBcYmmBYP7TJnTnlx1J8Zkq
         0NiXH564HsfySDhrkllPpSNCQzNy/8PkUecbXRFXYieRRAxE/ZATe0KdvosZE4mVPMEk
         5PpVPw4BeVJ+8cHLVcA2Uo/fvTtrJQzhA7ENrWvf3aY/azskwTxB2Z70XLDobHcLsnpJ
         TjpyAWUnNqsJkDSg6LZmf0hBNGDbdONvAEJ9QmRNAi+lR0OERx5mCiYR1WObYcaQC0Mz
         MEwT/rSqGnuG+lNt5GsjqRj+znlzi2RSaqZJRLqBZk8abkMuFOk50nl+Jg+rsP/U2sMw
         zFfQ==
X-Gm-Message-State: AGi0PuYu0V2IjcPcH/nym6ROlxh40nAtcOsEZIiWGoTeiqcWzXX4uHfC
	dNzeJsJ0HbsmgGXnypINoPvqNGReB0fudxr7zZE=
X-Google-Smtp-Source: APiQypJkBevm1+glcYX3/hLk6frntTN502PNv9oOk92ZvUg7qQILNijcCnLiNkyqCtzKCXcI509jwbh89bK/MtfkdZ4=
X-Received: by 2002:a02:9445:: with SMTP id a63mr402340jai.10.1587790830935;
 Fri, 24 Apr 2020 22:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200424011328.191909-1-changqing.li@windriver.com> <bac9fe56-5f04-1cd4-6cc8-10c77ccfc4c8@gmail.com>
In-Reply-To: <bac9fe56-5f04-1cd4-6cc8-10c77ccfc4c8@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 24 Apr 2020 22:00:20 -0700
Message-ID: <CANx9H-D81iMF76hRqrnPJEjNvkSq_JyTqqu9q+r-ZYqGUb-8Rw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pexpect: change shebang to python3
To: Khem Raj <raj.khem@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000074a39905a4165cac"

--00000000000074a39905a4165cac
Content-Type: text/plain; charset="UTF-8"

meta-python2 has zero connection the meta-python. So it will not depend on
any inc files.

On Fri, Apr 24, 2020 at 6:57 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 4/23/20 6:13 PM, Changqing Li wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > we have offcially dropped python2, so it is possible
> > that our code run on python3 only host, so change
> > shebang to python3 to avoid error like:
> > python: command not found
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  .../python/python-pexpect.inc                 |  2 ++
> >  ...hange-shebang-from-python-to-python3.patch | 25 +++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc
> b/meta-python/recipes-devtools/python/python-pexpect.inc
> > index f02aa994e..c6230b2b5 100644
> > --- a/meta-python/recipes-devtools/python/python-pexpect.inc
> > +++ b/meta-python/recipes-devtools/python/python-pexpect.inc
> > @@ -4,6 +4,8 @@ SECTION = "devel/python"
> >  LICENSE = "ISC"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
> >
> > +SRC_URI +=
> "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
> > +
>
> This .inc file should be merged into .bb, as well, also check if
> meta-python2 depends on this .inc file, if it does then the patching
> should happen inside py3 version of bb file and not .inc
>
> >  SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
> >  SRC_URI[sha256sum] =
> "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
> >
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
> b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
> > new file mode 100644
> > index 000000000..bee772da6
> > --- /dev/null
> > +++
> b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
> > @@ -0,0 +1,25 @@
> > +From 35462d7b778eea32fd0cc0bbc79d6e6f53d942b4 Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Thu, 23 Apr 2020 08:01:42 +0000
> > +Subject: [PATCH] FSM.py: change shebang from python to python3
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +---
> > + pexpect/FSM.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/pexpect/FSM.py b/pexpect/FSM.py
> > +index 46b392e..4e77654 100644
> > +--- a/pexpect/FSM.py
> > ++++ b/pexpect/FSM.py
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > +
> > + '''This module implements a Finite State Machine (FSM). In addition to
> state
> > + this FSM also maintains a user defined "memory". So this FSM can be
> used as a
> > +--
> > +2.24.1
> > +
> >
> >
> >
> >
>
> 
>

--00000000000074a39905a4165cac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">meta-python2 has zero connection the meta-python. So=
 it will not depend on any inc files.</div></div><div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 24, 2020 at 6:5=
7 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 4/23/20 6:13 PM, Changqing Li wrote:<br>
&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; <br>
&gt; we have offcially dropped python2, so it is possible<br>
&gt; that our code run on python3 only host, so change<br>
&gt; shebang to python3 to avoid error like:<br>
&gt; python: command not found<br>
&gt; <br>
&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python-pexpect.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 ...hange-shebang-from-python-to-python3.patch | 25 ++++++++++++=
+++++++<br>
&gt;=C2=A0 2 files changed, 27 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-=
pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch<br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b=
/meta-python/recipes-devtools/python/python-pexpect.inc<br>
&gt; index f02aa994e..c6230b2b5 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/python-pexpect.inc<br>
&gt; +++ b/meta-python/recipes-devtools/python/python-pexpect.inc<br>
&gt; @@ -4,6 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;ISC&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1c7a725251880af=
8c6a148181665385b&quot;<br>
&gt;=C2=A0 <br>
&gt; +SRC_URI +=3D &quot;file://0001-FSM.py-change-shebang-from-python-to-=
python3.patch&quot;<br>
&gt; +<br>
<br>
This .inc file should be merged into .bb, as well, also check if<br>
meta-python2 depends on this .inc file, if it does then the patching<br>
should happen inside py3 version of bb file and not .inc<br>
<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;153eb25184249d6a85fde9acf4804085&quot=
;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;fc65a43959d153d0114afe13997d439c22=
823a27cefceb5ff35c2178c6784c0c&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pexpect/0001=
-FSM.py-change-shebang-from-python-to-python3.patch b/meta-python/recipes-d=
evtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-py=
thon3.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..bee772da6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py=
-change-shebang-from-python-to-python3.patch<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +From 35462d7b778eea32fd0cc0bbc79d6e6f53d942b4 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; +Date: Thu, 23 Apr 2020 08:01:42 +0000<br>
&gt; +Subject: [PATCH] FSM.py: change shebang from python to python3<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windr=
iver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + pexpect/FSM.py | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/pexpect/FSM.py b/pexpect/FSM.py<br>
&gt; +index 46b392e..4e77654 100644<br>
&gt; +--- a/pexpect/FSM.py<br>
&gt; ++++ b/pexpect/FSM.py<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-#!/usr/bin/env python<br>
&gt; ++#!/usr/bin/env python3<br>
&gt; + <br>
&gt; + &#39;&#39;&#39;This module implements a Finite State Machine (FSM).=
 In addition to state<br>
&gt; + this FSM also maintains a user defined &quot;memory&quot;. So this =
FSM can be used as a<br>
&gt; +-- <br>
&gt; +2.24.1<br>
&gt; +<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
</blockquote></div></div>

--00000000000074a39905a4165cac--
