Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED709C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:06:06 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.2517.1742457961267940464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apQfxb20;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so5437911fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742457959; x=1743062759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pIj6nxCuEkc+ZwA61e0ZAcQtfSqy8iLA7A1yEwMasxM=;
        b=apQfxb20d4qKHtLMThUnLUt4rz8/MCMIPbB4DYUHsTbTwchtS0ItItEtM3Lmq5XeB9
         OZWZCDgMDZXQoW2XeaUzNR8W0siMrfu5s8h0q+38hWzLUvka9TQ/56BRMsHaOfqDKQ/9
         KmIqoI3bKMVv4lgbTt7SMcj4p3dNEPGY22sEHDbEkftU0uvmtNll4UOUFVB1XeEZaKlh
         MMDwyDtuyoI+TSxFgeZ93iajCsu0bkWGmPsAcSWdEuA7q2ZobsWWcolYkIWEX0JEGvRV
         FBWRx+ALyOLwH4kzSBgGE9x2fuQkJloAoeOL8f4ROyv/a9FOKRgXxeCFHZD3n+yPaxWC
         HYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742457959; x=1743062759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIj6nxCuEkc+ZwA61e0ZAcQtfSqy8iLA7A1yEwMasxM=;
        b=acEyMWr17/P9KQocIIlMUwox5XOL/VqQ9a0HY2Ruj00zXfgYqKbwAucua+w35Nhj19
         6WvXfqxuuSh+4YmsAunlKHLn2bxay7tGdm2vLhI3L26g0Z2uChbc49ZwLEvVFzS6oOXE
         jmKAKz0HWz92UZi1F2wj6Bp/CDu/i/VS9ZUo6O0oFQlAdXxwGSsIQiQAP+nfsd39AFlF
         280f+cxRdOb3okOvDT7MN1XsTgDZVT1giVUijKtxG/ZojZCBcHJB0QS0e3H73YhekCKD
         SWoCst8BWWLk5s56aY9Fbh6Q+gGnPUBKnSNnPMtZR1Lu9JoCL8k2zu4M1K7ZV5mGqA01
         bbww==
X-Gm-Message-State: AOJu0YxnHBuSOY5SWUudT4yWUzLMuJCwY8+nIkLnQMj3z2ey4isxEiSA
	NrWNAEZkUvuRIfCFqSdGbRyS+JkOQpLWaOZxJqC+eMy4C39JZj9NgjPVWkzO
X-Gm-Gg: ASbGncsqhjfuft9T3uEu8G4/8SK5S13zowWPSX4ovHXNqu/uVcXsdB8179edRuNLXgc
	U5Q7qLxCGyfvkc3CHdGmJ8bb7DBpQQbuF8aUAmmk1O4wt96/e9swozFEOmGtAgswoZyXeIkzMS8
	5GyqabYYFqfdIYr1ZWTr5Sd+bZHCPFORMHTaq97p3vfTnpuzHPugGHJKAIc69rOgoJPetC9wLVV
	+LO7T3yhqvUlDba1XNmX/LKy4k6y2TuEyoOPx7W3MtIfmCWx8i8FUUXlrEGKEDvxVbZqPafI3WI
	1w4ciKlYf7oU8naJgc5saPHmopBYhgSCnlyHCZcUvpsES8UJTNDjva0qLb72gB9xakeMkPDJKKd
	3B1noBv8rxaKGUCm0NBNvDQFN1NE=
X-Google-Smtp-Source: AGHT+IE2wvfObtDkvhtLXwOocc/2iD+A12BYsZ28y4LKxCqiijlal2dA6Q/2MOJ3rkrohEpq5GtR0g==
X-Received: by 2002:a2e:6817:0:b0:30b:bf4e:f6fa with SMTP id 38308e7fff4ca-30d6a3e9b1dmr22293811fa.17.1742457958535;
        Thu, 20 Mar 2025 01:05:58 -0700 (PDT)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c218csm25797651fa.84.2025.03.20.01.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:05:58 -0700 (PDT)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [meta-python][PATCH] python3-varlink: Add recipe
Date: Thu, 20 Mar 2025 09:04:51 +0100
Message-ID: <20250320080451.1063409-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116121

Add a python recipe to install the python implementation for the varlink
interface.

The recipe is using the current master head, instead of the version from
pypi. This is done as the pypi version is 4 years old, while the master
is continuously maintained in GitHub.

The runtime dependencies were created by looking at all the import
statement in the installed files of the repository and looking at the
relevant packages from the python3 manifest file in meta-poky.

The repository contains a test directory, however, these tests are not
fully automated, and can be used as an example for running the package
on target. Therefore, the package is not added to the ptest system.

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 .../python/python3-varlink_git.bb             | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-python/recipes-devtools/python/python3-varlink_git.bb
new file mode 100644
index 0000000000..d3c89527ea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = " Python implementation of the Varlink protocol"
+HOMEPAGE = "https://varlink.org/python/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
+
+SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
+
+S = "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-netclient \
+    python3-netserver \
+    python3-shell \
+    python3-stringold \
+    python3-unittest \
+"

