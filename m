Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id C83676FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 11:28:54 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g62so74292848wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 03:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VN8WxAkxRSYIWB8VG/hh1v6jG6FM1u9cahJOZfhZQZY=;
	b=lTRjJ7YjxojyOqx2Bp2EJ0CjZ9DfuJagVERL5DJhP9JkzBXU84JRlVQy7bwmZFGhJW
	KB/T64byGn+UtlT5dIJV7r/9MGdSLUjTkKUibvXu6or+hBk8YwBzQyWB2m0rPw9c14eM
	ijP7W+5lymtk8xYwdicHttzDlgj5KwPqG8gjL56UZvr/0ZujR5q/xUyn+I0kA/V99MLh
	9CibdGMqAWmX2XsJajBWsCGiHuGy6hfmzzSFnM0s6m2nbiZh9Swr4jrozqEyjyLaZpJ0
	f+84jYFhzytYOmUmQoLwiPlQUZ/FfSb6vgO6nOkmSCRwKrJqo+0NrEhWax14G804hnci
	EaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VN8WxAkxRSYIWB8VG/hh1v6jG6FM1u9cahJOZfhZQZY=;
	b=F2+a+b9CU+K0BpOHuJkG+FKalvzRKBMhCjYI0LJa/oH76dFY2kcf9AGOM0d1DFK3XG
	hNcq73goP3+GNYlyjdeUe3Go5TJTtmuRR/0Ao0uWKeRWDX+/UsaYyXX5BVzzwS4I0K4A
	zEOTwOqdi4+6Lvq5GYrZ3set8d0gyYi+RtDAjN4CSW1M3BE/B6UrgvHLgS3LuOHdRFkp
	QAMAA9JUDOzxafRL7jxZ9UzRNfAI22M2JTOyzVsArAc/RIvVbjkFAjog3qtnk9ez1wXc
	vOaaKKivCdp6yEq8GSH+TpQZ/jmRKF5KKhKWLYz+xyEQpq1ee5x5pwnPNWmQ10E/HRxH
	AyZg==
X-Gm-Message-State: AG10YOT/A02hzKOPs0AGkFcofednfjmgxewncjMHmYi0RvCQa344QWTpMHJS8Q8O/u3UDw==
X-Received: by 10.28.131.134 with SMTP id f128mr7434021wmd.41.1455449334649;
	Sun, 14 Feb 2016 03:28:54 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host180-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.180])
	by smtp.gmail.com with ESMTPSA id
	x186sm10601707wmg.19.2016.02.14.03.28.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Feb 2016 03:28:53 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 12:28:42 +0100
Message-Id: <1455449322-4445-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] klibc: fix sh deps ver (PR is needed after PV)
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
X-List-Received-Date: Sun, 14 Feb 2016 11:28:56 -0000

Revert commit dd1ca18 removing ${PR}. Bad idea.
The shared lib could not be found giving this error:

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
   klibc-utils-XXX:
 * 	libklibc (= 2.0.4) *
 * opkg_install: Cannot install package klibc-utils-XXX.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 33be23c..65ee868 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -48,4 +48,4 @@ KLIBC_ARCH_x86 = "i386"
 KLIBC_ARCH_x86-64 = "x86_64"
 KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
-THIS_LIBKLIBC = "libklibc (= ${PV})"
+THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
-- 
1.9.1


