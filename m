Return-Path: <josephjamesmills@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A0FCA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 17:33:09 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.992.1756488779352822617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Aug 2025 10:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OoifwJ7o;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: josephjamesmills@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so3467044a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 10:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756488777; x=1757093577; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=juIksJrou3RPQWi43k+pvQNdpDL6MtmutK4TwL09daY=;
        b=OoifwJ7ouH7ohu329yPnMkXaNLcenhXAbMl7itT5AD0LFpppNkQtykuHwSsdIkCFQM
         WJHa188KBbAHl17Q7XGqmnspZvnACRXf/qKujVMeRnd90XUG83ZQ9Fe9wwBIgm/dbmyU
         a/W/ffzHj3ECzhRE08KaVcSn1mDFJt1ac7gab7UD6N4RxXXCtLFAHlOoSNSnmNTJY+9U
         n5dosEOGRxgwQHw8rE3wIYBjqcFQkzt+oIqyagRtQ2ngXf4X+dEJBuV3C03SjP1Y3/Pa
         aJRgp7IGGpkFzjkrPRjF2I9WEYSyXi0H+VFzaq7rXN0pXiLHVlZ48guto9xgKwItjugu
         XKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756488777; x=1757093577;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juIksJrou3RPQWi43k+pvQNdpDL6MtmutK4TwL09daY=;
        b=FGbfxrfs55596ILzybfEmLqV2b3p8+nwx8j3Vm1eSd1oFkAL7ksSB3tx2kreXdb7BE
         TECYLXueIS9ov8Ij9xul56YiiseSJYIJxQMxn8/nX6RkRdOzpYfRs+/6F7kevuofeI7X
         n/AnpBwt48TPXBY1ofBPZGrv7BzLGF+zdmF9j9go5GjVsCNh9OQSX3r5AAxu9730VvZn
         d25N+UifBEO+IdRZnukwkMrnhZONuylFQ6APQ4EGzX/lGKEan19iEniRJtC4KF69eAiX
         6kZoIo6sZLGE2kn1fDnZ/sMjfw8u2m97dN3gVF3cCIO6bZCNtpYUS2tiGeg5PAtjp1dV
         R5sA==
X-Gm-Message-State: AOJu0YzaHmXIMsS/7rdzX+PqofCLF8uJEi7XCJ9jMe0DTRrzVLbWQ5kW
	o+K92BUIP/Isgv2Sckvk9WjlEZ4A6TebJ5gDeO3HvDuca2nhWaI57wZ2qomG9QQUTUEV/VMRF48
	Pt7y/4MAD3UJ5gyoe8fjx6G/4tOLYscQbnyqV63c=
X-Gm-Gg: ASbGncsSU4BCtnd7RBPqMej3+qHZkcfaFqMYSH684RToS1eniKSU9k9MOsk92FCkP/b
	C6YbMFoKukDoGiuvthKghTByr/Z/ZZ1ETsdftg9FfRCBYg9dpCyUj0wr/tKRR7DucXN84HsX7/4
	LcVlgI8wIKQCo9nBy8r09Bb7v2sjYn6aTbHS6fxcS5Ih8WcSmk/AOAu/whKd/E1saJt7gWL0peZ
	09d3eMPe54smyt0iwOlrDzoGRo=
X-Google-Smtp-Source: AGHT+IE9v4qfuQBVD+zNcu2MKaHZfQCSC/9Qh8t9UlFOhic/9nxr/DG840KH/bUxH3g+eFl0yMzU9EvwmViV1zozsXg=
X-Received: by 2002:a05:6402:27d1:b0:61c:5272:a739 with SMTP id
 4fb4d7f45d1cf-61c5272a7e4mr16503064a12.2.1756488776928; Fri, 29 Aug 2025
 10:32:56 -0700 (PDT)
MIME-Version: 1.0
From: Joseph Mills <josephjamesmills@gmail.com>
Date: Fri, 29 Aug 2025 12:32:46 -0500
X-Gm-Features: Ac12FXx6p1oKzq03xLUf8sgaMrltZ_0DR_DAvapmuQLY02qvzOZJKHu6LLMgcII
Message-ID: <CAKv13CLMNx0H0TUmpqH-QOz28N2OV-QsRj2NdR21P+i6scaf4Q@mail.gmail.com>
Subject: Introductions and questions around the world
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000099d262063d84690b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 17:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119140

--00000000000099d262063d84690b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,
I=E2=80=99m Joseph, I=E2=80=99m an independent consultant.  I just inherite=
d an internal
distro that historically never built a =E2=80=9Cfull distro,=E2=80=9D and I=
=E2=80=99m porting it
from dunfel & kirkstone to scarthgap. The client only needs a BSP subset,
but in my spare time I=E2=80=99m trying to push general fixes back upstream=
. I have
created a package group that doesn't install anything but does build
everything in OE.

I have found some things when building the clients multilib inteli7
machine's. A number of packages are not installed to the correct
libdir(/usr/lib vs /usr/lib64). I have noticed that this mainly affects
python modules that are going to sites dir(PYTHON_SITEPACKAGES_DIR). see
https://github.com/openembedded/meta-openembedded/pull/990/files

Scope / testing
SoC families:
* Intel: core2, corei7 (multi variants), (about 70K steps)
* Atmel: ipac9x25, som9x25, soma5d35, soma5d36(multi variants) (about 45K
steps)
* TI: som5728m, som3354  (about 60K steps)
* Renesas: somrzg2l (multi variants) (about 70K steps)
* Nuvoton: som35d1f(multi variants),  (about 70K steps)
* NXP: somimx6(multi variants), somimx8(multi variants) (about 60K steps)
* Nvidia: somagx (about 70K steps)

Each of the som's have multiple carriers. Lots of device trees :) fun stuff=
.

Goals: I have 3 massive build servers. One is my own and the other two are
the clients.
serverA: no sstate to dl builds everything from scratch.
serverB: shares with other servers and developers.
  CACHE_PATH =3D
"/srv/yocto/${DISTRO_CODENAME}-${DISTRO_VERSION}/${RELEASE_TYPE}"
  ARCHIVE_PATH ?=3D
"${DISTRO_CODENAME}-${DISTRO_VERSION}/${RELEASE_TYPE}/${MACHINE}"
  DL_DIR =3D "/srv/yocto/${DISTRO_CODENAME}-${DISTRO_VERSION}/downloads"
  SSTATE_DIR =3D "${CACHE_PATH}/sstate-cache"
  BUILDHISTORY_DIR =3D "${CACHE_PATH}/buildhistory"
  PERSISTENT_DIR =3D "${CACHE_PATH}/cache"
  BB_CACHEDIR =3D "${CACHE_PATH}/parser-cache"
  CACHE =3D "${CACHE_PATH}/startup-cache"
serverC: same as serverB helps with the matrix of the builds.

The build system is kas and does(now) have full CI/CD (build, deploy-image,
deploy-sdk, deploy-ota)
Handling of Distro features are handled via the machine's file's and kas.

devkit(som+carrier or SBC) code is open source (MIT). I can share KAS
manifests/build logs if helpful.

Submission shape
Do you prefer I send these as small series by subsystem (e.g., meta-gnome
first, then meta-python, then meta-oe), or one change at a time?

Path policy =E2=80=94 For multilib cleanups, is moving empty /usr/lib paren=
ts in
do_install:append acceptable when ${libdir} is lib64, or is there a
stronger class-level approach you=E2=80=99d like?

I=E2=80=99m new to posting here, so suggestions on etiquette, scope, and pr=
eferred
structure are welcome.

Another thing I am confused about is devshell. My current workflow(advice
appreciated)
1) something does not build. I clean the package/recipe.
2) drop to devshell.
3) if there is no git repo, run.
  3.a git init; git add -A; git commit -s -m "Upstream import: ${PN} ${PV}
(${SRCREV})"; git tag oe-base
  3.b hack hack
  3.c git add -p
  3.d git commit -s -m "<META_PART> DESC"
  3.e git format-patch oe-base --cover-letter --suffix=3D.patch -o ../patch=
es
  3.f cp ../000..... -> meta-layer/rec..../patch_dir
4) build and see if it passes. if not repeat :(

before 3.f is there any way to build in the devshell without having to
export a bunch of stuff ? In my past in devshell I have only built u-boot
and linux. (ARCH, CROSS_COMPILE etc). It would be nice not to drop in and
out of the devshell until the build is fixed. Any advice on internal
commands that I may be missing would be great.

Some more things about the build. I have my own world recipe (it's really a
package group with a lot of rrecomends) I build this but do not ship to any
images.

I am willing to share any code or whatever that is opensource and does not
harm IP.

Thanks for maintaining OE and I look forward to your advice,
jmills

--00000000000099d262063d84690b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,=C2=A0<br>I=E2=80=99m Joseph, I=E2=80=99m an ind=
ependent consultant.=C2=A0 I just inherited an internal distro that histori=
cally never built a =E2=80=9Cfull distro,=E2=80=9D and I=E2=80=99m porting =
it from dunfel &amp; kirkstone to scarthgap. The client only needs a BSP su=
bset, but in my spare time I=E2=80=99m trying to push general fixes back up=
stream.=C2=A0I have created a package group that doesn&#39;t install anythi=
ng but does build everything in OE. <br><br>I have found some things when b=
uilding the clients multilib inteli7 machine&#39;s. A number of packages ar=
e not installed to the correct libdir(/usr/lib vs /usr/lib64). I have notic=
ed that this mainly affects python modules that are going to sites dir(PYTH=
ON_SITEPACKAGES_DIR). see <a href=3D"https://github.com/openembedded/meta-o=
penembedded/pull/990/files">https://github.com/openembedded/meta-openembedd=
ed/pull/990/files</a><br><br>Scope / testing<br>SoC families:<br>* Intel: c=
ore2, corei7 (multi variants), (about 70K steps)<br>* Atmel: ipac9x25, som9=
x25, soma5d35, soma5d36(multi variants) (about 45K steps)<br>* TI: som5728m=
, som3354 =C2=A0(about 60K steps)<br>* Renesas: somrzg2l (multi variants) (=
about 70K steps)<br>* Nuvoton: som35d1f(multi variants), =C2=A0(about 70K s=
teps)<br>* NXP: somimx6(multi variants), somimx8(multi variants) (about 60K=
 steps)<br>* Nvidia: somagx (about 70K steps)<br><br>Each of the som&#39;s =
have multiple carriers. Lots of device trees :) fun stuff.<br><br>Goals: I =
have 3 massive build servers. One is my own and the other two are the clien=
ts. <br>serverA: no sstate to dl builds everything from scratch.<br>serverB=
: shares with other servers and developers. <br>=C2=A0 CACHE_PATH =3D &quot=
;/srv/yocto/${DISTRO_CODENAME}-${DISTRO_VERSION}/${RELEASE_TYPE}&quot;<br>=
=C2=A0 ARCHIVE_PATH ?=3D &quot;${DISTRO_CODENAME}-${DISTRO_VERSION}/${RELEA=
SE_TYPE}/${MACHINE}&quot;<br>=C2=A0 DL_DIR =3D &quot;/srv/yocto/${DISTRO_CO=
DENAME}-${DISTRO_VERSION}/downloads&quot;<br>=C2=A0 SSTATE_DIR =3D &quot;${=
CACHE_PATH}/sstate-cache&quot;<br>=C2=A0 BUILDHISTORY_DIR =3D &quot;${CACHE=
_PATH}/buildhistory&quot;<br>=C2=A0 PERSISTENT_DIR =3D &quot;${CACHE_PATH}/=
cache&quot;<br>=C2=A0 BB_CACHEDIR =3D &quot;${CACHE_PATH}/parser-cache&quot=
;<br>=C2=A0 CACHE =3D &quot;${CACHE_PATH}/startup-cache&quot;<br>serverC: s=
ame as serverB helps with the matrix of the builds. <br><br>The build syste=
m is kas and does(now) have full CI/CD (build, deploy-image, deploy-sdk, de=
ploy-ota)<br>Handling of Distro features are handled via the machine&#39;s =
file&#39;s and kas.<br><br>devkit(som+carrier or SBC) code is open source (=
MIT). I can share KAS manifests/build logs if helpful.<br><br>Submission sh=
ape <br>Do you prefer I send these as small series by subsystem (e.g., meta=
-gnome first, then meta-python, then meta-oe), or one change at a time?<br>=
<br>Path policy =E2=80=94 For multilib cleanups, is moving empty /usr/lib p=
arents in do_install:append acceptable when ${libdir} is lib64, or is there=
 a stronger class-level approach you=E2=80=99d like?<br><br>I=E2=80=99m new=
 to posting here, so suggestions on etiquette, scope, and preferred structu=
re are welcome. <br><br>Another thing I am confused about is devshell. My c=
urrent workflow(advice appreciated)<br>1) something does not build. I clean=
 the package/recipe. <br>2) drop to devshell. <br>3) if there is no git rep=
o,=C2=A0run. <br>=C2=A0 3.a git init; git add -A; git commit -s -m &quot;Up=
stream import: ${PN} ${PV} (${SRCREV})&quot;; git tag oe-base<br>=C2=A0 3.b=
 hack hack <br>=C2=A0 3.c git add -p <br>=C2=A0 3.d git commit -s -m &quot;=
&lt;META_PART&gt; DESC&quot;<br>=C2=A0 3.e git format-patch oe-base --cover=
-letter --suffix=3D.patch -o ../patches<br>=C2=A0 3.f cp ../000..... -&gt; =
meta-layer/rec..../patch_dir<br>4) build and see if it passes. if not repea=
t :( <br><br>before 3.f is there any way to build in the devshell without h=
aving to export a bunch of stuff ? In my past in devshell I have only built=
 u-boot and linux. (ARCH, CROSS_COMPILE etc). It would be nice not to drop =
in and out of the devshell until the build is fixed. Any advice on internal=
 commands that I may be missing would be great. <br><br>Some more things ab=
out the build. I have my own world recipe (it&#39;s really a package group =
with a lot of rrecomends) I build this but do not ship to any images. =C2=
=A0<br><br>I am willing to share any code or whatever that is opensource an=
d does not harm IP. <br><br>Thanks for maintaining OE and I look forward to=
 your advice,<br>jmills</div>

--00000000000099d262063d84690b--

