Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C5CC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:09 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-twisted: remove obsolete python3-twisted-flow
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 01 May 2024 09:00:03 -0700
References: <20240501081846.6363-1-gudnimar@noxmedical.com>
In-Reply-To: <20240501081846.6363-1-gudnimar@noxmedical.com>
Message-ID: <26415.1714579203790695160@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="55Hbn26XBNHKqyeTWPtO"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 16:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110204

--55Hbn26XBNHKqyeTWPtO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, I found even more files which don't exist. Please ignore this patch.

I added locally a new QA error which will produce a warning when a non-exis=
tent file in FILES is found since manually trying to find these is just tim=
e consuming and I will miss something. This is what my QA check outputs:

WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-news contains './usr/lib/python3.12/site-packages/=
twisted/plugins/twisted_news.py*' but was not found. [files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-news contains './usr/lib/python3.12/site-packages/=
twisted/plugins/__pycache__/twisted_news*.pyc' but was not found. [files-no=
t-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-news contains './usr/lib/python3.12/site-packages/=
twisted/news' but was not found. [files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-flow contains './usr/lib/python3.12/site-packages/=
twisted/plugins/twisted_flow.py*' but was not found. [files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-flow contains './usr/lib/python3.12/site-packages/=
twisted/plugins/__pycache__/twisted_flow*.pyc' but was not found. [files-no=
t-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-flow contains './usr/lib/python3.12/site-packages/=
twisted/flow' but was not found. [files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-pair contains './usr/lib/python3.12/site-packages/=
twisted/plugins/twisted_pair.py*' but was not found. [files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-pair contains './usr/lib/python3.12/site-packages/=
twisted/plugins/__pycache__/twisted_pair*.pyc' but was not found.

I can confirm every single one of these errors are valid and will submit a =
patch to remove them later. Perhaps it would be useful to have an official =
check in openembedded-core? :)

My check is also producing a lot of noise, I'm not sure if these are valid.=
 I might have added my check not in a optimal location in the code. Posting=
 it below for those interested.

WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-src contains './usr/src/debug' but was not found. =
[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dbg contains './usr/lib/debug' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dbg contains './usr/lib/debug-static' but was not =
found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dbg contains './usr/src/debug' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-staticdev contains './usr/lib/*.a' but was not fou=
nd.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-staticdev contains './lib/*.a' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-staticdev contains './usr/lib/python3-twisted/*.a'=
 but was not found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-staticdev contains './usr/lib/python3.12/site-pack=
ages/*.a' but was not found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/include' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './lib/lib*.so' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/lib/lib*.so' but was not found=
.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/lib/*.la' but was not found. [=
files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/lib/*.o' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/lib/pkgconfig' but was not fou=
nd.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/share/pkgconfig' but was not f=
ound.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/share/aclocal' but was not fou=
nd.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './lib/*.o' but was not found. [files=
-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/lib/python3-twisted/*.la' but =
was not found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './lib/*.la' but was not found.=C2=A0=
[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/lib/cmake' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/share/cmake' but was not found=
.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-dev contains './usr/lib/python3.12/site-packages/*=
.la' but was not found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-doc contains './usr/share/doc' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-doc contains './usr/share/man' but was not found. =
[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-doc contains './usr/share/info' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-doc contains './usr/share/gtk-doc' but was not fou=
nd.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-doc contains './usr/share/gnome/help' but was not =
found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted-locale contains './usr/share/locale' but was not f=
ound.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/sbin/*' but was not found.=C2=A0[f=
iles-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/libexec/*' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/lib/lib*.so.*' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './etc' but was not found.=C2=A0[files-no=
t-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './com' but was not found.=C2=A0[files-no=
t-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './var' but was not found.=C2=A0[files-no=
t-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './bin/*' but was not found.=C2=A0[files-=
not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './sbin/*' but was not found.=C2=A0[files=
-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './lib/*.so.*' but was not found. [files-=
not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './lib/udev' but was not found.=C2=A0[fil=
es-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/lib/udev' but was not found.=C2=A0=
[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './lib/udev' but was not found.=C2=A0[fil=
es-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/lib/udev' but was not found.=C2=A0=
[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/share/python3-twisted' but was not=
 found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/lib/python3-twisted/*' but was not=
 found.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/share/pixmaps' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/share/applications' but was not fo=
und.=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/share/idl' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/share/omf' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/share/sounds' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for=
 package python3-twisted contains './usr/lib/bonobo/servers' but was not fo=
und.

--55Hbn26XBNHKqyeTWPtO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, I found even more files which don't exist. Please ignore this patch.<br=
 /><br />I added locally a new QA error which will produce a warning when a=
 non-existent file in FILES is found since manually trying to find these is=
 just time consuming and I will miss something. This is what my QA check ou=
tputs:<br /><br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: =
FILES variable for package python3-twisted-news contains './usr/lib/python3=
.12/site-packages/twisted/plugins/twisted_news.py*' but was not found. [fil=
es-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue:=
 FILES variable for package python3-twisted-news contains './usr/lib/python=
3.12/site-packages/twisted/plugins/__pycache__/twisted_news*.pyc' but was n=
ot found. [files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_pack=
age: QA Issue: FILES variable for package python3-twisted-news contains './=
usr/lib/python3.12/site-packages/twisted/news' but was not found. [files-no=
t-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILE=
S variable for package python3-twisted-flow contains './usr/lib/python3.12/=
site-packages/twisted/plugins/twisted_flow.py*' but was not found. [files-n=
ot-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FIL=
ES variable for package python3-twisted-flow contains './usr/lib/python3.12=
/site-packages/twisted/plugins/__pycache__/twisted_flow*.pyc' but was not f=
ound. [files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package:=
 QA Issue: FILES variable for package python3-twisted-flow contains './usr/=
lib/python3.12/site-packages/twisted/flow' but was not found. [files-not-fo=
und]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES va=
riable for package python3-twisted-pair contains './usr/lib/python3.12/site=
-packages/twisted/plugins/twisted_pair.py*' but was not found. [files-not-f=
ound]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES v=
ariable for package python3-twisted-pair contains './usr/lib/python3.12/sit=
e-packages/twisted/plugins/__pycache__/twisted_pair*.pyc' but was not found=
.<br /><br />I can confirm every single one of these errors are valid and w=
ill submit a patch to remove them later. Perhaps it would be useful to have=
 an official check in openembedded-core? :)<br /><br />My check is also pro=
ducing a lot of noise, I'm not sure if these are valid. I might have added =
my check not in a optimal location in the code. Posting it below for those =
interested.<br /><br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Is=
sue: FILES variable for package python3-twisted-src contains './usr/src/deb=
ug' but was not found. [files-not-found]<br />WARNING: python3-twisted-24.3=
.0-r0 do_package: QA Issue: FILES variable for package python3-twisted-dbg =
contains './usr/lib/debug' but was not found.&nbsp;[files-not-found]<br />W=
ARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for =
package python3-twisted-dbg contains './usr/lib/debug-static' but was not f=
ound.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_pac=
kage: QA Issue: FILES variable for package python3-twisted-dbg contains './=
usr/src/debug' but was not found.&nbsp;[files-not-found]<br />WARNING: pyth=
on3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for package pyth=
on3-twisted-staticdev contains './usr/lib/*.a' but was not found.&nbsp;[fil=
es-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue:=
 FILES variable for package python3-twisted-staticdev contains './lib/*.a' =
but was not found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.=
3.0-r0 do_package: QA Issue: FILES variable for package python3-twisted-sta=
ticdev contains './usr/lib/python3-twisted/*.a' but was not found.&nbsp;[fi=
les-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue=
: FILES variable for package python3-twisted-staticdev contains './usr/lib/=
python3.12/site-packages/*.a' but was not found.&nbsp;[files-not-found]<br =
/>WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/include' but was not found.&=
nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: =
QA Issue: FILES variable for package python3-twisted-dev contains './lib/li=
b*.so' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-twis=
ted-24.3.0-r0 do_package: QA Issue: FILES variable for package python3-twis=
ted-dev contains './usr/lib/lib*.so' but was not found.&nbsp;[files-not-fou=
nd]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES var=
iable for package python3-twisted-dev contains './usr/lib/*.la' but was not=
 found. [files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_packag=
e: QA Issue: FILES variable for package python3-twisted-dev contains './usr=
/lib/*.o' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-t=
wisted-24.3.0-r0 do_package: QA Issue: FILES variable for package python3-t=
wisted-dev contains './usr/lib/pkgconfig' but was not found.&nbsp;[files-no=
t-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILE=
S variable for package python3-twisted-dev contains './usr/share/pkgconfig'=
 but was not found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24=
.3.0-r0 do_package: QA Issue: FILES variable for package python3-twisted-de=
v contains './usr/share/aclocal' but was not found.&nbsp;[files-not-found]<=
br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variabl=
e for package python3-twisted-dev contains './lib/*.o' but was not found. [=
files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Iss=
ue: FILES variable for package python3-twisted-dev contains './usr/lib/pyth=
on3-twisted/*.la' but was not found.&nbsp;[files-not-found]<br />WARNING: p=
ython3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for package p=
ython3-twisted-dev contains './lib/*.la' but was not found.&nbsp;[files-not=
-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES=
 variable for package python3-twisted-dev contains './usr/lib/cmake' but wa=
s not found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0=
 do_package: QA Issue: FILES variable for package python3-twisted-dev conta=
ins './usr/share/cmake' but was not found.&nbsp;[files-not-found]<br />WARN=
ING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for pac=
kage python3-twisted-dev contains './usr/lib/python3.12/site-packages/*.la'=
 but was not found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24=
.3.0-r0 do_package: QA Issue: FILES variable for package python3-twisted-do=
c contains './usr/share/doc' but was not found.&nbsp;[files-not-found]<br /=
>WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable fo=
r package python3-twisted-doc contains './usr/share/man' but was not found.=
 [files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA I=
ssue: FILES variable for package python3-twisted-doc contains './usr/share/=
info' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-twist=
ed-24.3.0-r0 do_package: QA Issue: FILES variable for package python3-twist=
ed-doc contains './usr/share/gtk-doc' but was not found.&nbsp;[files-not-fo=
und]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES va=
riable for package python3-twisted-doc contains './usr/share/gnome/help' bu=
t was not found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.=
0-r0 do_package: QA Issue: FILES variable for package python3-twisted-local=
e contains './usr/share/locale' but was not found.&nbsp;[files-not-found]<b=
r />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable=
 for package python3-twisted contains './usr/sbin/*' but was not found.&nbs=
p;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA =
Issue: FILES variable for package python3-twisted contains './usr/libexec/*=
' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-2=
4.3.0-r0 do_package: QA Issue: FILES variable for package python3-twisted c=
ontains './usr/lib/lib*.so.*' but was not found.&nbsp;[files-not-found]<br =
/>WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './etc' but was not found.&nbsp;[files-=
not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FI=
LES variable for package python3-twisted contains './com' but was not found=
.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package=
: QA Issue: FILES variable for package python3-twisted contains './var' but=
 was not found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0=
-r0 do_package: QA Issue: FILES variable for package python3-twisted contai=
ns './bin/*' but was not found.&nbsp;[files-not-found]<br />WARNING: python=
3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for package python=
3-twisted contains './sbin/*' but was not found.&nbsp;[files-not-found]<br =
/>WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './lib/*.so.*' but was not found. [file=
s-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: =
FILES variable for package python3-twisted contains './lib/udev' but was no=
t found.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_=
package: QA Issue: FILES variable for package python3-twisted contains './u=
sr/lib/udev' but was not found.&nbsp;[files-not-found]<br />WARNING: python=
3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for package python=
3-twisted contains './lib/udev' but was not found.&nbsp;[files-not-found]<b=
r />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable=
 for package python3-twisted contains './usr/lib/udev' but was not found.&n=
bsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: Q=
A Issue: FILES variable for package python3-twisted contains './usr/share/p=
ython3-twisted' but was not found.&nbsp;[files-not-found]<br />WARNING: pyt=
hon3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable for package pyt=
hon3-twisted contains './usr/lib/python3-twisted/*' but was not found.&nbsp=
;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA I=
ssue: FILES variable for package python3-twisted contains './usr/share/pixm=
aps' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-twiste=
d-24.3.0-r0 do_package: QA Issue: FILES variable for package python3-twiste=
d contains './usr/share/applications' but was not found.&nbsp;[files-not-fo=
und]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES va=
riable for package python3-twisted contains './usr/share/idl' but was not f=
ound.&nbsp;[files-not-found]<br />WARNING: python3-twisted-24.3.0-r0 do_pac=
kage: QA Issue: FILES variable for package python3-twisted contains './usr/=
share/omf' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-=
twisted-24.3.0-r0 do_package: QA Issue: FILES variable for package python3-=
twisted contains './usr/share/sounds' but was not found.&nbsp;[files-not-fo=
und]<br />WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES va=
riable for package python3-twisted contains './usr/lib/bonobo/servers' but =
was not found.

--55Hbn26XBNHKqyeTWPtO--

