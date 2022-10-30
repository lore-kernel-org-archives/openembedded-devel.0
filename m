Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BD7FA373D
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 06:42:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.6108.1667112120713546987
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 23:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 1D9D963CA
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 07:41:58 +0100 (CET)
Received: from [192.168.178.122] ([79.219.234.64]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1op216-1cC7rk0; Sun, 30 Oct 2022 07:41:56 +0100
Date: Sun, 30 Oct 2022 07:41:50 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-openembedded][PATCH 3/3] spice: build with opus and
 opengl
To: openembedded-devel@lists.openembedded.org
Message-Id: <QXZJKR.KVXE45SVRMV71@t-online.de>
In-Reply-To: <17229508563226DE.31302@lists.openembedded.org>
References: <20221029154116.3128371-1-f_l_k@t-online.de>
	<172294851D2ECF2D.19890@lists.openembedded.org>
	<17229508563226DE.31302@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uDuB6ggVLPwUeeQvGcpP"
X-TOI-EXPURGATEID: 150726::1667112116-CA4B6B6F-FF7F724D/0/0 CLEAN NORMAL
X-TOI-MSGID: fe1ec57a-6bf5-423b-abaa-926496567752
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 06:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99349

--=-uDuB6ggVLPwUeeQvGcpP
Content-Type: text/plain; charset=us-ascii; format=flowed

After I had a closer look at the spice configure log it turned out, 
that the dependencies and the autotools configure options were quite 
outdated and partly wrong. For that reason i did a rework for the spice 
recipe, upgradet to 0.15.1 and switched the buildsystem over to meson. 
I've sent a v2 for the spice.bb

Am Sa, 29. Okt 2022 um 17:50:54 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> These recipes are needed to compile virt-viewer, for which I have 
> also created a recipe. I would send it as a proposal to 
> meta-virtualization, but I'm not sure which mailing list would be the 
> right one?
> 
> I have done compilation tests for x86_64, aarch64 and mipsqemu with 
> gcc. Fingers crossed for clang.
> 
> Runtime tested with proxmox on x86_64
> 
> Am Sa, 29. Okt 2022 um 17:41:16 +0200 schrieb Markus Volk 
> <f_l_k@t-online.de>:
>>   - remove COMPATIBLE_HOSTS whitelist because I was able to compile 
>> this for qemumips also
>> 
>> Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>> ---
>>  meta-networking/recipes-support/spice/spice_git.bb | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>> 
>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb 
>> b/meta-networking/recipes-support/spice/spice_git.bb
>> index b3e687476..69e220050 100644
>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>> @@ -47,7 +47,7 @@ CFLAGS:append = " -Wno-error"
>> 
>>  PACKAGECONFIG:class-native = ""
>>  PACKAGECONFIG:class-nativesdk = ""
>> -PACKAGECONFIG ?= "sasl"
>> +PACKAGECONFIG ?= "sasl ${@bb.utils.filter 
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'opengl', d)} opus"
>> 
>>  PACKAGECONFIG[celt051] = 
>> "--enable-celt051,--disable-celt051,celt051"
>>  PACKAGECONFIG[smartcard] = 
>> "--enable-smartcard,--disable-smartcard,libcacard,"
>> @@ -58,8 +58,6 @@ PACKAGECONFIG[opus] = 
>> "--enable-opus,--disable-opus,libopus,"
>>  PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
>>  PACKAGECONFIG[xinerama] = 
>> "--enable-xinerama,--disable-xinerama,libxinerama,"
>> 
>> -COMPATIBLE_HOST = '(x86_64|i.86|aarch64).*-linux'
>> -
>>  BBCLASSEXTEND = "native nativesdk"
>> 
>>  EXTRA_OECONF:append:toolchain-clang = " --disable-werror"
>> --
>> 2.34.1
>> 
>> 
>> 
>> 


--=-uDuB6ggVLPwUeeQvGcpP
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>After I had a closer look at the s=
pice configure log it turned out, that the dependencies and the autotools c=
onfigure options were quite outdated and partly wrong. For that reason i di=
d a rework for the spice recipe, upgradet to 0.15.1 and switched the builds=
ystem over to meson. I've sent a v2 for the spice.bb</div></div><div id=3D"=
geary-quote" dir=3D"auto"><br>Am Sa, 29. Okt 2022 um 17:50:54 +0200 schrieb=
 Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite"><div i=
d=3D"geary-body" dir=3D"auto"><div>These recipes are needed to compile virt=
-viewer, for which I have also created a recipe. I would send it as a propo=
sal to meta-virtualization, but I'm not sure which mailing list would be th=
e right one?</div><div><br></div><div>I have done compilation tests for x86=
_64, aarch64 and mipsqemu with gcc. Fingers crossed for clang.</div><div><b=
r></div><div>Runtime tested with proxmox on x86_64</div></div><div id=3D"ge=
ary-quote" dir=3D"auto"><br>Am Sa, 29. Okt 2022 um 17:41:16 +0200 schrieb M=
arkus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite"><div cla=
ss=3D"plaintext" style=3D"white-space: break-spaces;">  - remove COMPATIBLE=
_HOSTS whitelist because I was able to compile this for qemumips also

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 meta-networking/recipes-support/spice/spice_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-netw=
orking/recipes-support/spice/spice_git.bb
index b3e687476..69e220050 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -47,7 +47,7 @@ CFLAGS:append =3D " -Wno-error"
=20
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
-PACKAGECONFIG ?=3D "sasl"
+PACKAGECONFIG ?=3D "sasl <a href=3D"mailto:${@bb.utils.filter">${@bb.utils=
.filter</a>('DISTRO_FEATURES', 'opengl', d)} opus"
=20
 PACKAGECONFIG[celt051] =3D "--enable-celt051,--disable-celt051,celt051"
 PACKAGECONFIG[smartcard] =3D "--enable-smartcard,--disable-smartcard,libca=
card,"
@@ -58,8 +58,6 @@ PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,lib=
opus,"
 PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,,"
 PACKAGECONFIG[xinerama] =3D "--enable-xinerama,--disable-xinerama,libxiner=
ama,"
=20
-COMPATIBLE_HOST =3D '(x86_64|i.86|aarch64).*-linux'
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 EXTRA_OECONF:append:toolchain-clang =3D " --disable-werror"
<div>--=20
</div>2.34.1

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">


</div></blockquote></div>
</blockquote></div>
--=-uDuB6ggVLPwUeeQvGcpP--


