Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA19CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 04:33:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.590.1764649995060309248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 20:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Y1/qDDyq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4431c6a92f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B23w3Gq1378612
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Dec 2025 04:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=I4MbV+4HbzHap4stfuo5
	U9OVpPWaHRy9IiV2pI4D1c4=; b=Y1/qDDyqCm0fm6aDng7vXzJ33sucBij3eUOj
	IW40EBpTNDQj/x5LZdPou1yLUYB+jM9fD9boRhdqWrPQSL8ZULCXLJOxWJ8a5p3I
	U7WxssgmCDb0qkGOjusSud8kuA3nzHm1LPinMfaSU2pZRZGWwsglBOw1JURL0ak9
	rlo/UQ5EbGVmz2eaBkoHZi6qShcZ1EZFRokMoc89iE1uq26asLO4T78GDg9AB80d
	2nBG7xbAEk3R6lS/CPTtFxp7QGpZV9Ew47e5FaFnhYu1c3uytOVMvjqUuHWQiwBw
	uXk6k48HBXSDpg0UVZqLwNju1QeUrn9lCaZK8qPWofKNFVuQ8g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21tqqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 04:33:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 20:33:12 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 20:33:11 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] openipmi: Pass BUILD_CFLAGS to BUILD_CC
Date: Tue, 2 Dec 2025 12:33:11 +0800
Message-ID: <20251202043311.3694289-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: bFWpUJcIao9VEnKjXa7pGDww3MFQfQrq
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692e6c09 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=QFFrpI5hnWjs0WVhbrEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAzMyBTYWx0ZWRfX95O+ISTgElgM
 /pHSmwUBMdDO4ILX32cSarW63RL8YPwhGHD1YPXcU/O5ojHv4SGH843W7OBiL9hy7w7OkhP0TV1
 z+e2r2C/4lh2cFyl7iAAgMVOP+tsMRH1GrY1gpqkbh+YOMTiyCeKwvaWnQiSoU4FOnNSVKStg/o
 12upSxHJisMbJRW2oeS6z58DCIc+oTcZ5WjW1Iw/iiCvppVIgMt/1LHR7HKsITTQ7/53VPFsPdf
 vJjEX3TWJXLllcLmBYwuRn8WnLJOhqsSA2CGKKEEMrgEw1Z5+z3obQqAJDW2BayzVO0s38z/a50
 tEf+wmE2BvJrgd6u4pm8oGakpfOlweYXxLoRBkNzXv3teehLbwbT9Zvybe4yi5rtCEOcWF+OARx
 IwnzFkzVNa9zgm8jBzzchXRRfmGJwA==
X-Proofpoint-ORIG-GUID: bFWpUJcIao9VEnKjXa7pGDww3MFQfQrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B23w3Gq1378612
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 04:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122229

From: Mingli Yu <mingli.yu@windriver.com>

* The option -fcanon-prefix-map is added to CFLAGS after the commit [1]
introduced and result in the below build error.
  Making all in sdrcomp
  make[3]: Entering directory '/tmp/work/cortexa57-wrs-linux/openipmi/2.0=
.37/sources/OpenIPMI-2.0.37/lanserv/sdrcomp'
aarch64-wrs-linux-gcc  -mcpu=3Dcortex-a57+crc -mbranch-protection=3Dstand=
ard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat=
-security -Werror=3Dformat-security --sysroot=3D/tmp/work/cortexa57-wrs-l=
inux/openipmi/2.0.37/recipe-sysroot -DHAVE_CONFIG_H -I. -I../..  -DSTATED=
IR=3D'"/var"'  -Wall -Wsign-compare -I../../include -I../../lanserv -I../=
../utils -O2 -g -fcanon-prefix-map  -ffile-prefix-map=3D/tmp/work/cortexa=
57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=3D/usr/src/debug/ope=
nipmi/2.0.37  -ffile-prefix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/=
2.0.37/sources/OpenIPMI-2.0.37=3D/usr/src/debug/openipmi/2.0.37  -ffile-p=
refix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot=3D=
  -ffile-prefix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recip=
e-sysroot-native=3D  -pipe -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=
 -c -o sdrcomp.o sdrcomp.c
gcc  -o sdrcomp_build ../../lanserv/sdrcomp/sdrcomp.c -O2 -g -fcanon-pref=
ix-map  -ffile-prefix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37=
/sources/OpenIPMI-2.0.37=3D/usr/src/debug/openipmi/2.0.37  -ffile-prefix-=
map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.=
37=3D/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=3D/tmp/work/cortex=
a57-wrs-linux/openipmi/2.0.37/recipe-sysroot=3D  -ffile-prefix-map=3D/tmp=
/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot-native=3D  -pipe=
 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Wall -Wsign-compare -I..=
/../include -I../../lanserv -I../../utils -lm
  gcc: error: unrecognized command-line option =E2=80=98-fcanon-prefix-ma=
p=E2=80=99; did you mean =E2=80=98-fmacro-prefix-map=3D=E2=80=99?

* Pass BUILD_CFLAGS for BUILD_CC to fix the above build issue.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D3dbc4a79f=
01ebfc54da024c1460c06772659088d

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch | 35 +++++++++++++++++++
 .../openipmi/openipmi_2.0.37.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-support/openipmi/files/0001-M=
akefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch

diff --git a/meta-networking/recipes-support/openipmi/files/0001-Makefile=
.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch b/meta-networking/recipes-support=
/openipmi/files/0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch
new file mode 100644
index 0000000000..5749263d13
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/0001-Makefile.am-Pas=
s-BUILD_CFLAGS-to-BUILD_CC.patch
@@ -0,0 +1,35 @@
+From 05d8f730b746d73a1efec7c42066953b5708c5b6 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 2 Dec 2025 12:07:42 +0800
+Subject: [PATCH] Makefile.am: Pass BUILD_CFLAGS to BUILD_CC
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Pass BUILD_CFLAGS to BUILD_CC to fix the below error.
+   Making all in sdrcomp
+   make[3]: Entering directory '/tmp/work/cortexa57-wrs-linux/openipmi/2=
.0.37/sources/OpenIPMI-2.0.37/lanserv/sdrcomp'
+aarch64-wrs-linux-gcc  -mcpu=3Dcortex-a57+crc -mbranch-protection=3Dstan=
dard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wforma=
t-security -Werror=3Dformat-security --sysroot=3D/tmp/work/cortexa57-wrs-=
linux/openipmi/2.0.37/recipe-sysroot -DHAVE_CONFIG_H -I. -I../..  -DSTATE=
DIR=3D'"/var"'  -Wall -Wsign-compare -I../../include -I../../lanserv -I..=
/../utils -O2 -g -fcanon-prefix-map  -ffile-prefix-map=3D/tmp/work/cortex=
a57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=3D/usr/src/debug/op=
enipmi/2.0.37  -ffile-prefix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi=
/2.0.37/sources/OpenIPMI-2.0.37=3D/usr/src/debug/openipmi/2.0.37  -ffile-=
prefix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot=
=3D  -ffile-prefix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/re=
cipe-sysroot-native=3D  -pipe -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64 -c -o sdrcomp.o sdrcomp.c
+gcc  -o sdrcomp_build ../../lanserv/sdrcomp/sdrcomp.c -O2 -g -fcanon-pre=
fix-map  -ffile-prefix-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.3=
7/sources/OpenIPMI-2.0.37=3D/usr/src/debug/openipmi/2.0.37  -ffile-prefix=
-map=3D/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0=
.37=3D/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=3D/tmp/work/corte=
xa57-wrs-linux/openipmi/2.0.37/recipe-sysroot=3D  -ffile-prefix-map=3D/tm=
p/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot-native=3D  -pip=
e -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Wall -Wsign-compare -I.=
./../include -I../../lanserv -I../../utils -lm
+   gcc: error: unrecognized command-line option =E2=80=98-fcanon-prefix-=
map=E2=80=99; did you mean =E2=80=98-fmacro-prefix-map=3D=E2=80=99?
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lanserv/sdrcomp/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lanserv/sdrcomp/Makefile.am b/lanserv/sdrcomp/Makefile.am
+index e473af8..057a536 100644
+--- a/lanserv/sdrcomp/Makefile.am
++++ b/lanserv/sdrcomp/Makefile.am
+@@ -19,4 +19,4 @@ BUILD_SDRCOMP_DEPS =3D $(top_srcdir)/lanserv/persist.c=
 \
+ 	$(top_srcdir)/utils/string.c
+ BUILD_SDRCOMP_SRCS =3D $(top_srcdir)/$(subdir)/sdrcomp.c
+ sdrcomp_build$(EXEEXT): $(BUILD_SDRCOMP_SRCS) $(BUILD_SDRCOMP_DEPS)
+-	$(BUILD_CC) -o $@ $(BUILD_SDRCOMP_SRCS) $(CFLAGS) $(AM_CFLAGS) -lm
++	$(BUILD_CC) -o $@ $(BUILD_SDRCOMP_SRCS) $(BUILD_CFLAGS) $(AM_CFLAGS) -=
lm
+--=20
+2.34.1
+
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb =
b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
index 090b54846c..db74b91f7e 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
@@ -28,6 +28,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${=
PV}.tar.gz \
            file://openipmi-no-openipmigui-man.patch \
            file://ipmi-init-fix-the-arguments.patch \
            file://include_sys_types.patch \
+           file://0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch \
            file://openipmi-helper \
            file://ipmi.service \
            "
--=20
2.34.1


