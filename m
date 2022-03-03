Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545ADC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 05:13:42 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.7845.1646284421585672544
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 21:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LJxZK1bM;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id s1so5044327edd.13
        for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 21:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AyMvHBGPIALK2zlNutZvxEjYvK7Ep6ewApA1NmNydJ8=;
        b=LJxZK1bMua08g3HZ3CxuT07LWAakidDhCO4afDLYhk3K+vmsooftG5vsEvIVMtRU5p
         ET6LZUtbEnZyscpgueMf0ID+mYxOGmEJBJxRlvNWPY4kf1KwHK+NklNqXbQ1wGJSl+8/
         BC2AhcXIeKyYNuZxKCV8oqsaZD/0zXrPGw0789FOr6EHXqiz+goWiUXZDQZQYZatvbmq
         RLM2SrA35K7TAXnQGl9cDguFq6qrMPJvc37lgE08uf18yJMAQX03JFr4NDCDSQueuY0W
         krZaXONXzrVGZ1OKLe4rSJZItBNG1AyCghy4kNOG16qa4Clgq41ll2yFm9skjxCxIF8l
         KRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AyMvHBGPIALK2zlNutZvxEjYvK7Ep6ewApA1NmNydJ8=;
        b=0stqOh7531RnAqoam1hAsXdjucZ5FrW4oUHtTVeLKse1N3FbsMIoSIrkCTPmh3oxZh
         crWJxnKk3QcrgzvaXWB5sLhYms0c7WnCexB/6zRB84Bn5Y7E2f9QQQpejWYdvyp9JVto
         ZVGoj9xaUR76fN3tnxZMoJI5n9PMjFoLVQNXHSmZyxOPyWe5CslU3GxW7fvSTAVJXhc3
         0w1XMngiictijvEbyKa+N9mP6NZcxnA1AznmNMsNZG4Z7IjK3woNfM1aZeV94j3+Y3wa
         tdZnFQJe30+gZH3/IKHtX2XIOpgRGKTh7B17lmfM69RE4k+RZiM93UQIoOEeQjaH8Hxv
         vuQQ==
X-Gm-Message-State: AOAM5311p4fi5pci0kDYZ2XwdGshaxpsK6+PLM0bC6lp+0jhffjKSSVd
	1+YFGdMUxKX5O3aPRL76xxXU2ns5f+hOm+DXhaw=
X-Google-Smtp-Source: 
 ABdhPJw2p0FDbDWmHZTpUmvjmx/wWgaP4er4f8/XAJXRliW7bIElyGqlublcIedYO+UU6qdby/1Pon7EacvR/WJAaqA=
X-Received: by 2002:a05:6402:238b:b0:415:ce67:49ee with SMTP id
 j11-20020a056402238b00b00415ce6749eemr3416163eda.199.1646284419658; Wed, 02
 Mar 2022 21:13:39 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
 <CAMKF1sp4VCcuiJxOF1zDC0jB2860EGa6y+RKB0xWPeLBH_AGCw@mail.gmail.com>
 <CAMKF1spnXiT9PyV1HRVEuZAXFgWaX3m3tFrKHmT2Fhvgnb2BvQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spnXiT9PyV1HRVEuZAXFgWaX3m3tFrKHmT2Fhvgnb2BvQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 2 Mar 2022 21:13:28 -0800
Message-ID: 
 <CANx9H-CtXBXECQUK98wyfruz7n2+rRC_X0CgFsPDhxDKCw1gdw@mail.gmail.com>
Subject: Re: [oe] PEP-517 packaging fixes needed in meta-openembedded
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000879db05d94976f6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 05:13:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95726

--0000000000000879db05d94976f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2022 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:

> Here is latest failures we are down to 3
>
> https://errors.yoctoproject.org/Errors/Build/142145/
>

I have a partial fix for python3-slip-dbus, but it doesn=E2=80=99t solve th=
e
problem.
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo/pyp=
rojecttoml&id=3D79b14b76276ac9a9378ed37bb39959de8bf4c751


> On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Here is latest list which is significantly less so thanks for
> > contributions thus far.
> >
> >   meta-openembedded/meta-python/recipes-extended/python-blivet/
> python3-blivetgui_2.2.1.bb
> >   meta-openembedded/meta-python/recipes-devtools/python/
> python3-aws-iot-device-sdk-python_1.4.9.bb
> >   meta-openembedded/meta-python/recipes-extended/python-blivet/
> python3-blivet_3.4.3.bb
> >   meta-openembedded/meta-python/recipes-devtools/python/
> python3-slip-dbus_0.6.5.bb
> >   meta-openembedded/meta-python/recipes-devtools/python/
> python3-keras-applications_1.0.8.bb
> >   meta-openembedded/meta-python/recipes-devtools/python/
> python3-pymetno_0.9.0.bb
> >   meta-openembedded/meta-python/recipes-extended/python-cson/
> python3-cson_git.bb
> >   meta-openembedded/meta-python/recipes-devtools/python/
> python3-dbussy_1.3.bb
> >   meta-openembedded/meta-python/recipes-connectivity/python-txws/
> python3-txws_0.9.1.bb
> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/
> unattended-upgrades_2.6.bb
> >
> >
> > On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > We are making some progress. This is the latest ( 24 build failures )
> > > as of last night.
> > >
> > > https://errors.yoctoproject.org/Errors/Build/142052/
> > >
> > > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Thanks for sending fixing everyone. Lets keep going. Here is latest
> > > > list of failing recipes on master-next now
> > > >
> > > > Summary: 32 tasks failed:
> > > >
>  meta-openembedded/meta-python/recipes-extended/python-blivet/python3-bli=
vet_3.4.0.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-aws-iot-de=
vice-sdk-python_1.4.9.bb:
> do_compile
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-crcmod_1.7=
.bb:
> do_compile
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-lrparsing_=
1.0.17.bb:
> do_compile
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-slip-dbus_=
0.6.5.bb:
> do_compile
> > > >
>  meta-openembedded/meta-python/recipes-extended/python-blivet/python3-bli=
vetgui_2.2.1.bb:
> do_compile
> > > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.bb:
> do_compile
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-flask-vers=
ioned_0.9.4-20101221.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-ntplib_0.4=
.0.bb:
> do_install
> > > >
>  meta-raspberrypi/recipes-devtools/python/python3-adafruit-circuitpython-=
register_1.9.4.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-behave_1.2=
.6.bb:
> do_install
> > > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-pystache_0=
.5.4.bb:
> do_install
> > > >
>  meta-raspberrypi/recipes-devtools/python/python3-adafruit-pureio_1.1.8.b=
b:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-pyscaffold=
_4.1.4.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-prctl_1.8.=
1.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-pymetno_0.=
9.0.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-extended/python-cson/python3-cson_=
git.bb:
> do_install
> > > >   meta-openembedded/meta-python/recipes-devtools/python/
> python3-pydbus-manager_git.bb:do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4=
.152.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy_1.3=
.bb:
> do_install
> > > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-keras-appl=
ications_1.0.8.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-gcovr_5.0.=
bb:
> do_install
> > > >
>  meta-raspberrypi/recipes-devtools/python/python3-adafruit-platformdetect=
_3.1.1.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-configshel=
l-fb_1.1.29.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-devtools/python/python3-xmodem_0.4=
.6.bb:
> do_package
> > > >
>  meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattende=
d-upgrades_2.6.bb:
> do_install
> > > >
>  meta-openembedded/meta-python/recipes-connectivity/python-txws/python3-t=
xws_0.9.1.bb:
> do_install
> > > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.16.3.b=
b:
> do_compile
> > > >
>  meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb:
> do_install
> > > >
>  meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb:
> do_compile
> > > >
> > > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > >
> > > > > Hello All,
> > > > >
> > > > > We have PEP-517 packaging related infra changes merged into
> oe-core,
> > > > > which obviously
> > > > > mean there are some failures on various python packages.
> > > > >
> > > > > I am posting the latest results (qemux86-64/glibc)
> > > > >
> > > > > https://errors.yoctoproject.org/Errors/Build/141804/
> > > > >
> > > > > We have 57 recipes left, Tim has worked diligently on fixing the
> > > > > PEP-517 issues but we would
> > > > > need more hands. If you see any of
> > > > > these recipes that you can help fixing, please send patches
> > > > >
> > > > > Since upcoming release is an LTS release, I would like to have
> these
> > > > > issues fixed for this
> > > > > release.
> > > > >
> > > > > Thank you for your help
> > > > >
> > > > > -Khem
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95721):
> https://lists.openembedded.org/g/openembedded-devel/message/95721
> Mute This Topic: https://lists.openembedded.org/mt/89416561/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000879db05d94976f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 2, 2022 at 6:45 PM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Here is latest failures we are down to 3<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Build/142145/" rel=3D"nor=
eferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build/142=
145/</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I have a partial=
 fix for python3-slip-dbus, but it doesn=E2=80=99t solve=C2=A0the problem.<=
/div><div dir=3D"auto"><div><a href=3D"https://git.openembedded.org/meta-op=
enembedded-contrib/commit/?h=3Dtimo/pyprojecttoml&amp;id=3D79b14b76276ac9a9=
378ed37bb39959de8bf4c751">https://git.openembedded.org/meta-openembedded-co=
ntrib/commit/?h=3Dtimo/pyprojecttoml&amp;id=3D79b14b76276ac9a9378ed37bb3995=
9de8bf4c751</a></div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
On Wed, Mar 2, 2022 at 10:40 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Here is latest list which is significantly less so thanks for<br>
&gt; contributions thus far.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-extended/python-bliv=
et/<a href=3D"http://python3-blivetgui_2.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-blivetgui_2.2.1.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-aws-iot-device-sdk-python_1.4.9.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-aws-iot-device-sdk-python_1.4.9.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-extended/python-bliv=
et/<a href=3D"http://python3-blivet_3.4.3.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-blivet_3.4.3.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-slip-dbus_0.6.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-slip-dbus_0.6.5.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-keras-applications_1.0.8.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-keras-applications_1.0.8.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-pymetno_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-pymetno_0.9.0.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-extended/python-cson=
/<a href=3D"http://python3-cson_git.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-cson_git.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-dbussy_1.3.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-dbussy_1.3.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-connectivity/python-=
txws/<a href=3D"http://python3-txws_0.9.1.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-txws_0.9.1.bb</a><br>
&gt;=C2=A0 =C2=A0meta-openembedded/meta-oe/recipes-devtools/unattended-upgr=
ades/<a href=3D"http://unattended-upgrades_2.6.bb" rel=3D"noreferrer" targe=
t=3D"_blank">unattended-upgrades_2.6.bb</a><br>
&gt;<br>
&gt;<br>
&gt; On Tue, Mar 1, 2022 at 8:18 AM Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; We are making some progress. This is the latest ( 24 build failur=
es )<br>
&gt; &gt; as of last night.<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build/142052/" =
rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors=
/Build/142052/</a><br>
&gt; &gt;<br>
&gt; &gt; On Mon, Feb 28, 2022 at 3:21 PM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks for sending fixing everyone. Lets keep going. Here is=
 latest<br>
&gt; &gt; &gt; list of failing recipes on master-next now<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Summary: 32 tasks failed:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-extended/p=
ython-blivet/python3-blivet_3.4.0.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-aws-iot-device-sdk-python_1.4.9.bb:do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-crcmod_1.7.bb:do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-lrparsing_1.0.17.bb:do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-slip-dbus_0.6.5.bb:do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-extended/p=
ython-blivet/python3-blivetgui_2.2.1.bb:do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-raspberrypi/recipes-devtools/python/python3=
-rtimu_git.bb:do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-flask-versioned_0.9.4-20101221.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-ntplib_0.4.0.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-raspberrypi/recipes-devtools/python/python3=
-adafruit-circuitpython-register_1.9.4.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-behave_1.2.6.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_ins=
tall<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-pystache_0.5.4.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-raspberrypi/recipes-devtools/python/python3=
-adafruit-pureio_1.1.8.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-pyscaffold_4.1.4.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-prctl_1.8.1.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-pymetno_0.9.0.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-extended/p=
ython-cson/python3-cson_git.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/<a href=3D"http://python3-pydbus-manager_git.bb" target=3D"_blank">py=
thon3-pydbus-manager_git.bb</a>:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-pymisp_2.4.152.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-dbussy_1.3.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/g=
yp/gyp_git.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-keras-applications_1.0.8.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-gcovr_5.0.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-raspberrypi/recipes-devtools/python/python3=
-adafruit-platformdetect_3.1.1.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-configshell-fb_1.1.29.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-xmodem_0.4.6.bb:do_package<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-oe/recipes-devtools/unatt=
ended-upgrades/unattended-upgrades_2.6.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-python/recipes-connectivi=
ty/python-txws/python3-txws_0.9.1.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-xfce/recipes-apps/catfish=
/catfish_4.16.3.bb:do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-xfce/recipes-apps/menulib=
re/menulibre_2.2.3.bb:do_install<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta-openembedded/meta-gnome/recipes-support/onb=
oard/onboard_1.4.1.bb:do_compile<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Sat, Feb 26, 2022 at 11:49 AM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hello All,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We have PEP-517 packaging related infra changes merged =
into oe-core,<br>
&gt; &gt; &gt; &gt; which obviously<br>
&gt; &gt; &gt; &gt; mean there are some failures on various python packages=
.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I am posting the latest results (qemux86-64/glibc)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build=
/141804/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.=
org/Errors/Build/141804/</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We have 57 recipes left, Tim has worked diligently on f=
ixing the<br>
&gt; &gt; &gt; &gt; PEP-517 issues but we would<br>
&gt; &gt; &gt; &gt; need more hands. If you see any of<br>
&gt; &gt; &gt; &gt; these recipes that you can help fixing, please send pat=
ches<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Since upcoming release is an LTS release, I would like =
to have these<br>
&gt; &gt; &gt; &gt; issues fixed for this<br>
&gt; &gt; &gt; &gt; release.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thank you for your help<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -Khem<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95721): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95721" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95721</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89416561/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89416561/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000879db05d94976f6--

