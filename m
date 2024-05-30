Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B1AC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:21:05 +0000 (UTC)
Subject: Re: [PATCH 18/23] mongodb: skip until python 3.12 fixes are available.
To: openembedded-devel@lists.openembedded.org
From: "Vincent Prince" <vincent.prince.fr@gmail.com>
X-Originating-Location: =?UTF-8?B?UGFyaXMsIMOObGUtZGUtRnJhbmNlLCBGUg==?= (147.161.184.167)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 May 2024 02:21:02 -0700
References: <4abd75ec-e214-4176-9b73-530d54213680@smile.fr>
In-Reply-To: <4abd75ec-e214-4176-9b73-530d54213680@smile.fr>
Message-ID: <26400.1717060862294940762@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OJO0ZgQCZFsqVRGy88BJ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 09:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110624

--OJO0ZgQCZFsqVRGy88BJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello

It seems to compile with this patch

diff --git a/buildscripts/moduleconfig.py b/buildscripts/moduleconfig.py
index b4d0bba0490..73c0f1a03fa 100644
--- a/buildscripts/moduleconfig.py
+++ b/buildscripts/moduleconfig.py
@@ -27,7 +27,7 @@ MongoDB SConscript files do.
__all__ =3D ('discover_modules', 'discover_module_directories', 'configure_=
modules',
'register_module_test') =C2=A0# pylint: disable=3Dundefined-all-variable

-import imp
+import importlib
import inspect
import os

@@ -71,7 +71,7 @@ def discover_modules(module_root, allowed_modules):
print("adding module: %s" % (name))
fp =3D open(build_py, "r")
try:
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module =3D imp.loa=
d_module("module_" + name, fp, build_py,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module =3D importl=
ib.import_module("module_" + name, fp, build_py,
(".py", "r", imp.PY_SOURCE))
if getattr(module, "name", None) is None:
module.name =3D name
--
2.34.1

I'm not that confident about it but if it helps :)

Best regards,

Vincent

--OJO0ZgQCZFsqVRGy88BJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello</p>
<p>&nbsp;</p>
<p>It seems to compile with this patch</p>
<p>&nbsp;</p>
<p>diff --git a/buildscripts/moduleconfig.py b/buildscripts/moduleconfig.py=
<br />index b4d0bba0490..73c0f1a03fa 100644<br />--- a/buildscripts/modulec=
onfig.py<br />+++ b/buildscripts/moduleconfig.py<br />@@ -27,7 +27,7 @@ Mon=
goDB SConscript files do.<br />&nbsp;__all__ =3D ('discover_modules', 'disc=
over_module_directories', 'configure_modules',<br />&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; 'register_module_test') &nbsp;# pylint: disable=3Dundefi=
ned-all-variable<br />&nbsp;<br />-import imp<br />+import importlib<br />&=
nbsp;import inspect<br />&nbsp;import os<br />&nbsp;<br />@@ -71,7 +71,7 @@=
 def discover_modules(module_root, allowed_modules):<br />&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;print("adding module: %s" % (name))<br />&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fp =3D open(build_py, "r")<br =
/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;try:<br />- &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;module =3D imp.load_module("modul=
e_" + name, fp, build_py,<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;module =3D importlib.import_module("module_" + name, fp, build=
_py,<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (".py", "r", imp.PY_SOURCE))<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;if getattr(module, "name", None) is None:<br />=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;module.name =3D name<br />--&nbsp;<br />2.34.1</p>
<p>&nbsp;</p>
<p>I'm not that confident about it but if it helps :)</p>
<p>&nbsp;</p>
<p>Best regards,</p>
<p>Vincent</p>

--OJO0ZgQCZFsqVRGy88BJ--

