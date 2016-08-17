Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C68C73285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:45 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so7408131qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=cUdSR6eUYE3fnRQ6f+1NC/kj+rgdZI6vtwDTuIAeYDs=;
	b=sWXSfYvElZgOtHkej8rFL/vVEHp8F2PVcmS9hJtGwD3OAX4Z32h/4nouCPu1T9R1Ag
	IDnU0HYdOvEmpXvhcOd2UkJV9eMIx5XLIBknYeObE8d5FQzKpCENd4Y3luK5KFofj91p
	GZMzFS8HcsOAIcsX6anFjIk5dP2cfV7Ot9AU5aop9X+j3XkSCXles/5juUZ+WvJjF5EK
	njfY/PWUNVcQSNTGSoFTlOIuEeQyrUbmfY+nGkRrBrmz4ZkbX/PG4p6M9don16G/orEa
	+7jfk7BDWLxO8AJ//lWvMmNXH+SBZzHB9T+9mHHZdg1tVAx1jXVxKF9zAcihnZeEmSSR
	d6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=cUdSR6eUYE3fnRQ6f+1NC/kj+rgdZI6vtwDTuIAeYDs=;
	b=XlKLl0VWgxXEfX25y8d8C5P6e4+sddSnYjth+DOIbgYKZoifXmmwQ+PRS0ItbFPo/B
	cF0jQdrYpvHDZP8aeobVGhGI2F6ehvtCCz4TJyvQe3Z4ZdN7FJHZ71MjgjPkLqMJL2W8
	EI5KX8WjbMLmmCL/jf0mo64rR5jvPwtBSsumqZ+4hUA1MZi0aXUCzqDY+Rwq/RvclE8I
	Qu1DZoe4DvG5Fo5nRS01s6qJcDwjnUpEAdIdaxIXTqNKUAmQk1FnEdP9MSr5ObaCUj0X
	wBxErQpMcBI6kr6ipYFaGvEa+v/+/+OoZOHhYcdVMHJobnhWNcZ2R+Rx1yo5Evt/4HxX
	P1yw==
X-Gm-Message-State: AEkoouvqu+22BIk5FJLylfzHvWtCQEYcup87PDOS9V4Tz1BcOEAlQkmcfVVZLZR11At8WA==
X-Received: by 10.55.53.6 with SMTP id c6mr2204377qka.141.1471439926283;
	Wed, 17 Aug 2016 06:18:46 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:45 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:47 -0300
Message-Id: <1471439868-10118-7-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 7/8] python-strict-rfc3339, python3-strict-rfc3339: Add recipe for version 0.7
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
X-List-Received-Date: Wed, 17 Aug 2016 13:18:45 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-strict-rfc3339.inc     | 8 ++++++++
 meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-strict-rfc3339.inc
 create mode 100644 meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb

diff --git a/meta-python/recipes-devtools/python/python-strict-rfc3339.inc b/meta-python/recipes-devtools/python/python-strict-rfc3339.inc
new file mode 100644
index 0000000..dca9ea9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-strict-rfc3339.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+
+SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
+SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb b/meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb
new file mode 100644
index 0000000..b01ea99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-strict-rfc3339.inc
diff --git a/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
new file mode 100644
index 0000000..9e37052
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-strict-rfc3339.inc
-- 
2.1.4


