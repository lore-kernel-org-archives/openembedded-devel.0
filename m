Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A02377DC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:15 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 9so31959837pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zcGd3Us4hIa35wdZImqon+8zkuJI9aDMFFggsqQ9PlE=;
	b=ZiWwFGkGF9gkZOwaQxRRj3DMYPbRIXd/5Kal0kUrZd5Dvmc7YsDPdGi945SDO0sivK
	4vi0TAxJyXGc1dArMcuuHeMMrqm2d9EpUsz+DHjWCjPMY23d4camQXMASeQpGKUC6WmF
	2dOV7J6WFUkd9BgvMu66zDFx/2SL+dQShOTk68YDRtcqU0TGkIVtZwhYlDaaJGjw8Wux
	VJyZo2cLJboZR17D5kCNQ/XymtNnYOoicZYUw1NMW7hGnHtVAc0yU+kG1xIFCnPmqICb
	nhLaIGEWn1h6CU6WoxQv+2lRWuO/+PK4wb8UUZguw+7hgVCE8WoThDq+NxsQ+SsKi8DP
	olXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zcGd3Us4hIa35wdZImqon+8zkuJI9aDMFFggsqQ9PlE=;
	b=pqy974dq5v3fSV3wwkiZpm2sqn3EPoupf/EoN/8Xggj1bc0gW11K3x5h4DsRflb5Xx
	0l1Fk8ZbPqguVUNtH1b1iNUZ8yUUDcQuYsQIQBSBp8rNt99bKfgsvydGl0ruFsPnh/Qn
	ihXJjnAh02p0F1lydkxZonU6/hsmFqSO5xSlAs1Ssw23e8R0rbYc0fo2HWfsmcERN8tl
	B7yBgQF4E/aVG0+HzxvMvRy2Un+OdVNss97KILeHSDmR6+dtfXgAffS4M6A+zZg6Kt50
	fJOmoKa6KjulqRHkbWWQQV9L5yfJdnLVTfYsc8jaRML+PxkSZeFphbZrJ5I6jJ7UsK0N
	8kfA==
X-Gm-Message-State: AODbwcDRE4JtMpzUvsgGNr28ucYc0DCQRTOwYRwtitBS5hhnLAuctncb
	qp6R7DdiZRCZeWB0DC04Og==
X-Received: by 10.99.97.142 with SMTP id v136mr1952127pgb.76.1496335396534;
	Thu, 01 Jun 2017 09:43:16 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:15 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:53 -0700
Message-Id: <1496335374-25575-7-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 7/8] python-netaddr: Add support for python3
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:15 -0000

Extend recipe to support python3

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 meta-python/recipes-devtools/python/python-netaddr.inc        |  8 ++++++++
 meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb  | 10 ++--------
 meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb |  2 ++
 3 files changed, 12 insertions(+), 8 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-netaddr.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb

diff --git a/meta-python/recipes-devtools/python/python-netaddr.inc b/meta-python/recipes-devtools/python/python-netaddr.inc
new file mode 100644
index 0000000..26b0f1e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-netaddr.inc
@@ -0,0 +1,8 @@
+SUMMARY = "A network address manipulation library for Python."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
+
+SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
+SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
index 5b03735..5e089a9 100644
--- a/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ b/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -1,8 +1,2 @@
-SUMMARY = "A network address manipulation library for Python."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
-
-SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
-SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
-
-inherit pypi setuptools
+require python-netaddr.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
new file mode 100644
index 0000000..30416a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
@@ -0,0 +1,2 @@
+require python-netaddr.inc
+inherit setuptools3
-- 
2.7.4


