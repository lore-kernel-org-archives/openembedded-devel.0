Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9773CFCD0B5
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:48:57 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7666.1773812930663031994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FzmbwVl5;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a46ebe2beso30051627b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 22:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773812930; cv=none;
        d=google.com; s=arc-20240605;
        b=SfFTjoCs7Btr0V6ENvzQa0K3ey+ZneOgWbH/aGW2oaGGQe0Cue87Zm4MUBb2uRZEb0
         J64T7slh0tG1TSlnOrH0NzwfV+rkmq+D39ziNJB91LpVky8QNmJCso1PRmZqMXy+yk5k
         mjS8vrh3NouJV6ynv9L/G+urRlZ3zduSOZIr7UEZfWiuqKHnQiK2lyH50+/hw3QrC19J
         O6/X4O3cjRHXnyTug4wkT9J0sf2F1hFhC3wgI835jk7CUknxwrwmyKgtHgdq1zFbyPBC
         CxawTufEgxntBMKa8O3SACDSEAOtJPnB2PwOOj9s6wYJ7sLfiveMarhVnhG4K/V5864Q
         2ObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tAqeOmLLvrhoPY0E1xetlsHpflqhaA+Z8Ki3Cj1kgvI=;
        fh=87JA2g+aefdQu/sP5FgB0HLye2HkHZ+8oVnmMnAT0WM=;
        b=Ca4F1q72e82Ohq0o9dsRxF+6eZLXQfIe89ybdUHTPMDmOk+Giqwi8Sf6/oXVZM2Cvu
         /+5G34cd/NC7kpCQzFai0doABwf/0wrOlo/pOgCoi+DP3XUQEZDo7i4mHeV94DPnwtN6
         XYi8NbXRGQ3dcINInrvZTyMNq3N6Gb1F56kDAlOpiOuGShUdxOPzq+FC6Cb17FQFFWeA
         8b2VfPkZsDbGGiXgYx0Mc2ZTLw7CasN9fDfOYFuOgwxVuGUErGgZpAmivMfFCjW0rQ3U
         VoN9IeEYm1iJhd3CzUNLMntaOQs5hZX2fUkk1QltJhOu3YF7K2Hx05c3FAONmDNPi5Jm
         ljEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773812930; x=1774417730; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tAqeOmLLvrhoPY0E1xetlsHpflqhaA+Z8Ki3Cj1kgvI=;
        b=FzmbwVl5ISDPKIVZCb1Rdp6qrcXrbHlWKpwII6mtu6fMOyIgMboIK0ERcDpOg1SgJo
         z+GbBMIOL08hH0LSyda+srfbd1L1E/DmH3L/xj9bPaRWKqBV8u5iUTYRIfI14xK5ESlt
         kVrmezrPM0i5q2wY889yB0Ssy1NlhZfpiGb9BlHZjeTGzyrF4d1a657Ld38FaFLAKsDK
         Lh8tXq781z01qtA3k/A8aOjBZ3P5uYDi1CqJTapzUfkWlugvgpTL7yQXnJVUFH5UdPJS
         v7AhlqhhGFAT53xyXtcesUIT+yGEFm67W0tzW8AjGHEwXupRRoGBgZxn8ezIMS0M3tAh
         MtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773812930; x=1774417730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAqeOmLLvrhoPY0E1xetlsHpflqhaA+Z8Ki3Cj1kgvI=;
        b=gGpKtcim6HNwz+hHi/ljRMFXlcBRPGem2/xfRDw5h9tpOZgTTVyYwkxYJlUY8SbWva
         /qsHHF+aiUj09K88x0bm/keAbbB0K4cbjKBBVCq8bqGfCuFjmd2r6RW8dFTxOzN/j5l9
         8aWYO5qYeGhgJEuoH7FZSNryk47KC0ivNDb29OZhQm5R9SnR2N4OZfFltR6RccK7xyAE
         sRJeYqDqiCZr56DUYkXmBI1y/vc8FHP9EWH2druyaDZJ5xARb0kHAH2WTpcrLQL9NlhW
         59Tq68N2X+tyk1RXTzQup+qBLghQu4/QMd5Oh45Vw3UBhK7p+wrxeN8aXzeA1/CD1q5s
         eaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk29iBIKIRsUoxnb8eosov0ObaKIpPIhEhbs55ESKom1rL/XETYDToL2z3YeRT3M2P5hD4lsKEu6oc+5VHj3feBII=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUUOJRdZZ097qdWv5EbDmQ0dWUFZl2SItxPHAib/37wHT1sTvy
	DxFedCWjxKIXZK9MOcDaUZSLzol/dqF1Y17XVkYxqqkBAIbM+KRYB+WRvbgM46BX67VIPQb11d2
	ZRobQc0pBkGgbmDM+pLHQpD13jHLza68=
X-Gm-Gg: ATEYQzzcET7UX/TM+96Iq7OnmxavLcpUR5hE7sYSuPFOmIrBZQvTbbwQhxLmjd32LO7
	H2X+k9HcUaQq3DacIbd4WGUfiaI18daKdcGs/xRGXEKQa8PBJVgDEu9iBmJtBEY6LPvMtOptiqz
	B9g8YAPosaKiDJ2mCa2c/uvUueIHjLSfeMrpUjcp7ztAxUJ5LSkFLLBWYVXxxKSmCoC2p/bwfOc
	DvD/9naQWbW6TrhX+vbM1dwg9kLtAvI2pYmeN+kfBOanj6sXLRCMcqWy4LnBzYmPgqlbTXNgBit
	nFrqJxK65g8zsR9AUXgbNjX/SbS9BW08LveRHIxAmQ9UyTLgtYSvSM02xAwiG1qvUJ79rE35K11
	CwuxYlfFHwYNMRZTOqZCqIeO8
X-Received: by 2002:a05:690c:39b:b0:79a:7127:bbbe with SMTP id
 00721157ae682-79a7188dafemr21465787b3.7.1773812929681; Tue, 17 Mar 2026
 22:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260318050333.510028-1-viswanath.kraleti@oss.qualcomm.com> <CA+s=J=zQN1Fw-TRXG5Y=tYFVMFW2KYQeix2TeZaFtU56xMyUYA@mail.gmail.com>
In-Reply-To: <CA+s=J=zQN1Fw-TRXG5Y=tYFVMFW2KYQeix2TeZaFtU56xMyUYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 22:48:23 -0700
X-Gm-Features: AaiRm52HbyrRHXE-qR43wk2BBJ3yDwK6g6a8bNPilEyfCDA_zbarlv95_qa2Q1k
Message-ID: <CAMKF1soe05VwdSndWO0SnOSWRG7175AgAUypTc+f8Wt=-Tf_aw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] android-tools-conf-configfs: make USB
 gadget IDs configurable
To: anuj.mittal@oss.qualcomm.com
Cc: viswanath.kraleti@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000925dd1064d4601d6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125345

--000000000000925dd1064d4601d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah thats a good followup I would think.


On Tue, Mar 17, 2026 at 10:27=E2=80=AFPM Anuj Mittal via lists.openembedded=
.org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> I think we should at the same time also delete the same
> android-tools-conf recipe present in
> ./meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools.
> Otherwise, the behavior would be different depending on whether
> meta-selinux is included or not.
>
> On Wed, Mar 18, 2026 at 1:03=E2=80=AFPM Viswanath Kraleti via
> lists.openembedded.org
> <viswanath.kraleti=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > The android-gadget-setup script currently hardcodes the USB vendor ID,
> > product ID, and configuration string. This makes it difficult for BSP
> > layers to customize USB gadget identity with platform specific values.
> >
> > Introduce variables for the vendor ID, product ID, and configuration
> > string when populating the configfs attributes. This allows machine
> > or distro specific overrides via `/etc/android-gadget-setup.machine`,
> > while preserving the existing default values.
> >
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > ---
> >  .../android-tools-conf-configfs/android-gadget-setup     | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-setup
> b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-setup
> > index dbd7115151..47e4edb9be 100644
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-setup
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/andr=
oid-gadget-setup
> > @@ -2,9 +2,12 @@
> >
> >  set -e
> >
> > +conf=3D"Conf 1"
> >  manufacturer=3DRPB
> >  model=3D"Android device"
> > +product=3D0xd002
> >  serial=3D0123456789ABCDEF
> > +vendor=3D0x18d1
> >
> >  if [ -r /etc/android-gadget-setup.machine ] ; then
> >         . /etc/android-gadget-setup.machine
> > @@ -23,12 +26,12 @@ mkdir configs/c.1
> >  mkdir functions/ffs.usb0
> >  mkdir strings/0x409
> >  mkdir configs/c.1/strings/0x409
> > -echo -n 0x18d1 > idVendor
> > -echo -n 0xd002 > idProduct
> > +echo -n "$vendor"  > idVendor
> > +echo -n "$product" > idProduct
> >  echo "$serial" > strings/0x409/serialnumber
> >  echo "$manufacturer" > strings/0x409/manufacturer
> >  echo "$model" > strings/0x409/product
> > -echo "Conf 1" > configs/c.1/strings/0x409/configuration
> > +echo "$conf" > configs/c.1/strings/0x409/configuration
> >  ln -s functions/ffs.usb0 configs/c.1
> >
> >  mkdir -p /dev/usb-ffs/adb
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125344):
> https://lists.openembedded.org/g/openembedded-devel/message/125344
> Mute This Topic: https://lists.openembedded.org/mt/118378467/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000925dd1064d4601d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>yeah thats a good followup I would think.</div><div><=
br></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2026 at 10:27=E2=80=AFPM Anu=
j Mittal via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembed=
ded.org">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">I think we should at the sa=
me time also delete the same<br>
android-tools-conf recipe present in<br>
./meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools.<br>
Otherwise, the behavior would be different depending on whether<br>
meta-selinux is included or not.<br>
<br>
On Wed, Mar 18, 2026 at 1:03=E2=80=AFPM Viswanath Kraleti via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;viswanath.kraleti=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedd=
ed.org" target=3D"_blank">oss.qualcomm.com@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt; The android-gadget-setup script currently hardcodes the USB vendor ID,=
<br>
&gt; product ID, and configuration string. This makes it difficult for BSP<=
br>
&gt; layers to customize USB gadget identity with platform specific values.=
<br>
&gt;<br>
&gt; Introduce variables for the vendor ID, product ID, and configuration<b=
r>
&gt; string when populating the configfs attributes. This allows machine<br=
>
&gt; or distro specific overrides via `/etc/android-gadget-setup.machine`,<=
br>
&gt; while preserving the existing default values.<br>
&gt;<br>
&gt; Signed-off-by: Viswanath Kraleti &lt;<a href=3D"mailto:viswanath.krale=
ti@oss.qualcomm.com" target=3D"_blank">viswanath.kraleti@oss.qualcomm.com</=
a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../android-tools-conf-configfs/android-gadget-setup=C2=A0 =C2=
=A0 =C2=A0| 9 ++++++---<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf=
-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/and=
roid-tools-conf-configfs/android-gadget-setup<br>
&gt; index dbd7115151..47e4edb9be 100644<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-config=
fs/android-gadget-setup<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-config=
fs/android-gadget-setup<br>
&gt; @@ -2,9 +2,12 @@<br>
&gt;<br>
&gt;=C2=A0 set -e<br>
&gt;<br>
&gt; +conf=3D&quot;Conf 1&quot;<br>
&gt;=C2=A0 manufacturer=3DRPB<br>
&gt;=C2=A0 model=3D&quot;Android device&quot;<br>
&gt; +product=3D0xd002<br>
&gt;=C2=A0 serial=3D0123456789ABCDEF<br>
&gt; +vendor=3D0x18d1<br>
&gt;<br>
&gt;=C2=A0 if [ -r /etc/android-gadget-setup.machine ] ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. /etc/android-gadget-setup.machine<b=
r>
&gt; @@ -23,12 +26,12 @@ mkdir configs/c.1<br>
&gt;=C2=A0 mkdir functions/ffs.usb0<br>
&gt;=C2=A0 mkdir strings/0x409<br>
&gt;=C2=A0 mkdir configs/c.1/strings/0x409<br>
&gt; -echo -n 0x18d1 &gt; idVendor<br>
&gt; -echo -n 0xd002 &gt; idProduct<br>
&gt; +echo -n &quot;$vendor&quot;=C2=A0 &gt; idVendor<br>
&gt; +echo -n &quot;$product&quot; &gt; idProduct<br>
&gt;=C2=A0 echo &quot;$serial&quot; &gt; strings/0x409/serialnumber<br>
&gt;=C2=A0 echo &quot;$manufacturer&quot; &gt; strings/0x409/manufacturer<b=
r>
&gt;=C2=A0 echo &quot;$model&quot; &gt; strings/0x409/product<br>
&gt; -echo &quot;Conf 1&quot; &gt; configs/c.1/strings/0x409/configuration<=
br>
&gt; +echo &quot;$conf&quot; &gt; configs/c.1/strings/0x409/configuration<b=
r>
&gt;=C2=A0 ln -s functions/ffs.usb0 configs/c.1<br>
&gt;<br>
&gt;=C2=A0 mkdir -p /dev/usb-ffs/adb<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125344): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125344" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125344</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118378467/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118378467/1997914</a><br>
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

--000000000000925dd1064d4601d6--

