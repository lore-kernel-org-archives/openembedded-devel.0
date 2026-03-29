Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B160FFC97EA
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 19:04:11 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34958.1774811046425174749
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 12:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NRGLm0AE;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64e8c7f5082so4321143d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 12:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774811045; cv=none;
        d=google.com; s=arc-20240605;
        b=hpOcqRpAqLW6RWbG2Us+DrL8Do1tbK6DHVucLhgkxqlUzacISWruxCNLfGtlb8e7wE
         gXGRjRVAd5u3UanXOJYSsGDPw+3Rt7XwkMaslNBG097AtwSg2+9nPIzotvEV100+ly5p
         s6MYwiKCy2JZgQA9CY3/EAzGX16lEfjnZQMNxOf8kiHwWaljkrOkA+rl85A4stLVrOCC
         u9FCxWrE+ym2c886VKVrhu8+qH6HD5MeNS4POd5BGs3zENygjQP2/mJIONVLkYwDFCDP
         binMiPMBcel2UWwYLxI9tkYfbUtZV/sfYikX9o5r2eP6fSMAofSnaUMwulxvMDj/XcA9
         KosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QuFhcaup7GVMafm/3nnWkJrDzbpoDPzYSvZmcNPhxSE=;
        fh=jEwJNmL1Vkmwq5TWGjdcwyeAx2YfGMjDP3WdkD/TSYg=;
        b=adg3LEvZXvPF58Em0jiTo3H0v4LiLJxa/JnsxtZuZyYXkSEIiK8QnSCtJ/4e6EsUSO
         /0/OIsYfZHdIkdw1gwNBzkSEVJnLvrZuReVYrO0B5MRug8L98fWIfYnVhzva0p3lIhUs
         KueE2aLo2suK3CIDiEegioZeG7Nfpv0HVMNkeEY8fsnmPUDZgy6+rgNBedK077C+59YM
         qGJk81jMRmmDUHSAXeK1pUpW3tUNSj8a64Tx38TM+RsnI1OuBJ9yDAq7bcgHlgURgcyn
         CU4qjLoOtQ4D2Ri2eapTrI0p/0XeucKrQ0eGFmiCeD8XAuo/nx2gDQfZ+YZLMt5jatxl
         Dmkw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774811045; x=1775415845; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QuFhcaup7GVMafm/3nnWkJrDzbpoDPzYSvZmcNPhxSE=;
        b=NRGLm0AE7mwnI/pIjuDKsU4BAw2PMVEzzbrqhLM0ANd/d4PiUstAon/ZKfCU52vPtL
         XyR4byJVu8hJevOpwsY05MFXY16W1XvuPs0+57yn5bIxpYa5O6ZDEKYGOsuDavKjjo80
         ULSfjbHQUne7BZQ8Aw/Bqe5uUcVwluBU6xSEam1ewh7LAA82BCqT/Huhr9IQH3BKuSGm
         HQItzbGmFfLoYDBQd1UpiQKHC4Jr+Mo/j9WnaHv2BAol4eNZTl3bpDChONbMN+L3jKVU
         e02G7G0ZMYRh8A2hrIpa5kLpijFcMcVP7z/jxTh2omaPdhiuYv3X4+YdCX7Pxj4C3Xlr
         t2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774811045; x=1775415845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuFhcaup7GVMafm/3nnWkJrDzbpoDPzYSvZmcNPhxSE=;
        b=KFdE9hlGbBNKh+67AlFinDDQAuSRqhtWB034A2Wi32X8eSo4H5m+Kf7CqbMTyMs/TQ
         IQOWywgkKNFfglLU7ZT/kSDM565Md9kAjKAcSorARPIDUP9OOTqO/OrcOQO0kWnUqtXi
         JzaguoaUoQPE66epcjZDLgbn6ElruOCOhAXzte045uMv5TrKsVUTa8A5YV5ZjS5ivgwG
         GSeCy+i2Q/K9sflgCnZiJRJA/SVWIaNxGcg59AOsP6MtH9eXxl0YrNtZOmi/zOcFg756
         FxZnqXxZG+EjfBAFK9nMdSTHa2wInOh3EkAYjZzyjBDwOAntTdPrtgA42oKW6I21gqoM
         BYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOqVbqKeOGNcnaJ+UzJSHfhW8B7kTsp1WlostQXT9+TK8SkrGc0NfmRt70R23oOzmA9UMR8ZZMH9DqpDTF0AHtUbc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/dm8nH0XLrlHEojyetFLZ3+4fJZXlGPFG3dtL1yb+qdU6nR5O
	HHxvxrIWyCPMKoVzD+SoAC3x7JjQav8A/cfcNlrx7k3Ctp/m0UYWPQOjrqs2TyTrgBqlsbQFZ/j
	c78FQ1m9aEtF0UyqGwVCHdG21E9qhRpfrrg==
X-Gm-Gg: ATEYQzzDD1boVKZzvLjOLIxSac1bK14bTrG3LUG7Et9UdTz3JjBbzOwyQc+pon3YEu6
	blb5OJcktyHlI9tTKRFcCetsYbxF9n1SGA0Mq5Zjrfq7gyTbhint5BgEut6gmFwp3Q6OkVepmPN
	hhSVFTpvglLfdfp9AGBaOPNuNwp5GSbE/8oUyzFd9WFRQRH48ykNYdyJIQfnHTJjNxjVKFsbcsv
	sjVcnV0UQ8uLoABol1u5LJozQER2iqRdN4knRbsqJiPeuO8IzrKvj2rrEg6MxzjjaMlt653FA0M
	4YfCnmb4kqeUGz2chHwaXA80kMt2UuKi8FL2tUggRjKqMKWXsjGHthIlGFODU2D/HSXa5oS1Qtg
	QBL6iwodFn2M1I9kd02kNxO1xi+EoF6HlRZVaimyzc2uZ1tBwGh78w/SbbbA=
X-Received: by 2002:a05:690e:169e:b0:64e:e896:a86 with SMTP id
 956f58d0204a3-64ff723edbfmr9762867d50.36.1774811045315; Sun, 29 Mar 2026
 12:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260328213046.2297947-1-mail@michael-fitzmayer.de> <CADySD0Hh1Y9ymzZxXwd08hPrEvcezw47nnpMB3_UyngazXwNbw@mail.gmail.com>
In-Reply-To: <CADySD0Hh1Y9ymzZxXwd08hPrEvcezw47nnpMB3_UyngazXwNbw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Mar 2026 12:03:51 -0700
X-Gm-Features: AQROBzABIPOJWwhAm5U5VPKJt_CbexSFrxZP5Fw3OCWs_xYuSZqUsf0Q7YeimHc
Message-ID: <CAMKF1spr7HjptkBYAbFwYJcNZ0Qd7T3hD1k0mtUOcev6ZsE6Mg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Add recipe: canvenient 1.00
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: mail@michael-fitzmayer.de, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e64882064e2e6550"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 19:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125807

--000000000000e64882064e2e6550
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026, 11:57=E2=80=AFAM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> On Sun, Mar 29, 2026 at 10:30=E2=80=AFAM Michael Fitzmayer via
> lists.openembedded.org
> <mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
> >
> > CANvenient is an abstraction layer for multiple CAN APIs on Windows and
> Linux. It provides a unified
> > interface for CAN communication, allowing developers to write code that
> is portable across different
> > platforms and CAN hardware.
> >
> > Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> > ---
> >  .../canvenient/canvenient_1.00.bb             | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/canvenient/
> canvenient_1.00.bb
> >
> > diff --git a/meta-oe/recipes-devtools/canvenient/canvenient_1.00.bb
> b/meta-oe/recipes-devtools/canvenient/canvenient_1.00.bb
> > new file mode 100644
> > index 0000000000..a4d5a212c1
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/canvenient/canvenient_1.00.bb
> > @@ -0,0 +1,41 @@
> > +
> > +SUMMARY =3D "CANvenient is an abstraction layer for multiple CAN APIs =
\
> > +          on Windows and Linux. \
> > +          "
> > +DESCRIPTION =3D "CANvenient is an abstraction layer for multiple CAN A=
PIs
> on \
> > +              Windows and Linux. It provides a unified interface for
> CAN \
> > +              communication, allowing developers to write code that is=
 \
> > +              portable across different platforms and CAN hardware. \
> > +              "
> > +HOMEPAGE =3D "https://canopenterm.de/canvenient"
> > +BUGTRACKER =3D "https://github.com/CANopenTerm/CANvenient/issues"
> > +
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7dda79"
> > +
> > +DEPENDS =3D "libsocketcan"
> > +
> > +SRC_URI =3D "git://
> github.com/CANopenTerm/CANvenient.git;protocol=3Dhttps;branch=3Dmain"
>
> can please include tag=3Dv${PV} in the SRC_URI
>

I wish this was checked with some build QA automatically

>
> > +
> > +SRCREV  =3D "abdfc48b316b3644ec1d0d225c45fd0fd8b07dd7"
>
> Is this intentional? Because upstream tagged commit is
> c1a2c37361cf9dd9c87e213146e37b36be306c8a
>
> > +
> > +inherit cmake ptest
> > +
> > +
> > +do_install:append() {
> > +    install -d ${D}${includedir}
> > +    install -d ${D}${libdir}
> > +
> > +    install -m 0644 ${S}/include/CANvenient.h ${D}${includedir}/
> > +    install -m 0755 ${B}/libCANvenient.so.1.0.0 ${D}${libdir}/
> > +
> > +    ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenient.so.1
> > +    ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenient.so
> > +}
> > +
> > +FILES:${PN} +=3D "${libdir}/libCANvenient.so ${libdir}/libCANvenient.s=
o.*"
> > +FILES:${PN}-dev +=3D "${includedir}"
> > +
> > +SOLIBS =3D ".so"
> > +
> > +RDEPENDS:${PN} =3D "libsocketcan"
> > --
> > 2.47.3
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125806):
> https://lists.openembedded.org/g/openembedded-devel/message/125806
> Mute This Topic: https://lists.openembedded.org/mt/118556741/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e64882064e2e6550
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 29, 2026, 11:57=E2=
=80=AFAM Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Mar 29, 2026 at 10:=
30=E2=80=AFAM Michael Fitzmayer via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a><br>
&lt;mail=3D<a href=3D"mailto:michael-fitzmayer.de@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">michael-fitzmayer.de@lists.openembedded=
.org</a>&gt; wrote:<br>
&gt;<br>
&gt; CANvenient is an abstraction layer for multiple CAN APIs on Windows an=
d Linux. It provides a unified<br>
&gt; interface for CAN communication, allowing developers to write code tha=
t is portable across different<br>
&gt; platforms and CAN hardware.<br>
&gt;<br>
&gt; Signed-off-by: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fi=
tzmayer.de" target=3D"_blank" rel=3D"noreferrer">mail@michael-fitzmayer.de<=
/a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../canvenient/<a href=3D"http://canvenient_1.00.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">canvenient_1.00.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 41 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/canvenient/<a href=
=3D"http://canvenient_1.00.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">canvenient_1.00.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/canvenient/<a href=3D"http://can=
venient_1.00.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canvenient=
_1.00.bb</a> b/meta-oe/recipes-devtools/canvenient/<a href=3D"http://canven=
ient_1.00.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canvenient_1.=
00.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a4d5a212c1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/canvenient/<a href=3D"http://canvenient=
_1.00.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canvenient_1.00.b=
b</a><br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +<br>
&gt; +SUMMARY =3D &quot;CANvenient is an abstraction layer for multiple CAN=
 APIs \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on Windows and Linux. \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +DESCRIPTION =3D &quot;CANvenient is an abstraction layer for multiple=
 CAN APIs on \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Windows and Linux. I=
t provides a unified interface for CAN \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 communication, allow=
ing developers to write code that is \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 portable across diff=
erent platforms and CAN hardware. \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://canopenterm.de/canvenient" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://canopenterm.de/canveni=
ent</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/CANopenTerm/CANven=
ient/issues" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github=
.com/CANopenTerm/CANvenient/issues</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Dbd2edc721b4a0289ef=
e949bdbe7dda79&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;libsocketcan&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANv=
enient.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">github.com/CANopenTerm/CANvenient.git;protocol=3Dhttps;bran=
ch=3Dmain</a>&quot;<br>
<br>
can please include tag=3Dv${PV} in the SRC_URI<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I wish this was checked with =
some build QA automatically=C2=A0</div><div dir=3D"auto"><div class=3D"gmai=
l_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; +<br>
&gt; +SRCREV=C2=A0 =3D &quot;abdfc48b316b3644ec1d0d225c45fd0fd8b07dd7&quot;=
<br>
<br>
Is this intentional? Because upstream tagged commit is<br>
c1a2c37361cf9dd9c87e213146e37b36be306c8a<br>
<br>
&gt; +<br>
&gt; +inherit cmake ptest<br>
&gt; +<br>
&gt; +<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${includedir}<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/include/CANvenient.h ${D}${include=
dir}/<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${B}/libCANvenient.so.1.0.0 ${D}${libdi=
r}/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenie=
nt.so.1<br>
&gt; +=C2=A0 =C2=A0 ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenie=
nt.so<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot;${libdir}/libCANvenient.so ${libdir}/libCANven=
ient.so.*&quot;<br>
&gt; +FILES:${PN}-dev +=3D &quot;${includedir}&quot;<br>
&gt; +<br>
&gt; +SOLIBS =3D &quot;.so&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} =3D &quot;libsocketcan&quot;<br>
&gt; --<br>
&gt; 2.47.3<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125806): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125806" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/125806</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118556741/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/118556741/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000e64882064e2e6550--

