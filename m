Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68C9EBFD23
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 09:30:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.268512.1776072605691929364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 02:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ik1GdIDM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8563e11b4c=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5h6O01300488
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 09:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2WtJ2mFY8qGm+QygnyP8
	h0wGHcsbm9wo201rFkx/GH4=; b=ik1GdIDMuuByneb7xeHHtGs66uMOG0m4B+/c
	1TELGc8rTEsQLji2QW/dHBSW+I9mzGjFCI16QQe9rB6vMlZWFSMihmywwXJ9rm5m
	b4vzzBubit/I9g8FzXnEUp4W32J5rjy/pIEnHRgU80IZtBZ3jvC6Oxj1yHfZ+v1N
	L/Fw8Q6LCm5Z7uiUrctGICNo7zVSQ1Ixgk4hQuWjppqSz9poO0MdDBdx4V89mr3C
	6dxvdGFK/WufOWg1ZdbmTkIwEdo3Xp4He2Ntvp3JssZGH+AUDTkktoT/jhL0Ku5j
	t6s6P7FekngF9kbWuc1eG0ekuLB4Q/PhEVGeqSiywMDzFO238A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dfbh2hn7f-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 09:30:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 13 Apr 2026 02:30:02 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 13 Apr 2026 02:30:01 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-blivet: upgrade 3.12.1 -> 3.13.2
Date: Mon, 13 Apr 2026 17:29:55 +0800
Message-ID: <20260413092955.3484051-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qrvy_TCYsqvb3cVfKW4HW2QiQJtkzlq_
X-Proofpoint-ORIG-GUID: qrvy_TCYsqvb3cVfKW4HW2QiQJtkzlq_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MiBTYWx0ZWRfXw5B2HQvM2QI1
 h2xmT9VoexXrwot/dGOtWA4sfwbrebvNO052agVb7PSh7La2W7arGfezDL6gp1bH4LfK/mrfeQp
 RbnirqfvlXV0eaP+gfYgJm0IAkw6pIMIzZoXya68LXP779MiLt8aTr6yBGvzTgiGMXacOWshBBo
 jizXi610GThRL+zhTzF14kDeueDGxeTITXTLKNAlo6ui1NkvmZ/fEWUyQQGp2yJU5IAkjJKxoJ7
 sECS9YQAhLQEffckGNKbJZRf0iDNiVDZZI5U0UiRD3cTtvn8+YklGy2+owKkbmf+d0DZaVxSHBC
 tJDZ/ApridO/Ae0dTFwNxvtHHPOhLVwKT58yezlnvnWchHaTWQovUlgRRNTkQayC55PpL7Jpos2
 vFr0dsW2FgWDkIcYfc6ljBU3AV3Ei31ZjKJ6WEtRayxOQYflRxwavQiNmyrjSSHJN8pbcIdM6uu
 ia5E2VBU/kE4inyARiA==
X-Authority-Analysis: v=2.4 cv=DqRmPm/+ c=1 sm=1 tr=0 ts=69dcb79c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=7BlCLE_KAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=p-iZFbzUF8Msj1Tw878A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 09:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126273

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://github.com/storaged-project/blivet/releases

1. Drop 0008-use-oe-variable-to-replace-hardcoded-dir.patch and add
   do_install:append to manually install D-Bus and systemd files:
   Upstream commit 0f0fd84d [1] removed data_files from setup.py and
   moved their installation to a Makefile target (install-dbus), but
   OE uses setuptools3_legacy which only runs setup.py install and
   does not invoke the Makefile.

2. Add missing RDEPENDS:
   - python3-dasbus: upstream replaced the internal safe_dbus module
     with the external dasbus library [2].
   - python3-pygobject: was always required (gi.repository for
     libblockdev) but missing from old recipe.
   - util-linux: blivet directly calls lsblk, mount, umount and
     blockdev via subprocess.

[1] https://github.com/storaged-project/blivet/commit/0f0fd84d
[2] https://github.com/storaged-project/blivet/commit/1e7c5409

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...oe-variable-to-replace-hardcoded-dir.patch | 35 -------------------
 ...vet_3.12.1.bb => python3-blivet_3.13.2.bb} | 17 +++++++--
 2 files changed, 14 insertions(+), 38 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.12.1.bb => python3-blivet_3.13.2.bb} (60%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
deleted file mode 100644
index d3ab8f8526..0000000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6a85945c060154581f5a129a6a946258bf9333c4 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 8 May 2017 03:54:12 -0400
-Subject: [PATCH 08/11] use oe variable to replace hardcoded dir
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Rebase for python3-blivet 3.4.0.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- setup.py | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index e6bb3f3..700085b 100644
---- a/setup.py
-+++ b/setup.py
-@@ -73,10 +73,10 @@ class blivet_sdist(sdist):
- 
- 
- data_files = [
--    ('/etc/dbus-1/system.d', ['dbus/blivet.conf']),
--    ('/usr/share/dbus-1/system-services', ['dbus/com.redhat.Blivet0.service']),
--    ('/usr/libexec', ['dbus/blivetd']),
--    ('/usr/lib/systemd/system', ['dbus/blivet.service'])
-+    (os.environ.get('sysconfdir')+'/dbus-1/system.d', ['dbus/blivet.conf']),
-+    (os.environ.get('datadir')+'/dbus-1/system-services', ['dbus/com.redhat.Blivet0.service']),
-+    (os.environ.get('libexecdir'), ['dbus/blivetd']),
-+    (os.environ.get('systemd_system_unitdir'), ['dbus/blivet.service'])
- ]
- 
- 
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
similarity index 60%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
index bf492b3d57..a159979b73 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
@@ -11,23 +11,34 @@ SRC_URI += "\
            file://0005-fix-incorrect-timeout-while-system-time-changed.patch \
            file://0006-tweak-btrfs-packages.patch \
            file://0007-invoking-mount-with-infinite-timeout.patch \
-           file://0008-use-oe-variable-to-replace-hardcoded-dir.patch \
            file://0009-invoking-fsck-with-infinite-timeout.patch \
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
 "
-SRC_URI[sha256sum] = "54775ba212d1574b1b0750ce147f0d3cf3b5d73aaf040d172283edb57db4ba15"
+SRC_URI[sha256sum] = "6d8374d05eeab513b2a26cf01267e853df7b31e13ad1a1ba7d73a856190d0518"
 
 inherit pypi features_check systemd setuptools3_legacy
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-RDEPENDS:${PN} += "python3-pykickstart python3-pyudev \
+RDEPENDS:${PN} += "python3-dasbus python3-pygobject python3-pykickstart python3-pyudev \
                    parted python3-pyparted multipath-tools \
                    lsof cryptsetup libblockdev libblockdev-bin \
                    libbytesize \
+                   util-linux \
 "
 
+do_install:append() {
+    install -d ${D}${sysconfdir}/dbus-1/system.d
+    install -m 644 ${S}/dbus/blivet.conf ${D}${sysconfdir}/dbus-1/system.d/blivet.conf
+    install -d ${D}${datadir}/dbus-1/system-services
+    install -m 644 ${S}/dbus/com.redhat.Blivet0.service ${D}${datadir}/dbus-1/system-services/com.redhat.Blivet0.service
+    install -d ${D}${libexecdir}
+    install -m 755 ${S}/dbus/blivetd ${D}${libexecdir}/blivetd
+    install -d ${D}${systemd_system_unitdir}
+    install -m 644 ${S}/dbus/blivet.service ${D}${systemd_system_unitdir}/blivet.service
+}
+
 FILES:${PN} += " \
     ${datadir}/dbus-1/system-services \
 "
-- 
2.34.1


