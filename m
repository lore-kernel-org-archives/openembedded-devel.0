Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16161.1794302588813090571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 01:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OHapw+3b;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ASt1J8CG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lCPC2770746
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pwzGb9JX6BaQF45FXkEHTL1Dw8yWCUCpzXE
	92LoxXUE=; b=OHapw+3buUR8YODYRXjp+D1FLfuWWrmlPrwhnkKpmSiCiOM2vSP
	VFZV5MVFMI2EJiu2DP4fDFYqS9tYJocfR6CvNZ/CCssy9ORf0efNzdK6XBHBC6pa
	nk1kQESm/GcsjaHPjb4tnCFfM0zAutd/BigTIGn7gwgkw9f9mou2W+w0jiDg+7x8
	YET1MGX2ccQs4jmOgS4rHPO3TiuCuMHMuTBVCJnkvpWG+VevyFw0XXFO/Dcw+9he
	j5PA7mOk3rKcQX3u7Llf7aj2nzJGg/rs8TAOU/GqxU0FiBupTcTdOMT5wqaJgTGx
	jd9bPIQyzK3NvhC1PFarRXIjFSuHfGKwBZg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd91bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:23:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so1894760c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 01:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302586; x=1794907386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwzGb9JX6BaQF45FXkEHTL1Dw8yWCUCpzXE92LoxXUE=;
        b=ASt1J8CGb5BloATnAx1/QkrCfyeaIx3SFBMty0bnWkXG+4ymRQRAW1d0EqKnJFDr9p
         p4GdDPv9++wZqvpoWe7y55wM6CZZwQrCLe59LVovyXHA+M4phN56FyyIU72y8SmIng2a
         /x03UVZ8CLmZP9y7Ota7c48o1UhQRO9aHhNT++sEVMLGSe5+kU55ukRf2VtQojMCmQ6M
         L4z5bq9dRI9bPGjJCHJNL1288r3f4XjTWogyZBgskNj4x5Fl1Mn7Nu+hMcXITZBoMjC0
         2N7plDZqh8lOfmG+zTBfduiH1wrS250+tyaa9uD/6hIRjZZz8vH/DmKrSSMO0VVzj+CC
         ROPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302586; x=1794907386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pwzGb9JX6BaQF45FXkEHTL1Dw8yWCUCpzXE92LoxXUE=;
        b=Brm01vp5zR+ZWPjiJAyw03Ux5in68IGjaDzhK6scTgQ56Rb+idmH/Nas1v9id7pdGW
         /aI/kjkdRQW9ro8/vaLKM9OUtzKUYW/CffJj/cbTjWQ+dp7Ux8O986V5ca9qGjBzNTbs
         ctv01b4Q+Q6aEKR9SGdf/vGYmcDVHpoGfH8w2vSWFsjCqnxf5/aHz5m8BLTyvJY6wo+A
         PjHbGTWgGWQMiCFPW2HsGAM8nnSjp5FWyvdGAF5SSnjlVkLEQw5zh5IFrOXxgyz3hJ7H
         BcT8YVNqj7hRM2Lnct5UjervM1iU7oS25FnHHtXxY395pOiI9TCN94INeHYFQBShKrMs
         hykA==
X-Gm-Message-State: APuU4Z9bdl0lgq9CMcM7zi6MKHfUDUq/uAGGJ9f38XW4+XlFc0Vrmog3
	PdQfEeWCdiSKESxl3SMsIx+OgoWCLMlXR158NImDzh8puk0Lu5yot7gaD7nZuQpHSdjXNKuiaFc
	5iv6LaWGcXtE00YSdyNdD+QmC9HTXIv6a4+3Q+Sf9Qn8vm/w8YBnylM2CJXtAtjhCDSRT6iFXH4
	Deq0WIKr4xtJ0lCNctW0kwlw==
X-Gm-Gg: AYBFou3sl1JhkD3ZZlfcIT7jbEHJjInbf5S6uHQkNiPh4oqHCoFZV0zA41kjiIUOAUc
	uhYCsq8twIQNSH8atXT0IsOM2O7QHYP7agT6ZiJJZjZ4W7d5GVKu4nr1JV87Tg2Hu/K1un5Uy2k
	AljzAkfhFc/nA3wHdcpR+oZ2PFFjSOCp2HWvHG+ojdrkDUlfSm+eMAGUPY9f8/qDLjeVEY230a+
	3f2GIClFep+oiimEpaws9m9EJZPPcV7DWmXyk1gBLf4fshEb3p8BH2zJKhwLcGPcGaJ4kOQFXOg
	7TSY2Gj6p/R//7R394Dz8zjmkq8CRa+D6DeTqWnFEMt447Ober9si39J6tx+RCFxtRyobmudGif
	7QRdfhtSnjtdLAGNOqZ+NrPlEwFdOzILyWfeRY1LC2/THmw6Ku2dT88jKyD9Tl5bXbKb9pvYdUg
	Zv0U1s
X-Received: by 2002:a05:701b:450f:10b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b3b6073d11mr2752058c88.16.1794302586067;
        Tue, 10 Nov 2026 01:23:06 -0800 (PST)
X-Received: by 2002:a05:701b:450f:10b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b3b6073d11mr2752005c88.16.1794302584844;
        Tue, 10 Nov 2026 01:23:04 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm5965703c88.1.2026.11.10.01.23.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:23:04 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/74] Wrynose pull request
Date: Tue, 10 Nov 2026 14:52:57 +0530
Message-ID: <cover.1794302275.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jsBvZf6CvkZGEXBlMtfqa1X22veeAJka
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX12Dtjob4Vwy+
 wcRBbAgEDnWiEqSRc3F7kdgjA7ESKcnyniHZuWlq9ZL1i8alzRmDAFo0KaeH0/6ZvI1U4WTo93G
 KYnRhxJYBbO8WhdUTm23puOxW/7galw=
X-Proofpoint-ORIG-GUID: jsBvZf6CvkZGEXBlMtfqa1X22veeAJka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXy2Kx59oWPVT/
 vQyb+kvrEyoVrVOGhg/n7uSIUdjcRP0TD/0Uo82q9sDSdlKMxNmqf8l9PPaI/JViaVCoHh3BV8s
 rA0VHfv4hYXlwT57OmPT7I4PUZCJMFhsMdkvI2X4rQKABCqBfVo9xXaOzyv0mlCL6j4kWBlKROL
 y4375bgUoiGtFsub2T7IcwXsSaqWGdlZyzhEUCsaZv6GKy0NOoTk0PuL03RF0E/9E3PaiZkX/Gy
 /Yy7FdZaSsYWE4t8uY1hdrz4BkgkJVjm5izQh/EeXMrUrzDcI+WWPaLQYrOBK3kwAQXNZzZ5uMu
 oTF1paQNSeCH+/iU5iu2ixEPkEy/nC4YHZ+cagczIvCndXa5Zr3w2qXgUBeaqUhAO7Tr+ITuogR
 Zl0mCYqKsWupy2r+SstddkjuSJckC0O89NQ7g+ron2k3u5TiV3fCabp56NuAAGFdJ7Uup3+i3kM
 tkXdSYQKuyeGIluM6Fw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2e27b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=CV4l_LIBgr3rokFX6SwA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132072
Content-Type: text/plain; charset="utf-8"

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1946

The following changes since commit c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e:

  frr: Fix native clippy failing to load libatomic.so.1 (2026-10-29 10:19:10 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to c0fcd7cca3760ef24e087ac4a31b8f357cb204da:

  pgpool2: 4.6.4 -> 4.6.6 (2026-11-09 11:17:15 +0530)

----------------------------------------------------------------

Ankur Tyagi (23):
  zchunk: upgrade 1.5.4 -> 1.5.5
  wireshark: upgrade 4.6.8 -> 4.6.9
  crow: upgrade 1.3.2 -> 1.3.3
  crow: upgrade 1.3.3 -> 1.3.4
  hdf5: patch CVE-2026-19026, CVE-2026-19027 and CVE-2026-19028
  hdf5: patch CVE-2026-19023 and CVE-2026-19024
  hdf5: patch CVE-2026-120689
  hdf5: patch CVE-2026-120754 and CVE-2026-120755
  hdf5: patch CVE-2026-120756
  hdf5: patch CVE-2026-120757
  hdf5: patch CVE-2026-120758
  libgphoto2: patch CVE-2026-120451
  libgphoto2: patch CVE-2026-120452
  smarty: upgrade 5.8.4 -> 5.8.5
  valkey: upgrade 9.0.6 -> 9.0.7
  uriparser: upgrade 1.0.2 -> 1.0.3
  python3-django: upgrade 6.0.9 -> 6.0.10
  python3-django: upgrade 5.2.18 -> 5.2.19
  mtr: patch CVE-2026-14461
  libvncserver: patch CVE-2026-44988
  libmspack: patch CVE-2026-110602
  ndpi: patch CVE-2026-116744
  ncp: ignore CVE-2025-14577 and CVE-2026-35087

Ashishkumar Parmar (1):
  nmap: Fix CVE-2026-72712

Darsh Kelaiya (10):
  libhtml-parser-perl: fix CVE-2026-8829
  ntfs-3g-ntfsprogs: fix CVE-2026-56135
  ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed
  python3-aiohttp: fix CVE-2026-111066
  python3-aiohttp: fix CVE-2026-111750
  python3-aiohttp: fix CVE-2026-111749
  python3-aiohttp: fix CVE-2026-111065
  python3-aiohttp: fix CVE-2026-111748
  python3-aiohttp: fix CVE-2026-111063
  python3-aiohttp: fix CVE-2026-111064

Hetvi Thakar (21):
  nginx: fix CVE-2026-95101
  nginx: fix CVE-2026-97629
  nginx: fix CVE-2026-15176
  python3-virtualenv: fix CVE-2026-102938
  python3-virtualenv: fix CVE-2026-102930
  python3-virtualenv: fix CVE-2026-102925
  python3-virtualenv: fix CVE-2026-113732
  python3-virtualenv: fix CVE-2026-113776
  python3-virtualenv: fix CVE-2026-113726
  python3-virtualenv: fix CVE-2026-113725
  python3-virtualenv: fix CVE-2026-113723
  python3-virtualenv: fix CVE-2026-113715
  python3-virtualenv: fix CVE-2026-113720
  python3-virtualenv: fix CVE-2026-113719
  python3-virtualenv: fix CVE-2026-113721
  python3-virtualenv: fix CVE-2026-113716
  python3-virtualenv: fix CVE-2026-113722
  python3-virtualenv: fix CVE-2026-113713
  python3-virtualenv: Ignore CVE-2026-102937
  python3-virtualenv: Ignore CVE-2026-113718
  python3-virtualenv: Ignore CVE-2026-113724

Jason Schonberg (1):
  nodejs: 22.23.3 -> 22.23.4

Khem Raj (3):
  fwupd-efi: Use the cross linker instead of the host ld.bfd
  clight: Fix build with musl
  fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE

Kris Gavvala (1):
  python3-pillow: patch CVE-2026-112393

Markus Volk (1):
  mpv: fix a file descriptor leak in the render API

Nate Kent (1):
  nng: correct upstream branch name

Peter Marko (1):
  libwebsockets: patch CVE-2026-114550

Poornima Lokesh (1):
  mariadb: upgrade 11.4.12 -> 11.4.13

Wang Mingyu (2):
  zchunk: upgrade 1.5.3 -> 1.5.4
  pgpool2: 4.6.4 -> 4.6.6

Yogita Urade (8):
  python3-tornado: Fix CVE-2026-103261
  python3-tornado: Fix CVE-2026-103262
  python3-tornado: Fix CVE-2026-103263
  python3-tornado: Fix CVE-2026-115927
  python3-tornado: Fix CVE-2026-116577
  python3-tornado: Fix CVE-2026-116578
  python3-pymongo: Fix CVE-2026-88029
  python3-pymongo: Fix CVE-2026-106435

 ...72_CVE-2026-42617_CVE-2026-56136_p1.patch} |    2 +-
 ...72_CVE-2026-42617_CVE-2026-56136_p2.patch} |    2 +-
 ...72_CVE-2026-42617_CVE-2026-56136_p3.patch} |    2 +-
 .../files/CVE-2026-56135_p1.patch             |  140 ++
 .../files/CVE-2026-56135_p2.patch             |   36 +
 .../files/CVE-2026-56135_p3.patch             |  203 +++
 .../files/CVE-2026-56135_p4.patch             |   94 ++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |   10 +-
 ...nclude-fcntl.h-for-open-and-O_-flags.patch |   27 +
 .../recipes-multimedia/clight/clight_4.11.bb  |    1 +
 .../recipes-connectivity/nanomsg/nng_1.11.bb  |    2 +-
 .../mtr/mtr/CVE-2026-14461.patch              |   32 +
 .../recipes-support/mtr/mtr_0.96.bb           |    4 +-
 .../recipes-support/ncp/ncp_1.2.4.bb          |    3 +
 .../ntopng/files/CVE-2026-116744.patch        |   33 +
 .../recipes-support/ntopng/ndpi_5.0.bb        |    1 +
 .../{pgpool2_4.6.4.bb => pgpool2_4.6.6.bb}    |    4 +-
 ...{wireshark_4.6.8.bb => wireshark_4.6.9.bb} |    2 +-
 meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb    |   10 +
 .../libwebsockets/CVE-2026-114550.patch       |   31 +
 .../libwebsockets/libwebsockets_4.5.8.bb      |    1 +
 ...e_11.4.12.bb => mariadb-native_11.4.13.bb} |    0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |    4 +-
 ...b11be28ae9b2432b2a661bf38a197cf9514d.patch |   52 -
 ...{mariadb_11.4.12.bb => mariadb_11.4.13.bb} |    0
 .../{nodejs_22.23.3.bb => nodejs_22.23.4.bb}  |    2 +-
 .../{valkey_9.0.6.bb => valkey_9.0.7.bb}      |    2 +-
 .../gphoto2/libgphoto2/CVE-2026-120451.patch  |   43 +
 .../gphoto2/libgphoto2/CVE-2026-120452.patch  |   40 +
 .../gphoto2/libgphoto2_2.5.33.bb              |    2 +
 .../libvncserver/CVE-2026-44988.patch         |   71 +
 .../libvncserver/libvncserver_0.9.15.bb       |    1 +
 ...equire-swap_buffers-param-for-FenceS.patch |   35 +
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |    5 +-
 .../nmap/files/CVE-2026-72712.patch           |   50 +
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |    1 +
 .../libmspack/CVE-2026-110602.patch           |   41 +
 .../cabextract/libmspack_0.11alpha.bb         |    4 +-
 .../crow/{crow_1.3.2.bb => crow_1.3.4.bb}     |    2 +-
 ...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch |   43 +
 meta-oe/recipes-support/fftw/fftw_3.3.11.bb   |    1 +
 .../hdf5/files/CVE-2026-120689.patch          |   60 +
 .../CVE-2026-120754-CVE-2026-120755.patch     |  172 +++
 .../hdf5/files/CVE-2026-120756.patch          |   45 +
 .../hdf5/files/CVE-2026-120757.patch          |   63 +
 .../hdf5/files/CVE-2026-120758.patch          |  143 ++
 .../files/CVE-2026-19023-CVE-2026-19024.patch |  176 +++
 ...-19026-CVE-2026-19027-CVE-2026-19028.patch |  579 ++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |    7 +
 .../{smarty_5.8.4.bb => smarty_5.8.5.bb}      |    2 +-
 ...{uriparser_1.0.2.bb => uriparser_1.0.3.bb} |    2 +-
 .../{zchunk_1.5.3.bb => zchunk_1.5.5.bb}      |    4 +-
 .../libhtml/files/CVE-2026-8829.patch         |  127 ++
 .../libhtml/libhtml-parser-perl_3.83.bb       |    4 +-
 .../python3-aiohttp/CVE-2026-111063_p1.patch  |  137 ++
 .../python3-aiohttp/CVE-2026-111063_p2.patch  |  244 ++++
 .../python3-aiohttp/CVE-2026-111064.patch     |  285 ++++
 .../python3-aiohttp/CVE-2026-111065.patch     |  176 +++
 .../python3-aiohttp/CVE-2026-111066_p1.patch  |  400 ++++++
 .../python3-aiohttp/CVE-2026-111066_p2.patch  |   57 +
 .../python3-aiohttp/CVE-2026-111748_p1.patch  |  376 +++++
 .../python3-aiohttp/CVE-2026-111748_p2.patch  |  282 ++++
 .../python3-aiohttp/CVE-2026-111749.patch     |  205 +++
 .../python3-aiohttp/CVE-2026-111750.patch     |   83 ++
 .../python/python3-aiohttp_3.13.5.bb          |   10 +
 ...ngo_5.2.18.bb => python3-django_5.2.19.bb} |    2 +-
 ...ango_6.0.9.bb => python3-django_6.0.10.bb} |    2 +-
 .../python3-pillow/CVE-2026-112393.patch      |  124 ++
 .../python/python3-pillow_12.2.0.bb           |    1 +
 .../CVE-2026-106435-regression.patch          |   92 ++
 .../python3-pymongo/CVE-2026-106435.patch     |  122 ++
 .../python3-pymongo/CVE-2026-88029.patch      | 1255 +++++++++++++++++
 .../python/python3-pymongo_4.16.0.bb          |    5 +
 .../python3-tornado/CVE-2026-103261.patch     |   98 ++
 .../python3-tornado/CVE-2026-103262.patch     | 1117 +++++++++++++++
 .../CVE-2026-103263-dependent.patch           |  255 ++++
 .../python3-tornado/CVE-2026-103263.patch     |  422 ++++++
 .../python3-tornado/CVE-2026-115927.patch     |  397 ++++++
 .../python3-tornado/CVE-2026-116577_p1.patch  |  195 +++
 .../python3-tornado/CVE-2026-116577_p2.patch  |   99 ++
 .../python3-tornado/CVE-2026-116577_p3.patch  |  101 ++
 .../python3-tornado/CVE-2026-116578_p1.patch  |   62 +
 .../python3-tornado/CVE-2026-116578_p2.patch  |  106 ++
 .../python3-tornado/CVE-2026-116578_p3.patch  |  192 +++
 .../python/python3-tornado_6.5.7.bb           |   11 +
 .../python3-virtualenv/CVE-2026-102925.patch  |  296 ++++
 .../CVE-2026-102930-dependent.patch           |  115 ++
 .../CVE-2026-102930_p1.patch                  |  309 ++++
 .../CVE-2026-102930_p2.patch                  |  293 ++++
 .../CVE-2026-102930_p3.patch                  |  777 ++++++++++
 .../python3-virtualenv/CVE-2026-102938.patch  |  141 ++
 .../python3-virtualenv/CVE-2026-113713.patch  |  113 ++
 .../python3-virtualenv/CVE-2026-113715.patch  |  165 +++
 .../python3-virtualenv/CVE-2026-113716.patch  |  208 +++
 .../python3-virtualenv/CVE-2026-113719.patch  |  207 +++
 .../python3-virtualenv/CVE-2026-113720.patch  |  156 ++
 .../python3-virtualenv/CVE-2026-113721.patch  |  477 +++++++
 .../CVE-2026-113722_p1.patch                  |  262 ++++
 .../CVE-2026-113722_p2.patch                  |   50 +
 .../python3-virtualenv/CVE-2026-113723.patch  |  233 +++
 .../python3-virtualenv/CVE-2026-113725.patch  |   88 ++
 .../CVE-2026-113726-dependent.patch           |  168 +++
 .../python3-virtualenv/CVE-2026-113726.patch  |  149 ++
 .../CVE-2026-113732_p1.patch                  |  116 ++
 .../CVE-2026-113732_p2.patch                  |  120 ++
 .../python3-virtualenv/CVE-2026-113776.patch  |  133 ++
 .../python3-virtualenv/CVE-2026-115586.patch  |  526 +++++++
 .../python/python3-virtualenv_21.2.1.bb       |   31 +
 .../nginx/files/CVE-2026-15176.patch          |   54 +
 .../nginx/files/CVE-2026-95101.patch          |   68 +
 .../nginx/files/CVE-2026-97629.patch          |   45 +
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |    3 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |    3 +
 113 files changed, 14565 insertions(+), 77 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p1.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch} (97%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p2.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch} (98%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p3.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch} (96%)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p3.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p4.patch
 create mode 100644 meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.6.4.bb => pgpool2_4.6.6.bb} (92%)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.8.bb => wireshark_4.6.9.bb} (97%)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.12.bb => mariadb-native_11.4.13.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.12.bb => mariadb_11.4.13.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.3.bb => nodejs_22.23.4.bb} (99%)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.6.bb => valkey_9.0.7.bb} (98%)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
 create mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
 rename meta-oe/recipes-support/crow/{crow_1.3.2.bb => crow_1.3.4.bb} (92%)
 create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch
 rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} (96%)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb} (91%)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.3.bb => zchunk_1.5.5.bb} (81%)
 create mode 100644 meta-perl/recipes-perl/libhtml/files/CVE-2026-8829.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
 rename meta-python/recipes-devtools/python/{python3-django_5.2.18.bb => python3-django_5.2.19.bb} (70%)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.9.bb => python3-django_6.0.10.bb} (79%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-88029.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103261.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103262.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-115927.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102925.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102938.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113713.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-115586.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-15176.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-95101.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-97629.patch

-- 
2.55.0

