Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77354C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 07:23:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2431.1690788191936661103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jul 2023 00:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EmqSxwEU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75762f10d7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36V6pTUI014500
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 00:23:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=/64WGvyP8abLFVTtN8tTalAny7bdf4jXitSMqKs5//g=; b=
	EmqSxwEUnRrSMasyl8ogWAlOORFKHkKbvzeGGuyIeBjlFskr+2Z5AI7IM0nTChgP
	6Hjf6u68EH+jIt5quK8v+fRXAe6ehW+UZdd8pRW84lSDIC6EYmdRri/l/J7ppP0v
	WlVVoMheLBGLoa+4tszra3zKoI0+xfgJCY3zYBdhQW1t8PiFVABNxeRMpksEc0z8
	acIooqE/EPaeFf2gFhq4th4jE9TVtdvFDqp5o5t4rEWl+Zq1H70DaBb/NFL/fk+C
	tSCNDTGvfTjrI9drZjKW4BE8roE1QUnA+MBCagvbfc4myFQKwDMmrfhBx/T5RcCZ
	k8EtG3wYkOHfxrsaKW7baw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s529fh5gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 00:23:11 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 00:23:09 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] zabbix: fix CVE-2023-29450
Date: Mon, 31 Jul 2023 07:22:50 +0000
Message-ID: <20230731072250.441366-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20230731072250.441366-1-yogita.urade@windriver.com>
References: <20230731072250.441366-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: h230Nd-80l7DLaVEFn1Uae2Q7gZebXVx
X-Proofpoint-GUID: h230Nd-80l7DLaVEFn1Uae2Q7gZebXVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307310065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 07:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104159

JavaScript pre-processing can be used by the attacker to gain
access to the file system (read-only access on behalf of user
"zabbix") on the Zabbix Server or Zabbix Proxy, potentially
leading to unauthorized access to sensitive data.

Reference:
https://support.zabbix.com/browse/ZBX-22588

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../zabbix/zabbix/CVE-2023-29450.patch        | 241 ++++++++++++++++++
 .../zabbix/zabbix_5.4.12.bb                   |   1 +
 2 files changed, 242 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch
new file mode 100644
index 0000000000..ea790f0a93
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch
@@ -0,0 +1,241 @@
+From 76f6a80cb3d6131e9c3e98918305c1bf1805fa2a Mon Sep 17 00:00:00 2001
+From: Vladislavs Sokurenko <vladislavs.sokurenko@zabbix.com>
+Date: Thu, 27 Jul 2023 12:43:02 +0000
+Subject: [PATCH] ...G...PS. [DEV-2429] fixed unauthorised file system access
+ when using cURL
+
+Merge in ZBX/zabbix from feature/DEV-2429-6.0 to release/6.0
+
+* commit 'abf345230ee185d61cc0bd70d432fa4b093b8a53':
+  ...G...PS. [DEV-2429] fixed unautorized file system access when using curl
+  .......PS. [DEV-2429] fixed unautorized file system access in JS preprocessing
+
+CVE: CVE-2023-29450
+
+Upstream-Status: Backport [https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/76f6a80cb3d]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/libs/zbxembed/httprequest.c            |  4 +++
+ src/libs/zbxhistory/history_elastic.c      | 30 ++++++++++++++++++++++
+ src/libs/zbxhttp/http.c                    |  9 +++++++
+ src/libs/zbxmedia/email.c                  |  6 +++++
+ src/libs/zbxsysinfo/common/http.c          |  9 +++++++
+ src/libs/zbxsysinfo/simple/simple.c        | 11 ++++++++
+ src/zabbix_server/httppoller/httptest.c    |  9 +++++++
+ src/zabbix_server/reporter/report_writer.c | 10 ++++++++
+ src/zabbix_server/vmware/vmware.c          |  9 +++++++
+ 9 files changed, 97 insertions(+)
+
+diff --git a/src/libs/zbxembed/httprequest.c b/src/libs/zbxembed/httprequest.c
+index 7f0eed9..871b925 100644
+--- a/src/libs/zbxembed/httprequest.c
++++ b/src/libs/zbxembed/httprequest.c
+@@ -354,6 +354,10 @@ static duk_ret_t	es_httprequest_query(duk_context *ctx, const char *http_request
+	ZBX_CURL_SETOPT(ctx, request->handle, CURLOPT_CUSTOMREQUEST, http_request, err);
+	ZBX_CURL_SETOPT(ctx, request->handle, CURLOPT_TIMEOUT_MS, timeout_ms - elapsed_ms, err);
+	ZBX_CURL_SETOPT(ctx, request->handle, CURLOPT_POSTFIELDS, ZBX_NULL2EMPTY_STR(contents), err);
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	ZBX_CURL_SETOPT(ctx, request->handle, CURLOPT_PROTOCOLS, CURLPROTO_HTTP | CURLPROTO_HTTPS, err);
++#endif
+
+	request->data_offset = 0;
+	request->headers_in_offset = 0;
+diff --git a/src/libs/zbxhistory/history_elastic.c b/src/libs/zbxhistory/history_elastic.c
+index 8b3ea84..fc881da 100644
+--- a/src/libs/zbxhistory/history_elastic.c
++++ b/src/libs/zbxhistory/history_elastic.c
+@@ -406,6 +406,16 @@ static void	elastic_writer_add_iface(zbx_history_iface_t *hist)
+		goto out;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(data->handle, opt = CURLOPT_PROTOCOLS,
++			CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		zabbix_log(LOG_LEVEL_ERR, "cannot set cURL option %d: [%s]", (int)opt, curl_easy_strerror(err));
++		goto out;
++	}
++#endif
++
+	*page_w[hist->value_type].errbuf = '\0';
+
+	if (CURLE_OK != (err = curl_easy_setopt(data->handle, opt = CURLOPT_PRIVATE, &page_w[hist->value_type])))
+@@ -722,6 +732,16 @@ static int	elastic_get_values(zbx_history_iface_t *hist, zbx_uint64_t itemid, in
+		goto out;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(data->handle, opt = CURLOPT_PROTOCOLS,
++			CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		zabbix_log(LOG_LEVEL_ERR, "cannot set cURL option %d: [%s]", (int)opt, curl_easy_strerror(err));
++		goto out;
++	}
++#endif
++
+	zabbix_log(LOG_LEVEL_DEBUG, "sending query to %s; post data: %s", data->post_url, query.buffer);
+
+	page_r.offset = 0;
+@@ -1065,6 +1085,16 @@ void	zbx_elastic_version_extract(struct zbx_json *json)
+		goto clean;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(handle, opt = CURLOPT_PROTOCOLS,
++			CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		zabbix_log(LOG_LEVEL_WARNING, "cannot set cURL option %d: [%s]", (int)opt, curl_easy_strerror(err));
++		goto clean;
++	}
++#endif
++
+	*errbuf = '\0';
+
+	if (CURLE_OK != (err = curl_easy_perform(handle)))
+diff --git a/src/libs/zbxhttp/http.c b/src/libs/zbxhttp/http.c
+index c10922c..36774cc 100644
+--- a/src/libs/zbxhttp/http.c
++++ b/src/libs/zbxhttp/http.c
+@@ -333,6 +333,15 @@ int	zbx_http_get(const char *url, const char *header, long timeout, char **out,
+		goto clean;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, CURLOPT_PROTOCOLS, CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		*error = zbx_dsprintf(NULL, "Cannot set allowed protocols: %s", curl_easy_strerror(err));
++		goto clean;
++	}
++#endif
++
+	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, CURLOPT_URL, url)))
+	{
+		*error = zbx_dsprintf(NULL, "Cannot specify URL: %s", curl_easy_strerror(err));
+diff --git a/src/libs/zbxmedia/email.c b/src/libs/zbxmedia/email.c
+index 3b987d9..d3af744 100644
+--- a/src/libs/zbxmedia/email.c
++++ b/src/libs/zbxmedia/email.c
+@@ -661,6 +661,12 @@ static int	send_email_curl(const char *smtp_server, unsigned short smtp_port, co
+	if ('\0' != *smtp_helo)
+		zbx_snprintf(url + url_offset, sizeof(url) - url_offset, "/%s", smtp_helo);
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, CURLOPT_PROTOCOLS, CURLPROTO_SMTPS | CURLPROTO_SMTP)))
++		goto error;
++#endif
++
+	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, CURLOPT_URL, url)))
+		goto error;
+
+diff --git a/src/libs/zbxsysinfo/common/http.c b/src/libs/zbxsysinfo/common/http.c
+index acd77e1..8dc4793 100644
+--- a/src/libs/zbxsysinfo/common/http.c
++++ b/src/libs/zbxsysinfo/common/http.c
+@@ -176,6 +176,15 @@ static int	curl_page_get(char *url, char **buffer, char **error)
+		goto out;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, CURLOPT_PROTOCOLS, CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		*error = zbx_dsprintf(*error, "Cannot set allowed protocols: %s", curl_easy_strerror(err));
++		goto out;
++	}
++#endif
++
+	if (CURLE_OK == (err = curl_easy_perform(easyhandle)))
+	{
+		if (NULL != buffer)
+diff --git a/src/libs/zbxsysinfo/simple/simple.c b/src/libs/zbxsysinfo/simple/simple.c
+index be1b9f9..80c5eac 100644
+--- a/src/libs/zbxsysinfo/simple/simple.c
++++ b/src/libs/zbxsysinfo/simple/simple.c
+@@ -189,6 +189,17 @@ static int	check_https(const char *host, unsigned short port, int timeout, int *
+		goto clean;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_PROTOCOLS,
++			CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		zabbix_log(LOG_LEVEL_DEBUG, "%s: could not set cURL option [%d]: %s",
++				__func__, (int)opt, curl_easy_strerror(err));
++		goto clean;
++	}
++#endif
++
+	if (NULL != CONFIG_SOURCE_IP)
+	{
+		if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_INTERFACE, CONFIG_SOURCE_IP)))
+diff --git a/src/zabbix_server/httppoller/httptest.c b/src/zabbix_server/httppoller/httptest.c
+index 0ff70ef..0201442 100644
+--- a/src/zabbix_server/httppoller/httptest.c
++++ b/src/zabbix_server/httppoller/httptest.c
+@@ -696,6 +696,15 @@ static void	process_httptest(DC_HOST *host, zbx_httptest_t *httptest)
+		goto clean;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, CURLOPT_PROTOCOLS, CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		err_str = zbx_strdup(err_str, curl_easy_strerror(err));
++		goto clean;
++	}
++#endif
++
+	if (SUCCEED != zbx_http_prepare_ssl(easyhandle, httptest->httptest.ssl_cert_file,
+			httptest->httptest.ssl_key_file, httptest->httptest.ssl_key_password,
+			httptest->httptest.verify_peer, httptest->httptest.verify_host, &err_str))
+diff --git a/src/zabbix_server/reporter/report_writer.c b/src/zabbix_server/reporter/report_writer.c
+index 87d1364..7530ed0 100644
+--- a/src/zabbix_server/reporter/report_writer.c
++++ b/src/zabbix_server/reporter/report_writer.c
+@@ -162,6 +162,16 @@ static int	rw_get_report(const char *url, const char *cookie, int width, int hei
+		goto out;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(curl, opt = CURLOPT_PROTOCOLS, CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		*error = zbx_dsprintf(*error, "Cannot set cURL option %d: %s.", (int)opt,
++				(curl_error = rw_curl_error(err)));
++		goto out;
++	}
++#endif
++
+	if (NULL != CONFIG_TLS_CA_FILE && '\0' != *CONFIG_TLS_CA_FILE)
+	{
+		if (CURLE_OK != (err = curl_easy_setopt(curl, opt = CURLOPT_CAINFO, CONFIG_TLS_CA_FILE)) ||
+diff --git a/src/zabbix_server/vmware/vmware.c b/src/zabbix_server/vmware/vmware.c
+index b02c8c7..718d519 100644
+--- a/src/zabbix_server/vmware/vmware.c
++++ b/src/zabbix_server/vmware/vmware.c
+@@ -2045,6 +2045,15 @@ static int	vmware_service_authenticate(zbx_vmware_service_t *service, CURL *easy
+		goto out;
+	}
+
++#if LIBCURL_VERSION_NUM >= 0x071304
++	/* CURLOPT_PROTOCOLS is supported starting with version 7.19.4 (0x071304) */
++	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_PROTOCOLS, CURLPROTO_HTTP | CURLPROTO_HTTPS)))
++	{
++		*error = zbx_dsprintf(*error, "Cannot set cURL option %d: %s.", (int)opt, curl_easy_strerror(err));
++		goto out;
++	}
++#endif
++
+	if (NULL != CONFIG_SOURCE_IP)
+	{
+		if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_INTERFACE, CONFIG_SOURCE_IP)))
+--
+2.35.5
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index c373ed9f0c..9bed74b214 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz
     file://CVE-2022-46768.patch \
     file://CVE-2023-29451.patch \
     file://CVE-2023-29449.patch \
+    file://CVE-2023-29450.patch \
 "
 
 SRC_URI[md5sum] = "f295fd2df86143d72f6ff26e47d9e39e"
-- 
2.40.0


