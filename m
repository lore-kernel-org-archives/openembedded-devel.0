Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0B1CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:38:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74817.1780994286307388989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MKPa5JLW;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Jp7IuT7C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rqRA2001533
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xfZ6xIGw4lcCjJfkqUuJh05/
	DX8m8l8/9U60ZYRIjkc=; b=MKPa5JLW507Oxy8V4spaRFSOtiVAFbtDsexZYeqh
	Z7xahMbyaq0QweX1mGeB95jRsLUAdCs9ND+atO5aKgwnahzfj6jbVtG8Ih1x8i2E
	UgQcZcpkWsNXX3BoMV/FV343dJSinoORPNpLFuCsxyGaAY+kFRlqkgKvPur0hCKB
	4xiLzYOea0+MIrsHFKMHnQM/T+qNZ1W4WgDe0+JVZc4yDQhwnj9SFuQepbtZNOVv
	M27jyB7b9nXdhtlt2ON+KrDI2pja79v5nnKc4j8KQZRMabytWmVx0hydaUOuLIgh
	xcf1NZEC7CtuT3XHpREWnrL8mtp2MG3EaSmZQlojcB0Mrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rd5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:38:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ba226a9bso650909085a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 01:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780994284; cv=none;
        d=google.com; s=arc-20240605;
        b=CsXFKxo7WKCBpXLuSL9z2cplGqzVG+GaKQ1OMgIDyQZZDgw3SBdqAhK78SHRUvWjah
         Xl3k8q6Ad/7OlhlEymuJ2jwLuudaMJ6j2ZE3/CyL7l8jKU7MH2k6cgxa3S1jMBl5oWAd
         Kbc0oxaBnKISR1IZZ8IEvW65BWODQEelXImWGJM0PCZYrNzQ9/T3X+hh1mDq8wXPU/OT
         p1EIJ71LI7OidGO4UpqoT7OkJzJLUMn5eNegz0p33ToIQh8T626WgP/TD0utvcDeB4e8
         9oZKVjuvu4LYr2Utzk6iOZ12indJxb267SDiD8CrYJ8tN85ZPLr7kQL1jDi7Kotazx0y
         M4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xfZ6xIGw4lcCjJfkqUuJh05/DX8m8l8/9U60ZYRIjkc=;
        fh=4YTjzO0C8RH/MztJHcaGYe1pZCao8Pv/ipu6VaPWe1w=;
        b=OG36lINrXWrOA+pRP8kiBe1FyD3BNQerWHWxftDbBr8+ONGdAeGEON6dsXCapHu9+G
         Btecv3Dhi3D60Pzb8RTeyFBY0bzy/89fXXLoT83eeSgrzVKw8gi5Q6hrjiIRB1IFK4d6
         4eUDraTHH74bbv4TP5eQ4HR5EUJsS5GB70pc4ovhLf0dD7emJdTPxMwaeA6xplXxqPMW
         toG0LmNohDFwGgePJyjMR3WobzFryYRR+01FWqgIoVUV6QVt+TbKnWSsYLfelhK/NG9h
         AaBVRaHJbO0TWEP58aGnFZbR92NfZZgBT4gXvvJ+fqGk5D1eO25BxekayBknlbXvX+6I
         Asfg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780994284; x=1781599084; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfZ6xIGw4lcCjJfkqUuJh05/DX8m8l8/9U60ZYRIjkc=;
        b=Jp7IuT7CyoPwa7VDcW0asSWsuQACDkBX/C53tvjNF8FAgMiii/ODiOsWlU/kua2XFo
         6jX+Ok+Nfo8AwDTLarzaPohRJ0UKm9JJwc/z4pn9ro4nBff5GVF6kotXab510y9B86BZ
         qTweFq5jiKmNI+Ow59N0K8NhR8k0VaP9S8iBHpadypMqyVlfAN6ABr85z4JZdRTd4aYm
         fLn5HH29YL2urw3vcyEqCYAvs4tb56CKRagmKexj1SZsL0pddhlW7EUgavunkY9ti0rb
         LosxMAMQMe1+GFIRWVx/VTkJCADglhODW/vJux66wSzmpsm0+3Gg2zc3f1obvlCooZhs
         dhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994284; x=1781599084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfZ6xIGw4lcCjJfkqUuJh05/DX8m8l8/9U60ZYRIjkc=;
        b=lM6G2XNj0L2HnuIlC0Q5jX5jDEQwjc312xitrDOGEgnGglf//Sn28473OqMWijuF4W
         0BspLqx0jHQPwccnzQS8BqQE6xEkyo/WSEjUakcrd9vsl0nMmRsNSkHzNpEeY/ZHfC4L
         pj3GiT+G1UGTiaoLJo723mIzULbgp3X1eJ5GtlZvWp9qaDenxx7jID8PkD1dRWoUA8Xi
         epXtKWbr8X6PB6ICwSqX3SFJooMuuyz1UE9d4PlwtbD8jPtCVzjHCl+RlLCcy7l157fr
         6oFESnjTz6TI4tybQ81m7LO5qOHYN02lytT4BdpAJ+hFDpE6ZZvDibFpH2V0O4Q4dTMn
         urmg==
X-Gm-Message-State: AOJu0YyFxVFnJhrxU007Qs+eKCCFsZ2rbXIDfPK4KvWzakygTFxAF1c1
	iAbIb8+YWfNivPwwqg1KLRwaAL/VpIC14DDMuWsvt/Nb+e2a9FZiZdmD4iVsBztQ+v8VlZoJabQ
	FV6GYpE54MtAyeFhxRAtHAHcxuMk6NApZnQ9Hb+suumGgklvPlrC0mgXuV7oJjH/4sAsUVrtfUU
	Was/2THB6Kv4qevBZMITlXCEAVj1AT+9TtOYehRb7eeQGm0eSSkrldorOVs0E=
X-Gm-Gg: Acq92OFlnf0hs7DRPc4AmsdCN4dzJQoCFJ08QSVWB+HcNBwKmlRZexS2qw2ctflc/3G
	gvFKw9WkYeOK1u4DAGRfuXsNFg76YHSWfagaSuZFCDfsg66qYr8T/CjN3oZGz/7yIb+00rVT5Fh
	lOwWGmCVRxcn5sujRvmKNAvzRdsXhoLlCGwOtt1DNP4aJk7cxVyR8XQSsPHNPJzGg5/gLKPgPe9
	ZtrjftffvD/XwI=
X-Received: by 2002:a05:620a:bd4:b0:913:7bc8:79b9 with SMTP id af79cd13be357-915a9c9da61mr3291310285a.22.1780994284315;
        Tue, 09 Jun 2026 01:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:913:7bc8:79b9 with SMTP id
 af79cd13be357-915a9c9da61mr3291305585a.22.1780994283741; Tue, 09 Jun 2026
 01:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <R6zi.1780993623156690725.G7et@lists.openembedded.org>
In-Reply-To: <R6zi.1780993623156690725.G7et@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:37:52 +0800
X-Gm-Features: AVVi8Cfsp2FqrEUeyOVxhGjWKUW9GJ-8hHtY9vDQOVCbSsEI0EmStSxpKrsHWbk
Message-ID: <CA+s=J=y=L4SQXRkWLVyh=knoh8cn+FQDL=FRXWX=rLVjMSitEg@mail.gmail.com>
Subject: Re: [oe] [wrynose]: Input if android-tools change from master can be back-ported
To: ashishkumar.mishra@bmwtechworks.in
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a1313f0653ce0b57"
X-Proofpoint-ORIG-GUID: l43Ww4rEe0grTwlUADYJS4Ab01QOzGzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3OSBTYWx0ZWRfX6ovAF/d4dpr5
 6HegWiV0OWimAuY/HxIgA982TOcTw73OkTpvXh0fk1z1OrDTE7PCam+4UU9bwmQ70uoKLo3q3e6
 Se+K3YRRfW1eOaaOuqYashX47Oi8JAFVoHejpnMdWP5rpCqwxRdMhR/9dwBKFXk8h0e5TY/TVtJ
 iMZClRV0D+U7gy9d3qrXMzPWAR6jjYrvys0PZ2ObL4EiTcAaj7UjpWeQWrA2nA9h6k0aYzu7HJk
 YqVZc/XDAw6hqeIyyjPTfpMhQnybiZuwz6Tr/h08cUPe2vrVYOR9JAOt3W50uwUHXCJpFfPWtrr
 6N+TvkNz0sntRH6/QZd8uGmlGdKOj5M1l/Vv15ajzU2HQ/qjjb0P247iQ4ZqeiyC7i0LeqY3cMX
 BWzFPN1Np8p+6VCWWm1Bt5Rmsyz8syqJlg913weRNnOByOfYPY7s+ym3B17nGo97BrLgsHhFmDg
 27M2Jx1Vs5EMNSu3zVA==
X-Proofpoint-GUID: l43Ww4rEe0grTwlUADYJS4Ab01QOzGzI
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27d0ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Q4-j1AaZAAAA:8 a=76SdZnuyEF4eQlgZCbIA:9 a=QEXdDO2ut3YA:10
 a=HDMK3QTpyxOIzpBAT2IA:9 a=DKHRyAVxwrTE9NEf:21 a=lqcHg5cX4UMA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127444

--000000000000a1313f0653ce0b57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM AshishKumar Mishra via lists.openemb=
edded.org
<ashishkumar.mishra=3Dbmwtechworks.in@lists.openembedded.org> wrote:

> Hi  Khem / Team ,
>
> I have change to move android-tools from dynamic-layers/selinux to meta-o=
e
> merged in master branch
>
> 2026-05-24 android-tools: fix deprecated header warning from clang
> <https://git.openembedded.org/meta-openembedded/commit/?id=3D71da24f0895f=
dfea53748bd275c6f639eb771cf0> AshishKumar
> Mishra
> 2026-05-24 android-tools: removes selinux dependency from
> android-tools_29.0.6.r14.bb
> <https://git.openembedded.org/meta-openembedded/commit/?id=3D72dfc0df7682=
e898cac19aa9163ba8bea8ae5397> AshishKumar
> Mishra
> 2026-05-24 android-tools: move android-tools v29.x from
> dynamic-layers/selinux to meta-oe
> <https://git.openembedded.org/meta-openembedded/commit/?id=3D66f56dda5ec7=
afe2b059da3c50f0edf3d536964d> AshishKumar
> Mishra
> 2026-05-24 android-tools: remove android-tools 5.x from
> meta-oe/recipes-devtools
> <https://git.openembedded.org/meta-openembedded/commit/?id=3D33c1e33d2303=
d20e916783fb91e78781bab7cc2b> AshishKumar
> Mishra
>
> Looking at the usage , wanted to check if team can allow this change in
> wrynose as it will be the LTS till 2030
> My understanding is that in released LTS major version bump will not be
> accepeted
> Such that major or minor version bumps for recipes are not allowed unless
> they are bug-fix / cve fix
>
>

I do not think this is appropriate for wrynose.

Thanks,

Anuj

--000000000000a1313f0653ce0b57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 9, =
2026 at 4:27=E2=80=AFPM AshishKumar Mishra via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;ashishkumar.mishra=3D<a href=
=3D"mailto:bmwtechworks.in@lists.openembedded.org">bmwtechworks.in@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div>Hi=C2=A0 Khem / Team ,=C2=A0</div>
<div><br>I have change to move android-tools from dynamic-layers/selinux to=
 meta-oe merged in master branch=C2=A0</div>
<div><br>
<table style=3D"border-collapse:collapse;width:2425.33px;border:medium;colo=
r:rgb(51,51,51);font-family:sans-serif;font-size:13.3333px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-transform:none;word-spacing:0px;w=
hite-space:normal;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial">
<tbody>
<tr style=3D"background:rgb(247,247,247)">
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span ti=
tle=3D"2026-05-24 08:25:07 -0700">2026-05-24</span></td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><a style=
=3D"color:black;text-decoration:none" href=3D"https://git.openembedded.org/=
meta-openembedded/commit/?id=3D71da24f0895fdfea53748bd275c6f639eb771cf0" ta=
rget=3D"_blank">android-tools: fix deprecated header warning from clang</a>=
</td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span><i=
mg style=3D"border: medium; border-radius: 3px; width: 13px; height: 13px; =
margin-right: 0.2em; opacity: 0.4;"></span>AshishKumar Mishra</td>
</tr>
<tr style=3D"background:white">
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span ti=
tle=3D"2026-05-24 08:25:07 -0700">2026-05-24</span></td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><a style=
=3D"color:black;text-decoration:none" href=3D"https://git.openembedded.org/=
meta-openembedded/commit/?id=3D72dfc0df7682e898cac19aa9163ba8bea8ae5397" ta=
rget=3D"_blank">android-tools: removes selinux dependency from android-tool=
s_29.0.6.r14.bb</a></td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span><i=
mg style=3D"border: medium; border-radius: 3px; width: 13px; height: 13px; =
margin-right: 0.2em; opacity: 0.4;"></span>AshishKumar Mishra</td>
</tr>
<tr style=3D"background:rgb(238,238,238)">
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span ti=
tle=3D"2026-05-24 08:25:06 -0700">2026-05-24</span></td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><a style=
=3D"color:rgb(0,0,255);text-decoration:underline" href=3D"https://git.opene=
mbedded.org/meta-openembedded/commit/?id=3D66f56dda5ec7afe2b059da3c50f0edf3=
d536964d" target=3D"_blank">android-tools: move android-tools v29.x from dy=
namic-layers/selinux to meta-oe</a></td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span><i=
mg style=3D"border: medium; border-radius: 3px; width: 13px; height: 13px; =
margin-right: 0.2em; opacity: 0.4;"></span>AshishKumar Mishra</td>
</tr>
<tr style=3D"background:white">
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span ti=
tle=3D"2026-05-24 08:25:06 -0700">2026-05-24</span></td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><a style=
=3D"color:black;text-decoration:none" href=3D"https://git.openembedded.org/=
meta-openembedded/commit/?id=3D33c1e33d2303d20e916783fb91e78781bab7cc2b" ta=
rget=3D"_blank">android-tools: remove android-tools 5.x from meta-oe/recipe=
s-devtools</a></td>
<td style=3D"border:medium;padding:0.1em 0.5em;white-space:nowrap"><span><i=
mg style=3D"border: medium; border-radius: 3px; width: 13px; height: 13px; =
margin-right: 0.2em; opacity: 0.4;"></span>AshishKumar Mishra</td>
</tr>
</tbody>
</table>
<div>
<div>=C2=A0</div>
<div>Looking at the usage , wanted to check if team can allow this change i=
n wrynose as it will be the LTS till 2030=C2=A0</div>
<div>
<div>My understanding is that in released LTS major version bump will not b=
e accepeted=C2=A0</div>
<div>Such that major or minor version bumps for recipes are not allowed unl=
ess they are bug-fix / cve fix=C2=A0</div>
<div>=C2=A0</div></div></div></div></blockquote><div><br></div><div>I do no=
t think this is appropriate for wrynose.=C2=A0</div><div><br></div><div>Tha=
nks,</div><div><br></div><div>Anuj</div></div></div>

--000000000000a1313f0653ce0b57--

