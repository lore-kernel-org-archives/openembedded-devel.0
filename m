Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 91B1765D15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:48 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id uo5so4402545pbc.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H7SrPqIJTWMmS0BCB/L76aNm34rIzDhOYBKUWEYOzz8=;
	b=ILReFo7NyFw10zD322gfTVH1F1XWUJpKK5zfrwjvfDug0hBXvGZCV6C8aaW+We22x+
	EiUpmOvxxm4gQM1CVORnC2anAKjpKl4OMcxK2pLTTkK2A/ihvq7+YABOv4vynttFYfyq
	/wg1BuAXBMQ8oT7Dppt31R1S3RgxmWVHfYY/qaEdQfeTXVwz4ainqD66CoSjqBrAdMXw
	JBn9wgkFvCQ8weueGbYZxVbRQzBFcCH4dbQOEAnSfRcWnyiNj93s9gV6j/V4yvdKkXsx
	Flry5iWDWnDgVozMF6f/vP4CxO+FnGph2I00TADyVKxx/Bk5cM7tgzH/Jmky+XI/pddY
	j2CA==
X-Received: by 10.68.250.3 with SMTP id yy3mr19584390pbc.56.1398544369521;
	Sat, 26 Apr 2014 13:32:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:34 -0700
Message-Id: <1398544484-27299-11-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 11/21] gnome-control-center: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-control-center/gnome-control-center_2.32.1.bb              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 05e59cd..5cc7ad1 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] = "7c568b57358e5c08f4d8dd76dbac7df2539135ad081872b605
 LDFLAGS += "-lgthread-2.0 -lxml2"
 
 do_configure_prepend() {
-    sed -i s:help::g Makefile.am
+    sed -i s:help::g ${S}/Makefile.am
 }
 do_install_append() {
     rm -rf ${D}${datadir}/mime
-- 
1.7.10.4


