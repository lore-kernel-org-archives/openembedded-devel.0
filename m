Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85995FF885C
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 05:55:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1075.1777096498990001188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 22:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oclAx6Wi;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=T4fiWYHD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3L8OE944555
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 05:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=/aN4UOXNorEdOJTQLBm9l3QjjGvfNCLclM/Ezza1PpA=; b=oc
	lAx6Wii2vWpAW/9J7eXEvyGNm2SvWS927CygK7pKvU5cDTRCoXFDUgVgShzlI9ku
	wAteWyufmU7DHgHhinYujm/570G+67Y553zAwa80NHdWYu9f2c3lHwvoyiHJ7GKl
	G7sFpiDwEkvEknCTtzOn0vnKYwwAWGLO++dk+chrkGpq3e18dE5O8y+CcBMof0vu
	NJLNLYX6T+uvnVLoZsP/WmbEO70g+u6dmbK4UqClP9EssTWd6ZlGBvcT9InMz2bJ
	6HoBgbacQpg3KoxQLvbQyU20X9TOGLj1LBukLyzWXH34gMSta2Hkkn3A4PP5p9pj
	MgF7M2/cR8rA0SkrEA9Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr088n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 05:54:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d4c2906fdfso900133085a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 22:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777096497; cv=none;
        d=google.com; s=arc-20240605;
        b=Ln8xMb6dGx+nXPf5yUkdj+MmNG68TOgqQX7XZ0A/fDE3WVGVBMJe6GCcMCdi26VCQj
         AAuB8KRsNg0krQwXMSaLytdyzPSDPsqLxkpW5gnvtiTHuSuyo5vWqutLQH85CHZ7YseR
         SVdySkaj6vt8v2Exk4mrghG3+1aWr4mOXf4j+x+fg2PmOB3Ba+gWlNCh7SIVOyT/Ip2J
         ziabM0ewAKCNjJVqr3TiPHvSJ70tetWHrxjIa3WarHIv7mdqAqEUK2V58HvKoCC/o9/Y
         J/43uqoHAjCbBN0gcqBXnNGkP+tvb/filbx5u0iPien1VqutVJ4R4Iaq7ASL5l2vfrsE
         Yk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/aN4UOXNorEdOJTQLBm9l3QjjGvfNCLclM/Ezza1PpA=;
        fh=Sz9EADBpfrCLv6q7U9ZBEUz0nl2QuAmXc1tGoo1tqCI=;
        b=JOqvWpnBVvuP8awV7avk8aAoDIA17x8OyZTt/wRjqzpmBZazQhraKdYbiFuNyJqR0f
         rqHdRBIXza+pve8mxT4jtxXgy2c5hSbtCRzsshsX6lXITKOi7DWhvpNaV97cqz9k/8Vh
         bjJPGMD9Zf9uB6G1visS9DJnzqzDssGxCRWgvvZ7fW+4UDLJFsheV7bEDXiXX1XdEzXQ
         soMP4S002fDKBmr/L1ECNiiSf8C7dzGHDW26nMv9yY6u+te9kH1Llc1oXad5v1xOUuwU
         k/3Q7iNR6JMhMMLC7SZuDxKXKRHU7G1cNe1/MNTH70/E6bj750rT2otbkKk+m2iz+Mw/
         aM5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777096497; x=1777701297; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/aN4UOXNorEdOJTQLBm9l3QjjGvfNCLclM/Ezza1PpA=;
        b=T4fiWYHDoWokA06GId5qXVOxa/VdVCZr9WH3oQin2nmwOrrvRr2rcvEWGbbpyFWe50
         P2j6LPmxTQW0J+ctQFniHyWV3iMzPYyBvw1JiFTm1pLaEuvRhEusf6CrJ2JJtjOdVl4g
         165IuAKDbkCy8kORxbkN+0DWETOV5fpwzaXE8SdaKzREpX84RyzRrHRYI8XgMWp8idsz
         C82sLOz4SCt4XUxBfya17wlSjAu/LoSwUEvHz21JpePOhWqUUtg6Y7SmD6DwDQ39Vzno
         I4Tar2Y87+g4VZKPQJVcJkHNhG5+HMwdFK8+dXcUi8KifMnIh3iZcao5rUSpCujj1w1H
         0hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777096497; x=1777701297;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aN4UOXNorEdOJTQLBm9l3QjjGvfNCLclM/Ezza1PpA=;
        b=e9ap1b7P8RmY5e7kL0ekhYTsqVwRjxcDTXKWRGwWg1ZOpGOV2zHSsfmLjoEOyO9sra
         vy3EHkk70SBQDorIe6sS7CBM3eclEZPOt6b2dUSUw+fmiPdHvuEd8K8XDGf5LNq4Ezsa
         7TPVe/s2bHZuTxfCaYI15J1XwxefCyeXG6+sO/gn6goQcTFCIPVORs2aVDCaEdhyPZt7
         2MiynUutZThE4Hekbe2I9fkH4w/CTyuxyGA4B2GUVDP0yucdavNDTj2nZI4ukhLdQg/q
         3D+5FJenXSDGXIb6bIECA3buT1d8KL672DajLm1vMNDKizWFbclCBr95hmuyes6wA5Xq
         cr8Q==
X-Gm-Message-State: AOJu0YxbCqhEZv02sci+dEOd0+Fqza9k+AguOeezsmq7DYYg8oaYfoxR
	Tt1YMgO6g3M6WozsEvmpOXeVSkNu0QHnzeWdIF8LlG/JQv8GpsW/RG4diUf4da0mKcO1bQOw/OR
	3aXPKQ8YGX+DJeWEMuldDjsFr1a1YAA0YCsDhtQnKbTsLAosXrUL8UlnwNFEibNn5vK1h5oQEA6
	k8vGyfND9to6A1bcEEjJfgomdwLRuJAT+TYOJE1QNx+jfe7XV3TZu0xcJy4aGUUDtVMoGKfQ==
X-Gm-Gg: AeBDievtLGnoBr3srpJy8ai7xaaNBO+hUhFEPgHx5yUIw9TgOY+8W7o4uY3KIsucDHD
	HLhAV/UpRR19O460jJFi2Yp7tBqhq/QgM3CLXXSC+XuKgBC8zxi2RpLGshc3FPebMnotaVx5D/U
	RQ8WLzJPOGS5JxZn/rUuOgODpxFoKybBz3QDEJMoloKUuJAMtT75m1bQdb9vB2FgzxEsv3IB29a
	Dg6WNgHC6SePzc=
X-Received: by 2002:a05:620a:4803:b0:8d7:2745:6459 with SMTP id af79cd13be357-8e791b8d51bmr5148787385a.38.1777096497184;
        Fri, 24 Apr 2026 22:54:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4803:b0:8d7:2745:6459 with SMTP id
 af79cd13be357-8e791b8d51bmr5148786285a.38.1777096496698; Fri, 24 Apr 2026
 22:54:56 -0700 (PDT)
MIME-Version: 1.0
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 13:54:43 +0800
X-Gm-Features: AQROBzCMO9MEYpJhEn2_VtbtswpLQ3W07UZDAwtPW5ppLT2f-FrZiq8-lPAeceQ
Message-ID: <CA+s=J=zJDzB96XxUky09RYP6sXubcYmesi8GKSQkr6DpaGhsVg@mail.gmail.com>
Subject: Call for whinlatter patches before final release
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ec5731 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=eZ6GB9mBn6ak2vLqPeAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KNhexV1uaBTAyxWqV-pLoF6j3Q4wQQyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA1NCBTYWx0ZWRfX733Yzf+9vDD1
 yBF6RT02fhN5QypcMuUhG25FXRcCogtumhC02vlbDjRgxb6NyYl+bOKCJKb3ozeKPsxqyyUWWvL
 FX5cYv3eVh/sRgg9zFKnWDDT2uwCGFPo/Z4+rcBYUGbcdR6vo+TVMxacmXxJzoK7WACmbR7wzgs
 Yi/BCkY/jJHJPTeFhHFMB2IJcmlNkAy/Ind7g6h/ZlIX7dpU4ZmeHRwVUAL5bHzdybXQTHcXhbW
 06s8rTSnry4Lt0g3fGeYk4Q+k1sUoE/JzHxhiY96/fC2NWvM6qKCO1ZkUt+FGmY00RKG8irw1tS
 hcOOp5Xiz0OYgxuruP06HrSjvlr7VFqRLXIO4iLIvKL3NT6hC+4yO/ajPfF3sCL6pQGXBKGmwUZ
 3IuqUfexSPJhuagEa4caYDzcOqcQKGqMnjvA1I9a5QXtTInWqPkza8MWQNj54ek2JPtqAa0vQGc
 GMRxQ0Dw0p7B9k9GKzQ==
X-Proofpoint-ORIG-GUID: KNhexV1uaBTAyxWqV-pLoF6j3Q4wQQyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 05:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126612

Hello

The last YP release for whinlatter branch is scheduled to be released
in first week of May. Please send any meta-openembedded patches for
whinlatter by 5 May for inclusion in the next and last merge request
for this branch.

Thanks,

Anuj

