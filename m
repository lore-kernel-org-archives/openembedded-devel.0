Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhr-0005n6-Cz
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705864eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ACZTYSYJpZMRCG+qKHEp9fUFJBEryuUwbDhmLztIrnU=;
	b=sU6QtB5fffaTvpuL5ryiReUNUrIqnqgblsYCC0+nHy7+A0D+6SxpQdqGb5ygH8bPfZ
	P4a+F7C7EZX29uWPQCBDh1bOUKPQYVIGrkBI9fwrvLZ7yh0s3TGYtOhQkNUVtvsWieoS
	Zy9FK+jcgSjn0LTwe2uV+3i1VwzS8JKkSFGgqcqGD3Pg4Bge8k3aUPWXVFQ52L00hWie
	UbY8NOJs376MEvbkgpVpTpsCXUJSyoZenAskQU7r/506lKzsBRV1LsXpiEIaPQfgj94d
	H6Egx/VSBTLdxZNlJtw3VuAdgSm13zl+QGA8jBicLoM9yEqEdRUYuyTjg0HEnVZ1Qmbi
	LI/A==
Received: by 10.14.221.9 with SMTP id q9mr34234004eep.3.1355680696421;
	Sun, 16 Dec 2012 09:58:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm23866449eeo.11.2012.12.16.09.58.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:47 +0100
Message-Id: <926554674e2dc6cfb52a9f771ac13264ad7b9aec.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/26] dialog: added gnu-configize for AArch64 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/dialog/dialog.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes-extended/dialog/dialog.inc
index 03b0aa7..27e4e60 100644
--- a/meta-oe/recipes-extended/dialog/dialog.inc
+++ b/meta-oe/recipes-extended/dialog/dialog.inc
@@ -19,6 +19,7 @@ EXTRA_OECONF = "--with-ncurses \
                 --disable-rpath-hack"
 
 do_configure() {
+    gnu-configize --force
     sed -i 's,${cf_ncuconfig_root}6-config,${cf_ncuconfig_root}-config,g' -i configure
     oe_runconf
 }
-- 
1.8.0.2



