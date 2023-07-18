Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8284FEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:30:10 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.10854.1689694200829904232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UINJGE90;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-55e1ae72dceso3588812eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689694200; x=1692286200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tdoEMnh85yZTc7zNdCyKdLA4iDB0J1KOs+tr8ZKFPxo=;
        b=UINJGE90PqCf9D2ZkPb3ky/9Mrwo3jWeOCWwzpsPEXi0Ms25TFaQa+5hDt6gfANd32
         VCENZKc1afzbggRwWB8qcfCNhGeMl6DrLOsbc5Ui5Jqzpb/ZxaxXWMbwoNqK4vN0la65
         SS1jRv/8qw7vj+Ms+X9gvJikuuiookLgk+SDA3o9pxEjsDPEDXsswJuz6GcxDyRh9W8j
         WGLaZ7j22LqOnwRXGmVMEFngF6P5Ziyys5zpXnE8BOZi8QiXmBKZ4oFxn8qJd9EqbQdw
         F7t2sdMdDj/nMWjhIrpdw6fdi5P3W0vs+p0AdaMKn1qv7+CrUBLwi6LwtqueYc1/SfI9
         B3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689694200; x=1692286200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdoEMnh85yZTc7zNdCyKdLA4iDB0J1KOs+tr8ZKFPxo=;
        b=gx+lSEkPsqPtC6LXdpkOQ52BGcL5IeZK9h57KCL8Ce433y+oPMJkYz6VYCIATl/lgG
         PFENIK3FdAbQs+whYuIPPJSRj4MRNqTjBllVZ2M2JVCIAYBXgbDaPBF6ETuLNdo7nsz9
         jvKYxYmSxjME1qf9SXFE69DdKXJzZ62mIBzhfp9l5u50PK0nyFhHrbZ5ZRVq2OAylsvv
         4lLpnzG4qcmp+NuerPQmYxe6kawMz6Xy7AEtMymxdhgUVoXu81IFtdvXtUubhcy4Lpvv
         E4WLgj1NKOz73//1x2rH4OvoysJcbzg6d4V7FOzapJP+DYZOURLGubBS/Ht00FHuzw9y
         sMXQ==
X-Gm-Message-State: ABy/qLbvOj9h2pIX5pdWDRKth2GvsQNRRnPt7Zvvk0Ezxe/ReCOjAqc5
	7eVyHMQpzAxTx2zu5ogzQ/0RFLEZUmDOReaP4Me3twf2anY=
X-Google-Smtp-Source: APBJJlFj6Zvzq7L7TznW2XwB8b9lWA6Ehx0eCd45Qs89CDXhwfFlT+dsno3+txT7UhBHUWt+qO+LX9uJDoXxyJSKy3I=
X-Received: by 2002:a4a:250b:0:b0:566:f8ee:fa67 with SMTP id
 g11-20020a4a250b000000b00566f8eefa67mr6383109ooa.0.1689694199857; Tue, 18 Jul
 2023 08:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
 <1689296444-28141-3-git-send-email-wangmy@fujitsu.com> <CAMKF1srup6UtozS8i_i=gwcMAG1WO2zRyVZ_de6zLtSB9Lqx8Q@mail.gmail.com>
 <OSBPR01MB1845A75403C0F960DE2ABEDFDC38A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1845A75403C0F960DE2ABEDFDC38A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jul 2023 08:29:48 -0700
Message-ID: <CAMKF1spZdU_i3ZNTgeU28fC3_fb4Ojc5JmTL76ZbA2B=01OB6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] wtmpdb: add new recipe
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008fd57f0600c4964d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 15:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103947

--0000000000008fd57f0600c4964d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 1:38 AM Mingyu Wang (Fujitsu) <wangmy@fujitsu.com>
wrote:

> Do I need to create a run-ptest to confirm the ptest?
> Or is there any other way to reproduce this problem?


I am not sure since it failed to build so run-ptest was not used yet but it
Might be good to have ptests supported

>
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210012, China
> <https://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?e=
ntry=3Dgmail&source=3Dg>
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Saturday, July 15, 2023 6:04 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH] wtmpdb: add new recipe
> >
> > fails to build with ptests
> >
> > tests/tst-dlopen.p/tst-dlopen.c.o: file not recognized: file format not
> recognized
> >
> > see - https://errors.yoctoproject.org/Errors/Details/716656/
> >
> > On Thu, Jul 13, 2023 at 6:01=E2=80=AFPM wangmy <wangmy@fujitsu.com> wro=
te:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../recipes-extended/wtmpdb/wtmpdb_0.7.1.bb   | 30
> > +++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >  create mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> > >
> > > diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> > > b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> > > new file mode 100644
> > > index 0000000000..c3b97b0630
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> > > @@ -0,0 +1,30 @@
> > > +SUMMARY =3D "Y2038 safe version of wtmp"
> > > +HOMEPAGE =3D "https://github.com/thkukuk/wtmpdb"
> > > +DESCRIPTION =3D "last reports the login and logout times of users an=
d
> when
> > the machine got rebooted."
> > > +LICENSE =3D "BSD-2-Clause"
> > > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D020090a00b69dd2af9ab82eb0003ea2c"
> > > +SECTION =3D "libs"
> > > +
> > > +SRCREV =3D "502b19a41c7a3b1b5e70969b18088683825f71f8"
> > > +
> > > +SRC_URI =3D
> > "git://github.com/thkukuk/wtmpdb.git;branch=3Dmain;protocol=3Dhttps"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit meson pkgconfig systemd
> > > +
> > > +DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpa=
m',
> '', d)}
> > sqlite3 "
> > > +
> > > +SYSTEMD_SERVICE:${PN} =3D "wtmpdb-update-boot.service
> > wtmpdb-rotate.service"
> > > +
> > > +EXTRA_OEMESON =3D " -Dpamlibdir=3D${libdir}"
> > > +
> > > +do_install:append () {
> > > +      # Fix makefile hardcoded path assumptions for systemd (assumes
> > $prefix)
> > > +      # without usrmerge distro feature enabled
> > > +      install -d `dirname ${D}${systemd_unitdir}`
> > > +      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}` =
}
> > > +
> > > +FILES:${PN} +=3D " ${systemd_system_unitdir} "
> > > +FILES:${PN} +=3D " ${libdir} "
> > > --
> > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#103860):
> > > https://lists.openembedded.org/g/openembedded-devel/message/103860
> > > Mute This Topic: https://lists.openembedded.org/mt/100132965/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--0000000000008fd57f0600c4964d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 18, 2023 at 1:38 AM Mingyu Wang (Fujitsu) &lt;<=
a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Do I need to create a run-ptest to conf=
irm the ptest? <br>
Or is there any other way to reproduce this problem?</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">I am not sure since it failed to buil=
d so run-ptest was not used yet but it</div><div dir=3D"auto">Might be good=
 to have ptests supported=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
Development Dept.I<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 <a href=3D"https=
://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?entry=3Dg=
mail&amp;source=3Dg">Wenzhu Road, Nanjing, 210012, China</a><br>
TEL: +86+25-86630566-8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<a href=3D"http://www.fujitsu.com/cn/fnst/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.fujitsu.com/cn/fnst/</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Saturday, July 15, 2023 6:04 AM<br>
&gt; To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-oe] [PATCH] wtmpdb: add new recipe<br>
&gt; <br>
&gt; fails to build with ptests<br>
&gt; <br>
&gt; tests/tst-dlopen.p/tst-dlopen.c.o: file not recognized: file format no=
t recognized<br>
&gt; <br>
&gt; see - <a href=3D"https://errors.yoctoproject.org/Errors/Details/716656=
/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Err=
ors/Details/716656/</a><br>
&gt; <br>
&gt; On Thu, Jul 13, 2023 at 6:01=E2=80=AFPM wangmy &lt;<a href=3D"mailto:w=
angmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../recipes-extended/wtmpdb/<a href=3D"http://wtmpdb_0.7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">wtmpdb_0.7.1.bb</a>=C2=A0 =C2=A0| =
30<br>
&gt; +++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 30 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/wtmpdb/<a href=
=3D"http://wtmpdb_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">wtmpdb_0.7=
.1.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-extended/wtmpdb/<a href=3D"http://wt=
mpdb_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">wtmpdb_0.7.1.bb</a><br>
&gt; &gt; b/meta-oe/recipes-extended/wtmpdb/<a href=3D"http://wtmpdb_0.7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">wtmpdb_0.7.1.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..c3b97b0630<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-extended/wtmpdb/<a href=3D"http://wtmpdb_0.=
7.1.bb" rel=3D"noreferrer" target=3D"_blank">wtmpdb_0.7.1.bb</a><br>
&gt; &gt; @@ -0,0 +1,30 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Y2038 safe version of wtmp&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/thkukuk/wtmpdb"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/thkukuk/wtmpdb</a>=
&quot;<br>
&gt; &gt; +DESCRIPTION =3D &quot;last reports the login and logout times of=
 users and when<br>
&gt; the machine got rebooted.&quot;<br>
&gt; &gt; +LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3D020090a00b69dd2af9ab82eb0003ea2c&quot;<br>
&gt; &gt; +SECTION =3D &quot;libs&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV =3D &quot;502b19a41c7a3b1b5e70969b18088683825f71f8&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://github.com/thkukuk/wtmpdb.git;branch=3Dm=
ain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/thkuk=
uk/wtmpdb.git;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit meson pkgconfig systemd<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;pam&#39;, &#39;libpam&#39;, &#39;&#39;, d)}<br>
&gt; sqlite3 &quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SYSTEMD_SERVICE:${PN} =3D &quot;wtmpdb-update-boot.service<br>
&gt; wtmpdb-rotate.service&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_OEMESON =3D &quot; -Dpamlibdir=3D${libdir}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +do_install:append () {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 # Fix makefile hardcoded path assumptions f=
or systemd (assumes<br>
&gt; $prefix)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 # without usrmerge distro feature enabled<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 install -d `dirname ${D}${systemd_unitdir}`=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/lib/systemd `dirname ${D}$=
{systemd_unitdir}` }<br>
&gt; &gt; +<br>
&gt; &gt; +FILES:${PN} +=3D &quot; ${systemd_system_unitdir} &quot;<br>
&gt; &gt; +FILES:${PN} +=3D &quot; ${libdir} &quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#103860):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/103860" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/103860</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100=
132965/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/100132965/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--0000000000008fd57f0600c4964d--

