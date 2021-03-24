Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.1195.1616604427750128562
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qrpensej;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id x21so28410794eds.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wC4m7X+5vcdHeF5wYjnljjZBtlkeF1iZwbfpjdVZiFQ=;
        b=qrpensej7tS6QbE8o9NTie4pH6BuRAIkiHb2nDwFxghzAjWQK104NI7wQPosx6O8Us
         Na0vayGp++WhWTg/NOSP3u7jYXI5BOCbzw6G0pBe4UBFYio0dhOiQsrDTlniKtiQvDyY
         GvyBpn7xRGMU39ARjKapLHLLNX4XIvQyZZRZOEM6QFbNeODom2qETEqZJoMsxsbbdmqE
         c93vW0v7TPQoOj8ZWtAKH0ywFYUm4eROuCjjByyYgJbWE4JQ6POUIQjj0cXUppq6/g8h
         SfAf6CSXcANM/B1kG4h7CY5ZZMm0XF25Mkor7mkmkUkJJ9a0FGBWAdalUtX36YCvlG1C
         4Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wC4m7X+5vcdHeF5wYjnljjZBtlkeF1iZwbfpjdVZiFQ=;
        b=JXLYjQ2eYp2MTEVADiiI5awy+G0f/j7k4IrQxaXCzvoIluIxR6nGDtxIR3bRrcLnhL
         vUueRIQf2Qvx1yJ/etHZfOJEuLulFOpMRFtA62oAVvCVPco5eF2o2wIFsvMT4HE6HZDr
         pUz5lUOYynCLUrIYt+4LWk4hkWghj+GhVPaWnn/lLs9WY+XwWnmn4JY6lGO1h9QeExZO
         N0JNgF7amfhM0oYGCt5ywaX6WGhFAZ/T55dG8cHSjeSR4s061lab6zBDFF1Gb1520wYd
         zGvpYrHiPpeLhPAGK2v3aRn5Gxq/7K8wmgy90q5QQ3/TCrckmKJId/1WgmQo7t4BURFF
         IbkA==
X-Gm-Message-State: AOAM532bRd/zaxI8ePRTWYIX+ztFPHlUoLQMiGbntv/1DBdzXh5Bb/C8
	ToVZ+0ttYjCKfmVE3k6aiL3TDib2Fdo=
X-Google-Smtp-Source: ABdhPJzLG2PNlapLmC2yy9eCJplems/I8acpqstDTG9CqmeITtntTiReSAgNlGsuD8wtLVPMXszs6A==
X-Received: by 2002:a05:6402:b21:: with SMTP id bo1mr4409169edb.368.1616604425666;
        Wed, 24 Mar 2021 09:47:05 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m14sm1372630edd.63.2021.03.24.09.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:05 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] mysql-python, lio-utils, openlmi-tools: add conditional PNBLACKLIST like meta-python2 does
Date: Wed, 24 Mar 2021 17:46:59 +0100
Message-Id: <20210324164659.390543-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164659.390543-1-Martin.Jansa@gmail.com>
References: <20210324164659.390543-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it depends on target python(2) recipes from meta-python2 which are restricted with this
  conditional since:
  https://git.openembedded.org/meta-python2/commit/?h=hardknott&id=10c65fc18998d302f34634ffceaf31ab335056dd

* telepathy-idle and cherokee from:
  meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
  meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
  also depend on meta-python2, but use only pythonnative from there, so they aren't blacklisted.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 6 +++---
 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb            | 2 ++
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb   | 2 ++
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb         | 2 ++
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e9fcf71a76..0328478ae7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -220,7 +220,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
 "
 
 RDEPENDS_packagegroup-meta-oe-dbs-python2 ="\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'mysql-python', '', d}", "", d)} \
 "
 
 RDEPENDS_packagegroup-meta-oe-devtools ="\
@@ -439,7 +439,7 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm libleak mraa sysdig
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm libleak mraa sysdig tiptop"
 
 RDEPENDS_packagegroup-meta-oe-extended-python2 ="\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'openlmi-tools', '', d}", "", d)} \
 "
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
@@ -916,7 +916,7 @@ RDEPENDS_packagegroup-meta-oe-support_append_x86 = " mcelog mce-inject mce-test
 RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
 
 RDEPENDS_packagegroup-meta-oe-support-python2 ="\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'lio-utils', '', d}", "", d)} \
 "
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
index 4617da8e1b..43fc69073f 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+PNBLACKLIST[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+
 inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setuptools", "", d)}
 
 python() {
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 04f82d2bcd..6009cd0304 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -7,6 +7,8 @@ SECTION = "System/Management"
 
 inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setuptools", "", d)}
 
+PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+
 DEPENDS = "python-native python-pywbem-native python-m2crypto python-pywbem"
 
 SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 0fb4a6e516..4891fd187d 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -55,6 +55,8 @@ do_install() {
     install -m 755 ${S}/conf/lio_start.default ${D}/etc/target/lio_start.sh
 }
 
+PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+
 RDEPENDS_${PN} += "python-stringold python-subprocess python-shell \
     python-datetime python-textutils python-crypt python-netclient python-email \
     bash"
-- 
2.30.2

