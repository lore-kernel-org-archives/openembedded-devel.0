Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F232CC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 05:08:02 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.14806.1661144881444083442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WxSSwufP;
 spf=pass (domain: gmail.com, ip: 209.85.128.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-33365a01f29so262756687b3.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=LT2rPCCvV2UjsSDme8fVgRpVyeu7AA3ONWC2NSJiPgA=;
        b=WxSSwufP0nmtSIWp2U892wcS4vH1kp5tjYA8pkl7Hjb/DeQakbuEcE5IAXYYin2MhI
         L6vNHhFTsqiuOYAkih8QIki4ifEdRGDH3Q6ir6Zyuj2gLaOqKZNVxjfPJtqWQcSrLxZp
         7oS0ZEH8snGW3UXBzfFvw1LDhlRZc52sFlAyVD2KogbJUYCTxrRgOWlWppZz5szSvCdZ
         Y0oaMch62kuZydkKlRTCi5rjn21kcHE4kIc9EtgN2V6tKz/MI6C1ueQ3kWwD4BCfBbr3
         qdErfgBCDjTJ8E6Xp7uk5nWCmNd/PNxKAer+NitN7r34tQINDNJeCdjsvdvoMyD13W0I
         uAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=LT2rPCCvV2UjsSDme8fVgRpVyeu7AA3ONWC2NSJiPgA=;
        b=WmOPKAuZOuUNZtqUC5r6gZlU7PeovtXayRVJwr4pggQ1rewYvkC6SIUI+8OvkCAvJs
         P3KkClYg44Tf5TwTcaUzRauooxm0uhPomfpyFAU7Mlgb1SH4nRl095drR76PVBtO5NK+
         Xe7fwb5xcIOjRcf8TrD1k0lhyTCtnhyQgTetMLQcH2rhEL5jdJV3HjK7YC+ASOMLCahq
         A/TPcEpknIeKQ1hw6T3DAcdyRW/0WuWy1gCxX9wX8lfgMrwzh4tp1nSGlK2sR6VHjfIz
         EaA0CjcuDYcx9LwP66SZfWjDv2knv0r1ifKPuummgVNUCCWRv1Ub3el7M7PZDYhNgRbD
         8NIQ==
X-Gm-Message-State: ACgBeo0zi2QKelMxFr/yJLXBKRWqrjIJ1z25TQ3BgVCS+Bt728jP9jtE
	t+cRDNP0r446lrAnlif0ybqjbU1gUQ5bwpr4wSk=
X-Google-Smtp-Source: 
 AA6agR6/tSJ4rRp7YztUtkDSmopTgJvNEu5qoKtZ6/nZMFUKldbNmRqkNrlL2Yq4eIaEKhmzPYDUcx+rrFXi2cm7dwc=
X-Received: by 2002:a81:b61c:0:b0:333:9118:4020 with SMTP id
 u28-20020a81b61c000000b0033391184020mr17898896ywh.282.1661144880441; Sun, 21
 Aug 2022 22:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220608163628.5745-1-potin.lai.pt@gmail.com>
 <CAMKF1sqpcSuHwd5tPz6R=WQ=Yo=yZneTCYSk9LQhq98kBgQPDg@mail.gmail.com>
 <c60f9137-1f91-2393-61e0-8d6834ad5663@gmail.com>
In-Reply-To: <c60f9137-1f91-2393-61e0-8d6834ad5663@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Aug 2022 22:07:49 -0700
Message-ID: 
 <CAMKF1srG_1YAOtoL0ch95425eRmxggvwmtci3Z=Ahm3Kac6UdA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v3 1/1] mdio-tools: add recipes
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	Patrick Williams <patrick@stwcx.xyz>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000084ed5e05e6cd6e9e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 05:08:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98349

--00000000000084ed5e05e6cd6e9e
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 21, 2022 at 8:53 PM Potin Lai <potin.lai.pt@gmail.com> wrote:

>
> On 6/30/22 18:59, Khem Raj wrote:
> > This fails to build on master with latest linux-yocto for kernel.
> >
> > https://errors.yoctoproject.org/Errors/Details/659130/
> Hi Maintainer,
>
> The kernel config for enable MDIO feature has merged into
> yocto-kernel-cache.
> LINK:
> https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-5.15&id=0d58e2d6a7824df62129af91bbe9fadfdb5f9dce
>
> This patch should compiled for qemuarm by now, and I have tested with
> local build.
> Just wondering that how to trigger patch merging process for this patch
> again? should I resend this patch with new version?


Yes please send a version tested with latest master of core metadata


>
> Thanks,
> Potin
> > On Wed, Jun 8, 2022 at 12:39 PM Potin Lai <potin.lai.pt@gmail.com>
> wrote:
> >> From: Enguerrand de Ribaucourt <
> enguerrand.de-ribaucourt@savoirfairelinux.com>
> >>
> >> Self-description from the README: mdio-tools is a low-level debug tool
> >> for communicating with devices attached to an MDIO bus.
> >>
> >> Signed-off-by: Enguerrand de Ribaucourt <
> enguerrand.de-ribaucourt@savoirfairelinux.com>
> >> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> >> ---
> >>
> >> LINK: [v2]
> https://lore.kernel.org/all/20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
> >> LINK: [v1]
> https://lore.kernel.org/all/20220107150722.2221609-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
> >>
> >> change v2 --> v3:
> >> * update version to 1.1.1
> >>
> >> change v1 --> v2:
> >> * moved in recipes-support
> >> * removed version in mdio-tools_1.0.1.inc filename
> >>
> >> ---
> >>  .../recipes-support/mdio-tools/mdio-netlink_git.bb  | 13 +++++++++++++
> >>  .../recipes-support/mdio-tools/mdio-tools.inc       |  9 +++++++++
> >>  .../recipes-support/mdio-tools/mdio-tools_git.bb    |  9 +++++++++
> >>  3 files changed, 31 insertions(+)
> >>  create mode 100644 meta-networking/recipes-support/mdio-tools/
> mdio-netlink_git.bb
> >>  create mode 100644
> meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> >>  create mode 100644 meta-networking/recipes-support/mdio-tools/
> mdio-tools_git.bb
> >>
> >> diff --git a/meta-networking/recipes-support/mdio-tools/
> mdio-netlink_git.bb b/meta-networking/recipes-support/mdio-tools/
> mdio-netlink_git.bb
> >> new file mode 100644
> >> index 000000000..b50d33f90
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
> >> @@ -0,0 +1,13 @@
> >> +require mdio-tools.inc
> >> +
> >> +DEPENDS += "virtual/kernel libmnl"
> >> +# This module requires Linux 5.6 higher
> >> +
> >> +S = "${WORKDIR}/git/kernel"
> >> +
> >> +inherit module
> >> +
> >> +EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
> >> +MODULES_INSTALL_TARGET = "install"
> >> +
> >> +RPROVIDES:${PN} += "kernel-module-mdio-netlink"
> >> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> >> new file mode 100644
> >> index 000000000..a37500d93
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> >> @@ -0,0 +1,9 @@
> >> +DESCRIPTION = "A low-level debug tool for communicating with devices
> attached to an MDIO bus"
> >> +SECTION = "networking"
> >> +HOMEPAGE = "https://github.com/wkz/mdio-tools"
> >> +LICENSE = "GPLv2"
> >> +LIC_FILES_CHKSUM =
> "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >> +
> >> +SRC_URI = "git://
> github.com/wkz/mdio-tools.git;protocol=https;branch=master"
> >> +SRCREV = "07cbff2d5e2de05037e5e7edd5044d678394c8d1"
> >> +PV = "1.1.1"
> >> diff --git a/meta-networking/recipes-support/mdio-tools/
> mdio-tools_git.bb b/meta-networking/recipes-support/mdio-tools/
> mdio-tools_git.bb
> >> new file mode 100644
> >> index 000000000..cd4df3da0
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
> >> @@ -0,0 +1,9 @@
> >> +require mdio-tools.inc
> >> +
> >> +DEPENDS += "libmnl"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit pkgconfig autotools
> >> +
> >> +RDEPENDS:${PN} = "kernel-module-mdio-netlink"
> >> --
> >> 2.17.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#97444):
> https://lists.openembedded.org/g/openembedded-devel/message/97444
> >> Mute This Topic: https://lists.openembedded.org/mt/91627189/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

--00000000000084ed5e05e6cd6e9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 21, 2022 at 8:53 PM Potin Lai &lt;<a href=3D"ma=
ilto:potin.lai.pt@gmail.com">potin.lai.pt@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)"><br>
On 6/30/22 18:59, Khem Raj wrote:<br>
&gt; This fails to build on master with latest linux-yocto for kernel.<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/659130/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/659130/</a><br>
Hi Maintainer,<br>
<br>
The kernel config for enable MDIO feature has merged into yocto-kernel-cach=
e.<br>
LINK: <a href=3D"https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=
=3Dyocto-5.15&amp;id=3D0d58e2d6a7824df62129af91bbe9fadfdb5f9dce" rel=3D"nor=
eferrer" target=3D"_blank">https://git.yoctoproject.org/yocto-kernel-cache/=
commit/?h=3Dyocto-5.15&amp;id=3D0d58e2d6a7824df62129af91bbe9fadfdb5f9dce</a=
><br>
<br>
This patch should compiled for qemuarm by now, and I have tested with local=
 build.<br>
Just wondering that how to trigger patch merging process for this patch aga=
in? should I resend this patch with new version?</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">Yes please send a version tested with lates=
t master of core metadata=C2=A0</div><div dir=3D"auto"><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)" dir=3D"auto"><br>
<br>
Thanks,<br>
Potin<br>
&gt; On Wed, Jun 8, 2022 at 12:39 PM Potin Lai &lt;<a href=3D"mailto:potin.=
lai.pt@gmail.com" target=3D"_blank">potin.lai.pt@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; From: Enguerrand de Ribaucourt &lt;<a href=3D"mailto:enguerrand.de=
-ribaucourt@savoirfairelinux.com" target=3D"_blank">enguerrand.de-ribaucour=
t@savoirfairelinux.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Self-description from the README: mdio-tools is a low-level debug =
tool<br>
&gt;&gt; for communicating with devices attached to an MDIO bus.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Enguerrand de Ribaucourt &lt;<a href=3D"mailto:engu=
errand.de-ribaucourt@savoirfairelinux.com" target=3D"_blank">enguerrand.de-=
ribaucourt@savoirfairelinux.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.=
com" target=3D"_blank">potin.lai.pt@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; LINK: [v2] <a href=3D"https://lore.kernel.org/all/20220201142608.1=
86135-1-enguerrand.de-ribaucourt@savoirfairelinux.com/" rel=3D"noreferrer" =
target=3D"_blank">https://lore.kernel.org/all/20220201142608.186135-1-engue=
rrand.de-ribaucourt@savoirfairelinux.com/</a><br>
&gt;&gt; LINK: [v1] <a href=3D"https://lore.kernel.org/all/20220107150722.2=
221609-1-enguerrand.de-ribaucourt@savoirfairelinux.com/" rel=3D"noreferrer"=
 target=3D"_blank">https://lore.kernel.org/all/20220107150722.2221609-1-eng=
uerrand.de-ribaucourt@savoirfairelinux.com/</a><br>
&gt;&gt;<br>
&gt;&gt; change v2 --&gt; v3:<br>
&gt;&gt; * update version to 1.1.1<br>
&gt;&gt;<br>
&gt;&gt; change v1 --&gt; v2:<br>
&gt;&gt; * moved in recipes-support<br>
&gt;&gt; * removed version in mdio-tools_1.0.1.inc filename<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../recipes-support/mdio-tools/<a href=3D"http://mdio-netlin=
k_git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-netlink_git.bb</a>=C2=
=A0 | 13 +++++++++++++<br>
&gt;&gt;=C2=A0 .../recipes-support/mdio-tools/mdio-tools.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 9 +++++++++<br>
&gt;&gt;=C2=A0 .../recipes-support/mdio-tools/<a href=3D"http://mdio-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-tools_git.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 9 +++++++++<br>
&gt;&gt;=C2=A0 3 files changed, 31 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/mdio-tool=
s/<a href=3D"http://mdio-netlink_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">mdio-netlink_git.bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/mdio-tool=
s/mdio-tools.inc<br>
&gt;&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/mdio-tool=
s/<a href=3D"http://mdio-tools_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>mdio-tools_git.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-networking/recipes-support/mdio-tools/<a href=3D=
"http://mdio-netlink_git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-netl=
ink_git.bb</a> b/meta-networking/recipes-support/mdio-tools/<a href=3D"http=
://mdio-netlink_git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-netlink_g=
it.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000..b50d33f90<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-networking/recipes-support/mdio-tools/<a href=3D"http:/=
/mdio-netlink_git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-netlink_git=
.bb</a><br>
&gt;&gt; @@ -0,0 +1,13 @@<br>
&gt;&gt; +require mdio-tools.inc<br>
&gt;&gt; +<br>
&gt;&gt; +DEPENDS +=3D &quot;virtual/kernel libmnl&quot;<br>
&gt;&gt; +# This module requires Linux 5.6 higher<br>
&gt;&gt; +<br>
&gt;&gt; +S =3D &quot;${WORKDIR}/git/kernel&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit module<br>
&gt;&gt; +<br>
&gt;&gt; +EXTRA_OEMAKE =3D &quot;KDIR=3D${STAGING_KERNEL_DIR}&quot;<br>
&gt;&gt; +MODULES_INSTALL_TARGET =3D &quot;install&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +RPROVIDES:${PN} +=3D &quot;kernel-module-mdio-netlink&quot;<br>
&gt;&gt; diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools=
.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000..a37500d93<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc<br=
>
&gt;&gt; @@ -0,0 +1,9 @@<br>
&gt;&gt; +DESCRIPTION =3D &quot;A low-level debug tool for communicating wi=
th devices attached to an MDIO bus&quot;<br>
&gt;&gt; +SECTION =3D &quot;networking&quot;<br>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/wkz/mdio-tools" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/wkz/mdio-tools</a>&=
quot;<br>
&gt;&gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/git/COPYING;md5=3Db2=
34ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/wkz/mdio-too=
ls.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blan=
k">github.com/wkz/mdio-tools.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;=
<br>
&gt;&gt; +SRCREV =3D &quot;07cbff2d5e2de05037e5e7edd5044d678394c8d1&quot;<b=
r>
&gt;&gt; +PV =3D &quot;1.1.1&quot;<br>
&gt;&gt; diff --git a/meta-networking/recipes-support/mdio-tools/<a href=3D=
"http://mdio-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-tools_=
git.bb</a> b/meta-networking/recipes-support/mdio-tools/<a href=3D"http://m=
dio-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-tools_git.bb</a=
><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000..cd4df3da0<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-networking/recipes-support/mdio-tools/<a href=3D"http:/=
/mdio-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">mdio-tools_git.bb<=
/a><br>
&gt;&gt; @@ -0,0 +1,9 @@<br>
&gt;&gt; +require mdio-tools.inc<br>
&gt;&gt; +<br>
&gt;&gt; +DEPENDS +=3D &quot;libmnl&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit pkgconfig autotools<br>
&gt;&gt; +<br>
&gt;&gt; +RDEPENDS:${PN} =3D &quot;kernel-module-mdio-netlink&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#97444): <a href=3D"https://lists.openembedded.=
org/g/openembedded-devel/message/97444" rel=3D"noreferrer" target=3D"_blank=
">https://lists.openembedded.org/g/openembedded-devel/message/97444</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9162=
7189/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/91627189/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000084ed5e05e6cd6e9e--

