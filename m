Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.383.1616693137986150508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 10:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tzia/THW;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a7so4246796ejs.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+ovB4tVZwIUEdl+zDZm7nXWeJKkjzTp8mALDNA7vYo=;
        b=tzia/THWFKHsXERlhBCfs4rZJyo/q898M+hl4kK1Wtwx+290IfxOwfmuUXIRi87rmL
         9h6WiPeJadRpk9ilitiJkKR1OApaXQdOsWUzyR4Zp1WiIO7++vpm/jhzkStiqUycC5Rl
         0RyCZ21bfrUvjOuqwqu5jDqm5Pn/RuJn90qSllLrgKkRT3hDThRXxN8o+SW2RtX3/jFZ
         Hof4wxGxH7ZWHs9lkvrMHgkxBInGEYIMnkLIVPK41cps4rNNhBFddAIu1j2km3j21B+v
         T5Ih5IzQhc1z23q1aEbI/35uWAwEqDsaHzQ34B9wKyMoVzZgpFeBPJHmcM7Ddey+moYv
         AXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+ovB4tVZwIUEdl+zDZm7nXWeJKkjzTp8mALDNA7vYo=;
        b=NmucOPHtld8543fpkbpAKvR6AGFKKz1imuO24Df5MmRqa28QHd0R0kllZU+VElTmsG
         C0zVebrU04h8nksFwfiyVG+fFuk473u7AVnLjaS1PVQ05Gk3WkQXTO2mh3bDomfI8ZZb
         n07SgBdgPswLn7McgOx63xrtMTgD6Ww/b9UjcDEimq8WnRS6e98Y2kJuDq2VSwH6G2lp
         2DOIUIUVrNVkgNUzeQPNqbBxeye5BpWBoPBS90a6P8+IPehD7ULGHRALLFj4Hy8Qo5cK
         sWRooZT/9xH4Gxz+Yau1WlfUT82zA7Nx0nPJ978Yc64NgJJBW/uK4Fq/cuU4hw749dm0
         TMbQ==
X-Gm-Message-State: AOAM531hx9xLQle/WZmd8nL3hgRMkslS/7JWW2u1MvPYv+tLrHxJW0fZ
	LUUe6843n+ieFhCc/Z12WMYBpdNzhI0=
X-Google-Smtp-Source: ABdhPJzFgLmVjczQW9bvuzoJ4eHJa8mC16WKojb9miQUH4uXsUu0wyhH9eW/F1qxVGvq0aN/u7YGUw==
X-Received: by 2002:a17:907:2112:: with SMTP id qn18mr10418209ejb.220.1616693136391;
        Thu, 25 Mar 2021 10:25:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w24sm2963140edt.44.2021.03.25.10.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 10:25:35 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] mysql-python, lio-utils, openlmi-tools: add conditional PNBLACKLIST like meta-python2 does
Date: Thu, 25 Mar 2021 18:25:29 +0100
Message-Id: <20210325172532.1099941-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
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
index e9fcf71a76..4bf1402ac4 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -220,7 +220,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
 "
 
 RDEPENDS_packagegroup-meta-oe-dbs-python2 ="\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'mysql-python', '', d), "", d)} \
 "
 
 RDEPENDS_packagegroup-meta-oe-devtools ="\
@@ -439,7 +439,7 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm libleak mraa sysdig
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm libleak mraa sysdig tiptop"
 
 RDEPENDS_packagegroup-meta-oe-extended-python2 ="\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'openlmi-tools', '', d), "", d)} \
 "
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
@@ -916,7 +916,7 @@ RDEPENDS_packagegroup-meta-oe-support_append_x86 = " mcelog mce-inject mce-test
 RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
 
 RDEPENDS_packagegroup-meta-oe-support-python2 ="\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'lio-utils', '', d), "", d)} \
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
