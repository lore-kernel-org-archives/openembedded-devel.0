Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.21427.1590179846797233405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 13:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tMI5NkVC;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id s1so12019189qkf.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1okEgf4r5mrR7fnYM4QFEgj9MLdsZf8d9+65OtBHINc=;
        b=tMI5NkVCI7LXoX8nxXzKB+NmkFu4/4Sduzf6jbbPUxP2Eeqb9De+GYGeKcyxoDK3Sa
         3JhUtDTGggTS/mrTJprj06hNpd7iQ/HjF/sVO3rNS5uDaX09oQjMngmtv+rAMk10Zwbo
         gxfN9/kZ0P3klzkcQlVD5g+TTFxoZ2aypvB8lmgTXtYRdL9IniHMvD+pkTk5hPNn7ARM
         IvwFRG+iGaAZhpMW31JLOLxWBWP+MljJ+KI4UaaI3g2+CIvcksokvohIZBppP5IodKZ3
         UQBueJ93p+4DeELSjyOcSet7NcLPBgKFEHuciHurHAq6YX+CAq5/rbcNA3mqKZC4BeQw
         +/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1okEgf4r5mrR7fnYM4QFEgj9MLdsZf8d9+65OtBHINc=;
        b=qI4bDkdv+DQhC1uVzJyr9qVhM1XFCPrPXBenjDammjwTsmFESGAVsWEhW+8InLTiY1
         x/AyMh57R6cn8oaeazyABPU6y4iwhWfwuENMqGMvJ26mTzri4ov8L6JG4FReyap5LM/2
         J3x9HqLvqXsA1iubGmLPWfVEmDPNluhYB5txZvZbwUCihKcuJfjAizr6WRNudjc/mOGP
         eDTbp7jj99ceeruirBmi5izUgyr53ThY9EmWr/zLQ465CritFKzymHWZpHO9yoBGUF7c
         D97sCDX5eOw0pF3hRjXNMpjspjDM/bqzctp74xHEVR/nwl9MS96g2VDWy7pbZ3xtkip+
         MWIQ==
X-Gm-Message-State: AOAM530WeiRe2LRDF6i0+I9Ll9XsGqdWlFzmTscqbd8nOSfKg3VIqmJL
	2DXxlqWvL815YTcRADGj+GL4+zS8gTp/RkZkjgo=
X-Google-Smtp-Source: ABdhPJw1dJXxYB/Mn5Wu29gwbD7DjY8DCDhp7KS1NdD92XFbapLSlxbVHCMNLRMMUWcGcRNUVPBTtJ7/Reu3qihWKgw=
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr15853304qkf.17.1590179845681;
 Fri, 22 May 2020 13:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
 <20200522121333.25045-2-domarys.correa@ossystems.com.br> <CAMKF1sq92HXavsXKHabghWhfMJQoxFfW1ER_-O7G6BtAESQXCg@mail.gmail.com>
 <CAJA1DWvAoAXHKzNkjZ5nJQJ9OFJqPnmiH+xwKqoRtQF-2VMsmg@mail.gmail.com>
In-Reply-To: <CAJA1DWvAoAXHKzNkjZ5nJQJ9OFJqPnmiH+xwKqoRtQF-2VMsmg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 22 May 2020 13:37:14 -0700
Message-ID: <CAMKF1sosNy+780rp7pPJtixmguePdKKrbO4psRiuBEb7PC_GKA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] python3-pyudev: Update 0.21.0 -> 0.22.0
To: =?UTF-8?Q?Domarys_da_Silva_Corr=C3=AAa?= <domarys.correa@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d4b70205a6429851"

--000000000000d4b70205a6429851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't think so. Just rebase would be good

On Fri, May 22, 2020 at 12:17 PM Domarys da Silva Corr=C3=AAa <
domarys.correa@ossystems.com.br> wrote:

> Hello,
>
> I did the rebase, and tested it again successfully. Is there a specific
> point that I should review?
>
> att,
>
> On Fri, May 22, 2020 at 12:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Please rebase on top of master or master-next,
>>
>> Thanks
>> Khem
>>
>> On Fri, May 22, 2020 at 5:13 AM Domarys Correa
>> <domarys.correa@ossystems.com.br> wrote:
>> >
>> > Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
>> > ---
>> >  ...hon3-pyudev_0.21.0.bb =3D> python3-pyudev_0.22.0.bb} | 11 +++++++=
----
>> >  1 file changed, 7 insertions(+), 4 deletions(-)
>> >  rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.bb
>> =3D> python3-pyudev_0.22.0.bb} (70%)
>> >
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/
>> python3-pyudev_0.22.0.bb
>> > similarity index 70%
>> > rename from meta-python/recipes-devtools/python/
>> python3-pyudev_0.21.0.bb
>> > rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.b=
b
>> > index f39847ffa..d5bf058ed 100644
>> > --- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
>> > @@ -1,9 +1,9 @@
>> >  SUMMARY =3D "A libudev binding"
>> > +
>> >  LICENSE =3D "LGPLv2.1+"
>> >  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343"
>> >
>> > -SRC_URI[md5sum] =3D "cf4d9db7d772622144ca1be6b5d9353b"
>> > -SRC_URI[sha256sum] =3D
>> "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
>> > +SRC_URI[sha256sum] =3D
>> "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
>> >
>> >  inherit pypi setuptools3
>> >
>> > @@ -12,10 +12,13 @@ do_configure_prepend() {
>> >      sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
>> >  }
>> >
>> > -RDEPENDS_${PN} =3D "\
>> > +RDEPENDS_${PN} +=3D "\
>> > +    libudev \
>> >      ${PYTHON_PN}-ctypes \
>> > +    ${PYTHON_PN}-fcntl \
>> >      ${PYTHON_PN}-misc \
>> >      ${PYTHON_PN}-six \
>> >      ${PYTHON_PN}-threading \
>> > -    libudev \
>> >  "
>> > +
>> > +BBCLASSEXTEND =3D "native nativesdk"
>> > --
>> > 2.17.1
>> >
>> >=20
>>
>
>
> --
> *Domarys Corr=C3=AAa*
> (55) 5399100-2700
> domaryscorrea@gmail.com
> domarys.correa@ossystems.com.br
>

--000000000000d4b70205a6429851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I don&#39;t think so. Just rebase would be good=C2=
=A0</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 22, 2020 at 12:17 PM Domarys da Silva Corr=C3=
=AAa &lt;<a href=3D"mailto:domarys.correa@ossystems.com.br">domarys.correa=
@ossystems.com.br</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color=
:rgb(166,77,121)">Hello, <br></div><div class=3D"gmail_default" style=3D"co=
lor:rgb(166,77,121)"><br></div><div class=3D"gmail_default" style=3D"color:=
rgb(166,77,121)"><span lang=3D"en"><span title=3D"">I did the rebase, and t=
ested it again successfully.</span> <span title=3D"">Is there a specific po=
int that I should review?</span></span></div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(166,77,121)"><span lang=3D"en"><span title=3D""><br></spa=
n></span></div><div class=3D"gmail_default" style=3D"color:rgb(166,77,121)"=
><span lang=3D"en"><span title=3D"">att,</span></span></div></div></div><di=
v dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, May 22, 2020 at 12:59 PM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Please rebase on top o=
f master or master-next,<br>
<br>
Thanks<br>
Khem<br>
<br>
On Fri, May 22, 2020 at 5:13 AM Domarys Correa<br>
&lt;<a href=3D"mailto:domarys.correa@ossystems.com.br" target=3D"_blank">d=
omarys.correa@ossystems.com.br</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Domarys Correa &lt;<a href=3D"mailto:domarys.correa@os=
systems.com.br" target=3D"_blank">domarys.correa@ossystems.com.br</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://hon3-pyudev_0.21.0.bb" rel=3D"noreferrer" =
target=3D"_blank">hon3-pyudev_0.21.0.bb</a> =3D&gt; <a href=3D"http://pytho=
n3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.=
22.0.bb</a>} | 11 +++++++----<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://p=
ython3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyude=
v_0.21.0.bb</a> =3D&gt; <a href=3D"http://python3-pyudev_0.22.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pyudev_0.22.0.bb</a>} (70%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev=
_0.21.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0=
.22.0.bb</a><br>
&gt; similarity index 70%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_=
0.21.0.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.=
22.0.bb</a><br>
&gt; index f39847ffa..d5bf058ed 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
yudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.21.0=
.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
yudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.22.0=
.bb</a><br>
&gt; @@ -1,9 +1,9 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;A libudev binding&quot;<br>
&gt; +<br>
&gt;=C2=A0 LICENSE =3D &quot;LGPLv2.1+&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da6f89e2100d9b6c=
dffcea4f398e37343&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;cf4d9db7d772622144ca1be6b5d9353b&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;094b7a100150114748aaa3b70663485dd360457=
a709bfaaafe5a977371033f2b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;69bb1beb7ac52855b6d1b9fe909eefb0017f38d=
917cba9939602c6880035b276&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt;<br>
&gt; @@ -12,10 +12,13 @@ do_configure_prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i &quot;s/str(pyudev.__version__)/&#39;${PV}=
&#39;/g&quot; ${S}/setup.py<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -RDEPENDS_${PN} =3D &quot;\<br>
&gt; +RDEPENDS_${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 libudev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-ctypes \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-fcntl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-misc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
&gt; -=C2=A0 =C2=A0 libudev \<br>
&gt;=C2=A0 &quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><span><div><b><font color=3D"#a64d79">Domar=
ys Corr=C3=AAa</font></b></div><div><font color=3D"#c27ba0">(55) 5399100-27=
00</font></div><div><font color=3D"#c27ba0"><a href=3D"mailto:domaryscorrea=
@gmail.com" target=3D"_blank">domaryscorrea@gmail.com</a><br></font></div><=
div><font color=3D"#c27ba0"><a href=3D"mailto:domarys.correa@ossystems.com.=
br" rel=3D"noopener noreferrer" target=3D"_blank">domarys.correa@ossystems.=
com.br</a></font></div></span></div></div></div></div></div>
</blockquote></div></div>

--000000000000d4b70205a6429851--
