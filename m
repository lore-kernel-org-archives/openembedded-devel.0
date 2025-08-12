Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA00CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 11:33:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.72102.1754998432201094848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Aug 2025 04:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0319cbf0ca=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57CAq9IX939760
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 11:33:51 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fv000ct7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 11:33:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 12 Aug 2025 04:33:48 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] libssh: upgrade 0.11.1 -> 0.11.2
Date: Tue, 12 Aug 2025 17:03:16 +0530
Message-ID: <20250812113316.1304210-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=JKQ7s9Kb c=1 sm=1 tr=0 ts=689b269f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=nar8ntqeAAAA:8 a=OHaIBjURDuY9YG9lux0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=RptMqvEBejqe73AKBt4K:22
X-Proofpoint-ORIG-GUID: AlpBWP0PbcAGrQKjKIoUTJPPMorFlVpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExMSBTYWx0ZWRfX21DRSLBHtg9s
 Rr6j0sC5pqDR5xIoYSjbmebDkYPT8m9NvHNlAmRlOSJWASIdNKOsYtzrrJwFMEScbmHct/T0Rl0
 7m/2H2yKyDkv9VD3BjCWRu+8hRb4SkhllbOn4ZnkEDhUX0vx4R0e/9HeSckTSZhZRJmNEA9O/QU
 48TNllcFYRf+8n98Wo8L2Q4JFHp1LJ4KGjot3NNpX5nWFC9T9hnlQ7FQBBOVRyfrGPnFVZjF4nS
 J6cV3SlB7GmyDs0YS+OCl/OPEWrJsHylZufn8/JlIjryOOu7lH9qSeFP5I3q++uGCGTLUaaPga5
 IXjhaOqN7ozr13ZvTKYfLa7UCBIJ7j5L49Vnji96H2MLBko54UwqiC85wsCIzs=
X-Proofpoint-GUID: AlpBWP0PbcAGrQKjKIoUTJPPMorFlVpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 11:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118916

From: Wang Mingyu <wangmy@fujitsu.com>

 * Security:
   * CVE-2025-4877 - Write beyond bounds in binary to base64 conversion
   * CVE-2025-4878 - Use of uninitialized variable in privatekey_from_file()
   * CVE-2025-5318 - Likely read beyond bounds in sftp server handle management
   * CVE-2025-5351 - Double free in functions exporting keys
   * CVE-2025-5372 - ssh_kdf() returns a success code on certain failures
   * CVE-2025-5449 - Likely read beyond bounds in sftp server message decoding
   * CVE-2025-5987 - Invalid return code for chacha20 poly1305 with OpenSSL
 * Compatibility
   * Fixed compatibility with CPM.cmake
   * Compatibility with OpenSSH 10.0
   * Tests compatibility with new Dropbear releases
   * Removed p11-kit remoting from the pkcs11 testsuite
 * Bugfixes
   * Implement missing packet filter for DH GEX
   * Properly process the SSH2_MSG_DEBUG message
   * Allow escaping quotes in quoted arguments to ssh configuration
   * Do not fail with unknown match keywords in ssh configuration
   * Process packets before selecting signature algorithm during authentication
   * Do not fail hard when the SFTP status message is not sent by noncompliant
     servers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libssh/{libssh_0.11.1.bb => libssh_0.11.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.1.bb => libssh_0.11.2.bb} (94%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb b/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
similarity index 94%
rename from meta-oe/recipes-support/libssh/libssh_0.11.1.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.2.bb
index 5f39c2d79c..5baaa49949 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11 \
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "854795c654eda518ed6de6c1ebb4e2107fcb2e73"
+SRCREV = "dff6c0821ed54f6fbf5b755af43f54cbb723b1b1"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


