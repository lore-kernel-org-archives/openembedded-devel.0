Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C6FC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 10:22:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66239.1782987668613457627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2026 03:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=J6Q/HZxr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bM6n0Ofi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628Gm892917515
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Jul 2026 09:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8v5ll5HymOhsw7d5ADnt3iIVCtcD3kYBH2D
	Xz+wkCqU=; b=J6Q/HZxrTUov+eugU4zaodFFc43oBRkLli8BekUDfRBfd88YWVZ
	ZsoLXDTjdzA4961+AQR8PuLglgqxBdn55ywh5vrp6hdYMG1sZp56e9fO6BiqhIrp
	7lNduPvhlz/TNpCP4y9rIVs+hWV0/qefzPOHU5D3svlyYrQ+spUWzpKPhEUIHq2C
	sJgntqYJWnTfRO/+BaWDAylhilsDLS7zfDB0zDBubWaEuFHfhz9/bTlxNlrwrXr5
	UQ82b46XralXyiokTmDae6aDS4BQc5hrfCX7FVlGZrE/oIL1kKHFPYmFtPRZuhkE
	xvDZhOaLfdy7bXC8jT9bp2dj+uCQvJvPU2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0c53p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 09:36:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55f0613cso160104685a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985015; x=1783589815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8v5ll5HymOhsw7d5ADnt3iIVCtcD3kYBH2DXz+wkCqU=;
        b=bM6n0OfiLYDPunHQIodhcSmDqfwCtVqucj4jE6fRAVz9yAfsBl43XpWgQcS9Ripi0P
         CLEA2CBlTsapcHb/I/qDNdtY2ui/dw5JL3GN7oENx+FJO2FJbmr4FaLAgHfqXGvV+xf9
         eI5OQRLKyTfi4SDypCPrBoYhcolfpN4CGmxMWgZXVjjDafA9vMqkbvjgDxQ+GCgT0ktO
         kUnWAos6ar+7pnmsJi1e6aUHG7pozLyfAvdyFdyds6rI3yfuTD3HUwNkD7fqidMcJ+GV
         1N5a+ntz/yxeknScEejIjembZuWML42BA0UjaCw1q/ayEwNLV9lAYK+IOgR3LVvkmWPo
         NnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985015; x=1783589815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8v5ll5HymOhsw7d5ADnt3iIVCtcD3kYBH2DXz+wkCqU=;
        b=J1zQcPpYtM+3IB63/BCmNf4zddioySOR2vds8lzmsIk9xdqKewZ3lPOaI3+VwAwSsv
         xWUznf4i0IsB0yftrlzRjYHgPD3825VCs/XYHi9t9KZPkm0O6YchD5J6zOEB04LYepZy
         C40Id1kGozFHDbVfvJwOC1SUY8tVCq8vcnO/M1B/RXwqm3Ox4JubpDchLXel3g8+CfAM
         qRiP721+ydgPHo9yLs3auSf59BEtPrXok3bKiA5aH/SF2iBrnn7KOHVSS7utrOllrEiY
         Dl0oMBjASqo20bpXpuNpJ0Y5RYu8EF7VNgo7OUuyHCUDWTxAb2G3xTjJFTD1uFYWzV3u
         yzAg==
X-Forwarded-Encrypted: i=1; AFNElJ95FSs8ZG5C2wnZTCW5Eu8KFZlLs+mAdyiUyhOh1kZ9xuZUK+lO6+cZz1scbpxI1N1umcMISuu+o2BnMDeDD2IlcHU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7NJ/Rva9E7jtHQOd8niW4Uaoa1ouoAhTIwhJkiGx2XM8bBGGM
	ZuDS2R3R1Bo/AwTAc4uGhiqTwR1gbYrzisCsug1O1f9plATYwIpgj0uT5k1MiezECWud6o2q3PV
	B5JzTAZA8qxwnaOE58dJcNGWe13oBj+qCqGMgqcCRsihb+3aF7TodoBQvNTMD75l+SCxrwLdrOH
	OwFGSmlOKP
X-Gm-Gg: AfdE7cnFaf4rdR2SGd9ZAe8dDrDVZjdJKXRh73P2bplIDEU9fERiOXhoM/+jikmMe6o
	/j25F83DsTKW8vHnrfr/ehWRSVRXoKD+2UJGtguFWRvMHCWhlFyk/2V1iJJACkTBaZvriBfxgvv
	rNG3rjOsWUajUiugUHC9h8Qz1x9CxbJV7g47qqndr4Nb15t6U8rYjVA4/aQSHeQ5d7IW4wMj4Ci
	JqFcb0ozYXNj07P5YVP5TsKvVaEzzS82yVMHBYzk3/KpD7mPA8f2hGTpAJ/DaEI+Vf5lDe35bF2
	GiWmj/mgR7HvruEWnGhlnAXvK5iL/oTE///BemZfqaPgoksbtH/eLjvjDJ6eHiJpNJv1aRYRZvD
	pn6ByqT3Jlc+oU4zKIeaHFTFFasfK6Zdg0hjE0zg=
X-Received: by 2002:a05:620a:6cca:b0:92b:641f:ea5a with SMTP id af79cd13be357-92e784d0ad2mr775665285a.38.1782985014477;
        Thu, 02 Jul 2026 02:36:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:92b:641f:ea5a with SMTP id af79cd13be357-92e784d0ad2mr775661185a.38.1782985013889;
        Thu, 02 Jul 2026 02:36:53 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5165:910e:4e74:80ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm36856835e9.13.2026.07.02.02.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:36:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH] gpiod-sysfs-proxy: update to v1.0.2
Date: Thu,  2 Jul 2026 11:36:47 +0200
Message-ID: <20260702093648.45186-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a463137 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Y07olrjQmAWv9VQqws4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hSMQUXq-eyJLA_nG2c5rCaCPsnIMRCO3
X-Proofpoint-GUID: hSMQUXq-eyJLA_nG2c5rCaCPsnIMRCO3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXx225DjTY7fV6
 f0PKt7ZJf7shQUEerOp3LUypvWBBztPCNnVaHITJru8Ex+4Y/h9d/rYdP2/BfKbgEqefNm8T/AD
 lVjUB41GNkKRzdgX/iDhNWaUP2qA3GtwxevIyUR091LLj21OHDwepmhsX68JLJ+oOP4DL7INyAo
 etUCrmLJTEc1Fz4WfMtZtX4iOgIhtZVoE5p5id0dSm6d5p092f5Fa8tY+u7xtRXz+jtxnh3VgHU
 Y6rmmiMHFmTYjloBCNC19tu6M+FVpASHNztvLiP+4Skf7Ev6oyPi7XhfTNLYUs/hOpJyPVqESto
 9kWrzYcsvTIT1WdXY8Vy2ObbwWA93WyjGVmW2xMO37FATdPWARtMVY0QysAXaMsodBzuJMo8MdC
 Xfcmep9NdzxSx3H0ETBp1PhlaRWbgxtBXbIy29hAKS9uaDxL4HLZ8b9kFZx7aTHzjkFH8qOaKVx
 YsIfe3DzCdsbDC5kuaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2ABMr+O85ec/
 +rouQZRG8Ym+NQzDHbR+kOGXPOHJSn1JXGn+v7d10UByNSr2MkMD9SVrE1bQEIGdCtOcnUs7tPo
 +sR6Mr8UMajjkNoH7OdXnpmIm1mRscU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 10:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127999

This is a major release for gpiod-sysfs-proxy. Upstream now ships
systemd unit files so drop those from the recipe. The project was
updated to using the more modern pyfuse3 package. Other than that: it
works the same and passes the same set of tests. For sysvinit: some of
the command-line arguments are no longer supported in pyfuse3 so remove
them from the init script.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../gpiod-sysfs-proxy.init.in                 |  2 +-
 .../gpiod-sysfs-proxy.service.in              | 15 ---------
 .../gpiod-sysfs-proxy/run-gpio-sys.mount      | 13 --------
 .../gpiod-sysfs-proxy/sys-class.mount         | 16 ---------
 ...xy_0.1.4.bb => gpiod-sysfs-proxy_1.0.2.bb} | 33 ++++++-------------
 5 files changed, 11 insertions(+), 68 deletions(-)
 delete mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
 delete mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount
 delete mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount
 rename meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/{gpiod-sysfs-proxy_0.1.4.bb => gpiod-sysfs-proxy_1.0.2.bb} (62%)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
index cba731c9fd..b3862910c5 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
@@ -40,7 +40,7 @@ do_start()
 		mkdir -p $MOUNTPOINT
 	fi
 
-	$PROG $MOUNTPOINT -o nonempty -o allow_other -o default_permissions -o entry_timeout=0 -o attr_timeout=0 -f | logger -i $NAME &
+	$PROG $MOUNTPOINT -o allow_other -o default_permissions -f | logger -i $NAME &
 	echo "done"
 }
 
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
deleted file mode 100644
index 5f8c4f4834..0000000000
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
+++ /dev/null
@@ -1,15 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-[Unit]
-Description=User-space, libgpiod-based compatibility layer for linux GPIO sysfs interface
-
-[Service]
-RuntimeDirectory=gpio
-Type=simple
-ExecStart=/usr/bin/gpiod-sysfs-proxy @mountpoint@ -f -o nonempty -o allow_other -o default_permissions -o entry_timeout=0 -o attr_timeout=0
-ExecStop=/bin/umount @mountpoint@
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount
deleted file mode 100644
index a924cb9b64..0000000000
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount
+++ /dev/null
@@ -1,13 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-[Unit]
-Description=Remount of sysfs for gpiod-sysfs-proxy
-ConditionPathExists=!/sys/class/gpio
-
-[Mount]
-DirectoryMode=0700
-What=sysfs
-Where=/run/gpio/sys
-Type=sysfs
-Options=nosuid,nodev,noexec
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount
deleted file mode 100644
index e3e3ce8e74..0000000000
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-[Unit]
-Description=Overlay on top of /sys/class adding the gpio class directory
-Before=gpiod-sysfs-proxy.service
-After=run-gpio-sys.mount
-ConditionPathExists=!/sys/class/gpio
-
-[Mount]
-RuntimeDirectory=gpio/class/gpio
-DirectoryMode=0755
-What=overlay
-Where=/sys/class
-Type=overlay
-Options=upperdir=/run/gpio/class,lowerdir=/run/gpio/sys/class,workdir=/run/gpio/work,ro,nosuid,nodev,noexec,relatime
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.4.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
similarity index 62%
rename from meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.4.bb
rename to meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
index 52b73f3ff4..6cababfe69 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.4.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
@@ -1,21 +1,18 @@
 SUMMARY = "User-space, libgpiod-based compatibility layer for linux GPIO sysfs interface."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0dcf8b702b5c96178978c7223f64a73b"
+LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=b1008aa4e86ef6163fc80a22d1547bea"
 
 inherit systemd update-rc.d ptest pypi python_pep517 python_setuptools_build_meta useradd
 
 PYPI_PACKAGE = "gpiod_sysfs_proxy"
 
 SRC_URI += " \
-    file://gpiod-sysfs-proxy.service.in \
-    file://run-gpio-sys.mount \
-    file://sys-class.mount \
     file://gpiod-sysfs-proxy.init.in \
     file://run-ptest.in \
 "
 
-SRC_URI[sha256sum] = "bb38e31e4046a7aa0101c53c9e7e2cf319c0cd9620b9ba1641e962fce44a1f3a"
+SRC_URI[sha256sum] = "a12fc9d0778078bf351daa4fab244910ac550e7bef77a12e47c16a1161bc539d"
 
 # For full backward compatibility with the kernel sysfs interface, this option
 # must be selected. However, we don't make it the default as - with kernel sysfs
@@ -27,29 +24,18 @@ PACKAGECONFIG[sys-class-mount] = ""
 export MOUNTPOINT = "${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '/sys/class/gpio', '/run/gpio', d)}"
 
 do_install:append() {
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${UNPACKDIR}/gpiod-sysfs-proxy.service.in ${D}${systemd_system_unitdir}/gpiod-sysfs-proxy.service
-
-        if ${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', 'true', 'false', d)}; then
-            install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
-
-            install -m 0644 ${UNPACKDIR}/run-gpio-sys.mount ${D}${systemd_system_unitdir}/run-gpio-sys.mount
-            install -m 0644 ${UNPACKDIR}/sys-class.mount ${D}${systemd_system_unitdir}/sys-class.mount
-
-            ln -sf ../run-gpio-sys.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/run-gpio-sys.mount
-            ln -sf ../sys-class.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/sys-class.mount
-        fi
-
-        sed -i "s:@mountpoint@:$MOUNTPOINT:g" ${D}${systemd_system_unitdir}/gpiod-sysfs-proxy.service
-    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${UNPACKDIR}/gpiod-sysfs-proxy.init.in ${D}${sysconfdir}/init.d/gpiod-sysfs-proxy
         sed -i "s:@mountpoint@:$MOUNTPOINT:g" ${D}${sysconfdir}/init.d/gpiod-sysfs-proxy
     fi
 }
 
-SYSTEMD_SERVICE:${PN} = "gpiod-sysfs-proxy.service"
+SYSTEMD_SERVICE:${PN} = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', \
+                         'gpiod-sysfs-proxy@sys-class-gpio.service', \
+                         'gpiod-sysfs-proxy@run-gpio.service', d)} \
+"
 SYSTEMD_AUTO_ENABLE = "enable"
 
 INITSCRIPT_NAME = "gpiod-sysfs-proxy"
@@ -58,9 +44,10 @@ INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."
 FILES:${PN} += "/usr/lib/systemd/system"
 
 RDEPENDS:${PN} += " \
-    python3-fuse \
     python3-gpiod \
+    python3-pyfuse3 \
     python3-pyudev \
+    python3-trio \
 "
 
 python __anonymous() {
-- 
2.47.3


