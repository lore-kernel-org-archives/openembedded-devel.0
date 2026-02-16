Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D86E7BD81
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 09:55:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16606.1771235706113574153
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 01:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mlVeINYV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IYiM22t9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G96W4m1371898
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 09:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fIx3ARX6EIEOIaa4b2T7St
	hEK2SP2u5/0nlwllgC8nw=; b=mlVeINYVWbJUD2K/ma2TXp6uFwSkWfNTabPZLd
	Fdg5EguLVP3ODJosrfmyef+U8cQ24Dbi7K2/Mywpj67RBFHMXTFWCPLjrbSvHKPQ
	TLymNAONFPfiBFMZZhNnZ7Xvw7Q6+6k3zG00ZbJKtbkfbEf97FGIt4z1w5BMXvuj
	4p51qH2pxuKn6dognm+BFmReBYbSp5sIV4ksNif+3HEbHLzm1YzP8D06UR1fAbbl
	rnCH0GuxEtsbHp5WaDIvhyIu5H9DTCdFUys7Dr31F42yD1yOXOM1EgkGGN1B29bG
	qpnYTPcLZp72hPpPWWw/X+VlCOVWAwmhAgpl6JRwbDtyxWMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujd04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 09:55:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aaf0dbd073so35515535ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771235705; x=1771840505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIx3ARX6EIEOIaa4b2T7SthEK2SP2u5/0nlwllgC8nw=;
        b=IYiM22t97CKUvnyDj7zlj3c95jQt8zT7etXLgcf8m6QVuL9lwogKEeijc5XPDvuw4I
         2wRyP8LZ6Wra/IDI1ra1xi7Q6psm65RKH+oChBWsdLJzu4bGxd6EfMMZqs/OeUanhCOX
         BHfk2W7DVdnLU6qJdaOeKyTDF7auThCavqfGSOm+/swtpd6WnsKC/wEJ6yO0XrRtwDUa
         BT+w6QQrqs9yoIJWHQlWKkXNoJmxDFm7sShM2uV6eqgD9zSqBTuGuQCKcagZATD4Izk7
         /xQ40GpMlOlj27Ije1lD8FKFddIphmX4nlYKlcNmsJwW/ZHYBWrTIXPXlOa6FSrPitBk
         cScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771235705; x=1771840505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIx3ARX6EIEOIaa4b2T7SthEK2SP2u5/0nlwllgC8nw=;
        b=fYTX5eelmwy+V55blwqVocDd1znpTZuwts1za/hBv+L5hN5Ug0zy0XDqjqvEgOqrAH
         lqSxhlMvk85x948fLdCkM1EFRfHHwU/MZ+kyewnlKcG/PQj9chI6KS/ndaqgNyi0NGdJ
         xIZDKna9Bc7tOqKQDBMR2QkJhezaAtO7OTGc22g7iYA/v+cQLYYdwzvOhjn4CDL+Oph7
         aLFFaMkynzSO5MI4Ztkc3X0vQBq+2KEPjDmwPU5yxbK+WgRKi/6gNE/IMzqNme+cFrLN
         CyIL/8Jw/QQptT9TipXlKQu333AXkI5kzMDb1oQgogFGO15zUVBDmaJHE0OX54ebQRRm
         SOBQ==
X-Gm-Message-State: AOJu0YzfvorN2+lvwy28Oc1hotyYTyzqDHobOAU7f9TKtFRT4OsLN7GI
	0MizFJJyqgZxjYhexb1VWbW4w+2QiZzu7NYk17sfPf3UiEB94Y4XuC4LZ3khih4KfgokcNEpMB6
	C+Ds1LaH1eQi6pbTre3iNBVvpdxRAV/FJWJ/Z00SCWCN8TTKJSAktTivnxuOQekZFKEGbX7rMui
	YRp0KnJjKbJq4hxo70JF8=
X-Gm-Gg: AZuq6aLt6Ad9ZGBb8TMccynklaaxspJy11UFuTS41IWgAdzNfHZsptMlI9BZPkDpEkp
	mYHZ6bj1Ae0Y8h3o19rmSyY6Re/3Z1eKJE3tLWnEeXtw1KCDtqlRBtnIiqap3efgXKdtXLQFSaN
	skX7dtNo+Ks3Y8M43i0vnXljfNeV3pALhVIGdYXHuGPT9/msb+VpYFqxjMbLscaco+IA1jR2Rg2
	wuiRLTY1zm1LAzzbgmm143bIAf1ZRhn509TJgE3vkQ3f+1aK8BEGaUJWGbTXMO3eBa7b6kAGnjU
	fGTa24d6VbHsUW1ZWMcLkhpTluGvnt8FKpg5u/hqCw6OBiM7lcNiY/zJLkOWF0EiNhmVABeD/FX
	CKtH04Buk2WiyjxdNV4L3IR4cVs6+0fZ04WWApbdts+4dM8NsTUvO
X-Received: by 2002:a05:6a21:898c:b0:394:857c:7f41 with SMTP id adf61e73a8af0-394857c810emr5684792637.11.1771235704651;
        Mon, 16 Feb 2026 01:55:04 -0800 (PST)
X-Received: by 2002:a05:6a21:898c:b0:394:857c:7f41 with SMTP id adf61e73a8af0-394857c810emr5684769637.11.1771235703908;
        Mon, 16 Feb 2026 01:55:03 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e531e6de2sm6839563a12.22.2026.02.16.01.55.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:55:03 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/73] Scarthgap pull request
Date: Mon, 16 Feb 2026 15:24:55 +0530
Message-ID: <cover.1770970700.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -IAITnJDue6dFr21VZpbkJFlm1f-4-_3
X-Proofpoint-ORIG-GUID: -IAITnJDue6dFr21VZpbkJFlm1f-4-_3
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992e979 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=O24Aq5uEAAAA:8 a=cuDxENyusB1iaN8wD7sA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SYBONWESK5muIIdMMRMZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4MiBTYWx0ZWRfX+gPE9dw2S/HW
 Nm+hS2pecrHoaERZZsjjwcvp36GQa6eC4pr3F4wKhCs6Z6nKreJ5sQJOK33zl74C+bW+r0yvQGs
 UEfBFPEjjezZNmcPW8sYqD2KtMFkmIN79T7+v/ZfSUvcf0UNAHc7+TaByZ0/tyFvPt4Wa6lk1Tm
 6LUUKfHvXKTfUx4A0LYsB2++uRPiz/ekitoJqx0cWbkoA6ksGKD5jbC/0UIjhyEWedlqRDopTGu
 fFz7UyayH8NMDkSPsKID3AXZxJ3CltksBcfOO5uIXNmBWiH+M9Uah938fpyX7w2+/KdMIQJsUHU
 +0j+/MUq5BxWgSyz5gWgGwbgHU4Y+ur8spJdf5ieoLpg0IhWtiCXNPmz8A2mXWqA8EbvCPYiuhH
 O6uXfbluXiRRcc/hVvxGIxi4XoKZClB1Xxh2NL3qAfF/qq6dUPcbIvzZUG7Y77EpjqyXxrAx5nX
 XthUmmORyjyCj8yJzIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 09:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124412

Please merge these changes in scarthgap. Tested locally with
qemuarm/qemuarm64/qemux86-64 and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1305

The following changes since commit 7a5075cef77b5f7af454e9868e1d0019f2fd1394:

  gnome-keyring: set CVE_PRODUCT (2026-01-26 11:16:37 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Anil Dongare (2):
  php 8.2.29: Fix CVE-2025-14178
  php 8.2.29: Fix CVE-2025-14180

Gyorgy Sarvari (52):
  sox: patch CVE-2017-11332
  sox: patch CVE-2017-11358
  sox: patch CVE-2017-11359
  sox: patch CVE-2017-15370
  sox: patch CVE-2017-15371
  sox: patch CVE-2017-15372
  sox: patch CVE-2017-15642
  sox: patch CVE-2017-18189
  sox: mark CVE-2019-1010004 as patched
  sox: patch CVE-2019-13590
  sox: patch CVE-2019-8354
  tigervnc: sync xserver component with oe-core
  tigervnc: ignore CVE-2014-8241
  tigervnc: ignore CVE-2023-6377
  tigervnc: ignore CVE-2023-6478
  tigervnc: ignore CVE-2025-26594...26601
  fontforge: patch CVE-2025-15279
  fontforge: patch CVE-2025-15275
  fontforge: patch CVE-2025-15269
  fontforge: patch CVE-2025-15270
  ez-ipupdate: patch CVE-2003-0887
  freerdp: ignore CVE-2025-68118
  gimp: ignore CVE-2025-14423
  gnome-settings-daemon: ignore CVE-2024-38394
  imagemagick: patch CVE-2025-66628
  libcupsfilters: patch CVE-2025-64503
  mongodb: upgrade 4.4.29 -> 4.4.30
  mongodb: ignore CVE-2025-14911
  netdata: ignore CVE-2024-32019
  proftpd: ignore CVE-2021-47865
  python3-aiohttp: patch CVE-2025-69225
  python3-aiohttp: patch CVE-2025-69226
  python3-aiohttp: patch CVE-2025-69228
  python3-django: patch CVE-2025-64460
  raptor2: patch CVE-2024-57822 and CVE-2024-57823
  python3-tornado: mark CVE-2025-67725 patched
  python3-virtualenv: patch CVE-2026-22702
  gnome-desktop: upgrade 44.0 -> 44.4
  gtksourceview5: upgrade 5.12.0 -> 5.12.1
  gnuchess: upgrade 6.2.9 -> 6.2.11
  gnome-calculator: upgrade 46.0 -> 46.2
  gdm: upgrade 46.0 -> 46.2
  mutter: upgrade 46.1 -> 46.9
  mutter: fix profiler PACKAGECONFIG
  gnome-bluetooth: upgrade 46.0 -> 46.2
  gnome-shell-extensions: upgrade 46.1 -> 46.4
  nautilus: upgrade 45.1 -> 45.2.1
  gnome-tweaks: upgrade 40.0 -> 40.10
  tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched
  python3-django: upgrade 4.2.27 -> 4.2.28
  gnome-commander: upgrade 1.16.1 -> 1.16.2
  nodejs: upgrade 20.18.2 -> 20.20.0

Hitendra Prajapati (1):
  wireshark: fix for CVE-2026-0959

Hongxu Jia (1):
  nodejs: fix gcc compile failed for 32 bit arm target

Jan Vermaete (1):
  python3-protobuf: added python3-ctypes as RDEPENDS

Jason Schonberg (2):
  libmodule-build-tiny-perl: fix reference to TMPDIR
  Use https when accessing archive.xfce.org

Khem Raj (1):
  libgweather4: Upgrade to 4.4.4

Markus Volk (1):
  gnome-disk-utility: update 46.0 -> 46.1

Peter Marko (3):
  python3-m2crypto: workaround for swig issue with sys/types.h
  python3-protobuf: patch CVE-2026-0994
  gdm: add missing json-glib dependency

Tero Kinnunen (1):
  python3-watchdog: Remove obsolete dependencies

Wang Mingyu (7):
  tracker: upgrade 3.7.1 -> 3.7.2
  tracker: upgrade 3.7.2 -> 3.7.3
  tracker-miners: upgrade 3.7.1 -> 3.7.2
  tracker-miners: upgrade 3.7.2 -> 3.7.3
  gnome-keyring: upgrade 46.1 -> 46.2
  eog: upgrade 45.3 -> 45.4
  gnome-text-editor: upgrade 46.1 -> 46.3

alperak (1):
  python3-eventlet: switch to PEP-517 build backend

 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |   3 +-
 .../eog/{eog_45.3.bb => eog_45.4.bb}          |   2 +-
 .../gdm/{gdm_46.0.bb => gdm_46.2.bb}          |   3 +-
 ...etooth_46.0.bb => gnome-bluetooth_46.2.bb} |   2 +-
 ...lator_46.0.bb => gnome-calculator_46.2.bb} |   2 +-
 ...ve-register-storage-class-classifier.patch | 149 -------------
 .../{gnuchess_6.2.9.bb => gnuchess_6.2.11.bb} |   7 +-
 ...001-Build-fix-needed-with-taglib-2.0.patch |  37 ----
 ...er_1.16.1.bb => gnome-commander_1.16.2.bb} |   3 +-
 ...-desktop_44.0.bb => gnome-desktop_44.4.bb} |   2 +-
 ...ity_46.0.bb => gnome-disk-utility_46.1.bb} |   2 +-
 ...-keyring_46.1.bb => gnome-keyring_46.2.bb} |   2 +-
 .../gnome-settings-daemon_46.0.bb             |   2 +
 ...46.1.bb => gnome-shell-extensions_46.4.bb} |   2 +-
 ...itor_46.1.bb => gnome-text-editor_46.3.bb} |   2 +-
 ...eson-fix-invalid-positional-argument.patch |  33 ---
 ...e-tweaks_40.0.bb => gnome-tweaks_40.10.bb} |   3 +-
 ...ew5_5.12.0.bb => gtksourceview5_5.12.1.bb} |   2 +-
 ...eather4_4.4.2.bb => libgweather4_4.4.4.bb} |   8 +-
 ...-Dont-use-system-sysprof-dbus-folder.patch |  35 +++
 .../mutter/{mutter_46.1.bb => mutter_46.9.bb} |   4 +-
 .../{nautilus_45.1.bb => nautilus_45.2.1.bb}  |   7 +-
 ...to-a-fixed-path-instead-of-a-host-pa.patch |  15 +-
 .../0001-fix-reproducibility.patch            | 105 +++++----
 ...iners_3.7.1.bb => tracker-miners_3.7.3.bb} |   2 +-
 .../{tracker_3.7.1.bb => tracker_3.7.3.bb}    |   2 +-
 .../sox/sox/CVE-2017-11332.patch              |  28 +++
 .../sox/sox/CVE-2017-11358.patch              |  29 +++
 .../sox/sox/CVE-2017-11359.patch              |  30 +++
 .../sox/sox/CVE-2017-15370.patch              |  29 +++
 .../sox/sox/CVE-2017-15371.patch              |  40 ++++
 .../sox/sox/CVE-2017-15372.patch              | 100 +++++++++
 .../sox/sox/CVE-2017-15642.patch              |  35 +++
 .../sox/sox/CVE-2017-18189.patch              |  34 +++
 .../sox/sox/CVE-2019-13590.patch              |  34 +++
 .../sox/sox/CVE-2019-8354.patch               |  29 +++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  10 +
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb       |   7 +
 .../ez-ipupdate/files/CVE-2003-0887.patch     | 158 ++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
 .../wireshark/files/CVE-2026-0959.patch       |  65 ++++++
 .../wireshark/wireshark_4.2.14.bb             |   1 +
 .../recipes-dbs/mongodb/mongodb_git.bb        |   7 +-
 .../oe-npm-cache                              |   0
 ....18.bb => nodejs-oe-cache-native_20.20.bb} |   0
 ...e-running-gyp-files-for-bundled-deps.patch |  46 ----
 ...ert-stop-using-deprecated-ares_query.patch | 164 +++++++++++++++
 ...4-Do-not-use-mminimal-toc-with-clang.patch |  27 ++-
 .../0001-src-fix-build-with-GCC-15.patch      |  33 ---
 .../nodejs/nodejs/182d9c05e78.patch           | 182 ----------------
 .../nodejs/zlib-fix-pointer-alignment.patch   |  64 ------
 .../{nodejs_20.18.2.bb => nodejs_20.20.0.bb}  |  13 +-
 .../php/php/CVE-2025-14178.patch              |  65 ++++++
 .../php/php/CVE-2025-14180.patch              |  69 ++++++
 meta-oe/recipes-devtools/php/php_8.2.29.bb    |   2 +
 .../fontforge/fontforge/CVE-2025-15269.patch  |  35 +++
 .../fontforge/fontforge/CVE-2025-15270.patch  |  44 ++++
 .../fontforge/fontforge/CVE-2025-15275.patch  |  33 +++
 .../fontforge/CVE-2025-15279-1.patch          |  41 ++++
 .../fontforge/CVE-2025-15279-2.patch          |  34 +++
 .../fontforge/fontforge_20230101.bb           |   8 +-
 ...ncrease-supported-Xorg-version-to-1..patch |  29 +++
 ...server21.1.1.patch-Add-Xorg-21-patch.patch |  95 +++++++++
 .../files/0001-xvnc-adapt-for-1.21.patch      |  46 ++++
 .../tigervnc/tigervnc_1.11.0.bb               |  47 +++--
 .../cups/libcupsfilters/CVE-2025-64503.patch  |  45 ++++
 .../cups/libcupsfilters_2.0.0.bb              |  12 +-
 .../recipes-support/freerdp/freerdp_2.11.7.bb |   1 +
 .../imagemagick/CVE-2025-66628.patch          |  27 +++
 .../imagemagick/imagemagick_7.1.1.bb          |   1 +
 .../raptor2/raptor2/CVE-2024-57822.patch      |  44 ++++
 .../raptor2/raptor2/CVE-2024-57823.patch      |  31 +++
 .../recipes-support/raptor2/raptor2_2.0.16.bb |   2 +
 .../libmodule-build-tiny-perl_0.047.bb        |   7 +
 .../python3-aiohttp/CVE-2025-69225.patch      |  49 +++++
 .../python3-aiohttp/CVE-2025-69226.patch      | 134 ++++++++++++
 .../python3-aiohttp/CVE-2025-69228.patch      |  48 +++++
 .../python/python3-aiohttp_3.9.5.bb           |   7 +-
 .../0001-lower-setuptools-requirements.patch  |   0
 .../CVE-2025-64460.patch                      | 199 ++++++++++++++++++
 ...ngo_4.2.27.bb => python3-django_4.2.28.bb} |   2 +-
 .../python/python3-django_5.0.14.bb           |   1 +
 .../python/python3-eventlet_0.36.1.bb         |   4 +-
 .../python/python3-m2crypto_0.40.1.bb         |   5 +
 .../python3-protobuf/CVE-2026-0994.patch      |  47 +++++
 .../python/python3-protobuf_4.25.8.bb         |   3 +
 .../python3-tornado/CVE-2025-67726.patch      |   2 +-
 .../python3-virtualenv/CVE-2026-22702.patch   |  60 ++++++
 .../python/python3-virtualenv_20.25.3.bb      |   1 +
 .../python/python3-watchdog_4.0.0.bb          |   9 +-
 .../netdata/netdata_1.44.3.bb                 |   2 +
 meta-xfce/classes/thunar-plugin.bbclass       |   2 +-
 meta-xfce/classes/xfce-app.bbclass            |   2 +-
 meta-xfce/classes/xfce-panel-plugin.bbclass   |   2 +-
 meta-xfce/classes/xfce.bbclass                |   2 +-
 .../xfce4-panel-profiles_1.0.14.bb            |   2 +-
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb       |   2 +-
 .../vala/xfce4-vala_4.10.3.bb                 |   2 +-
 .../diskperf/xfce4-diskperf-plugin_2.7.0.bb   |   2 +-
 .../netload/xfce4-netload-plugin_1.4.1.bb     |   2 +-
 .../xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb |   2 +-
 101 files changed, 2210 insertions(+), 703 deletions(-)
 rename meta-gnome/recipes-gnome/eog/{eog_45.3.bb => eog_45.4.bb} (88%)
 rename meta-gnome/recipes-gnome/gdm/{gdm_46.0.bb => gdm_46.2.bb} (94%)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_46.0.bb => gnome-bluetooth_46.2.bb} (91%)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_46.0.bb => gnome-calculator_46.2.bb} (88%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
 rename meta-gnome/recipes-gnome/gnome-chess/{gnuchess_6.2.9.bb => gnuchess_6.2.11.bb} (55%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb} (86%)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb => gnome-desktop_44.4.bb} (92%)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_46.0.bb => gnome-disk-utility_46.1.bb} (91%)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_46.1.bb => gnome-keyring_46.2.bb} (94%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_46.1.bb => gnome-shell-extensions_46.4.bb} (84%)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_46.1.bb => gnome-text-editor_46.3.bb} (83%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
 rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_40.0.bb => gnome-tweaks_40.10.bb} (84%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.12.0.bb => gtksourceview5_5.12.1.bb} (91%)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.4.2.bb => libgweather4_4.4.4.bb} (75%)
 create mode 100644 meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
 rename meta-gnome/recipes-gnome/mutter/{mutter_46.1.bb => mutter_46.9.bb} (95%)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.1.bb => nautilus_45.2.1.bb} (81%)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.1.bb => tracker-miners_3.7.3.bb} (97%)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.1.bb => tracker_3.7.3.bb} (94%)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11358.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11359.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15370.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15372.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15642.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-8354.patch
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0959.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.18 => nodejs-oe-cache-20.20}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.18.bb => nodejs-oe-cache-native_20.20.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.18.2.bb => nodejs_20.20.0.bb} (95%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch
 rename meta-python/recipes-devtools/python/{python3-django-4.2.27 => python3-django-4.2.28}/0001-lower-setuptools-requirements.patch (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64460.patch
 rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb => python3-django_4.2.28.bb} (82%)
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch

-- 
2.53.0


