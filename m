Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22CFC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 11:24:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.76960.1705317877419398326
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 03:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mVA+KYAy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174454248a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40F7K2PR025726
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 11:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ZEY6o
	LF1/HEW98JhIh3IyCSoQALfJqiZFdKlGhFthvw=; b=mVA+KYAyytID/LoUM/VSo
	HxytU0Yb7e4d5Y6b6pcM1KwkMQL3rueOBoP2w9LhIh9NUcxguhdR9b23G7QHp+wu
	HLnO+v10mWn2abes2TaH+K3nGghk9mWDajwj/zxlS4m/IqVqX9hQ3TgaGqKhRAJX
	mqY9Lw0d0LqLdAflLooe8RGjhoDsvjf95Z3cv/GdKpQAEY2lpbyYh9V2EBQJaU9e
	tbOL9/WfLXmLjzsYN8D/MBtkQLi+XGechtjgnJrFTewotd4ZEhkOC6XX68cLa4z4
	05wnNELmg91pdJU+UbqMmgMvZuyx451HbPEmhbZlGUTByqQrf1EMZEJzEd22ZJv2
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkhg61xkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 11:24:36 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 03:24:50 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [OE][meta-oe][kirkstone][PATCH 1/1] zabbix: fix CVE-2023-32726 and  CVE-2023-32727
Date: Mon, 15 Jan 2024 11:24:16 +0000
Message-ID: <20240115112416.1930731-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: g6FyeD7TraJEgf0pWC7IEz5SCOtuR-K3
X-Proofpoint-GUID: g6FyeD7TraJEgf0pWC7IEz5SCOtuR-K3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401150081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 11:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108283

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2023-32726:
The vulnerability is caused by improper check for check
if RDLENGTH does not overflow the buffer in response
from DNS server.

CVE-2023-32727:
An attacker who has the privilege to configure Zabbix
items can use function icmpping() with additional
malicious command inside it to execute arbitrary code
on the current Zabbix server.

Refernces:
https://nvd.nist.gov/vuln/detail/CVE-2023-32726
https://security-tracker.debian.org/tracker/CVE-2023-32726
https://nvd.nist.gov/vuln/detail/CVE-2023-32727
https://security-tracker.debian.org/tracker/CVE-2023-32727

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../zabbix/zabbix/CVE-2023-32726.patch        | 160 +++++++++++++++
 .../zabbix/zabbix/CVE-2023-32727_0001.patch   | 193 ++++++++++++++++++
 .../zabbix/zabbix/CVE-2023-32727_0002.patch   |  49 +++++
 .../zabbix/zabbix_5.4.12.bb                   |   3 +
 4 files changed, 405 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0001.patch
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0002.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch
new file mode 100644
index 0000000000..b9c37bc045
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch
@@ -0,0 +1,160 @@
+From 53ef2b7119f57f4140e6bd9c5cd2d3c6af228179 Mon Sep 17 00:00:00 2001
+From: Armands Arseniuss Skolmeisters <armands.skolmeisters@zabbix.com>
+Date: Thu, 11 Jan 2024 12:00:24 +0000
+Subject: [PATCH] ...G...... [DEV-2702] fixed buffer overread in DNS response
+
+* commit '893902999ab7f0b15cce91e8555cb251b32b6df4':
+ ...G...... [DEV-2702] fixed DNS record data length check
+ ...G...... [DEV-2702] improved DNS error messages
+ ...G...... [DEV-2702] fixed DNS error messages
+ ...G...... [DEV-2702] improved DNS error messages
+ ...G...... [DEV-2702] fixed buffer overread in DNS response
+
+CVE: CVE-2023-32726
+Upstream-Status: Backport [https://github.com/zabbix/zabbix/commit/53ef2b7119f57f4140e6bd9c5cd2d3c6af228179]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/libs/zbxsysinfo/common/dns.c | 65 +++++++++++++++++++++++++++-----
+ 1 file changed, 56 insertions(+), 9 deletions(-)
+
+diff --git a/src/libs/zbxsysinfo/common/dns.c b/src/libs/zbxsysinfo/common/dns.c
+index e8938d8..bf456f2 100644
+--- a/src/libs/zbxsysinfo/common/dns.c
++++ b/src/libs/zbxsysinfo/common/dns.c
+@@ -638,7 +638,8 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+	{
+		if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))
+		{
+-			SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++			SET_MSG_RESULT(result, zbx_strdup(NULL,
++					"Cannot decode DNS response: cannot expand domain name."));
+			ret = SYSINFO_RET_FAIL;
+			goto clean;
+		}
+@@ -651,6 +652,13 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+		GETSHORT(q_len, msg_ptr);
+		offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %-8s", decode_type(q_type));
+
++		if (msg_ptr + q_len > msg_end)
++		{
++			SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response: record overflow."));
++			ret = SYSINFO_RET_FAIL;
++			goto clean;
++		}
++
+		switch (q_type)
+		{
+			case T_A:
+@@ -695,8 +703,40 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+			case T_PTR:
+				if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++#define ERR_MSG_PREFIX	"Cannot decode DNS response: cannot expand "
++					const char	*err_msg = NULL;
++
++					switch (q_type)
++					{
++						case T_NS:
++							err_msg = ERR_MSG_PREFIX "name server name.";
++							break;
++						case T_CNAME:
++							err_msg = ERR_MSG_PREFIX "canonical name.";
++							break;
++						case T_MB:
++							err_msg = ERR_MSG_PREFIX "mailbox name.";
++							break;
++						case T_MD:
++							err_msg = ERR_MSG_PREFIX "mail destination name.";
++							break;
++						case T_MF:
++							err_msg = ERR_MSG_PREFIX "mail forwarder name.";
++							break;
++						case T_MG:
++							err_msg = ERR_MSG_PREFIX "mail group name.";
++							break;
++						case T_MR:
++							err_msg = ERR_MSG_PREFIX "renamed mailbox name.";
++							break;
++						case T_PTR:
++							err_msg = ERR_MSG_PREFIX "PTR name.";
++							break;
++					}
++
++					SET_MSG_RESULT(result, zbx_strdup(NULL, err_msg));
+					return SYSINFO_RET_FAIL;
++#undef ERR_MSG_PREFIX
+				}
+				offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %s", name);
+				break;
+@@ -706,7 +746,8 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+
+				if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))	/* exchange */
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response:"
++							" cannot expand mail exchange name."));
+					return SYSINFO_RET_FAIL;
+				}
+				offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %s", name);
+@@ -715,14 +756,16 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+			case T_SOA:
+				if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))	/* source host */
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response:"
++							" cannot expand source nameserver name."));
+					return SYSINFO_RET_FAIL;
+				}
+				offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %s", name);
+
+				if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))	/* administrator */
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response:"
++							" cannot expand administrator mailbox name."));
+					return SYSINFO_RET_FAIL;
+				}
+				offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %s", name);
+@@ -750,7 +793,8 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+			case T_WKS:
+				if (INT32SZ + 1 > q_len)
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response:"
++							" malformed WKS resource record."));
+					return SYSINFO_RET_FAIL;
+				}
+
+@@ -816,14 +860,16 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+			case T_MINFO:
+				if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))	/* mailbox responsible for mailing lists */
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response:"
++							" cannot expand mailbox responsible for mailing lists."));
+					return SYSINFO_RET_FAIL;
+				}
+				offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %s", name);
+
+				if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))	/* mailbox for error messages */
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response:"
++							" cannot expand mailbox for error messages."));
+					return SYSINFO_RET_FAIL;
+				}
+				offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %s", name);
+@@ -854,7 +900,8 @@ static int	dns_query(AGENT_REQUEST *request, AGENT_RESULT *result, int short_ans
+
+				if (NULL == (name = get_name(answer.buffer, msg_end, &msg_ptr)))	/* target */
+				{
+-					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response."));
++					SET_MSG_RESULT(result, zbx_strdup(NULL, "Cannot decode DNS response:"
++							" cannot expand service target hostname."));
+					return SYSINFO_RET_FAIL;
+				}
+				offset += zbx_snprintf(buffer + offset, sizeof(buffer) - offset, " %s", name);
+--
+2.40.0
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0001.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0001.patch
new file mode 100644
index 0000000000..5c1e0c5af6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0001.patch
@@ -0,0 +1,193 @@
+From 93e090592fc6de7ec5d3d42c1bb9074ad1f3ba34 Mon Sep 17 00:00:00 2001
+From: Andris Zeila <andris.zeila@zabbix.com>
+Date: Fri, 12 Jan 2024 05:48:31 +0000
+Subject: [PATCH] .......PS. [DEV-2695] changed fping tests to read address
+ from file
+
+Merge in ZBX/zabbix from feature/DEV-2695-6.0 to release/6.0
+
+* commit '6603893ff94620e28fc543d5d0d4c86b9be3342e':
+  .......PS. [DEV-2695] fixed signal blocking
+  .......PS. [DEV-2695] added target hostname/ip validation in fping feature tests
+  .......PS. [DEV-2695] added error messages when failed to prepare temporary file for fping tests
+  .......PS. [DEV-2695] changed fping tests to read address from file
+
+CVE: CVE-2023-32727
+Upstream-Status: BAckport [https://github.com/zabbix/zabbix/commit/93e090592fc6de7ec5d3d42c1bb9074ad1f3ba34]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/libs/zbxicmpping/icmpping.c | 125 ++++++++++++++++++++++++++++----
+ 1 file changed, 112 insertions(+), 13 deletions(-)
+
+diff --git a/src/libs/zbxicmpping/icmpping.c b/src/libs/zbxicmpping/icmpping.c
+index 72f7e86..9a751b7 100644
+--- a/src/libs/zbxicmpping/icmpping.c
++++ b/src/libs/zbxicmpping/icmpping.c
+@@ -59,6 +59,8 @@ static void	get_source_ip_option(const char *fping, const char **option, unsigne
+
+	zbx_snprintf(tmp, sizeof(tmp), "%s -h 2>&1", fping);
+
++	zabbix_log(LOG_LEVEL_DEBUG, "executing %s", tmp);
++
+	if (NULL == (f = popen(tmp, "r")))
+		return;
+
+@@ -85,6 +87,110 @@ static void	get_source_ip_option(const char *fping, const char **option, unsigne
+	*checked = 1;
+ }
+
++/******************************************************************************
++ *                                                                            *
++ * Purpose: execute external program and return stdout and stderr values      *
++ *                                                                            *
++ * Parameters: fping         - [IN] location of fping program                 *
++ *             out           - [OUT] stdout and stderr values                 *
++ *             error         - [OUT] error string if function fails           *
++ *             max_error_len - [IN] length of error buffer                    *
++ *                                                                            *
++ * Return value: SUCCEED if processed successfully or FAIL otherwise          *
++ *                                                                            *
++ ******************************************************************************/
++static int	get_fping_out(const char *fping, const char *address, char **out, char *error, size_t max_error_len)
++{
++	FILE		*f;
++	size_t		buf_size = 0, offset = 0, len;
++	ssize_t		n;
++	char		tmp[MAX_STRING_LEN], *buffer = NULL;
++	int		ret = FAIL, fd;
++	sigset_t	mask, orig_mask;
++	char		filename[MAX_STRING_LEN];
++
++	if (FAIL == zbx_validate_hostname(address) && FAIL == is_supported_ip(address))
++	{
++		zbx_strlcpy(error, "Invalid host name or IP address", max_error_len);
++		return FAIL;
++	}
++
++	zbx_snprintf(filename, sizeof(filename), "%s/%s_XXXXXX", CONFIG_TMPDIR, progname);
++	if (-1 == (fd = mkstemp(filename)))
++	{
++		zbx_snprintf(error, max_error_len, "Cannot create temporary file \"%s\": %s", filename,
++				zbx_strerror(errno));
++
++		return FAIL;
++	}
++
++	sigemptyset(&mask);
++	sigaddset(&mask, SIGINT);
++	sigaddset(&mask, SIGQUIT);
++
++	len = strlen(address);
++	if (-1 == (n = write(fd, address, len)))
++	{
++		zbx_snprintf(error, max_error_len, "Cannot write address into temporary file: %s", zbx_strerror(errno));
++		(void)close(fd);
++		goto out;
++	}
++
++	if (n != (ssize_t)len)
++	{
++		zbx_strlcpy(error, "Cannot write full address into temporary file", max_error_len);
++		(void)close(fd);
++		goto out;
++	}
++
++	if (-1 == close(fd))
++	{
++		zbx_snprintf(error, max_error_len, "Cannot close temporary file: %s", zbx_strerror(errno));
++		goto out;
++	}
++
++	zbx_snprintf(tmp, sizeof(tmp), "%s 2>&1 < %s", fping, filename);
++
++	if (0 > sigprocmask(SIG_BLOCK, &mask, &orig_mask))
++		zbx_error("cannot set sigprocmask to block the user signal");
++
++	zabbix_log(LOG_LEVEL_DEBUG, "executing %s", tmp);
++
++	if (NULL == (f = popen(tmp, "r")))
++	{
++		zbx_strlcpy(error, zbx_strerror(errno), max_error_len);
++		goto out;
++	}
++
++	while (NULL != zbx_fgets(tmp, sizeof(tmp), f))
++	{
++		len = strlen(tmp);
++
++		if (MAX_EXECUTE_OUTPUT_LEN < offset + len)
++			break;
++
++		zbx_strncpy_alloc(&buffer, &buf_size, &offset, tmp, len);
++	}
++
++	pclose(f);
++
++	if (NULL == buffer)
++	{
++		zbx_strlcpy(error, "Cannot obtain the program output", max_error_len);
++		goto out;
++	}
++
++	*out = buffer;
++	ret = SUCCEED;
++out:
++	unlink(filename);
++
++	if (0 > sigprocmask(SIG_SETMASK, &orig_mask, NULL))
++		zbx_error("cannot restore sigprocmask");
++
++	return ret;
++}
++
+ /******************************************************************************
+  *                                                                            *
+  * Function: get_interval_option                                              *
+@@ -137,19 +243,12 @@ static int	get_interval_option(const char *fping, ZBX_FPING_HOST *hosts, int hos
+
+			zabbix_log(LOG_LEVEL_DEBUG, "testing fping interval %u ms", intervals[j]);
+
+-			zbx_snprintf(tmp, sizeof(tmp), "%s -c1 -t50 -i%u %s", fping, intervals[j], dst);
++			zbx_snprintf(tmp, sizeof(tmp), "%s -c1 -t50 -i%u", fping, intervals[j]);
+
+			zbx_free(out);
+
+			/* call fping, ignore its exit code but mind execution failures */
+-			if (TIMEOUT_ERROR == (ret_exec = zbx_execute(tmp, &out, err, sizeof(err), 1,
+-					ZBX_EXIT_CODE_CHECKS_DISABLED, NULL)))
+-			{
+-				zbx_snprintf(error, max_error_len, "Timeout while executing \"%s\"", tmp);
+-				goto out;
+-			}
+-
+-			if (FAIL == ret_exec)
++			if (SUCCEED != (ret_exec = get_fping_out(tmp, dst, &out, err, sizeof(err))))
+			{
+				zbx_snprintf(error, max_error_len, "Cannot execute \"%s\": %s", tmp, err);
+				goto out;
+@@ -251,10 +350,10 @@ static int	get_ipv6_support(const char * fping, const char *dst)
+	int	ret;
+	char	tmp[MAX_STRING_LEN], error[255], *out = NULL;
+
+-	zbx_snprintf(tmp, sizeof(tmp), "%s -6 -c1 -t50 %s", fping, dst);
++	zbx_snprintf(tmp, sizeof(tmp), "%s -6 -c1 -t50", fping);
+
+-	if ((SUCCEED == (ret = zbx_execute(tmp, &out, error, sizeof(error), 1, ZBX_EXIT_CODE_CHECKS_DISABLED, NULL)) &&
+-				ZBX_KIBIBYTE > strlen(out) && NULL != strstr(out, dst)) || TIMEOUT_ERROR == ret)
++	if (SUCCEED == (ret = get_fping_out(tmp, dst, &out, error, sizeof(error)) &&
++				ZBX_KIBIBYTE > strlen(out) && NULL != strstr(out, dst)))
+	{
+		ret = SUCCEED;
+	}
+@@ -538,7 +637,7 @@ static int	process_ping(ZBX_FPING_HOST *hosts, int hosts_count, int count, int i
+
+	fclose(f);
+
+-	zabbix_log(LOG_LEVEL_DEBUG, "%s", tmp);
++	zabbix_log(LOG_LEVEL_DEBUG, "executing %s", tmp);
+
+	sigemptyset(&mask);
+	sigaddset(&mask, SIGINT);
+--
+2.40.0
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0002.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0002.patch
new file mode 100644
index 0000000000..aabc675b6a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0002.patch
@@ -0,0 +1,49 @@
+From 610f9fdbb86667f4094972547deb936c6cdfc6d5 Mon Sep 17 00:00:00 2001
+From: Andris Zeila <andris.zeila@zabbix.com>
+Date: Fri, 12 Jan 2024 06:06:02 +0000
+Subject: [PATCH] .......PS. [DEV-2695] removed group/all access flags for
+ fping temporary files
+
+Merge in ZBX/zabbix from feature/DEV-2695-6.5 to master
+
+* commit 'cf07db1d5c2b8fe4a9de85fed22cf05035e08914':
+  .......PS. [DEV-2695] remove group/all access flags when creating fping input file for testing fping features
+
+(cherry picked from commit cd12f0a2d89c3ef05f0e9f50dcb73fdaf3a7e8a9)
+
+CVE: CVE-2023-32727
+Upstream_Status: Backport [https://github.com/zabbix/zabbix/commit/610f9fdbb86667f4094972547deb936c6cdfc6d5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/libs/zbxicmpping/icmpping.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/libs/zbxicmpping/icmpping.c b/src/libs/zbxicmpping/icmpping.c
+index 9a751b7..bab3d09 100644
+--- a/src/libs/zbxicmpping/icmpping.c
++++ b/src/libs/zbxicmpping/icmpping.c
+@@ -108,6 +108,7 @@ static int	get_fping_out(const char *fping, const char *address, char **out, cha
+	int		ret = FAIL, fd;
+	sigset_t	mask, orig_mask;
+	char		filename[MAX_STRING_LEN];
++	mode_t		mode;
+
+	if (FAIL == zbx_validate_hostname(address) && FAIL == is_supported_ip(address))
+	{
+@@ -116,7 +117,12 @@ static int	get_fping_out(const char *fping, const char *address, char **out, cha
+	}
+
+	zbx_snprintf(filename, sizeof(filename), "%s/%s_XXXXXX", CONFIG_TMPDIR, progname);
+-	if (-1 == (fd = mkstemp(filename)))
++
++	mode = umask(077);
++	fd = mkstemp(filename);
++	umask(mode);
++
++	if (-1 == fd)
+	{
+		zbx_snprintf(error, max_error_len, "Cannot create temporary file \"%s\": %s", filename,
+				zbx_strerror(errno));
+--
+2.40.0
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index 9bed74b214..2793f0ca5f 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -31,6 +31,9 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz
     file://CVE-2023-29451.patch \
     file://CVE-2023-29449.patch \
     file://CVE-2023-29450.patch \
+    file://CVE-2023-32726.patch \
+    file://CVE-2023-32727_0001.patch \
+    file://CVE-2023-32727_0002.patch \
 "
 
 SRC_URI[md5sum] = "f295fd2df86143d72f6ff26e47d9e39e"
-- 
2.40.0


