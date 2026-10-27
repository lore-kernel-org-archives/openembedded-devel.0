Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12150.1793075875692334622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 21:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=O79JEx6C;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=IM73HJ2Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F2Yb1348947
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 04:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PdBigzK9S5p9PIRxONHF32
	MbytOaH2rO4C4QfO4hU68=; b=O79JEx6CoZUc26CSXV8o1dyi/mub62lQZKepHc
	G86+0fbWw+CU7Ftebeumt0NQ5atXr5uFCn3qidjZGLaeokXrMsDJAi8YsXxxVsst
	bkmVbIEa6HqomXBhMw8c8kVbva3FmuBfFOcRhC5h0QZreufo1Y1Sgdju5EFKSBm9
	uiNxzmvOS4bAp9R7yW77mrz1Uwc8V0D3SBREwBe/YvPLSfnUF4B0RdATrEysVcTb
	87uN0GYB9fR8oG0LJ2BWcBhUxykK/uFxMYpV7M24kAC7bHseC1a5MSxFAJEPRZpK
	YtdBRL7lJSdeJ2segL490X2ofSJRtdxz4bpfUS/pjqZ7Em1g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt8h5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 04:37:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so17920233eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 21:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793075873; x=1793680673; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdBigzK9S5p9PIRxONHF32MbytOaH2rO4C4QfO4hU68=;
        b=IM73HJ2Q0fa9+3K9Y5GBNYRGIEWO+Efz/0i8niakDr/weJ/Y05X0RVpjNjQqo5e1Cy
         5dtRKDXKCsfOuh3SWb6JPpjOSdXL42lGCX3rHl1Qfcqv6/VF+BArjjWvEaehr8G7ZXAt
         jrXxBdKC1VatbMzbcyrBFIPnxeFRDFnnJLDCyWIUrr0dhcqfHWBnekKk2hoG0c2umBy4
         9gqNq2YoU00GwpP42a+I4X7tVGphQbPN6lCKyFc+VY0rgfH5wBuzoKo/PG3hXJX3vKAK
         4eQys82+A7VH1zuGamcTkxgFSAF2JU3V/WU257BuzYAYhMXYyPpTTsac5MWhYYa9PU6e
         SYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075873; x=1793680673;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdBigzK9S5p9PIRxONHF32MbytOaH2rO4C4QfO4hU68=;
        b=KUChp8LCJUBYZeWg5Gch6S/Nyf9VpgChCgy40IH8GC9M58Qnfk6L+emD9F2TF6av4+
         NfeBx1NcYW7L0vYTcf3KZs+tYi+sM3YrJ8jmJ681/pCihfBnP0C32Z1t0c7UIkMbaDdP
         tMlepP0IqxpZNMzcAjFEaUOIxPB/rXH0cAelDg0NMLP53+CaozWlQlxhy5G3kpHtsUN5
         khahpq4ndRWS1O9jt6nJ6Qr7iyBZSQWV1jmrJ4csj7r7E43jmusfqIGS7YFXHBt2IAUl
         NcmsuI5mF/2yRs8IXK71iaayGQ8HGiH6W+J1AJYQPtCSldOrfn87jEt7TglLCfMYQBCD
         pSCA==
X-Gm-Message-State: AFq9FYKQ/stWXYkDIi6F2DnGRetTD0dV9qlxFJwD+fasg0jYhr2OMP4a
	EP1gKcYx6DgvdJe/s24sWhy0+N6mRW/I30VaA/rsEi7fz4JiCdRgzQUo2sZxo0+I2DtxHC3ucJ4
	5mtJPAag1SE3ElwLbd7F1s6K12M1Cm9ezDhRJKPAISv21vwBWk0oGSy+S6+slF98lIv9Xs45OvA
	rnH8Ev2p5BggQTmLCmpQCALQ==
X-Gm-Gg: AYBFou0XQ/iShoRk/LirpPBu6BvEB9A1hrPSLM2B6Oh0fzsr/HlY0NhfD9yLP26jBep
	CKf59ZmBqGphRp1jIOnJq2Asww2PNbEo7OqbFkYZnwSx9cszv6A83VQm1Y5cqvXemZXs2cT5bpR
	mx1jq66WSpITRlcjg2TDfOOHzyEqtjfghQKcEi0HvWvOqSMxO4WJvv01uNbrYsJfr2UcWRF1ktC
	M2ebUst+t6Lu7LKJStF2tmK8DRrBOKEZyDpw4A3rpQjlwm8bW++loYYuPDJqvs6rJfIWYK93mN/
	Dp44DI/oNQwlbXD5nw+QYgPaIxTLDEERxFSbwnKcU4i/18l2csbF7fOemiTef84z0fUfoKLTyF0
	fVmIz9XCd3le9un7e0g5MXHtl8Nu8vA==
X-Received: by 2002:a05:7301:dd8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-369e836b28amr13571979eec.1.1793075873065;
        Mon, 26 Oct 2026 21:37:53 -0700 (PDT)
X-Received: by 2002:a05:7301:dd8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-369e836b28amr13571949eec.1.1793075872285;
        Mon, 26 Oct 2026 21:37:52 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm55790295eec.23.2026.10.26.21.37.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:37:51 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/45] Scarthgap pull request
Date: Tue, 27 Oct 2026 10:07:44 +0530
Message-ID: <cover.1793075119.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfX19CnThBCNLvE
 OnzVfkKcCFTfqoU9jtK7AsHw5FY3F+ypNKd4H4CcFomrZ2wElw6mLM2DXa22PY2Y+UCu+Fc9NRR
 NjX9EL2V1w2wWtOB/DIXK3QAbqHNUCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfX0IYsVNeV/zhp
 hoGzR7pEFDRag73e1iZu2SYQubJkepomVGAbdSihNcli62P5DVR8zIFegnawiL/9RJGE/exCuCx
 IC+BlG8ldsLlFb9v/O5neypfRbcm9WfOuvWfmFE+HNopD+NTMOTzlMKtCodEFgYzQQGkFmwfkMo
 kBIQr4VktXED1i08RYYOpVfXYh2xHhSpyoodAwsMu0Fb26U7yO93lUg5vA7lciQUeCtjyoDwEc8
 59oY/y9UCSXV6f+hQgzbmm9rq2oJYhUPm1mR5qUgg1sNBJKgZhgMsgTngJ2jFZOgTxLuxCAYqDZ
 y5aSthMu903eYDGJiQNp2643BCF65GAH6IA5FOBI0ghuUrbyy6ELuH6RaRtL0i2410L5jA/vbMl
 chiYtF7Q9fzbDUbSI9/2yGH8IKqEt02ZGaOS8SgdTMoTz6Z5bqzIFAIY+mLl5Bakn3KcATXbj+9
 ZD8aI0mKqF10qUyRz4w==
X-Proofpoint-ORIG-GUID: 2e0xLIBngd3hYCe204d-vw6nxU8rfide
X-Proofpoint-GUID: 2e0xLIBngd3hYCe204d-vw6nxU8rfide
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae02aa2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=UumZQdarj5PMAkC5KAQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270017
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 69R2F2Yb1348947
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 04:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131455

Please merge these changes in scarthgap. Tested locally and on autbuilder=
:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1901

The following changes since commit 0f00f8b9a21950640da8c5707343e5540133f8=
6e:

  vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_helper_=
alloc_info (2026-09-29 16:10:23 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap

for you to fetch changes up to 2db6aece32c7f8ebf6015b468e1b4e21de072e3b:

  python3-grpcio: update gRPC repo roots (2026-10-26 12:46:49 +0530)

----------------------------------------------------------------

Ankur Tyagi (1):
  apache2: upgrade 2.4.68 -> 2.4.69

Darsh Kelaiya (20):
  python3-aiohttp: fix CVE-2026-34519
  python3-aiohttp: fix CVE-2026-34516
  python3-aiohttp: fix CVE-2026-34517
  python3-aiohttp: fix CVE-2026-34520
  python3-aiohttp: fix CVE-2026-34525
  python3-aiohttp: fix CVE-2026-47265
  python3-aiohttp: fix CVE-2026-50269
  python3-aiohttp: fix CVE-2026-54274
  python3-aiohttp: fix CVE-2026-54275
  python3-aiohttp: fix CVE-2026-54277
  python3-aiohttp: fix CVE-2026-54278
  python3-aiohttp: fix CVE-2026-54279
  python3-aiohttp: fix CVE-2026-54273
  ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
  ntfs-3g-ntfsprogs: fix CVE-2026-46571
  ntfs-3g-ntfsprogs: fix CVE-2026-46570
  ntfs-3g-ntfsprogs: fix CVE-2026-46569
  ntfs-3g-ntfsprogs: fix CVE-2026-42618
  ntfs-3g-ntfsprogs: fix CVE-2026-42616
  ntfs-3g-ntfsprogs: fix CVE-2026-40706

Jason Schonberg (1):
  php: upgrade 8.2.34 -> 8.2.35

Jo=C3=A3o Marcos Costa (Schneider Electric) (2):
  ntp: add CVE-2016-1548 to CVE_STATUS_NTP
  ntpsec: add CVE_STATUS for CVE-2016-1548

Mehmet Fide (1):
  spidev-test: clean the build dir before configure

Peter Marko (15):
  c-ares: patch CVE-2026-69186
  c-ares: patch CVE-2026-69184
  cjson: patch CVE-2026-87933
  syslog-ng: patch CVE-2026-39879
  libwebsockets: patch CVE-2026-78161
  squid: patch CVE-2026-33526
  squid: patch CVE-2026-33515
  squid: patch CVE-2026-32748
  squid: patch CVE-2026-47729
  squid: patch CVE-2026-50012
  squid: patch CVE-2026-61642
  squid: patch CVE-2026-104786
  nss: remove compromised eMudhra certificates
  grpc: update gRPC repo roots
  python3-grpcio: update gRPC repo roots

Rohini Sangam (3):
  nodejs: Security fix for CVE-2026-48617
  nodejs: Security fix for CVE-2026-48619
  nodejs: Security fix for CVE-2026-48937

Yogita Urade (2):
  hdf5: Fix CVE-2026-17573
  hdf5: Fix CVE-2026-17574

 .../files/CVE-2026-40706_p1.patch             |    60 +
 .../files/CVE-2026-40706_p2.patch             |    34 +
 .../files/CVE-2026-42616.patch                |    70 +
 .../files/CVE-2026-42618_p1.patch             |    53 +
 .../files/CVE-2026-42618_p2.patch             |   216 +
 .../files/CVE-2026-46569.patch                |    62 +
 .../files/CVE-2026-46570.patch                |    42 +
 .../files/CVE-2026-46571.patch                |    50 +
 .../CVE-2026-46572_CVE-2026-42617_p1.patch    |    66 +
 .../CVE-2026-46572_CVE-2026-42617_p2.patch    |   104 +
 .../CVE-2026-46572_CVE-2026-42617_p3.patch    |    35 +
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |    11 +
 .../squid/files/CVE-2026-104786.patch         |   131 +
 .../squid/files/CVE-2026-32748.patch          |   182 +
 .../squid/files/CVE-2026-33515.patch          |   199 +
 .../squid/files/CVE-2026-33526.patch          |    35 +
 .../squid/files/CVE-2026-47729.patch          |    51 +
 .../squid/files/CVE-2026-50012-01.patch       |    34 +
 .../squid/files/CVE-2026-50012-02.patch       |    31 +
 .../squid/files/CVE-2026-61642.patch          |    43 +
 .../recipes-daemons/squid/squid_6.14.bb       |     8 +
 .../recipes-support/ntp/ntp_4.2.8p17.bb       |     1 +
 .../recipes-support/ntpsec/ntpsec_1.2.2a.bb   |     2 +
 .../libwebsockets/CVE-2026-78161.patch        |    45 +
 .../libwebsockets/libwebsockets_4.3.10.bb     |     1 +
 .../cjson/cjson/CVE-2026-87933.patch          |   108 +
 .../recipes-devtools/cjson/cjson_1.7.19.bb    |     1 +
 ...e-repo-roots-to-chromium-roots-42094.patch | 14348 ++++++++++++++++
 ...curity-Update-gRPC-repo-roots.-43699.patch |  2617 +++
 meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb  |     2 +
 .../nodejs/nodejs/CVE-2026-48617.patch        |   118 +
 .../nodejs/nodejs/CVE-2026-48619.patch        |   253 +
 .../nodejs/nodejs/CVE-2026-48937.patch        |   349 +
 .../recipes-devtools/nodejs/nodejs_20.20.2.bb |     3 +
 .../php/{php_8.2.34.bb =3D> php_8.2.35.bb}      |     2 +-
 .../recipes-kernel/spidev-test/spidev-test.bb |     1 +
 .../c-ares/c-ares/CVE-2026-69184.patch        |   295 +
 .../c-ares/c-ares/CVE-2026-69186.patch        |   159 +
 .../recipes-support/c-ares/c-ares_1.27.0.bb   |     5 +-
 .../hdf5/files/CVE-2026-17573.patch           |    49 +
 .../hdf5/files/CVE-2026-17574.patch           |    62 +
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |     2 +
 ...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |   272 +
 ...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |   143 +
 meta-oe/recipes-support/nss/nss_3.98.bb       |     2 +
 .../syslog-ng/files/CVE-2026-39879-01.patch   |    65 +
 .../syslog-ng/files/CVE-2026-39879-02.patch   |   571 +
 .../syslog-ng/files/CVE-2026-39879-03.patch   |   758 +
 .../syslog-ng/files/CVE-2026-39879-04.patch   |   176 +
 .../syslog-ng/syslog-ng_4.6.0.bb              |     4 +
 .../python3-aiohttp/CVE-2026-34516.patch      |   356 +
 .../python3-aiohttp/CVE-2026-34517.patch      |    65 +
 .../python3-aiohttp/CVE-2026-34519.patch      |   638 +
 .../python3-aiohttp/CVE-2026-34520.patch      |   121 +
 .../python3-aiohttp/CVE-2026-34525_p1.patch   |   128 +
 .../python3-aiohttp/CVE-2026-34525_p2.patch   |   331 +
 .../python3-aiohttp/CVE-2026-47265.patch      |    61 +
 .../python3-aiohttp/CVE-2026-50269.patch      |   166 +
 .../python3-aiohttp/CVE-2026-54273_p1.patch   |   798 +
 .../python3-aiohttp/CVE-2026-54273_p2.patch   |   181 +
 .../python3-aiohttp/CVE-2026-54274.patch      |   195 +
 .../python3-aiohttp/CVE-2026-54275.patch      |   124 +
 .../python3-aiohttp/CVE-2026-54277.patch      |    96 +
 .../python3-aiohttp/CVE-2026-54278.patch      |   209 +
 .../python3-aiohttp/CVE-2026-54279.patch      |   317 +
 .../python/python3-aiohttp_3.9.5.bb           |    15 +
 .../0001-Update-gRPC-repo-roots.-43699.patch  |  2617 +++
 ...e-repo-roots-to-chromium-roots-42094.patch | 14324 +++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |     6 +
 .../{apache2_2.4.68.bb =3D> apache2_2.4.69.bb}  |     2 +-
 70 files changed, 42678 insertions(+), 3 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-40706_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-40706_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-42616.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-42618_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-42618_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-46569.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-46570.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-46571.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-46572_CVE-2026-42617_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-46572_CVE-2026-42617_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-46572_CVE-2026-42617_p3.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
104786.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
32748.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
33515.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
33526.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
47729.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
50012-01.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
50012-02.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-=
61642.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsock=
ets/CVE-2026-78161.patch
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.p=
atch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Security-Upda=
te-repo-roots-to-chromium-roots-42094.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-security-Upda=
te-gRPC-repo-roots.-43699.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48617=
.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48619=
.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48937=
.patch
 rename meta-oe/recipes-devtools/php/{php_8.2.34.bb =3D> php_8.2.35.bb} (=
99%)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69184.=
patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69186.=
patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.pat=
ch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.pat=
ch
 create mode 100644 meta-oe/recipes-support/nss/nss/0008-Bug-2083709-Remo=
ve-eMudhra-emSign-Root-CA-C1-and-emS.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/0009-Bug-2084101-Remo=
ve-eMudhra-emSign-Root-CA-G3-from-NS.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3987=
9-01.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3987=
9-02.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3987=
9-03.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3987=
9-04.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-34516.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-34517.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-34519.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-34520.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-34525_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-34525_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-47265.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-50269.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-54273_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-54273_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-54274.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-54275.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-54277.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-54278.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-54279.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/00=
01-Update-gRPC-repo-roots.-43699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/00=
01-Update-repo-roots-to-chromium-roots-42094.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb =3D> apac=
he2_2.4.69.bb} (99%)

--=20
2.55.0

