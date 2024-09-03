Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73042CD342D
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 12:53:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22558.1725367986887428589
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 05:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99761bc802=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483507i4015477
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Sep 2024 12:53:06 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41brd1b0b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 12:53:05 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 05:53:04 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 05:53:03 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] python3-flask-cors: Fix CVE-2024-6221
Date: Tue, 3 Sep 2024 12:52:59 +0000
Message-ID: <20240903125259.1364819-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZSpYuZTQQtED-RE604bYv4XFKBKCE3zD
X-Authority-Analysis: v=2.4 cv=Qdk0vdbv c=1 sm=1 tr=0 ts=66d706b1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=SSmOFEACAAAA:8
 a=RZnEGdTo56iCx8orGTAA:9 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ZSpYuZTQQtED-RE604bYv4XFKBKCE3zD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409030104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 12:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112079

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability in corydolphin/flask-cors version 4.0.1 allows the
`Access-Control-Allow-Private-Network` CORS header to be set to true
by default, without any configuration option. This behavior can expose
private network resources to unauthorized external access, leading to
significant security risks such as data breaches, unauthorized access
to sensitive information, and potential network intrusions.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-6221

Upsteam-Patch:
https://github.com/corydolphin/flask-cors/commit/7ae310c56ac30e0b94fb42129aa377bf633256ec

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-flask-cors/CVE-2024-6221.patch    | 110 ++++++++++++++++++
 .../python/python3-flask-cors_4.0.0.bb        |   4 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch

diff --git a/meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch b/meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
new file mode 100644
index 000000000..9049b2ffe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
@@ -0,0 +1,110 @@
+From 7ae310c56ac30e0b94fb42129aa377bf633256ec Mon Sep 17 00:00:00 2001
+From: Adriano Sela Aviles <adriano.selaviles@gmail.com>
+Date: Fri, 30 Aug 2024 12:14:31 -0400
+Subject: [PATCH] Backwards Compatible Fix for CVE-2024-6221 (#363)
+
+CVE: CVE-2024-6221
+
+Upstream-Status: Backport [https://github.com/corydolphin/flask-cors/commit/7ae310c56ac30e0b94fb42129aa377bf633256ec]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ docs/configuration.rst  | 14 ++++++++++++++
+ flask_cors/core.py      |  8 +++++---
+ flask_cors/extension.py | 16 ++++++++++++++++
+ 3 files changed, 35 insertions(+), 3 deletions(-)
+
+diff --git a/docs/configuration.rst b/docs/configuration.rst
+index 91282d3..c750cf4 100644
+--- a/docs/configuration.rst
++++ b/docs/configuration.rst
+@@ -23,6 +23,19 @@ CORS_ALLOW_HEADERS (:py:class:`~typing.List` or :py:class:`str`)
+    Headers to accept from the client.
+    Headers in the :http:header:`Access-Control-Request-Headers` request header (usually part of the preflight OPTIONS request) matching headers in this list will be included in the :http:header:`Access-Control-Allow-Headers` response header.
+
++CORS_ALLOW_PRIVATE_NETWORK (:py:class:`bool`)
++   If True, the response header :http:header:`Access-Control-Allow-Private-Network`
++   will be set with the value 'true' whenever the request header
++   :http:header:`Access-Control-Request-Private-Network` has a value 'true'.
++
++   If False, the reponse header :http:header:`Access-Control-Allow-Private-Network`
++   will be set with the value 'false' whenever the request header
++   :http:header:`Access-Control-Request-Private-Network` has a value of 'true'.
++
++   If the request header :http:header:`Access-Control-Request-Private-Network` is
++   not present or has a value other than 'true', the response header
++   :http:header:`Access-Control-Allow-Private-Network` will not be set.
++
+ CORS_ALWAYS_SEND (:py:class:`bool`)
+    Usually, if a request doesn't include an :http:header:`Origin` header, the client did not request CORS.
+    This means we can ignore this request.
+@@ -83,6 +96,7 @@ Default values
+ ~~~~~~~~~~~~~~
+
+ * CORS_ALLOW_HEADERS: "*"
++* CORS_ALLOW_PRIVATE_NETWORK: True
+ * CORS_ALWAYS_SEND: True
+ * CORS_AUTOMATIC_OPTIONS: True
+ * CORS_EXPOSE_HEADERS: None
+diff --git a/flask_cors/core.py b/flask_cors/core.py
+index 5358036..bd011f4 100644
+--- a/flask_cors/core.py
++++ b/flask_cors/core.py
+@@ -36,7 +36,7 @@ CONFIG_OPTIONS = ['CORS_ORIGINS', 'CORS_METHODS', 'CORS_ALLOW_HEADERS',
+                   'CORS_MAX_AGE', 'CORS_SEND_WILDCARD',
+                   'CORS_AUTOMATIC_OPTIONS', 'CORS_VARY_HEADER',
+                   'CORS_RESOURCES', 'CORS_INTERCEPT_EXCEPTIONS',
+-                  'CORS_ALWAYS_SEND']
++                  'CORS_ALWAYS_SEND', 'CORS_ALLOW_PRIVATE_NETWORK']
+ # Attribute added to request object by decorator to indicate that CORS
+ # was evaluated, in case the decorator and extension are both applied
+ # to a view.
+@@ -56,7 +56,8 @@ DEFAULT_OPTIONS = dict(origins='*',
+                        vary_header=True,
+                        resources=r'/*',
+                        intercept_exceptions=True,
+-                       always_send=True)
++                       always_send=True,
++                       allow_private_network=True)
+
+
+ def parse_resources(resources):
+@@ -186,7 +187,8 @@ def get_cors_headers(options, request_headers, request_method):
+
+     if ACL_REQUEST_HEADER_PRIVATE_NETWORK in request_headers \
+             and request_headers.get(ACL_REQUEST_HEADER_PRIVATE_NETWORK) == 'true':
+-        headers[ACL_RESPONSE_PRIVATE_NETWORK] = 'true'
++        allow_private_network = 'true' if options.get('allow_private_network') else 'false'
++        headers[ACL_RESPONSE_PRIVATE_NETWORK] = allow_private_network
+
+     # This is a preflight request
+     # http://www.w3.org/TR/cors/#resource-preflight-requests
+diff --git a/flask_cors/extension.py b/flask_cors/extension.py
+index c00cbff..694953f 100644
+--- a/flask_cors/extension.py
++++ b/flask_cors/extension.py
+@@ -136,6 +136,22 @@ class CORS(object):
+
+         Default : True
+     :type vary_header: bool
++
++    :param allow_private_network:
++        If True, the response header `Access-Control-Allow-Private-Network`
++        will be set with the value 'true' whenever the request header
++        `Access-Control-Request-Private-Network` has a value 'true'.
++
++        If False, the reponse header `Access-Control-Allow-Private-Network`
++        will be set with the value 'false' whenever the request header
++        `Access-Control-Request-Private-Network` has a value of 'true'.
++
++        If the request header `Access-Control-Request-Private-Network` is
++        not present or has a value other than 'true', the response header
++        `Access-Control-Allow-Private-Network` will not be set.
++
++        Default : True
++    :type allow_private_network: bool
+     """
+
+     def __init__(self, app=None, **kwargs):
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
index 1d0d86b4e..77b51c551 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
@@ -9,6 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
 
 PYPI_PACKAGE = "Flask-Cors"
 
+SRC_URI += " \
+        file://CVE-2024-6221.patch \
+"
+
 SRC_URI[sha256sum] = "f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0"
 
 inherit pypi setuptools3
-- 
2.40.0


