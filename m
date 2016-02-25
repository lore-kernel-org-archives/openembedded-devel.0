Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6562A77346
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 18:26:42 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id a4so39819985wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MXhd+Lqd8eNKNm/x2TaLhIpcMH89Q/mnD9xZg/v5MDQ=;
	b=cre8kIS5NaUPKdbtgLxNaGbTTxMMz+AHc7wxCWWvnTypizK5ORo+L06iTWeahCByXy
	wMccBjx1lVZXVxYx1diCVvGBmRH+Ez4PTSfqffqA84bgLwWnusKzV4aSio27PPIv8ff6
	g37blnAt2EqFU/sMq074ylq/LyYPy+A2/jLOtNh28piF+3ol+WuNSn2DaEiNrClwTf+K
	Ut4qod86mhpfM58pDCY9Q1I4aEA2iTjwQou81v3gaLns9076rILP7JFMQhIPe952ZDKW
	A9ECwUu7aJhdeMscSVzbr2kw9jUl4rMqdT3UHktFPaHPH0HqPBUkheA/EujIZ/dUre80
	jnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MXhd+Lqd8eNKNm/x2TaLhIpcMH89Q/mnD9xZg/v5MDQ=;
	b=Gr93DlqS1JVIOkkQP+dZHJDLjo8afy7jUq9vXfs5P7e3eIXV6PCn5uwPNtFrAloJ3O
	0rTd/rFkz2ut2xJxfBhIAsEJib6RqrhOaVtbsA+GgXlLKQb8c5zqh/RQQ3JtwnZLOwg8
	ONqAkUkVroBPVshGVPfVYNvdsZJQNH+3gFlxwgu5kmTjqTXD7zS5x8XzFQOU5aMws4Q7
	RfGGp2uT0TzsXoY/1v7OYvA6hiM0pQQjFOZzfQqGvHtSHaowFDIl1mA9+lHQ/CUysDuE
	/bFpL/NPT3Igt605QfANX1eMODALZcWLKfR7TV1y4GFrDLKOKKEw/WDNnkWYQlEXeE8d
	pQVg==
X-Gm-Message-State: AG10YOTS/t8fAAino1pY98tLnCtdpWiwbRLPu3UIwysxTXcJ6PilmoVM/dj90G8UfSkwAg==
X-Received: by 10.28.68.139 with SMTP id r133mr76057wma.13.1456424803459;
	Thu, 25 Feb 2016 10:26:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 8sm4356548wmk.13.2016.02.25.10.26.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 10:26:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 19:27:55 +0100
Message-Id: <1456424875-23063-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <CANTDXNfUWt7py3t4_BToqpdj52+JoCZLjLrGz5-gttUJa3--Kg@mail.gmail.com>
References: <CANTDXNfUWt7py3t4_BToqpdj52+JoCZLjLrGz5-gttUJa3--Kg@mail.gmail.com>
Subject: [PATCH][meta-oe] freerdp: Fix QA warning when no binaries are built
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
X-List-Received-Date: Thu, 25 Feb 2016 18:26:43 -0000

* without x11 or wayland enabled from DISTRO_FEATURES there is nothing in
  /usr/bin and this empty directory causes QA error

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index c749b0c..4c81b57 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -60,8 +60,12 @@ PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 # we will need winpr-makecert to generate TLS certificates
 do_install_append () {
     install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
-    rm -rf ${D}/${libdir}/cmake
-    rm -rf ${D}/${libdir}/freerdp
+    rm -rf ${D}${libdir}/cmake
+    rm -rf ${D}${libdir}/freerdp
+    # without x11, wayland, directfb enabled this directory will be empty
+    # causing QA error: ERROR: freerdp-1.2.5+gitrAUTOINC+62da9d28c6-r0 do_package: QA Issue: freerdp: Files/directories were installed but not shipped in any package:
+    #   /usr/bin
+    rmdir ${D}${bindir} --ignore-fail-on-non-empty
 }
 
 python populate_packages_prepend () {
-- 
2.7.1


