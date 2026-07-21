Return-Path: <Ishaan.Desai@ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDF9C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 21:46:55 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34694.1784670410130811361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 14:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=XiPRyIzi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: ibm.com, ip: 148.163.158.5, mailfrom: ishaan.desai@ibm.com)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LLBifT2175604
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 21:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ljKlBLzyYyr2V8sriQk44eVYdUViBuSaXG6OQ+mjW
	b0=; b=XiPRyIzil/jmyhvR65onlBzEzEAHiW5oAcK1lkRXHqqvm62QW8ZspAjEq
	E67C54Q4cH8C80urqPmFpIfxfuv23GhqB4QjR4aF2bOBo9GGa3JEJKSrC55szJjp
	tp46we4FqdofJozj18lECdTVt/qRzlQQCx2xQJe4BxicN7zZkLu/vnYLzwUrPjEl
	nlCWno5kSiscWgOTAtv5k8HaghrvvOCgz2UrfdakXYHiD2tbmQL0je3vfdRIf1LD
	4lFOi4m8Kc47xG6ARBHOwFn9Ogh2QqNayuDsDrY71YB1iytnGQBRpnMgdBAyuTN2
	/AViCzxoX55dkVkigpOlA0uP27tBg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fg7ah6kj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 21:46:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LLYbHU001811
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 21:46:48 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fgmtjveu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 21:46:48 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66LLkhoT25035336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2026 21:46:43 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2BE258043;
	Tue, 21 Jul 2026 21:46:42 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A58D58053;
	Tue, 21 Jul 2026 21:46:42 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jul 2026 21:46:42 +0000 (GMT)
From: Ishaan Desai <Ishaan.Desai@ibm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ishaan Desai <Ishaan.Desai@ibm.com>
Subject: [meta-oe][PATCH] memory-control-config: add recipe for per-service systemd memory limits
Date: Tue, 21 Jul 2026 16:46:32 -0500
Message-ID: <20260721214632.1751594-1-Ishaan.Desai@ibm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: InEIZVlL1uxpwtjvtojJ3t_CLrlk_Grv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNSBTYWx0ZWRfX3Cjs4NWykNqU
 5KEVQyL9SLtlWv7n62arXjg9jSh2GMlCyDnXl+XOYOv66t/ZloulL8FzVXJ4SMkBl0Zt/3ICqd4
 ymU+w0cMejxpgGRYpIcHa4r2/Wl9LaJNz9L889qr8pUJiwamwjgV7sUbEZgFQQ+mXSUIz/aMMOg
 IWiWm0nZq5vwSmtp62eLJltz9EEYDEMUgOAxMIwA7H3own72nYec208kvF6TWqgy9HJLogIWbhM
 UGCcGNAFcBKKr0dsoHdX9XZ5KmsIPPhNsy3UzVzRGqmhi+hY9O9RY7wO1thLhxYEXHSTDxD5Ngd
 Vk9KNZ0uaAUKs9FkbDAmgSGOBtB53NG3yWrtOIIc1zYTPVuaThKY99pWkzWln7ILYhSytOou0KV
 1NPw8GfNTbk5Uu7XlhhF0UOVG3ZIfCBg5xJfC6CGlPm85lO1MFbasGlORRykbyH5DqECw1/lJaC
 FHvRdByB/skHwlWXExw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNSBTYWx0ZWRfX3NbbSA64aOVs
 APW192kmrWTIPeT6SjPz18JmrG6/pmIwKBhABOHnTDXqtj9Am3hHTo/EbIu5LGF+8ffbR2coMnl
 NHlgMtIImHMMKmwizVB/ORYLDAzFrsU=
X-Proofpoint-GUID: InEIZVlL1uxpwtjvtojJ3t_CLrlk_Grv
X-Authority-Analysis: v=2.4 cv=SM5ykuvH c=1 sm=1 tr=0 ts=6a5fe8c8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=1G0JcXrOhLlhgDCZcgMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210225
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 21:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128360

Added a recipe that caps the memory usage of individual systemd
services without modifying those services' own recipes. Services and
limits are given via MEMORY_CONTROL_SERVICES as space-separated
<unit>:<limit>[:<oom_policy>] entries. For each recipe, it generates
a systemd drop-in under ${systemd_system_unitdir} setting MemoryMax,
MemoryHigh (70% of max), and MemorySwapMax=0. The optional "kill" policy
also adds OOMPolicy=continue and OOMScoreAdjust=500.

The service list is empty by default, so the recipe is a no-op until a
distro, machine, or product .bbappend configures it. Drop-ins install to
the system unit directory so systemd reads them at boot with no
daemon-reload. Entries are validated at build time so a bad limit fails
the build.

Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>
---
 .../memory-control-config_1.0.bb              | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 meta-oe/recipes-support/memory-control-config/memory-control-config_1.0.bb

diff --git a/meta-oe/recipes-support/memory-control-config/memory-control-config_1.0.bb b/meta-oe/recipes-support/memory-control-config/memory-control-config_1.0.bb
new file mode 100644
index 0000000000..adce8f1328
--- /dev/null
+++ b/meta-oe/recipes-support/memory-control-config/memory-control-config_1.0.bb
@@ -0,0 +1,137 @@
+SUMMARY = "Systemd drop-in memory limits for services"
+DESCRIPTION = "Installs ${systemd_system_unitdir}/<service>.service.d/memory-control.conf \
+drop-in files that apply MemoryMax/MemoryHigh cgroup v2 limits to the services \
+listed in MEMORY_CONTROL_SERVICES, without modifying the service recipes."
+HOMEPAGE = "https://github.com/ishaandesai23/memory-control-config"
+SECTION = "base"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+inherit allarch systemd
+
+# The drop-ins only mean anything under systemd. OpenBMC selects systemd via
+# INIT_MANAGER rather than DISTRO_FEATURES, so accept either.
+python __anonymous() {
+    if (d.getVar('INIT_MANAGER') != 'systemd'
+            and 'systemd' not in (d.getVar('DISTRO_FEATURES') or '').split()):
+        raise bb.parse.SkipRecipe(
+            "memory-control-config requires systemd")
+}
+
+RDEPENDS:${PN} = "systemd"
+
+# Always produce a package, even when no services are configured, so an image
+# or packagegroup can depend on it unconditionally.
+ALLOW_EMPTY:${PN} = "1"
+
+# Nothing is fetched, unpacked, configured or compiled: every file is generated
+# in do_install from MEMORY_CONTROL_SERVICES.
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[dirs] = "${D}"
+do_install[vardeps] += "MEMORY_CONTROL_SERVICES"
+
+
+# Per-service memory limits.  <unit>:<limit>[:<oom_policy>]
+#   <unit>        systemd service name (the .service suffix is optional)
+#   <limit>       raw bytes, or a K/M/G[B] suffix (e.g. 512M, 256K, 1G)
+#   <oom_policy>  "default" (bare limits) or "kill" (adds OOMPolicy=continue
+#                 and OOMScoreAdjust=500)
+#
+# MemoryHigh is 70% of MemoryMax.
+#
+# Leave empty here and set from a distro/machine/product .bbappend:
+#     MEMORY_CONTROL_SERVICES:append = " webui:256M:kill inventory-sync:128M"
+
+MEMORY_CONTROL_SERVICES ??= ""
+
+
+def mc_parse_services(d):
+    """Parse MEMORY_CONTROL_SERVICES into a list of
+    (unit, entry, bytes_max, bytes_high, oom_policy) tuples.
+    Calls bb.fatal on any malformed entry so a typo fails the build.
+    """
+    import re
+
+    size_units = {
+        '':  1,           'B':  1,
+        'K': 1024,        'KB': 1024,
+        'M': 1024 ** 2,   'MB': 1024 ** 2,
+        'G': 1024 ** 3,   'GB': 1024 ** 3,
+    }
+    size_re = re.compile(r'^(\d+)([A-Za-z]*)$')
+
+    result = []
+    for entry in (d.getVar('MEMORY_CONTROL_SERVICES') or '').split():
+        parts = entry.split(':')
+        if not (2 <= len(parts) <= 3):
+            bb.fatal("memory-control-config: malformed entry '%s'; "
+                     "expected <unit>:<limit>[:<oom_policy>]" % entry)
+
+        unit       = parts[0].strip()
+        limit_str  = parts[1].strip()
+        oom_policy = parts[2].strip().lower() if len(parts) == 3 else 'default'
+
+        if not unit.endswith('.service'):
+            unit += '.service'
+
+        if oom_policy not in ('default', 'kill'):
+            bb.fatal("memory-control-config: OOM policy '%s' for '%s' is "
+                     "invalid; use 'default' or 'kill'" % (oom_policy, unit))
+
+        m = size_re.match(limit_str)
+        if not m:
+            bb.fatal("memory-control-config: limit '%s' for '%s' is not a "
+                     "valid size (use raw bytes or a K/M/G[B] suffix)"
+                     % (limit_str, unit))
+
+        number, suffix = m.group(1), m.group(2).upper()
+        if suffix not in size_units:
+            bb.fatal("memory-control-config: unknown size suffix '%s' in "
+                     "'%s' for '%s'" % (m.group(2), limit_str, unit))
+
+        bytes_max = int(number) * size_units[suffix]
+        if bytes_max <= 0:
+            bb.fatal("memory-control-config: limit '%s' for '%s' must be "
+                     "greater than zero" % (limit_str, unit))
+
+        bytes_high = bytes_max * 7 // 10
+        result.append((unit, entry, bytes_max, bytes_high, oom_policy))
+
+    return result
+
+
+python do_install() {
+    import os
+
+    entries = mc_parse_services(d)
+    if not entries:
+        bb.note("memory-control-config: MEMORY_CONTROL_SERVICES is empty; "
+                "nothing to install")
+        return
+
+    destdir      = d.getVar('D')
+    unitdir      = d.getVar('systemd_system_unitdir')
+    pn           = d.getVar('PN')
+
+    for unit, entry, bytes_max, bytes_high, oom_policy in entries:
+        dropin_dir = os.path.join(destdir + unitdir, unit + '.d')
+        os.makedirs(dropin_dir, exist_ok=True)
+        dropin_path = os.path.join(dropin_dir, 'memory-control.conf')
+
+        with open(dropin_path, 'w') as f:
+            f.write('# generated by %s\n' % pn)
+            f.write('# entry: %s\n' % entry)
+            f.write('[Service]\n')
+            f.write('MemoryMax=%d\n'  % bytes_max)
+            f.write('MemoryHigh=%d\n' % bytes_high)
+            f.write('MemorySwapMax=0\n')
+            if oom_policy == 'kill':
+                f.write('OOMPolicy=continue\n')
+                f.write('OOMScoreAdjust=500\n')
+
+        bb.note("memory-control-config: wrote %s (%s, policy=%s)"
+                % (dropin_path, entry, oom_policy))
+}
+
+FILES:${PN} += "${systemd_system_unitdir}"

