Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 80C2671B48
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 16:24:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d72so15791836qkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 08:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AttFOUzSA4yf/Yk5PDh0SDO4Kshi7ZfwDF5ee4C8F2k=;
	b=p/FojrUT/f5P1CBXqsVn1GTaAmdBWhVFjYANcSpgI/aqlfBscgmWQkBU2/zciwO0Cx
	nX/DIo/VtDlMWeXoQL6cGH52MD1hRo+fPqF4DOgs48IjcLHJBv2+y1sfeTJbApZaDUAb
	j6Mybles9KeJK8sYpflyLEyuCm0sSwUKlLU8Clf5tOEgT+lZIDV6erFZDrCrtSjxV31Y
	QeqlF26LwXWiO4nBqYP9rY8Ghgb0xbl/tML6YFG8yUXdPCi4odQZEwmTAqRUwrJ+M1q5
	5iE9ZODjdjNM5qvSea7+wtrX+UVIs/htB1bX28saWYhtlqLrgjO6ZIz04SrCYzDGdoBA
	0hcQ==
X-Gm-Message-State: APf1xPA+YSHOlHHhOftNMeeK07BsstDN31x0wX0BvKkiuIIwZrl6dYEB
	hszViJNEZOxsgxv8ez6CiACI5n1N
X-Google-Smtp-Source: AH8x225ZsD3tc9lhIWqm6V4bx2dHFRgvbQyHP6O8s6+MZZLG1gVlgkndncMJW+WTvpW0Ck1DeupMOw==
X-Received: by 10.55.212.205 with SMTP id s74mr6818905qks.305.1518366242044;
	Sun, 11 Feb 2018 08:24:02 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id c8sm5122776qtk.82.2018.02.11.08.24.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 08:24:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Feb 2018 11:23:49 -0500
Message-Id: <1518366229-14523-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-webcolors: update to version 1.8
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
X-List-Received-Date: Sun, 11 Feb 2018 16:24:01 -0000

Update license checksum for copyright date change and verify
terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-webcolors.inc            | 6 +++---
 .../python/{python-webcolors_1.7.bb => python-webcolors_1.8.bb}     | 0
 .../python/{python3-webcolors_1.7.bb => python3-webcolors_1.8.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-webcolors_1.7.bb => python-webcolors_1.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-webcolors_1.7.bb => python3-webcolors_1.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-webcolors.inc b/meta-python/recipes-devtools/python/python-webcolors.inc
index fe1ab95..a67b32f 100644
--- a/meta-python/recipes-devtools/python/python-webcolors.inc
+++ b/meta-python/recipes-devtools/python/python-webcolors.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=358df7e9eb65e1843dbb36abd476c5c0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=197add016087e6884a012b0f185d44ad"
 
-SRC_URI[md5sum] = "4733fa1077f680bbdd918cdef1e32c11"
-SRC_URI[sha256sum] = "e47e68644d41c0b1f1e4d939cfe4039bdf1ab31234df63c7a4f59d4766487206"
+SRC_URI[md5sum] = "d7a17135f8b8374a75c2f1d08253c026"
+SRC_URI[sha256sum] = "da3cb551060f46f417341b041b36d329d699c125a13a4412dde5c2e310d63344"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-stringold \
diff --git a/meta-python/recipes-devtools/python/python-webcolors_1.7.bb b/meta-python/recipes-devtools/python/python-webcolors_1.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-webcolors_1.7.bb
rename to meta-python/recipes-devtools/python/python-webcolors_1.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.7.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-webcolors_1.7.bb
rename to meta-python/recipes-devtools/python/python3-webcolors_1.8.bb
-- 
2.7.4


