Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.6967.1623116106261690073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 18:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HAK4JVPH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623116103; i=@fujitsu.com;
	bh=wid1VDgci5CfLWEWlAO9jd5oCsIdBMrgDSvwebu3FPA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HAK4JVPH0PPmotv1eAbK3KrOFGdGNycU4y2JnoGlyyEpdWpZ464tvuxkMroiDDRFj
	 gUH22PMTnB/Oyi/3/k9OuGX7OVUFh8he/ndg9zrP3JehSnoYAFX9tCL2lkzBsGKrwe
	 OhFPBSdm797ub8pMo5H4ReHJyVYg9Fh4QH3onlGmMpyjzVVWXygP2M9dXBibzv96Bf
	 yafmU9EQomula2RyONKyKhEiamozkigzKfpQ9m27xUHUBmJAh11iPwA2wmDG6ViXk+
	 W6yuO8cbp5Dc0OGShvIqhU8kssjwsB4KwSyIpsMsP7T+zTv3R0S+93FisDbdnTJW4D
	 uECKJpsvEO72Q==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id AA/9E-14259-749CEB06; Tue, 08 Jun 2021 01:35:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0XU/uS/
  B4O8/HouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP2w8NMBS2iFXveLWBvYJwp3MXIxSEkMItJ
  4uGqw4wQznFGibb2F0AOJwebgI5Ex4tuFhBbREBfYunsPcwgtrBAqMTt7sNsIDaLgIrErIZ/Q
  DYHB6+Au8Sa534gYQkBBYkpD9+DlfMKCEqcnPkEbAyzgITEwRcvmCFqFCW27zzDAmFXSMyYsY
  1tAiPPLCQts5C0LGBkWsVokVSUmZ5RkpuYmaNraGCga2horGsGZOklVukm6aWW6ian5pUUJQI
  l9RLLi/WKK3OTc1L08lJLNjECwyilkI1rB+PT1x/0DjFKcjApifKuztiXIMSXlJ9SmZFYnBFf
  VJqTWnyIUYaDQ0mC9+BxoJxgUWp6akVaZg4wpGHSEhw8SiK8WieA0rzFBYm5xZnpEKlTjIpS4
  ryZIH0CIImM0jy4NlgcXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsRZApPZl4J3PRXQI
  uZgBY7GoMtLklESEk1MDXJny2YnisWapB5fonwx5BF+QtmnL3ec1JEKGuWmFdFScb91TmS8im
  u8yxupu9Pigr5f2FLyaZm942znrO7CzJF367o3O9z/VHKZr/z0z5/jNyn7zrp0KKjTrfEcqeY
  13m61u/2W8w+X/lCz1VtIZYTE2PX9dTWW/7u72oP4uL+6zu1fmnKqWqFp8zJ61Lfxqz78uaK0
  dZHsxZKqW86xnj2rmjFwhKVeX5KL1O5775l6zk3ScSgY9eMG3Uy96e8637s9yFqdeBcrYUJEg
  YT1I07kqdGb+Wdkr9CzS/JeXm9IWsT75d8ffbaeyvnn7v3xZ3zdoiekHnxd3lRzYmPNkiJZ3x
  cPX+x1yZ/b5FJPUosxRmJhlrMRcWJAPcS4rIeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-245.messagelabs.com!1623116102!349350!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2263 invoked from network); 8 Jun 2021 01:35:03 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Jun 2021 01:35:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1581YqKi027240
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Jun 2021 02:35:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 8 Jun 2021 02:34:51 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] [oe] [meta-gnome] [PATCH] tracker-miners: upgrade 3.0.5 -> 3.1.1
Date: Tue, 8 Jun 2021 09:34:43 +0800
Message-ID: <1623116083-37390-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...meson.build-Just-warn-if-we-build-without-libseccomp.patch | 4 ++--
 .../{tracker-miners_3.0.5.bb => tracker-miners_3.1.1.bb}      | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.0.5.bb => tracker-miners_3.1.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
index c9eb7994e..53c5f2664 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
@@ -23,8 +23,8 @@ diff --git a/meson.build b/meson.build
 index 71a9df4..1eaa1a0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -279,7 +279,7 @@ cpu_supports_seccomp = not unsupported_cpus.contains(host_cpu)
- seccomp_required = system_supports_seccomp and cpu_supports_seccomp
+@@ 299,7 +299,7 @@ cpu_supports_seccomp = not unsupported_cpus.contains(host_cpu)
+ seccomp_required = system_supports_seccomp and cpu_supports_seccomp and get_option('seccomp') and get_option('extract')
  
  if not libseccomp.found() and seccomp_required
 -  error('Libseccomp is mandatory for sandboxed metadata extraction')
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
index 6672195e0..1b3ff00bd 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
@@ -15,7 +15,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
-SRC_URI[archive.sha256sum] = "c9be14871b1398e6e656a354a8f8f59e69e93169017f2b28308ef439324fd12b"
+SRC_URI[archive.sha256sum] = "e4d361351b156f2862a524415fbebf0539c781cd87c6629662f0265b4803b8b8"
 SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
 
 # gobject-introspection is mandatory and cannot be configured
@@ -34,6 +34,7 @@ PACKAGECONFIG ??= " \
     png \
     tiff \
     xml \
+    libseccomp \
 "
 
 PACKAGECONFIG[battery]     = "-Dbattery_detection=upower,-Dbattery_detection=none,upower"
-- 
2.25.1

