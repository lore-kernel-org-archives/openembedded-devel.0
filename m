Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 98F417705D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:47 +0000 (UTC)
Received: by pasz6 with SMTP id z6so146313266pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xFEJzgJhPub1cJeq3kYDDM3thE2gQiGznnucaWmHLQM=;
	b=bS3OHq32ekLI0nOIZBwg8XGvi5plH4pfo6SFrd+k6DrlDmAr6Ly3khJD+cJu0MVj1k
	hXWfoKMnC+lHdjcIuPW4q+dgTjiMsS1Ww4g8T1TkFqP/x/9w7qq47amfM0OxbViAUXCn
	lkqlpMe4Fb3o+4JOxCxQFp7nJ6GqMJ9A3c+mzUzc4J+H6XRKvn/Geb3xs/tmqk58hJBN
	6TMhI+mFq79BilqiBN5L7/uKxmu+WjSxmQNDybNqNT4WSEZH95/ObtJ5ZwEWkVS4ij/+
	kxeK/Lk1aL2OUJSpS/fp5uUfpLIWqySlv2W53RSL14QA49faUmQHyz69SmgyT5sO4b0h
	I9eQ==
X-Received: by 10.68.130.74 with SMTP id oc10mr12449258pbb.159.1445709467447; 
	Sat, 24 Oct 2015 10:57:47 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	l16sm25234468pbq.22.2015.10.24.10.57.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:45 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 1C8CBFC66DD; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:20 -0700
Message-Id: <a453f3096088a0108faa68041cbbcddf3a8d81fd.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
Subject: [PATCH 2/7] ipsec-tools: Security Advisory - CVE-2015-4047
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
X-List-Received-Date: Sat, 24 Oct 2015 17:57:47 -0000

From: Roy Li <rongqing.li@windriver.com>

This fixed the CVE-2015-4047:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4047

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 9704b13..574f159 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://racoon.conf.sample \
            file://racoon.conf \
            file://racoon.service \
+           file://fix-CVE-2015-4047.patch \
           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
1.9.1


