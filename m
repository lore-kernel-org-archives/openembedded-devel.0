Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470F3C88E72
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 01:29:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13746.1789435782540343731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 18:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=S85ZXdGn;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ivPUOPp0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN0U5H1915769
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EUNGMY5klp2XM+qNWhvWGwOLTEtP4E69bqaF995tPo=; b=S85ZXdGntqfauajt
	uysyzF8IzD3qZJu5fc4uiv2b2Id7srJ8Z4CYIwnORt8pWaX2nnAas/r+NfnU5WMu
	5kwmQTipCsSTW6oNqwhS22Xq1jxsj+nJefw2fgRhQGycsKmULrL5GZjFcCKnoYhs
	FXo8VJEflcQ61waYwvtLWQXe5sw73T/DRD190XHJ7cEtq96Uf2J3x8KMvEiqspr6
	VZT+9MvK4lGtTElLB0nufr+S2jPRzYcFlX3zS8tHf2bLsTBtIb8+EsCJmEhfr+wi
	KWj/4z0jZHYYWfqPEnX2sgaDn6rlcJgPQFXk3TFafV2W14SGZO+u5mdpObuJv2S3
	ZtiKVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2ku2np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:29:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91054f537f9so11879146d6.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 18:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789435780; cv=none;
        d=google.com; s=arc-20260327;
        b=mt4GMaLyn/LdHDhizc2e6+zey21lN9K/J2mOlfUZvRveWUcPd7pjw6wzHnknFaY18O
         faMDM1N6dcodRZrL4UfoH8rGRDicS9IN6j4H9WmAAZYZ9R3BW9VJtugCWSVQBDxzBXry
         6owbNg5ksy4pPWawzufl0aFbmHUDi8bKXeIRAiMUJgwAtFfRoKdyL/5l0/BfUGrEskbx
         KF9wfuIQD+wltApOlaetaXlGa+s84i0oFpuOr0HSK7UBe5YObTUph8x2A+9mw4OHnsp/
         TFdUZX3pTZL8XR9Y+mSloFEgA+aocYHp4YARNSn8Ygjy1RGlbI32VYkAB/cUnd3U0Iwl
         Dpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EUNGMY5klp2XM+qNWhvWGwOLTEtP4E69bqaF995tPo=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=inG7S/EjsQ+3anz93V6dIuGkr3mR52usgJdTQepr7xBPa3ZlhEvyXZB9NKkQv6V2OF
         whYkdsOspSrY16qddDRdvWW+OZb0TOOTXLOdo/vvei6p1KGEkJXxu7v61sX1mhEDFV0A
         OP2j9so8lkovMzszc6lm27rPPfXiHK3bX6grVf7cRYwASKfHHQQIUGdvvPx5LX+7PV9u
         4WLZPxyJPNuqPV/0rSRiVfT3Hdy+2zee5jZYpmpyKQBcUyXCE5jYLsqvfuv6X8xgyEgj
         HCRYEceJg4lUBkhI9kOSDcEJYS7XoBTYf8OEdqKWq+0bFHlwISZVVj9h5r3XxgmBh1t/
         vKKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789435780; x=1790040580; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EUNGMY5klp2XM+qNWhvWGwOLTEtP4E69bqaF995tPo=;
        b=ivPUOPp0rkmYQKBhFyguTxZrt/JOUyRvJyKMXfeZgxLzclsrzGLrMRQZhfDzmnlmUH
         bCfeFEZLnh0rFnoRXq0AGngYYRCkVjDDlJU6OOWwPQMG4VocZ23GWwgb/FVv0jj4ieCD
         FJbZWoV7j97uDJCOxTgElOHwWLqA2Xqc4rMRGA2bnfYAGE79sBhAJWuj+CghJBA7+Lsz
         sGCXwmUSzfJno8sIX4FzlubECR+a0Nd6LUPcBzB1fsL5miYCXWkyXDWMD54oAJtVMxzM
         LoOKOzKczKUfeu2cBb/85Ewh4RTRKdSatLuOiZmP9D7nTKaNrYNT+OLbDPlT5UtAn4CW
         Et+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435780; x=1790040580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EUNGMY5klp2XM+qNWhvWGwOLTEtP4E69bqaF995tPo=;
        b=HBVv6cTekzWdAbKCZPnCjt8KLUqy5F/ZBmmuL4fJJw+uL2fSIFc+zz1pJ1oK2RtfmX
         WPT39El3Ure6pOJMjywi6xbkNaBmXEdRZG2W9S7CbSRJdjJtnOB9t/qsmuWmbpidr5SQ
         gR9sMA0llpY/Pcg9TKFSYaGBuqTrIoaLIymCmbwaZLNEo45TpyMApPjRGt7ZvvIG4nA+
         UU+jSMFW35cZ1SnlGSSwiBnKRo1a4muImFIXMrGJOmZYOJCLNw7NYeByBvvA0BQHy4EB
         dt8F9Ga+0peBZ9q7CnAXAX8fMye473pZ2LY7Hdcck5H5tPi4pbn0NQyGUzYKn34zZfgh
         rRKw==
X-Gm-Message-State: AFuF++mKBWMPd6gaXdTJsTlMA4ezbWpQMtcI0tF/VCvob/tLI9itLaiZ
	zMpJG7P/4HeRo1RVmy5fdyUXCeJFd5bPTH6MbsR5zHFbs3MKFeeuaFNvHZb77UbiJ2j2+Yg/Ukj
	lpDj0t7oBwYsv5MaW1HabRcpTb2FbVS2msygLIFENJHOZai5nLMf7bxzHFa1BaP9Z0vxvRI1oi+
	t9uCOz5Jd0hygHSd3eqSZtA1gx+ULWUVToVQhtV2HmuWQoUJZF53jzB2K3680=
X-Gm-Gg: AYBFou0Go0sk/QWXRpuSCv9zYMxUDpIPnqKGKCrZuX1WTpL3D6Htj/MVqOnsGUN6TyN
	S/PNlWe/paQAAHxzfw1iGzVuXIKGIPLbiHtsHaInfbiUs3VOXQznzWbobdulPKKagaEfmsSUOZi
	acvOHoTBN7TU5wLuBmEXcFx6hrRrfExmeULTPZmYet/AjGPXlDqLepQfpqfw==
X-Received: by 2002:a05:6214:4c91:b0:911:9375:905e with SMTP id 6a1803df08f44-912341774admr24934216d6.0.1789435779777;
        Mon, 14 Sep 2026 18:29:39 -0700 (PDT)
X-Received: by 2002:a05:6214:4c91:b0:911:9375:905e with SMTP id
 6a1803df08f44-912341774admr24932186d6.0.1789435774611; Mon, 14 Sep 2026
 18:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com> <20260907102318.2459883-5-ankur.tyagi85@gmail.com>
In-Reply-To: <20260907102318.2459883-5-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:29:31 +0800
X-Gm-Features: AcwNN1UCdcJs-ykdpIOKtONonSB92JmClygjTrkUgFMOmVNE2VV1KaXoRcdWTrs
Message-ID: <CA+s=J=zsKdTwRRPvzsBHT3eNUz8tGpr8yfcuNY1qNMP=bKTM7w@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 5/33] libssh: ignore CVE-2025-59842
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NUZy0v0sDnF0gKVbIQB_u-kOsS94zihJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxOCBTYWx0ZWRfX66qSnK1YthGR
 DHzG2eYlXiwIfDs3WLcj5tj6wicN+vytGRv3MSUNhbLx6h0EIsf+K9XIJaHOxUHvfvnvxamUV8s
 qF7fvttsCWYfwfO4tTz0Iv80c/nyfkgt8km/lIv0GLBV40YDnENrFoN14j3KuKohKN+ESAfoWFw
 4XIF/kBsFshZv/jZaSd2nBE2ZI6AGaLX3s0ifxt1bCFzTCPn3FbsAF9w8gZcY3VSgflGdGeH6QM
 RVKk1hxckDvscQQafqz2DurGfrp5H+9FksGTRHpjFhyFheNA1vwmRoxhy44Ih9oQJaNkvIf+XK/
 sEGYw7Lu0YoEHlUcPFhkqo7llAcXjQtLZ0V1m7g6U/bYi+X/M86qES/mGIFAOFhmLszxT61jzT+
 9rjIYKi+QS77TtZVqomAsRDwnGV8jRwUaf4AaOj//kM9PFPedX5cUw5E3sEP677IujFSpOJYZty
 9y7gktGJVHtZDqIS+oA==
X-Proofpoint-GUID: NUZy0v0sDnF0gKVbIQB_u-kOsS94zihJ
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa89f85 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=nar8ntqeAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=ilwidJx2MvvpZGti2vwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=RptMqvEBejqe73AKBt4K:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxOCBTYWx0ZWRfX3TqS4B4CGXpH
 7L8o9YofMWjVCgYC9mUzU+aYdUri6dnsYI1UZxiimbzzXV3+lC8Ad7hUMTUHzTAbGeEtJwM6Gzm
 1/y+WzfCskMAxpFlNyS9PQA0dtujsFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130027

On Mon, Sep 7, 2026 at 6:24=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> The vulnerability exists in GSSAPI key exchange introduced in v0.12.0[1]
> Also confirmed by libssh security advisory[2]
>
> Details:
> https://nvd.nist.gov/vuln/detail/cve-2026-59842
>
> [1]https://gitlab.com/libssh/libssh-mirror/-/commit/88c2ea6752fab7b3da9cc=
4c51eaf632361a44080
> [2]https://www.libssh.org/security/advisories/CVE-2026-59842.txt
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.11.5.bb
> index 752bded528..5cc270477e 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
> @@ -58,3 +58,4 @@ CVE_STATUS[CVE-2026-59847] =3D "fixed-version: fixed in=
 v0.11.5"
>  CVE_STATUS[CVE-2026-59848] =3D "fixed-version: fixed in v0.11.5"
>  CVE_STATUS[CVE-2026-59849] =3D "fixed-version: fixed in v0.11.5"
>  CVE_STATUS[CVE-2026-59850] =3D "fixed-version: fixed in v0.11.5"
> +CVE_STATUS[CVE-2025-59842] =3D "cpe-incorrect: the current version (0.11=
.5) is not affected"

Should this be CVE-2026-59842?

Thanks,

Anuj

