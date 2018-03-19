Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AAE38782CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:59:39 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o184so18319995qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=veHdnlKRFGR5evkUfbwOjEHEVHgjwKpGQ8iXwaCd6Xw=;
	b=sHjam+4D77H56eYgUYcGEvtvHbl2MqZHNBOHsSIHWuOGNb4GLSwf5zdaGZ0Inl5qXt
	ug+Fk4A6R9m4msntpN+6QUe0ccjkbIpUuQLG1gxWPHIg5NTSKHdlP+2IIqjEfd4TqGfi
	feAGOSlYV44c5VXxr4ED77LAoOWoOzMswoD9oQS8mH2lfZrC9HgXfWgzvjQRDXboy+7B
	+dX6VtcfkJoCp98WkCXF0ejmD1gxVVUYEqYYii07+ibrzYAnVcbN6iEcqgQeWNHYEdxC
	CDkoBhJ6wvkoa69GTZblMKYX64I82Jw4J4dbUtY9mZVdcRYoxILpMbSL3PUAXsgA9cjU
	3Ffw==
X-Gm-Message-State: AElRT7FGJZE/AQouVcK35eCUB6hFrBvjHDHHAEXVdoK/MggdOedWJTpT
	qw6mw/ISF6/Ubps2RqM5HMwUJNZ3
X-Google-Smtp-Source: AG47ELttFS1ZSrlH0PANz5f9y0arZotvS40d/vmqGvfrFSn9VFBQrrhAWe7hWRsamR6dPL1CJKyv2g==
X-Received: by 10.55.186.193 with SMTP id k184mr17824092qkf.4.1521467980210;
	Mon, 19 Mar 2018 06:59:40 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id m187sm73413qkc.17.2018.03.19.06.59.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Mar 2018 06:59:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 09:59:30 -0400
Message-Id: <1521467970-27387-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][rocko][PATCH] python3-asn1crypto: add support for Python 3
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
X-List-Received-Date: Mon, 19 Mar 2018 13:59:39 -0000

From: Ricardo Salveti <ricardo@opensourcefoundries.com>

python-asn1crypto.inc already available and used by the Python 2
version.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
new file mode 100644
index 0000000..30f3404
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-asn1crypto.inc
-- 
2.7.4


