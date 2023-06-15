Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7F0EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 10:07:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14617.1686823659338536689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 03:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OjCss8QY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55301e784d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F6oWvn029903
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=jIiHMXQ+zuuIh9zqNF0WIlBmk1XneB31FjVo8lzpMuM=;
 b=OjCss8QYZULe4w1uj/n4T7BlKHP+tk9Q4MBTcv9MXfiGfDg+COyDNSSOYrJ5Qp+DsZuo
 c6BIZsP/fXL67/HLj6TJRSXdHF28bCW+yUe+tVWzdmRgooe3zxjYvIQ+up+ObkGRdW5b
 VhOIw81+BGX00A1GI9A319MlC0HFp2eI6Q7oZJdzBJ7uTHAiY8Lw7VK1MK5LSgN8DNJE
 +Qlekx7Q5qiuX5tc+UzqXT/ZhG4EOfRcxVDRWQwW3efAeky4ruQFL172nzd9XJBIRNGg
 gMgy5y8Zb3lHCTvNkDXfsZakomY1QZsSN42ApfwZxbmxaphmZfwLKfI/YYNO5OvX+E85 Ew== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed04ugy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:07:38 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 03:07:33 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2021-44758
Date: Thu, 15 Jun 2023 10:07:20 +0000
Message-ID: <20230615100720.544317-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 5fxNCd65Ww4_99m-_hxuuOFzngjCTlY-
X-Proofpoint-ORIG-GUID: 5fxNCd65Ww4_99m-_hxuuOFzngjCTlY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=922
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103296

Heimdal before 7.7.1 allows attackers to cause a NULL pointer
dereference in a SPNEGO acceptor via a preferred_mech_type of
GSS_C_NO_OID and a nonzero initial_response value to send_accept.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-44758

Upstream patches:
https://github.com/heimdal/heimdal/commit/f9ec7002cdd526ae84fbacbf153162e118f22580

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2021-44758.patch          | 69 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2021-44758.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2021-44758.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2021-44758.patch
new file mode 100644
index 000000000..655321726
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2021-44758.patch
@@ -0,0 +1,69 @@
+From f9ec7002cdd526ae84fbacbf153162e118f22580 Mon Sep 17 00:00:00 2001
+From: Nicolas Williams <nico@twosigma.com>
+Date: Wed Mar 9 10:18:52 2022 -0600
+Subject: [PATCH] spnego: CVE-2021-44758 send_reject when no mech selected
+
+    This fixes a DoS where an initial SPNEGO token that has no acceptable
+    mechanisms causes a NULL dereference in acceptors.
+
+    send_accept() when called with a non-zero 'initial_response' did
+    not handle the case of gssspnego_ctx.preferred_mech_type equal
+    to GSS_C_NO_OID.
+
+    The failure to handle GSS_C_NO_OID has been present since the
+    initial revision of gssapi/spnego,
+    2baa7e7d613c26b2b037b368931519a84baec53d but might not have
+    been exercised until later revisions.
+
+    The introduction of opportunistic token handling in
+    gss_accept_sec_context(), 3c9d3266f47f594a29068c9d629908e7000ac663,
+    introduced two bugs:
+
+     1. The optional mechToken field is used unconditionally
+        possibly resulting in a segmentation fault.
+
+     2. If use of the opportunistic token is unsuccessful and the
+        mech type list length is one, send_accept() can be called
+        with 'initial_response' true and preferred mech set to
+        GSS_C_NO_OID.
+
+    b53c90da0890a9cce6f95c552f094ff6d69027bf ("Make error reporting
+    somewhat more correct for SPNEGO") attempted to fix the first
+    issue and increased the likelihood of the second.
+
+    This change alters the behavior of acceptor_start() so it calls
+    send_reject() when no mechanism was selected.
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ .../heimdal/lib/gssapi/spnego/accept_sec_context.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/lib/gssapi/spnego/accept_sec_context.c b/lib/gssapi/spnego/accept_sec_context.c
+index 3a51dd3..b60dc19 100644
+--- a/lib/gssapi/spnego/accept_sec_context.c
++++ b/lib/gssapi/spnego/accept_sec_context.c
+@@ -619,13 +619,15 @@ acceptor_start
+	    if (ret == 0)
+		break;
+	}
+-	if (preferred_mech_type == GSS_C_NO_OID) {
+-	    HEIMDAL_MUTEX_unlock(&ctx->ctx_id_mutex);
+-	    free_NegotiationToken(&nt);
+-	    return ret;
+-	}
++    }
++
++    ctx->preferred_mech_type = preferred_mech_type;
+
+-	ctx->preferred_mech_type = preferred_mech_type;
++    if (preferred_mech_type == GSS_C_NO_OID) {
++        send_reject(minor_status, output_token);
++        HEIMDAL_MUTEX_unlock(&ctx->ctx_id_mutex);
++        free_NegotiationToken(&nt);
++        return ret;
+     }
+
+     /*
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index fcec63752..72021745b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-3437-0008.patch;patchdir=source4/heimdal \
            file://CVE-2022-45142.patch;patchdir=source4/heimdal \
            file://CVE-2022-41916.patch;patchdir=source4/heimdal \
+           file://CVE-2021-44758.patch;patchdir=source4/heimdal \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


