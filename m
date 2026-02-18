Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95210E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:30:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14476.1771428613515726537
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FhyKIKBr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=P9nDno+s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IF0t5F4024838
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uj6QkJZBGAMs3+qFyucJc+KDTTXv/bMU3odwA5BObOg=; b=FhyKIKBrYy8v6ty9
	UVj5xFdPsCTrRem0j/mwOf9GGNDAW8rhPXtUb+vWPgJdB6Lw4x0YrE1b3OMopx1z
	8mgOL5eUMAtcmzpm74gegJ8rkGSQ0qs+oseM+thAt5foShEobOnyoqzSZujgBh13
	5Ec7Esh6UfL6t2SjJ1pjTqXBy8cO5nTkchUgZk2doatazp5Eygz/Jim1hfRiHrB2
	l3lQjO+RMKqFTOEgwCtNR3qO+gRnPyRFhoHjyJaYqkHnNanmIWf+QOKfySqUVMJ7
	A7o9PjU3CjR8HKe8+xwy1gJsYm94WIC7sGSgFEL/fbk9SNrQ/CEI0FdR1ttXFqc/
	/HUvzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c1fh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:15:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb403842b6so3789119585a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771427725; x=1772032525; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uj6QkJZBGAMs3+qFyucJc+KDTTXv/bMU3odwA5BObOg=;
        b=P9nDno+siaVBijPe73y5i+ER8V5wFpw1iEEQa52X6rdejObBLTR/j3VWcST0qFOXy3
         7DVmGwLt+T4tNQO1h1sqlkuwgF6KFvitmxcUfmiOqcmRx1QGv6cMHLvg6gbZbHf9ee0I
         7ct4pLkFg+gBcm4PzkgUUM3n0rBZCie1KW2vOqfFFSX1YIrF4jy/PHY+KbZFfRVNhj5V
         uJqNgodZidlcGJCJodxylP2OVmsj8YAdRt2iLwtj5i8UbGejgrVoa230efbcEWZPLp7U
         +KuTL0a7Uk/Lnzg43rdbLJ6hxtzufwm9karHwEH9Vm/eh79Go8YTfOXTIwudVaOQldgy
         PFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427725; x=1772032525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uj6QkJZBGAMs3+qFyucJc+KDTTXv/bMU3odwA5BObOg=;
        b=PXWv6YDZ0J3pU8r+ZJU+ASBa7spp1XvGe/vplbqbTyIgkcoUfVocUKd4PScS69alRd
         1nN2Vi8AZtA7kxP9sG2EWz7bAD3JNpVSYaiECFkonmUatOYEf4ZwtPLcgWayLpdOGWwI
         IIpm2aORpx6ldv3omNtcqKWoazOYHCTCF5l9nG+akLm7LcdhJ/zLB0naW7zOIvscyhrl
         V0qXsHJJu1puTcO//oxI6iAa+S7751fQrD0VQjAmSEvspQ1XAKPfjXZfOgsXqN8h6MUa
         vV3/kC5ySJnIR3qz666t18/64054pEDeJ73MHbQJfR1oTfDAN0h8cOODkvRMW6nbMgHQ
         kuZQ==
X-Gm-Message-State: AOJu0YzBh/QIM/1H9TOIelsbniefkZLhz453ml2LG6oAsPwVI27JCxCR
	0/NyFWsayJ/zDCR61akrif7ioED4uJuYCWfOU50JgCEEq0o5SME+5QMTYs8Fn8Bq7ch4YirF/rE
	9Wj+sV5PPPQHR6jsYlcuwd/bajSd5C4qEoveBG3eG2u7CDNySP2gmxEnoYu3lePjSDT0tHvn2hm
	SYiDKqJTBc
X-Gm-Gg: AZuq6aKVCX+SMJ16xZQ2ePZ4PHRWgOK6/AI7wEGmelOOn4I5tmQ8A8+kUrCD/yIr8aT
	MCTrmmTrb4VfEXKD2IqI0SRpLhHjrNM4x8GpvWo+gKHR1MieebymBw2/KYGuC11EoVz79KJOPVa
	bvdho/nINj/LGzZicZGFp2Lpg3j6VJknJY3A+E9ZN4EcxLK96evZBSu5sCL/9RcopZAr3PN/R34
	FUjfOM0pV25RCjyqs/Mx04veM2ttlW9thbQtD9pl+NPrjqhBH24hl60MtGSt43nxKyv79SJdcmv
	VZjRv4/TRUngofcbo7j+F+BiVTxVmRvkBrf7g3vi2E730xGr3eelxSlQcfOlygwCjlaFiUdJC6x
	uf6PxoBn/xg+mW1T6+SZAtqlH3T3FazUivPXwvf68Ar+SvVizWBAb
X-Received: by 2002:a05:620a:2a09:b0:8cb:5d77:946 with SMTP id af79cd13be357-8cb740f0f00mr239823285a.87.1771427725112;
        Wed, 18 Feb 2026 07:15:25 -0800 (PST)
X-Received: by 2002:a05:620a:2a09:b0:8cb:5d77:946 with SMTP id af79cd13be357-8cb740f0f00mr239815385a.87.1771427724572;
        Wed, 18 Feb 2026 07:15:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1503:4cda:107b:9e15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm912573265e9.9.2026.02.18.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:15:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 16:15:05 +0100
Subject: [PATCH meta-filesystems/meta-python 2/2] gpiod-sysfs-proxy: update to v0.1.4
MIME-Version: 1.0
Message-Id: <20260218-gpiod-sysfs-proxy-update-v1-2-55ccdc46b0e8@oss.qualcomm.com>
References: <20260218-gpiod-sysfs-proxy-update-v1-0-55ccdc46b0e8@oss.qualcomm.com>
In-Reply-To: <20260218-gpiod-sysfs-proxy-update-v1-0-55ccdc46b0e8@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4647;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zVt9NSUD1SUARvD0KOsJWv5WDir0d034ySk1+wzZtCA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpldeHCUv2kBM+vzTa+Y8H3x0PJLtFT7SeWKwd2
 J5NS1dsizOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZXXhwAKCRAFnS7L/zaE
 w2yMD/4jrJ6JkUn6+c5AwGsbdJnFvNRG3G/ZXChtjdVMDPGcp3qSbqNlwsMZaaakX3QfRtYmfOV
 8J14n1PiZ8PHZL1lgPZU8tKPrgjvCZO7F+3j1Uvb1dJA4o4AtwUzrr7iLUsRU3P3RvFgC8oBVmE
 nu4qwZ4l+A7q1w5TrvQlvuaCf2Yf9XxnQCSsNyZpvX2w+LFc8H9VQ9aYLXaRoUP+fpanaGPtMnI
 CAAGN6Q8CCq2v/v/+tig5IOumy5LBNYvSFynGH58jN0U9wNUp5PHP6asoDEQ8ciMLwVzyG36fiv
 ptuVimDqiLNR4ByQgBRcQWKVcUHWsPiUvZEaoN7ljqTGbjRj8BMTu6IcaDdZvDnrYwaHB6kDHBl
 XN0T9DRVUnqb2Q22zP5mkdT6i4Z4UzvtESUkAvhXm9flMTq1/igzi7LBaxZZAZ6c0WTaeXHchMa
 xCAq8NvqjOg1drF4//ZcREX/c1YC7MPzPD4QgKKxI4UQZx862OzT8ISXCZVtCkynER4afExQ9yB
 UXjyZDRFRDpSdZLbxdyy8p68QLS5uEBr1BoS6WQspKlrYz2Nj/PNzKpcX0h+sXGEg1687GcPknU
 v+AP//ZfRIcz/IWjUtrhIIL42DncLZvhbBQyASzV4yvvGeMCkEaesQ8DzkPk+HaT/NCeP4zbQhb
 aF3+frl4U6CHI3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: hUsEJpEkjbmFbgcR08MzOfOJKioOndWE
X-Proofpoint-ORIG-GUID: hUsEJpEkjbmFbgcR08MzOfOJKioOndWE
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6995d78d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=SY2WZH_ZdtuyYWv-_0QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEyOSBTYWx0ZWRfX8fP392Sc5X1n
 K7G+7UjRzcy3xtw/rR6v0+BxhutRSCisyKumm6wmUFzmAXnLR/4HndNwbMltdKE/nwUK8GUskD2
 2SjO4biMpyvHOc5Ewol1UJDHM0Iq7XRjYnOhcgfxg9GDTTmFKpCz4A861EZ12DXUhPXOE8zN5kw
 zCyKdd58CMYu0PlBi9WeyDKnE631RZwcvGRKD1A6fKh2q0eWWmzRi8CgZMZug9EEt6ZiYZSYIkU
 RfoSY4XHSXUrZqlOUPB6Ii30Ol4hDo/sSr3EYcWR/uMcblM2PuqDM8tPpH1H604hCyndn10+S5Q
 ShIwfkUGPsaM5t/goU5X780+r9IfPk0UEq/X8kioWHyamaxWGTVJhEBAnxcIAwQdUGBxohWv2wl
 bFCwbTB+D2s242NZjRHJ0CP/tE6vFozOxFCtKuB70p//9Xqg5XOuoEZ7Td3pNyGkjwZeM5FiUSA
 Q3o0txDz7BW3MoWvUkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180129
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124485

This update fixes a couple problems with the proxy daemon but also
addresses local issues with the recipe: modifies the systemd service to
pass attr_timeout=0 for better reliability and updates the test script.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in   | 2 +-
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in                  | 2 +-
 .../{gpiod-sysfs-proxy_0.1.2.bb => gpiod-sysfs-proxy_0.1.4.bb}      | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
index a9cf5e4075450e41ab00794e24e9fb0c5794e5fb..cba731c9fd915ffe654eb01687060d6729afe67b 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
@@ -40,7 +40,7 @@ do_start()
 		mkdir -p $MOUNTPOINT
 	fi
 
-	$PROG $MOUNTPOINT -o nonempty -o allow_other -o default_permissions -o entry_timeout=0 -f | logger -i $NAME &
+	$PROG $MOUNTPOINT -o nonempty -o allow_other -o default_permissions -o entry_timeout=0 -o attr_timeout=0 -f | logger -i $NAME &
 	echo "done"
 }
 
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
index 313523268cae4d823585c67ae815aa39a7ed3006..5f8c4f4834cc0d06ee2e802f0e14086039b0b1c5 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
@@ -7,7 +7,7 @@ Description=User-space, libgpiod-based compatibility layer for linux GPIO sysfs
 [Service]
 RuntimeDirectory=gpio
 Type=simple
-ExecStart=/usr/bin/gpiod-sysfs-proxy @mountpoint@ -f -o nonempty -o allow_other -o default_permissions -o entry_timeout=0
+ExecStart=/usr/bin/gpiod-sysfs-proxy @mountpoint@ -f -o nonempty -o allow_other -o default_permissions -o entry_timeout=0 -o attr_timeout=0
 ExecStop=/bin/umount @mountpoint@
 Restart=always
 
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.4.bb
similarity index 94%
rename from meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
rename to meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.4.bb
index 3e68a52b09d08ebc7bd9367cfba927d5899a2146..52b73f3ff4260f2a0727583fd0679e3e4a38cd2f 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.4.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://run-ptest.in \
 "
 
-SRC_URI[sha256sum] = "4bdd4b8a7042f63a40507ae0f16b360011e67cbb2f0276289636487a54849530"
+SRC_URI[sha256sum] = "bb38e31e4046a7aa0101c53c9e7e2cf319c0cd9620b9ba1641e962fce44a1f3a"
 
 # For full backward compatibility with the kernel sysfs interface, this option
 # must be selected. However, we don't make it the default as - with kernel sysfs
@@ -66,7 +66,7 @@ RDEPENDS:${PN} += " \
 python __anonymous() {
     if d.getVar("PTEST_ENABLED") == "1":
         d.appendVar("SRC_URI", "git://github.com/brgl/gpio-sysfs-compat-tests;protocol=https;branch=main;destsuffix=tests;name=tests")
-        d.setVar("SRCREV_tests", "a3c9daa4650dd1e8d7fd8972db68d9c2c204263d")
+        d.setVar("SRCREV_tests", "2882af358480afcf7eed85584cddd560d6673637")
 }
 
 do_install_ptest() {
@@ -81,5 +81,5 @@ USERADD_PACKAGES = "${PN}-ptest"
 GROUPADD_PARAM:${PN}-ptest = "--system gpio-test"
 USERADD_PARAM:${PN}-ptest = "--system -M -s /bin/nologin -g gpio-test gpio-test"
 
-RDEPENDS:${PN}-ptest += "kmod"
+RDEPENDS:${PN}-ptest += "kmod python3-multiprocess"
 RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"

-- 
2.47.3


