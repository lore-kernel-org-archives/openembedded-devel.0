Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4733C77B60
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 02:04:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11023.1682561052465826563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Apr 2023 19:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BnZ0Qmkp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3481b1ee74=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R1wesq031977
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 19:04:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=UxaGf61kYzOCbpfqlefSgjq8Wt4Bqe5NeEFkTXefboo=;
 b=BnZ0QmkpQW4EowwMIG9RVOB/IvYGqNI4eA215dmgxe16jJGlKxs/emX1tdbeprO6A9Nj
 3GU6+UEK8xy9M2VusqcwlluR4eCZYwoMCJamSGW8c7+WQOmEuqgvwofv6ldDM4BTdcJi
 ZZXn6lh3WwjY4X1ZzTu3TBoLLvsp1HDL6jgwYEbUlkirHC3BmsJbOjjiyr+7hcDYOQ7j
 Vtv1GcxaqPKxQIPRVAG2qOk9ymmdcFTdBFAc9gUb+AuirjQJQrKF7oRVPYEmk6pk8m7Z
 FreM893G6/vF2Uk4n0XYX1s8qlNVS/nO2iudEckOERV18b8gBQ0ktaWsaUDsJDwJQs6Z qg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4f3mmp72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 19:04:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 19:04:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 19:04:09 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] zabbix: fix CVE-2023-29451
Date: Thu, 27 Apr 2023 10:04:08 +0800
Message-ID: <20230427020408.2736070-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bKKoltMhnFokSWEEh0zD0SMX2Cbf9mx7
X-Proofpoint-GUID: bKKoltMhnFokSWEEh0zD0SMX2Cbf9mx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_01,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 02:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102203

From: Changqing Li <changqing.li@windriver.com>

Refer: https://support.zabbix.com/browse/ZBX-22587

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../zabbix/zabbix/CVE-2023-29451.patch        | 116 ++++++++++++++++++
 .../zabbix/zabbix_5.4.12.bb                   |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29451.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29451.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29451.patch
new file mode 100644
index 000000000..453f67a92
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29451.patch
@@ -0,0 +1,116 @@
+From 90274a56b2505997cd1677f0bd6a8b89b21df163 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 26 Apr 2023 15:00:07 +0800
+Subject: [PATCH] Fix CVE-2023-29451
+
+.......PS. [DEV-2450] fixed JSON validation not detecting invalid unicode characters and out of bounds access with JSONPath on invalid unicode character
+
+Merge in ZBX/zabbix from feature/DEV-2450-6.0 to release/6.0
+
+* commit '97efb4ed5069d4febe825671e2c3d106478d082d':
+  .......PS. [DEV-2450] added mock test
+  .......PS. [DEV-2450] fixed JSON validation not detecting invalid unicode characters and out of bounds access with JSONPath on invalid unicode character
+  .......PS. [DEV-2450] fixed JSON validation not detecting invalid unicode characters and out of bounds access with JSONPath on invalid unicode character
+
+Upstream-Status: Backport
+[https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/3b6a8c84612a67daaf89879226349420104bff24]
+CVE: CVE-2023-29451
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/libs/zbxdiag/diag.c                      |  3 ++-
+ src/libs/zbxjson/json.c                      |  2 +-
+ src/libs/zbxjson/json.h                      |  1 +
+ src/libs/zbxjson/json_parser.c               | 15 +++++----------
+ src/zabbix_server/reporter/report_protocol.c |  3 ++-
+ 5 files changed, 11 insertions(+), 13 deletions(-)
+
+diff --git a/src/libs/zbxdiag/diag.c b/src/libs/zbxdiag/diag.c
+index 6fc5509..dc47407 100644
+--- a/src/libs/zbxdiag/diag.c
++++ b/src/libs/zbxdiag/diag.c
+@@ -673,7 +673,8 @@ static void	diag_get_simple_values(const struct zbx_json_parse *jp, char **msg)
+ 	{
+ 		if (FAIL == zbx_json_brackets_open(pnext, &jp_value))
+ 		{
+-			zbx_json_decodevalue_dyn(pnext, &value, &value_alloc, &type);
++			if (NULL == zbx_json_decodevalue_dyn(pnext, &value, &value_alloc, &type))
++				type = ZBX_JSON_TYPE_NULL;
+ 
+ 			if (0 != msg_offset)
+ 				zbx_chrcpy_alloc(msg, &msg_alloc, &msg_offset, ' ');
+diff --git a/src/libs/zbxjson/json.c b/src/libs/zbxjson/json.c
+index 4161ef0..c043d7e 100644
+--- a/src/libs/zbxjson/json.c
++++ b/src/libs/zbxjson/json.c
+@@ -764,7 +764,7 @@ static unsigned int	zbx_hex2num(char c)
+  *               0 on error (invalid escape sequence)                         *
+  *                                                                            *
+  ******************************************************************************/
+-static unsigned int	zbx_json_decode_character(const char **p, unsigned char *bytes)
++unsigned int	zbx_json_decode_character(const char **p, unsigned char *bytes)
+ {
+ 	bytes[0] = '\0';
+ 
+diff --git a/src/libs/zbxjson/json.h b/src/libs/zbxjson/json.h
+index c59646a..4008411 100644
+--- a/src/libs/zbxjson/json.h
++++ b/src/libs/zbxjson/json.h
+@@ -29,5 +29,6 @@
+ 	SKIP_WHITESPACE(src)
+ 
+ void	zbx_set_json_strerror(const char *fmt, ...) __zbx_attr_format_printf(1, 2);
++unsigned int	zbx_json_decode_character(const char **p, unsigned char *bytes);
+ 
+ #endif
+diff --git a/src/libs/zbxjson/json_parser.c b/src/libs/zbxjson/json_parser.c
+index c8dcee4..64d24cf 100644
+--- a/src/libs/zbxjson/json_parser.c
++++ b/src/libs/zbxjson/json_parser.c
+@@ -88,7 +88,7 @@ static zbx_int64_t	json_parse_string(const char *start, char **error)
+ 		if ('\\' == *ptr)
+ 		{
+ 			const char	*escape_start = ptr;
+-			int		i;
++			unsigned char	uc[4];	/* decoded Unicode character takes 1-4 bytes in UTF-8 */
+ 
+ 			/* unexpected end of string data, failing */
+ 			if ('\0' == *(++ptr))
+@@ -107,16 +107,11 @@ static zbx_int64_t	json_parse_string(const char *start, char **error)
+ 					break;
+ 				case 'u':
+ 					/* check if the \u is followed with 4 hex digits */
+-					for (i = 0; i < 4; i++)
+-					{
+-						if (0 == isxdigit((unsigned char)*(++ptr)))
+-						{
+-							return json_error("invalid escape sequence in string",
+-									escape_start, error);
+-						}
++					if (0 == zbx_json_decode_character(&ptr, uc)) {
++						return json_error("invalid escape sequence in string",
++							escape_start, error);
+ 					}
+-
+-					break;
++					continue;
+ 				default:
+ 					return json_error("invalid escape sequence in string data",
+ 							escape_start, error);
+diff --git a/src/zabbix_server/reporter/report_protocol.c b/src/zabbix_server/reporter/report_protocol.c
+index 5f55f51..ee0e02e 100644
+--- a/src/zabbix_server/reporter/report_protocol.c
++++ b/src/zabbix_server/reporter/report_protocol.c
+@@ -421,7 +421,8 @@ void	zbx_report_test(const struct zbx_json_parse *jp, zbx_uint64_t userid, struc
+ 			size_t		value_alloc = 0;
+ 			zbx_ptr_pair_t	pair;
+ 
+-			zbx_json_decodevalue_dyn(pnext, &value, &value_alloc, NULL);
++			if (NULL == zbx_json_decodevalue_dyn(pnext, &value, &value_alloc, NULL))
++				continue;
+ 			pair.first = zbx_strdup(NULL, key);
+ 			pair.second = value;
+ 			zbx_vector_ptr_pair_append(&params, pair);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index d72d3b112..7f530a552 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz
     file://zabbix-agent.service \
     file://CVE-2022-43515.patch \
     file://CVE-2022-46768.patch \
+    file://CVE-2023-29451.patch \
 "
 
 SRC_URI[md5sum] = "f295fd2df86143d72f6ff26e47d9e39e"
-- 
2.25.1


