Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA1EC001B2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.4048.1699071647273639202
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SIKNbFeT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U1820NIP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b988fd9c2-683331d5-9e0e-4a06-b305-dbac94124f27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0B72nyZUfu1LDFYJeUmuvf5Hsqo/BgpYw00kBZBV/U0=;
	b=SIKNbFeTTnNgC5zS/V647PxyD/lTKg7S/fG3Uk7ZdSPnxNcT426L3iPp9R3AXQP/
	WYL+7uSxwb0Rs2UTanfuAu7QT+/Yk/RvLu8I5+KtVRWehSQ5HzS01Gwv4Oc7Ma/ZAiT
	V25DAIon9Ox32IqleJedv4Xjf5GgHnBRMA4SE0m8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0B72nyZUfu1LDFYJeUmuvf5Hsqo/BgpYw00kBZBV/U0=;
	b=U1820NIPlL3BPwT0Im1k+ECSQpoTndkR2DgR8wkvlvCSSEyAytLnTzqbuH+1yaTb
	GruVAtjhct4tII3h3KggY58A0PIK9E3RjVdEoKjrppeETdT9MBIiiRkmUCXySzq8sOd
	9W5bx+B0GkUVt5x/Mon9yqB4P9xvVY2EZZZmuwaI=
Content-Type: multipart/mixed; boundary="===============1080663685020002055=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] fdk-aac: upgrading to 2.0.2 SUCCEEDED
Message-ID: <0101018b988fd9c2-683331d5-9e0e-4a06-b305-dbac94124f27-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106244

--===============1080663685020002055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *fdk-aac* to *2.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fdk-aac-upgrade-2.0.1-2.0.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 22fadb8c9d4817e7c42450a71d6dfb27cec493fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:17:44 +0000
Subject: [PATCH] fdk-aac: upgrade 2.0.1 -> 2.0.2

---
 .../fdk-aac/{fdk-aac_2.0.1.bb => fdk-aac_2.0.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/fdk-aac/{fdk-aac_2.0.1.bb => fdk-aac_2.0.2.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
rename to meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
index c499119c6..55475b40f 100644
--- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
@@ -12,7 +12,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
 
 SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=https;branch=master"
-SRCREV = "d387d3b6ed79ff9a82c60440bdd86e6e5e324bec"
+SRCREV = "801f67f671929311e0c9952c5f92d6e147c7b003"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============1080663685020002055==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fdk-aac-upgrade-2.0.1-2.0.2.patch"

RnJvbSAyMmZhZGI4YzlkNDgxN2U3YzQyNDUwYTcxZDZkZmIyN2NlYzQ5M2ZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzoxNzo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZk
ay1hYWM6IHVwZ3JhZGUgMi4wLjEgLT4gMi4wLjIKCi0tLQogLi4uL2Zkay1hYWMve2Zkay1hYWNf
Mi4wLjEuYmIgPT4gZmRrLWFhY18yLjAuMi5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1tdWx0
aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9mZGstYWFjL3tmZGstYWFjXzIuMC4xLmJiID0+IGZk
ay1hYWNfMi4wLjIuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1tdWx0aW1lZGlhL3JlY2lw
ZXMtbXVsdGltZWRpYS9mZGstYWFjL2Zkay1hYWNfMi4wLjEuYmIgYi9tZXRhLW11bHRpbWVkaWEv
cmVjaXBlcy1tdWx0aW1lZGlhL2Zkay1hYWMvZmRrLWFhY18yLjAuMi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2Zk
ay1hYWMvZmRrLWFhY18yLjAuMS5iYgpyZW5hbWUgdG8gbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMt
bXVsdGltZWRpYS9mZGstYWFjL2Zkay1hYWNfMi4wLjIuYmIKaW5kZXggYzQ5OTExOWM2Li41NTQ3
NWI0MGYgMTAwNjQ0Ci0tLSBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvZmRr
LWFhYy9mZGstYWFjXzIuMC4xLmJiCisrKyBiL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRp
bWVkaWEvZmRrLWFhYy9mZGstYWFjXzIuMC4yLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ0VOU0Vf
RkxBR1MgPSAiY29tbWVyY2lhbCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL05PVElDRTtt
ZDU9NTk4NWUxZTEyZjRhZmE3MTBkNjRlZDdiZmQyOTE4NzUiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9tc3RvcnNqby9mZGstYWFjLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dGVyIgotU1JDUkVWID0gImQzODdkM2I2ZWQ3OWZmOWE4MmM2MDQ0MGJkZDg2ZTZlNWUzMjRiZWMi
CitTUkNSRVYgPSAiODAxZjY3ZjY3MTkyOTMxMWUwYzk5NTJjNWY5MmQ2ZTE0N2M3YjAwMyIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============1080663685020002055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/fdk-aac/fdk-aac-dbg: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-dbg: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-64-poky-linux/fdk-aac/fdk-aac-dbg: FILELIST: removed "/usr/lib/.debug/libfdk-aac.so.2.0.1", added "/usr/lib/.debug/libfdk-aac.so.2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-dbg: PKGSIZE changed from 7053336 to 7119872 (+1%)
packages/core2-64-poky-linux/fdk-aac/fdk-aac-dev: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-dev: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-64-poky-linux/fdk-aac/fdk-aac-dev: PKGSIZE changed from 227204 to 225111 (-1%)
packages/core2-64-poky-linux/fdk-aac/fdk-aac-doc: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-doc: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-64-poky-linux/fdk-aac/fdk-aac-locale: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-locale: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-64-poky-linux/fdk-aac/fdk-aac-src: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-src: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-64-poky-linux/fdk-aac/fdk-aac-src: FILELIST: directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSYS/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libSYS/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libFDK/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libFDK/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libMpegTPDec/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libMpegTPDec/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libMpegTPEnc/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libMpegTPEnc/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libPCMutils/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libPCMutils/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libArithCoding/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libArithCoding/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libMpegTPDec/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libMpegTPDec/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSBRenc/src -> /usr/src/debu
 g/fdk-aac/2.0.2-r0/libSBRenc/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libAACenc/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libAACenc/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libAACdec/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libAACdec/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libDRCdec/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libDRCdec/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libFDK/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libFDK/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSACdec/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libSACdec/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libFDK/include/x86 -> /usr/src/debug/fdk-aac/2.0.2-r0/libFDK/include/x86, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSACenc/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libSACenc/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libPCMutils/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libPCMutils/include, directory renamed /usr/src/debug/fd
 k-aac/2.0.1-r0/libSYS/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libSYS/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libArithCoding/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libArithCoding/src, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libAACdec/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libAACdec/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libAACenc/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libAACenc/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libDRCdec/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libDRCdec/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSACdec/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libSACdec/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSACenc/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libSACenc/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/include -> /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libSBRenc/include 
 -> /usr/src/debug/fdk-aac/2.0.2-r0/libSBRenc/include, directory renamed /usr/src/debug/fdk-aac/2.0.1-r0/libMpegTPEnc/src -> /usr/src/debug/fdk-aac/2.0.2-r0/libMpegTPEnc/src, removed "/usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/hbe.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/env_dec.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_dec.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/lpp_tran.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/psbitdec.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_crc.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/psdec.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbrdec_freq_sca.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_crc.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_dec.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_ram.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_rom.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/env_dec.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/HFgen_preFlat.cpp /usr
 /src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/env_extr.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbrdec_drc.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbrdecoder.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbrdec_drc.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/lpp_tran.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/env_calc.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbrdec_freq_sca.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_ram.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/huff_dec.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/sbr_rom.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/pvc_dec.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/pvc_dec.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/env_extr.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/env_calc.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/transcendent.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/psbitdec.cpp /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/psdec.cpp /usr
 /src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/huff_dec.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/HFgen_preFlat.h /usr/src/debug/fdk-aac/2.0.1-r0/libSBRdec/src/hbe.h", added "/usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/hbe.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/env_dec.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbr_dec.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/lpp_tran.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/psbitdec.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/psdec.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbrdec_freq_sca.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbr_dec.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbr_ram.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbr_rom.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/env_dec.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/HFgen_preFlat.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/env_extr.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbrdec_drc.cpp /usr/sr
 c/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbrdecoder.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbrdec_drc.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/lpp_tran.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/env_calc.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbrdec_freq_sca.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbr_ram.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/huff_dec.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/sbr_rom.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/pvc_dec.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/pvc_dec.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/env_extr.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/env_calc.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/transcendent.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/psbitdec.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/psdec.cpp /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/huff_dec.h /usr/src/debug/fdk-aac/2.0.2-r0/libSBRdec/src/HFgen_preFlat.h /usr/s
 rc/debug/fdk-aac/2.0.2-r0/libSBRdec/src/hbe.h"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-src: PKGSIZE changed from 8283664 to 8460310 (+2%)
packages/core2-64-poky-linux/fdk-aac/fdk-aac-staticdev: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac-staticdev: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-64-poky-linux/fdk-aac/fdk-aac: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-64-poky-linux/fdk-aac/fdk-aac: FILELIST: removed "/usr/lib/libfdk-aac.so.2.0.1", added "/usr/lib/libfdk-aac.so.2.0.2"
packages/core2-64-poky-linux/fdk-aac/fdk-aac: PKGSIZE changed from 1329675 to 1358347 (+2%)
packages/core2-64-poky-linux/fdk-aac: PV changed from "2.0.1" to "2.0.2"
packages/core2-64-poky-linux/fdk-aac: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
Changes to packages/core2-64-poky-linux/fdk-aac (sysroot):
  /usr/lib/libfdk-aac.so.2 changed symlink target from libfdk-aac.so.2.0.1 to libfdk-aac.so.2.0.2
  /usr/lib/libfdk-aac.so changed symlink target from libfdk-aac.so.2.0.1 to libfdk-aac.so.2.0.2
  /usr/lib/libfdk-aac.so.2.0.1 moved to /usr/lib/libfdk-aac.so.2.0.2

--===============1080663685020002055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/fdk-aac/fdk-aac: FILELIST: removed "/usr/lib/libfdk-aac.so.2.0.1", added "/usr/lib/libfdk-aac.so.2.0.2"
Changes to packages/core2-64-poky-linux/fdk-aac (sysroot):
  /usr/lib/libfdk-aac.so.2 changed symlink target from libfdk-aac.so.2.0.1 to libfdk-aac.so.2.0.2
  /usr/lib/libfdk-aac.so changed symlink target from libfdk-aac.so.2.0.1 to libfdk-aac.so.2.0.2
  /usr/lib/libfdk-aac.so.2.0.1 moved to /usr/lib/libfdk-aac.so.2.0.2

--===============1080663685020002055==--

