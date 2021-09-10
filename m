Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web12.15299.1631308509537928848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Sep 2021 14:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=WgoEcvKf;
 spf=pass (domain: gmx.de, ip: 212.227.17.20, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1631308507;
	bh=udkxck6a6UVYYdk01bgAW25nLl/CMRHlVzVaL/Pztk4=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=WgoEcvKfJsJ6Clj36yZmZm+ehvCO/2i2+t1ygfJiFsDfEK8I7AVq6kwiblgndZ8HT
	 4lnk5LcpXb/J5CsiPFnEugDtZNryH+BuBBtejY/4zH80iSfHhCCPyxe5qBQyYfVRLp
	 NGFHoObGSrNdLH0AUeX8UjRJthpz0S96XiTqxjl8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [95.88.57.223] ([95.88.57.223]) by
 msvc-mesg-gmx101.server.lan (via HTTP); Fri, 10 Sep 2021 23:15:07 +0200
MIME-Version: 1.0
Message-ID: <trinity-291aa024-aa4e-4ce0-bcec-a715b3c03326-1631308507128@msvc-mesg-gmx101>
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: Re: [oe] [meta-oe][PATCH] Remove patch that produces a segfault in the ptest of lua
Importance: normal
Date: Fri, 10 Sep 2021 23:15:07 +0200
In-Reply-To: <7c070bf3-f90d-88f4-7220-b1d8faca0176@gmail.com>
References: <20210910162949.3732-1-dl9pf@gmx.de>
 <7c070bf3-f90d-88f4-7220-b1d8faca0176@gmail.com>
X-Priority: 3
X-Provags-ID: V03:K1:gF5M89GxrGKwwqksO3cpFg9rzRpr2k1ZmCrSAZ9wbOc9o5hZVGzFq+NM3h3bKx8p6RgGm
 Fa+TTIZr744vRN6+aFUtVVOskWLtcna0hMXm/4P2a1G5oD3q11l+Zaz5pmjW4mZTMzMvqUf19vki
 ieBEcNyz2WrZEiF3eodsuW9UudqQs3B4W0GDBTBvwNBLuMqCNV+3S1+sBRVG7BYaSE25aT7ga7JC
 TMRtOjKcWRVNlUlP1xd+GXusEYAPCG/vYoXkGNtOQ7g3ntgdIfllm9Ggs/DH5BDwzNUnlQzCx+i6
 IM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TZUlFn+OLdw=:g5wjG+QAK5FkL8w3KOCe6H
 9gT6jTKTflwNEl+uOfh9rNhgvnLlwvF7cdfAkJA+7yFC378OpHkKbnhEPOKvO35ZLh0eICTFm
 7+H1rbwRJmudpOold2R45+Ur5g/fL0CkBsVXxDztr3gHAF4SlspZ9Sbx7YzObihH8mTBt+2OK
 b1ZOoFPgBshkj3EmhalMIdv+kvOaDLzl8l73waJNe0pSmn3jgF7VsLQWn3szccz6jYmAqchOR
 Q7zbUPWnkGWWqYCZXjmI1qv3ts7MK1bwI3mC9cqFsnmX4hy9LqO0QpNHgOYlwEPxgSMDnW7Dj
 vls+lBHFLd4lE9bTDwwJahY4zLLpsK5sGma4BQGjT75d00BB9mqROKxCQd7UxAMUh5mrRXuVT
 /mqWxOQmTlII+TT0BsatMGyY3D1+KrGW84R7YQ5sSvUgdA1qtpcuRK5z37OMerP2HGDLU3HDo
 ciTgnta8R730tHekYL/tcutHeMQ/RY3MyirVp2lIQO5YTD970FyIKk/5/LyVMMyvDfaRmnNbZ
 Y6gL6t6GjfLdPI6YL7MTE+DC1oTMcOveL0VpT7CQ4z6CT4BRJQBAwEQ1dQB3B4xgx4D4h69ma
 lzEfqWXdnRU654a9Mneih+otKVyFrIRmlXX7am7u/pRTQkYUPvAaTzetrJs9Xrk3ETcFeUlbQ
 Fr+1TT6wR5cCQukMwvNCAR8xOJWGnsBmSwO+mEvy8RtGtIM6ubi7yNJxRuqOTGthhOJ9BRxMA
 Y5gpKigtcbiXZ6Nw9GcWvcSOjCFYfb+flzVxmsIxwtYv+0xmtyhEAygqtDU=
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width">
  <meta http-equiv=3D"Content-Type" content=3D"text/vnd.ui.insecure+html;ch=
arset=3Dutf-8">
 </head>
 <body style=3D"overflow-wrap:break-word; word-break: break-word;"><div cla=
ss=3D"mail_android_message" style=3D"line-height: 1; padding: 0.5em">Yes, o=
f course.<br/>js<br/><br/>--<br/>Diese Nachricht wurde von meinem Android M=
obiltelefon mit GMX Mail gesendet.</div><div class=3D"mail_android_quote" s=
tyle=3D"line-height: 1; padding: 0.3em"><html><body>Am 10.09.21, 19:38 schr=
ieb Khem Raj &lt;raj.khem@gmail.com&gt;:</body></html><blockquote class=3D"=
gmail_quote" style=3D"margin: 0.8ex 0pt 0pt 0.8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;">

  <br>=20
  <br> On 9/10/21 9:29 AM, Jan-Simon M=C3=B6ller wrote:
  <br> &gt; From: Jan-Simon Moeller &lt;dl9pf@gmx.de&gt;
  <br> &gt;=20
  <br> &gt; The patch file CVE-2020-15945.patch does cause a segfault in th=
e lua ptest (db.lua test).
  <br> &gt; According to upstream developers the patch is not correct and c=
auses the segfault.
  <br> &gt;=20
  <br> &gt; Reproduce: build core-image-minimal with lua and ptest-pkgs on =
.
  <br> &gt; Run: ptest-runner lua
  <br> &gt;=20
  <br> &gt; This test passes if the patch is removed.
  <br> &gt;=20
  <br> &gt; Please also backport to dunfell as well.
  <br> &gt;=20
  <br> &gt; Signed-off-by: Jan-Simon Moeller &lt;dl9pf@gmx.de&gt;
  <br> &gt; ---
  <br> &gt; meta-oe/recipes-devtools/lua/lua_5.3.6.bb | 1 -
  <br> &gt; 1 file changed, 1 deletion(-)
  <br> &gt;=20
  <br> &gt; diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-o=
e/recipes-devtools/lua/lua_5.3.6.bb
  <br> &gt; index f830e0925..af3054dcb 100644
  <br> &gt; --- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
  <br> &gt; +++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
  <br> &gt; @@ -8,7 +8,6 @@ SRC_URI =3D "<a href=3D"http://www.lua.org/ftp/=
lua-$">http://www.lua.org/ftp/lua-$</a>{PV}.tar.gz;name=3Dtarballsrc \
  <br> &gt; file://lua.pc.in \
  <br> &gt; file://0001-Allow-building-lua-without-readline-on-Linux.patch =
\
  <br> &gt; file://CVE-2020-15888.patch \
  <br> &gt; - file://CVE-2020-15945.patch \
  <br>=20
  <br> Can you also remove/delete the patch file itelf too and resend ?
  <br>=20
  <br> &gt; file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.pa=
tch \
  <br> &gt; "
  <br> &gt;=20
  <br> &gt; --
  <br> &gt; 2.32.0
  <br> &gt;=20
  <br> &gt;=20
  <br> &gt;=20
  <br> &gt;=20
  <br> &gt;=20
  <br>=20
 </blockquote></div></body>
</html>
