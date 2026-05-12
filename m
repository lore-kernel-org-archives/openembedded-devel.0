Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114E5CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 14:08:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76349.1778594892483020185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 07:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@semalibre.com header.s=dkim header.b=cL3D6Zt/;
 spf=pass (domain: semalibre.com, ip: 185.246.84.56, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E46811A3585;
	Tue, 12 May 2026 14:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B555460646;
	Tue, 12 May 2026 14:08:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8ABD911AF8B82;
	Tue, 12 May 2026 16:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1778594889;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tFn7Ld1LlOiV09tfXz/AfBhoAfwJYKdfZ2IKiGqGado=;
	b=cL3D6Zt/jMTRtpCZ0M3w8/OTBi/kwqDUlNOAPwy5bbYO0gulrn36xE5iYenmHN99tsu096
	3JPtcqOQIx1g3xBoDQbCUCBVQ2ikojFK9oRkYDTTMbIKSFkdZ5ln1ooBORWXyJxEtHMDz+
	ifh2yklf5FdPXDU46ve1QM5c1I3PGAZcxvaZEICLuXw3G+6RzUhALT039I8SXchi+kBtsb
	evYtu67VIy8knnLOkZhN+k1E+YjyP0WpHq+ramZ4K/Y8XNsu02UhRPuSH3LoETcQJjD5vr
	ooM3O4Y38mZERyE3IJNOkz5Ao6a7VQHaIqU8hiFr6begLimJzCh0KgA3vflpRQ==
Date: Tue, 12 May 2026 16:08:07 +0200
From: Louis Rannou <louis.rannou@semalibre.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
Message-ID: <cbbba7e5-abfd-4ca5-9af2-c35a09399c6d@semalibre.com>
In-Reply-To: <CAMKF1sq_QkHqQOSvQUH=v40KhP+gW4hGqxughRuDD-LutMQ5gQ@mail.gmail.com>
References: <20260511-bash-rr-v2-1-4987ca21e7d8@non.se.com> <CAMKF1soSKFt_BdUsN-ir=BWRsJOOwPPV9YYfR0HEcYZ2-uj-GA@mail.gmail.com> <a083ae32-59d7-4128-9507-77faae3960f5@semalibre.com> <CAMKF1sq_QkHqQOSvQUH=v40KhP+gW4hGqxughRuDD-LutMQ5gQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] openvpn: create an extra
 package for the dns-updown script
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3_233082049.1778594887379"
X-Correlation-ID: <cbbba7e5-abfd-4ca5-9af2-c35a09399c6d@semalibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 14:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126868

------=_Part_3_233082049.1778594887379
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

12 mai 2026 15:32:07 Khem Raj <raj.khem@gmail.com>:

> Hi Louis,
>
> Thank you for the update on the test results.
>
> Regarding the errors you mentioned, could you please clarify if these occ=
ur both with and without the proposed change to the openvpn recipe? I am in=
terested to know if these are pre-existing issues or if they are specific t=
o the new package structure.

Hello,

This is coming from the past. Below are the errors on wrynose head for qemu=
arm64:


root@qemuarm64:~# grep -A1 -B1 ERROR logs
Timestamp (0) of auth-token is out of the renewal window
ERROR: --auth-token wrong size (21!=3D60)
PASS: [=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] auth_token_test_empty_user
--
[ RUN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] tls_crypt_v2_wrap_too_long_metadata
ERROR: could not crypt: insufficient space in dst
PASS: [=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] tls_crypt_v2_wrap_too_long=
_metadata
--
[ RUN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] test_get_user_pass_inline_creds_asser=
tions
FATAL ERROR:ERROR: UT username is empty
Expected assertion FATAL ERROR occurred
PASS: [=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] test_get_user_pass_inline_=
creds_assertions
[ RUN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] test_get_user_pass_authfile_stdin_ass=
ertions
FATAL ERROR:ERROR: UT username is empty
Expected assertion FATAL ERROR occurred
PASS: [=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] test_get_user_pass_authfil=
e_stdin_assertions
[ RUN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] test_get_user_pass_authfile_file_asse=
rtions
FATAL ERROR:Error reading username from UT authfile: ./unit_tests/openvpn/i=
nput/empty.txt
Expected assertion FATAL ERROR occurred
FATAL ERROR:Error reading password from UT authfile: ./unit_tests/openvpn/i=
nput/empty.txt
Expected assertion FATAL ERROR occurred
PASS: [=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] test_get_user_pass_authfil=
e_file_assertions

Louis

>
> -Khem
>
>
> On Tue, May 12, 2026, 1:09=E2=80=AFAM Louis Rannou <louis.rannou@semalibr=
e.com> wrote:
>> 12 mai 2026 06:35:59 Khem Raj <raj.khem@gmail.com>:
>>
>>>
>>>
>>> On Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via lists.openembe=
dded.org[http://lists.openembedded.org][http://lists.openembedded.org] <lou=
is.rannou=3Dsemalibre.com@lists.openembedded.org> wrote:
>>>> From: Louis Rannou <louis.rannou@non.se.com>
>>>>
>>>> The dns-updown script is written in bash which is under the GPLv3
>>>> license. As this script is optional, it is preffered to have it in an =
extra
>>>> package.
>>>
>>> Does ptest work ok after this=C2=A0change=C2=A0?
>>
>> I get some errors but I suppose they are parts of the test as the result=
 looks fine:
>>
>> DURATION: 84
>> END: /usr/lib/openvpn/ptest
>> 2026-05-12T07:56
>> STOP: ptest-runner
>> TOTAL: 1 FAIL: 0
>>
>>
>>> =C2=A0
>>>>
>>>> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
>>>> ---
>>>> change in v2: new package openvpn-dns-updown
>>>> ---
>>>> =C2=A0meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://=
openvpn_2.7.0.bb][http://openvpn_2.7.0.bb] | 5 +++--
>>>> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[=
http://openvpn_2.7.0.bb][http://openvpn_2.7.0.bb] b/meta-networking/recipes=
-support/openvpn/openvpn_2.7.0.bb[http://openvpn_2.7.0.bb][http://openvpn_2=
.7.0.bb]
>>>> index 0cbe4641cd..6ddebde4d1 100644
>>>> --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://=
openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]
>>>> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http://=
openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]
>>>> @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D "--enable-iproute2,,ipro=
ute2,iproute2-ip"
>>>> =C2=A0PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,s=
ystemd"
>>>> =C2=A0PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,l=
ibselinux"
>>>>
>>>> -RDEPENDS:${PN}:append =3D " bash"
>>>> +RDEPENDS:${PN}-dns-updown:append =3D " bash"
>>>> =C2=A0RDEPENDS:${PN}-ptest:append =3D " bash"
>>>>
>>>> =C2=A0do_install:append() {
>>>> @@ -114,7 +114,7 @@ do_install_ptest() {
>>>> =C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
>>>> =C2=A0}
>>>>
>>>> -PACKAGES =3D+ " ${PN}-sample "
>>>> +PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "
>>>>
>>>> =C2=A0RRECOMMENDS:${PN} =3D "kernel-module-tun"
>>>>
>>>> @@ -124,5 +124,6 @@ FILES:${PN} +=3D "${systemd_system_unitdir}/openvp=
n-server@.service \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${system=
d_system_unitdir}/openvpn-client@.service \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarc=
h_libdir}/tmpfiles.d \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>>> +FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"
>>>> =C2=A0FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 "
>>>>
>>>> ---
>>>> base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
>>>> change-id: 20260506-bash-rr-5fd0820519e4
>>>>
>>>> Best regards,
>>>> --
>>>> Louis Rannou <louis.rannou@non.se.com>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#126849): https://lists.openembedded.org/g/openembe=
dded-devel/message/126849
>>>> Mute This Topic: https://lists.openembedded.org/mt/119254470/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org[openembed=
ded-devel%2Bowner@lists.openembedded.org][openembedded-devel%2Bowner@lists.=
openembedded.org[openembedded-devel%252Bowner@lists.openembedded.org]]
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>


------=_Part_3_233082049.1778594887379
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
 </head>
 <body>
  <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">12 mai 2026 15=
:32:07 Khem Raj &lt;raj.khem@gmail.com&gt;:</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; Hi Lo=
uis,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; Thank=
 you for the update on the test results.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; Regar=
ding the errors you mentioned, could you please clarify if these occur both=
 with and without the proposed change to the openvpn recipe? I am intereste=
d to know if these are pre-existing issues or if they are specific to the n=
ew package structure.</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Hello,</sp=
an>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">This is co=
ming from the past. Below are the errors on wrynose head for qemuarm64:</sp=
an>
  <br>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">root@qemua=
rm64:~# grep -A1 -B1 ERROR logs</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Timestamp =
(0) of auth-token is out of the renewal window</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">ERROR: --a=
uth-token wrong size (21!=3D60)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">PASS: [&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OK ] auth_token_test_empty_user</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">[ RUN&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ] tls_crypt_v2_wrap_too_long_metadata</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">ERROR: cou=
ld not crypt: insufficient space in dst</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">PASS: [&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OK ] tls_crypt_v2_wrap_too_long_metadata<=
/span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">[ RUN&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ] test_get_user_pass_inline_creds_assertions</spa=
n>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">FATAL ERRO=
R:ERROR: UT username is empty</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Expected a=
ssertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">PASS: [&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OK ] test_get_user_pass_inline_creds_asse=
rtions</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">[ RUN&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ] test_get_user_pass_authfile_stdin_assertions</s=
pan>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">FATAL ERRO=
R:ERROR: UT username is empty</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Expected a=
ssertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">PASS: [&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OK ] test_get_user_pass_authfile_stdin_as=
sertions</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">[ RUN&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ] test_get_user_pass_authfile_file_assertions</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">FATAL ERRO=
R:Error reading username from UT authfile: ./unit_tests/openvpn/input/empty=
.txt</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Expected a=
ssertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">FATAL ERRO=
R:Error reading password from UT authfile: ./unit_tests/openvpn/input/empty=
.txt</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Expected a=
ssertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">PASS: [&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OK ] test_get_user_pass_authfile_file_ass=
ertions</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Louis</spa=
n>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; -Khem=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; On Tu=
e, May 12, 2026, 1:09=E2=80=AFAM Louis Rannou &lt;louis.rannou@semalibre.co=
m&gt; wrote:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; 1=
2 mai 2026 06:35:59 Khem Raj &lt;raj.khem@gmail.com&gt;:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t; On Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via lists.openembed=
ded.org[http://lists.openembedded.org][http://lists.openembedded.org] &lt;l=
ouis.rannou=3Dsemalibre.com@lists.openembedded.org&gt; wrote:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; From: Louis Rannou &lt;louis.rannou@non.se.com&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; The dns-updown script is written in bash which is under the GPLv3</s=
pan>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; license. As this script is optional, it is preffered to have it in a=
n extra</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; package.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t; Does ptest work ok after this&nbsp;change&nbsp;?</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; I=
 get some errors but I suppose they are parts of the test as the result loo=
ks fine:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; D=
URATION: 84</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; E=
ND: /usr/lib/openvpn/ptest</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; 2=
026-05-12T07:56</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; S=
TOP: ptest-runner</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; T=
OTAL: 1 FAIL: 0</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t; &nbsp;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; Signed-off-by: Louis Rannou &lt;louis.rannou@non.se.com&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; change in v2: new package openvpn-dns-updown</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http:=
//openvpn_2.7.0.bb][http://openvpn_2.7.0.bb] | 5 +++--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;1 file changed, 3 insertions(+), 2 deletions(-)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.b=
b[http://openvpn_2.7.0.bb][http://openvpn_2.7.0.bb] b/meta-networking/recip=
es-support/openvpn/openvpn_2.7.0.bb[http://openvpn_2.7.0.bb][http://openvpn=
_2.7.0.bb]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; index 0cbe4641cd..6ddebde4d1 100644</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http:=
//openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[http:=
//openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D "--enable-iproute2,,ip=
route2,iproute2-ip"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd=
,systemd"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux=
,libselinux"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; -RDEPENDS:${PN}:append =3D " bash"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; +RDEPENDS:${PN}-dns-updown:append =3D " bash"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;RDEPENDS:${PN}-ptest:append =3D " bash"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;do_install:append() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; @@ -114,7 +114,7 @@ do_install_ptest() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp; &nbsp; &nbsp;cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}<=
/span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;}</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; -PACKAGES =3D+ " ${PN}-sample "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; +PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;RRECOMMENDS:${PN} =3D "kernel-module-tun"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; @@ -124,5 +124,6 @@ FILES:${PN} +=3D "${systemd_system_unitdir}/open=
vpn-server@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${syst=
emd_system_unitdir}/openvpn-client@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${nona=
rch_libdir}/tmpfiles.d \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; +FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp;FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; "</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; change-id: 20260506-bash-rr-5fd0820519e4</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; Best regards,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; --</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; Louis Rannou &lt;louis.rannou@non.se.com&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; Links: You receive all messages sent to this group.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; View/Reply Online (#126849): https://lists.openembedded.org/g/openem=
bedded-devel/message/126849</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; Mute This Topic: https://lists.openembedded.org/mt/119254470/1997914=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org[openemb=
edded-devel%2Bowner@lists.openembedded.org][openembedded-devel%2Bowner@list=
s.openembedded.org[openembedded-devel%252Bowner@lists.openembedded.org]]</s=
pan>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;&g=
t;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span>
  <br>
  <br>
 </body>
</html>
------=_Part_3_233082049.1778594887379--

