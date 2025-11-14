Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08B2CDB473
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:23:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9316.1763086977490422276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LkGQnKFg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fNHFOTaj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb4da1488582
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GJ8ASW1MSu9Ihot3Z3dvS0dx
	rxKsYnWlgDtGlA+XRrA=; b=LkGQnKFg5X80YN6MIYpLbnLgMnLTxaus2YMjKFk+
	SiIl3r7EcsLMB406WvAYUspTQQyAPGoHWZC+WWRyDpPSoUtoTTlfz3agI7jVLEXB
	nxtdJl3N/AkmmKRVQTM2e4cdJR95wo2BiOUyLpALI+AFXe5tzBvuxN8TgQUdjaoD
	UgxvXGeTXkGycuIX0qBrLV2+4AVYlEM6gjJK4c3yQpBot8Ld1bg4HU0Lpq0K1yHj
	kBVE/51Hl2g8RfAZ/9tW44WkQ16R4rEZtXG8TVrtYGeb19M6heUZHPJGLo1Ol+Qc
	JlNkvjhEyK1+dizNPqRr2EZT1nT8b6LzUv0Rc4nUZZynYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hrg69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:22:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8804823b757so82262066d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763086976; x=1763691776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ8ASW1MSu9Ihot3Z3dvS0dxrxKsYnWlgDtGlA+XRrA=;
        b=fNHFOTaj/IYpbjVx+vQYv7iX4THy9L9wxtXedtFQ+PVzao1LQG1TyHjJr7KLpwcpdb
         v2eq7958zsVZCqFc6brH98OBzisZ8++zpwGYOCK9NYHSvjd+wWihF8aUMfPkyAkqkFJ0
         UKT6wyVuEpZ5MNrWMyH3a7HgEPXSk9WFNuSj2FXr4IBT4iD5Uq7WzY9ondXk7IKAWEV8
         KCSOWtRDy3gLOuq0cEpc7KMO03Mu9K91L9lnAzxoRNTKd0R3dtSuM1qXBWE2q070KqzC
         c8bZCpGGct9nBhilOtlYX/H5KaqJV1JXaewn+1MT+qKjDbXuQbIkTZhRWohKV+kd1xJj
         vYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763086976; x=1763691776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJ8ASW1MSu9Ihot3Z3dvS0dxrxKsYnWlgDtGlA+XRrA=;
        b=lH+3ZrCYJR2MhvI3o19erJOMhHBdFMSie/CtcLEtaOG3+MEztAdD3FBRsvjAgV5uTz
         y+LCkTgHM/WlTpKUL7ocQUwYP7AgCsJGdl7U64khBY4wqDcQGINhnnCsn58hv+K65SR1
         3dlJL1MtAWXyYLkgUSVaPZeZ6skWnDYwJiu8KIC1mz3pA63FJESXWJSP5Krr8OObqS8/
         nN1tSnkvBVGooDLavSCElNXXGb4u2okBhj5B7wbkkNa39LdNvG3uqSbVyHtGppzRfKd6
         kxIJyiQ2vSqdEEX6zYCE5zjJ0385HqKqX1RrQzl+WJHRB7uztfMhFTsUntC0MLLx3QO7
         3ySw==
X-Gm-Message-State: AOJu0Yxipea/Vb9iilsYlq5B8/9OhGgEn4Uwprftgt9q2CWD7ipzPa08
	f26JHYdHnY4yxOe5j6ysrTvl7ColFI3SjVBezyGiz2a6Tr9Z+sxR3wF95S/v30kG5lS9Y85m9Xe
	R6UHrh2ufYyF62nskLAMveU/J63Mzy6IReFIfCa5bcBzYBHe4Nfj9QQm4oPUDyQ08+fk8x2WQOZ
	E0xLDm3V2v+0gzsf9PliJAorcbTPAKbijMZcrtc/cUfeyvXAj3+BY3MsnF5DE=
X-Gm-Gg: ASbGncs0Q7PoQKAiSk/FdWj0q5TyoYc8R/atfCNGUNHCY0JjC4LB3HFYHXGqltwYMzn
	U+ASKZowEKU7dI9LqykYuggmNx2cEdHhD7ztaGFjLIZEPvnmeFepArhD30ANsOQd3V/26UzZwdx
	jIghkejXCVbCVh3QyLnFyICzMDk5IFWFaILbtQHInQe/bjDWZsFlj75fBivG+ELQMB
X-Received: by 2002:ad4:5764:0:b0:882:36d6:e5c1 with SMTP id 6a1803df08f44-88290fb06b7mr27202506d6.29.1763086975717;
        Thu, 13 Nov 2025 18:22:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGECR1W9oc1C4hMzVsYWBH4omgebid1Ne5Fa/3hSN+2TvtsoBUCyil5ljENa9yVq5ommRIpS1YfC6IaFSM5cG8=
X-Received: by 2002:ad4:5764:0:b0:882:36d6:e5c1 with SMTP id
 6a1803df08f44-88290fb06b7mr27202316d6.29.1763086975211; Thu, 13 Nov 2025
 18:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20251113112122.1553793-1-anuj.mittal@oss.qualcomm.com> <CAMKF1sqQF434+QRz02vjnaSSzmBrXpoHgEsuqh==d2AzdBEr3Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqQF434+QRz02vjnaSSzmBrXpoHgEsuqh==d2AzdBEr3Q@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 10:22:43 +0800
X-Gm-Features: AWmQ_bkmpqty-pmt1H0FKt4mR6qF27LCbm3aRrWLnP-OvoxckLwbpcW6i9wp9OE
Message-ID: <CA+s=J=w0hTgiKBYTYEP2pkzqNKhNtzdo0hQ+pYrbD2_G9DfEfw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][master][scarthgap][PATCH] remmina: add
 DEPENDS on curl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dda812064384ac35"
X-Proofpoint-GUID: 5G9BtssW-QG8AZfxx_a9l4gNFEQVTcWR
X-Proofpoint-ORIG-GUID: 5G9BtssW-QG8AZfxx_a9l4gNFEQVTcWR
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69169280 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fou6dX1CAAAA:20 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=KJiIF3uSXbaCrKwK1bkA:9 a=QEXdDO2ut3YA:10 a=XENMUJ77AAAA:8
 a=cSKxLk2JRFHt-JOxlpoA:9 a=0Tyk_csxSlpod33y:21 a=lqcHg5cX4UMA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=30Oh39srklBxVRdBFLRH:22
 a=bA3UWDv6hWIuX7UZL3qL:22 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAxNiBTYWx0ZWRfX6yt3IOsylGE5
 vlPamWqK1EnpLvmY6srvi2LrGVwu7VU6n6PI0hNbutcHl5RAzf4l2r4B0jg8yhoeFCDZQIFI2sy
 fbD7XZ7/KXzIlZ8yvLG2V1nNuIOj4Bk8gFyHNrltCYRbka7WwwceoGeKuVpfvap5FxOy5iEeUjp
 TKfJskbHSjntzE93CvTGX64nF9gq7YYDEaxwEay3ZKLtQt3/dJ9x4fsVA3VO2rVOyDMnWZvS/4l
 e72CAzpNXHZ2y+dDCjSFZkpkzQB0JiulGNlipy8v3E/MoJ4SbZCo3EGv9Z4LNZ/oiKL/7fySoMR
 ilYjvkp4hszhe32mRGVuyTm9vXuUFlwJGpjevv2LHAPzhTuPNu6z0HIgM1MRNTnUv7TzO78cMyE
 CayNQBIt7715dHJDIj/JN54Q67gvFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121667

--000000000000dda812064384ac35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I must have generated it from wrong workspace. I had tested on
master and it doesn't give an error there because of the reasons mentioned
but it'd be good to explicitly mention the dependency anyway.

Should I send a v2 for correct recipe version?

On Fri, Nov 14, 2025 at 10:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> This patch mentions master in subject but the patch is not for version of
> recipe in master. Can you confirm if it is still needed with the master
> version ?
>
> On Thu, Nov 13, 2025 at 3:21=E2=80=AFAM Anuj Mittal via lists.openembedde=
d.org
> <anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
>> remmina has a hard dependency on curl [1]. This doesn't result in an
>> error on branches with gtk4 because curl gets pulled in via vte ->
>> gtk4 -> gstreamer-plugins-bad -> curl.
>>
>> Add an explicit DEPENDS on curl to reflect the dependency.
>>
>> [1]
>> https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc04115695=
29cd0296/src/CMakeLists.txt#L259
>>
>> Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
>> ---
>>  meta-oe/recipes-support/remmina/remmina_1.4.34.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>> b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>> index 921d34d9fd..d101908b94 100644
>> --- a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>> +++ b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>> @@ -20,6 +20,7 @@ DEPENDS =3D " \
>>      libvncserver \
>>      libsecret \
>>      libxkbfile \
>> +    curl \
>>  "
>>
>>  DEPENDS:append:libc-musl =3D " libexecinfo"
>> --
>> 2.51.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121643):
>> https://lists.openembedded.org/g/openembedded-devel/message/121643
>> Mute This Topic: https://lists.openembedded.org/mt/116272361/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000dda812064384ac35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, I must have generated it from wrong workspace.=
 I had tested on master and it doesn&#39;t give an error there because of t=
he reasons mentioned but it&#39;d be good to explicitly mention the depende=
ncy anyway.</div><div><br></div><div>Should I send a v2 for correct recipe =
version?</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Nov 14, 2025 at 10:17=E2=80=AFAM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">This patch mentions master in subject but the patch is not for ver=
sion of recipe in master. Can you confirm if it is still needed with the ma=
ster version ?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 13, 2025 at 3:21=E2=80=AFAM Anuj Mittal via <a =
href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded=
.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openemb=
edded.org" target=3D"_blank">oss.qualcomm.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">remmina=
 has a hard dependency on curl [1]. This doesn&#39;t result in an<br>
error on branches with gtk4 because curl gets pulled in via vte -&gt;<br>
gtk4 -&gt; gstreamer-plugins-bad -&gt; curl.<br>
<br>
Add an explicit DEPENDS on curl to reflect the dependency.<br>
<br>
[1] <a href=3D"https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce=
2ebc0411569529cd0296/src/CMakeLists.txt#L259" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc041=
1569529cd0296/src/CMakeLists.txt#L259</a><br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss.qualcomm.c=
om" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.=
34.bb" rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a> b/meta-oe=
/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" rel=3D"norefe=
rrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
index 921d34d9fd..d101908b94 100644<br>
--- a/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
+++ b/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
@@ -20,6 +20,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libvncserver \<br>
=C2=A0 =C2=A0 =C2=A0libsecret \<br>
=C2=A0 =C2=A0 =C2=A0libxkbfile \<br>
+=C2=A0 =C2=A0 curl \<br>
=C2=A0&quot;<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; libexecinfo&quot;<br>
-- <br>
2.51.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121643" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121643</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116272361/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116272361/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000dda812064384ac35--

