Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7940ED3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:53:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5146.1765277601996020094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=S9/hJxU+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=juVxwg9O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99NCbF2755387
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 10:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=asF4LInWGiIh1Ld/nprXjdUwt6M/A3ZZCM4
	7ahUvDYM=; b=S9/hJxU+9SYKzziVcDRZf/dvieWEKomMX6SQWnyhIpqt6MeGVGC
	nwLI76TlIivKWJJllyWHI6312QR2JpEbdnJh2APbZKlTgmM8SDuczpC4kvvxtQx4
	na+Lpj2Gy5n1CnpX2U0g/iEcsgEXNknqiRSSX4/YAvDPS2iRMRbEPVagNND1urIY
	n7kPgM4bRRohe5Wj8j+vfwHE4zH7fGx3dHp18uLAbA7x51m0hXC2OGbBpEbaX+7I
	pxClUUiowaa2jFO8F4fAd8qGLiPw+v0c9OHjh8H8gxbUi5wz8DlFdVToHjixZupa
	5Rz2e8BQvXijKdruE3T/L5yRrvz9PepTSQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax57ra96b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 10:53:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295952a4dd6so58060155ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 02:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765277601; x=1765882401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=asF4LInWGiIh1Ld/nprXjdUwt6M/A3ZZCM47ahUvDYM=;
        b=juVxwg9OoqkEu6nUJHxyirEd4+49buyZ4CsDmpyr+CUHWLFMvGv4c8HY9iRomkTGJD
         gIBdQuB40bO5IcwkvfV7W2jVyqsjl8hzAiRwCSk8AFZC65LofQRJxAN0tyOM0u/f4eqs
         hHQqB6XG4sR96uoL2nedcZfWLnbpTjIYKA0r0c8X12JVw/RNE0/KTn6dl+Z27M86z/4N
         Xu7SGdiy9xcYL1pV54LYwI79X4K7apZSpejA0nW83X1z/VSEf6IlvJ2FDx6fy/FXZMmR
         K6MfkE1AQyPAkgj7BwauVy1ywFO0jpq9rESfbVqVMk9qNQxFZFgh5fy39CoRHL1gVsav
         Pkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277601; x=1765882401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asF4LInWGiIh1Ld/nprXjdUwt6M/A3ZZCM47ahUvDYM=;
        b=fuonsDP3z3j2Dn11c/SNJufOhSWSRhdH5R1C+U1W6ibHFmwl72BrdRWdUfcG+vxeQL
         0tTmaWOW2gLz6UaZiH1GA2y2xvSISjIWmL9spJEqVU6AZ1lPGmOsyCMWAQdIQ7QFQMQJ
         ezOIANv/F5sk/t2oL+fbbQE3tgperQiYZhqFbwrO73VGMLFeV9unv5CdDH+aFrMrlvIW
         pq6mA+r4naCWKK2sMG6O2TYaciVe0sIo7I5jqKmR4gofRkMgq6HVlEJ/vtXQz/IEYJvK
         3hvLx92ULijHx7HYApFPI8CgZ48L6tmyI9POCxHx7SS+BNjmuD3w0ANkBq3QDAdca0r8
         qskw==
X-Gm-Message-State: AOJu0YwiUPzXhcZzOEE54tgWR/eoLeVGcDLpv30vtPuDxAM6qY5GvEbA
	ZpqhyIWqUEGg9bT1rO1axeROBbIXIKuzBOdc+AMDLUVYpm6KLdFyn4N/IH2pIfGl84IAcMWQHBw
	/hJ6iuIRfNsilTO9sHt1xAVcLjtlVQRUFLuW9tKqfejBQWtVxDP9zqEEprHLcJ+WcOf2Sk1FHpj
	7dXnJDhVZuK/ocfn69
X-Gm-Gg: AY/fxX5IoIMSo2On+8LGPSVNbcbLyrbOPufvpz6K8dL14k7ZG3cNLip1G7/AdUJpxkg
	zhYxgCo0af22uuiNTwdQcF5ZEGHdh908Ub8lV6ShpSqmeVQ3jjBcSzfsSFS7StWpgTOgPQixXoF
	FOqsgAiN6lEW9505qRiFggbxaQgW+T2aNN7q4TaQhZEZnWb/tXXrAir+8tUKIhPSSAP1ySBObDo
	qmtq+2lCOTomQ6ENvWJu52ozM4w4DSE1g1hwKSXFweAskAz2TEUy1t6rNZZp+6xckZ94JKa9NQA
	C3O/SoGQ/eY4D9kYqD4vSMJSeTCSu9qiYcyu9TO0BiZeBI1FFQ1gTzQjb6QtekfE9TzNRdXI48S
	23ZN4KbGxMQxxsBML51uwTUZ+Pl3eb6UQF6MLPA+q3OIwc0hG
X-Received: by 2002:a17:903:298b:b0:29d:7f69:2853 with SMTP id d9443c01a7336-29ea25c0327mr10971985ad.28.1765277600547;
        Tue, 09 Dec 2025 02:53:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUOcHr2wh5ozmLl0xHY+6o/HThN1vpyfSVaNQyAX9qI0+zneaKlzyps03ejzOdfSaiKBai7w==
X-Received: by 2002:a17:903:298b:b0:29d:7f69:2853 with SMTP id d9443c01a7336-29ea25c0327mr10971805ad.28.1765277600004;
        Tue, 09 Dec 2025 02:53:20 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6ae0sm151617005ad.93.2025.12.09.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:53:19 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [oe][meta-oe][Scarthgap][Kirkstone][PATCH] gflags: switch Git branch from master to main
Date: Tue,  9 Dec 2025 16:23:14 +0530
Message-Id: <20251209105314.2587287-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OPQqHCaB c=1 sm=1 tr=0 ts=6937ffa1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=qHZKfGunYX0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=sZ_Kt6tmpOMTrNQfupwA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA3NSBTYWx0ZWRfX1T3PFw92U9sQ
 qEK62v+S1wDzjTodmEyR6NvbCa2i9d0ho+CZwQsoqqGwSjY6vr02SoIvt5BJbS6/qJcjO11+9y6
 iZVS1hsjeo4FAGVy7xJHrQa9RnGkjRoNKCpl3QMC2D/HnvxBy7RfQVITMcCIzbfr1sWgsnuKruq
 BFqF2CY0qf8MGrLnLWrI0wzCyY5Metc3b4KvFGa6JOJos2E/m6OKhsC5WgYPhZ8gx/9/jB3wJPB
 XbVLz53tSRWPEyp1GD2cZIwkp0ahrg4ivcZMsE8LoHuW8ieyHCfut5XC8tCGPdx9QA/ahjZGUh7
 5j2DtZhRVNQ/VxAobfnfRgm1WQRTjpiMW7Gh2waYXWVTJzakDZOlGHa9/ooBgfEBSL0no9WUgZf
 NMnMLHOj4dneds96aluOgRlD966E1Q==
X-Proofpoint-ORIG-GUID: HealR5PWvwMryxJNJMiFbH49vVi3xeYD
X-Proofpoint-GUID: HealR5PWvwMryxJNJMiFbH49vVi3xeYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 10:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122443

Update SRC_URI to use the 'main' branch instead of 'master' since
the upstream GitHub repository has renamed its default branch.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
index a9a867b575..302e0f9c73 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "git://github.com/gflags/gflags.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/gflags/gflags.git;branch=main;protocol=https"
 SRCREV = "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
 
 S = "${WORKDIR}/git"

