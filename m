Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398E3CD6E55
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 13:08:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23441.1763039332579793823
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 05:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Jp5PQCmE;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fvNsQ36F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD6qZK83873378
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 13:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LmugGDO8/qnsCxOcFZW9odhp119Q+flLpaJ
	k/DySXT4=; b=Jp5PQCmEsB4mFpfZTCqHPxRhmyvsTAOi2QKSDRbIRqRuTjov7WO
	KdxOlTiDE3ndTqEwxqD6Zmpkm8hjRbuCYVbfeU5aq72wFewTpAUg45jUFTtl/Wqg
	I2ZzPdk0HuDV8O23OilYLm0Jh8ISxN1B0ay3uGMBr8tjpTgHBFKzUeuYvnsFOsw7
	UZwVi70bl7kCBkmBooFHWRQF+dz8w9DlNUj+JUDqgnMyEo/U1bRMV1ORmHFG3R9t
	4GAUMoVInXaUkBzzB343U8xYUU8R50ylli7EP2K4VkRWREnyw2Ha0jNuGQvgw3rP
	puvf+lanIBcZE50x98xKVn70VFbFT6ezKww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaeus3mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 13:08:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so675027b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 05:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763039331; x=1763644131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmugGDO8/qnsCxOcFZW9odhp119Q+flLpaJk/DySXT4=;
        b=fvNsQ36F9GJGcumi44XsA8AAd6HdRA8ktuQDVDsEz+GxAcRyc2Wx1gm4OngRhGVYcj
         CYs7ZfEd91dtjxFXLR63yidhcO1if6imtPe8AaQwDuNVgGeedbD2ObfwAmeNajlW/OWW
         gmdSRgFU7LTdx3ccg9YmUGcFso9ruFL51NEOUt2XcJHBXhUmpOk/GsbSPmzLOHsFsK+B
         kKEW+Rbj82mgz3EF4BZUPiXGKIcbIpu+c2OUSCtllT+Qc489Mg5vj7D9sY7befBBs9C2
         DCw9wchAtPtzNKDaMBloCP/J8XS225wo/fJJtQ278gh/R6ZhvCfpfwp+plpMmLFOkKwI
         iCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039331; x=1763644131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmugGDO8/qnsCxOcFZW9odhp119Q+flLpaJk/DySXT4=;
        b=bJn0+RijehsaiNYZ+mm7kQQ+X4L0TezYLerfNHZHu7iqANxG84omO4j7ZonzM7dp+e
         hj8uTLUp+bEYrkK81cE6zLLy7wyAfuR0RddQx3s854mUzL52ZScV2XtTEINTH+29VChc
         mvdZbJYNAFbBSds8bnvwwqUbqOnmouQuOVQVhukoqrI0G/lJV3u1o3Ar7xvXcASfLTa9
         xqSVw8/Lhrh2Hr6aJ8+Ztbc/i75r8Cwu8rroiUzLU2Qcy7lKvdBQjPJJv/dxOsMTwAIx
         ohf27PtM0dWGffZIM+uXWzGPA7lZzqlj6lkefPyMuBvKdLFnYOPs444IzIp1lYSx7ynH
         XcCA==
X-Forwarded-Encrypted: i=1; AJvYcCWL0lnopp/LX6fIcX4FHL9vAJ/w+/mjPKlxDBA+He/Qkf5i57Url2Cu9VvVrcsoAp3vULM++OAZnUOyJLeNn8yHrN4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxL+fV4T9UNeXmkCH+uofbOiN3cn24LSMSYvG7w2gf6iy300gM5
	vJ9bNL+qXHDB+HNZqQqQSku5eX23pdsOw4Qq+vvh0d7j+claB1t6v3NLCiSXmBEtnNXzosrqkXc
	EsX+l8mKViXZ8g+hl0wT6OSU76aqzVSe7+RJ1KcngPIgXHBf7Os8PfSD05rD1nDFgiFEqGKqDes
	W8qKtbmGk9
X-Gm-Gg: ASbGnctSvqxpgVvjZQjzix6w3TyvoZT5w16xAmzxeOrI5GSlkvhnNGqXcuCTumuugzI
	diN/iV7lCcnO/M821ESFMi+RwNMDwXBkWgKQn31KQxy4o4HpFx3SpblZtfW2NUnrJvp8VyYMXu3
	KwytpQD7ATCfGD+qDL8GxfOzkI+gSD3yUSbOJ57YE7R3ILIO2aw/dYvoseFSYmuz9l4Jeo7RaJx
	lgF+XHDoW4lVkkB0pa+uMxoye+njFhaQvX9gf0tMe/obRcwa2fvsVf9xqVoBEDdmyxCLNKNAxWw
	UTESOVwU0A7Dgkb2AnITzfp5yA4STsKitoMgKW5KnO5J7wF0v11YIzpsSMl2z5Zn9JdN6J9XJAu
	YvvwMb5fxEr3P+Re2itTtOLD2aYWKhg==
X-Received: by 2002:aa7:888e:0:b0:7a4:2336:a115 with SMTP id d2e1a72fcca58-7b7a50d0d14mr7766359b3a.27.1763039331081;
        Thu, 13 Nov 2025 05:08:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPWA9CF/Kx3fedq9q/gqx0uhPYIPkOWERyxG+Uatm0Ab2rpUA481LMssPk8oJNoPyWjkKsjw==
X-Received: by 2002:aa7:888e:0:b0:7a4:2336:a115 with SMTP id d2e1a72fcca58-7b7a50d0d14mr7766320b3a.27.1763039330404;
        Thu, 13 Nov 2025 05:08:50 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b921cb6f44sm2372106b3a.0.2025.11.13.05.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:08:50 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/59] Scarthgap pull request
Date: Thu, 13 Nov 2025 18:38:39 +0530
Message-ID: <cover.1763038144.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yPqW4Zgxua3ST96UZ_WyMjfIy6wZWh9m
X-Proofpoint-GUID: yPqW4Zgxua3ST96UZ_WyMjfIy6wZWh9m
X-Authority-Analysis: v=2.4 cv=JPI2csKb c=1 sm=1 tr=0 ts=6915d863 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=jcyPE0zk5MEBGzWWyvsA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5OSBTYWx0ZWRfX3nJ4CSbcKShu
 n9zttq0Qjtx/nZKtNQAkWp8kFJgzdI6rPWJK928z3Tm7VM4SvFiLYRoE6h6aFSFMQO8Ow3+g9Yx
 fQUajyFBc9pqnARBdsor10oC187UgIqZF4YPfEAkACdaW18AIEvqMJaOh4lF0Onyxcy3lYRvp4I
 UEk7b3cRD+RVkp8AVrEbfdyMm+uPbTslCOqKJ/VdPGPcan8+3ledxZqm8O7Rgif8XFFgLmzO9dZ
 H/Iuj8f9ZC6J6cLGzIZepCpiCERV6KmC+PEW0ZRAevRkn84pwoT7pAX/CAGvH2V43iUv6aT+74N
 KXIgFePd3TkhkgYLCDuYvo/2aDhkOzTa7J62XMVjpMy58ELEK0iRDr6vtoNdVvbMaHBmIDSLYuK
 ukHf3J5Mqa4xVCdUQ0cSZM6UdziPXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 13:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121650

Please merge these changes for scarthgap. Tested on autobuilder and
locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1075

My access to contrib has not been set up correctly yet so this is
currently on GitHub. Sorry about this.

The following changes since commit 15e18246dd0c0585cd1515a0be8ee5e2016d1329:

  python3-django: upgrade 4.2.18 -> 4.2.20 (2025-10-30 15:13:43 +0800)

are available in the Git repository at:

  https://github.com/anujm1/meta-openembedded anujm/scarthgap
  https://github.com/anujm1/meta-openembedded/tree/anujm/scarthgap

Anil Dongare (2):
  python3-django 5.0.11: ignore CVE-2025-27556
  python3-django 5.0.11: Fix CVE-2025-26699

Ankur Tyagi (9):
  neatvnc: upgrade 0.8.0 -> 0.8.1
  mercurial: set CVE_PRODUCT to "mercurial-scm:mercurial"
  postfix: upgrade 3.8.9 -> 3.8.12
  proftpd: upgrade 1.3.7c -> 1.3.7f
  iscsi-initiator-utils: upgrade 2.1.8 -> 2.1.9
  arno-iptables-firewall: upgrade 2.1.1 -> 2.1.1a
  frr: upgrade 9.1 -> 9.1.3
  freeradius: upgrade 3.2.5 -> 3.2.6
  squid: upgrade 6.12 -> 6.14

Chaitanya Vadrevu (1):
  samba: Run populate-volatile.sh update in postinst

Etienne Cordonnier (1):
  fsverity-utils: fix SRC_URI

Gianfranco Costamagna (1):
  mosquitto: bump to 2.0.22

Gyorgy Sarvari (24):
  pyxdg: update SRC_URI
  libvdpau: update SRC_URI
  pcp: update SRC_URI
  zabbix: fix SRC_URI
  zabbix: upgrade 6.2.7 -> 6.2.9
  xf86-video-armsoc: fix SRC_URI
  netsniff-ng: fix SRC_URI branch
  spriv-shader-generator: fix SRC_URI branch
  xmlsec1: fix SRC_URI
  gnome-chess: fix SRC_URI branch
  http-parser: fix SRC_URI branch
  breakpad: correct SRC_URI branch
  hiawatha: fix SRC_URI
  transmission: update SRC_URI branch
  smarty: fix SRC_URI branch
  id3lib: update remote patch SRC_URI
  wifi-test-suite: correct SRC_URI
  python3-behave: update SRC_URI branch
  iksemel: fix SRC_URI branch
  consolation: fix SRC_URI protocol
  ncftp: fix SRC_URI
  cmpi-bindings: fix SRC_URI branch
  mbedtls: update SRC_URI branch
  unbound: fix SRC_URI

Khem Raj (2):
  unicode-ucd: Updates due to license.txt updates
  unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts

Leonard Anderweit (1):
  cockpit: fix build error

Louis Rannou (1):
  mosquitto: bump to 2.0.21

Martin Schwan (1):
  kronosnet: Fetch version tag with BB_GIT_SHALLOW_EXTRA_REFS

Patrick Vogelaar (1):
  unbound: patch CVE-2024-33655 and CVE-2025-11411

Paul Le Guen de Kerneizon (1):
  cockpit: remove deprecated packages

Peter Marko (4):
  hostapd: patch CVE-2022-37660
  squid: Upgrade to 6.10
  squid: upgrade 6.10 -> 6.12
  squid: download from github

Randolph Sapp (1):
  glm: add nativesdk to BBCLASSEXTEND

Ross Burton (1):
  pureftp: fix autoreconf

Vijay Anusuri (3):
  libssh: Fix CVE-2025-8277
  wireshark: Upgrade 4.2.12 -> 4.2.14
  wireshark: Fix CVE-2025-9817

Wang Mingyu (1):
  pure-ftpd: upgrade 1.0.51 -> 1.0.52

Yi Zhao (4):
  libldb: upgrade 2.8.1 -> 2.8.2
  samba: upgrade 4.19.8 -> 4.19.9
  postfix: upgrade 3.8.6 -> 3.8.9
  yaffs2-utils: update SRC_URI

 .../yaffs2/yaffs2-utils_git.bb                |   3 +-
 .../gnome-chess/gnome-chess_46.0.bb           |   2 +-
 .../0008-libtool-do-not-use-jlibtool.patch    | 105 ++-
 ...reeradius_3.2.5.bb => freeradius_3.2.6.bb} |   2 +-
 .../mbedtls/mbedtls_2.28.10.bb                |   2 +-
 .../mosquitto/files/2895.patch                |  17 +-
 ...osquitto_2.0.20.bb => mosquitto_2.0.22.bb} |   2 +-
 .../{samba_4.19.8.bb => samba_4.19.9.bb}      |   8 +-
 ....1.8.bb => iscsi-initiator-utils_2.1.9.bb} |   2 +-
 .../recipes-daemons/ncftp/ncftp_3.2.7.bb      |   4 +-
 ...0006-postfix-add-preliminary-setting.patch |  31 -
 .../{postfix_3.8.6.bb => postfix_3.8.12.bb}   |   3 +-
 .../{proftpd_1.3.7c.bb => proftpd_1.3.7f.bb}  |   2 +-
 .../pure-ftpd/pure-ftpd/nostrip.patch         |   7 +-
 ...ure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} |   6 +-
 ...e-reference-to-nonexisting-directory.patch |  55 ++
 .../files/Skip-AC_RUN_IFELSE-tests.patch      |   2 +-
 .../squid/{squid_6.9.bb => squid_6.14.bb}     |  15 +-
 .../kronosnet/kronosnet_1.24.bb               |   2 +
 ....1.bb => arno-iptables-firewall_2.1.1a.bb} |   2 +-
 .../frr/frr/CVE-2024-31948.patch              | 130 ---
 .../frr/frr/CVE-2024-31949.patch              | 163 ----
 .../frr/frr/CVE-2024-31950.patch              |  68 --
 .../frr/frr/CVE-2024-31951.patch              | 110 ---
 .../frr/frr/CVE-2024-34088.patch              |  83 --
 .../frr/frr/CVE-2024-44070.patch              |  54 --
 .../frr/{frr_9.1.bb => frr_9.1.3.bb}          |   8 +-
 .../http-parser/http-parser_2.9.4.bb          |   2 +-
 .../{libldb_2.8.1.bb => libldb_2.8.2.bb}      |   4 +-
 .../netsniff-ng/netsniff-ng_0.6.8.bb          |   2 +-
 .../unbound/unbound/CVE-2024-33655.patch      | 792 ++++++++++++++++++
 .../unbound/unbound/CVE-2025-11411.patch      |  48 ++
 .../recipes-support/unbound/unbound_1.19.3.bb |   4 +-
 .../wireshark/files/CVE-2025-9817.patch       |  32 +
 ...ireshark_4.2.12.bb => wireshark_4.2.14.bb} |   3 +-
 .../hostapd/hostapd/CVE-2022-37660-01.patch   | 249 ++++++
 .../hostapd/hostapd/CVE-2022-37660-02.patch   | 111 +++
 .../hostapd/hostapd/CVE-2022-37660-03.patch   | 762 +++++++++++++++++
 .../hostapd/hostapd/CVE-2022-37660-04.patch   |  85 ++
 .../hostapd/hostapd_2.10.bb                   |   4 +
 .../transmission/transmission_git.bb          |   2 +-
 .../wifi-test-suite_10.10.1.bb                |   2 +-
 .../{zabbix_6.2.7.bb => zabbix_6.2.9.bb}      |   4 +-
 .../fsverity-utils/fsverity-utils_1.5.bb      |   2 +-
 .../breakpad/breakpad_2023.06.01.bb           |   2 +-
 .../mercurial/mercurial_6.5.bb                |   1 +
 .../cmpi-bindings/cmpi-bindings_1.0.4.bb      |   2 +-
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb     |   2 +-
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb   |   2 +-
 .../{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb}    |   4 +-
 .../spir/spirv-shader-generator_git.bb        |   2 +-
 .../recipes-graphics/vdpau/libvdpau_1.5.bb    |   2 +-
 .../xorg-driver/xf86-video-armsoc_1.4.1.bb    |   2 +-
 .../recipes-multimedia/id3lib/id3lib_3.8.3.bb |   6 +-
 .../consolation/consolation_0.0.9.bb          |   2 +-
 .../recipes-support/iksemel/iksemel_1.5.bb    |   2 +-
 .../libssh/libssh/CVE-2025-8277-1.patch       |  40 +
 .../libssh/libssh/CVE-2025-8277-2.patch       |  94 +++
 .../libssh/libssh/CVE-2025-8277-3.patch       |  48 ++
 .../libssh/libssh/CVE-2025-8277-4.patch       |  48 ++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   4 +
 meta-oe/recipes-support/pcp/pcp.inc           |   6 +-
 .../recipes-support/smarty/smarty_4.4.1.bb    |   2 +-
 .../unicode-ucd/unicode-ucd_14.0.0.bb         |   6 +-
 .../recipes-support/xmlsec1/xmlsec1_1.3.4.bb  |   2 +-
 .../python/python3-behave_1.2.6.bb            |   2 +-
 .../python3-django/CVE-2025-26699.patch       | 100 +++
 .../python/python3-django_5.0.11.bb           |   5 +
 .../recipes-httpd/hiawatha/hiawatha_10.12.bb  |   2 +-
 .../recipes-webadmin/cockpit/cockpit_304.bb   |  11 +-
 ...sing-src-common-directory-in-build-t.patch |  32 +
 71 files changed, 2681 insertions(+), 746 deletions(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.5.bb => freeradius_3.2.6.bb} (99%)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.20.bb => mosquitto_2.0.22.bb} (97%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.8.bb => samba_4.19.9.bb} (98%)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.8.bb => iscsi-initiator-utils_2.1.9.bb} (98%)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.6.bb => postfix_3.8.12.bb} (98%)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.7c.bb => proftpd_1.3.7f.bb} (99%)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} (79%)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
 rename meta-networking/recipes-daemons/squid/{squid_6.9.bb => squid_6.14.bb} (91%)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.1.1.bb => arno-iptables-firewall_2.1.1a.bb} (97%)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
 rename meta-networking/recipes-protocols/frr/{frr_9.1.bb => frr_9.1.3.bb} (94%)
 rename meta-networking/recipes-support/libldb/{libldb_2.8.1.bb => libldb_2.8.2.bb} (95%)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-33655.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-11411.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.12.bb => wireshark_4.2.14.bb} (96%)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-01.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-02.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-03.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-04.patch
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.7.bb => zabbix_6.2.9.bb} (94%)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb} (89%)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
 create mode 100644 meta-webserver/recipes-webadmin/cockpit/files/0001-build-Create-missing-src-common-directory-in-build-t.patch

-- 
2.51.2


