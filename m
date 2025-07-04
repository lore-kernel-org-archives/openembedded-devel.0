Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7457AC8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 11:53:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.10320.1751627852383183295
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jul 2025 04:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ck27axxQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564752Jm032128
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Jul 2025 11:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5lWLACe9iYFPX90+OMwydKMdX/XXDxMvJCu
	LxP0KG8Y=; b=Ck27axxQxUMqIiCe5PysrT3gisnzDuzUuaIP43ahnJyqUHeekq1
	8xxP/aGJuhfJAX5NxlNuVE+2WmPdZtWQY2auD3paCqBO2kE0b7MKqnSzkm1ABubN
	5XvcL5fcL0tKEULk4Un3mYjyieTfp90ZIK4PqkeABdOqXA009c8ymv602QdAdqgJ
	6jkTiwicYVVNPS8UmOmKBDNy6stJEfgowi+DqoVMz/GEv9D0yA9FlBDaF99he/Vp
	ndY7o7KxHUGI8EgA0EOPloS+//uDKnEbZKleaBx9QxWQMuOPXb45wzoWdICmJaUG
	xyePndxx4Ft/2j73oh247DQNxeWJD+ce36w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63km26q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 11:17:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399065d55so101524385a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 04:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627850; x=1752232650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lWLACe9iYFPX90+OMwydKMdX/XXDxMvJCuLxP0KG8Y=;
        b=kM7MOCF3kGF3fUUJT9qRof8Dl5KQlp7fr9XwBJ82yy/cmYKGVlWS3rgjhrd3rG7uSM
         9yXCFQ3Wmdxww2nAAfrTao4HxeEfVgvnCFXfKTccoTJihLIuZ0g87dDYpLIDFTyCkZ9R
         Nv0L+zSJVGaxQKR4KQq71vdvq+Wrj3Vnma5XVhp29QKIF4uDO631R/tyatciVWOw3QsJ
         O8dHmssidESBuez8UorqWek/2tLRHAuNuQsZ9AAqOhawt2OZe+8bm1h3rDczRzq/+nMy
         8SdEForei+eoW4nG7netrdiVK6eIjhPBtedaUrKlstFm4mWpFyPFGP/qCneNayb3XjL4
         NJEA==
X-Gm-Message-State: AOJu0YzOgB16P99bxBAA+Pno3UMBhbVwbs75aj+xc4Ks/TLlFgx07fe5
	L9RuDrBXak49FdaQuuJXq7jm6QeJKwGcty/WqPWw2qTxTemcKtkTVT1S/b3rBoKW7IjA2hUHA47
	SYHF4/Ex2LNQJgddJZhlNgBLLLi3u6pd8UeABVg7F+9zAkiFoWmNhHaCZJENjtXqV65eZ1xd5vh
	t3SPmvAt8GogtVboj5ucM=
X-Gm-Gg: ASbGnctznJ0hZbAcO1uWb9s3uoxRhbnVHFKZawBHTilyWPSudamN43wQTUs/ZU40qxt
	1+W5i+hqXoaFZdSiqbWEzjRIJaAtSuqjKqMQ3kgk1zaYoXOAAbkNOR5fYe68s2xoeYzaw7grXcy
	gLgxl9E3S9aYDfF4CtciFAr0KX+UwCLcmOs4r6kr/AMTB9Mi4MAGbklHFrfqvLKIniAuXab8X85
	SJG8I18kG73AudrlJE8h+7rnkYt5+i/zhkDEwhT2jYAd1I0Hao/3YGnyM0o7yteOky3sZ46qiYd
	jred30YiX9K8VbtyaByUP4icKS9hqvWKX7cIIANiYOH5Yg==
X-Received: by 2002:a05:620a:31a6:b0:7d4:45d9:1f0d with SMTP id af79cd13be357-7d5ddb594fdmr237612085a.19.1751627850238;
        Fri, 04 Jul 2025 04:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE768W1ooZF1nWM6TTWu57eBMphoHKjyfkdVbvGa/ZU4WKp8yK2IMx+5r/lkBFWTAP2tDBVfw==
X-Received: by 2002:a05:620a:31a6:b0:7d4:45d9:1f0d with SMTP id af79cd13be357-7d5ddb594fdmr237608285a.19.1751627849703;
        Fri, 04 Jul 2025 04:17:29 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c9cb0sm1178202a12.77.2025.07.04.04.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 04:17:29 -0700 (PDT)
From: "Koen Kooi" <koen.kooi@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH] dracut: add 'git' recipe with DEFAULT_PREFERENCE = -1
Date: Fri,  4 Jul 2025 13:17:27 +0200
Message-Id: <20250704111727.1336471-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6867b84b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=x3ktNo5PI9s8QzfMSQMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4NiBTYWx0ZWRfX+2Z/DBGYpewp
 89FHdnvriAR2EuZx8xSqQDj13ZLz/O2cLU3e6R3t9KHEmluY0f/uvsjL2TijtkIeLWz71EIe7aw
 xzBcax5lBXdGAF+eWdzaj/LheHrZOIv+8R9+vYZWp1qXWb03C95wdlbGPeB/JEhwip/IdwF+o2C
 kta9qLIawyq1LnYx+IDRWmNPc/xHgHoCs++skNnt6JYk4iUIUj2WISFPM+H5R1F2BcLOBJnEy/A
 SfVmQLRN9v9vOcyjZex9l/Zvc+QCQiOUH0Vq3nS8f55PxyqFVUKwqkSlRCGWppNymMnpT9Uyl6g
 LMHOMUCdROGDRDsKPqRTX5oyJ1EPC+rY2qMunUaNC29o92AHo6oIWeXVHXbjPGt66dNp/MFH9BT
 Pm5a3hNlLsZaIpKKX+15xwbKR+MRD+T+2bcq1WKX+rkfL6WPQpJVQMu1Pq/Ki6fsrzvNQreg
X-Proofpoint-ORIG-GUID: sf8nUUMQ3NZiDrSkyyf_ZUHMlb0L6zxv
X-Proofpoint-GUID: sf8nUUMQ3NZiDrSkyyf_ZUHMlb0L6zxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040086
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 11:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118233

This updates to a revision that has PR1260, which uses ELF entries to
get dependencies instead of (cross-)ldd. This makes it useable as a tool
to generate initramfses using cross tools, in e.g. do_rootfs.

Since this is not using a tagged release and changes the base logic, add
it as a non-default option using DEFAULT_PREFERENCE = -1.

Extend to native(-sdk) to accomplish just that.

The host-built initramfs (using a custom bbclass) as well as the
on-target built initramfs have been tested on qrb2210-rb1-core-kit and
qcs6490-rb3gen-core-kit machines and work as intented.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 .../recipes-devtools/dracut/dracut_git.bb     | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut_git.bb

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
new file mode 100644
index 0000000000..4a8e7e56aa
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -0,0 +1,106 @@
+SUMMARY = "Initramfs generator using udev"
+HOMEPAGE = "https://dracut.wiki.kernel.org/index.php/Main_Page"
+DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the tool) is used to create an initramfs image by copying tools and files from an installed system and combining it with the dracut framework, usually found in /usr/lib/dracut/modules.d."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+# Since this is not using a release tag *and* features a rewrite of the dependency logic:
+DEFAULT_PREFERENCE = "-1"
+
+PE = "1"
+
+# We want to drag in PR1260 to use ELF .note.dlopen entries instead of (cross-)ldd, but that was applied a week after the 107 tag
+PV = "107+git"
+SRCREV = "79ffbd28294818a36e515a441142125d70e3acbb"
+SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
+           "
+
+DEPENDS += "kmod"
+DEPENDS:append:libc-musl = " fts"
+
+inherit bash-completion pkgconfig
+
+EXTRA_OECONF = "--prefix=${prefix} \
+                --libdir=${nonarch_libdir} \
+                --datadir=${datadir} \
+                --sysconfdir=${sysconfdir} \
+                --sbindir=${sbindir} \
+                --bindir=${bindir} \
+                --includedir=${includedir} \
+                --localstatedir=${localstatedir} \
+                --disable-documentation \
+               "
+
+# RDEPEND on systemd optionally
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
+
+EXTRA_OEMAKE += 'libdir=${nonarch_libdir} LDLIBS="${LDLIBS}" enable_test=no DRACUT_FULL_VERSION=${PV}'
+
+CFLAGS:append = " -fPIC"
+LDLIBS:append:libc-musl = " -lfts"
+
+do_configure() {
+    ./configure ${EXTRA_OECONF}
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+    # Its Makefile uses cp -arx to install modules.d, so fix the owner
+    # to root:root
+    chown -R root:root ${D}/${nonarch_libdir}/dracut/modules.d \
+        ${D}/${nonarch_libdir}/dracut/dracut.conf.d
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        rm -rf ${D}${nonarch_libdir}/systemd
+    fi
+}
+
+do_install:append:class-target () {
+    # Generate and install a config file listing where the DISTRO puts things, dracut
+    # is not always savvy enough to figure it out by itself
+    # Since this primarily fixes systemd issues, only install it when using systemd.
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        cat << EOF > ${B}/${DISTRO}.conf
+stdloglvl=3
+sysloglvl=5
+sysctlconfdir=${sysconfdir}/sysctl.d
+systemdutildir=${systemd_unitdir}
+systemdutilconfdir=${sysconfdir}/systemd
+systemdcatalog=${systemd_unitdir}catalog
+systemdntpunits=${systemd_unitdir}ntp-units.d
+systemdntpunitsconfdir=${sysconfdir}/systemd/ntp-units.d
+systemdportable=${systemd_unitdir}/portable
+systemdportableconfdir=${sysconfdir}/systemd/portable
+systemdsystemunitdir=${systemd_system_unitdir}
+systemdsystemconfdir=${sysconfdir}/systemd/system
+systemduser=${systemd_user_unitdir}
+systemduserconfdir=${sysconfdir}/systemd/user
+EOF
+        install -m 0644 ${B}/${DISTRO}.conf ${D}${libdir}/dracut/dracut.conf.d/
+    fi
+}
+
+
+FILES:${PN} += "${nonarch_libdir}/kernel \
+                ${nonarch_libdir}/dracut \
+                ${systemd_unitdir} \
+               "
+FILES:${PN}-dbg += "${nonarch_libdir}/dracut/.debug"
+
+CONFFILES:${PN} += "${sysconfdir}/dracut.conf"
+
+# The native variant uses a non-ldd based method of getting library
+# dependencies, so ldd is only needed on the target
+RDEPENDS:${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux bash"
+RDEPENDS:${PN}:append:class-target = " ldd"
+
+# This could be optimized a bit, but let's avoid non-booting systems :)
+RRECOMMENDS:${PN}:class-target = "kernel-modules \
+                                  coreutils \
+                                 "
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2010-4176] = "not-applicable-platform: Applies only to Fedora"
-- 
2.34.1


