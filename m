Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id EC7687D9ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 17:07:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b10so7798017wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QqFr5X3aDiFav0ovjPuq9fiaU80R9+y6o+loWoSSgto=;
	b=depTUyLEtsEDfFkNFO+m/8/kwhQ8CWDWdAVv3UmsKLW7VypSCcm/2Hj98tJvmXl7cp
	aEFxW+kMjwM4llfrHRmMpcTB6TcwvnJPuAvDjb97WWnLSrTEZmCoZvcPX3ATbiMwA5IV
	nUojo6le+kYMTDDpN75mWh7XAxpjygREYeR0AbH4tZSr7aW3VAzXIH9oLypEhanll0ty
	//O2jyWQjmN8ePrO5ZQwC/VpFqG6wyCayVkzJQAnJdtH8qTk0V4W5Djy6+uWLlVNi+2E
	piex8WbScEgoDp9QTfkN/D/jkT6f5FJMp8rNs2w4jyJFAwQyA8PQzgRhJFaPR3KfNL0l
	M5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QqFr5X3aDiFav0ovjPuq9fiaU80R9+y6o+loWoSSgto=;
	b=UBIw/9SAatogpKBbawE8onNbL70CsOwU3SGEGYk+/9zxEQcXBVOGPoF2KRQEl6b+yQ
	sUR72cwLOvhHqwqHM9V+mOyHv/YluLzuVZt0npVLFD/e2/37/QhbYF+X5j2p2W/zOnfr
	DAjsFifljvi9/hJ4RzHO4gPlaH4UgQoyHFwOlTW7yfWCdQuIRBD5vGqZVdyJwgyfZR3d
	Tw6Vj6YHE5rvSRMk3wIwjUWI1J1nXdLFsJjHx2hxA7PQj0MFXxIOwt3aH8KVhJjRiEQo
	5Tb+IU+/GdP7WU4cBM2OvU1wNrUpcLMI3O0m2ChNel3S9+2XsPT+9v1nycDlWKCajw4u
	VuSg==
X-Gm-Message-State: APjAAAWVzI7rZ7TRdorIRs1Z+zUUQxwWf07CzXnSJIDOGNNPH6vEhSEO
	fHgdyU45b7esFix1ift2uLlrfj9eaw==
X-Google-Smtp-Source: APXvYqxH7MHHp1RCoTlqLVKg0FnKt2utE82tBRpqdKDU3AdCbxkZK4yztDy5SUhtWbDaqtVAhzxWIw==
X-Received: by 2002:a1c:80c4:: with SMTP id b187mr7805663wmd.7.1556730429224; 
	Wed, 01 May 2019 10:07:09 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id o6sm1288592wrh.55.2019.05.01.10.07.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 10:07:08 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 19:06:59 +0200
Message-Id: <20190501170659.2997999-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.17.2
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-sentry-sdk: add version 0.7.14
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
X-List-Received-Date: Wed, 01 May 2019 17:07:09 -0000

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../recipes-devtools/python/python-sentry-sdk.inc    | 12 ++++++++++++
 .../python/python3-sentry-sdk_0.7.14.bb              |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sentry-sdk.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-sentry-sdk_0.7.14.bb

diff --git a/meta-python/recipes-devtools/python/python-sentry-sdk.inc b/meta-python/recipes-devtools/python/python-sentry-sdk.inc
new file mode 100644
index 000000000..0c123cef4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sentry-sdk.inc
@@ -0,0 +1,12 @@
+SUMMARY = "The new Python SDK for Sentry.io"
+DESCRIPTION = "This is the next line of the Python SDK \
+for Sentry, intended to replace the raven package on PyPI."
+HOMEPAGE = "https://github.com/getsentry/sentry-python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
+
+SRC_URI[md5sum] = "fef016d075137c4fb8724559cad28b86"
+SRC_URI[sha256sum] = "5818289868755cfea74e61e532b4b0d11d523901041338d473277db91d4d8173"
+
+PYPI_PACKAGE = "sentry-sdk"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.7.14.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.7.14.bb
new file mode 100644
index 000000000..840df9340
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.7.14.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-sentry-sdk.inc
-- 
2.17.2


