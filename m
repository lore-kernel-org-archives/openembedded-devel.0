Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 68C027720C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:57 +0000 (UTC)
Received: by wmec201 with SMTP id c201so35423240wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5yJqNy7oCJRzff/Y9DHE8/uHK7akMMSBmNLnIAoOrbE=;
	b=FKfU9Uz4AcQ1aoLxb9YlOGzXuKNTUPr1hza/lfKR7pbbg/mUad7ejcOZQB5hqjI6Cq
	vPc8LikAcLT1W/WHyKQTyLnU88IDve7QV4XsBdVgBA4Lw/CIENiqnOVUq1rAMX40aqBr
	JKDuPSeN+XNECkLTxFDX7uMzKGyXv5omdfM8S3Xu8NQLqF261TWV5qeCZYStJK9egEQA
	nh3/cPburSm1Bxqow46PawduOOnQ1TGFJXZ4aZum4lODrCoMe2+B5EYmPhCNJ2mhqT1w
	xDcgD6HhA3jOaedObzh/3uz2EYOo9bmz8iqhpCua3RdZs/wqGmN3hhwQkQetv842sraU
	yKFg==
X-Received: by 10.194.250.3 with SMTP id yy3mr19130475wjc.92.1447338177235;
	Thu, 12 Nov 2015 06:22:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	he3sm14692117wjc.48.2015.11.12.06.22.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:23:01 +0100
Message-Id: <1447338183-9675-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 7/9] lmsensors: drop LINUX=${STAGING_KERNEL_DIR} from EXTRA_OEMAKE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 14:22:57 -0000

* it builds fine without it, STAGING_KERNEL_DIR depends on MACHINE and
  would cause whole recipe (and everything depending on it) MACHINE_ARCH
* there wasn't any kernel dependency, so STAGING_KERNEL_DIR was
  potentially empty anyway, there is no change shown in buildhistory
* nothing in lmsensors is using LINUX variable:
  OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/lmsensors/3.4.0-r0 $ grep -R LINUX .
  grep: ./packages-split/lmsensors-libsensors-dev/usr/lib/libsensors.so: No such file or directory
  grep: ./pseudo/pseudo.socket: No such device or address
* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: lmsensors different signature for task do_configure.sigdata between qemux86copy and qemux86
basehash changed from 25ea9d362a28aa9ec283114e5793832e to c292324f876baec39dda79cb21ec969c
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: openlmi-networking different signature for task do_configure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-native_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glib-2.0glib-2.0_2.44.1.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'konkretcmpikonkretcmpi_0.9.2.bb.do_populate_sysroot', 'libchecklibcheck_0.10.0.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot',
'networkmanagernetworkmanager_1.0.4.bb.do_populate_sysroot', 'openlmiopenlmi-networking_0.3.1.bb.do_generate_toolchain_file', 'openlmiopenlmi-networking_0.3.1.bb.do_patch', 'openlmiopenlmi-providers_0.6.0.bb.do_populate_sysroot', 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sysroot']
to
['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-native_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glib-2.0glib-2.0_2.44.1.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'konkretcmpikonkretcmpi_0.9.2.bb.do_populate_sysroot', 'libchecklibcheck_0.10.0.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot',
'networkmanagernetworkmanager_1.0.4.bb.do_populate_sysroot', 'openlmiopenlmi-networking_0.3.1.bb.do_generate_toolchain_file', 'openlmiopenlmi-networking_0.3.1.bb.do_patch', 'openlmiopenlmi-providers_0.6.0.bb.do_populate_sysroot', 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sysroot']
meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 669fc52398649d64161a4848e6d1903f
 changed to
meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 8bb7a9a90ebe53c8c3d957ef7715b6e7
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_populate_sysroot changed from 669fc52398649d64161a4848e6d1903f to 8bb7a9a90ebe53c8c3d957ef7715b6e7

ERROR: openlmi-providers different signature for task do_configure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-native_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'konkretcmpikonkretcmpi-native_0.9.2.bb.do_populate_sysroot', 'konkretcmpikonkretcmpi_0.9.2.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'libuserlibuser_0.62.bb.do_populate_sysroot',
'lm_sensorslmsensors_3.4.0.bb.do_populate_sysroot', 'openlmiopenlmi-providers_0.6.0.bb.do_generate_toolchain_file', 'openlmiopenlmi-providers_0.6.0.bb.do_patch', 'pciutilspciutils_3.3.1.bb.do_populate_sysroot', 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sysroot', 'sblim-sfcbsblim-sfcb_1.4.8.bb.do_populate_sysroot', 'swigswig_3.0.6.bb.do_populate_sysroot', 'swigswig_3.0.6.bb.do_populate_sysroot:virtual:native', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot', 'systemdsystemd_225.bb.do_populate_sysroot']
to
['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-native_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'konkretcmpikonkretcmpi-native_0.9.2.bb.do_populate_sysroot', 'konkretcmpikonkretcmpi_0.9.2.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'libuserlibuser_0.62.bb.do_populate_sysroot',
'lm_sensorslmsensors_3.4.0.bb.do_populate_sysroot', 'openlmiopenlmi-providers_0.6.0.bb.do_generate_toolchain_file', 'openlmiopenlmi-providers_0.6.0.bb.do_patch', 'pciutilspciutils_3.3.1.bb.do_populate_sysroot', 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sysroot', 'sblim-sfcbsblim-sfcb_1.4.8.bb.do_populate_sysroot', 'swigswig_3.0.6.bb.do_populate_sysroot', 'swigswig_3.0.6.bb.do_populate_sysroot:virtual:native', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot', 'systemdsystemd_225.bb.do_populate_sysroot']
meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb.do_populate_sysroot with hash 54e712e3cb33bb71e3dffd37fef1f711
 changed to
meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb.do_populate_sysroot with hash 4bb2920a72bc6dcdce21bd8944a0e883
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_populate_sysroot changed from 54e712e3cb33bb71e3dffd37fef1f711 to 4bb2920a72bc6dcdce21bd8944a0e883

ERROR: openlmi-storage different signature for task do_configure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['cmpi-bindingscmpi-bindings_git.bb.do_populate_sysroot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'openlmiopenlmi-providers_0.6.0.bb.do_populate_sysroot', 'openlmiopenlmi-storage_0.8.1.bb.do_patch', 'pythonpython-native_2.7.9.bb.do_populate_sysroot', 'pythonpython-setuptools_18.2.bb.do_populate_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_populate_sysroot', 'pywbempywbem_0.8.0.bb.do_populate_sysroot']
to
['cmpi-bindingscmpi-bindings_git.bb.do_populate_sysroot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'openlmiopenlmi-providers_0.6.0.bb.do_populate_sysroot', 'openlmiopenlmi-storage_0.8.1.bb.do_patch', 'pythonpython-native_2.7.9.bb.do_populate_sysroot', 'pythonpython-setuptools_18.2.bb.do_populate_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_populate_sysroot', 'pywbempywbem_0.8.0.bb.do_populate_sysroot']
meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 669fc52398649d64161a4848e6d1903f
 changed to
meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 8bb7a9a90ebe53c8c3d957ef7715b6e7
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_populate_sysroot changed from 669fc52398649d64161a4848e6d1903f to 8bb7a9a90ebe53c8c3d957ef7715b6e7

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index a483fb3..62ea131 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -30,7 +30,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 S = "${WORKDIR}/lm_sensors-${PV}"
 
-EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \
+EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
         MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
         LIBDIR=${libdir} \
         CC="${CC}" AR="${AR}"'
-- 
2.6.3


