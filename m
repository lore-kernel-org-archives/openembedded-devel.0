Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiep-0004Xb-06
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:11 +0200
Received: by ywf7 with SMTP id 7so3321677ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZGcHhPZVV0wHYvjWv0RMx9G33M9/ruSrnHteJYgykF8=;
	b=FInkgqK0uBH4YFkMxR8SIGT+bw3tWfGzg4kvF52hwaf+7CQiaPtvZY88WR4F0L2NTp
	NutDL18A1lYBKZQRc7KNrgaNSg4zfWteqqAba0OFpAEbRqIsee+0pvQGvso7gsw+1ILn
	YChoDJYpQZCjEBC6AOwYqetJk1c0zTsdsEZo4=
Received: by 10.223.75.24 with SMTP id w24mr23321717faj.132.1317648508954;
	Mon, 03 Oct 2011 06:28:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a7sm21258178fam.22.2011.10.03.06.28.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:28:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:06 +0200
Message-Id: <fd4f2da0d2efbf4adfec06203514dec7b255e44a.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 08/25] glx-use-tls: moved to oe-core with mesa recipes
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/glx-use-tls.bbclass |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/classes/glx-use-tls.bbclass

diff --git a/meta-oe/classes/glx-use-tls.bbclass b/meta-oe/classes/glx-use-tls.bbclass
deleted file mode 100644
index 7530872..0000000
--- a/meta-oe/classes/glx-use-tls.bbclass
+++ /dev/null
@@ -1,7 +0,0 @@
-def get_tls_setting(bb, d):
-    # until we have no prober TLS support in uclibc disable it
-    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
-        return ""
-    return "--enable-glx-tls"
-
-EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
-- 
1.7.7



