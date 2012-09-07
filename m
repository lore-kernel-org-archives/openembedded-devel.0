Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9uut-0006BO-BM
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 11:31:59 +0200
Received: by bkcik5 with SMTP id ik5so1437097bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2012 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2epAHappd2at/iApZhqFRVZby/pYLjolhBzIokyk2Fg=;
	b=oF8nqIDUywtj7FkMIZUGss6ArPRlda7H/J9HLknv6FQXG+hv5d+k0dQxMetwoJ9/Vm
	dgB6xQSrG7N4TIFf/d92ubLSuHc7XBGrzStUh8o7F/VElcJl4+87YQlyI6tFcPAygARI
	n5h682oiMcHQ7U0wb1D+VwD6ZlAniTA2gABrk/fWizDU2cyMvAeeTkEzAlGNLz1Sye+p
	jF6iL1vv+5gqRWgyBPLCn5dIkO6WwHrZe3AiYpcaasEqLAe321Hg1LywAczllk/Fw3ML
	rzoELFWV8OQ5zqUmtMCXjlW+O3kuddDYQZ4GUf/hazeUiCMTLp3V0wTa889aZl5L/FPZ
	uNxg==
Received: by 10.205.129.17 with SMTP id hg17mr2291927bkc.88.1347009574067;
	Fri, 07 Sep 2012 02:19:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j9sm2876080bkv.0.2012.09.07.02.19.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 02:19:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2012 11:20:02 +0200
Message-Id: <1347009602-10055-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH] libjpeg: use nasm-native also for target DEPENDS, it's needed for targets with SIMD support
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
X-List-Received-Date: Fri, 07 Sep 2012 09:31:59 -0000

* configure checks that the same as in native case
| configure:13139: checking if we have SIMD optimisations for cpu type
| configure:13143: result: yes (x86_64)
| configure:13151: checking for nasm
| configure:13181: result: no
| configure:13151: checking for nasmw
| configure:13181: result: no
| configure:13151: checking for yasm
| configure:13181: result: no
| configure:13189: error: no nasm (Netwide Assembler) found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index dd81606..2aefe1f 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -29,6 +29,6 @@ FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
 INSANE_SKIP_libturbojpeg = "dev-so"
 
 BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "nasm-native"
+DEPENDS = "nasm-native"
 
 LEAD_SONAME = "libjpeg.so.8"
-- 
1.7.12



