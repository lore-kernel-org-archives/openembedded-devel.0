Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA9B1088E70
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 03:23:41 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3226.1773890617506694103
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 20:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iFhXalyn;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so728835d50.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 20:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773890616; cv=none;
        d=google.com; s=arc-20240605;
        b=dfbtY35w80aihwoLfDjNLuEOAfGLB5aochlTTfktPh4loYWHoSQGs1JEfa1hIKVVm1
         C360c7kum2AzDv7UJYl3pscl3mw+UZrO+CzPg4WSOkosiEtaEkxKOYLlzHpmobJrDtRY
         n11zZjEUdH19Br4YcgSHhyavz1GMyEK09ufhPg5oSr5U4sMmEABHMZbRrz21HMgbCSY3
         E8KIIS8/QTkXHtfV4Eay/rjnpAIkwYiovFVeWsmJNJJqtUSn214nlOY8LTSAaoHs5Nsv
         9RlTHEYIAlrYNySS8jbgsX+A3Ahsv98PPX418194rMrDYQtOJnWWKVAIOnAI9ncBJE9l
         Rd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S00mXiK3FurHE77g1I7oxzwcv/ZXsJunASY8RJiqE7Y=;
        fh=aHD971P4Ofrf0ph2vBNzAskpF7q+RiLHBOwiOngzFCw=;
        b=SAMi1UEm0qgQchvagZ5nTTDCwCd6opRavcVbkniXNE9eRycQuQBO69hztK18nKP4B1
         a2G5SM8siiYgtlsSMDqjFmGsbbvGZp05vfL1xeCr1/KqnPUGRWFmkiDXxn6zZTvjxl9L
         bG04S5+pJ1tJ+hrcf6poZwqYA8lLhr5XPnFTOqhy7C9dQTh27iYuabv51iJMLeuzWndd
         /DNyXQO13t0e2srXmRMZFfV02513KQoMDncRBZnoguzhKk2i6Pr+nTJGP7qoPco+jMck
         69VKWBzZftCRC9OnESlvWJdm7oD2aLI6BeU0E9fnws3g+h+QB/u5dUStm1ZRbiXFfZia
         Rz3Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773890616; x=1774495416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S00mXiK3FurHE77g1I7oxzwcv/ZXsJunASY8RJiqE7Y=;
        b=iFhXalynJWDTf4ZlT+4qulxizXTlrMLf+2YGH9Wnv2rlpS2gi3x5lm9R+wM4x5IfIr
         3sEXCrEiwRYgUluAwwiY8ZXhPngIUw0DiALCYmblxuIyTyopqjRNnbopX38Lr4gGqXTW
         saf0DsGuLoMne1t9iBDwp9/UCm1bdmBd0O/NKXx7+AF6Ga1hLhoA6Q5vqBtSz/oV3xdo
         00+PY1DMWSQ0IPq7ex+DdLEpxNh8lM/MdQwloLffXmNtBqNbXJ2Nd6YJuLFh/lM7Gm7d
         hFsf9AmtXnWfLkVktok+N85ssyYs57YE1rSgDFfjzw8gduKgYVB+PrORyz1/k0vkGHTu
         wCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773890616; x=1774495416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S00mXiK3FurHE77g1I7oxzwcv/ZXsJunASY8RJiqE7Y=;
        b=pdAyaM1iCM8Hi+R7SbPgxP3SDXp8nWdICWDQilSZMFEl2AkaRtRlDE5bdjesJLHbiT
         mYtKE3MGD0ym1uMfs9EV56yYpwXJ00Rw8jBZdld6b7CgeZdKS0FYCUizJbR19iQA2Ng5
         DAeEPCqYXrXAoLGiT0SY7uHVwRECOrC2Ob1Sj6B743DPC2GWQKiHL4AHl8Cquzu6E11P
         ozbzRA/Z6S8lXpwYucRU1I3vk72URQYmmDOZCr1SiSQrJKjZFGggsHfEdNEgpgkgD2jd
         yLO0lo+JEMCkVwTM9DimV6NuFFAY8q3MAvaJSZfioghXToGkOqLI28hCM7x4K+z9njRa
         NfLw==
X-Gm-Message-State: AOJu0Yy/gtOe48n8TcZ/hIeCN9eYCawmjA/QHNNnLThPRK49V81jP6DB
	TcDWTYXW4PzVxgP9TPgUkeiJnaVpf1TCQyoRbVhXYT+Xi/fbLiY4CGeQfVGOJVy/Q6i1dPQCCVn
	Hdaz+5zvhnmEaAmH3ztPe3d/D0Mge6jQ=
X-Gm-Gg: ATEYQzwC88MHQec9dm700Q5+WXz3wWWLcduq4u1LtJ69VGVnjZDUaqm6iUIqiA9r7D5
	LHU884azi8QrodLSDwauPjKwCCahXc2PXIrLz4VaZTocw8/BOBCipQ4l3DeEzFrHRwKNwKS1JmB
	ugEL6MzVCV2CB9logxjQuvVnsO/cESR2zfWA/urBYkjxFxW3w5y6vrmc97B+fJHOF6av+gEcnf3
	XdbDgxpoSFj5mJd5mdBDgonwYv9LM88MjtRByjAtO3jYOYwfqJFYqrxdEQo2Ubpc88HQfY+jbgd
	cQuoNsNATmG61pRGO6p2FE4+2idfE3jjXAr9xsga7SaYODo+4LB6YNq+cquYR8dLElDhhgMEGrv
	NyHHO/Xq1qjGxCHhiyb/h+oZK
X-Received: by 2002:a53:a94a:0:b0:64a:f160:2354 with SMTP id
 956f58d0204a3-64e91627b1cmr4451253d50.79.1773890616427; Wed, 18 Mar 2026
 20:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so=RHPpR_uQk5XhGWLPywr_x-4cr=Ub-nODf14hSAw83A@mail.gmail.com>
 <DB5PR02MB10213E9B6359ED0E2BCAD3968EF4FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E9B6359ED0E2BCAD3968EF4FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2026 20:23:25 -0700
X-Gm-Features: AaiRm50QrZenYF_4wg2thTwRkh-oRFBnbEkm8viSVQJlHelMDkNB1YIs1xGD8jU
Message-ID: <CAMKF1srQ2N9F5__Y9k1_yNy5-wfryCqDqAkR8qrJo_rfM878TA@mail.gmail.com>
Subject: Re: [oe] Recipes needing build fixes after glibc 2.43 upgrade
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000010080c064d5818d7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 03:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125373

--00000000000010080c064d5818d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome, thanks for the help

On Wed, Mar 18, 2026, 8:01=E2=80=AFPM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> I=E2=80=99ve sent a backport of a patch for liboauth2. Note that upstream=
 has made
> a mess. They first fixed the problem in commit
> 0dcba079907d559550ee8d9a201d26203bb8aebd (the commit I have backported),
> but then they reverted it in commit
> 155b93b2efd1e8b0022c9bdad2297a2a670dc29c under the pretense of fixing the
> issue (https://github.com/OpenIDC/liboauth2/issues/70). I have reported
> the mistake as https://github.com/OpenIDC/liboauth2/issues/73...
>
>
>
> //Peter
>
>
>
> *From:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> *On Behalf Of *Khem Raj via
> lists.openembedded.org
> *Sent:* den 18 mars 2026 22:40
> *To:* openembeded-devel <Openembedded-devel@lists.openembedded.org>
> *Subject:* [oe] Recipes needing build fixes after glibc 2.43 upgrade
>
>
>
> Hello All,
>
>
>
> There are few recipes currently broken on meta-openembedded layers,
> predominantly due to glibc upgrade. Help is needed in fixing them so we c=
an
> have world builds working again on AB
>
>
>
> Here is list
>
>
>
> Summary: 16 tasks failed:
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-kernel/minicoredumper/minicoredumper_2.0.7.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/minicoredumper/2.0.7/temp/log.do_compile.55019
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-extended/canopenterm/canopenterm_1.0.14.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/canopenterm/1.0.14/temp/log.do_compile.38373
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/r=
ecipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/python3-xstatic-font-awesome/
> 6.2.1.1/temp/log.do_compile.107676
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-extended/sysdig/sysdig_0.39.0.bb:
> do_configure
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/sysdig/0.39.0/temp/log.do_configure.124550
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-bsp/fwupd/fwupd-efi_1.8.bb:
> do_configure
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/fwupd-efi/1.8/temp/log.do_configure.145475
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networki=
ng/recipes-daemons/opensaf/opensaf_5.22.01.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/opensaf/5.22.01/temp/log.do_compile.161530
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networki=
ng/recipes-support/ntopng/ntopng_5.2.1.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/ntopng/5.2.1/temp/log.do_compile.154712
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/r=
ecipes-devtools/python/python3-pychromecast_14.0.9.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/python3-pychromecast/14.0.9/temp/log.do_compile.175919
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-extended/qad/qad_git.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/qad/0.0+git/temp/log.do_compile.176411
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-test/libfaketime/libfaketime_0.9.10.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/libfaketime/0.9.10/temp/log.do_compile.182340
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-devtools/luaposix/luaposix_36.2.1.bb:
> do_package
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/luaposix/36.2.1/temp/log.do_package.186406
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-support/liboauth2/liboauth2_2.2.0.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/liboauth2/2.2.0/temp/log.do_compile.199073
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networki=
ng/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/open-vm-tools/13.0.10/temp/log.do_compile.193667
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networki=
ng/recipes-support/netcf/netcf_0.2.8.bb:
> do_configure
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/netcf/0.2.8+git/temp/log.do_configure.208957
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-support/links/links-x11_2.26.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/links-x11/2.26/temp/log.do_compile.215047
>
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recip=
es-support/links/links_2.29.bb:
> do_compile
>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/links/2.29/temp/log.do_compile.218734
> Summary: There were 26 ERROR messages, returning a non-zero exit code.
>
>
>
> and a build log with errors is here
>
>
>
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_inl=
ine
>
>
>
> Thanks
>
> -Khem
>
>
>

--00000000000010080c064d5818d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Awesome, thanks for the help</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Mar 18, 2026, 8:01=E2=80=AFPM Peter Kjellerstedt &lt;<a href=3D"mailto:pet=
er.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple" style=3D"overflow-wrap: bre=
ak-word;">
<div class=3D"m_4583157845974982726WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">I=E2=80=99ve sent a backport =
of a patch for liboauth2. Note that upstream has made a mess. They first fi=
xed the problem in commit
 0dcba079907d559550ee8d9a201d26203bb8aebd (the commit I have backported), b=
ut then they reverted it in commit 155b93b2efd1e8b0022c9bdad2297a2a670dc29c=
 under the pretense of fixing the issue (<a href=3D"https://github.com/Open=
IDC/liboauth2/issues/70" target=3D"_blank" rel=3D"noreferrer">https://githu=
b.com/OpenIDC/liboauth2/issues/70</a>).
 I have reported the mistake as <a href=3D"https://github.com/OpenIDC/liboa=
uth2/issues/73" target=3D"_blank" rel=3D"noreferrer">
https://github.com/OpenIDC/liboauth2/issues/73</a>...<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> <a href=3D"mailto:openembedd=
ed-devel@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">opene=
mbedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded=
-devel@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openemb=
edded-devel@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Khem Raj via <a href=3D"http://lists.openembedded.org" =
target=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a><br>
<b>Sent:</b> den 18 mars 2026 22:40<br>
<b>To:</b> openembeded-devel &lt;<a href=3D"mailto:Openembedded-devel@lists=
.openembedded.org" target=3D"_blank" rel=3D"noreferrer">Openembedded-devel@=
lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> [oe] Recipes needing build fixes after glibc 2.43 upgrade<u=
></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hello All,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">There are few recipes currently broken on meta-opene=
mbedded layers, predominantly due to glibc upgrade. Help is needed in fixin=
g them so we can have world builds working again on AB<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Here is list<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Summary: 16 tasks failed:<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.55019<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.38373<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:do_comp=
ile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/python3-xstatic-font-awesome/<a href=3D"http://6.2.1.=
1/temp/log.do_compile.107676" target=3D"_blank" rel=3D"noreferrer">6.2.1.1/=
temp/log.do_compile.107676</a><br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/sysdig/sysdig_0.39.0.bb:do_configure<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/sysdig/0.39.0/temp/log.do_configure.124550<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.145475<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/opensaf/opensaf_5.22.01.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/opensaf/5.22.01/temp/log.do_compile.161530<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.154712<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pychromecast_14.0.9.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/python3-pychromecast/14.0.9/temp/log.do_compile.17591=
9<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/qad/qad_git.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.176411<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-test/libfaketime/libfaketime_0.9.10.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/libfaketime/0.9.10/temp/log.do_compile.182340<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/luaposix/luaposix_36.2.1.bb:do_package<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/luaposix/36.2.1/temp/log.do_package.186406<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/liboauth2/liboauth2_2.2.0.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/liboauth2/2.2.0/temp/log.do_compile.199073<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:do_compile<b=
r>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.193667<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/netcf/netcf_0.2.8.bb:do_configure<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.208957<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/links/links-x11_2.26.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/links-x11/2.26/temp/log.do_compile.215047<br>
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/links/links_2.29.bb:do_compile<br>
=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/links/2.29/temp/log.do_compile.218734<br>
Summary: There were 26 ERROR messages, returning a non-zero exit code.<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">and a build log with errors is here<u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://autobuilder.yoctoproject.org/valk=
yrie/api/v2/logs/5867932/raw_inline" target=3D"_blank" rel=3D"noreferrer">h=
ttps://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_inline=
</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">-Khem<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--00000000000010080c064d5818d7--

