Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83403C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:42:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.4049.1647909724572989408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wPkj9AWJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647909722; i=@fujitsu.com;
	bh=uKfV5Wh5vxkax7pr65q5pdonM5I6Gx9GPPX9QJLPp2g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wPkj9AWJMhlH5Rq0kW7/iuUfOUzwkPA1ZtrdvW/d/PbWIZRVHrYW46mSHQsxkUJ+x
	 okU+7VRkHKdEh1fQOWe9BOsrK90KbNaPatpJ4/Yz4g9wNduEg9j81CY1FoQGsi1/a4
	 /9H5ntJHNFWHZUtGB//zvc5O2u7fMzsGxb9+kzS98QyB9ZvAqav7QiLCt1ILeSsAMP
	 rhdaRNXjzhsJgmg6D9Hrbiuq5eaBBOG0zMU3mvbgxXOYmaGTY58h1EEfhlldLGOQZk
	 aGqFCex8A/JWTVGbnKiG5m6hINC4tgSQuEm1j2wZJicnbnYzKLARuol+FXJGHdpGDO
	 M7LknW7S7HeHg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORqBspbZl
  k8O2/qcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFkRzNrwQ6RiskXzzE2MB4V6mLk4hASeMIo
  sXrjanYI5wKTxJOvn5ghnD2MEgvalrF1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKjHpdStYPYuAqsTzdffA6nkFHCU2z7sLZksIKEhMefgerJdTwEliRctjsF4hoJqJ/w
  6xQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0SyrKTM8oyU3MzNE1NDDQNTQ01TUz0zW0MNNLrNJN1Est1U1OzSspSgRK6yWWF+ulFhfr
  FVfmJuek6OWllmxiBIZzSrHTrh2MB/t+6h1ilORgUhLlffHQIkmILyk/pTIjsTgjvqg0J7X4E
  KMMB4eSBO8bccskIcGi1PTUirTMHGBswaQlOHiURHj5PwC18hYXJOYWZ6ZDpE4x6nJ8OHRlL7
  MQS15+XqqUOO9pKaAZAiBFGaV5cCNgcX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvLUm
  gKTyZeSVwm14BHcEEdIQ+qxnIESWJCCmpBia3tOveL5lCGV5cWBqzx+f+jZwtjErH0srS0y8n
  nG7WMNpSeZnb/GOM5DLHT3Ln/qgzLTrtMnHR2WDPHdblJzYaSJ6f3rPNdLnXOt2VLAtf3lvss
  5LDdZHi7F9NR3iqZU+afz/I/H19fdvK/trvDw1z7W8lT7l/oD///oYAti6Tjd0XZ2SbH/H/UZ
  god8fAKnXTWWbzZNd3j+8d2CPpHP7jc8y5Z7XH/zpdtOsr1fJPu1N44pnOspWNFbnXV9T8MLz
  /etmnLT7heyUiuCdKMvKKvfadv43lh6F5Ubun1LZ7r7VfqL+NjGv9n1+YsmnbROWrHPfFHCcm
  9CvydPF9TuhcHKv8+6Hp1gbZ8rMX5l5WYinOSDTUYi4qTgQAUft3OG4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-545.messagelabs.com!1647909721!222654!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8123 invoked from network); 22 Mar 2022 00:42:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 00:42:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 67464100184
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:42:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 59D7910004D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:42:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 00:41:40 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-photos: upgrade 40.0 -> 42.0
Date: Tue, 22 Mar 2022 08:41:25 +0800
Message-ID: <1647909686-2107-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647909686-2107-1-git-send-email-wangmy@fujitsu.com>
References: <1647909686-2107-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 00:42:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96121

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-incorrect-args-for-i18n.merge_file.patch | 31 -------------------
 ...me-photos_40.0.bb => gnome-photos_42.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch
 rename meta-gnome/recipes-gnome/gnome-photos/{gnome-photos_40.0.bb => gnome-photos_42.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch
deleted file mode 100644
index 9fb7a5b9e5..0000000000
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a112e8a089851035945b6848849149bb36787906 Mon Sep 17 00:00:00 2001
-From: rvalue <i@rvalue.moe>
-Date: Fri, 21 Jan 2022 12:36:02 +0000
-Subject: [PATCH] meson: remove incorrect args for i18n.merge_file
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- data/meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index 6e7192e..94271de 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -3,7 +3,6 @@ subdir('icons')
- appdata = photos_namespace + '.appdata.xml'
- 
- i18n.merge_file(
--  appdata,
-   input: appdata + '.in',
-   output: appdata,
-   po_dir: po_dir,
-@@ -23,7 +22,6 @@ desktop_in = configure_file(
- )
- 
- i18n.merge_file(
--  desktop,
-   type: 'desktop',
-   input: desktop_in,
-   output: desktop,
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_42.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
rename to meta-gnome/recipes-gnome/gnome-photos/gnome-photos_42.0.bb
index 52f5154ac9..5af3088e3a 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_42.0.bb
@@ -30,8 +30,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " file://0001-meson-remove-incorrect-args-for-i18n.merge_file.patch"
-SRC_URI[archive.sha256sum] = "e02d73e138af8b2868b5cad7faa1bdd278aeade3b6c3c92836511a4e6f3af1af"
+SRC_URI[archive.sha256sum] = "25cb281425199dec7b045f13f32f8f96034cb0cb8b94d96f9dffaf4f5be68551"
 
 do_install:append() {
     # make gnome-photos available on all desktops
-- 
2.25.1


