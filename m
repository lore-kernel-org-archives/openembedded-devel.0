Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id B473C76161
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:56:50 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so114977025pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 21:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ADP9MCP1HCo4z5uPw/Cwoq6qlhU05txm1nwcpwZW38E=;
	b=S8wrqyv2WdcnJ7qaIKx0pj2q3V5ZO2vKklvVDeuPFwZWMAcWl/0K9ZtSLV7Rz8tvlV
	p+CuSvIub/Dqb1fmD7UHJIz9Mzvvb0akPtQSp3JCpe6r+rLP+BjaBdq+WatXkNXcopHF
	BYBB1foxT6MtLKvbYcwDqf72KZqUs9lrOS6me6LM/vv9vygaaj4mX3BeM67IFHVH+kE1
	C3FKqCVKw0jsT4Kt//BeO/6u9bsaGRXghE0dfKR1bjUTGhTyQgfa8Wis7kDDoXa3did9
	DS8FGsNH82e4OPdVIJ6xk9tDnbnXDm9w3inAtyMNWaEJpueOmJcS/aM/6Zod+4bUBAyI
	1mVA==
X-Received: by 10.66.149.229 with SMTP id ud5mr68613395pab.2.1437454611194;
	Mon, 20 Jul 2015 21:56:51 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	b3sm24710475pdg.67.2015.07.20.21.56.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 21:56:49 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 13DFDFC0E54; Mon, 20 Jul 2015 21:56:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Mon, 20 Jul 2015 21:56:37 -0700
Message-Id: <e3dbf786b143a0d09a9a339aa5f1a66afb6cf90e.1437454485.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <e00844ed8cb964857c73acd8495ae98250c9020f.1437454485.git.akuster808@gmail.com>
References: <e00844ed8cb964857c73acd8495ae98250c9020f.1437454485.git.akuster808@gmail.com>
In-Reply-To: <cover.1437454485.git.akuster808@gmail.com>
References: <cover.1437454485.git.akuster808@gmail.com>
Subject: [PATCH 4/5] ipsec-tools: Security Advisory - CVE-2015-4047
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jul 2015 04:56:51 -0000

From: Roy Li <rongqing.li@windriver.com>

This fixed the CVE-2015-4047:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4047

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
---
 .../ipsec-tools/fix-CVE-2015-4047.patch            | 36 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
new file mode 100644
index 0000000..5286376
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
@@ -0,0 +1,36 @@
+[PATCH] fix CVE-2015-4047
+
+Upstream-Status: Backport
+
+http://www.openwall.com/lists/oss-security/2015/05/20/1
+
+racoon/gssapi.c in IPsec-Tools 0.8.2 allows remote attackers to cause
+a denial of service (NULL pointer dereference and IKE daemon crash) via
+a series of crafted UDP requests.
+
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4047
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ src/racoon/gssapi.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/racoon/gssapi.c b/src/racoon/gssapi.c
+index e64b201..1ad3b42 100644
+--- a/src/racoon/gssapi.c
++++ b/src/racoon/gssapi.c
+@@ -192,6 +192,11 @@ gssapi_init(struct ph1handle *iph1)
+ 	gss_name_t princ, canon_princ;
+ 	OM_uint32 maj_stat, min_stat;
+ 
++	if (iph1->rmconf == NULL) {
++	        plog(LLV_ERROR, LOCATION, NULL, "no remote config\n");
++	        return -1;
++	}
++
+ 	gps = racoon_calloc(1, sizeof (struct gssapi_ph1_state));
+ 	if (gps == NULL) {
+ 		plog(LLV_ERROR, LOCATION, NULL, "racoon_calloc failed\n");
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 8cc55ef..c526820 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://racoon-check-invalid-ivm.patch \
            file://glibc-2.20.patch \
            file://racoon-Resend-UPDATE-message-when-received-EINTR-message.patch \
+           file://fix-CVE-2015-4047.patch \
           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
1.9.1


