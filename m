Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web09.16947.1604949711919906394
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 11:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IW+1FHQf;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id w6so3568343pfu.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 11:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b495ihOW9XVZMnNrdmAZBLg+2pEiAAdGiw7d/FDWeco=;
        b=IW+1FHQf7ZycNTVOcVYJBx1F+/ktPnUNnJ9RKTZnwBrkF6sYF+Kg1H6A2tPnaM3b9L
         zqELAnQ17xgmSSw+4cD5u17hBglNWyISuVEFtjLATd6zgwwy3KFB4nbj8ukhfMmpJYsG
         5tGXGZOxORDP6C8BBH44rWPbqMTBJRHJuwXMfroBXCs/z6BiOGVA6xRH856orI2a3ul/
         dSqjodMoV/RtJ/WzTSf6CicwKmavJ9q1g+0Zl/S6UZJJoQIOMV7/K8RE5BsHXD54BHUA
         AfHr9wpXMhQHY9W2Z/Sa/9IMqAmDmGoDuz3SrWIqQm2jefS0XixJT5dFDsemDzauNS7M
         mEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b495ihOW9XVZMnNrdmAZBLg+2pEiAAdGiw7d/FDWeco=;
        b=KYwfR8pFNYcpCOV2kU8mr9btEktkTCq56qnt5vNvtQm44569wgnG9PthEu2rhG3q98
         K8QUZp6ceLhRwKmhLxKQdBiJT1fVMZVaTCs/FZZhdAP7iUxJAGBpVvhidpf62ZZl5xHd
         qzWQepGE0U+9Oh1uq7hYFUpbWEvjEuc6p1/f37b4QwhdpvWmhsrUxPFjL9QeRdxmnFl/
         d+p2heMi6qdnAh0YplUP5WstTQxk78iku+O4lBYJTuCbUuio7sZPdDajRr/gsa5Ut6zu
         G+UgcsfSqFJyGUAT+3n3DvXgR4/kM1Hj0M/ny/hG3dI6IAjrkyzHp3AZH3LlLpmp9QuM
         MD1g==
X-Gm-Message-State: AOAM533NC5qtg3NYh4GJYmu/wiS0ItXKqijVqOo213b80EFnVtmYMQZb
	nFVb5bchCFEab1vJdTRj/BGZgE0zeDJolA==
X-Google-Smtp-Source: ABdhPJzwvITh9C7t219SiQ/4OXVMGSRGGdOiKqDbWNuUJ4OrGDF9K1k8HYKE7TgL/Ba7hZdKucHkNA==
X-Received: by 2002:a62:2a8a:0:b029:18b:83c1:60af with SMTP id q132-20020a622a8a0000b029018b83c160afmr15231218pfq.54.1604949711223;
        Mon, 09 Nov 2020 11:21:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id p127sm11930685pfp.93.2020.11.09.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 11:21:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] Add python3-cerberus
Date: Mon,  9 Nov 2020 11:21:43 -0800
Message-Id: <20201109192143.3739442-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109192143.3739442-1-raj.khem@gmail.com>
References: <20201109192143.3739442-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregory Anders <greg@gpanders.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../recipes-devtools/python/python3-cerberus_1.3.2.bb | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2476e34deb..b8265fcc56 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-jsonref \
     python3-transitions \
     python3-dill \
+    python3-cerberus \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
new file mode 100644
index 0000000000..61a76f5f63
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
@@ -0,0 +1,11 @@
+# The PyPI package uses a capital letter so we have to specify this explicitly
+PYPI_PACKAGE = "Cerberus"
+
+inherit pypi setuptools3
+
+SUMMARY = "Lightweight, extensible schema and data validation tool for Python dictionaries."
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
+
+SRC_URI[md5sum] = "6e648b38b468617a06745d1e8a96c848"
+SRC_URI[sha256sum] = "302e6694f206dd85cb63f13fd5025b31ab6d38c99c50c6d769f8fa0b0f299589"
-- 
2.29.2

