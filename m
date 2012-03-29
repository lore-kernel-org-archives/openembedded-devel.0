Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD90S-0008Tf-Od
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 08:38:48 +0200
Received: by eaae1 with SMTP id e1so611907eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=SCITAAH1mLONkCBlyij91QeMinQL7uEJhr7MgWG9hiA=;
	b=xisc6d3U/JkKAwGr6AAEPaGDbKyAXdNK8Yn1lxxXfPFTiSJNLbcovyaCJNOGmQ2nbc
	qqG4fNsi7HMzRkstR6x+9O1ZiABP3/+k9R9CXYxtQowKMR+Y/AndZa1OdyzX9VtTwB7h
	BfPQVH/y3oYfbdEtOmIhu9X9axzXrOzRK1ezrgODR14SsIsiHb0UgHK5jnpO16zWDn78
	uXAo+XrkxU/UegbTET/QGUodQ/VKR8yj15wQox+V+S8bYvHAOO0D83U9tkGuwCZFUjKh
	ObAAjpq8qDP5KAlDTVPfdIZkr/1jmErO56T728lU8M/D9TRC3FoqxhIhxrlWDtp2Cl/o
	QyOw==
Received: by 10.180.97.41 with SMTP id dx9mr2466182wib.9.1333002586009;
	Wed, 28 Mar 2012 23:29:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm27505241wiz.1.2012.03.28.23.29.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:29:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:29:39 +0200
Message-Id: <a778a584bcb8f57690598ebcc401a5181eb56e19.1333002292.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1333002292.git.Martin.Jansa@gmail.com>
References: <cover.1333002292.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE
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
X-List-Received-Date: Thu, 29 Mar 2012 06:38:48 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Without this we don't take advantage of any configured multiple CPU
cores which seems a shame.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 578a02f..1ef8e2a 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -96,7 +96,7 @@ kernel_do_compile() {
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+		oe_runmake ${PARALLEL_MAKE} modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	else
 		bbnote "no modules to compile"
 	fi
-- 
1.7.8.5



