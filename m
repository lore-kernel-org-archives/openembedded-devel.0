Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FDDCD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:09:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70806.1778573344185729963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 01:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@semalibre.com header.s=dkim header.b=QzXKnmq+;
 spf=pass (domain: semalibre.com, ip: 185.246.85.4, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 955894E42C19
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6211060646;
	Tue, 12 May 2026 08:09:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E60E11AF9FE7;
	Tue, 12 May 2026 10:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1778573340;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vcHzv95E2DrSla927j740rAy9AnpE1wIUx4npB+nmsY=;
	b=QzXKnmq+ibjlycs8ildlBRCICZ2JgZp9xHpzWEVJMbanBjUjyZffo9efeS+2gkXGHBCpit
	xYkN+KOWNMmfNnbb69EcvwbWB0qCPORjvdu1ZNI022K2S3Qc7T4cpO+TA5EX81KiqmJm93
	SGYRk79W2nZY/3SZfAnW/8xJiYIdZgH3LqpwuI8bSMw11za0OyCRUter+v+LHMVHf6KzQ1
	3JwV2sj8QtFv85b8fA6YBQ8GcXzegtGf2woPYLbYs8gDzgJmQWrG8zuF8eIVf+uMtiGY+F
	Dr9dX3PP1Aq4ut/xtVQKIIJj6apzxyqHNOcdOyVg8jbKLXLRmGuVkyXeC4NUQQ==
Date: Tue, 12 May 2026 10:08:58 +0200
From: Louis Rannou <louis.rannou@semalibre.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
Message-ID: <a083ae32-59d7-4128-9507-77faae3960f5@semalibre.com>
In-Reply-To: <CAMKF1soSKFt_BdUsN-ir=BWRsJOOwPPV9YYfR0HEcYZ2-uj-GA@mail.gmail.com>
References: <20260511-bash-rr-v2-1-4987ca21e7d8@non.se.com> <CAMKF1soSKFt_BdUsN-ir=BWRsJOOwPPV9YYfR0HEcYZ2-uj-GA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] openvpn: create an extra
 package for the dns-updown script
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3_208068885.1778573338280"
X-Correlation-ID: <a083ae32-59d7-4128-9507-77faae3960f5@semalibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126862

------=_Part_3_208068885.1778573338280
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

12 mai 2026 06:35:59 Khem Raj <raj.khem@gmail.com>:

>
>
> On Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via lists.openembedd=
ed.org[http://lists.openembedded.org] <louis.rannou=3Dsemalibre.com@lists.o=
penembedded.org> wrote:
>> From: Louis Rannou <louis.rannou@non.se.com>
>>
>> The dns-updown script is written in bash which is under the GPLv3
>> license. As this script is optional, it is preffered to have it in an ex=
tra
>> package.
>
> Does ptest work ok after this=C2=A0change=C2=A0?

I get some errors but I suppose they are parts of the test as the result lo=
oks fine:

DURATION: 84
END: /usr/lib/openvpn/ptest
2026-05-12T07:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0


> =C2=A0
>>
>> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
>> ---
>> change in v2: new package openvpn-dns-updown
>> ---
>> =C2=A0meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://op=
envpn_2.7.0.bb] | 5 +++--
>> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[ht=
tp://openvpn_2.7.0.bb] b/meta-networking/recipes-support/openvpn/openvpn_2.=
7.0.bb[http://openvpn_2.7.0.bb]
>> index 0cbe4641cd..6ddebde4d1 100644
>> --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://op=
envpn_2.7.0.bb]
>> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://op=
envpn_2.7.0.bb]
>> @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D "--enable-iproute2,,iprout=
e2,iproute2-ip"
>> =C2=A0PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,sys=
temd"
>> =C2=A0PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,lib=
selinux"
>>
>> -RDEPENDS:${PN}:append =3D " bash"
>> +RDEPENDS:${PN}-dns-updown:append =3D " bash"
>> =C2=A0RDEPENDS:${PN}-ptest:append =3D " bash"
>>
>> =C2=A0do_install:append() {
>> @@ -114,7 +114,7 @@ do_install_ptest() {
>> =C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
>> =C2=A0}
>>
>> -PACKAGES =3D+ " ${PN}-sample "
>> +PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "
>>
>> =C2=A0RRECOMMENDS:${PN} =3D "kernel-module-tun"
>>
>> @@ -124,5 +124,6 @@ FILES:${PN} +=3D "${systemd_system_unitdir}/openvpn-=
server@.service \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_=
system_unitdir}/openvpn-client@.service \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_=
libdir}/tmpfiles.d \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>> +FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"
>> =C2=A0FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 "
>>
>> ---
>> base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
>> change-id: 20260506-bash-rr-5fd0820519e4
>>
>> Best regards,
>> --
>> Louis Rannou <louis.rannou@non.se.com>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126849): https://lists.openembedded.org/g/openembedd=
ed-devel/message/126849
>> Mute This Topic: https://lists.openembedded.org/mt/119254470/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org[openembedde=
d-devel%2Bowner@lists.openembedded.org]
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


------=_Part_3_208068885.1778573338280
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
 </head>
 <body>
  <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">12 mai 2026 06=
:35:59 Khem Raj &lt;raj.khem@gmail.com&gt;:</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; On Mo=
n, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via lists.openembedded.org[=
http://lists.openembedded.org] &lt;louis.rannou=3Dsemalibre.com@lists.opene=
mbedded.org&gt; wrote:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; F=
rom: Louis Rannou &lt;louis.rannou@non.se.com&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; T=
he dns-updown script is written in bash which is under the GPLv3</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; l=
icense. As this script is optional, it is preffered to have it in an extra<=
/span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; p=
ackage.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; Does =
ptest work ok after this&nbsp;change&nbsp;?</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">I get some=
 errors but I suppose they are parts of the test as the result looks fine:<=
/span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">DURATION: =
84</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">END: /usr/=
lib/openvpn/ptest</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">2026-05-12=
T07:56</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">STOP: ptes=
t-runner</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">TOTAL: 1 F=
AIL: 0</span>
  <br>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp=
;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; S=
igned-off-by: Louis Rannou &lt;louis.rannou@non.se.com&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; c=
hange in v2: new package openvpn-dns-updown</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://openvp=
n_2.7.0.bb] | 5 +++--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;1 file changed, 3 insertions(+), 2 deletions(-)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; d=
iff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http:/=
/openvpn_2.7.0.bb] b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.=
bb[http://openvpn_2.7.0.bb]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; i=
ndex 0cbe4641cd..6ddebde4d1 100644</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
-- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://openvp=
n_2.7.0.bb]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://openvp=
n_2.7.0.bb]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; @=
@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D "--enable-iproute2,,iproute2,i=
proute2-ip"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd=
"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libseli=
nux"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
RDEPENDS:${PN}:append =3D " bash"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
RDEPENDS:${PN}-dns-updown:append =3D " bash"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;RDEPENDS:${PN}-ptest:append =3D " bash"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;do_install:append() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; @=
@ -114,7 +114,7 @@ do_install_ptest() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; &nbsp; &nbsp;cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;}</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
PACKAGES =3D+ " ${PN}-sample "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;RRECOMMENDS:${PN} =3D "kernel-module-tun"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; @=
@ -124,5 +124,6 @@ FILES:${PN} +=3D "${systemd_system_unitdir}/openvpn-serv=
er@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${systemd_syst=
em_unitdir}/openvpn-client@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${nonarch_libd=
ir}/tmpfiles.d \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; b=
ase-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; c=
hange-id: 20260506-bash-rr-5fd0820519e4</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; B=
est regards,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; L=
ouis Rannou &lt;louis.rannou@non.se.com&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; L=
inks: You receive all messages sent to this group.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; V=
iew/Reply Online (#126849): https://lists.openembedded.org/g/openembedded-d=
evel/message/126849</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; M=
ute This Topic: https://lists.openembedded.org/mt/119254470/1997914</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; G=
roup Owner: openembedded-devel+owner@lists.openembedded.org[openembedded-de=
vel%2Bowner@lists.openembedded.org]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; U=
nsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.=
khem@gmail.com]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br>
  <br>
 </body>
</html>
------=_Part_3_208068885.1778573338280--

