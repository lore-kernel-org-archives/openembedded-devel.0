Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web12.5609.1621325038185388480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fOBbcTeZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325035; i=@fujitsu.com;
	bh=bpDr8NosUmPFkdmEbOWxvGRAR2fynG2iS14lbORYR6U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fOBbcTeZytqEJbRyS/PEt4FH3Q6YzJ0fJRLhTNSWFaUSAQhi0sC8fln7myGm5BnoI
	 AeQOQQpf3uBzkB1cecbKWZ5WAx0lzUNezKPJWQZwT91/NALxpC4p1M9wriPzB4qFuS
	 FUTy6MWClYVuVuooVwjXT0RU95ErM/QcEluGKsOfGHzbAYo75mJxbL00lXIgUN0qxJ
	 ubeT35fzpAU/ka7hCO3uE3HEJNM2rIAGx84LrOr8y+R8EAf3XdrqbxFGhowpKC5p6s
	 drPKA7Gr+X+X/PhwVK73wrojF6aUBhQNCsQkcbK03+JWdYaZRGvngsUA7lpaf0DXcW
	 zs/zAzXiLJXfQ==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 1D/79-64908-BE473A06; Tue, 18 May 2021 08:03:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MRqvuqZHG
  Cwc4OZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNp62bGghMSFd27PrE3MO4Q7mLk4hASmM0k
  cergdUYI5wSjxJKnc5i7GDk52ATUJKbfusEKYosI6Essnb0HLM4soCLx4ncPexcjB4ewgK3Er
  4+MIGEWAVWJhjXP2EBsXgEnibt7JzOB2BICChJTHr4Ha+UUcJY4u/sVmC0EVLPi6WoWiHpBiZ
  Mzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcTrw5eYJzDyz0LSMgtJywJGplWMFklFmekZJbmJmTm
  6hgYGuoaGRrqGlua6hsbmeolVukl6qaW65anFJbqGeonlxXrFlbnJOSl6eaklmxiB4ZhScLRz
  B+OvVx/0DjFKcjApifKa3V+UIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN7ZocYKQYFFqempFW
  mYOMDZg0hIcPEoivByFQGne4oLE3OLMdIjUKUZjjnc/Fy9i5tg8d+kiZiGWvPy8VClx3tRioF
  IBkNKM0jy4QbCYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFcdZApPZl4J3L5XQKcwAZ3
  yv3ERyCkliQgpqQamMskVl+IOeXtw+OkWdl969Wfe6xtHOZ8nXwhVTbVJKF/nuufdueenfLJn
  eByyifNuikgoOfD8Y+nBz8v0vxkc33nkwa7yec78Jx/M3/x0q3xUaPR+w8SXeQ5ZqwKjTb6r7
  4lqcjNdeOPG7b9f7+9aF/j94qeMwIsL/cIeWqhLXeR7npD7/+rZ11Er9PIOuvxYFd72be07r4
  U/SjkuTPPfMv3FyfdiZczLRFpv2c9+/Gaf7DLrLaK2u76rSgkLtqTsLHaYkbzbYZ/ynA49fu4
  L8YtZ3l2IP3LcW9nwz4l2oyLXf5zqJyqUFkbXG5Vxa4rkPd+++nZKSt0CkSc8e7jkazllnsbk
  Hn09z9vvjJO0hBJLcUaioRZzUXEiAJMgyrZUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-285.messagelabs.com!1621325033!131437!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25741 invoked from network); 18 May 2021 08:03:54 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-17.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:03:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I83mrj006904
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:03:53 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:03:49 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/7] exiv2: Fix CVE-2021-29458
Date: Tue, 18 May 2021 16:03:29 +0800
Message-ID: <1621325014-16286-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
References: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29458

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1536/commits/06d2db6e5fd2fcca9c060e95fc97f8a5b5d4c22d]
      CVE: CVE-2021-29458

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../exiv2/exiv2/CVE-2021-29458.patch          | 37 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
new file mode 100644
index 000000000..285f6fe4c
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
@@ -0,0 +1,37 @@
+From 9b7a19f957af53304655ed1efe32253a1b11a8d0 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 9 Apr 2021 13:37:48 +0100
+Subject: [PATCH] Fix integer overflow.
+---
+ src/crwimage_int.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index aefaf22..2e3e507 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -559,7 +559,7 @@ namespace Exiv2 {
+     void CiffComponent::setValue(DataBuf buf)
+     {
+         if (isAllocated_) {
+-            delete pData_;
++            delete[] pData_;
+             pData_ = 0;
+             size_ = 0;
+         }
+@@ -1167,7 +1167,11 @@ namespace Exiv2 {
+                                                  pCrwMapping->crwDir_);
+         if (edX != edEnd || edY != edEnd || edO != edEnd) {
+             uint32_t size = 28;
+-            if (cc && cc->size() > size) size = cc->size();
++            if (cc) {
++              if (cc->size() < size)
++                throw Error(kerCorruptedMetadata);
++              size = cc->size();
++            }
+             DataBuf buf(size);
+             std::memset(buf.pData_, 0x0, buf.size_);
+             if (cc) std::memcpy(buf.pData_ + 8, cc->pData() + 8, cc->size() - 8);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index a13db42ed..1dc909eeb 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -10,7 +10,8 @@ SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
 inherit dos2unix
 SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
-            file://CVE-2021-29457.patch"
+            file://CVE-2021-29457.patch \
+            file://CVE-2021-29458.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.25.1

