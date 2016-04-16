Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA5D26FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 02:40:47 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so11625400pfr.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hkfZ86Ol9r49AifThiIOb7pjMRSaf5oDbR6SPkFBR9M=;
	b=tLKNXRXXyRpiOb9i2wUGzMSyLh8uaGVIJe7o1+Q3Ig8LI7H/ZJDs0LPzvjWeNd0iZj
	c7ACCLg5pRVSwVUR/o3Wiiy1a5As3V2bpkqzUE9nla3K42AIUF0YiYhMJwspdOqVVmkK
	FsffAeECCBcOHEBgaLsi2o0SmLsSYlO2m/cJLWYmHfOoEHT6h9qyskr9IX3Lgmil0vZe
	BVjojNbUCnPDitSEAe4iCVN1pBwY6cCVNfV4GQX0TPfzJYxaeD9BJ5oemxz/MZf+SUh4
	yJl02Rp3WEcz3SRJXgv2Okctn+S9GuRljNe39dVYDxiia+n+M4P5V4azDd3kmXxbYsVo
	SCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hkfZ86Ol9r49AifThiIOb7pjMRSaf5oDbR6SPkFBR9M=;
	b=jF5biSLTxRZp0gAiMsC3qmTjRybnQVbOpeM5pmA1EhxABGHbYAQQnTlMGXwGvuVTAY
	ctAgtniASA+MiZTobBZ56ivulgMnsdJDhrCkAyWVrKtGNimC9trDnpRFmu+iJGYy9n0E
	e+HW9eh6eEshnboVeQHFsMJTDRM7OBWMteA8NBJGT5x9D5ZiwPJUL62K7wq6R7uFCYnt
	0mGtD44Iwybolqy90pEYyu5toUO7IMnwiIoP0xhtTBDgG0TfHvTLJHbbe0JI+5oa9MX1
	+xg0Gji2QsX3q6sLSrMfUYY0FC3LFRIjOLq5fpHD5KnkOk75JYSgryw537gPU5oSJ6O+
	72Lg==
X-Gm-Message-State: AOPr4FW0xvMrA33TjtbJ48n8xgc3axJu1+Zn8i0HkYiVOUlToaKJxpOFQlmDnrguqF7h/A==
X-Received: by 10.98.19.151 with SMTP id 23mr33934077pft.31.1460774448218;
	Fri, 15 Apr 2016 19:40:48 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	h2sm67546842pfd.91.2016.04.15.19.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 19:40:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2016 19:40:40 -0700
Message-Id: <1460774441-27282-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1460774441-27282-1-git-send-email-kergoth@gmail.com>
References: <1460774441-27282-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-networking][PATCH 2/3] ctdb: rdepend on procps
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2016 02:40:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

ctdbd_wrapper requires pgrep.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 66c966d..232546c 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -28,6 +28,9 @@ PARALLEL_MAKE = ""
 
 DEPENDS += "popt libtevent libtalloc libldb"
 
+# ctdbd_wrapper requires pgrep, hence procps
+RDEPENDS_${PN} += "procps"
+
 do_configure() {
     oe_runconf
 }
-- 
2.8.0


