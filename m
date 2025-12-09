Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BAED3B7E2
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 01:39:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9764.1765244376370453021
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 17:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=F6/3BUs1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IO/PIGGb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NX0ja2042877
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 01:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfAzcSQRgKvdxxnGoAw8Q23Dq+4zGFQool0RQogyito=; b=F6/3BUs1nhxI5WFW
	L/HsWBLdEWBOcdmxdpKD7wojUfU0jbr9byz1IcQfL8gkOKsxekXVw8HrPhsex8EY
	EXjJy+X2bXRRl88FmMlNP7ZgqInJkpB6404uQOjhkLmUwsVvBHuf4ZeZCpmnsyhj
	e5M+WbDDEUI6bTXw8CEjCuHWduGRW1WFs+3r+fs1Gcsu8SLXTcHE/izepp+b4AKV
	vJb8XU1GJ+GV8BSfLkqG0HR6RHcIr7wFSFstHZiJmQ2yTMI/9tRGZofV3xOWZPdv
	UCkzjCK8UIzbuhlYy/0UXPt2hIjG194aATWBye+vmm7h7fQLVcVjeM3UFFmjvUHs
	rW+vuA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwgmja16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 01:39:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882380beb27so82034546d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 17:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765244374; x=1765849174; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfAzcSQRgKvdxxnGoAw8Q23Dq+4zGFQool0RQogyito=;
        b=IO/PIGGbGei5Vwdo31Hj5mKZcn+oCAP+vlt1lOiMOq42/YNhYVn0PrcLR58BoyFH2Z
         mnSxUH6rbt4fG+4nGlC9bOug9AhEaEFf82nc2GGOJgt9ni4iicznXvNIm8NnlZSsaCSP
         n51WoM/NBQ4V8YKMgsjOCgmJx06LU5pBQDR/VbzSHBcveIU6nS8mywqNc0TvHpn9KX1n
         D/9EkjW1XeVTwD6eOZQ1ECkDG5y4b73JHqKvrw0S6Cg1w2kBHqrO+rrMT/BvYPZ2Xx7X
         /ElTtg+wMOumROsOOWjjuVDCD5zHWcYvyPWHBkxhbImn+/C05CU+HqtVLtgl+qa/fsX5
         ekVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765244374; x=1765849174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cfAzcSQRgKvdxxnGoAw8Q23Dq+4zGFQool0RQogyito=;
        b=X9c7qGMYg7rzYIQfTQmoQQx7UtdldnSeJKG2xGuVmohKpxIyWMb1OLJPX2WQZRaMN4
         JfbTa0cLCqPRGXFSZfkot9UR5NMPY4+Q9TsNDZj5slG6Xc4BRPBHhoCarBZaQLC6MZ5R
         8GCscLDZ5d1dJaF69kNmRUIM0m/4Mx741a7YpTQxV/kZhgCRCAYXHqyx+YchWPgxafbW
         /3UwYsIyH5wlxADGmOALS6tnkkQGS7Orw4lsIdIGxnCiHa/KipjbtsVty+CJHQzy7xi7
         J+rnpKPcgh8XopWWslpevK2EnPLkvWbI9Hl0rfQznTb7jPZB2dz2guPYz0WjVWy4G26x
         gZhA==
X-Gm-Message-State: AOJu0YzZHaIpQ+cZc8ZvPpoITsZtRDl0wqTy8SaRrOMZqHRZQnj23OOL
	QzbqaCGNR+zmAo9YCfF4Wcgwra7hBeCDL842wd9udPNkpKt7KvCP0ADoNUjaKtAJPfqfKN8WIqu
	pH0Z+x82Ze/F0juTtfeWqtN9YplMTWMS6ux3BTNmSf4DfRZhX7gmm8TYJAb3NNE4E3GxtQuopF2
	+VQpv6qGuztNuyaVlJCjp7MqNpLqapIfn9mbjWQyCBo4sAQ11ojfSF/0+a9dj+AlShi8Wr+A==
X-Gm-Gg: ASbGncvUElq+L4mc1TIc3397k5BvKO/EfeJnP21cFPXDvbXIrAUVGxXbxfTpWmsTVjw
	IhMoySRyfTvNmNyqI05HvQCT+FJdNyJ33t/Y8vQpUh6NvdqOb83/HpCRQw+thL8cBC2maFbP/7k
	xohvxDz0cc5yYo+MRNijQaod/zLvihi+3l4Sl/m0pSR5xcHJqM6HjUmvCZZo88+tW7
X-Received: by 2002:a05:6214:4509:b0:87d:fbe9:9566 with SMTP id 6a1803df08f44-8883db1bd75mr157681746d6.26.1765244374544;
        Mon, 08 Dec 2025 17:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgIr302uCp5QrlJsPjX1ZK0ttMqz0LsaSoWxqOyukNuDytIF9GArEt1Xu/llo5iM2K2eNF1nCdRJqciWTIdh0=
X-Received: by 2002:a05:6214:4509:b0:87d:fbe9:9566 with SMTP id
 6a1803df08f44-8883db1bd75mr157681576d6.26.1765244374072; Mon, 08 Dec 2025
 17:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20251205131055.914442-1-hprajapati@mvista.com>
In-Reply-To: <20251205131055.914442-1-hprajapati@mvista.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 09:39:22 +0800
X-Gm-Features: AQt7F2o_Dizr0lfU2MacLvumtXtx9yqdoYFK9qf11-0Bp0VFruovmiC_mp_6vhA
Message-ID: <CA+s=J=xKZbRtXLZoVd0fP_sptm4Sy3t2Cr9=L_rvk7LT7H9-MA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] wireshark: fix CVE-2025-13499
To: hprajapati@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RtnI7SmK c=1 sm=1 tr=0 ts=69377dd7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=Q4-j1AaZAAAA:8
 a=fk1lIlRQAAAA:8 a=DeT0V5R5AAAA:8 a=WVaKMTlCsui4pEwVslAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=U75ogvRika4pmaD_UPO0:22
 a=7g2GB7p3St_J2OizA_tR:22
X-Proofpoint-ORIG-GUID: BaZtylpfsBBvUPDhIkk3vAG78_U4KWn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAwOSBTYWx0ZWRfX6iV0zwYirZDF
 ROXR/2xiJ7eAYfxwoW41BTV2nGHG7IW7tqi1a61xRGjwgJoN7lXPTeRry584G3MDGTzvx+vc5NL
 zeUdK6NvWbmiPhB5wH3BNgl9QMXhYiRE5H3/q63/SPgdpkOCmc2E7N3p2WRHj88tUbfT9hEou3d
 l3ZQyWeT7k1J3uM9o9pzYReFm8qQGwFEtZWszCqNU8cWnKnFf2cKeVSoGm8EMvSOPDh6sAsqTDm
 Ilf4+/7V167+YGkI+KeZrkLixHz0MLXacaGgF7m6ulUVM+zjIJk8HY2GItO8i2wwo8n3udp86km
 J+1julA+wTDlDQELUco5TxHjIuY9SkrvSPfMNtNkYyGPwN34gMJj81IuhVZl4MEaEYk9wF7HdkA
 OCqbmLN8yAWK7gv80QKhR2Y6dEotPg==
X-Proofpoint-GUID: BaZtylpfsBBvUPDhIkk3vAG78_U4KWn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 01:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122392

On Fri, Dec 5, 2025 at 9:11=E2=80=AFPM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/c=
ommit/e180152d3dae668249f78c72a55a4ba436b57af7
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../wireshark/files/CVE-2025-13499.patch      | 45 +++++++++++++++++++
>  .../wireshark/wireshark_4.2.12.bb             |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2=
025-13499.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-134=
99.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.p=
atch
> new file mode 100644
> index 0000000000..b713cea8c4
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patc=
h
> @@ -0,0 +1,45 @@
> +From e180152d3dae668249f78c72a55a4ba436b57af7 Mon Sep 17 00:00:00 2001
> +From: Darius Davis <darius-wireshark@free-range.com.au>
> +Date: Sat, 25 Oct 2025 15:01:34 +1000
> +Subject: [PATCH] Kafka: Fix decompress_snappy with no xerial chunks.
> +
> +Instead of returning true without setting outputs, report a failure to
> +decompress and return false to the caller.
> +
> +Fix #20823
> +
> +(cherry picked from commit 49137f8ce93c9f7ac55b69c8e089ba6a422f633e)
> +
> +CVE-2025-13499
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/comm=
it/e180152d3dae668249f78c72a55a4ba436b57af7]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + epan/dissectors/packet-kafka.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/epan/dissectors/packet-kafka.c b/epan/dissectors/packet-kaf=
ka.c
> +index 482a670..e537013 100644
> +--- a/epan/dissectors/packet-kafka.c
> ++++ b/epan/dissectors/packet-kafka.c
> +@@ -1788,6 +1788,7 @@ decompress_snappy(tvbuff_t *tvb, packet_info *pinf=
o, int offset, guint32 length,
> +             count++;
> +             DISSECTOR_ASSERT_HINT(count < MAX_LOOP_ITERATIONS, "MAX_LOO=
P_ITERATIONS exceeded");
> +         }
> ++        ret =3D composite_tvb !=3D NULL;
> +
> +     } else {
> +
> +@@ -1810,9 +1811,8 @@ decompress_snappy(tvbuff_t *tvb, packet_info *pinf=
o, int offset, guint32 length,
> +
> +         *decompressed_tvb =3D tvb_new_child_real_data(tvb, decompressed=
_buffer, (guint)out_size, (gint)out_size);
> +         *decompressed_offset =3D 0;
> +-
> ++      ret =3D TRUE;
> +     }
> +-    ret =3D TRUE;
> + end:
> +     if (composite_tvb) {
> +         tvb_composite_finalize(composite_tvb);
> +--
> +2.50.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.b=
b b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
> index ab6160b767..ed488a3555 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb

scarthgap currently has 4.2.14 so this does not apply. If the CVE is
still applicable, please rebase and test and send again.

Thanks,

Anuj

