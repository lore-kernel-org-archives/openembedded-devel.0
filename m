Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA71177811
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:12:10 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y6so5364003pgp.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3NHOucNjlqlmwXluvSrYuZzgu200stOmR34dIC+HAYQ=;
	b=LDrFMLkJlFMpluX9YqCPGxj/s+xegFBJPrSUfMqOOQ4JB2ReV6L1j3laYr8BzOrebF
	WonvramuE6VLa7Qvks7qnsBtz0+1PChrQC/iwAusoLzVq/2AxIwy7AuhnlcWCiQHYgvI
	Xv1qJta7dqjC1u2Gnjc+VPgs1uXItwr7MlT0joVjdQiwe3IBMhNjjCme+P2i2PwHQzLc
	3LnwbqVlKueY9k15zMFctSga6jHtilaygYb1qdOa5+69yU2eu80sRcUo3beQ8V12tWxg
	Mxm426xkkrnUyUCaHn1cJdGulR+rZC3JCjEOZlo85Us2s66RJlvOjtBn5AuU359wM+3+
	rhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3NHOucNjlqlmwXluvSrYuZzgu200stOmR34dIC+HAYQ=;
	b=nIcXjBvp7UGzX0skQR/Bo8aHXgiBLwFPyCsFJFO7EEZRNdttCtUYm0uEVgeCEBo7u9
	ibQwkfz9KPj+IGP/Gb/Rkkw3g8pAvmgggeyYvJn2BPpr2xmgHf+m5T1KKWKNIYskSOa4
	rb+EoUhfqvdo254WzoZqgPjxzxRZ900wbO5PH3gNRpNOKvxOGCpmzp8xJq6HAzP7k9kE
	7an2U0uOEVgcxLVgLE5KUNLpnPbuO7+rqw6G+Lyr38VmjP4o6aWqT6Nc0aLHKYQMDvpd
	Z+Pua+/npqLZJ+mEh038EUmPwZK5QforJoUSP2quB+oFgUcYF/DF2A5C02KKX+HFdIO/
	9KMw==
X-Gm-Message-State: AJaThX7DLBVHhWtCFJlxtwxiwehCCaCl3aE+nmMlKabyND3WSL/KbnoO
	5oi3KgiNRbozzJeQF5A4bzkAhw==
X-Google-Smtp-Source: AGs4zMaOEkqJB7LW8yVzYJgC9/mAkg3qGQDoUIwUT+/4K/g5GSwqUD3kjZMw12yO0xSE3oiRVl8TAw==
X-Received: by 10.98.216.193 with SMTP id e184mr12420355pfg.98.1512191531421; 
	Fri, 01 Dec 2017 21:12:11 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm15070855pfe.99.2017.12.01.21.12.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:12:10 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:11:53 -0800
Message-Id: <1512191514-1791-1-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 1/2] python-blinker: move core recipe code to .inc file
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
X-List-Received-Date: Sat, 02 Dec 2017 05:12:11 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-blinker.inc    | 7 +++++++
 meta-python/recipes-devtools/python/python-blinker_1.4.bb | 8 +-------
 2 files changed, 8 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-blinker.inc

diff --git a/meta-python/recipes-devtools/python/python-blinker.inc b/meta-python/recipes-devtools/python/python-blinker.inc
new file mode 100644
index 0000000..eaf3908
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-blinker.inc
@@ -0,0 +1,7 @@
+DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
+
+SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
+SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
+
diff --git a/meta-python/recipes-devtools/python/python-blinker_1.4.bb b/meta-python/recipes-devtools/python/python-blinker_1.4.bb
index 0ce141f..bc4164e 100644
--- a/meta-python/recipes-devtools/python/python-blinker_1.4.bb
+++ b/meta-python/recipes-devtools/python/python-blinker_1.4.bb
@@ -1,8 +1,2 @@
-DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
-
-SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
-SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
-
 inherit pypi setuptools
+require python-blinker.inc
-- 
2.7.4


