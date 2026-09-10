Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB03BC88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:57 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27857.1789081850812243264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nJXUBgPw;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dcff8f44f2so3632465ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081850; x=1789686650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fP0b60bAffhb9ain1P8kIfg8WLZNvp4bZxfJAAwCOnw=;
        b=nJXUBgPwxo+2jYwv1WQhph0xzX8qYFCIn6DMLj0HehdnqgP4CZDG8RjYrB2H64NXNQ
         8VjUrNtsSnE6SZi0hK5HvdoBLHiayx1zrCulGs+xKV8NNUsJx6Ylr7Uk5vgE/jfqksK/
         +Y83VtceTCGset9s3tMLUz91+6FwFdmosH6C8Ykx2VAkncfpuPueokbqtoDiFXjDBUSN
         8PLIKqyiD31IP8T03sac7tvfHPQZtsbIfd6YI3a3/YY4wTPgS8OyDpvuzRVYU6kHLB7e
         +9tM0LFs2Zi21LH8KZ1mNNfRO3QwItrhHTz6GtCmXYQCqsH9CW4F36t76N9uGSJQg8DP
         fYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081850; x=1789686650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fP0b60bAffhb9ain1P8kIfg8WLZNvp4bZxfJAAwCOnw=;
        b=IWgasAhDRkl3TjP6qFh0zZvNngX+Kb5Q+92HUlsliyBFHfwFnG4ePwdG24e3I1FREC
         jYsPuZIjxtGKYwWXA5zz4Soqlax95ZmmHIPtwNP0nllfU/qZy7pz2VsneYEjwLNv99a0
         j26mW1AsVDFXNty8uMu+grlR6VCdWJUEaWYcRFxcrDZO12aQlxMtonnmd5/He5uC3p2l
         UXpoXc5sFHFpFP6Dk+ITQWZd12AHaDHHXjDYSh4aKAFoCwzpbgje6FeURclJ7X5NaF0W
         aYsEqhutjjKHMWrWbUFX/n/H3/B5gpy0/lbjJiLhKDxBkSYCYvZ7qF6UP/sL4WsGciym
         tW+g==
X-Gm-Message-State: AFuF++m9P690Ze9paoy8g2sUkafYO/nMWqI6pKGZQ32EUNW95+dyhTWf
	xQFcNvayxuIbu7yjbNpjCQlGu1KUWkCEclGk++LYPB9jGV0A6Qh29InAL/Il5w==
X-Gm-Gg: AYBFou2f0k8LHpoioWKGAvj7hVW0PDmxmOyWWcuYK2QTfObsEaCWCVkayiQl8zYiwQ9
	KJB4QG7evj6UAcIjHC+FNzCCSlDFQLhvVsyQf35gVfDppPs/eYkjmjzrePy5lc013WSXM3hGPbm
	cxEGWwh61VMC58JKcskfJPy8Ug8Mesc2alIs/lVEy2iH+xmx3yZW5TQqpvJ/p1ZvvNIeUCpgs28
	K25gzHyzZqcmlUfkzUZ62xUa5mL94RAKcf45COjmbAkESD0s2G5WAPCXROhZ0RRTamqolQM85cu
	POnda/aJ37O3ceEjdcPQlHMh+UTwr66DIAD2ToyVtQwj/Z8420Q7pRf3xVrm/WvI28+1yiEyI2g
	mItBw37IPmpW7D9smBFfw1ZQfm/tjVAk+t9mCkjVshbK9K5bQ5vKNjTUaYxU0A3Qz1UMeARlYA6
	8t4iGBcOYJwnjLyEM89oWz+7lZz0PM1nxKhdgbGwpWU/fXnIjmPlwcXAUlApNVWFCCFKLxu7/rF
	NDDLs0HRk1Fap+Ts64IZDo=
X-Received: by 2002:a17:90a:da8f:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39d9bbee490mr1624043a91.2.1789081850107;
        Thu, 10 Sep 2026 16:10:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 24/32] unbound: patch CVE-2026-52863
Date: Fri, 11 Sep 2026 11:09:23 +1200
Message-ID: <20260910230932.173913-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129942

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-52863

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-52863.patch      | 132 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-52863.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-52863.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-52863.patch
new file mode 100644
index 0000000000..5523faa2f6
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-52863.patch
@@ -0,0 +1,132 @@
+From da55f7d129bfa01201d8e2bb58b13674f41c572e Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:16:03 +0200
+Subject: [PATCH] - Fix CVE-2026-52863, Memory corruption could lead to crash
+ and   denial of service. Thanks to Qifan Zhang, Palo Alto Networks,   for the
+ report.
+
+(cherry picked from commit 8c702de175cb687d9645603ad3e8dc7c08a925e8)
+
+CVE: CVE-2026-52863
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/8c702de175cb687d9645603ad3e8dc7c08a925e8]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/mesh.c     |  8 +++++--
+ services/mesh.h     |  4 ++++
+ testcode/unitmain.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 66 insertions(+), 2 deletions(-)
+
+diff --git a/services/mesh.c b/services/mesh.c
+index 23499dcef..6a04bc838 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -911,8 +911,7 @@ cfg_region_strlist_copy(struct regional* region, struct config_strlist* list)
+ 	return result;
+ }
+ 
+-/** Copy the client info to the query region. */
+-static struct respip_client_info*
++struct respip_client_info*
+ mesh_copy_client_info(struct regional* region, struct respip_client_info* cinfo)
+ {
+ 	size_t i;
+@@ -957,6 +956,11 @@ mesh_copy_client_info(struct regional* region, struct respip_client_info* cinfo)
+ 			cinfo->view->name);
+ 		if(!client_info->view_name)
+ 			return NULL;
++	} else if(cinfo->view_name) {
++		client_info->view_name = regional_strdup(region,
++			cinfo->view_name);
++		if(!client_info->view_name)
++			return NULL;
+ 	}
+ 	return client_info;
+ }
+diff --git a/services/mesh.h b/services/mesh.h
+index a61f90993..b3e1f0efa 100644
+--- a/services/mesh.h
++++ b/services/mesh.h
+@@ -729,4 +729,8 @@ void mesh_respond_serve_expired(struct mesh_state* mstate);
+ void mesh_remove_callback(struct mesh_area* mesh, struct query_info* qinfo,
+ 	uint16_t qflags, mesh_cb_func_type cb, void* cb_arg);
+ 
++/** Copy the client info to the query region. */
++struct respip_client_info* mesh_copy_client_info(struct regional* region,
++	struct respip_client_info* cinfo);
++
+ #endif /* SERVICES_MESH_H */
+diff --git a/testcode/unitmain.c b/testcode/unitmain.c
+index beb10ba45..edde04875 100644
+--- a/testcode/unitmain.c
++++ b/testcode/unitmain.c
+@@ -1282,6 +1282,61 @@ static void localzone_test(void)
+ 	localzone_parents_test();
+ }
+ 
++#include "services/mesh.h"
++/** mesh unit tests */
++static void mesh_test(void)
++{
++	struct regional* r2, *r3;
++	struct respip_client_info* c1, *c2, *c3;
++	unit_show_func("services/mesh.c", "mesh_copy_client_info");
++	r2 = regional_create();
++	r3 = regional_create();
++	if(!r2 || !r3) fatal_exit("out of memory");
++
++	c1 = calloc(1, sizeof(*c1));
++	if(!c1) fatal_exit("out of memory");
++	c1->view = calloc(1, sizeof(*c1->view));
++	if(!c1->view) fatal_exit("out of memory");
++	c1->view->name = strdup("view1");
++	if(!c1->view->name) fatal_exit("out of memory");
++
++	c2 = mesh_copy_client_info(r2, c1);
++	if(!c2) fatal_exit("out of memory");
++	c3 = mesh_copy_client_info(r3, c2);
++	if(!c3) fatal_exit("out of memory");
++
++	unit_assert(strcmp(c1->view->name, c2->view_name) == 0);
++	unit_assert(strcmp(c1->view->name, c3->view_name) == 0);
++
++	/* make sure that the c3 view_name is in the r3 region. */
++	unit_assert(r3->next == NULL);  /* only the first chunk present atm */
++	if(strlen(c3->view_name) >= r3->large_object_size) {
++		char* a = r3->large_list;
++		int found = 0;
++		while(a) {
++			if(strcmp(c3->view_name,
++				a + /* ALIGNEMENT */ sizeof(uint64_t)) == 0) {
++				found = 1;
++				break;
++			}
++			a = *(char**)a;
++		}
++		unit_assert(found == 1);
++	} else {
++		/* The allocation is expected in the r3 region first chunk */
++		unit_assert((uint8_t*)c3->view_name < ((uint8_t*)r3)+r3->first_size);
++	}
++
++	regional_destroy(r2);
++	/* ASAN should complain for the freed access below */
++	unit_assert(strcmp(c1->view->name, c3->view_name) == 0);
++
++	regional_destroy(r3);
++	free(c1->view->name);
++	free(c1->view);
++	free(c1);
++}
++
+ void unit_show_func(const char* file, const char* func)
+ {
+ 	printf("test %s:%s\n", file, func);
+@@ -1356,6 +1411,7 @@ main(int argc, char* argv[])
+ 	msgparse_test();
+ 	edns_ede_answer_encode_test();
+ 	localzone_test();
++	mesh_test();
+ #ifdef CLIENT_SUBNET
+ 	ecs_test();
+ #endif /* CLIENT_SUBNET */
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 76dc0655c9..a03dcf4193 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-50248.patch \
            file://CVE-2026-50251.patch \
            file://CVE-2026-50252.patch \
+           file://CVE-2026-52863.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

