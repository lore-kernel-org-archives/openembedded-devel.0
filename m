Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D961365CBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 16:32:01 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u10so2769947qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 08:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mxiqgl10vLLqGE8mc/EAi7je5Pe1OOfSu0UpC5qTtLM=;
	b=jHpCaz4RGcqa2zayG7/lv2eu/J5pWGphzRfVn6zCGk016TTVSrXUS1r2sT7zEP+n+G
	8mRxmhm5d4IzW+fkP4W+Hd3ev1KTUa495JTVpUnEyGusn+GVc/mmwljtc8P7Iu8gXmoN
	iG9WN8r7CEgG/hSkHeZW83bDDflwWvRMpZtNRhMYTghOKIWAoLeaYlNA3DiC+P4V9UBA
	l9ZTzllWlGED/uoyzVRhfzVkZeUNqEUmasmSBvboSORz+s3JBWkVagE/GFWUYJPRJW5F
	IEDHMTBH9i5RuzstPZOjhNDPe7iJbR29Twaaw6A+wj8zIrV3ZHuN/ZuE+rcx1XoVHzB+
	YtAQ==
X-Gm-Message-State: AKGB3mJeq9H33HaL4qw6HaDCE5/moLp+F9c8f2d7VR4WFfhC5J7OXdGg
	zDDHnk19u2ds3ASb674H1UNs/2j4
X-Google-Smtp-Source: ACJfBovjeilJWRzIf4qOwaT7uFJji8pKFGQkxL23uWZeyerWJFHgVrDFNv+JEf23foxyRpWJtH5xrQ==
X-Received: by 10.200.58.231 with SMTP id x94mr2246828qte.245.1514997122826;
	Wed, 03 Jan 2018 08:32:02 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id x6sm867148qkg.19.2018.01.03.08.32.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 08:32:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 11:31:58 -0500
Message-Id: <1514997118-12481-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] pypi: remove class that was added to oe-core
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
X-List-Received-Date: Wed, 03 Jan 2018 16:32:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/classes/pypi.bbclass | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-python/classes/pypi.bbclass

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
deleted file mode 100644
index e5d7ab3..0000000
--- a/meta-python/classes/pypi.bbclass
+++ /dev/null
@@ -1,26 +0,0 @@
-def pypi_package(d):
-    bpn = d.getVar('BPN')
-    if bpn.startswith('python-'):
-        return bpn[7:]
-    elif bpn.startswith('python3-'):
-        return bpn[8:]
-    return bpn
-
-PYPI_PACKAGE ?= "${@pypi_package(d)}"
-PYPI_PACKAGE_EXT ?= "tar.gz"
-
-def pypi_src_uri(d):
-    package = d.getVar('PYPI_PACKAGE')
-    package_ext = d.getVar('PYPI_PACKAGE_EXT')
-    pv = d.getVar('PV')
-    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
-
-PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
-
-HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-SECTION = "devel/python"
-SRC_URI += "${PYPI_SRC_URI}"
-S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
-
-UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.7.4


