Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB56C41513
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 07:23:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2430.1690788191251162432
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jul 2023 00:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hurpSMVH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75762f10d7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36V6sfp8014193
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 07:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=D3/UE
	EIVQbRQnMs2jxaXHsJcYOY7y51jftO3gKAYC90=; b=hurpSMVH9rBJi4ZRQe0EJ
	fAESQYn9vOLGR0v0gvBKGDjDNXnIG002SN2yBPND6gduRPyJnv6NUBMOUJdn8AMK
	H5SflDQiaqRjKFKJKXQooi1pP+MQYk9cTxhoTTgCpjcIKSXtJaIJ5X6RTz29CUJe
	5PYmUU0+Q8ruwTaQAZNdqg6wdGn15/9dZ3Ra5Pmd/2b8lqLfTWRmhbA1qre7FYuV
	TbaaYv7J/IOZ+3DbicwXEPoQV07SZU0KrDnhOAlRcTNuwYbk0nyr40+ZaYdbKHlM
	7DqEId+tdIR7A9/Q4RT04tXRpz2b7i1wA2UQJYZE4qIkJOocWeTuY87Lo/ou7FMp
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx1fye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 07:23:10 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 00:23:07 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] zabbix: fix CVE-2023-29449
Date: Mon, 31 Jul 2023 07:22:49 +0000
Message-ID: <20230731072250.441366-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: lZN26AqSslqRkxe99wHTS8iinOhT_4X3
X-Proofpoint-ORIG-GUID: lZN26AqSslqRkxe99wHTS8iinOhT_4X3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307310065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 07:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104158

JavaScript preprocessing, webhooks and global scripts can cause
uncontrolled CPU, memory, and disk I/O utilization.
Preprocessing/webhook/global script configuration and testing
are only available to Administrative roles (Admin and Superadmin).
Administrative privileges should be typically granted to users
who need to perform tasks that require more control over the system.
The security risk is limited because not all users have this level
of access.

References:
https://support.zabbix.com/browse/ZBX-22589

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../zabbix/zabbix/CVE-2023-29449.patch        | 247 ++++++++++++++++++
 .../zabbix/zabbix_5.4.12.bb                   |   1 +
 2 files changed, 248 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch
new file mode 100644
index 0000000000..675d9e0f35
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch
@@ -0,0 +1,247 @@
+From 240754ccee1b6b35ac47862be56dacec11e65b32 Mon Sep 17 00:00:00 2001
+From: Dmitrijs Goloscapovs <dmitrijs.goloscapovs@zabbix.com>
+Date: Thu, 27 Jul 2023 11:23:54 +0000
+Subject: [PATCH] .......PS. [DEV-2387] added new limits for JS objects
+
+Merge in ZBX/zabbix from feature/DEV-2387-6.0 to release/6.0
+
+* commit '16e5f15a70cfbf00c646cb92d1fcb8a362900285':
+  .......PS. [DEV-2387] removed logsize check based on json buffer
+  .......PS. [DEV-2387] removed logsize check based on json buffer
+  .......PS. [DEV-2387] fixed pr comments
+  .......PS. [DEV-2387] removed useless include
+  .......PS. [DEV-2387] added limits for logging and adding httprequest headers
+  .......PS. [DEV-2387] limited initialization of new HttpRequest objects
+
+CVE: CVE-2023-29449
+
+Upstream-Status: Backport [https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/240754ccee1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/libs/zbxembed/console.c     | 23 ++++++++++++-----------
+ src/libs/zbxembed/embed.c       |  1 +
+ src/libs/zbxembed/embed.h       |  3 +++
+ src/libs/zbxembed/httprequest.c | 28 ++++++++++++++++++++++++++++
+ src/libs/zbxembed/zabbix.c      | 23 ++++++++++++-----------
+ 5 files changed, 56 insertions(+), 22 deletions(-)
+
+diff --git a/src/libs/zbxembed/console.c b/src/libs/zbxembed/console.c
+index c733487..60c48fc 100644
+--- a/src/libs/zbxembed/console.c
++++ b/src/libs/zbxembed/console.c
+@@ -90,27 +90,28 @@ static duk_ret_t	es_log_message(duk_context *ctx, int level)
+	else
+		msg_output = zbx_strdup(msg_output, "undefined");
+
+-	zabbix_log(level, "%s", msg_output);
+-
+	duk_get_memory_functions(ctx, &out_funcs);
+	env = (zbx_es_env_t *)out_funcs.udata;
+
+-	if (NULL == env->json)
+-		goto out;
+-
+-	if (ZBX_ES_LOG_MEMORY_LIMIT < env->json->buffer_size)	/* approximate limit */
++	if (ZBX_ES_LOG_MEMORY_LIMIT < env->log_size)
+	{
+		err_index = duk_push_error_object(ctx, DUK_RET_EVAL_ERROR, "log exceeds the maximum size of "
+				ZBX_FS_UI64 " bytes.", ZBX_ES_LOG_MEMORY_LIMIT);
+		goto out;
+	}
+
+-	zbx_json_addobject(env->json, NULL);
+-	zbx_json_adduint64(env->json, "level", (zbx_uint64_t)level);
+-	zbx_json_adduint64(env->json, "ms", zbx_get_duration_ms(&env->start_time));
+-	zbx_json_addstring(env->json, "message", msg_output, ZBX_JSON_TYPE_STRING);
+-	zbx_json_close(env->json);
++	zabbix_log(level, "%s", msg_output);
++
++	if (NULL != env->json)
++	{
++		zbx_json_addobject(env->json, NULL);
++		zbx_json_adduint64(env->json, "level", (zbx_uint64_t)level);
++		zbx_json_adduint64(env->json, "ms", zbx_get_duration_ms(&env->start_time));
++		zbx_json_addstring(env->json, "message", msg_output, ZBX_JSON_TYPE_STRING);
++		zbx_json_close(env->json);
++	}
+ out:
++	env->log_size += strlen(msg_output);
+	zbx_free(msg_output);
+
+	if (-1 != err_index)
+diff --git a/src/libs/zbxembed/embed.c b/src/libs/zbxembed/embed.c
+index 34d8d18..cc80925 100644
+--- a/src/libs/zbxembed/embed.c
++++ b/src/libs/zbxembed/embed.c
+@@ -444,6 +444,7 @@ int	zbx_es_execute(zbx_es_t *es, const char *script, const char *code, int size,
+	zabbix_log(LOG_LEVEL_DEBUG, "In %s() param:%s", __func__, param);
+
+	zbx_timespec(&es->env->start_time);
++	es->env->http_req_objects = 0;
+
+	if (NULL != es->env->json)
+	{
+diff --git a/src/libs/zbxembed/embed.h b/src/libs/zbxembed/embed.h
+index a0a360c..2b954a8 100644
+--- a/src/libs/zbxembed/embed.h
++++ b/src/libs/zbxembed/embed.h
+@@ -48,6 +48,9 @@ struct zbx_es_env
+	struct zbx_json	*json;
+
+	jmp_buf		loc;
++
++	int		http_req_objects;
++	size_t		log_size;
+ };
+
+ zbx_es_env_t	*zbx_es_get_env(duk_context *ctx);
+diff --git a/src/libs/zbxembed/httprequest.c b/src/libs/zbxembed/httprequest.c
+index 8c2839c..7f0eed9 100644
+--- a/src/libs/zbxembed/httprequest.c
++++ b/src/libs/zbxembed/httprequest.c
+@@ -52,6 +52,7 @@ typedef struct
+	size_t			headers_in_alloc;
+	size_t			headers_in_offset;
+	unsigned char		custom_header;
++	size_t			headers_sz;
+ }
+ zbx_es_httprequest_t;
+
+@@ -145,13 +146,21 @@ static duk_ret_t	es_httprequest_dtor(duk_context *ctx)
+  ******************************************************************************/
+ static duk_ret_t	es_httprequest_ctor(duk_context *ctx)
+ {
++#define MAX_HTTPREQUEST_OBJECT_COUNT	10
+	zbx_es_httprequest_t	*request;
+	CURLcode		err;
++	zbx_es_env_t		*env;
+	int			err_index = -1;
+
+	if (!duk_is_constructor_call(ctx))
+		return DUK_RET_TYPE_ERROR;
+
++	if (NULL == (env = zbx_es_get_env(ctx)))
++		return duk_error(ctx, DUK_RET_TYPE_ERROR, "cannot access internal environment");
++
++	if (MAX_HTTPREQUEST_OBJECT_COUNT == env->http_req_objects)
++		return duk_error(ctx, DUK_RET_EVAL_ERROR, "maximum count of HttpRequest objects was reached");
++
+	duk_push_this(ctx);
+
+	request = (zbx_es_httprequest_t *)zbx_malloc(NULL, sizeof(zbx_es_httprequest_t));
+@@ -189,7 +198,10 @@ out:
+		return duk_throw(ctx);
+	}
+
++	env->http_req_objects++;
++
+	return 0;
++#undef MAX_HTTPREQUEST_OBJECT_COUNT
+ }
+
+ /******************************************************************************
+@@ -201,10 +213,12 @@ out:
+  ******************************************************************************/
+ static duk_ret_t	es_httprequest_add_header(duk_context *ctx)
+ {
++#define ZBX_ES_MAX_HEADERS_SIZE	ZBX_KIBIBYTE * 128
+	zbx_es_httprequest_t	*request;
+	CURLcode		err;
+	char			*utf8 = NULL;
+	int			err_index = -1;
++	size_t			header_sz;
+
+	if (NULL == (request = es_httprequest(ctx)))
+		return duk_error(ctx, DUK_RET_EVAL_ERROR, "internal scripting error: null object");
+@@ -215,9 +229,20 @@ static duk_ret_t	es_httprequest_add_header(duk_context *ctx)
+		goto out;
+	}
+
++	header_sz = strlen(utf8);
++
++	if (ZBX_ES_MAX_HEADERS_SIZE < request->headers_sz + header_sz)
++	{
++		err_index = duk_push_error_object(ctx, DUK_RET_TYPE_ERROR, "headers exceeded maximum size of "
++			ZBX_FS_UI64 " bytes.", ZBX_ES_MAX_HEADERS_SIZE);
++
++		goto out;
++	}
++
+	request->headers = curl_slist_append(request->headers, utf8);
+	ZBX_CURL_SETOPT(ctx, request->handle, CURLOPT_HTTPHEADER, request->headers, err);
+	request->custom_header = 1;
++	request->headers_sz += header_sz + 1;
+ out:
+	zbx_free(utf8);
+
+@@ -225,6 +250,7 @@ out:
+		return duk_throw(ctx);
+
+	return 0;
++#undef ZBX_ES_MAX_HEADERS_SIZE
+ }
+
+ /******************************************************************************
+@@ -244,6 +270,7 @@ static duk_ret_t	es_httprequest_clear_header(duk_context *ctx)
+	curl_slist_free_all(request->headers);
+	request->headers = NULL;
+	request->custom_header = 0;
++	request->headers_sz = 0;
+
+	return 0;
+ }
+@@ -311,6 +338,7 @@ static duk_ret_t	es_httprequest_query(duk_context *ctx, const char *http_request
+		{
+			curl_slist_free_all(request->headers);
+			request->headers = NULL;
++			request->headers_sz = 0;
+		}
+
+		if (NULL != contents)
+diff --git a/src/libs/zbxembed/zabbix.c b/src/libs/zbxembed/zabbix.c
+index 820768f..0ecde86 100644
+--- a/src/libs/zbxembed/zabbix.c
++++ b/src/libs/zbxembed/zabbix.c
+@@ -81,27 +81,28 @@ static duk_ret_t	es_zabbix_log(duk_context *ctx)
+		zbx_replace_invalid_utf8(message);
+	}
+
+-	zabbix_log(level, "%s", message);
+-
+	duk_get_memory_functions(ctx, &out_funcs);
+	env = (zbx_es_env_t *)out_funcs.udata;
+
+-	if (NULL == env->json)
+-		goto out;
+-
+-	if (ZBX_ES_LOG_MEMORY_LIMIT < env->json->buffer_size)	/* approximate limit */
++	if (ZBX_ES_LOG_MEMORY_LIMIT < env->log_size)
+	{
+		err_index = duk_push_error_object(ctx, DUK_RET_EVAL_ERROR, "log exceeds the maximum size of "
+				ZBX_FS_UI64 " bytes.", ZBX_ES_LOG_MEMORY_LIMIT);
+		goto out;
+	}
+
+-	zbx_json_addobject(env->json, NULL);
+-	zbx_json_adduint64(env->json, "level", (zbx_uint64_t)level);
+-	zbx_json_adduint64(env->json, "ms", zbx_get_duration_ms(&env->start_time));
+-	zbx_json_addstring(env->json, "message", message, ZBX_JSON_TYPE_STRING);
+-	zbx_json_close(env->json);
++	zabbix_log(level, "%s", message);
++
++	if (NULL != env->json)
++	{
++		zbx_json_addobject(env->json, NULL);
++		zbx_json_adduint64(env->json, "level", (zbx_uint64_t)level);
++		zbx_json_adduint64(env->json, "ms", zbx_get_duration_ms(&env->start_time));
++		zbx_json_addstring(env->json, "message", message, ZBX_JSON_TYPE_STRING);
++		zbx_json_close(env->json);
++	}
+ out:
++	env->log_size += strlen(message);
+	zbx_free(message);
+
+	if (-1 != err_index)
+--
+2.35.5
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index 7f530a5529..c373ed9f0c 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz
     file://CVE-2022-43515.patch \
     file://CVE-2022-46768.patch \
     file://CVE-2023-29451.patch \
+    file://CVE-2023-29449.patch \
 "
 
 SRC_URI[md5sum] = "f295fd2df86143d72f6ff26e47d9e39e"
-- 
2.40.0


