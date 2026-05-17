Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC170CD4F4B
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20205.1779006276625470408
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=g14sDc7P;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ow04gQI4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4lrFl3246442
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4jL9uRHBkYf
	6+5kfcsNGNCqtTdkuOkhFwkwumUF9VTI=; b=g14sDc7PshHFtBGqoYsDGgbUfAE
	y7Poyws6RkjIdwUyzC98+Fu9nA5GV8iI7kVgNZkwPbBnG+v3tzo07L+Js75tCnpJ
	irqclw/yT2ryCkxSZBzLWX8D/giaHvYZl5j4JSrgI4I6SA1fNSdQWWHxgqag6QF5
	U+p+4jbyIN8S49xRVbHfvQkfWOrX+5tWi3gDAvzy6gOyNjzYPPYQ7IDpii0fNnsf
	Fk2zBqScPOXr9wnPOET0/aYDs5AoaqIzKSEZ9HUM66eZpZ47eAOzBjK8D4OayJ1t
	ivZ3/kHUZTyZbJOwR26+s/7Zn2kengaT+o9fX8NBaYA50An/4dVDJrspfyQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqtg4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso2894397a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006274; x=1779611074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jL9uRHBkYf6+5kfcsNGNCqtTdkuOkhFwkwumUF9VTI=;
        b=Ow04gQI4N9FTGBDdV79Px8+A0BkiNc1gmW1tRpJM+EfnqAwN3nEH1aG9FyU5lbbuQP
         X6sxEIHGsExrOA8ByZARwrQ9RscEp8QJR4a2aQEa4sDge+ZQTDTK0+6uikMfQmct/gyQ
         rV9lODfHaS2iEes0q7G1Cv7oYsN5fJCTMkQvcqMLv404jk4KYOY0DZYbda9RR4DGQgUW
         jSrS9IjXr7+Nv9zqBRcTC47iHwKFwehFeughmiGQEA5XPCb7m6CamkRQHX2DCRZtbz3D
         ADEbNCt1IAsDTdbpLqSf9w/VbkeQ7zsZJZxeY2ZgG3cXgHfgEdbcI46Ia2G+74C2Nsbo
         DymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006274; x=1779611074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4jL9uRHBkYf6+5kfcsNGNCqtTdkuOkhFwkwumUF9VTI=;
        b=etfvmnDkglBhmY8EMwcxiAdbqsHYEG3pqhlYXYttXBvzlS2QY/3TDEEnlWJ9f0dx8D
         vNYGuRI+YIl76ieGr9+ToNIY+ipgL6dy6H+VH6bDflHYS3UvZATTE06DdFrFRJ8mPFAY
         irjGcScK5qZb7GkTj0uFBEPr4N2Z6CpJX7X4lhvHRC8x/0MeJaumvGoln9ekHu1mkvn/
         pTAdTyErKAaDdkyDoTkaiactwZ1eKRkq59SYdnHjNmrn9to1YoY/Ja/MQEW85sMWi/Yo
         iQ2KDYzQoehMXDT4aSUXtBcEi7EvytHcwzB4KrqCHBf7iBn/H1/B7CfOSrvSuYYRav0M
         eMzg==
X-Gm-Message-State: AOJu0YyNxQncHiBzITKuLT3NaD+t4G5lKaglL5HKjSLlEINAyT4vpjfg
	2inCfJqNqqEN6CHuM0zTTdV/cJ/rRkZKURUatdTUneCVKb673ExCfrL4Aa8x7CMmm9cO6YCbF1j
	Qt56cOaWRtFaKWfvVmKi/jM2hkP41vbIOkr7sLzj3+jlrcGtibHhKBWoNV5kFbVSRHgT2BJB+7/
	YYt7nOZuEX3a4wKL9LWpD/8w==
X-Gm-Gg: Acq92OFCbwbWTkf6HdjoBsomG5iwa7vCZHLUGWaap6qgOoRO0rTP9A/kq1zHOWVmz3+
	bjeej5ZTU+D65QpNHPj5/2FBYaJ0sEifF9s+++Eh5cuiVtJd+WZSjw8910IyGeQhr9jBw92JC1Y
	l7pBHfu3xQ1YvZEeRI7oUliFpy8s/QGB99jFA/QYms8njfNVtM1oO1GW0d3CvV1vz4nnjOHbbAV
	U/hREE+Tj4jo9vTwj075ozmZiEWbiFnps9IkP2WFfurPHvU6GHgoBWQe9oLHiPMbYQHc7ryey4w
	YLhyGVNkRKcA7iGEDZOIw6focjxMTdoF+KqUbb51BoWNgPCvi4t+OrmHPjimmCQ3sk52evxNhyG
	17Eh3VdXYQqMK51XRRtg37RUVnzdJawpLAYQhgKarj8NuvxLB+FgX
X-Received: by 2002:a17:90b:3901:b0:35f:b5df:463 with SMTP id 98e67ed59e1d1-36951b7835amr9924454a91.14.1779006274500;
        Sun, 17 May 2026 01:24:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3901:b0:35f:b5df:463 with SMTP id 98e67ed59e1d1-36951b7835amr9924438a91.14.1779006273841;
        Sun, 17 May 2026 01:24:33 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:33 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-perl][PATCH 23/29] libauthen-sasl-perl: upgrade 2.1800 -> 2.2000
Date: Sun, 17 May 2026 13:49:51 +0530
Message-ID: <f5e824aa82966d84e36b87ee05235149847c4336.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ccFHMKTaVyisdgZIssQ81lNbF0shqj-R
X-Proofpoint-ORIG-GUID: ccFHMKTaVyisdgZIssQ81lNbF0shqj-R
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a097b43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=ZJDnJ0RjEilP6d71_xUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX24Ml4PEqBsSn
 9r/B4XxbUcmwoL/GKiRUQi5BoPki2L8+yAEs4cn9vZVig8m8CnZdIzhaoLcFi4ofltzZtMPvBYX
 TaEThwe8Qh3RpzNlOgEXJxcMUkAwvhMH1v+qQtcDCONz5WEavLpyF9fkkA+1OnxJxGkze9t4is1
 zmPaZ2xP//T4euSLMmIDifassjfQ8KJOXITEwxhRWZlezt7Nqb4ke0SVBio2KPCQ+rXdfiRydcP
 BlHt6fTrN9zhHJhkDSiUPhTLdeG43Z+DZ8HAs3Bz5RV6wW5swC/JQ58PmYLOnPQpvAtjBvNQGRr
 W4XhLHQP9DRcKvWpK5hrpIKgP9ZsZDDYPnLr00axKQL2U5lRQ7SAFq9uGmDtWaTfcQav1kGK7UR
 BNLwnIwVflf/ZJZVlM89WEWMddNEw+7CJ69Iz5k+KvXKACf11ditX2UQUG8cKK65tl0Wvk0wzs2
 eZ2H87kSYJvB4WSxbLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127036

From: Wang Mingyu <wangmy@fujitsu.com>

[Added]
   - Documentation for the security layer
[Fixed]
  - CVE-2025-40918 (Insecure source of randomness),
    required addition of dependency on Crypt::URandom
  - Several public functions missing from the API documentation
[Changed]
  - Modules Authen::SASL::Perl::CRAM_MD5, Authen::SASL::Perl::DIGEST_MD5
    and Authen::SASL::CRAM_MD5 marked as deprecated based on the respective
    RFC documents; thanks to @robrwo for the suggestion and @neustradamus
    for the pointers to the documentation
  - Update module metadata to point to the new 'perl-authen-sasl' org
    on GitHub to which the modules moved
  - Use VERSION declarations in 'package' statements, since our minimum
    Perl version is 5.14 anyway

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit bfd93bafbba771386dde525fdc6202b21f0e85fb)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...authen-sasl-perl_2.1800.bb => libauthen-sasl-perl_2.2000.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libauthen/{libauthen-sasl-perl_2.1800.bb => libauthen-sasl-perl_2.2000.bb} (92%)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
similarity index 92%
rename from meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
rename to meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
index 46a8506f10..5b8699e88b 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} = "libdigest-hmac-perl"
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "0b03686bddbbf7d5c6548e468d079a4051c9b73851df740ae28cfd2db234e922"
+SRC_URI[sha256sum] = "8cdf5a7f185448b614471675dae5b26f8c6e330b62264c3ff5d91172d6889b99"
 
 S = "${UNPACKDIR}/Authen-SASL-${PV}"
 
-- 
2.53.0


