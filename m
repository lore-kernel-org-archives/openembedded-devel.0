Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F95C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 06:49:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1980.1743576575255054159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 23:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=618737437a=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5323xBqX017255
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Apr 2025 23:49:35 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtc9rc4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 23:49:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 1 Apr 2025 23:49:34 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 1 Apr 2025 23:49:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python-blivet: 3.9.2 -> 3.12.1
Date: Wed, 2 Apr 2025 14:49:31 +0800
Message-ID: <20250402064931.141444-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LeaY1uJaDNM8_5FjP4CwR4eZveKj_KN5
X-Authority-Analysis: v=2.4 cv=Tb2WtQQh c=1 sm=1 tr=0 ts=67ecddfe cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=2wa6oa2vAAAA:8 a=nEWe1KHDrxgnJTyX5asA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=WlFOoDiSK4xetG-y3QMk:22
X-Proofpoint-GUID: LeaY1uJaDNM8_5FjP4CwR4eZveKj_KN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804 adultscore=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 06:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116506

From: Kai Kang <kai.kang@windriver.com>

Upgrade python-blivet from 3.9.2 to 3.12.1:

* rebase 0002-run_program-support-timeout.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0002-run_program-support-timeout.patch     | 18 +++++++++++-------
 ...livet_3.9.2.bb => python3-blivet_3.12.1.bb} |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.9.2.bb => python3-blivet_3.12.1.bb} (93%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
index d277e8b0f7..b577cd4bd4 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
@@ -6,15 +6,19 @@ Subject: [PATCH 02/11] run_program support timeout
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase for blivet 3.12.1.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- blivet/util.py | 70 +++++++++++++++++++++++++++++---------------------
+ blivet/util.py | 70 ++++++++++++++++++++++++++++++++++------------------------
  1 file changed, 41 insertions(+), 29 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index f8a8f88..a5da7b6 100644
+index d194a5b..5985164 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -171,6 +171,30 @@ class Path(str):
+@@ -169,6 +169,30 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -45,7 +49,7 @@ index f8a8f88..a5da7b6 100644
  
  def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False):
      if env_prune is None:
-@@ -193,35 +217,23 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -191,35 +215,23 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              stderr_dir = subprocess.STDOUT
          else:
              stderr_dir = subprocess.PIPE
@@ -58,7 +62,7 @@ index f8a8f88..a5da7b6 100644
 -                                    preexec_fn=chroot, cwd=root, env=env)
 -
 -            out, err = proc.communicate()
--            if not binary_output and six.PY3:
+-            if not binary_output:
 -                out = out.decode("utf-8")
 -            if out:
 -                if not stderr_to_stdout:
@@ -85,7 +89,8 @@ index f8a8f88..a5da7b6 100644
 +                                   stderr=stderr_dir,
 +                                   close_fds=True,
 +                                   preexec_fn=chroot, cwd=root, env=env)
-+        if not binary_output and six.PY3:
++
++        if not binary_output:
 +            out = out.decode("utf-8")
 +        if out:
 +            if not stderr_to_stdout:
@@ -94,7 +99,6 @@ index f8a8f88..a5da7b6 100644
 +                program_log.info("%s", line)
 +
 +    return (res, out)
-+
  
  
  def run_program(*args, **kwargs):
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
similarity index 93%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
index c22df46564..6a00e48ebb 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
@@ -16,7 +16,7 @@ SRC_URI += "\
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
 "
-SRC_URI[sha256sum] = "9d97e37ebba01db28a1e6155cbd71c54fb55e9c2be5921982dc85bed316d8cfe"
+SRC_URI[sha256sum] = "54775ba212d1574b1b0750ce147f0d3cf3b5d73aaf040d172283edb57db4ba15"
 
 inherit pypi features_check systemd setuptools3_legacy
 
-- 
2.34.1


