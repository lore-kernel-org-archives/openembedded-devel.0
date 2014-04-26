Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id B174765D15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:50 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rp16so549063pbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NHj2aZFOxEt0UrFjwPZKs1Lx0HNLIWaT+eV7lq/djZc=;
	b=YrfsEhmAwAtoImLhaGJDKmJqwI1q+znG1dJ8CuPsPB2H51iwaHLrxeCWavUMjGN8rF
	U0dXFzDW+Z69Wu8wbPlyNUQA0nBIZJQNJjoMwX42HGpVhY6l+YLujwMmKSGeCWexjMZy
	91NlYl1wiFy1/IenNpyU03Ln00DsY/oufxAy+PbPLza6gABqvK3Kaga3EIe1phA34vx2
	2ChEAfp6QniOE1IOrpwDJYwoAc2KN1gna0Er+bg+ruIZr8znk9xQxMfzfEo0jdn58LuN
	UTszUCymb/KOMrSBWc28YmAFw3Ns2vymUXznCfl5aiCcynT1SRSfeZ5yi9Qr2EcEbp2o
	0kWA==
X-Received: by 10.66.243.131 with SMTP id wy3mr16210069pac.32.1398544371498;
	Sat, 26 Apr 2014 13:32:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:36 -0700
Message-Id: <1398544484-27299-13-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 13/21] gnumeric: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 3c7d92f..71f99ca 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -31,7 +31,7 @@ FILES_gnumeric-goffice = "${libdir}/goffice/*/plugins/gnumeric/*"
 # This hack works around the problem mentioned here:
 # https://mail.gnome.org/archives/gnumeric-list/2010-February/msg00006.html
 do_install_prepend() {
-    sed -i ${S}/doc/C/Makefile -e 's/\tfor file in $(omffile); do/\t-for file in $(omffile); do/'
+    sed -i ${B}/doc/C/Makefile -e 's/\tfor file in $(omffile); do/\t-for file in $(omffile); do/'
 }
 
 python populate_packages_prepend () {
-- 
1.7.10.4


