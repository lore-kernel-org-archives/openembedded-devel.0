Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5DE7D8DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:40:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3F3dqJZ026993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:40:03 -0700
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 14 Apr 2019 20:39:42 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Apr 2019 11:39:37 +0800
Message-ID: <1555299579-31574-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [meta-webserver][PATCH 0/2] apache2 upgrade
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
X-List-Received-Date: Mon, 15 Apr 2019 03:40:12 -0000
Content-Type: text/plain

V2 Changes: Fix apache-websocket build failure


Yi Zhao (2):
  apache2: upgrade 2.4.34 -> 2.4.39
  apache-websocket: upgrade to latest git rev

 .../apache-mod/apache-websocket_git.bb             |  10 +-
 .../recipes-httpd/apache2/apache2-native_2.4.34.bb |  46 --
 ...nfigure-use-pkg-config-for-PCRE-detection.patch |   8 +-
 ...-up-the-core-size-limit-if-CoreDumpDirec.patch} |  12 +-
 ...ot-export-apr-apr-util-symbols-when-usin.patch} |  10 +-
 ...ache2-log-the-SELinux-context-at-startup.patch} |  23 +-
 ...replace-lynx-to-curl-in-apachectl-script.patch} |   6 +-
 ...-the-race-issue-of-parallel-installation.patch} |   6 +-
 ...apache2-allow-to-disable-selinux-support.patch} |   8 +-
 ...-not-use-relative-path-for-gen_test_char.patch} |   8 +-
 .../apache2/apache2/CVE-2018-11763.patch           | 512 ---------------------
 .../apache2/apache2/apache-configure_perlbin.patch |  27 --
 .../{apache2_2.4.34.bb => apache2_2.4.39.bb}       | 204 ++++----
 meta-webserver/recipes-httpd/apache2/files/init    |   0
 14 files changed, 162 insertions(+), 718 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-corelimit.patch => 0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch} (83%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.4-export.patch => 0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch} (80%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-selinux.patch => 0004-apache2-log-the-SELinux-context-at-startup.patch} (85%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{replace-lynx-to-curl-in-apachectl-script.patch => 0005-replace-lynx-to-curl-in-apachectl-script.patch} (95%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.3-fix-race-issue-of-dir-install.patch => 0006-apache2-fix-the-race-issue-of-parallel-installation.patch} (94%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{configure-allow-to-disable-selinux-support.patch => 0007-apache2-allow-to-disable-selinux-support.patch} (91%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{server-makefile.patch => 0008-apache2-do-not-use-relative-path-for-gen_test_char.patch} (76%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.34.bb => apache2_2.4.39.bb} (61%)
 mode change 100755 => 100644 meta-webserver/recipes-httpd/apache2/files/init

-- 
2.7.4


