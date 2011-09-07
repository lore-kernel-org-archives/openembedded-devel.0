Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Ini-0004qz-WB
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:27 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so214309bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JSPrLPlhkhznz6ye5FM70Rh6LR3FnDraNHOZa9BYZhE=;
	b=G6GXL3Fd5prOJqyVZly7eHW30COczOPng3h1oW6CivQCVi/w/fXHkMm1VG89ibkmMK
	e7kLuA74iLfC0QchTUFLcHQwrIsgtMsd6pJSxThmU9Tcnm8qXanncfl+6mX0JdJLCzLm
	YOxkFc1CYF4HyRYXJgJyIL+ZE8mdptw2jIUuc=
Received: by 10.204.138.78 with SMTP id z14mr3693266bkt.232.1315404206800;
	Wed, 07 Sep 2011 07:03:26 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:25 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:02 +0400
Message-Id: <1315404187-18176-8-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 07/12] linux.inc: drop savedefconfig, it is provided by kernel.bbclass
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:27 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index e81d0ca..51231db 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -179,10 +179,3 @@ do_install_append() {
 
 PACKAGES =+ "kernel-headers"
 FILES_kernel-headers = "${exec_prefix}/src/linux*"
-
-do_savedefconfig() {
-       oe_runmake savedefconfig
-}
-
-addtask savedefconfig after do_configure
-
-- 
1.7.2.5



