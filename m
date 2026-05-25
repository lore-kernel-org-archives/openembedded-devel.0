Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06325CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 14:27:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16916.1779719230089706838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2026 07:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=ODICJxaw;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=c2eSxLi2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PEBdiw3658101
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5LQQS+SC70jHSKLiwoUbIL
	tkOKDcuGWcM6ZDCekJF24=; b=ODICJxawpgsWVVjnb5ApJryX8nJ/vcq9IWqbAw
	rh/m88uE9MScfm+GzOT1lTlmBaL/IvbPH9wzEBMnaAhfHkSEzNZMCuo9ezo7ytzj
	O3dpK1Ch58dVc6UTZwhrEPgrUkNqFxI7WiJ5um9hriQFg5kOuQvlWboPMGHnqvu/
	eo4W3UICggpdNEgV6ARnsZxsIz/JP7Lc6VVgkivFMHXAG9jlJW28yo8TivQUVT90
	VnpLQCN9h+rU2cBKcJGKRvUHIOeDdA/gy18v62sEDNA2WgnGlTVBYoyMcyaMsZuU
	VBA+DiHXNFLe9f5Da53zYmQmFcfGZPfq9ighxf18TMArFy0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqyn81jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 14:27:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so99148145ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779719228; x=1780324028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LQQS+SC70jHSKLiwoUbILtkOKDcuGWcM6ZDCekJF24=;
        b=c2eSxLi2rZ54f+p9VV07qS8SoD/mfF76Vl6HXmWnnK3FmCXhERZxO4XI/t8ZmyX9pD
         gkWIjufkJP9xZp8HvZEqQCLf7Q3zDUs3wCxR7+J1Xc472IYex5zH7zYNcy7u1InKvloQ
         T2l6QkUakM4sNMemJ2/y6PdS0XqUs5zR53fgFMNEvI0lOLFw1KluIe4Cvs8e8anEBpMy
         DrlR5LrwNqe3XdYtIZDAfldhO556LKS9KO7yy16UaZeEcJp8Ce5JwbHruyL3L+q9PNcx
         NIrcwpcQ6K9yMIOqzmgo7077uMJp1nxuBuObNuIkqZE++PsThc2KxDimuRhjjWPQTCqP
         bE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779719228; x=1780324028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LQQS+SC70jHSKLiwoUbILtkOKDcuGWcM6ZDCekJF24=;
        b=MJP9d07pcgpPFJ3jMzJdIt8fvClDAKT3YWqJapw0ElSM571OsY8Ng3ixzjXDTNgzRH
         Ll51k+NCGBykJCjr25zkLcVwnusji/gIAz6svhLLFVFAyRNt9HEbtnN3Cf5qPP9xZxqE
         leYrNw76EL8+kMKGUSddTCxGKFLNocyg9U45HplXmBbpkxcy5+hKDHEV7PiA64RwniV3
         ITpVthdYS7SEMYJHCP8VJ5h81EhvnhAUySK8Rfsv/ysOfiLTXpifypk2G/1KBPdWSvTq
         2ruwkDEfHTeHwEWS7bnwaiuNJ5K7QpnCRfrEi2zxVpEbNwKrwfaSvhUKvjAhTzuVMazv
         bjWQ==
X-Gm-Message-State: AOJu0YwmLEJAhcPirosw8wcN+OrIVPNWQ34bASe74xLu3PjGvd+E2fjo
	XIuiYFV6GNnokGbXcLGPV5JdUTcnMI7lhZ4fVJb0nSji7aawAIk+PiGSFjI7aV+8LON0+fHdmWv
	FFiuAXneWZLZ7iPsHfNqX6wu33RP8CXqOi0pfrx6pHTnqfNpEmDu93VBbt03Fkl9rBN7xYhDQJH
	DIHablRBUkqrs4H1qVZd8=
X-Gm-Gg: Acq92OFOilX5F/ZkpGSwBDFBcz69Hwg7B/M1dRfZNF3DUsEj42ETHlUd2McNQQXR5DD
	pDp7JblT8guAfTlSs+sla0gtNlR8fti0YDAhRRPabeg/YQcrir7FY+GRtsV17xrbnQg2mnsMjm8
	6+pnZfCqPISdhb+hRS9eF629oqnm+DFxCpn76POODm95F0w0y6cfQhvf8Ne4yp06y2T6qnaZYmh
	ehsUEYCB39aWzz1gOFQIgcaCh0Jvw1urzVLXnx4kz3vIv/FgLidm+ZcvbdjYYLy48TNCrNwQ/AA
	CMgF1Y5gdeQXnh+/Jh/eANnPaq8gLn3VuLfAdDnfYzPXRNYc5cKBGReMXsAs9lFsIquOeiWUL2N
	bBUkcxSJbjhHl2hpIUts6Pjc2f9LdoJdPK9lCkpxeqhXFDpvmkUVV
X-Received: by 2002:a17:90b:3d4c:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-36a676ae04amr15662520a91.24.1779719227461;
        Mon, 25 May 2026 07:27:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4c:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-36a676ae04amr15662478a91.24.1779719226719;
        Mon, 25 May 2026 07:27:06 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7263178dsm13347995a91.3.2026.05.25.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:27:06 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [PATCH 00/29] Scarthgap pull request
Date: Mon, 25 May 2026 19:56:56 +0530
Message-ID: <cover.1779718757.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a145c3c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=at6mKpI4GgdKbQkHrAoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: oGG8O9GIeMFmWCpT5rq3Dv68XMPMf9il
X-Proofpoint-ORIG-GUID: oGG8O9GIeMFmWCpT5rq3Dv68XMPMf9il
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE0OCBTYWx0ZWRfX9R5W74PeEbrc
 9jiWHwEjrUDjKXabTrawvRxmK82QoPmvVh34KhoTembOBE5zzzKgOZtzK5+lqlBJ1VVGFc+89PA
 ZsVTplQSQl04j1OWThscT+1YKry4AiFFNG93SFaMbLpQhxVC/jDfHxgeqBOk2Q1XD7XFSf3BhFH
 cYIZNuslE+4t6XPBnmFsf7Hllc6hQZ01BKa/dugue8EyrjFB3Strli4+7/29vaYJ9i+8WCoSHMZ
 F83EkdTAQnt4v9B1so/G6xuYmumtBAqC3MWo09D3zAyV7Y6W4zmOtnBlvoZW6He+frToIHOZAae
 YwTPbbXR/cCb5d+QkwZrVuwk5NW5Yn4skUO7aUdyXo2vNE41TxRThvLNVp9gZUFgWMSCUdP07gQ
 XG9L7AVYK+rNe+anUZLldcCtX87BV6+6doBTHHW06z4aNThwzjuAIpkibuXOBPE1W6iR+PNNVSk
 9uqoTuLscxGHbsO2Biw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250148
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 64PEBdiw3658101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 14:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127200

Mostly CVE fixes and a few bug fix only upgrades. There's a new recipe fo=
r
python3-backports-zstd that introduces this module for Python 3.12 which =
didn't
have this.

Tested locally and on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1538

The following changes since commit ae7dfb12245c7f9b9a353499e2688015bd4e64=
13:

  jq: Stick to C17 until next release (2026-05-05 06:57:17 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap

for you to fetch changes up to d8cc4e44001c7257273d290ce8c4496e93d32841:

  postgresql: upgrade 16.12 -> 16.14 (2026-05-25 08:05:43 +0530)

----------------------------------------------------------------

Ankur Tyagi (8):
  exiftool: ignore CVE-2026-7580
  firewalld: upgrade 1.3.2 -> 1.3.4
  frr: patch CVE-2026-28532
  lcms: patch CVE-2026-41254
  lcms: patch CVE-2026-42798
  postfix: upgrade 3.8.12 -> 3.8.16
  nanomsg: upgrade 1.2.1 -> 1.2.2
  postgresql: upgrade 16.12 -> 16.14

Gyorgy Sarvari (1):
  python3-ecdsa: set CVE_PRODUCT

Het Patel (3):
  abseil-cpp: Add CVE_PRODUCT to support product name
  onig: Add CVE_PRODUCT to support product name
  open-vm-tools: Add entry to CVE_PRODUCT to support the product name

Hitendra Prajapati (2):
  wireshark: fix for CVE-2025-13946
  strongswan: fix for CVE-2026-35334

Hugo SIMELIERE (Schneider Electric) (5):
  nss: Fix CVE-2026-2781
  dnsmasq: Fix CVE-2026-4891
  dnsmasq: Fix CVE-2026-4892
  dnsmasq: Fix CVE-2026-4893
  dnsmasq: Fix CVE-2026-5172

Jason Schonberg (1):
  php: upgrade 8.2.30 -> 8.2.31

J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric ) (1):
  python3-backports-zstd: add recipe

Liyin Zhang (1):
  apache2: upgrade 2.4.66 -> 2.4.67

Peter Marko (1):
  python-grpcio(-tools): add grpc:grpc to cve product

Sudhir Dumbhare (1):
  libssh: set status for CVE-2025-14821

Theo Gaige (1):
  dash: fix CVE-2026-31323

Theo Gaige (Schneider Electric) (4):
  nginx: patch CVE-2026-40701
  nginx: patch CVE-2026-42934
  nginx: patch CVE-2026-42945
  nginx: patch CVE-2026-42946

 ...{firewalld_1.3.2.bb =3D> firewalld_1.3.4.bb} |   2 +-
 .../{nanomsg_1.2.1.bb =3D> nanomsg_1.2.2.bb}    |   2 +-
 .../{postfix_3.8.12.bb =3D> postfix_3.8.16.bb}  |   2 +-
 .../frr/frr/CVE-2026-28532.patch              | 309 ++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |   4 +
 .../dnsmasq/files/CVE-2026-4891.patch         |  44 +++
 .../dnsmasq/files/CVE-2026-4892.patch         |  41 +++
 .../dnsmasq/files/CVE-2026-4893.patch         |  38 +++
 .../dnsmasq/files/CVE-2026-5172.patch         |  39 +++
 .../open-vm-tools/open-vm-tools_12.3.5.bb     |   2 +-
 .../strongswan/CVE-2026-35334.patch           | 255 +++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |   1 +
 .../wireshark/files/CVE-2025-13946.patch      |  51 +++
 .../wireshark/wireshark_4.2.14.bb             |   1 +
 .../files/0001-Add-support-for-RISC-V.patch   |   7 +-
 .../files/0002-Improve-reproducibility.patch  |   7 +-
 ...c-bypass-autoconf-2.69-version-check.patch |  11 +-
 ...-config_info.c-not-expose-build-info.patch |   9 +-
 ...gresql-fix-ptest-failure-of-sysviews.patch |   7 +-
 .../postgresql/files/not-check-libperl.patch  |   9 +-
 ...ostgresql_16.12.bb =3D> postgresql_16.14.bb} |   2 +-
 .../abseil-cpp/abseil-cpp_20240116.3.bb       |   3 +
 .../recipes-devtools/perl/exiftool_12.72.bb   |   1 +
 .../php/{php_8.2.30.bb =3D> php_8.2.31.bb}      |   2 +-
 .../dash/dash/CVE-2026-31323.patch            |  43 +++
 meta-oe/recipes-shells/dash/dash_0.5.12.bb    |   5 +-
 .../lcms/lcms/CVE-2026-41254_1.patch          |  30 ++
 .../lcms/lcms/CVE-2026-41254_2.patch          |  36 ++
 .../lcms/lcms/CVE-2026-42798.patch            |  38 +++
 meta-oe/recipes-support/lcms/lcms_2.16.bb     |   6 +-
 .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
 .../nss/nss/CVE-2026-2781.patch               |  36 ++
 meta-oe/recipes-support/nss/nss_3.98.bb       |   1 +
 meta-oe/recipes-support/onig/onig_6.9.9.bb    |   3 +
 ...ake-license-entries-compatible-with-.patch |  38 +++
 ...s.toml-lower-setuptools-requirements.patch |  31 ++
 .../python/python3-backports-zstd_1.5.0.bb    |  21 ++
 .../python/python3-ecdsa_0.19.0.bb            |   2 +
 .../python/python3-grpcio-tools_1.62.2.bb     |   2 +
 .../python/python3-grpcio_1.62.2.bb           |   2 +
 .../{apache2_2.4.66.bb =3D> apache2_2.4.67.bb}  |   2 +-
 .../nginx/nginx-1.24.0/CVE-2026-40701.patch   |  73 +++++
 .../nginx/nginx-1.24.0/CVE-2026-42934.patch   |  79 +++++
 .../nginx/nginx-1.24.0/CVE-2026-42945.patch   |  46 +++
 .../nginx-1.24.0/CVE-2026-42946-01.patch      |  46 +++
 .../nginx-1.24.0/CVE-2026-42946-02.patch      |  91 ++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   5 +
 48 files changed, 1445 insertions(+), 43 deletions(-)
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/f=
irewalld/{firewalld_1.3.2.bb =3D> firewalld_1.3.4.bb} (99%)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.1.bb =3D=
> nanomsg_1.2.2.bb} (94%)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.12.bb =3D> p=
ostfix_3.8.16.bb} (99%)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2026-28=
532.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-4891.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-4892.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-4893.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-5172.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-35334.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2=
025-13946.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.12.bb =3D> postgres=
ql_16.14.bb} (86%)
 rename meta-oe/recipes-devtools/php/{php_8.2.30.bb =3D> php_8.2.31.bb} (=
99%)
 create mode 100644 meta-oe/recipes-shells/dash/dash/CVE-2026-31323.patch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.pa=
tch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.pa=
tch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patc=
h
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2026-2781.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-backports=
-zstd/0001-pyproject.toml-make-license-entries-compatible-with-.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-backports=
-zstd/0002-pyprojects.toml-lower-setuptools-requirements.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-backports=
-zstd_1.5.0.bb
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb =3D> apac=
he2_2.4.67.bb} (99%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-40701.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42934.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42945.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42946-01.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42946-02.patch

--=20
2.54.0


