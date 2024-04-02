Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D4FCD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 16:00:01 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.15871.1712073597235780992
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 08:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout04.t-online.de (Postfix) with SMTP id 51155239B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Apr 2024 17:59:55 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.174.110]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrgYC-24RUMC0; Tue, 2 Apr 2024 17:59:52 +0200
Date: Tue, 02 Apr 2024 17:59:08 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Reproducibility of mesa with opencl feature enabled
To: openembedded-devel@lists.openembedded.org
Message-Id: <KEOBBS.B6BGV9A2K5PV@t-online.de>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Mk0oX+2dtfftxgajCM0R"
X-TOI-EXPURGATEID: 150726::1712073592-214FD89A-6AF363E2/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ce59861-91e0-40c4-9492-efe815f3040d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 16:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109783

--=-Mk0oX+2dtfftxgajCM0R
Content-Type: text/plain; charset=us-ascii; format=flowed

I have a question regarding the reproducibility of mesa.

When mesa is built with opencl a lot of .so files have buildpath 
leakage. Since I finally looked into this, I have gained some insights.

1. The leak comes from CLANG_RESOURCE_DIR which contains the path of 
${STAGING_DIR_HOST}.

In my ninja.build it looks like this:
-DCLANG_RESOURCE_DIR="/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/mesa/24.0.2/recipe-sysroot/usr/lib/clang/18.1.0/include

2.The include for this happens here:
<https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/frontends/clover/meson.build?ref_type=heads#L69>

3. This include is wrong in any case
    dep_llvm.version() = 18.0.1 (and should be 18 for current clang)
    Setting a different path therefore probably does not break anything 
additionally
    but helps to remove the build paths from the binaries and the 
source.

What I have done under the assumption that this include is not needed 
for oe:

--- a/src/gallium/frontends/clover/meson.build	2024-02-28 
19:29:18.000000000 +0100
+++ b/src/gallium/frontends/clover/meson.build	2024-04-02 
13:10:38.351443132 +0200
@@ -66,8 +66,7 @@
     clover_cpp_args,
     clover_opencl_cpp_args,
     clover_spirv_cpp_args,
-    '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 
'libdir'), 'clang',
+    '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths( '/usr/lib/clang',
       dep_llvm.version(), 'include',
     )),
   ],

Not vaild, because dep_llvm.version() still != 18 but
Because the path was already wrong before, mesa compiled without errors 
as expected.

Is  setting CLANG_RESOURCE_DIR really not needed in oe or is this a bug 
and the missing headers have simply been silently ignored so far?



--=-Mk0oX+2dtfftxgajCM0R
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I have a question regarding the re=
producibility of mesa.</div><div><br></div><div>When mesa is built with ope=
ncl a lot of .so files have buildpath leakage. Since I finally looked into =
this, I have gained some insights.&nbsp;</div><div><br></div><div>1. The le=
ak comes from CLANG_RESOURCE_DIR which contains the path of ${STAGING_DIR_H=
OST}.</div><div><br></div><div>In my ninja.build it looks like this:</div><=
div>-DCLANG_RESOURCE_DIR=3D"/home/flk/poky/build-hypr/tmp/work/corei7-64-po=
ky-linux/mesa/24.0.2/recipe-sysroot/usr/lib/clang/18.1.0/include</div><div>=
<br></div><div>2.The include for this happens here:</div><div><a href=3D"ht=
tps://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/frontends/cl=
over/meson.build?ref_type=3Dheads#L69">https://gitlab.freedesktop.org/mesa/=
mesa/-/blob/main/src/gallium/frontends/clover/meson.build?ref_type=3Dheads#=
L69</a></div><div><br></div><div>3. This include is wrong in any case</div>=
<div>&nbsp; &nbsp; dep_llvm.version() =3D 18.0.1 (and should be 18 for curr=
ent clang)</div><div>&nbsp; &nbsp; Setting a different path therefore proba=
bly does not break anything additionally</div><div>&nbsp; &nbsp; but helps =
to remove the build paths from the binaries and the source.</div><div><br><=
/div><div>What I have done under the assumption that this include is not ne=
eded for oe:</div><div><br></div><div><div>--- a/src/gallium/frontends/clov=
er/meson.build<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>2024-02-28 19:29:18.000000000 +0100</div><div>+++ b/src/gallium/fronten=
ds/clover/meson.build<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>2024-04-02 13:10:38.351443132 +0200</div><div><div>@@ -66,8 +66,=
7 @@</div><div>&nbsp; &nbsp; &nbsp;clover_cpp_args,</div><div>&nbsp; &nbsp;=
 &nbsp;clover_opencl_cpp_args,</div><div>&nbsp; &nbsp; &nbsp;clover_spirv_c=
pp_args,</div><div>- &nbsp; &nbsp;'-DCLANG_RESOURCE_DIR=3D"@0@"'.format(joi=
n_paths(</div><div>- &nbsp; &nbsp; &nbsp;dep_llvm.get_variable(cmake : 'LLV=
M_LIBRARY_DIR', configtool: 'libdir'), 'clang',</div><div>+ &nbsp; &nbsp;'-=
DCLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths( '/usr/lib/clang',</div><div=
>&nbsp; &nbsp; &nbsp; &nbsp;dep_llvm.version(), 'include',</div><div>&nbsp;=
 &nbsp; &nbsp;)),</div><div>&nbsp; &nbsp;],</div></div></div><div><br></div=
><div>Not vaild, because&nbsp;dep_llvm.version() still !=3D 18 but&nbsp;</d=
iv><div><div>Because the path was already wrong before, mesa compiled witho=
ut errors as expected.</div><div><br></div><div>Is &nbsp;setting CLANG_RESO=
URCE_DIR really not needed in oe or is this a bug and the missing headers h=
ave simply been silently ignored so far?</div></div><div><br></div></div>
--=-Mk0oX+2dtfftxgajCM0R--


