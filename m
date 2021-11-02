Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48982C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 23:55:43 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.725.1635897342587136850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 16:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LILTMovw;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id v2so760797qve.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 16:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gtOK3WLFIL9v+3IZjI94oEVpnFzrs4qUYiuSY6juSq0=;
        b=LILTMovwxUffpLsTNl8S4mE5+mlrNhceocPBqBBcYVBo3DEM/v8gf+95qJbnZVlX6v
         TniTMZScGJAQazPes32LBOIMJ//L9hhDN9fxdU6Ed7I9teCcVCOBp2EIe4xGXYSy+6Ra
         PL3gZdLulN517tx7290E7E7KVB/10s/r+KJzMg9ezbVTqBDUpwi/DGqYDt8mgx0gjUC1
         htMOSiLC46MuwW7OPvDx/XUXC+BucYJBFPadHw7mC0+m69hQhuwl8mWiA5FIH4eU6uk6
         fNlsrn8QNCVFLxtsOr+yDHca4yY8Q3Nx3uUKMQYgFIuROLf0rUWIvapJvi8T4TVHT/MP
         qu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gtOK3WLFIL9v+3IZjI94oEVpnFzrs4qUYiuSY6juSq0=;
        b=PJJtIFgAL5SZ9K+bM1ERKzk9HZ9sDsy9KwVzSGRC08nem8oXnpcZ75HKMjL/P1vvj7
         Y9e2svZyltwK3Tl0VEHBatnRq2dPbNXeQdBth/jrejS1WwZZqFthF84FZDLvNLZFoOx9
         +NTqx+CY2b5stEQbG37x+l6jwIA+TLsz0Gb/bvn9Mfk8Uat/9iTJ2nC3QrGdmcAleAQg
         aXi/TPdTXwDk5IZ+HMyWUH7SeuQ/Jf/SV9n1+PJB6SqPm5ab85HylwNZ0zNX13hL32QE
         v5Gnx73aNyXkl7jcRomnL+SllffAMuZv0gDel+6sgVijxKCU+QPPDxz7nt8z26yfd1ab
         iDRQ==
X-Gm-Message-State: AOAM531wks0KN3PU7OnZKl9t00aOg1WOaXmSIVDIgzrI/pcdqCb39nHR
	eIttWw4leNA9n5la2Svg0EgFyTwpZtloMH4o4kM=
X-Google-Smtp-Source: 
 ABdhPJxe9ExqXIt6d73U+ky9ODcTCmXXQnLefQAm8fI+I8rdnHDUKPokUesbt85OPbJ0DZnc5tNWAVJ2hoyCKoeF1Ac=
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr3575109qto.112.1635897341386;
 Tue, 02 Nov 2021 16:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <432b09f9a07b493fb9191eec798aa07a@axis.com>
 <083fee51-9dd8-c9d3-7f27-90f41e8d261e@gmail.com>
 <c904695823484f2fb1ce9df4e14d0f6e@axis.com>
 <CAMKF1sqjFtq5jTNLHDVg6uNcj-uLm0uEGwxFNLW4PqciaUq+Hw@mail.gmail.com>
 <4c2002915cfc4851b799333839d5682a@axis.com>
In-Reply-To: <4c2002915cfc4851b799333839d5682a@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2021 16:55:30 -0700
Message-ID: 
 <CAMKF1sq__5dv0RTA34SaGAnrJ2dtmfgQM847RmXktDCOeStzfg@mail.gmail.com>
Subject: Re: [oe] Is it time to remove opensaf?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Development (openembedded-devel@lists.openembedded.org)"
 <openembedded-devel@lists.openembedded.org>,
	akuster808 <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ec230c05cfd707e1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 23:55:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93796

--000000000000ec230c05cfd707e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2021 at 3:35 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 2 november 2021 21:20
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: akuster808 <akuster808@gmail.com>; OE Development (openembedded-
> > devel@lists.openembedded.org) <openembedded-devel@lists.openembedded.or=
g
> >
> > Subject: Re: [oe] Is it time to remove opensaf?
> >
> > On Tue, Nov 2, 2021 at 1:11 PM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: akuster808 <akuster808@gmail.com>
> > > > Sent: den 2 november 2021 20:41
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; OE Developmen=
t
> > > > (openembedded-devel@lists.openembedded.org) <openembedded-
> > > > devel@lists.openembedded.org>
> > > > Subject: Re: [oe] Is it time to remove opensaf?
> > > >
> > > > Peter,
> > > >
> > > > On 11/2/21 9:33 AM, Peter Kjellerstedt wrote:
> > > > > I am currently working on patches for OE-Core to report QA warnin=
gs
> > > > > in case some directories that are expected to be empty have some
> > > > > files installed into them. As part of the review process, Khem
> > > > > reported failures for some recipes in OpenEmbedded due to this,
> > > > > opensaf being one of them.
> > > > >
> > > > > Now I have tried to build and run opensaf in a QEMU image, but I
> > > > > cannot get it to work. The sysvinit initscript relies on
> > > > > /lib/lsb/init-functions, which AFAICT has not existed since lsb
> > > > > was removed from OE-Core two years ago, and opensaf has never
> > > > > depended on lsb in the first place. As for systemd, the service
> > > > > file uses the same sysvinit scripts so it has the same problem.
> > > > > And in addition, the script is in /etc/init.d, which
> > > > > systemd.bbclass removes unless both sysvinit and systemd are
> > > > > enabled in DISTRO_FEATURES.
> > > > >
> > > > > And in addition to this, if I just try to start the opensafd bina=
ry
> > > > > it seg faults immediately.
> > > > >
> > > > > So all in all, even if opensaf has been updated regularly, it
> > > > > doesn't seem like anyone is actually using it. Which brings me to
> > > > > my actual question: should I just send a patch to remove it?
> > > > >
> > > > > Alternatively I can fix the creation of the /var/log/opensaf
> > > > > directory, which was the error Khem saw with my patch for OE-Core
> > > > > applied, but it seems like wasted work in case no one is actually
> > > > > using the recipe...
> > > >
> > > > Thanks for the analysis. Does the current mechanism to blacklist a
> > > > recipe help possible finding users of this recipe?  Is your concern
> > > > carrying this in the next LTS as well?
> > >
> > > I guess adding a PNBLACKLIST for it would work too (I have never used
> > > it, so I did not think off it). My concern was mainly that I had to
> > > spend time on fixing the recipe to support that /var/volatile is now
> > > checked for being empty, for a recipe that apparently is broken. So
> > > if a PNBLACKLIST helps the next person that does changes to the syste=
m
> > > from having to care about the broken opensaf recipe, then that is fin=
e
> > > with me. ;)
> >
> > Generally, I would refrain from excluding recipes via PNBLACKLIST if th=
ey
> > can be brought to support whatever improvements we are doing in Core or
> > other dependencies thats the price of accepting recipes into a layer in
> > the first place. If its broken such that it can not be fixed then we
> > should perhaps exclude it.
>
> I took a turn down memory lane and checked through the git log for the
> opensaf recipe. It seems the problem with the service file for systemd
> relying on files in /etc/init.d was discovered and hacked around in
> April 2016 and then later broken again in November 2016 because the
> previous hack was misunderstood... This I can solve properly, and I
> will send a patch for it (based on top of the series I sent earlier)
> so that there is at least one less problem.
>
> Unfortunately that will not solve the problem that the intscript relies
> on /lib/lsb/init-functions, which has not existed since the lsb recipe
> was removed from OE-Core two years ago (though the opensaf recipe has
> never depended on the lsb recipe even though it should have).
>
> I could write a comment in the commit message if you want, stating that
> my fix for the file in /etc/init.d will not actually make the service
> file work so that there is at least some track of this information for
> the next person that comes looking at the recipe.


Absolutely that=E2=80=99s fine

>
>
> > It was added via below commit, so perhaps Bian could be much better
> suited to
> > say if it is still in use or not.
> >
> >  commit e18830c2b4323487f9afa5205f13579903c7f9d4
> >   Author: Bian Naimeng <biannm@cn.fujitsu.com>
> >   Date:   Wed Dec 31 16:22:06 2014 +0800
> >
> >       opensaf: add recipe
> >
> >       OpenSAF is an open source implementation of the SAF AIS
> specification
> >
> >       Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> >       Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >       Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>
> Bian hasn't been active in the community for over six years, so that is
> probably hoping for much.
>
> > > In the end I did send a patch that changes the opensaf recipe to crea=
te
> > > /var/log/opensaf in runtime, by copying the solution for one of the
> > > other recipes I was fixing. So I am in the clear for my change to
> > > OE-Core. But opensaf is still as broken as before when it comes to
> > > actually starting the service...
> >
> > Thanks for fixing the bunch of recipes for this,. Really helpful.
>
> Well, it was my change to OE-Core that broke them, so of course I will
> fix them.
>
> > > > -armin
> > > > >
> > > > > //Peter
> > >
> > > //Peter
>
> //Peter
>
>

--000000000000ec230c05cfd707e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 2, 2021 at 3:35 PM Peter Kjellerstedt &lt;<a hr=
ef=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; -----Original Messag=
e-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;openembedd=
ed-<br>
&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">deve=
l@lists.openembedded.org</a>&gt; On Behalf Of Khem Raj<br>
&gt; Sent: den 2 november 2021 21:20<br>
&gt; To: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Cc: akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_=
blank">akuster808@gmail.com</a>&gt;; OE Development (openembedded-<br>
&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">deve=
l@lists.openembedded.org</a>) &lt;<a href=3D"mailto:openembedded-devel@list=
s.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded=
.org</a>&gt;<br>
&gt; Subject: Re: [oe] Is it time to remove opensaf?<br>
&gt; <br>
&gt; On Tue, Nov 2, 2021 at 1:11 PM Peter Kjellerstedt<br>
&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">p=
eter.kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Sent: den 2 november 2021 20:41<br>
&gt; &gt; &gt; To: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;; OE Dev=
elopment<br>
&gt; &gt; &gt; (<a href=3D"mailto:openembedded-devel@lists.openembedded.org=
" target=3D"_blank">openembedded-devel@lists.openembedded.org</a>) &lt;open=
embedded-<br>
&gt; &gt; &gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_b=
lank">devel@lists.openembedded.org</a>&gt;<br>
&gt; &gt; &gt; Subject: Re: [oe] Is it time to remove opensaf?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Peter,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 11/2/21 9:33 AM, Peter Kjellerstedt wrote:<br>
&gt; &gt; &gt; &gt; I am currently working on patches for OE-Core to report=
 QA warnings<br>
&gt; &gt; &gt; &gt; in case some directories that are expected to be empty =
have some<br>
&gt; &gt; &gt; &gt; files installed into them. As part of the review proces=
s, Khem<br>
&gt; &gt; &gt; &gt; reported failures for some recipes in OpenEmbedded due =
to this,<br>
&gt; &gt; &gt; &gt; opensaf being one of them.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Now I have tried to build and run opensaf in a QEMU ima=
ge, but I<br>
&gt; &gt; &gt; &gt; cannot get it to work. The sysvinit initscript relies o=
n<br>
&gt; &gt; &gt; &gt; /lib/lsb/init-functions, which AFAICT has not existed s=
ince lsb<br>
&gt; &gt; &gt; &gt; was removed from OE-Core two years ago, and opensaf has=
 never<br>
&gt; &gt; &gt; &gt; depended on lsb in the first place. As for systemd, the=
 service<br>
&gt; &gt; &gt; &gt; file uses the same sysvinit scripts so it has the same =
problem.<br>
&gt; &gt; &gt; &gt; And in addition, the script is in /etc/init.d, which<br=
>
&gt; &gt; &gt; &gt; systemd.bbclass removes unless both sysvinit and system=
d are<br>
&gt; &gt; &gt; &gt; enabled in DISTRO_FEATURES.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; And in addition to this, if I just try to start the ope=
nsafd binary<br>
&gt; &gt; &gt; &gt; it seg faults immediately.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; So all in all, even if opensaf has been updated regular=
ly, it<br>
&gt; &gt; &gt; &gt; doesn&#39;t seem like anyone is actually using it. Whic=
h brings me to<br>
&gt; &gt; &gt; &gt; my actual question: should I just send a patch to remov=
e it?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Alternatively I can fix the creation of the /var/log/op=
ensaf<br>
&gt; &gt; &gt; &gt; directory, which was the error Khem saw with my patch f=
or OE-Core<br>
&gt; &gt; &gt; &gt; applied, but it seems like wasted work in case no one i=
s actually<br>
&gt; &gt; &gt; &gt; using the recipe...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks for the analysis. Does the current mechanism to black=
list a<br>
&gt; &gt; &gt; recipe help possible finding users of this recipe?=C2=A0 Is =
your concern<br>
&gt; &gt; &gt; carrying this in the next LTS as well?<br>
&gt; &gt;<br>
&gt; &gt; I guess adding a PNBLACKLIST for it would work too (I have never =
used<br>
&gt; &gt; it, so I did not think off it). My concern was mainly that I had =
to<br>
&gt; &gt; spend time on fixing the recipe to support that /var/volatile is =
now<br>
&gt; &gt; checked for being empty, for a recipe that apparently is broken. =
So<br>
&gt; &gt; if a PNBLACKLIST helps the next person that does changes to the s=
ystem<br>
&gt; &gt; from having to care about the broken opensaf recipe, then that is=
 fine<br>
&gt; &gt; with me. ;)<br>
&gt; <br>
&gt; Generally, I would refrain from excluding recipes via PNBLACKLIST if t=
hey<br>
&gt; can be brought to support whatever improvements we are doing in Core o=
r <br>
&gt; other dependencies thats the price of accepting recipes into a layer i=
n <br>
&gt; the first place. If its broken such that it can not be fixed then we <=
br>
&gt; should perhaps exclude it.<br>
<br>
I took a turn down memory lane and checked through the git log for the <br>
opensaf recipe. It seems the problem with the service file for systemd <br>
relying on files in /etc/init.d was discovered and hacked around in <br>
April 2016 and then later broken again in November 2016 because the <br>
previous hack was misunderstood... This I can solve properly, and I <br>
will send a patch for it (based on top of the series I sent earlier) <br>
so that there is at least one less problem.<br>
<br>
Unfortunately that will not solve the problem that the intscript relies <br=
>
on /lib/lsb/init-functions, which has not existed since the lsb recipe <br>
was removed from OE-Core two years ago (though the opensaf recipe has <br>
never depended on the lsb recipe even though it should have).<br>
<br>
I could write a comment in the commit message if you want, stating that <br=
>
my fix for the file in /etc/init.d will not actually make the service <br>
file work so that there is at least some track of this information for <br>
the next person that comes looking at the recipe.</blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Absolutely that=E2=80=99s fine=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; It was added via below commit, so perhaps Bian could be much better su=
ited to<br>
&gt; say if it is still in use or not.<br>
&gt; <br>
&gt;=C2=A0 commit e18830c2b4323487f9afa5205f13579903c7f9d4<br>
&gt;=C2=A0 =C2=A0Author: Bian Naimeng &lt;<a href=3D"mailto:biannm@cn.fujit=
su.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Wed Dec 31 16:22:06 2014 +0800<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0opensaf: add recipe<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0OpenSAF is an open source implementation of =
the SAF AIS specification<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Bian Naimeng &lt;<a href=3D"m=
ailto:biannm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"m=
ailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Joe MacDonald &lt;<a href=3D"=
mailto:joe_macdonald@mentor.com" target=3D"_blank">joe_macdonald@mentor.com=
</a>&gt;<br>
<br>
Bian hasn&#39;t been active in the community for over six years, so that is=
 <br>
probably hoping for much.<br>
<br>
&gt; &gt; In the end I did send a patch that changes the opensaf recipe to =
create<br>
&gt; &gt; /var/log/opensaf in runtime, by copying the solution for one of t=
he<br>
&gt; &gt; other recipes I was fixing. So I am in the clear for my change to=
<br>
&gt; &gt; OE-Core. But opensaf is still as broken as before when it comes t=
o<br>
&gt; &gt; actually starting the service...<br>
&gt; <br>
&gt; Thanks for fixing the bunch of recipes for this,. Really helpful.<br>
<br>
Well, it was my change to OE-Core that broke them, so of course I will <br>
fix them.<br>
<br>
&gt; &gt; &gt; -armin<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; //Peter<br>
&gt; &gt;<br>
&gt; &gt; //Peter<br>
<br>
//Peter<br>
<br>
</blockquote></div></div>

--000000000000ec230c05cfd707e1--

