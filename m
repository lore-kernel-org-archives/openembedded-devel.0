Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXh-0007YZ-0C
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:20:53 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=Uuc9GzSrEXoYzTx2Y4fzeQPRSUK2GypeHd3o8bHk7iE=;
	b=pszFB3RndhZduBwhx/eeg8qLdmhvqg06Z5IX8rUmHHD+EEapEPgQ4zs54kGHRhyh4s
	2l8KRhWwTgmwho4gEZgWxT33e60S0r2f1Biba3FmUcf6pVerHvLARIFPPBiiLOEEe3xt
	bpazeMYuz3mBsBn2cwwzAhg2pNJnxbC6MuwYQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wfiKOsBVuOwSfXT+7u41kINd/EN5xXxXv69mT/5kvlDGmpBlOggzRb98TZOV91xKdE
	cvbDqyQBksgr5XjsaDxwujgXOkMiuynHZHo4b4jRrVwSHP4/j5dN1HwZCOMZsVJIlYk4
	dN3VRexh2JbiC46dLjAyfQeYR0PaOFjvtxm1E=
Received: by 10.223.17.68 with SMTP id r4mr100905faa.62.1306696667962;
	Sun, 29 May 2011 12:17:47 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n7sm497743fam.19.2011.05.29.12.17.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:17:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:15 +0200
Message-Id: <7b45d7328db0411ae61bd6db0fd2fabfc5dd2247.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/16] evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:20:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/evtest/evtest_1.25.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/evtest/evtest_1.25.bb

diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/recipes-support/evtest/evtest_1.25.bb
new file mode 100644
index 0000000..fdc023f
--- /dev/null
+++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Simple tool for input event debugging."
+HOMEPAGE = "http://people.freedesktop.org/~whot/evtest/"
+AUTHOR = "Vojtech Pavlik <vojtech@suse.cz>"
+SECTION = "console/utils"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "libxml2"
+
+SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2;name=archive"
+SRC_URI[archive.md5sum] = "770d6af03affe976bdbe3ad1a922c973"
+SRC_URI[archive.sha256sum] = "3d34123c68014dae6f7c19144ef79ea2915fa7a2f89ea35ca375a9cf9e191473"
+
+inherit autotools
-- 
1.7.5.rc3



