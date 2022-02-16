Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C2CC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 18:22:29 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web08.2909.1645035747689731848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 10:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mbF7vP4m;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id p7so3480513vsg.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 10:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2J/zAl/wdUaGA6PGMUYhNHGP2BFLns3+Lezdym5MKb0=;
        b=mbF7vP4m/T5LOtf7Do4amNwgLoJzACP7EjJVgRBGt/DFcRt7Ls7PGrNq9RH/ZwU+Z1
         2KFYeqVyxGn7sSPAi3wV5s8ob6nISB7vgTGK74i77fsTCs9B4Uf8urIUCufVC5e3Ez+W
         Tm63spKdW5I3C53qLlZ+wRSFyTpRpjYLunpewKWNW2x8YFMK0gU2RYFEa/2bUelMRi5S
         nKm3rbxiCcoJjfxvlWrHjfgNA91SNavtlglDmbOyR8jicHc74qE9gdSDXRJKj4mKOCal
         TIdfLZhzOG+XxoepC4w/LGxMaNbjwi0a/rD/1MqUeF3OCd1OiXQtQLcMxXQxukRAr0OH
         3X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2J/zAl/wdUaGA6PGMUYhNHGP2BFLns3+Lezdym5MKb0=;
        b=O3Pb9UiTya80Y4bYdKJy0diJDam4LP6MU1+v8KGRIB+iZakLr696seQRMY5Y6vVpzU
         +4NxC+0VcHGvLNIutqvJVCIx8Fm6msP8FeVcnbfLA16sbRCQKVwdrxmcVBbH34WHSF6F
         sDp8djrhU6FiV15MdPJU9kLo8o9v+bEhyjfjmhADayaXorPS948iBMM74mj2hMRCgBku
         LnG1ML2BUAkk5BGpABLxim6gWd4on9irJYZJ6065SHhjBgQl4mM7dqtrt9avMyTZ5FEh
         XLamgdIgI6DQC8azX+LjNDFhH3/nlD8OqnZfNXH9Da40YeREtsAgxQVa389TB2b6Xdh8
         VgcA==
X-Gm-Message-State: AOAM532RS97O2ZxinvjV2AMacmmLpHzu0GDRvskCBNN3ZcNm6hd8O4hX
	Hybu82eq6DD2cwzAwv9nBb1H6gccZWoJEi/nLUo=
X-Google-Smtp-Source: 
 ABdhPJwHiB3xOd6F+G1EHeJdLugeHtTAe/qyDuh+lUY7qMVsccp7RDVdOtZWE6+B6pKQuNSPM6WpLQKWr8Rk3yauWp0=
X-Received: by 2002:a05:6102:20d1:b0:30e:dfe6:de1a with SMTP id
 i17-20020a05610220d100b0030edfe6de1amr1522428vsr.73.1645035746630; Wed, 16
 Feb 2022 10:22:26 -0800 (PST)
MIME-Version: 1.0
References: <1952965.PIDvDuAF1L@localhost.localdomain>
In-Reply-To: <1952965.PIDvDuAF1L@localhost.localdomain>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Feb 2022 19:22:14 +0100
Message-ID: 
 <CANNYZj-V8O1-USTdtOYKi5hB80QjxQZH2d2=YbJ-4Y2sm5BjoA@mail.gmail.com>
Subject: Re: Cannot build nodejs application with OpenEmbedded master branch
To: Christian Eggers <ceggers@arri.de>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/related; boundary="00000000000052389505d826bbd6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 18:22:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95345

--00000000000052389505d826bbd6
Content-Type: multipart/alternative; boundary="00000000000052389405d826bbd5"

--00000000000052389405d826bbd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

not sure why this is addressed directly to me, but Stefan H. knows the most
about the current state of npm (which is not great).

Alex

On Wed, 16 Feb 2022 at 18:58, Christian Eggers <ceggers@arri.de> wrote:

> I have created a recipe for quicktype ([1], [2]) according to the wiki
> article [3]. The recipe (attached) builds fine under dunfell, gatesgarth,
> hardknott and honister, but not on master:
>
> npm ERR! code 1
> npm ERR! path
> /home/<...>/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/1=
5.0.260-r0/npm/node_modules/acorn
> npm ERR! command failed
> npm ERR! command sh -c cd ..; npm run build:main && npm run build:bin
> npm ERR! npm ERR! Missing script: "build:main"
> npm ERR! npm ERR!
> npm ERR! npm ERR! To see a list of scripts, run:
> npm ERR! npm ERR! npm run
> npm ERR!
> npm ERR! npm ERR! A complete log of this run can be found in:
> npm ERR! npm ERR!
> /home/<...>/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/1=
5.0.260-r0/npm-cache/_logs/2022-02-16T17_17_32_448Z-debug.log
>
>
> from the debug.log:
> -----------------------------8<-----------------------------
> 28 verbose stack Error: command failed
> 28 verbose stack at ChildProcess.<anonymous>
> (/home/eggers/Projekte/jupiter/yocto-warrior/build/devel-kirkstone/tmp/wo=
rk/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/15.0.260-r0/recipe-sy=
sroot-native/usr/lib/node_modules/npm/node_modules/@npmcli/promise-spawn/in=
dex.js:64:27)
> 28 verbose stack at ChildProcess.emit (node:events:390:28)
> 28 verbose stack at maybeClose (node:internal/child_process:1064:16)
> 28 verbose stack at Process.ChildProcess._handle.onexit
> (node:internal/child_process:301:5)
> 29 verbose pkgid acorn@7.4.1
> 30 verbose cwd /tmp/tmpho3n0y1c
> 31 verbose Linux 5.3.18-150300.59.49-default
> 32 verbose argv
> "/home/<...>/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/=
15.0.260-r0/recipe-sysroot-native/usr/bin/node"
> "/home/<...>/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/=
15.0.260-r0/recipe-sysroot-native/usr/bin/npm"
> "pack"
> "/home/<...>/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/=
15.0.260-r0/npm/node_modules/acorn"
> "--ignore-scripts=3Dtrue"
> 33 verbose node v16.11.1
> 34 verbose npm v8.0.0
> 35 error code 1
> ----------------------------->8-----------------------------
>
> I have absolutely no idea about NPM, but it looks like the script include=
d
> in acorn's package.json causes this error:
>
> -----------------------------8<-----------------------------
> "scripts": {
> "prepare": "cd ..; npm run build:main && npm run build:bin"
> },
> ----------------------------->8-----------------------------
>
> Any ideas?
>
> regards,
> Christian
>
>
> [1] https://quicktype.io/
> [2] https://github.com/quicktype/quicktype
> [3] https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM
> _______________________________________________________
> Christian
> Eggers
> Software Engineer
> ARRI
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Arriweg 17 ,
> 83071
> Stephanskirchen
>
>
> *www.arri.com * <http://www.arri.com/>
> *+49 8036 3009-3118* <+49%208036%203009-3118>
> *CEggers@arri.de* <CEggers@arri.de>
>
> [image: Orbiter Docking Ring]
> <https://www.arri.com/en/lighting/led/orbiter-accessories/orbiter-docking=
ring/>
> Get all the latest information from *www.arri.com* <http://www.arri.com/>
> , *Facebook* <https://www.facebook.com/TeamARRI>, *Twitter*
> <https://twitter.com/ARRIChannel>, *Instagram* <http://instagram.com/arri=
>
>  and *YouTube* <http://www.youtube.com/user/ARRIChannel>.
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRA 57918
> Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik G=
mbH
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRB 54477
>
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Wa=
lter Trauninger; Markus Zeiler
>
>
>

--00000000000052389405d826bbd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>not =
sure why this is addressed directly to me, but Stefan H. knows the most abo=
ut the current state of npm (which is not great).</div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 16 Feb 2022 at 18:58, Christian Eggers &lt;<a href=
=3D"mailto:ceggers@arri.de">ceggers@arri.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div><div>I have created a recip=
e for quicktype ([1], [2]) according to the wiki <br>article [3]. The recip=
e (attached) builds fine under dunfell, gatesgarth,<br>hardknott and honist=
er, but not on master:<br><br>npm ERR! code 1<br>npm ERR! path /home/&lt;..=
.&gt;/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/15.0.260-=
r0/npm/node_modules/acorn<br>npm ERR! command failed<br>npm ERR! command sh=
 -c cd ..; npm run build:main &amp;&amp; npm run build:bin<br>npm ERR! npm =
ERR! Missing script: &quot;build:main&quot;<br>npm ERR! npm ERR! <br>npm ER=
R! npm ERR! To see a list of scripts, run:<br>npm ERR! npm ERR!   npm run<b=
r>npm ERR! <br>npm ERR! npm ERR! A complete log of this run can be found in=
:<br>npm ERR! npm ERR!     /home/&lt;...&gt;/tmp/work/x86_64-nativesdk-poky=
sdk-linux/nativesdk-quicktype/15.0.260-r0/npm-cache/_logs/2022-02-16T17_17_=
32_448Z-debug.log<br><br><br>from the debug.log:<br>-----------------------=
------8&lt;-----------------------------<br>28 verbose stack Error: command=
 failed<br>28 verbose stack     at ChildProcess.&lt;anonymous&gt; (/home/eg=
gers/Projekte/jupiter/yocto-warrior/build/devel-kirkstone/tmp/work/x86_64-n=
ativesdk-pokysdk-linux/nativesdk-quicktype/15.0.260-r0/recipe-sysroot-nativ=
e/usr/lib/node_modules/npm/node_modules/@npmcli/promise-spawn/index.js:64:2=
7)<br>28 verbose stack     at ChildProcess.emit (node:events:390:28)<br>28 =
verbose stack     at maybeClose (node:internal/child_process:1064:16)<br>28=
 verbose stack     at Process.ChildProcess._handle.onexit (node:internal/ch=
ild_process:301:5)<br>29 verbose pkgid acorn@7.4.1<br>30 verbose cwd /tmp/t=
mpho3n0y1c<br>31 verbose Linux 5.3.18-150300.59.49-default<br>32 verbose ar=
gv &quot;/home/&lt;...&gt;/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesd=
k-quicktype/15.0.260-r0/recipe-sysroot-native/usr/bin/node&quot; &quot;/hom=
e/&lt;...&gt;/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktype/1=
5.0.260-r0/recipe-sysroot-native/usr/bin/npm&quot; &quot;pack&quot; &quot;/=
home/&lt;...&gt;/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-quicktyp=
e/15.0.260-r0/npm/node_modules/acorn&quot; &quot;--ignore-scripts=3Dtrue&qu=
ot;<br>33 verbose node v16.11.1<br>34 verbose npm  v8.0.0<br>35 error code =
1<br>-----------------------------&gt;8-----------------------------<br><br=
>I have absolutely no idea about NPM, but it looks like the script included=
<br>in acorn&#39;s package.json causes this error:<br><br>-----------------=
------------8&lt;-----------------------------<br>  &quot;scripts&quot;: {<=
br>    &quot;prepare&quot;: &quot;cd ..; npm run build:main &amp;&amp; npm =
run build:bin&quot;<br>  },<br>-----------------------------&gt;8----------=
-------------------<br><br>Any ideas?<br><br>regards,<br>Christian<br><br><=
br>[1] <a href=3D"https://quicktype.io/" target=3D"_blank">https://quicktyp=
e.io/</a><br>[2] <a href=3D"https://github.com/quicktype/quicktype" target=
=3D"_blank">https://github.com/quicktype/quicktype</a><br>[3] <a href=3D"ht=
tps://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM" target=3D"_blank">https=
://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM</a><br></div><div dir=3D"lt=
r" style=3D"direction:ltr"><table style=3D"width:100%" cellspacing=3D"0" ce=
llpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:0px"><td style=
=3D"vertical-align:top" align=3D"left"><table style=3D"font-size:0px" cells=
pacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:0=
px"><td style=3D"padding:0px;vertical-align:top" align=3D"left"><table styl=
e=3D"width:100%;font-size:0px" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0"><tbody><tr style=3D"font-size:14.67px;color:rgb(127,127,127);font-st=
yle:normal;font-weight:400;white-space:nowrap"><td style=3D"vertical-align:=
top;font-family:Calibri,Arial,sans-serif" align=3D"left">__________________=
_____________________________________<span style=3D"font-family:remialcxesa=
ns;font-size:1px;color:rgb(255,255,255);line-height:1px"></span></td></tr><=
tr style=3D"font-size:0px"><td style=3D"vertical-align:top" align=3D"left">=
<table style=3D"font-size:0px" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0"><tbody><tr style=3D"font-size:0px"><td style=3D"vertical-align:top" =
align=3D"left"><table style=3D"font-size:0px;color:rgb(127,127,127);font-st=
yle:normal;font-weight:400;white-space:nowrap" cellspacing=3D"0" cellpaddin=
g=3D"0" border=3D"0"><tbody><tr style=3D"font-size:14.67px"><td style=3D"ve=
rtical-align:top;font-family:Calibri,Arial,sans-serif" align=3D"left">Chris=
tian</td><td style=3D"vertical-align:top;color:rgb(0,0,1);font-family:Calib=
ri,Arial,sans-serif" align=3D"left">=C2=A0<br></td><td style=3D"vertical-al=
ign:top;font-family:Calibri,Arial,sans-serif" align=3D"left">Eggers</td></t=
r></tbody></table></td></tr><tr style=3D"font-size:0px"><td style=3D"vertic=
al-align:top" align=3D"left"><table style=3D"font-size:0px;color:rgb(127,12=
7,127);font-style:normal;font-weight:400;white-space:nowrap" cellspacing=3D=
"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:14.67px"><=
td style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif" align=
=3D"left">Software=C2=A0Engineer</td></tr><tr style=3D"font-size:14.67px;co=
lor:rgb(0,0,1)"><td style=3D"vertical-align:top;font-family:Calibri,Arial,s=
ans-serif" align=3D"left"></td></tr></tbody></table></td></tr></tbody></tab=
le></td></tr><tr style=3D"font-size:0px"><td style=3D"vertical-align:top" a=
lign=3D"left"><table style=3D"font-size:0px" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0"><tbody><tr style=3D"font-size:0px"><td style=3D"vertica=
l-align:top" align=3D"left"><table style=3D"font-size:0px;color:rgb(14,80,1=
73);font-style:normal;font-weight:400;white-space:nowrap" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:13.33px"><td =
style=3D"vertical-align:top;font-family:&quot;Arial Black&quot;" align=3D"l=
eft">ARRI</td></tr><tr style=3D"font-size:10.67px;color:rgb(127,127,127)"><=
td style=3D"vertical-align:top;font-family:Arial" align=3D"left"><span styl=
e=3D"font-size:11px">Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=
=C2=A0GmbH=C2=A0&amp;=C2=A0Co.=C2=A0Betriebs=C2=A0KG</span>=C2=A0<br></td><=
/tr></tbody></table></td></tr><tr style=3D"font-size:0px"><td style=3D"vert=
ical-align:top" align=3D"left"><table style=3D"font-size:0px;color:rgb(127,=
127,127);font-style:normal;font-weight:400;white-space:nowrap" cellspacing=
=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:10.67px=
"><td style=3D"vertical-align:top;font-family:Arial" align=3D"left">Arriweg=
=C2=A017</td><td style=3D"vertical-align:top;font-family:Arial" align=3D"le=
ft">,=C2=A0<br></td><td style=3D"vertical-align:middle;font-family:Arial" a=
lign=3D"left">83071</td><td style=3D"vertical-align:middle;font-family:Aria=
l" align=3D"left">=C2=A0<br></td><td style=3D"vertical-align:middle;font-fa=
mily:Arial" align=3D"left">Stephanskirchen</td></tr></tbody></table></td></=
tr></tbody></table></td></tr><tr style=3D"font-size:0px"><td style=3D"verti=
cal-align:top" align=3D"left"><table style=3D"font-size:0px" cellspacing=3D=
"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:0px"><td s=
tyle=3D"vertical-align:top" align=3D"left"><table style=3D"font-size:0px;co=
lor:rgb(21,50,185);font-style:normal;font-weight:400;white-space:nowrap" ce=
llspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-siz=
e:11px"><td style=3D"vertical-align:top;font-family:Arial" align=3D"left"><=
span style=3D"text-decoration:underline"><a href=3D"http://www.arri.com/" i=
d=3D"gmail-m_424161249284395891LPlnk689713" style=3D"text-decoration:underl=
ine;color:rgb(21,50,185)" target=3D"_blank"><b style=3D"font-weight:400">ww=
w.arri.com=C2=A0<br><br></b></a></span></td></tr><tr style=3D"font-size:0px=
"><td style=3D"vertical-align:top" align=3D"left"><table style=3D"font-size=
:0px;color:rgb(133,128,128);font-style:normal;font-weight:400;line-height:n=
ormal;white-space:nowrap" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">=
<tbody><tr style=3D"font-size:14.67px"><td style=3D"padding:0px;vertical-al=
ign:top;font-size:0px" align=3D"left"><img src=3D"cid:17f03c3f77cca1c27751"=
 alt=3D"" style=3D"width: 20px; min-width: 20px; max-width: 20px; font-size=
: 0px;" width=3D"20" border=3D"0"></td><td style=3D"padding:0px;vertical-al=
ign:top;font-family:Calibri,Arial,sans-serif" align=3D"left"><a href=3D"tel=
:+49%208036%203009-3118" id=3D"gmail-m_424161249284395891LPlnk689713" style=
=3D"text-decoration:none;color:rgb(133,128,128)" target=3D"_blank"><b style=
=3D"font-weight:400">+49=C2=A08036=C2=A03009-3118</b></a></td></tr><tr styl=
e=3D"font-size:0px"><td style=3D"padding:0px;vertical-align:top" align=3D"l=
eft"></td><td style=3D"padding:0px;vertical-align:top" align=3D"left"></td>=
</tr><tr style=3D"font-size:0px"><td style=3D"padding:0px;vertical-align:to=
p" align=3D"left"></td><td style=3D"padding:0px;vertical-align:top" align=
=3D"left"></td></tr><tr style=3D"font-size:14.67px"><td style=3D"padding:0p=
x;vertical-align:top;font-size:0px" align=3D"left"><img src=3D"cid:17f03c3f=
77d4219c97a2" alt=3D"" style=3D"width: 20px; min-width: 20px; max-width: 20=
px; font-size: 0px;" width=3D"20" border=3D"0"></td><td style=3D"padding:0p=
x;vertical-align:top;font-family:Calibri,Arial,sans-serif" align=3D"left"><=
a href=3D"mailto:CEggers@arri.de" id=3D"gmail-m_424161249284395891LPlnk6897=
13" style=3D"text-decoration:none;color:rgb(133,128,128)" target=3D"_blank"=
><b style=3D"font-weight:400">CEggers@arri.de</b></a></td></tr></tbody></ta=
ble></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr style=
=3D"font-size:14.67px;color:rgb(0,0,1);font-style:normal;font-weight:400;wh=
ite-space:nowrap"><td style=3D"vertical-align:top;font-family:Calibri,Arial=
,sans-serif" align=3D"left"><br></td></tr></tbody></table></td></tr><tr sty=
le=3D"font-size:0px;line-height:normal"><td style=3D"padding:0px;vertical-a=
lign:top" align=3D"left"><a href=3D"https://www.arri.com/en/lighting/led/or=
biter-accessories/orbiter-dockingring/" id=3D"gmail-m_424161249284395891LPl=
nk689713" style=3D"text-decoration:none" target=3D"_blank"><img src=3D"http=
s://assets.arri.com/media/sign/2022_Orbiter_Docking-Ring_E-mail-Signature_6=
50x95.jpg" title=3D"Orbiter Docking Ring" alt=3D"Orbiter Docking Ring" styl=
e=3D"font-size: 12px;" border=3D"0"></a></td></tr><tr style=3D"font-size:13=
px;color:rgb(127,127,127);font-style:normal;font-weight:400;white-space:now=
rap"><td style=3D"padding:0px;vertical-align:top;font-family:Calibri,Arial,=
sans-serif" align=3D"left">Get=C2=A0all=C2=A0the=C2=A0latest=C2=A0informati=
on=C2=A0from=C2=A0<span style=3D"text-decoration:underline"><a href=3D"http=
://www.arri.com/" id=3D"gmail-m_424161249284395891LPlnk689713" title=3D"www=
.arri.com" style=3D"text-decoration:underline;color:rgb(127,127,127)" targe=
t=3D"_blank"><b style=3D"font-weight:400">www.arri.com</b></a></span>,=C2=
=A0<span style=3D"text-decoration:underline"><a href=3D"https://www.faceboo=
k.com/TeamARRI" id=3D"gmail-m_424161249284395891LPlnk689713" style=3D"text-=
decoration:underline;color:rgb(127,127,127)" target=3D"_blank"><b style=3D"=
font-weight:400">Facebook</b></a></span>,=C2=A0<span style=3D"text-decorati=
on:underline"><a href=3D"https://twitter.com/ARRIChannel" id=3D"gmail-m_424=
161249284395891LPlnk689713" style=3D"text-decoration:underline;color:rgb(12=
7,127,127)" target=3D"_blank"><b style=3D"font-weight:400">Twitter</b></a><=
/span>,=C2=A0<span style=3D"text-decoration:underline"><a href=3D"http://in=
stagram.com/arri" id=3D"gmail-m_424161249284395891LPlnk689713" style=3D"tex=
t-decoration:underline;color:rgb(127,127,127)" target=3D"_blank"><b style=
=3D"font-weight:400">Instagram</b></a></span>=C2=A0and=C2=A0<span style=3D"=
text-decoration:underline"><a href=3D"http://www.youtube.com/user/ARRIChann=
el" id=3D"gmail-m_424161249284395891LPlnk689713" style=3D"text-decoration:u=
nderline;color:rgb(127,127,127)" target=3D"_blank"><b style=3D"font-weight:=
400">YouTube</b></a></span>.<br></td></tr><tr style=3D"font-size:0px"><td s=
tyle=3D"padding:0px;vertical-align:top" align=3D"left"><table style=3D"font=
-size:0px;color:rgb(106,106,106);font-style:normal;font-weight:400;white-sp=
ace:nowrap" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr sty=
le=3D"font-size:10px"><td style=3D"vertical-align:top;font-family:Arial" al=
ign=3D"left"><br>Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=
=A0GmbH=C2=A0&amp;=C2=A0Co.=C2=A0Betriebs=C2=A0KG<br>Sitz:=C2=A0M=C3=BCnche=
n=C2=A0=E2=80=91=C2=A0Registergericht:=C2=A0Amtsgericht=C2=A0M=C3=BCnchen=
=C2=A0=E2=80=91=C2=A0Handelsregisternummer:=C2=A0HRA=C2=A057918<br>Pers=C3=
=B6nlich=C2=A0haftender=C2=A0Gesellschafter:=C2=A0Arnold=C2=A0&amp;=C2=A0Ri=
chter=C2=A0Cine=C2=A0Technik=C2=A0GmbH<br>Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=
=80=91=C2=A0Registergericht:=C2=A0Amtsgericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=
=91=C2=A0Handelsregisternummer:=C2=A0HRB=C2=A054477<br>Gesch=C3=A4ftsf=C3=
=BChrer:=C2=A0Dr.=C2=A0Michael=C2=A0Neuh=C3=A4user;=C2=A0Stephan=C2=A0Schen=
k;=C2=A0Walter=C2=A0Trauninger;=C2=A0Markus=C2=A0Zeiler<br></td></tr><tr st=
yle=3D"font-size:14.67px;color:rgb(0,0,1)"><td style=3D"vertical-align:top;=
font-family:Calibri,Arial,sans-serif" align=3D"left"><br><br></td></tr></tb=
ody></table></td></tr></tbody></table></td></tr></tbody></table></div></div=
></blockquote></div></div>

--00000000000052389405d826bbd5--

--00000000000052389505d826bbd6
Content-Type: image/png; name="image117435.png"
Content-Disposition: inline; filename="image117435.png"
Content-Transfer-Encoding: base64
Content-ID: <17f03c3f77cca1c27751>
X-Attachment-Id: 17f03c3f77cca1c27751

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC
--00000000000052389505d826bbd6
Content-Type: image/png; name="image591694.png"
Content-Disposition: inline; filename="image591694.png"
Content-Transfer-Encoding: base64
Content-ID: <17f03c3f77d4219c97a2>
X-Attachment-Id: 17f03c3f77d4219c97a2

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=
--00000000000052389505d826bbd6--

