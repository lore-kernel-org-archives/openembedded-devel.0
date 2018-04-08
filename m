Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 46C967553B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:58 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id bj1-v6so3199182plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dKa6v20vFAb/FKSgL4VIZH8WytI7bId3rmK3D4cqOJs=;
	b=QVQCoIDJbFESSUpJM0Nrxo2S5pfGFEnyJLLtVHgCfLIyy7ztszOTf3PmcCQu9WsuLj
	Uutl1hJlpqWYxBtz86HLg07iYlaLj9tlmT4O+dtArN63UyeKDfXCpUvDzk+kSsj7DjFk
	zr7EnJeOMudfALaiQu2xXsPxzhNeBXvg6jFjR5urNd6yWrzCLlruI2ScsObtd5UlgbNj
	A83dtQDMYUbWA8chWgiD0MkTgK/32WBYAogZhutYE6J/UeEc7HlFSgj+fY+I720HHTrU
	1Vk7d6WJNoHEbdKePpa56ItTg4mmHJzNUvj5z6IRS2iQpL30rz1FJg/VuCbkqOonb1G+
	shmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dKa6v20vFAb/FKSgL4VIZH8WytI7bId3rmK3D4cqOJs=;
	b=CoIZfR09cvZEQdP5Ql7vXWam3RQIfqLJdDOIR7stJAC0c3xdWeiWugtr9MBZIYhcvZ
	/rPtiqDc5VgRE0PBKIkj1c4SG9TpLgoSqI5npbfKh/ctHdjaNj+ajgeNwC717QRBznnz
	1CRt1AJABr82SS1TzQxvTmFvJ8Zxcz7rx+IDIpIbj7tL9au9Lk6eNd1EOFPG2XbjNLIE
	de4w2eZBW3BcgS6flFlFlmmq0nep3tTR9INWYSaQHZmXQuh9iw4hcHH2fwW2Z1f9HyxN
	55LMCdSfrgmOmvggaPbSmjTakBQbsoWPYiP2vokmxiGC9vKWd2Z2Be8EqlhQLp8iHNHh
	sPvg==
X-Gm-Message-State: ALQs6tCBYqdBOD4jC20WG5dKlZwrH+gQ85nMV++9YpmbXBPd7riHr5uo
	Sb9rQxwC1NxvzcN27Aa+t7zRNw==
X-Google-Smtp-Source: AIpwx4+9bd9w8fO6JXrGV/IpRnGz2wGwZ9Se6/D57rDF0UP29NSsYXmMqDLLBrGriSN76C58Ud4DlA==
X-Received: by 2002:a17:902:5a4:: with SMTP id
	f33-v6mr20807670plf.278.1523170740348; 
	Sat, 07 Apr 2018 23:59:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:20 -0700
Message-Id: <1523170729-26321-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 08/37] obexd: refreah patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:58:59 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
patching file plugins/mas.c
Hunk #1 succeeded at 30 with fuzz 2 (offset 1 line).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../obex/obexd/ssize_t_definition.patch            | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch b/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
index 2009dcd..570cb9e 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
+++ b/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
@@ -1,4 +1,7 @@
-include unistd.h to get ssize_t definitions
+From fb5056fea9559b3ec3bb61967a112b6c793b700d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Jan 2013 21:33:34 -0800
+Subject: [PATCH] include unistd.h to get ssize_t definitions
 
 Fixes errors like
 
@@ -18,15 +21,20 @@ Fixes errors like
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: obexd-0.44/plugins/mas.c
-===================================================================
---- obexd-0.44.orig/plugins/mas.c	2012-01-11 14:53:53.000000000 -0800
-+++ obexd-0.44/plugins/mas.c	2013-01-08 12:51:12.681882174 -0800
-@@ -29,6 +29,7 @@
+
+---
+ plugins/mas.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plugins/mas.c b/plugins/mas.c
+index 1b18059..b519507 100644
+--- a/plugins/mas.c
++++ b/plugins/mas.c
+@@ -30,6 +30,7 @@
  #include <glib.h>
  #include <fcntl.h>
  #include <inttypes.h>
 +#include <unistd.h>
  
- #include "obexd.h"
- #include "plugin.h"
+ #include <gobex/gobex.h>
+ #include <gobex/gobex-apparam.h>
-- 
2.7.4


