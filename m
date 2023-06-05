Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA56C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 10:47:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4444.1685962070130088191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 03:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hwAgm5p6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5520839f50=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 355AlnCY004143
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jun 2023 10:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=8rsYIUs5j0nAapVKZ3U1p/t0NjCXZvbpMihdVOh46gQ=;
 b=hwAgm5p6YvCl24SZOne9IodJhbC/Izlmu10a5Za7hReZZNP0y8TU7vl2YWA73lnUBmlC
 203GG0x/4guEc9NZ6ZdvS3OIIWfrGeuimCXfzAgn3yzDVjTTLiiR9mNF4o+3NDPjrugA
 OAxZWzcCQtiWkQQegR8DScVTyneV4wZ52p5RorxewdHzVdEkuKgk3SrAqrZF8ZRtposF
 gE5/YaDeMH+SoRXvAejVd6CdPcNYs31EJLPw4Ut6P190/9Cs2cVhzk4BNnWTUeq9igzi
 H1AiQzhbp+UjTUgnrUgh1B6OPXYPMnKf8UMLG+adWJYPFNx/sB/3o/rezV+H+8CDdUGB 9A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8hdk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 10:47:49 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 03:47:46 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH V2 1/1] tcpreplay: fix CVE-2023-27784,27785,27786,27787,27788,27789
Date: Mon, 5 Jun 2023 10:47:33 +0000
Message-ID: <20230605104733.2290460-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: JFdhVQ4RyW37XQiaYR95suVg70cbr2Lx
X-Proofpoint-GUID: JFdhVQ4RyW37XQiaYR95suVg70cbr2Lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306050096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 10:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103128

An issue found in TCPReplay v.4.4.3 allows a remote attacker to cause a denial of service via
the read_hexstring function at the utils.c:309 endpoint, the read_hexstring function at
the utils.c:309 endpoint, the macinstring function, the parse_list function at the list.c:81 endpoint,
the ports2PORT function at the portmap.c:69 endpoint and the cidr2cidr function at the cidr.c:178 endpoint.

This security patch incorporates fixes for below list of CVEs
	CVE-2023-27784
	CVE-2023-27785
	CVE-2023-27786
	CVE-2023-27787
	CVE-2023-27788
	CVE-2023-27789

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-27784
https://nvd.nist.gov/vuln/detail/CVE-2023-27785
https://nvd.nist.gov/vuln/detail/CVE-2023-27786
https://nvd.nist.gov/vuln/detail/CVE-2023-27787
https://nvd.nist.gov/vuln/detail/CVE-2023-27788
https://nvd.nist.gov/vuln/detail/CVE-2023-27789
https://github.com/appneta/tcpreplay/pull/783

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-27784.patch  | 94 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.2.bb              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27784.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27784.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27784.patch
new file mode 100644
index 000000000..0cc2f295b
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27784.patch
@@ -0,0 +1,94 @@
+From df18c48812462ea802d639d2477887055666ee58 Mon Sep 17 00:00:00 2001
+From: Marsman1996 <lqliuyuwei@outlook.com>
+Date: Wed Mar 1 16:52:35 2023 +0800
+Subject: [PATCH] Add check after call strtok_r
+
+CVE: CVE-2023-27784 CVE-2023-27785 CVE-2023-27786 CVE-2023-27787 CVE-2023-27788 CVE-2023-27789
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/342d29d9e42898b1e097a9f9a31fe0ad15d2f43b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/common/cidr.c     | 4 ++++
+ src/common/list.c     | 2 +-
+ src/common/mac.c      | 2 +-
+ src/common/utils.c    | 2 ++
+ src/tcpedit/portmap.c | 2 +-
+ 5 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/common/cidr.c b/src/common/cidr.c
+index 59aaf87..4fc8aad 100644
+--- a/src/common/cidr.c
++++ b/src/common/cidr.c
+@@ -295,6 +295,8 @@ parse_cidr(tcpr_cidr_t ** cidrdata, char *cidrin, char *delim)
+
+     /* first iteration of input using strtok */
+     network = strtok_r(cidrin, delim, &token);
++    if (network == NULL)
++        return 0;
+
+     *cidrdata = cidr2cidr(network);
+     cidr_ptr = *cidrdata;
+@@ -362,6 +364,8 @@ parse_endpoints(tcpr_cidrmap_t ** cidrmap1, tcpr_cidrmap_t ** cidrmap2, const ch
+         /* ipv4 mode */
+         memset(newmap, '\0', NEWMAP_LEN);
+         map = strtok_r(string, ":", &token);
++        if (map == NULL)
++            goto done;
+
+         strlcpy(newmap, "0.0.0.0/0:", NEWMAP_LEN);
+         strlcat(newmap, map, NEWMAP_LEN);
+diff --git a/src/common/list.c b/src/common/list.c
+index 303e5a5..fbd5450 100644
+--- a/src/common/list.c
++++ b/src/common/list.c
+@@ -78,7 +78,7 @@ parse_list(tcpr_list_t ** listdata, char *ourstr)
+     second = NULL;
+
+     /* regex test */
+-    if (regexec(&preg, this, 0, NULL, 0) != 0) {
++    if (this == NULL || regexec(&preg, this, 0, NULL, 0) != 0) {
+         warnx("Unable to parse: %s", this);
+         regfree(&preg);
+         return 0;
+diff --git a/src/common/mac.c b/src/common/mac.c
+index 3747a17..8ec2df3 100644
+--- a/src/common/mac.c
++++ b/src/common/mac.c
+@@ -117,7 +117,7 @@ macinstring(const char *macstring, const u_char *mac)
+     memset(&tempmac[0], 0, sizeof(tempmac));
+
+     tempstr = strtok_r(ourstring, ",", &tok);
+-    if (strlen(tempstr)) {
++    if (tempstr != NULL && strlen(tempstr)) {
+        mac2hex(tempstr, tempmac, len);
+        if (memcmp(mac, tempmac, len) == 0) {
+            dbgx(3, "Packet matches: " MAC_FORMAT " sending out primary.\n", MAC_STR(tempmac));
+diff --git a/src/common/utils.c b/src/common/utils.c
+index a641939..fcfddb5 100644
+--- a/src/common/utils.c
++++ b/src/common/utils.c
+@@ -306,6 +306,8 @@ read_hexstring(const char *l2string, u_char *hex, const int hexlen)
+
+     /* get the first byte */
+     l2byte = strtok_r(string, ",", &token);
++    if (l2byte == NULL)
++        err(-1, "Hex buffer must contain something");
+     sscanf(l2byte, "%x", &value);
+     if (value > 0xff)
+         errx(-1, "Invalid hex string byte: %s", l2byte);
+diff --git a/src/tcpedit/portmap.c b/src/tcpedit/portmap.c
+index 61c0d2a..ebafe39 100644
+--- a/src/tcpedit/portmap.c
++++ b/src/tcpedit/portmap.c
+@@ -194,7 +194,7 @@ parse_portmap(tcpedit_portmap_t ** portmap, const char *ourstr)
+     /* first iteration of input */
+     substr = strtok_r(ourstrcpy, ",", &token);
+
+-    if ((*portmap = ports2PORT(substr)) == NULL) {
++    if (substr == NULL || (*portmap = ports2PORT(substr)) == NULL) {
+         safe_free(ourstrcpy);
+         return 0;
+     }
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
index ccff19f16..1e240c69e 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
            file://CVE-2023-27783.patch \
+           file://CVE-2023-27784.patch \
            "
 
 SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
-- 
2.40.0


