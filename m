Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4570.1794448282550259616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 17:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DM2zpzkj;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JnXifQWq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaAbl3642995
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FnGeZcVxb3HJ9rOrVct4t6AOLviqRXW71ZUPSgDUYow=; b=DM2zpzkjxFe8plqq
	1uEd9mq3g+GDJrkxLnFFN6AXDBy4a6Zc1kvHCvhD220QEYZwN3EOTN6b2IaS6bB5
	wDwpFcs0zlmNfAHpM+eHLYIV1LiCkcuLnjapj84nIbkdEPsIv0r67qCnXnQGx5zZ
	izt8yf5p2eQmtozsme84Z/KXGqXqP+TDpBYfERfnvq52ZIYzDJV+Ul28K4iBW0h8
	vgeYqizmsXuJjZoX27XZsLzYPtG2/ebb0on1Wp638ZyjbP2De63kV9pUMEImn+JY
	agB/ZX2MIfyLh1mZ/9jAdcaX2qtqChAkjiinBIWGJYGaQnZPoutAFabRttF9hxTn
	r+K00g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc616nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:51:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb86c39250so2003244a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 17:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794448280; cv=none;
        d=google.com; s=arc-20260327;
        b=l/dLIicY+UhNN4/BCHILuA4tejbQW8JKmQ2N3hVYLyohOshKS26nefeIGnq9+r1Q9A
         vrArkB5Vj/Uin/t5RIHhPVwauGeEvqSPutiqDshdStFaUWYbeIjEA1VYc0u6UbshRGeF
         ncARgB/PRKjD2hOEKQSb69/E9xp/NvAxzRCtwgl3Wdjw0d3OsMcaguBouuAZUFCjY2kN
         p2zRKky/s5aMVrgZM8j5RJxPHQKwmBffbQNQQkDe3cFXvXOjE3hVa1dQIZjEOkCx2Avk
         FHXI//NFOItwaqbSd4HqO8+YTNXMt7uyRtVnM0VfSRHvkeOKeOcR4HTYpjkQ+LrXYXFc
         zypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FnGeZcVxb3HJ9rOrVct4t6AOLviqRXW71ZUPSgDUYow=;
        fh=9Jkbrr4zX62D6dxY+IPvVPpSqZS2pIRe28rb8c+VfGA=;
        b=W0hTY9i1YUZXkJS8sa4DP2OITpqRx2iMdzGoz2m/ltLIyDIJkxvlICsvBcvAxDCoqR
         LEXuJTHmNfN0t9P9WiR5IMLn7mO1hjRZLJQWNV7YPqUmcUHurpG1cDCn3BcBoAZWF4XB
         v2mlSYSRIw6cpE8RE4QsqWdEr3CPu2SdALCwf0LTrfTK+0c5QCJC5s1MB7nhCMjSz9xu
         REEezTCogwSerXLtWr8u3OA0CUI6t0KeXmRzY3zNqfDxYZOs+ljVN/CSDVHkgt+iA/UV
         gGlYYfWc+UmasgR66da2Efa5GkMAf5alRcnE9mut5Ahc4Bm6jsChvlRkHKvWWJ37ONGh
         CEIA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794448280; x=1795053080; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnGeZcVxb3HJ9rOrVct4t6AOLviqRXW71ZUPSgDUYow=;
        b=JnXifQWqXEZdZVTiXmGLqaasDTdvcTxl5Xp9GrZfKm6XQpU9ZDD4+7dA+VEkdDY4+4
         5n4zJB7w8Ev7BA/davqn1VReSAPmw3TFVX7wilQfKMyKLtY84sGM85P0rTsb/DYq4W+H
         epHIvGi7LwQXQ6EnBP922R/UiEs03SEKd3AAM0oe0zLv3iEs93131IHOYpsRCpHb1EgL
         oTEO4zl6duE6fIib8+Zokrgeg3GolUg8lgYM9RHMM3AhSAFVMR4F9HITtoUOMz1etu6X
         n8n5na2YwZBpRGqgJpk0E4wTLm0PYYJx86K5kYgKParYi3jAIpQ+HitCSl8d5TwEEn8d
         dOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448280; x=1795053080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnGeZcVxb3HJ9rOrVct4t6AOLviqRXW71ZUPSgDUYow=;
        b=MqMK/wR1dWYUQD1XkUFT1CkAIN+FtdnaIntRQ+jIVgJerZjYtiaJQhZmhaPjjgJTN7
         JiCIdjMRup0kp6+AXY+WBll5Ok8TNmMvUCaJAVHfzeB3XSHki+mR0U7r9R6jo4azHyGG
         mxGWodweXXwZGoA8GDW0SPxAvrgu2NeQCGCF9SJ0gCg+GMza91uygWLZ8XGtr1apIuGC
         DRf9ED2ZsssvsGHgxvoTGRa9yroaaGaKTf7oJVUcS3Ert3yb3Oi1IO9A/rka20QrlhOG
         4lk97+ABO/6QQ7y5wbOn21gWmilzlHf4Ubm2T2EwA6sj5ML7IFTRzrwcrSdVU9Xy3C4c
         qcDQ==
X-Gm-Message-State: APuU4Z+MYUE6LESAgH7NuN10DkthwZLV9twSyJc8UaPOB6BDQN4TYG8H
	nfAi9hEwLWxxXs+btfbCYfHswaV9l5dB9aztPUaiFh5h6IbLUumdCke9b/uvo7Dg+Vr3+YEOvbu
	lsgmfrgwtlJevj3/QcA6esCBwbKX+KT1DeUCyh5N3kTXOva2QNc99nCw8bbmHs/GarE1vA1lfWn
	2mvS0zTPGBN1ijUtB/u3Zf8a1lQFHQ++b4IpCCGpy7h2ygevwPQPONFKg2Llk=
X-Gm-Gg: AYBFou1iLM+qPLqKPtUsJi49ydHEFA4n3AS8Qekb8YmhDSZrAhNwS+WaWiqm1zcHeuk
	ma6btRf+C75+vzKvcJst195f7HJp5FiK5xu2XjVT8U/6qv7A9zft5rqoU+WABZnj7ebIkjnv1/e
	Sd5ydMRM6Amxl+Drxb4+IsFVMlaAokESD7mIsHqih6Q8/gp28jzeCweUcG/0k=
X-Received: by 2002:a05:6a21:a38d:b0:3e2:a9cc:3ecd with SMTP id adf61e73a8af0-3f2fb69d985mr3964862637.7.1794448280135;
        Wed, 11 Nov 2026 17:51:20 -0800 (PST)
X-Received: by 2002:a05:6a21:a38d:b0:3e2:a9cc:3ecd with SMTP id
 adf61e73a8af0-3f2fb69d985mr3964847637.7.1794448279659; Wed, 11 Nov 2026
 17:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20261112014818.3600049-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261112014818.3600049-1-khem.raj@oss.qualcomm.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:50:42 -0300
X-Gm-Features: AclHuK8nVWeogskswihGySsVQf5kqvmKfZXNO_3lvZRXUmtB2-g2W0svstmn-Gw
Message-ID: <CAA_5yovD=DJVr4eKwar_diDz+ALW-F8AxRy1HMoej1dE+pWH9A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] cpupower: Move cpufreq-bench into its own package
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: iIC3LGOUpjn302gGm9rBaf87r8qgaCwC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfXx/HUzRixKl+S
 IMUkU0j9CvBqP1F1LrtKX/b3o1rsBOe2XKrfGztDM7TI2fYtO+YhCRFfNISuWCClUNUIYmsQ3b0
 /aino4kH4xzgGA+hS9s8vd/2CcIp1Uayn1xzRUOMg2ercx72RGg4rzKDU630Il50rSlskApc1fI
 M/t+XrjhxTx5x2rqtG8SczXD6dz4Rca0FQYuf6zyxvBLPXhGd03SdicbXG39kRkpfy9Fxa1aUws
 9wTU3lWPgZNDgZJqE3DT1080Ft926rpFNe/XfRjDj/e3brm99V6TFzahbWU+0mZXdwdXPxt6DvW
 mJoPfaDvJnZuxIgnh8VoJU61BBMDt9HQjxVvXz0Nk+zvKS6q5tSQc0URhoTChtwQlSytQnmgAXW
 mGDPe7goQKw9TEn491b4gG8zUi17+xNj8Zrfl+4CSze0bebm5TGbR2I6szqckXQi+zugRUrzcg5
 ytd3TcCByde7Q/AoBnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfX6NNvapi9jzfh
 6H+XKbCSk9yzWwADXMR7X/5Rj0t/k+Z99cqKjhVDby1q4OaN1RmcrQCMX1BnpPOBByKRaAUjNva
 kY/QpxSWge5LmGFhS99bzGBrH3A8spM=
X-Proofpoint-GUID: iIC3LGOUpjn302gGm9rBaf87r8qgaCwC
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af51b99 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=4kP-vol4hbp8oYrAImgA:9
 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132145

Hi,

On Wed, Nov 11, 2026 at 10:48=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Only cpufreq-bench_plot.sh needs bash; the cpupower tool, library and
> the /usr/libexec/cpupower helper used by the systemd service are a
> binary and a POSIX sh script. Split cpufreq-bench, its plot script and
> config into ${PN}-bench and move the bash runtime dependency there, so
> installing cpupower no longer pulls in bash.

Just sent a similar one, which also changes the packagegroup, feel
free to pick any :-)

Thanks,

Ricardo
