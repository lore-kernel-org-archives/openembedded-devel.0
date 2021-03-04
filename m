Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.2255.1614890706894476296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 12:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=lsTo5vfZ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.182, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qk1-f182.google.com with SMTP id d20so28354086qkc.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 12:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:organization
         :content-transfer-encoding;
        bh=Y7EL1KoiJtIXBEH4TJezRd2s7IlrH+TqbP7+qp9f0Ek=;
        b=lsTo5vfZ45CniDzU4HQQgwXCXeAXjucQ6RmR/oqGmNtBIwAO3VUNen2gQdcQAgZ8NH
         jwTZ07S4tXJjDAQfrozUIZXS871A2AXhUg2f+U//uEUOnaru9Np4O0jKbJOXr0oJl49C
         wjHb6OjwZKM2bSmFl+kGw88cMkiLBONNnY7pkKiL/pWnSBbc2oM2k/6/+JiIqBdxm9vH
         AaIf1HjP9Sb/lOlUwlSWG70eNJxZt3guolAAIsglRX5VtGWQgn8i4OKtMSRm+QdzM3QL
         bjdURbbzySj5bOoMCpAKlRotFFb7Gqt0e1jKMHAuGjbp/MLN0wE3/FiahB3fNN8KRmik
         pBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=Y7EL1KoiJtIXBEH4TJezRd2s7IlrH+TqbP7+qp9f0Ek=;
        b=QQXYjWXpDNofUC+QOB0R7e8tKEHnK/sWl0/kdMCrwgJ5RIeg0vIyzMioLzsgICnkQA
         XMMrk5t6z2xHqd4EGIDImHFbvR7NWu+UQ2VNL5GqIXryqa0rXTaOvEND1JTa0ITi8pcw
         CgIZEiD/7x+epfDF5TyrQ8sSAtdDNY+uQHYslFjj8cwCRd8cpBaONiD4G17sm68ENqdX
         FUUv6I0Cg0hSx7WP+Y3rT5srQboLqfO46bGH+gQsIBLSvLCGD71yev9Ir5GVLA650kKW
         VjlZJ/FZhwDNTW2cygiSOHp4eMCNo7moPF4qNxY7JEgzUnQKLrNLfZoxXf+YX8/jQXnO
         wuNA==
X-Gm-Message-State: AOAM530ra8wOSE941s2SSYqDSfBFQL9f+THZUoXQ8J0Ai0AR4LrRXj7j
	d56X6rRN2T7jnbUWortmAC2IGhrhlRKHziec
X-Google-Smtp-Source: ABdhPJxdlHm3mZAZaQQiMhzlm73r6W3xrFjPdhq/aRgWYj85vTJnrty6cRB/n3RybVZ3ZsFE84NT4A==
X-Received: by 2002:a37:8544:: with SMTP id h65mr5846827qkd.200.1614890705536;
        Thu, 04 Mar 2021 12:45:05 -0800 (PST)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from pikachu.lab.ossystems (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id u13sm463862qtq.87.2021.03.04.12.45.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 12:45:04 -0800 (PST)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-requests: Support idna version 3.1
Date: Thu,  4 Mar 2021 17:45:01 -0300
Message-Id: <20210304204501.3467547-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Change idna required version to use python3-idna recipe that currently
is on version 3.1.

Without this change python-request doesn't work as the idna version
doesn't match the required versions. When bump python-request recipe,
verify if the upstream project bumped the idna version and drop this
patch.

As this recipe was tested with python3-idna_3.1 don't allow higher
versions.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../setup.py-Support-idna-version-3.1.patch   | 40 +++++++++++++++++++
 .../python/python3-requests_2.25.1.bb         |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch

diff --git a/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch b/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
new file mode 100644
index 000000000..26332249d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests/setup.py-Support-idna-version-3.1.patch
@@ -0,0 +1,40 @@
+From fc45beed40a86c8fc38fc430765c1c5d2c9961c2 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 4 Mar 2021 09:26:48 -0300
+Subject: [PATCH] setup.py: Support idna version 3.1
+Organization: O.S. Systems Software LTDA.
+
+Change idna required version to use python3-idna recipe that currently
+is on version 3.1.
+
+Without this change python-request doesn't work as the idna version
+doesn't match the required versions. When bump python-request recipe,
+verify if the upstream project bumped the idna version and drop this
+patch.
+
+As this recipe was tested with python3-idna_3.1 don't allow higher
+versions.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7ba4b2a2..9d3b973e 100755
+--- a/setup.py
++++ b/setup.py
+@@ -43,7 +43,7 @@ packages = ['requests']
+ 
+ requires = [
+     'chardet>=3.0.2,<5',
+-    'idna>=2.5,<3',
++    'idna>=2.5,<3.2',
+     'urllib3>=1.21.1,<1.27',
+     'certifi>=2017.4.17'
+ 
+-- 
+2.30.1
+
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
index 6af836543..cea8fd517 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+SRC_URI += "file://setup.py-Support-idna-version-3.1.patch"
+
 SRC_URI[sha256sum] = "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
 
 inherit pypi setuptools3
-- 
2.29.2

