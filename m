Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DECBD78242
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Oct 2017 16:10:15 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i23so17101514pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Oct 2017 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DhZ6DjkBVHFwCU5w2r5NFRpz7axupwroxJRny9Cy8/U=;
	b=LDkbdyZTZCFqxjaPYxdmDUvIeE20J64rQQIZFJWGcq4OEFPWTwJ5CIf9ZnwCXFHYR4
	21AjbFRnOvUdK6DUNW38y2FSGRkPZ2TdR4hpfrRogk0sziSVPUlgu/Cw3OcozwBm8UBq
	USF4WnQwmhaXHgvY8k2Wgt77pR6iqbscuGArhe84hjCbOjLbrZ2N5rcys9dKjJDdi//B
	/KwLXy3Nj9pKui7jf3X7cJei9cN0ltCAu2LgD9BJ7iDhrn1Des4ESXtCLROh4Jusxobt
	0rlbxgViYNMlicxOVX0BTlp4MKAD7//0hS7a3dvdhUPglA7N3Ibf8HJiVCDazF88YBSJ
	jhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DhZ6DjkBVHFwCU5w2r5NFRpz7axupwroxJRny9Cy8/U=;
	b=oZRVmCuxcwsjid4GHUojlDuAl3AQywChznGVbz5sqpHVWbYZUQfJMt6C0+WBpcWuaA
	/QstYn9XomZwGuv/loquwP+SjpiADPgsanhSlQFQviWviSPDxoSr7ERzCpBogXybnlqG
	vWf47wL/1S+evfl5T8WLYDp1nR5N0vlXoNpy/7qItMJdxPJ0+8pRgevj3vnagyC6izAQ
	2MZAB8ShRvpbZfRMA0yupeIyo/VEeob2E/UY7BqLH21ZBeMisx3g+6VgXiUWR6si+Clw
	y0KoBFtredoBPs4/6Ctm7LM0+Bz4qspMdMSNNcPKibwi8j0IZlIMe7DQpsJ8aQiOWg4B
	8tEQ==
X-Gm-Message-State: AMCzsaU691mG7jSiFWGeDgpySgItKveVJHifZgA/o89viW8OB83AKHyw
	bCW6Hjrme/OJTFC3DnDWkAI=
X-Google-Smtp-Source: AOwi7QCdJ9v17q3SJ7EeChkx0/w3ybyC4bFmyqoG98ro+amz/cGzH8phggu3dIRgAcLradV0wPn2kw==
X-Received: by 10.84.171.193 with SMTP id l59mr2360151plb.133.1507306217068;
	Fri, 06 Oct 2017 09:10:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:2592:db33:fab5:1bd8])
	by smtp.gmail.com with ESMTPSA id 5sm4042404pfe.128.2017.10.06.09.10.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Oct 2017 09:10:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  6 Oct 2017 09:10:14 -0700
Message-Id: <1507306214-16106-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507306214-16106-1-git-send-email-akuster808@gmail.com>
References: <1507306214-16106-1-git-send-email-akuster808@gmail.com>
Subject: [meta-python][PATCH 2/2] python-asn1crypto: add new package
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
X-List-Received-Date: Fri, 06 Oct 2017 16:10:16 -0000

python-cryptography has a dependancy for this package as of version 1.8.
This was pointed out by: Satya Bodduluri.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc    | 12 ++++++++++++
 .../recipes-devtools/python/python-asn1crypto_0.23.0.bb      |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-asn1crypto.inc
 create mode 100644 meta-python/recipes-devtools/python/python-asn1crypto_0.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
new file mode 100644
index 0000000..3bdb4b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
+HOMEPAGE = "https://github.com/pyca/pynacl"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
+
+PYPI_PACKAGE = "asn1crypto"
+
+SRC_URI[md5sum] = "97d54665c397b72b165768398dfdd876"
+SRC_URI[sha256sum] = "0874981329cfebb366d6584c3d16e913f2a0eb026c9463efcc4aaf42a9d94d70"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python-asn1crypto_0.23.0.bb
new file mode 100644
index 0000000..6af60c2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-asn1crypto_0.23.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-asn1crypto.inc
-- 
2.7.4


