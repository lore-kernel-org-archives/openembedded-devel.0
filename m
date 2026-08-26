Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0702BC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 10:10:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9235.1787739004772322884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 03:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mO9Kp47z;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=aeVHsvBb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CnXn4169962
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oULkNFa3XsloACslbA71gE9xUOqWHC3FSMI
	77PpziFg=; b=mO9Kp47zZDEd0oLoEnGp17B+BkHMIWlV80Mfjz2Qc5Enmtf1eXh
	eEuRc0XhDqLhIAmEUAo9qcUTWesbDkrsIfXpgJa3gsewbGnVWWMgfwJ3NZcNbuNG
	/rC1vDKITTua0u0cxhsFDBbL/H0WHfcP2+qEKULhHjZwVIpfBWZkybzVWM6aE0ey
	1B8pJlQLjZAfUM6k6N9YxVIpQnbLBgcHvMGCaQadJqd/NLZ/f7Gych7LqVFHXgx9
	3qE9JS7pV+ZLepOfAjy9O+Ax79he9Rign2ApmOR/tLkebaUNoXcTioOcELNBqmQi
	x4ZhvhBT12EqZBQOxuzL/+cNfmWFJvaqoUA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx985w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 10:10:03 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f1ddcd241aso1805814a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739003; x=1788343803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oULkNFa3XsloACslbA71gE9xUOqWHC3FSMI77PpziFg=;
        b=aeVHsvBbjDWIaDlrMCvXYSzuOmYJokaSYMhEROUyG/dp0QWdboyLTDClGnvShsSA3r
         f5oMgPImMwMpki8Y0wVSpWVTxZ85y1q/KOhUGlrumOP2FwoKUX0tduPq/QoNY8D39wy/
         89iHRwldIG6WbtW0rb6nTQ8rP/ofQw8b639ByHiy5zjgx3/Z7aBDmCXCbE872SKVx6q/
         Y3Fiu1WDme/SOGji9vsibSzfZtW20aVAufBYJQO89b1KyM4DhAZo6gzvMSjqMzE2A7j/
         lTUpQl4u277aE52DAsEgzoOveh9tX36BL4ycrr6KDo+3wQGuED7NIi9oS6s0j6Kj3dKi
         qklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739003; x=1788343803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oULkNFa3XsloACslbA71gE9xUOqWHC3FSMI77PpziFg=;
        b=ZLai7l/OfWNYM3DwS85B4eMWNHonZ1d+MkLpBHzlVXscwH9OSJvKE4Nv8z0uvRny4i
         WArcuDuVifkt7N+x1iV/+s0ukOmGzKPAMLfqofrL76/CjcN/hIxHjj+hvfLAurO/2wlk
         UnLRLhL+PK1iphPvk0mX3y52fY91q2iLH+vllNICdlGDlfvZyAgpxe2aW1UshRGAmLxR
         gVO2l2k2CwWRrnndjg71YYLwi3sh6CRHiwpxk/tgnciPkAYNTNgBqIhMpGGCpVuHTNgb
         7DCwL8ITqpf9wQn5Hx1WMlt9z9N4ldrXYhSRuzuTbbG2AgJ1Ynu0I6gjWzP+yvaGutlt
         3jtQ==
X-Gm-Message-State: AFuF++lsre9gq1ly4A52IG32Zoqhx9xTw7VBSi4NlynaIRDlorREZEA/
	/QPKrUtXllHTHjnrxGIyQhStbNRZzWNQhgdoHpIDgfwAZjR8yN/ujtF7CagKzNwjBYTWYsmW7CI
	3Q82f89xBZvKiuTJbncbaOy8dXN/4oZ2tsrngx5c+lxExiFXlZVw2Y1e2SdAjVwFGDH/zT2AX6r
	zxSUcHI1t8ueOo35cL9yL31w==
X-Gm-Gg: AR+sD102Nu9Q8LgCxC7THcKslOTYKIlA00eCSZcp4HBJJSXqGxdhGMlXhfsOT4mLWFk
	KbZQQDEdVZyZMqBaRSGOu2sqCrMeRgWaUXt+NN58z2esxd+tCZfJtoFejnlGAVdSXcCMzE80ZyF
	XRZ71LtqKtd4XpSAndKzMbBHEQK4MzmEKEYD+L67EPqkJrHlx7xhi1AD+2FIMAEqNPr4yN7nXg+
	WqT2K6wfsooDd1yWjrlsugjglI38Fo66Sg7Q7pNGxkTxTRgmPwx48KMu/JeOhgAT4E6qC2oOFk6
	ffazx+buLxQ14mT20PHPkeE3KOt1AkOxoFHl5ctvWs/SEKvlbAmwaZ7V1xnJmntxIysmY+7b+TT
	KKdGbOpumtKho5rE5rulYMfn44ixBCk4=
X-Received: by 2002:a05:6820:1608:b0:6b1:a0cf:85cc with SMTP id 006d021491bc7-6b1a0cfc4b2mr4336941eaf.36.1787739002965;
        Wed, 26 Aug 2026 03:10:02 -0700 (PDT)
X-Received: by 2002:a05:6820:1608:b0:6b1:a0cf:85cc with SMTP id 006d021491bc7-6b1a0cfc4b2mr4336899eaf.36.1787739002487;
        Wed, 26 Aug 2026 03:10:02 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9036c85sm6587606c88.9.2026.08.26.03.10.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:10:02 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/49] Wrynose pull request
Date: Wed, 26 Aug 2026 15:39:55 +0530
Message-ID: <cover.1787738715.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ebb7b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=22LGzVxxURoXJEoeUywA:9 a=EXS-LbY8YePsIyqnH6vw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: EPAD7RbafpdAnBsxqXi0lnhV5SvHJ70Z
X-Proofpoint-ORIG-GUID: EPAD7RbafpdAnBsxqXi0lnhV5SvHJ70Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfX0Q2GsLVvQeRx
 XuWr90jvjlEZQTeTdLhB5h1wuWU+Snekjg6Q6fT2Fx5Fd7ujeOLNcjm5T5wMpbRAsQ3e11gVgla
 JwoEv5ntsQsbyCaqp9OrX5yKZRafR8yvKpQJDmEIVi2PK+p6WCxvc0IjW3vYZwE+w8CaGLGRM8V
 iXtEAMRuOQ67jv7+NFlYr2fC+Uw3wEaQx1ieE3U6JV51kmTX+gvgha1ypOYKCMRV8zgXKFgHBG4
 I2bx//dZOzWisPuS9I8lMpGpPEi8VR5xxm9osk1nyuhVtPIHiI88z+LuRqwxtlUL7JKsR7xrho4
 DqoyasfKirnEXr9CmtBBWiBQWQuL/0Gn8kFCDVfLVvGAnLn1KejtpZd+zsEBqkgbNYdCXFlpWC5
 qic978uXM1TMirschly6Cp0oYC8+SETTx+f1kmiESxaFxGIyGzC/1GIzRagRD1vjJNUMPxlOt7R
 QPkdM6ZE/MPDID0YzuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfXxnqgy3ccscJ1
 XbF6uINUfvGeOnc0EqmdbLP9iGMkj3hbcn5IELB0+vo5ruUxmkRv7M5izZzkH/d7A09jPqa01xc
 ygcQze1dHMabCUnKY5K4ldbfwOx13xU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 10:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129516

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1749

The following changes since commit 6bf0d8ad57b33950bab4c7f6c037e1ccb6f6e2eb:

  sdbus-c++-libsystemd: add .git to github repository url (2026-08-07 08:21:30 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to 14282a02be9c74a1276a7cda7d6c89e054699a11:

  libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR scrubbing (2026-08-26 07:13:01 +0530)

----------------------------------------------------------------

Abhishek Bachiphale (1):
  poppler: fix CVE-2026-10118

Ankur Tyagi (12):
  mpd: fix build error with libupnp v1.14.30 onwards
  thin-provisioning-tools: upgrade 1.3.1 -> 1.3.3
  hiredis: upgrade 1.3.0 -> 1.3.1
  postfix: upgrade 3.10.12 -> 3.10.13
  firewalld: upgrade 2.2.1 -> 2.2.3
  file-roller: upgrade 44.5 -> 44.7
  gnome-software: upgrade 50.0 -> 50.3
  gdm: upgrade 50.1 -> 50.2
  gvfs: upgrade 1.60.1 -> 1.60.2
  cjose: upgrade 0.6.2.7 -> 0.6.2.8
  swagger-ui: upgrade 5.32.11 -> 5.32.12
  swagger-ui: upgrade 5.32.13 -> 5.32.14

Darsh Kelaiya (10):
  python3-aiohttp: fix CVE-2026-34993
  python3-aiohttp: fix CVE-2026-47265
  python3-aiohttp: fix CVE-2026-50269
  python3-aiohttp: fix CVE-2026-54274
  python3-aiohttp: fix CVE-2026-54275
  python3-aiohttp: fix CVE-2026-54276
  python3-aiohttp: fix CVE-2026-54277
  python3-aiohttp: fix CVE-2026-54278
  python3-aiohttp: fix CVE-2026-54279
  python3-aiohttp: fix CVE-2026-54280

Deepak Rathore (1):
  redis: avoid LTO for clang builds

Devansh Patel (3):
  python3-filelock: set CVE_PRODUCT
  python3-web3: add CVE_PRODUCT mapping
  python3-httplib2: correct CVE_PRODUCT mapping

Hetvi Thakar (9):
  python3-pyjwt: Fix CVE-2026-48522
  python3-pyjwt: Fix CVE-2026-48523
  python3-pyjwt: Fix CVE-2026-48524
  python3-pyjwt: Fix CVE-2026-48525
  python3-pyjwt: Fix CVE-2026-48526
  python3-twisted: Fix CVE-2026-42304
  python3-ujson: Fix CVE-2026-54911
  python3-web3: Fix CVE-2026-40072
  libssh: upgrade 0.11.4 -> 0.11.5

Khem Raj (4):
  libsdl3-image: upgrade 3.4.2 -> 3.4.4
  python3-psycopg: upgrade 3.3.3 -> 3.3.4
  samba: upgrade 4.23.8 -> 4.23.11
  libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR
    scrubbing

Omkar Patil (1):
  openvpn: fix CVE-2026-13117

Preeti Sachan (1):
  libfastjson: fix rsyslogd segfault crash at load

Rouven Rastetter (1):
  vboxguestdrivers: Provide target kernel version

Tugrul Kukul (1):
  jq: fix CVE-2026-39956

Vijay Anusuri (1):
  giflib: Fix CVE-2026-26740

Wang Mingyu (4):
  python3-httplib2: upgrade 0.31.2 -> 0.32.0
  libsdl3: upgrade 3.4.4 -> 3.4.8
  gvfs: upgrade 1.60.0 -> 1.60.1
  swagger-ui: upgrade 5.32.12 -> 5.32.13

 ...ile-roller_44.5.bb => file-roller_44.7.bb} |   5 +-
 .../gdm/{gdm_50.1.bb => gdm_50.2.bb}          |   2 +-
 ...oftware_50.0.bb => gnome-software_50.3.bb} |   5 +-
 .../gvfs/{gvfs_1.60.0.bb => gvfs_1.60.2.bb}   |   2 +-
 .../musicpd/mpd/0001-upnp-allow-1.14.30.patch |  45 +
 .../recipes-multimedia/musicpd/mpd_0.24.9.bb  |   1 +
 ...{firewalld_2.2.1.bb => firewalld_2.2.3.bb} |   2 +-
 .../{samba_4.23.8.bb => samba_4.23.11.bb}     |   2 +-
 ...{postfix_3.10.12.bb => postfix_3.10.13.bb} |   2 +-
 .../openvpn/openvpn/CVE-2026-13117.patch      |  46 +
 .../recipes-support/openvpn/openvpn_2.7.0.bb  |   1 +
 .../giflib/giflib/CVE-2026-26740.patch        |  40 +
 .../recipes-devtools/giflib/giflib_6.1.2.bb   |   1 +
 .../jq/jq/CVE-2026-39956.patch                |  55 ++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 ...copg_3.3.3.bb => python3-psycopg_3.3.4.bb} |   2 +-
 .../{hiredis_1.3.0.bb => hiredis_1.3.1.bb}    |   4 +-
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |   4 +
 .../rsyslog/libfastjson_1.2304.0.bb           |   1 +
 ...-image_3.4.2.bb => libsdl3-image_3.4.4.bb} |   2 +-
 .../{libsdl3_3.4.4.bb => libsdl3_3.4.8.bb}    |   2 +-
 .../{cjose_0.6.2.7.bb => cjose_0.6.2.8.bb}    |   2 +-
 .../{libssh_0.11.4.bb => libssh_0.11.5.bb}    |   4 +-
 .../poppler/poppler/CVE-2026-10118.patch      |  46 +
 .../poppler/poppler_25.12.0.bb                |   1 +
 .../thin-provisioning-tools-crates.inc        | 196 ++--
 ....1.bb => thin-provisioning-tools_1.3.3.bb} |   2 +-
 .../vboxguestdrivers_7.2.8.bb                 |   4 +-
 .../libhtml/libhtml-tree-perl_5.07.bb         |   7 -
 .../libmodule-build-tiny-perl_0.048.bb        |   7 -
 .../python/files/CVE-2026-40072.patch         | 861 ++++++++++++++++++
 .../python/files/CVE-2026-42304_p1.patch      | 299 ++++++
 .../python/files/CVE-2026-42304_p2.patch      |  30 +
 .../python/files/CVE-2026-42304_p3.patch      |  33 +
 .../python/files/CVE-2026-42304_p4.patch      | 318 +++++++
 .../python/files/CVE-2026-42304_p5.patch      | 218 +++++
 .../python/files/CVE-2026-42304_p6.patch      |  23 +
 .../python/files/CVE-2026-48522.patch         | 126 +++
 .../python/files/CVE-2026-48523.patch         | 115 +++
 .../python/files/CVE-2026-48524.patch         | 125 +++
 .../python/files/CVE-2026-48525.patch         | 146 +++
 .../python/files/CVE-2026-48526.patch         | 126 +++
 .../python3-aiohttp/CVE-2026-34993.patch      | 478 ++++++++++
 .../python3-aiohttp/CVE-2026-47265.patch      |  64 ++
 .../python3-aiohttp/CVE-2026-50269.patch      |  81 ++
 .../python3-aiohttp/CVE-2026-54274.patch      | 182 ++++
 .../python3-aiohttp/CVE-2026-54275.patch      | 115 +++
 .../python3-aiohttp/CVE-2026-54276.patch      | 287 ++++++
 .../python3-aiohttp/CVE-2026-54277.patch      | 249 +++++
 .../python3-aiohttp/CVE-2026-54278.patch      | 182 ++++
 .../python3-aiohttp/CVE-2026-54279.patch      | 295 ++++++
 .../python3-aiohttp/CVE-2026-54280.patch      | 138 +++
 .../python/python3-aiohttp_3.13.5.bb          |  13 +
 .../python/python3-filelock_3.25.2.bb         |   2 +
 ...2_0.31.2.bb => python3-httplib2_0.32.0.bb} |   4 +-
 .../python/python3-pyjwt_2.12.1.bb            |   7 +
 .../python/python3-twisted_25.5.0.bb          |   8 +
 .../python/python3-ujson/CVE-2026-54911.patch | 253 +++++
 .../python/python3-ujson_5.12.1.bb            |   2 +
 .../python/python3-web3_7.12.1.bb             |   3 +
 ...er-ui_5.32.11.bb => swagger-ui_5.32.14.bb} |   4 +-
 61 files changed, 5161 insertions(+), 120 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.5.bb => file-roller_44.7.bb} (82%)
 rename meta-gnome/recipes-gnome/gdm/{gdm_50.1.bb => gdm_50.2.bb} (96%)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_50.0.bb => gnome-software_50.3.bb} (86%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.60.0.bb => gvfs_1.60.2.bb} (97%)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-upnp-allow-1.14.30.patch
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/{firewalld_2.2.1.bb => firewalld_2.2.3.bb} (99%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.23.8.bb => samba_4.23.11.bb} (99%)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.12.bb => postfix_3.10.13.bb} (99%)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.3.bb => python3-psycopg_3.3.4.bb} (85%)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.3.0.bb => hiredis_1.3.1.bb} (91%)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.4.2.bb => libsdl3-image_3.4.4.bb} (90%)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.4.bb => libsdl3_3.4.8.bb} (97%)
 rename meta-oe/recipes-support/cjose/{cjose_0.6.2.7.bb => cjose_0.6.2.8.bb} (88%)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.4.bb => libssh_0.11.5.bb} (90%)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-10118.patch
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_1.3.1.bb => thin-provisioning-tools_1.3.3.bb} (97%)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-40072.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p4.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p5.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p6.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48522.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48523.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48524.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48525.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48526.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54276.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54280.patch
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.31.2.bb => python3-httplib2_0.32.0.bb} (76%)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.11.bb => swagger-ui_5.32.14.bb} (85%)

-- 
2.54.0


