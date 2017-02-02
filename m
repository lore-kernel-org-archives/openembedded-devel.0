Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7D54E71D86
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:49:18 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r141so90051907wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z017HT6RsTYkA7ycknndQHTDVDElHleaeW6RETSO+Ys=;
	b=tnN/Z27lJQBKQ2PQg/r0r9UvqBgWhkWLIKgXrzNkoWw7Jdps5QNo4N81NNMz/vlIBH
	EkxaA+4E/fkwGdVI8vdyMmKOXL5YrmHGjmR7OWw3QLpVSrHjySMls6KLZN3+zYfs6Hdx
	FZzlz5ocSAMFQLwHNHuQGcwMVs0CCA26W11mR+7lpnj+kP3WOdSIbX/kJD9lJnimyYBm
	mcC48REhqgVkGVRk1n7X353+QgtsimwC5wNQSxcGdEkkLS7TzdxS/+zXhes5rqlgecyh
	LOa6A3ogMm57Cn9q/LBmc2gv4V2UTaCpXibu4lq5FaNo45fWV7h9apb+VLipiMeZrRo1
	nNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z017HT6RsTYkA7ycknndQHTDVDElHleaeW6RETSO+Ys=;
	b=OXWf6Dz/337JNqpj0Opr+8sU9oehuQvesV/ZO0y3KaQXAXEJzM/zkqRBoSCNS8tFs7
	N7u2DnNENgCH3CxevJGl+VuZkQsJCazmLb2oPoxeZS+6YDPo7IsogabwB3OFYO/WKONF
	Ymi/kbfWG5i6evafliu56Y7TODOswOcCN7Mvo993Pmi/tjq1qmCfy843Yy2AXCCtN4ff
	NrLKKHjElQp/0SrlxuRo2bpENTc1G8QAdyyIUBZfUF1Emtmv4njAoFFB/2OD4a0WJdEE
	UZ4xOPEQRu8Qnt0muInrho0vDdfdiTQC1M0ezVPPaDLcXrEiCJEUGc3NStX+SK7VQAs1
	RUSA==
X-Gm-Message-State: AIkVDXKJrlC4G/P+GNaBxqaCN6UuqA+ESdM0FjwjfIz1JFys0pQjgnKIK3LBJ3ttEDmO1w==
X-Received: by 10.223.164.10 with SMTP id d10mr7428971wra.90.1486043358036;
	Thu, 02 Feb 2017 05:49:18 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	b51sm40106703wrd.39.2017.02.02.05.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 05:49:16 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2017 14:49:10 +0100
Message-Id: <20170202134911.23234-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [meta-python][PATCH 1/2] typing: add version 3.5.3.0
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
X-List-Received-Date: Thu, 02 Feb 2017 13:49:19 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

 this is a dependency for m2crypto > 0.24.0
---
 meta-python/recipes-devtools/python/python-typing.inc        | 9 +++++++++
 meta-python/recipes-devtools/python/python-typing_3.5.3.0.bb | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-typing.inc
 create mode 100644 meta-python/recipes-devtools/python/python-typing_3.5.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-typing.inc b/meta-python/recipes-devtools/python/python-typing.inc
new file mode 100644
index 000000000..49da4feb1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-typing.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Simple Python module defined by PEP 484."
+HOMEPAGE = "https://github.com/python/typing"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
+
+SRC_URI[md5sum] = "3996a747158e5591abf689c1c5f8f9db"
+SRC_URI[sha256sum] = "ca2daac7e393e8ee86e9140cd0cf0172ff6bb50ebdf0b06281770f98f31bff21"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-typing_3.5.3.0.bb b/meta-python/recipes-devtools/python/python-typing_3.5.3.0.bb
new file mode 100644
index 000000000..04ce063c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-typing_3.5.3.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-typing.inc
-- 
2.11.0


