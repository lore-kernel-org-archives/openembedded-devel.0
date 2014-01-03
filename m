Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A2B1E6BBB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 20:59:31 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so6927325ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 12:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/4ynAxFPzZ2Vx/hlVtxvws46aVd1CDlTHsKAwn0njfg=;
	b=mQQ+ymf/3hcQpOjJ40E7dnssJi/57Yeq+F7bnBU6VaEexfjJIj6xeWuC0WK59657O9
	9eLhpTVvS4Cmpuo/3aKFsynbM67Ey6PmoE28H5kmEu1sZiM+afFxaUo7vR4LBeeveFYN
	t/U58DIsXGtWYTrQUTDUdCGM2XDctxBUBBOBEmQPI5xvQt5fnvC4Ev+9zxEqeFBtn/Wa
	DYbdzU6jLm67ikQDnEOb3yhBaNAEQkfhM3ISDZG/u631Ldbk1P/tEVV9cC4P2bVR6g+E
	jaFmOrGcvDC8gHDTppGw2GwQnolS5INRTwXzMuqVlB80TsI9xQABT+udJctoD0W6WPbL
	4dmw==
X-Gm-Message-State: ALoCoQkgxdgYV7NpN4c4ICDuayOktUwIVRI1cWqXPrcthunMJOO+kXdLi6IqaluUZsCf3UvBEUCN
X-Received: by 10.15.110.8 with SMTP id cg8mr23300214eeb.42.1388782771947;
	Fri, 03 Jan 2014 12:59:31 -0800 (PST)
Received: from localhost.localdomain (5-13-221-193.residential.rdsnet.ro.
	[5.13.221.193]) by mx.google.com with ESMTPSA id
	p45sm148062011eeg.1.2014.01.03.12.59.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 12:59:31 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jan 2014 22:59:23 +0200
Message-Id: <1388782765-16266-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [meta-oe][PATCH 1/3] mariadb: Add patch to fix urecognized options
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jan 2014 20:59:32 -0000

Add patch to tell autoconf about with-plugin option.
In this way we avoid warnings like:
configure: WARNING: unrecognized options: --with-plugin-maria

Change-Id: Id64ac01d7f2072e1bca8979c5da3e8c6520105cb
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../mysql/mariadb/avoid-plugin-options-warnings.patch   | 17 +++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc        |  3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch b/meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch
new file mode 100644
index 0000000..84ff6f0
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch
@@ -0,0 +1,17 @@
+Tell autoconf about with-plugin option to avoid warnings like:
+configure: WARNING: unrecognized options: --with-plugin-maria
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: mariadb-5.1.67/config/ac-macros/plugins.m4
+===================================================================
+--- mariadb-5.1.67.orig/config/ac-macros/plugins.m4
++++ mariadb-5.1.67/config/ac-macros/plugins.m4
+@@ -38,6 +38,7 @@ AC_DEFUN([_MYSQL_PLUGIN],[
+   _MYSQL_PLUGAPPEND([__mysql_plugin_list__],[$1])
+   m4_define([MYSQL_PLUGIN_NAME_]AS_TR_CPP([$1]), [$3])
+   m4_define([MYSQL_PLUGIN_DESC_]AS_TR_CPP([$1]), [$4])
++  m4_ifdef([_AC_ENABLE_IF], [_AC_ENABLE_IF([with],[plugin-$1])])
+   _MYSQL_PLUGAPPEND_META([$1], $5)
+   ifelse(m4_bregexp(__mysql_include__,[/plug\.in$]),-1,[],[
+      MYSQL_PLUGIN_DIRECTORY([$1],
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index 7cedd9e..e311ed7 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -16,7 +16,8 @@ SRC_URI = "http://mirrors.coreix.net/mariadb/mariadb-${PV}/kvm-tarbake-jaunty-x8
            file://zlib-let-libdir-configurable.patch \
            file://storage-forbids-absolute-addresses-on-IA-32.patch \
            file://my.cnf \
-           file://mysqld.sh"
+           file://mysqld.sh \
+           file://avoid-plugin-options-warnings.patch"
 
 SRC_URI[md5sum] = "44c331fa91943155e4796f89e17a0612"
 SRC_URI[sha256sum] = "33471e9275c9b03919cabc38eb39f807d645adabf6a1a18f2e41ed73f47677c8"
-- 
1.8.1.4


