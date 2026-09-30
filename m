Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E1ACA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:06:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14272.1790777197707371259
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ih3l6lwg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Q7YU6/No;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE08ul2970804
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o+07OcEjldNAkeHOy/S1UaRWj2IXbC1OCWo
	jeaDTHrM=; b=Ih3l6lwgziB5O1l+me56sMKKq+BK8G7rTDJkhc2TX6zftB9qRUq
	3pkwefpTJ2uwywz7xZBsoNXNu5qXDQJ7KyU64019U4Ul4VseQcPDaq/69ynV7K0/
	R6VMxKCixoJk8GR07U1PEl/nwAcIu6mKGxndEtswl1MYHInxLe4Ke+yMuD4EkMe2
	Ca41hLngKN5fI4/ruTUayi7CCdG8gmI9q6hP3G58giijdlXXCYAz3zEB23vNt8uK
	fSgwFeir90xSErbLV2JWOBT6+KcvpZ9jwJ8WdeSahEwqzBiRupGUP7VnraqAc84r
	r8ryZkjbmVf09vm3SMCiokP/rCA4gHiTZ6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhek6a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:06:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-343eadc0ff3so834254eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777195; x=1791381995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+07OcEjldNAkeHOy/S1UaRWj2IXbC1OCWojeaDTHrM=;
        b=Q7YU6/No97AbqlDuKJSja39+OqXAMsTFyQ9DqpLFVOLRyvonQWnoCFiQgXaQT6rmxN
         JHDB+Xvy149WQu9Hlr3ZqPZPurziq+LVeOQY7rMt6gVdLhTXLGnqN3OWaEKbrbxmRv9a
         +x6+CVQflK7H7duSRrqnJkYHEjj3lblFUchy6xO1XyWRyeRnK3TNVIwpNgk3jUsUXDGm
         7TfrS3sGSgCdcSH01e/a4JS8i7muaD8AbA8v9tt9pszCMKizQxHcneuJWIE9YF7xAv+G
         TPQzB1t3kiUEMRGNPS7LxaoI4wCx7OtJrsJsngOjNRGaGG1zMEhn7sGef17QtN93NKmV
         iRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777195; x=1791381995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o+07OcEjldNAkeHOy/S1UaRWj2IXbC1OCWojeaDTHrM=;
        b=Jpky+ZCNOLs6QEFhyArpArqZ93jvbfQBCJAU0nHKtUY7BE5PbMBcCmCKF77NtkZ//i
         3B3USCKasetSvS5bxJiSoScxoJeR3kIXpyVkU5t0i/Q6KpQcoiFWTa/gQi8AGNtPDexX
         eAeODOSuDVn2VzYJOpAeVZ/YUNOq39CfTlEBMNJrGXUyS0sn3RHgz47qEdy6sWkhzr5V
         q3BrTgM5YkB58b7PdNiAEQ9L+qpRTDfeg/iLpbzXHfsrh9AL44+X33VWVo9xfCHXqk7R
         IVvFUwpS+ZGn6EvGJA8iQoAW4LlV4zj/q97z83BP9kAcSu2gPTCVrO+vb0QehhR3KGLr
         HthQ==
X-Gm-Message-State: AFuF++l2KnYV5mUkRC7+FQLbCmTEek0sX3gjCt2iGC1U61XhRssu81ll
	zTup2u8+T8TizaK37E9S65NWIgiji8bu9I/NdOEIZReEm+Kbj1oCas4mzTeU1onYfgJmhcOM6pM
	1cPHYwFm2jwcfKsV+MtGghLkZlTX0P1OHyuJTuMCrhcteuTJ3oiDeUwJs/CnbRNniwCacQXdv6O
	UYp4hUwtEu9lIOJr6SNW1FAA==
X-Gm-Gg: AYBFou2OppNX3CePxy/Y0obrFvX5nZB0W1EHX97Vr/+dn/zsk/ATPAxq2lGtmHXfx5f
	ZE+S4BtebLkaWHJJN/7SLGePDzgT2ng6tpWv0ak5xJFkwEsnXzW+jorJbYrTiBJFeAWspX9eSGY
	rUYZctws/XMq3IALWO907Y3Ju1WjCGZhplGjbsJ3ZO+Q3KYp/S4jg6Ya5g7PMc+IVueYR7kbjIm
	VmAdjInLNqLarce0Px0pjj7ZDgUhbDTRAh9n+DpT2KlR3Xm2Rno0zvm1N7FS8mlbm/uHhXjMZCu
	T2j+Te5+Rb2laDsSZ3F8rl9aA2ds8Js+f18KiCxyGvH/29UhZO5Cw+duMTN4ckMmyFGTZ0d4/wa
	EL7bEaR7QbI0FgNFwno/E6hoF6etiSw==
X-Received: by 2002:a05:7022:b051:10b0:148:bce6:429b with SMTP id a92af1059eb24-14d3377aed0mr1474488c88.8.1790777194630;
        Wed, 30 Sep 2026 07:06:34 -0700 (PDT)
X-Received: by 2002:a05:7022:b051:10b0:148:bce6:429b with SMTP id a92af1059eb24-14d3377aed0mr1474446c88.8.1790777193754;
        Wed, 30 Sep 2026 07:06:33 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d083feb21sm9898303c88.5.2026.09.30.07.06.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:06:33 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/14] Scarthgap pull request
Date: Wed, 30 Sep 2026 19:36:26 +0530
Message-ID: <cover.1790775073.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Njg1v1yCwDAET6tmLjMDaSGXLgXO3KHy
X-Proofpoint-ORIG-GUID: Njg1v1yCwDAET6tmLjMDaSGXLgXO3KHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX3FTQCq9e/BJM
 m9/qhfzdcUm1+iqc963lOU2LyUB41xfzz+5U2DLsJUS+A62gonGABz+j1E+ZLk2MH8QCwWEM2tj
 Pe9ifAB/Le6UbcR+MEhqxboFeODz8BafnFP54wkPmwX17ZVGklhGoyRDfPAgLtqE/6jLTAUq5Tl
 Zo4GAc3ir2L18XajGEneJZzyOcg9gHSBu133ADKPwNPiESFT5aumHjGUib+KIIzROrEg+DtX1ri
 5Hjy5yOuLVvh17ed972/RvIhAlBewesOd92YU/SmlkzmJkMu43RgU6VHZCMzwxBARK6LcnwSvPE
 lYGVVk+rZHHftA3mV4C44z0HjcC28w2BCVkPaILVb/z6OVe2u6cdqCpRhA/eZ4Xusfc7aQCQ+q8
 P7GoIaw37rh6BZ1CiiQKR0kP5Iem3PRjC65XrNyGH1mgaZ+6zqEqjYW6bUQtomqycYZHNlDsYDC
 wkGKVQBfuWgMIJFIAZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX5XLD8nVoqAD1
 sOMvhxfSVrQ4zBPF9QCDS4dacNhFWNIDRKPufFIsYw9wkPDNbmHg3GvVQK7wUBvnCHM5ABK4XkF
 SCBEN+2JQD7UZW8cXsHfobSjqiJxt9k=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd176b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=lODmH28_yVyybVnwOY4A:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130524

Please review and merge these changes in scarthgap. Tested on autobuilder
and locally:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1836

The following changes since commit b5874ea07d69919d9b40d59f2c2f0bbd24bc3259:

  libssh: Fix CVE-2026-59850 (2026-09-02 10:39:59 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to 0f00f8b9a21950640da8c5707343e5540133f86e:

  vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_helper_alloc_info (2026-09-29 16:10:23 +0530)

----------------------------------------------------------------

Anuj Mittal (1):
  vboxguestdrivers: fix vboxvideo build on kernels lacking
    drm_fb_helper_alloc_info

Benjamin Robin (Schneider Electric) (2):
  libwebsockets: update to version 4.3.10
  libwebsockets: fix CVE-2026-19773

Deepak Rathore (1):
  rsyslog: Fix CVE-2026-19654

Himani Ramesh Barde (1):
  postfix: fix build on hosts with Linux 7.x kernel

Hitendra Prajapati (1):
  python3-pillow: fix CVE-2026-42311

Jason Schonberg (1):
  php: upgrade 8.2.33 -> 8.2.34

Peter Marko (3):
  msgpack-c: patch CVE-2026-72854
  recipes: correct homepage
  polkit: patch CVE-2026-4897 and CVE-2026-85498

Rohini Sangam (2):
  python3-pillow: Security fix for CVE-2026-59198
  python3-pillow: Security fix for CVE-2026-59204

Viswanath Kraleti (1):
  libfastjson: switch git branch from master to main

Yogita Urade (1):
  hdf5: Fix CVE-2026-17572

 ...kedefs-Account-for-linux-7.x-version.patch |  47 +++
 .../recipes-daemons/postfix/postfix_3.8.19.bb |   1 +
 .../libwebsockets/CVE-2025-11677.patch        | 161 --------
 .../libwebsockets/CVE-2025-11678.patch        | 128 -------
 .../libwebsockets/CVE-2026-19773.patch        |  32 ++
 ...ckets_4.3.3.bb => libwebsockets_4.3.10.bb} |   7 +-
 .../msgpack/msgpack-c/CVE-2026-72854.patch    | 127 +++++++
 .../msgpack/msgpack-c_6.0.0.bb                |   1 +
 .../php/{php_8.2.33.bb => php_8.2.34.bb}      |   2 +-
 .../polkit/files/CVE-2026-4897-01.patch       |  64 ++++
 .../polkit/files/CVE-2026-4897-02.patch       |  32 ++
 .../polkit/files/CVE-2026-85498.patch         |  38 ++
 meta-oe/recipes-extended/polkit/polkit_124.bb |   3 +
 .../rsyslog/libfastjson_1.2304.0.bb           |   2 +-
 .../rsyslog/CVE-2026-19654-regression.patch   |  56 +++
 .../rsyslog/rsyslog/CVE-2026-19654.patch      |  52 +++
 .../rsyslog/rsyslog_8.2402.0.bb               |   2 +
 .../hdf5/files/CVE-2026-17572.patch           | 272 +++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 ...-build-decide-if-drm_fb_helper_alloc.patch |  54 +++
 .../vboxguestdrivers_7.0.14.bb                |   9 +-
 .../python/python3-beautifulsoup4_4.12.3.bb   |   2 +-
 .../python/python3-colorzero_2.0.bb           |   2 +-
 .../python/python3-flask-login_0.6.3.bb       |   2 +-
 .../python/python3-flask-mail_0.9.1.bb        |   2 +-
 .../python/python3-flask-user_0.6.19.bb       |   2 +-
 .../python3-pillow/CVE-2026-42311.patch       | 356 ++++++++++++++++++
 .../python3-pillow/CVE-2026-59198.patch       |  60 +++
 .../python3-pillow/CVE-2026-59204.patch       |  37 ++
 .../python/python3-pillow_10.3.0.bb           |   3 +
 .../python/python3-pyexpect_1.0.22.bb         |   2 +-
 31 files changed, 1257 insertions(+), 302 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
 delete mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
 delete mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.3.3.bb => libwebsockets_4.3.10.bb} (94%)
 create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/CVE-2026-72854.patch
 rename meta-oe/recipes-devtools/php/{php_8.2.33.bb => php_8.2.34.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-42311.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch

-- 
2.55.0


