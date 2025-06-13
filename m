Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8BBC7114A
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 06:55:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3985.1749797699005742994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 23:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4p0al007524
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:58 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2pjrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 23:54:56 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 23:54:55 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-oe][PATCH 13/18] libsoup-2.4: fix CVE-2024-52531
Date: Fri, 13 Jun 2025 14:54:36 +0800
Message-ID: <20250613065441.3121844-14-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613065441.3121844-1-changqing.li@windriver.com>
References: <20250613065441.3121844-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1MCBTYWx0ZWRfX6+EmAbVJO2bu UmWz+w0qBMi5rHg3OsKeNtDbCnR/nTJDxPdHKYJdlWjjjIOTjOiGzY6ZwV8nShmXF14SUIJwK6u o+QwZG0oXDiRoH5kQSfOUCrB9Lyg2yBkw6mo5zTiNOQlUaSoBP2pNCDHbHE7HAWRIq+fLLq5KwO
 PIloOUlgc8YdSEeUHksv4vJuhThVEr39Qbo0eFEv3HD/EeVCso5y9iwf1UHSoqnXdvFsR7F0VV9 q26+kMUErO80vsZkJgdyKbmXJyih/5Iaq5bS9xOuEdp4bVGNe/KB1Z8UvYKnmwehkELX7zv91wH QgVfh5ow2Dpds+L15q+ndN6ENr1pliBEawb5Frc2PHgmSqKPj33RwhvRUoLVelORgGgR5exHhtL
 Y2eIWQvMkzj746jwfXP5Ce7TmyeIlzyhf0186/LZH4fFmNBLJNNFWpM8WxY7k5aiA7ck9fy7
X-Proofpoint-GUID: bbIg4uRJ5sq42XdRXoTEI4D9cmjfqxbS
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684bcb41 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=1EUBBC3AoEohvajmceIA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: bbIg4uRJ5sq42XdRXoTEI4D9cmjfqxbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117903

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/423

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 +++++
 .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +
 3 files changed, 174 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
new file mode 100644
index 0000000000..9de0310c8d
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
@@ -0,0 +1,39 @@
+From 8331e681c85c3b1893d8d5193783f631bfc07acb Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:42:08 +0800
+Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
+ soup_header_parse_semi_param_list()
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=825fda3425546847b42ad5270544e9388ff349fe]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/header-parsing-test.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index b811115..cfcc003 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -836,6 +836,17 @@ static struct ParamListTest {
+ 	    { "filename", "t\xC3\xA9st.txt" },
+ 	  },
+ 	},
++
++/* This tests invalid UTF-8 data which *should* never be passed here but it was designed to be robust against it. */
++	{ TRUE,
++	  "invalid*=\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; filename*=iso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo",
++	   {
++		{ "filename", "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++		{ "invalid", "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++		{ "foo", NULL },
++	   },
++	}
++
+ };
+ static const int num_paramlisttests = G_N_ELEMENTS (paramlisttests);
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
new file mode 100644
index 0000000000..740c28c016
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
@@ -0,0 +1,133 @@
+From 12523a592f1216450d18706bcf6c16e0f1ab0ce0 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:52:37 +0800
+Subject: [PATCH] headers: Be more robust against invalid input when
+ parsing params
+
+If you pass invalid input to a function such as soup_header_parse_param_list_strict()
+it can cause an overflow if it decodes the input to UTF-8.
+
+This should never happen with valid UTF-8 input which libsoup's client API
+ensures, however it's server API does not currently.
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c | 45 +++++++++++++++++++++---------------------
+ 1 file changed, 23 insertions(+), 22 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 67905b2..39e8d34 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -642,8 +642,9 @@ soup_header_contains (const char *header, const char *token)
+ }
+ 
+ static void
+-decode_quoted_string (char *quoted_string)
++decode_quoted_string_inplace (GString *quoted_gstring)
+ {
++	char *quoted_string = quoted_gstring->str;
+ 	char *src, *dst;
+ 
+ 	src = quoted_string + 1;
+@@ -657,10 +658,11 @@ decode_quoted_string (char *quoted_string)
+ }
+ 
+ static gboolean
+-decode_rfc5987 (char *encoded_string)
++decode_rfc5987_inplace (GString *encoded_gstring)
+ {
+ 	char *q, *decoded;
+ 	gboolean iso_8859_1 = FALSE;
++	const char *encoded_string = encoded_gstring->str;
+ 
+ 	q = strchr (encoded_string, '\'');
+ 	if (!q)
+@@ -689,14 +691,7 @@ decode_rfc5987 (char *encoded_string)
+ 		decoded = utf8;
+ 	}
+ 
+-	/* If encoded_string was UTF-8, then each 3-character %-escape
+-	 * will be converted to a single byte, and so decoded is
+-	 * shorter than encoded_string. If encoded_string was
+-	 * iso-8859-1, then each 3-character %-escape will be
+-	 * converted into at most 2 bytes in UTF-8, and so it's still
+-	 * shorter.
+-	 */
+-	strcpy (encoded_string, decoded);
++	g_string_assign (encoded_gstring, decoded);
+ 	g_free (decoded);
+ 	return TRUE;
+ }
+@@ -706,15 +701,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ {
+ 	GHashTable *params;
+ 	GSList *list, *iter;
+-	char *item, *eq, *name_end, *value;
+-	gboolean override, duplicated;
+ 
+ 	params = g_hash_table_new_full (soup_str_case_hash, 
+ 					soup_str_case_equal,
+-					g_free, NULL);
++					g_free, g_free);
+ 
+ 	list = parse_list (header, delim);
+ 	for (iter = list; iter; iter = iter->next) {
++ 		char *item, *eq, *name_end;
++		gboolean override, duplicated;
++		GString *parsed_value = NULL;
+ 		item = iter->data;
+ 		override = FALSE;
+ 
+@@ -729,19 +725,19 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ 
+ 			*name_end = '\0';
+ 
+-			value = (char *)skip_lws (eq + 1);
++			parsed_value = g_string_new ((char *)skip_lws (eq + 1));
+ 
+ 			if (name_end[-1] == '*' && name_end > item + 1) {
+ 				name_end[-1] = '\0';
+-				if (!decode_rfc5987 (value)) {
++				if (!decode_rfc5987_inplace (parsed_value)) {
++					g_string_free (parsed_value, TRUE);
+ 					g_free (item);
+ 					continue;
+ 				}
+ 				override = TRUE;
+-			} else if (*value == '"')
+-				decode_quoted_string (value);
+-		} else
+-			value = NULL;
++			} else if (parsed_value->str[0] == '"')
++				decode_quoted_string_inplace (parsed_value);
++			}
+ 
+ 		duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
+ 
+@@ -749,11 +745,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ 			soup_header_free_param_list (params);
+ 			params = NULL;
+ 			g_slist_foreach (iter, (GFunc)g_free, NULL);
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			break;
+-		} else if (override || !duplicated)
+-			g_hash_table_replace (params, item, value);
+-		else
++		} else if (override || !duplicated) {
++			g_hash_table_replace (params, item, parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
++		} else {
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			g_free (item);
++		}
+ 	}
+ 
+ 	g_slist_free (list);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 09881f9062..51e0368f34 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -33,6 +33,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
            file://CVE-2025-32912.patch \
+           file://CVE-2024-52531-1.patch \
+           file://CVE-2024-52531-2.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


