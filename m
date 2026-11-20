Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4444.1795175881137603926
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YjvbL7ki;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Zv8MlV5i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKBobk31203420
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 11:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qO2dmA+DuJ0cQZ5Pz/jZisTFTSBsZP6Zw/nZ/HqKX/g=; b=YjvbL7kidZm47hzv
	SRB92cdbA5gW94ZhtkhdpG1JmQJDYyhh4k9kZBi19uOU+dDd/7JRStP4uhmgndV5
	iTyqJFWhvvp2LiCzkLhms0zdzs3jc1YKNMr/UTgHIl6DyY4TOoG8x9qO3es6U3fl
	8zCHB/MxIbtC3ShZwUk0Z4Fdiu8IHanE3TSmjQalutSEzDVrdApgI902SIQ3K8sL
	56jIiFVGdky4Uaw/Hgv9+jV6wJEtPRIUzWdLWXxS80Kb51NMElrVsSBjA1n+bXSH
	CfolwTbCiVpMNMtAnnYCHwUdaxrPGLJFGB31+djfnPaZN4j5jxO+qZJl9zGXeSmK
	7bEFGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykgsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 11:57:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso143540185a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:57:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795175879; cv=none;
        d=google.com; s=arc-20260327;
        b=qibjLgC4MWKZ5OldFmBiyZNi9kzMYKeEarn5YiDZ4MmQ2cR52i6JcKEU4AVU595LR7
         CAoCfVKPfd42Sl/RpAk264EO/h2HMjVnpD8n/F9FZuZ2kwdRHQMj+feeI9sYEQl/vHoE
         u5VdsqgX3lYQ/1eIKEXeakEEj37u1dAsG1N6dq3RgM2y/s3tGFFUSg12/pe//+/84xi7
         f6UNkMHl+BhOAdtYFV1ca8xiCkyxqq4xL6Nm4TEeOP2T5aWnzdmz/U7umC57sUDBA8T7
         xY3eLfM/5XX5yOYq4UT+IAwS74Xg3Cr5Sp3iPDgzoApRTlXxkg/b0XW6kqpY6jLUl5HT
         nePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qO2dmA+DuJ0cQZ5Pz/jZisTFTSBsZP6Zw/nZ/HqKX/g=;
        fh=EqFFGVnRn0qz4znwnmk0n+hFhLaJvAVW0pujP36Ql9U=;
        b=QTDf8uzZx0Hran6/QVktm8f1eDNsFSqxkcY7uefL+WHVWN8uUcR6M/eP0pvhU4CZ68
         YkxtJuuzKkPfOMO68C0Okvqlzf9JmGk6arCreLE+C7kNH950fom0z4QuQDK55NB9YNvK
         DA7CXwcmtBmWPYtN2o2wnHh1Tqf9IDdLmsBEgBTxj+NDUA9LCi+Nv8CcMmTPnithidWQ
         GwCCEM2wykjom/JI9RdAkAl0mPNTbZuYkJT8OTTlhp/yhSfCdiZemGSL7oLxU1v+I4RI
         pF4PHI+zbTuYDRyasocY7QIc4drCFtc6eJNv8+pCW8adUX3P3KZyRygTjtt0KkVIOdE9
         5RsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795175879; x=1795780679; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qO2dmA+DuJ0cQZ5Pz/jZisTFTSBsZP6Zw/nZ/HqKX/g=;
        b=Zv8MlV5iUQ5SO1EyiZaOTnh56iE408TQZEMrts4mw3ME1kkuRUlRx7O8SLX5+ObGHd
         LwqAEcmjheDixCSDrniDwkLSnkgJ3oj+E8h9hXJJR47fE37W89dg0HccJGEslVqOhgAr
         QcfzC1wtUWmYWx4Lz4qeb04ATOGBewhvCc42k2mz9zGWEQX0wnyZlfgiW6BYfFMuBBIp
         oASIteujWx7ekfkJnLMB+9J5En4NcH9rLlGmXKpTvROIKKOBCuxUesgPHlnn+Q7VYegv
         A4D5yWIOm7i2yzFaC69OTWjwVoVjiYsrW0Z9Llgw4oqCr7+gnbzTTC/pW0w9Txhqr816
         1llQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175879; x=1795780679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qO2dmA+DuJ0cQZ5Pz/jZisTFTSBsZP6Zw/nZ/HqKX/g=;
        b=DY8YxzweiYd3kDHIL4oSh1rwx9he0cezCGbb2S3mGF0FKhwJ4lrGKdWWjVtxSDuGFZ
         /z6zJCJNZ1kRKJ0VPDJqJ3nCMDdR56fnwkv/Ub5heCp98uAL0S+LlIjin00Xj7sVjV4V
         zatHvvtuOJYDursBBVk0HFjZa5fwMj6+Wn3WF6vq0m87rFkFu952QXKsSUU0b6s5LjFB
         PhwgdyOjH3cCuY5I+REPlVyKZ8cFOAksKprHQPfxD+NSO6mPYFT82giAK7M9UxWSXVIE
         iC6Gb9TFMcTYm6ZKXF68FNLZGyz6uYk3oJYbYveQypX/k+ryMtNuIs+e7W01P6yPChRt
         Cmtw==
X-Gm-Message-State: APuU4Z+SUQnvkt72Fk+LrK1MzsudqDovu63vpExxJkU2FDwu9guag5y9
	LiQHNNy1o07ctXESqUZ8hw8FCwODNu1p9HywNMGKoVzCzz2ywJ5QZfzaGPvWhiB0Y7e33BkNj77
	Cq20RF2RI1qz2pIJe17I4n86ZndjavJ8Z3WkxTJcDNU7k9M4Kf8R3B4NJTpx/Dzj1InpKLeP55y
	5vsdPMgUp9ayGw/Hih+TRf/3Rg9H5+DwkU93giiznGYrxs+eVjAdjdq/pVLKs=
X-Gm-Gg: AYBFou0F7YLtbRMDUDGqKiGsc1SjpCaqXTnkr1GUoQ8GJ/AHXdm1hw6ngoibnI3J8do
	4/v1/1Z12hZw2YjTXcDuutpl0jih5S1wUrsPSyBnZGW/i2e6KXtBbBiINn1p3/CPbXXuwwpDoA/
	nBhXBrQ9Z9umKbK6MMswLk85nwD7F+V+dXDIrqZ4C23BSn5nixJZn5KO19zg==
X-Received: by 2002:a05:620a:2856:b0:949:7dcb:c7af with SMTP id af79cd13be357-949bab3d89bmr443814185a.64.1795175879106;
        Fri, 20 Nov 2026 03:57:59 -0800 (PST)
X-Received: by 2002:a05:620a:2856:b0:949:7dcb:c7af with SMTP id
 af79cd13be357-949bab3d89bmr443811285a.64.1795175878574; Fri, 20 Nov 2026
 03:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20261105232905.3707642-1-peter.marko@siemens.com>
In-Reply-To: <20261105232905.3707642-1-peter.marko@siemens.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:57:46 +0800
X-Gm-Features: Aa3M54rsWsik_zJtXMQdQ5rVZZjo0BuykIXtFSXBVvlUR7ruZ5Mer2aGsY36f9k
Message-ID: <CA+s=J=yawZOL4Tiz8dXMerA-RPFyKmPC7AthRmsdVa_3TMnjCw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/4] nss: patch CVE-2024-11704
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NyBTYWx0ZWRfX9AQ7aJuXlwFW
 gqqv40yBNILPK0Yw5cSkoJbSz2Ht+Q53FzNELBZ5GrP2JKrFJfcondR5tAVYCmdBqHRbOoMlyc6
 J1w/XZwcfcq1TJpp9h01iUVb2Cv3ZiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NyBTYWx0ZWRfX5JL38bFRjthh
 D++tW0cE1CN3FBFf+cDTCDToxTh7OsZQdDz3fHsXouRkheJkaPsPNnEhcHvs5C7HJJaxtiYyJd6
 /gHVYDj0ELiKCABcnL4ry+ZlDDkW82frCk0n/ORmxM7sGn4AuWmmsD8tlB3QQttpGNDV33skCkO
 Bk1xghnQnS1CdBKjDskhukgc6Un8jK8p44NzZxTNloytMj95Lph1jb3DI/+FVdA6LbcMa5w6ACS
 X7d3+nqFuGiFiipAYNq6oIJRhJV+T4AtoElqBrfoBUYxLKWUWhFUfl/e7cuA3IMnc+GrFdN1To0
 eXqVEw7WBtnxEMb8OjSBFdEpJUh5BSnKSAXBUswTyl23QNw1eaj8DMqbtaaxTVyiITu4ME3aKnL
 RXitIgkZUeAr0PLBoU/LrnD37EcHglqXfLVB7Dyklauar+8/VPStKdujlFcpZh6v5NFGADa71wy
 NYqQgvKMMbEZi7GdHDA==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b0035c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pQs5aej7AAAA:8 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8
 a=r-7uX5RquuaOu8Gzr_IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: hihOCMEFUrbQ3JOyYbYcinonyTnzgsUY
X-Proofpoint-GUID: hihOCMEFUrbQ3JOyYbYcinonyTnzgsUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 11:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132771

On Fri, Nov 6, 2026 at 7:29=E2=80=AFAM Peter Marko via openembedded-devel
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch referencing [1].
>
> [1] https://bugzilla.mozilla.org/show_bug.cgi?id=3D1899402
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../images/meta-networking-image-ptest.bb     |  2 +-
>  .../nss/nss/CVE-2024-11704.patch              | 30 +++++++++++++++++++
>  meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
>  3 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11704.patch
>
> diff --git a/meta-networking/recipes-core/images/meta-networking-image-pt=
est.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
> index b6238d61003..874af9c6bda 100644
> --- a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
> +++ b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
> @@ -33,7 +33,7 @@ QB_MEM:virtclass-mcextend-nftables =3D "-m 2048"
>  TEST_SUITES =3D "ping ssh parselogs ptest"
>
>  # Sadly at the moment the full set of ptests is not robust enough and sp=
oradically fails in random places
> -PTEST_EXPECT_FAILURE =3D "1"
> +#PTEST_EXPECT_FAILURE =3D "1"

Why was this done?

Thanks,

Anuj
