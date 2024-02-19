Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2F8C5478C
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.37568.1708333363512002979
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CRfhwLpJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333364; x=1739869364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Vf/EDPCrTddTd34BMM0afwneJX/yhc6fHhY254jQ04=;
  b=CRfhwLpJq4587CHT3tNFRWkODmafrllrDUL0DIA+rKR9RM8iqOkTTxWd
   LWUBJa2WggqL8wiz8Ab2KpR7OcEwnivP5buYuAOJtzb9PacFfWyge3oFr
   UPWy8KpR79PL+kvzLWT7XH4Vn53R1gJl9xU43rRMFPZ3JwtpKc0B+HM60
   roPs2+ZVkqnoRMYJ1Y0YAq+tGLE2DkXqY0liBzTf1QDQ6/EqYBZe8/IBo
   LAPrKFSQxYKMtjdbGhA/2qUYQGC4rt/t6+JznWlRoPROgXlH9OxBGma3e
   sQauH2vSYP8nInw+A7KzNeq+EjDr3gq0UbcYIzoslAxf9/5c54+4PyqWM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149621171"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149621171"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 110FD4DA74A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 43469D52EF
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D5CFD1E9CA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 893E91A006B;
	Mon, 19 Feb 2024 17:02:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/23] gnome-keyring: upgrade 42.1 -> 46.1
Date: Mon, 19 Feb 2024 17:02:09 +0800
Message-Id: <1708333346-17704-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--3.483600-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/ye/uue7xcpjDF4r8H5YrEqwyKRnX9xPs4JlA
	4IpB7gNOFR47KB+LLf5vtPtMpliQxa+CQswOit7Pqoeab9Xgz88rYYq12IWZOfY/RnnxIOg22d8
	mtRIRsUMkw8PwVHl/nwXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjtXl9IxEPXOq3ci
	eMeXN3hZAuc7XR18tKVK3W+cnPmBGROBVNmXUDuLGWmeVAULKHrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olSXhbxZVQ5H+OhzOa6g8KrSbTGOHovJgFVn5UzDLD/txAaF33Hd7PiHP70K+GA0FBfxoa
	Dx8CZdktXgDipdvuBvqYB2XQCczGmoFM3hxKmLxmfAqR7F8SYPVBJVeUjAgqy7demFrcc3hfTaW
	W3XR7+94hkGFD2Znuzudb6tcYU7I=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108852

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
refreshed for 46.1

Changelog:
=========
 * ssh-agent: avoid deadlock when agent process dies before we connect to it
 * gkm: fix test-sexp with GCC 14
 * Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hs-to-ssh-agent-and-ssh-add-by-configure-opti.patch | 10 ++++------
 .../{gnome-keyring_42.1.bb => gnome-keyring_46.1.bb}   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_42.1.bb => gnome-keyring_46.1.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
index 32eecf8fb..c3c305092 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
@@ -1,4 +1,4 @@
-From e6464e01bc1cdf5496be2942d1bac41aa609f47e Mon Sep 17 00:00:00 2001
+From 647f3d946ec3fe4800b2bec89371f85a1a4b15cf Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Thu, 23 May 2019 23:44:06 +0200
 Subject: [PATCH] Set paths to ssh-agent and ssh-add by configure options
@@ -11,15 +11,16 @@ We have no executables in our sysroot so configuration won't find them.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
  configure.ac | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4b83664..eda0c96 100644
+index f4f793c..5194e5d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -351,8 +351,15 @@ if test "$enable_ssh_agent" = "no"; then
+@@ -356,8 +356,15 @@ if test "$enable_ssh_agent" = "no"; then
  	SSH_AGENT=false
  	SSH_ADD=false
  else
@@ -37,6 +38,3 @@ index 4b83664..eda0c96 100644
  	if test "$SSH_AGENT" = "no" -o "$SSH_ADD" = "no"; then
  		AC_MSG_ERROR([the ssh-agent and ssh-add commands were not found])
  	else
--- 
-2.20.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
index 65c22e639..8df3710e6 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings features_check gettext
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "c7f4d040cc76a6b7fe67e08ef9106911c3c80d40fc88cbfc8e2684a4c946e3e6"
+SRC_URI[archive.sha256sum] = "b1d3ae9132ff2f8b3f25a190790892968e3d0acf952a487e40f644a8550ce3f6"
 SRC_URI += " \
     file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch \
     file://musl.patch \
-- 
2.34.1


