Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E7D10854C9
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 21:40:03 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26193.1773870002486101289
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 14:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dGTiBuaF;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso676904d50.0
        for <Openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 14:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773870001; cv=none;
        d=google.com; s=arc-20240605;
        b=jLdEYRPxbhq71Dle1Yvizq3RkJXQ5g73BILsb968LmL7mEhO3JpLs8HPQcXVAJc3Y+
         CSLmFSx3FogjbAYofekQgRbL4D+xeS8r5cm7i2uZH3ABV394Stnn/N/+Ri9TldUT2d76
         6oH700yMJJFi2uZxukWPdl+N6ouCD8hADRDnWQPmo2s4Smdh4p1/o0ONPLiUxRXRV0AP
         IDNjrjzK8zWFqDPTzLxfcPxWFQq7wmKiKDsj8TeVuHDJwGNAw+ptejwSjJQqxHRJw0bu
         5S7RPnL8In9MqU3F2cPlg+1Jw88nV4IihSF6VMJQxqdRDtDtzmohJYAnc/ANNVsaMLKO
         S+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=elFtEZdInEbTfsmZU2GdOMJMr4ZJZvRsC2GkpEOzhEg=;
        fh=MnWQIt+qfwr8t22dRaNnBDw2a+cdT5G5r5+L6LPLbJw=;
        b=VgyWfcbzeFw1Zdj8D1GpUIpuWVDVOpyNlYOEusWoxvF4cB21DC0RS03xh0Gr8W9Ahh
         hHw74lObM1uusoItqVZqtjbjklBYuaQCiQCK99a+6xO5GmU5I10YK7RjvlEkq1eYN+5S
         Hvge3Ux1+Qdno8dlcAp9M9xyaFc9zcezn8o/bGrYF0Y7v0CXouNHruuMUflb4sBBQBWm
         GYTsavYeRKdt0dhSOELidY79hN15DEqCQBHxCd6UTnWAWZEgs2ip9F32DCgLY80kkRkr
         /jXCsG020BUZ38ysHr20MgvtJvTVd3chqQO4+dPHdQ+n198ac3CBBmaOFNu4ppDn7SwZ
         b1dw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773870001; x=1774474801; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=elFtEZdInEbTfsmZU2GdOMJMr4ZJZvRsC2GkpEOzhEg=;
        b=dGTiBuaFaK2pOek6whqF1S3GaLUi1cPNNPbH5yeLMqO+2eY5rBI1zYGaF/K4oW7hJD
         ulpFj2DB2/a5iJVLdEg40ueH3mLd8uqRym+rn8NMpNjTAoCBwgtt7poDjZ/Vj318qVUe
         AjrgN6Vvll50QMZnQlNB77SWrSuo73U8DIKZeMYQ7w9odSoo0sVDLW9aZ4cHt48ShFLz
         4I+RlGTcv6l2enNE25HITv1F+a09NL7xibRm6VMSGhpcH105ZxuYqkHfDP6O4Xequ8EA
         dIXPT5t9L8WHTT8bDRhLfhGmJtBd8HdRfx7rMcgC49FvyHqn/xumQenuNHanPmVaJlCa
         rnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773870001; x=1774474801;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elFtEZdInEbTfsmZU2GdOMJMr4ZJZvRsC2GkpEOzhEg=;
        b=HoG8UALoLFEc5BvzU5bClW/QVbnSHQNmovq/5ep4QFPFgDfgqocsLxjFVsFLqx0DsS
         lK74eqeY8Z20yy4udlOrgxdD96We7tii8MdMEpgC+MTS0heLFbjMW+7hGuZL0UPnkCwp
         IbBN59YjTe7mLAVYJ2u/IXL3Q9dwDklOcCDx5t7V2DTbz+dBhtqXvEInQfefj8AKrhQe
         NT6GxZXsbpTgu2bpcQFRuDplepBur6G20T2AFZmI3ghyWWD/EvtASaNX1mMKEM8BPqPf
         7qI7Yf0IojxtMvGnDee1uj6MlWsUHjsDzUEpFhPusyonC1Nrran9Ul8+q7CyYfVM4sN9
         oIfQ==
X-Gm-Message-State: AOJu0YzLteAK2MqppXXQviJgCqKhYrtHul84N+ZARr+CdDHKuegKhbR1
	3Coe+GkAFz+oNp8WoR11NB7lHe/8antpA3imxIxPuKE63MF85QgWk+E8HcO7C+LaqGRqheVXymh
	rU9p31+rlkS2GF7zm/wFb+B2US2sRkLwUNFSC
X-Gm-Gg: ATEYQzxKDJPDktFJawyd3O1G8dAvKnqceZVe0/2XkRW43v8xI3sA7pW1jysMLsIjix8
	7peHVWuTILMhqFlTB2ThX1g31Ngjm2eNL2hDvZRQIpupIygfVuR/bIIhL3APiSwlU3cRy6hsy/9
	3S6NxLkKVjuGvjhOaX68TKh3SxswBqm8P+1j08q+o/cnXOBYKR+HfwmLTY9sJBIBnlHenYVeh/s
	8cZDAbNDAwHqzHweoUSXFdc786sepdCdDXDu+2EWb0eEj/Pfl0JHf7ALi2zki2fH8mJOENCII3u
	Yj/uEnFzISjnMwtA23uPke9uF16DXKgRVjU/bnKfVps55jOmlrsWZZFXlfKSxfnJdiPZuaVbfrn
	+vYx8W164D3fxXIUcbQxniTQV
X-Received: by 2002:a05:690e:e8e:b0:64d:568b:bcc1 with SMTP id
 956f58d0204a3-64e912e89b0mr5123885d50.3.1773870000740; Wed, 18 Mar 2026
 14:40:00 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2026 14:39:32 -0700
X-Gm-Features: AaiRm53RTAoT6Xh64_2TAUlhPo-X_psIctICGut4qMNTt5ke78AYs3_zbKHjN_c
Message-ID: <CAMKF1so=RHPpR_uQk5XhGWLPywr_x-4cr=Ub-nODf14hSAw83A@mail.gmail.com>
Subject: Recipes needing build fixes after glibc 2.43 upgrade
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000459df9064d534bf1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 21:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125368

--000000000000459df9064d534bf1
Content-Type: text/plain; charset="UTF-8"

Hello All,

There are few recipes currently broken on meta-openembedded layers,
predominantly due to glibc upgrade. Help is needed in fixing them so we can
have world builds working again on AB

Here is list

Summary: 16 tasks failed:

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.55019

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.38373

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/python3-xstatic-font-awesome/
6.2.1.1/temp/log.do_compile.107676

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb:
do_configure
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/sysdig/0.39.0/temp/log.do_configure.124550

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb:
do_configure
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.145475

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/opensaf/5.22.01/temp/log.do_compile.161530

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.154712

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/python3-pychromecast/14.0.9/temp/log.do_compile.175919

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/qad/qad_git.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.176411

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/libfaketime/0.9.10/temp/log.do_compile.182340

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb:
do_package
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/luaposix/36.2.1/temp/log.do_package.186406

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/liboauth2/2.2.0/temp/log.do_compile.199073

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.193667

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-support/netcf/netcf_0.2.8.bb:
do_configure
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.208957

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11_2.26.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/links-x11/2.26/temp/log.do_compile.215047

/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links_2.29.bb:
do_compile
    log:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/links/2.29/temp/log.do_compile.218734
Summary: There were 26 ERROR messages, returning a non-zero exit code.

and a build log with errors is here

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_inline

Thanks
-Khem

--000000000000459df9064d534bf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>There are few recipes curren=
tly broken on meta-openembedded layers, predominantly due to glibc upgrade.=
 Help is needed in fixing them so we can have world builds working again on=
 AB</div><div><br></div><div>Here is list</div><div><br></div><div>Summary:=
 16 tasks failed:<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-=
openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:=
do_compile<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/=
build/tmp/work/x86-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compil=
e.55019<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedd=
ed/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile<br=
>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/wor=
k/x86-64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.38373<br>=C2=
=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python=
/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:do_compile=
<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/=
work/x86-64-v3-poky-linux/python3-xstatic-font-awesome/<a href=3D"http://6.=
2.1.1/temp/log.do_compile.107676">6.2.1.1/temp/log.do_compile.107676</a><br=
>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe=
/recipes-extended/sysdig/sysdig_0.39.0.bb:do_configure<br>=C2=A0 =C2=A0 log=
: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/sysdig/0.39.0/temp/log.do_configure.124550<br>=C2=A0 /srv/pokybuild/yo=
cto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-bsp/fwupd/fwupd-=
efi_1.8.bb:do_configure<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/m=
eta-oe/build/build/tmp/work/x86-64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_=
configure.145475<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-o=
penembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb:do_c=
ompile<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/opensaf/5.22.01/temp/log.do_compile.161530<=
br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-=
networking/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile<br>=C2=A0 =C2=
=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3=
-poky-linux/ntopng/5.2.1/temp/log.do_compile.154712<br>=C2=A0 /srv/pokybuil=
d/yocto-worker/meta-oe/build/meta-openembedded/meta-python/recipes-devtools=
/python/python3-pychromecast_14.0.9.bb:do_compile<br>=C2=A0 =C2=A0 log: /sr=
v/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/=
python3-pychromecast/14.0.9/temp/log.do_compile.175919<br>=C2=A0 /srv/pokyb=
uild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/=
qad/qad_git.bb:do_compile<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker=
/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/qad/0.0+git/temp/log.do_=
compile.176411<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb:do_compile=
<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/=
work/x86-64-v3-poky-linux/libfaketime/0.9.10/temp/log.do_compile.182340<br>=
=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/luaposix/luaposix_36.2.1.bb:do_package<br>=C2=A0 =C2=A0 lo=
g: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/luaposix/36.2.1/temp/log.do_package.186406<br>=C2=A0 /srv/pokybuild/y=
octo-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/liboaut=
h2/liboauth2_2.2.0.bb:do_compile<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto=
-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/liboauth2/2.2.0/t=
emp/log.do_compile.199073<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/bui=
ld/meta-openembedded/meta-networking/recipes-support/open-vm-tools/open-vm-=
tools_13.0.10.bb:do_compile<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-work=
er/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/open-vm-tools/13.0.10/=
temp/log.do_compile.193667<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/meta-openembedded/meta-networking/recipes-support/netcf/netcf_0.2.8.bb:=
do_configure<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-worker/meta-oe/buil=
d/build/tmp/work/x86-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure=
.208957<br>=C2=A0 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedd=
ed/meta-oe/recipes-support/links/links-x11_2.26.bb:do_compile<br>=C2=A0 =C2=
=A0 log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3=
-poky-linux/links-x11/2.26/temp/log.do_compile.215047<br>=C2=A0 /srv/pokybu=
ild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/li=
nks/links_2.29.bb:do_compile<br>=C2=A0 =C2=A0 log: /srv/pokybuild/yocto-wor=
ker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/links/2.29/temp/log.d=
o_compile.218734<br>Summary: There were 26 ERROR messages, returning a non-=
zero exit code.<br></div><div><br></div><div>and a build log with errors is=
 here</div><div><br></div><div><a href=3D"https://autobuilder.yoctoproject.=
org/valkyrie/api/v2/logs/5867932/raw_inline">https://autobuilder.yoctoproje=
ct.org/valkyrie/api/v2/logs/5867932/raw_inline</a></div><div><br></div><div=
>Thanks</div><div>-Khem</div><div><br></div></div>

--000000000000459df9064d534bf1--

