Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42322E9A76F
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:22:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17547.1774351356513676396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Qvh28ist;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dKRHp+Xm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OAWanp1909464
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 11:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3Y+7bZTC3oso5XFiE3edWPWuEdIIMa2qdRdc3M+4eI=; b=Qvh28istkoylDgQS
	dOF9INdKTkKtwKd5vY+VysoglHH4StDF7VzF1rtOh8sbmgWbyKS4y1HdIlw/QZ4l
	cTNBwhTuRv3kADU4MvaaXnVjDDeQSCv18k+7blqtNI/IVMJ0CqKQRqZfg87HCF4T
	aENpdg1K1atkoorpfoR+//nrKesCtpNxAzZye0xq0RZZ5fna/xE6QOYHJ4TNgQsJ
	V6TrOSO2TT0AUi4Gpe3TZ45gQh8XeXPNCcunLUz6GB/9kty0iJ8sOzL91oJX4xX5
	oJ/GpbIrhLMS6PXobD2CD9O2HNiXitTRZqPifDDy+ZbVPwLJK+HqgWUp7OZl7pvO
	gn14LQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyu5xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 11:22:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4b118740so363112366d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 04:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774351355; cv=none;
        d=google.com; s=arc-20240605;
        b=i6tSjyMkr+WF+ASAJjA0HF9BD+ZSvKBthx3iTZGLWCpN4Hp+GAmYCFsz0ljN0JzIZ5
         +cNzBBNp8bi0VPa+hxQ3+q27DpnjGYjt2VdwSxk7BQCEH/UWCwK4qYGnq0giXO5BS6as
         oGa14vqs4Dxjn91Jrq4UDEpDcu/EhdiR/XxjzpQeHo3leIp/3qroba2s2hwHD3AaX4VX
         rfWx4jmAm0uhDuzFA8+dYoOHqYjNEgR6OSgDAFf9Dv/x+k424xTmlJBj7ZZK6nvAAzpB
         pdTjF/ahlWQdoSCDEjdAs0KLFQZPclFfbjLpox486SY0fa9oaUnhGXogbF5QRAO0s4a1
         DA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3Y+7bZTC3oso5XFiE3edWPWuEdIIMa2qdRdc3M+4eI=;
        fh=TFaYYQhti2gL/O1SvckrUik1KlU0zlJoAIcFbfedGks=;
        b=N+0tTc68UoyTA9ma17gmjLNrExHXUe/j/gzRaUmqG5gB4wVqhBRcnJfNBdYGQTERl1
         1XKoy/BQI/Jymdt/GUG8H0XsMpD41NLN07cbpIEc/N3fqx2AqI2eB0tkouKzadW5i44C
         S7TZf8HYoH8tTynR/EfrK+IbeWNldJ4RYMrM4XgwQqeulxVRFk/Z5OZKvpsgki1LORCU
         db4r6qUjWM/+3jwJHm7CVXVUwB/+cXOU5ym0lZqbCBrdQEpJ/+/4UT3BjEZKecji0RFK
         BiI91R9fX6+WvCtrqZlxRAu9P+ihiUJtsAFoxnI1a4moSjj1tmyTBtVdBulbSUB9D3uh
         rGIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774351355; x=1774956155; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3Y+7bZTC3oso5XFiE3edWPWuEdIIMa2qdRdc3M+4eI=;
        b=dKRHp+Xm7OLjLPdanSih8mh2hmfl11tySPIFDFgtQhCKMYPz0dYb1sY0jFJuw3Fu7J
         hntr9oSOvxccjWgtZq/1eHZBs6/qrJnULHB6nXEeLCeZYrk3qyr2Q3T9YK7l6JPtp7FT
         4JEjT467g0sdE8aNEP3cItSKuDChkdxWlk+UwHQ5EmOjIt+IZA20rbokdDc8UUADCh5U
         cyk34JMHocPaOB0QeupY156SFv17Cz1tnjngLrEEGMiElOriZJaqdBRhQ6RqaXo7e6zw
         wBvebMiAOQTmLFB1TRCYT6IvKTA/+CQSLvsFMWXSWVO9EgJf4gcLti4jTqC1nnndrHT6
         Ryxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774351355; x=1774956155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3Y+7bZTC3oso5XFiE3edWPWuEdIIMa2qdRdc3M+4eI=;
        b=gvsvtZzWCBxAj0J5+/7X2PIQGxSX8DqTwnv/dGTQqNmpmcjl786WZCOatc7dKNDmw4
         wLxy7aYRVdXI72HpFBktDTZcxAfSlRc2LRY+Hqcs200kXQhADMn5/gtbGgal82qxXc5R
         88b7ES09MiksS4qN0KebAlJZ7xoyLNCq2ivMPxOTXg5uRACtE3z/OJCghaYTA8FnWt74
         HaWHPcJJ7XIPFP6oKJn2qVpfEoAimT/9gVIAcQ/vL8LxatImTuQFGUY3exQp1uU9RKbQ
         vUUc181sksel8h4Bs3Osbp6bXjm2pH2WHllL+UVBW5WlaEUqw2kCh6iM5EiZ+j4OcVGk
         M7bw==
X-Gm-Message-State: AOJu0YzJKFDKbeWsTrkbo8FsT/fSJqnwDknqVoDGk7eqA8uttkGqslf/
	Je8bTTsZ4apUvZTyxi6kP23PrmfGf9McFPHClV0uNg7DrngnMDdGmgJF5L7iJqhATWVn1x0XDV7
	Knok7Tb6cbZ9Lotj3+9/O5YlfMUZsO0UkzpOjqvsWp2ozeJ/7VNiA1AavWVQum0b/qWUcPPAA6G
	BT8xng+dQNfoiMpIbpASM7TPNebS28861YJQaV6k+oZc64GeATQUjCOhfEDoU=
X-Gm-Gg: ATEYQzyYgz/51f43ERj6JhlMYTrPSvpR19g8TSuGV9HtfbWUMUxtE5XM9KbVh6c5hxu
	LPzu8Kll9S1zhCi3CohZRWqz52bM+MbM9NComkFml3FuUhDirxT4uBL+cCBZKJwrkorTKq7uqiC
	CcxtG1zPzKYM2VWBpWuayRQpFzWy9fw2RY9rzuDoykE0dcxoR+iQJCBRUDXJnjZwg4iqWMeEMkG
	V8q
X-Received: by 2002:ad4:5b84:0:b0:899:be2c:7005 with SMTP id 6a1803df08f44-89c85a57e8cmr241954516d6.30.1774351354931;
        Tue, 24 Mar 2026 04:22:34 -0700 (PDT)
X-Received: by 2002:ad4:5b84:0:b0:899:be2c:7005 with SMTP id
 6a1803df08f44-89c85a57e8cmr241954116d6.30.1774351354318; Tue, 24 Mar 2026
 04:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260324111604.172238-1-adongare@cisco.com>
In-Reply-To: <20260324111604.172238-1-adongare@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 19:22:22 +0800
X-Gm-Features: AQROBzD2u7d2_kQ35utrOhsjEd0UXW9esF79TvpAG9f9EY1HJm8ctDlhHsHfiHM
Message-ID: <CA+s=J=zfbpx14T56iDLzZ2YR9=Odp58Xg8pMyKvEucAC9kG=Dg@mail.gmail.com>
Subject: Re: [oe] [meta-OE] [scarthgap] [PATCH] mariadb: Fix CVE-2026-3494
To: adongare@cisco.com
Cc: openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com,
        to@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5MCBTYWx0ZWRfX32UwhdjDB1BU
 TbiGvbUCkCNRc3spddf1Z5eYGx0aiJSPddPoNvKUVem8cfW2fuVKMcOIbc38hvF+Uw7LuiFdnwc
 i716FMRX9UbvYOs8K+PRSn32teKPPZZGgBD0WNJMrzzGy2pFfeBul/Oi7DQHgO1NrgNFOefTYJE
 W9JkS5giu7IYTj+nBiVhP+tjhAkpGVxZQRdOFLI7dEe6GrJAgAvYXi8iGdVgfrerTU+aBMXueRn
 pGcJ+bzHRJnZhNJAn7ZmBxIbFxX6JE09GxNkEjNW5wNFRCv1M+27Q/QRxmpZbuEb9/P4Le5b+Ja
 3QirYloeiop+SO/j6a1npUnLmE7o8ji1GvnNazKNZQ3ASk+E4u6a1v/SJxceHq9+D/Rjv48MjkJ
 A/JHjCrHC6xODAb4IGEikXXoRpBDkP68HkhaMlMIzuVWy+AKXHrhav9M0folkutyGQm4FxFmEds
 nTCwoxHJhmLHvRpHchw==
X-Proofpoint-ORIG-GUID: WkGf6dfftkwoIrNpgB2kz-D0WVigaLYn
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c273fb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=hkEv4HZQAAAA:8
 a=Q4-j1AaZAAAA:8 a=AUd_NHdVAAAA:8 a=gTZ6NLoF8S4nXp2oS5UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=NA03pvyaApPJG5valX87:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: WkGf6dfftkwoIrNpgB2kz-D0WVigaLYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 11:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125555

On Tue, Mar 24, 2026 at 7:16=E2=80=AFPM Anil Dongare -X (adongare - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org
<adongare=3Dcisco.com@lists.openembedded.org> wrote:
>
> From: Anil Dongare <adongare@cisco.com>
>
> - This patch applies the upstream fix as referenced in [3], using the com=
mit
>   shown in [1].
> - Commit [2] is included as a required regression fix for the same upstre=
am
>   bug ticket [4] (MDEV-38375). It resolves an audit logging regression fo=
r
>   prepared statements introduced during the initial fix.
>
> [1] https://github.com/MariaDB/server/commit/635559a2ad68a5a6d1a354e8209c=
58323dba0261
> [2] https://github.com/MariaDB/server/commit/317fb109153b45091003f0b1380b=
5d68522fce29
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-3494
> [4] https://jira.mariadb.org/browse/MDEV-38375
>

This should be fixed by the upgrade to 10.11.16 already on the list
for scarthgap.

Thanks,

Anuj

