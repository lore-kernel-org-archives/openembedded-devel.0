Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.747.1794204051907162593
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Mo2CeS04;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EMItgwp2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93JtCa042055
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CQCGP0gHcqP
	ThfWZVXPxDcdqwRWSR0Ao23MtGkhM/XM=; b=Mo2CeS04Piyw+f8It590NMIXzaQ
	7yb3j54NiC+SMHLj4tGK9Y0L3+LJUsCu3oSJzf6VEK7MvZY0Ldz7rtsesRHIrbKI
	+Sn4PDmfjDMKCNZ+cnm13K6BCXQ9gQdiRX1smBz6XLYOQUklK5uvZhLsgePL4uKO
	PQun5xCOcxAwrLq6pTl4BnCw+zkUpiW0MdDhj9AZ0/vgbpuGior1/OE9LGbuGXnp
	6wIFDb/pOXDj/ECWhXXwOA8AsT2iFwKL4WA15dQxg+40HaVlPkblTIdpu1JtUBOw
	9iSQLVf4JcfQGTPGSjQFh5kSytZ3Pb0VnQz5MA33tiFEdxp0eWyXtQ1YiUg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf573r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1224494eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204051; x=1794808851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CQCGP0gHcqPThfWZVXPxDcdqwRWSR0Ao23MtGkhM/XM=;
        b=EMItgwp2+D+aQQIto5HEbPWtVXBpJuaSwWufBtxMSn+hkbEkeny5yqb4mImow/VT6B
         bdTTMm4eA08pfPMrgmnp88LSPj/N+TJXsNxv7n9JfSkFOE/xu6w7zP/vXjXftfyy8HUa
         +Uw85MN4Mwi4eqKbU92k0ViJSwDURYvQ3GhkXSlVwuppuUNxWg8hogpD/FU9bNESxutt
         Ra1b9FQUCJ7c5r0ifd2++ksaQS33peZ/87/w4sV5QvnYcV8x/lHQOSF4kZTlIWyHiqIg
         LG1+1BIgauPF+6+bAFz65SpoZSYNrAX+v/L6ATpjadLpZvWVBih1y5Z/uqcYx7oOt81S
         yWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204051; x=1794808851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CQCGP0gHcqPThfWZVXPxDcdqwRWSR0Ao23MtGkhM/XM=;
        b=eqagnmCV/G8ywaG8GsBndmWYUw9sd3LUX4rMIrzJcMBBnxFacq+ISmngSprnGXeFo7
         mGVdYGERBaidBtRUU2j16QhmTBv/ktxzEJLjsSxufWXrKyQSd1c6/WvFwmzNHNwfEzR8
         BiqWw6vBzX1qYuIrylm9OWTlGUWw92YtdtRZnz2aq/IZEleIygiOqmInMkTT7P64Vj/p
         0mYSb1qaPB52GKFt5NblnxH/t6CfkGr713sY6ZX4t2EYPFid4s+xjwMEcdpBOvVyX98b
         MfsC8zx1msRCHR08csJre5ECz7SYdmgDLiV/4KIeV1Pqm6G+24QPD04NUq37gdN2q/l2
         ZiqA==
X-Gm-Message-State: APuU4Z9LYdzHo3u4qV0zGtAG4a76w+34qncivuyrq4zoWj6k2Nzi6Hru
	EFH4AzaGQ3cKLxr5ChWQuO0Vpqjk8zSO2nUP7s2Z69zoTJbUQZrGHzJf2FbBR28eqi/jJtv/r6T
	+0ZGOaNrfwSMsOA82i7bJHDegz3qSZPBbHARW+CP5BmThAM6oFWmlTUS3XSSTiQuyTKsmEkfPxX
	t6nOGtfS7FxrYXXHMixJv0ag==
X-Gm-Gg: AYBFou3C/Y2WD9Kfb888fK7R/89eqpl0D/pqZDjoFKbbOppSgsH1YBhyZuXVZz/B8Zy
	xqfGuA+029ajbQx11YMnypspYRFospt15wfAkPRK+Mri/GCCQWd5kYky/+3ccBRA6vSfmcq1Pkz
	QHIVvjhcFPIIs6eyZR/N3//hiDmpn5tfEAnP69fU5j24wcfjtZSR354iOxYGSEPPWGQeJnUc5UF
	0Fm4JdNOiAc0tBXbogUV2owGefxbBdulvwuKPTQRjZ4h1aeGX8rTIobqbVmHkw5ZEiIN9AbDfcb
	jbgl9uUNXfkayw4XN0eZrMJNPTTW5ASpj9X26OdDlFgHgKbZtC2lU9nY39N3yaD9MNypBOzH3uC
	/RIh+591wKTZa7xUulfFKwXLgze4Fq1Jsr+h8gC1G7yQmnRHKcAuzi1Wf+i2vkgkEusXb8Jte38
	3VeyQ=
X-Received: by 2002:a05:7301:4d0e:b0:36e:53bc:467d with SMTP id 5a478bee46e88-3724fd6aa7dmr5745176eec.0.1794204050759;
        Sun, 08 Nov 2026 22:00:50 -0800 (PST)
X-Received: by 2002:a05:7301:4d0e:b0:36e:53bc:467d with SMTP id 5a478bee46e88-3724fd6aa7dmr5745131eec.0.1794204050090;
        Sun, 08 Nov 2026 22:00:50 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:49 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 10/10] pgpool2: 4.6.4 -> 4.6.6
Date: Mon,  9 Nov 2026 11:30:30 +0530
Message-ID: <20261109060030.621745-10-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX17jRh1A4lQp7
 Y9WaMLppkLtFW6CGfyLKOtwjWje4PkZXLcqsB8LQpKv3Jh1VVaP6cWSSK/2ywvAm2XFaT+dx3Dq
 pA7kKtviHJKj2WB+0NQRVzTuUbAPF4Y=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af16193 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=76-bRGZ4AAAA:8
 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8 a=NbjHXR6wXsx1mZDsqKAA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=m7jLdn-sK_4qfkBjN5GW:22
X-Proofpoint-GUID: 4y6cN2tX0KQY1plHi7YyLtMm9axo32jb
X-Proofpoint-ORIG-GUID: 4y6cN2tX0KQY1plHi7YyLtMm9axo32jb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX4my7HdIB4prE
 AjbCDm50SREqFm77vo+iHLqBBdSHRQQrHHX7yOZOjYM8CBRoIBUrV0nZFTIJsNspEYb+7fRZjTF
 QU8S4l+/o1/QheNIUOXMGxODE1iB3QvCy8i46ZfnXREnzaQ5T0n25SAHpq7QESaQmSKjDXf7IS3
 PiS7vwHccF1xJyat4wrkNkxWAAfzPqAzI0F5Bvn8xV9RmZLFB9KgePj5MculvWleTucAmfwbsg/
 mvit7SZYmSm7F0rbWf2hLg3hu4Q10RPpL2ceVWj1SxMzOqWyO56bAMsLqGy67x2yvg+kVeJuLW8
 iR1q6N0ukVjlpVi6jwy0c7QaBWATL2oZ2DuE2nPdiLIi5VRpyvUZXceIVJ5Fs8ZAYpH/+1NrL83
 cxwQxZV45z1D//tlF2roTBr2TblJvST/NiXH51LoJ0eSU8eDS1B2RJYYW0+1Sv5tutxBBX+4kLe
 k3GsKXtJ/1BDOrHniUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132047
Content-Type: text/plain; charset="utf-8"

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6133cecab2a313b729fe98440a03cd8c3b05e2f1)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../pgpool2/{pgpool2_4.6.4.bb => pgpool2_4.6.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.6.4.bb => pgpool2_4.6.6.bb} (92%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.6.4.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
similarity index 92%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.6.4.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
index 0d7f1e0342..668e506831 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.6.4.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
@@ -10,13 +10,13 @@ HOMEPAGE = "https://pgpool.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 
-SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
+SRC_URI = "https://www.pgpool.net/source/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
 	   file://define_SIGNAL_ARGS.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "ef0d2e91a9a11d737c6476247219e679f718bec53550646189594ef9aefd298d"
+SRC_URI[sha256sum] = "a4021c06b9fbdca975e62bf15a54d93e1b38854c53b5ad9d53cd082ec185dad0"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 
-- 
2.55.0

