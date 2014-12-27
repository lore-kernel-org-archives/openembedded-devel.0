Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1619C72623
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:17 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id g10so14575373pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OTJ476LWVWIaprdfe981FwsrcwnVqOXMWnVnbqbJPk8=;
	b=DbzgqUhOY42y5Vh5bv1JC5AgDA2QLxnR0I+hsRQgcwP7qSfWg6l1AjtnQPLHze6sVD
	t7QkRhBnME8bTvrj58blNMWUEOuwhaK5f5qZHYjqUa8MJFnYPjrQmUf7DbYFxAKPeQep
	vrdMJwE1aVdFRamQBzKSnzZ0BTlg5ty3vBUBIV6XSzpXVBdy2j4um3HlY1of8pY3Og1z
	Rpb4faaihv89/Ge8ConMK/rgZSRURZHPPwMvEM2AsFdz5mzsXpwbqkjJgc9dWelzPcqS
	YdM4AKj234niKmPk/4lRLumyHMzh6FflX6BBnRW9eNs7hKxqpP9wRiy2aXLV0UfYbdSU
	jmRQ==
X-Received: by 10.70.103.238 with SMTP id fz14mr60959118pdb.79.1419700938783; 
	Sat, 27 Dec 2014 09:22:18 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:50 -0800
Message-Id: <bbb3ee05cb1aedd820f38424c339cda4e43e5977.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 03/27] postfix.inc: Remove references to buildmachine paths in target makedefs.out
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:21 -0000

From: Jackie Huang <jackie.huang@windriver.com>

Fixed the buildpaths QA issue:
ERROR: QA Issue: File
/work/core2-64-wrs-linux/postfix/2.11.1-r0/packages-split/postfix/etc/postfix/makedefs.out
in package contained reference to tmpdir [buildpaths]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index c58787e..63de2a0 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -201,6 +201,11 @@ do_install_append_class-native() {
 	ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
 }
 
+do_install_append_class-target() {
+	# Remove references to buildmachine paths in target makedefs.out
+	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
+}
+
 NATIVE_INSTALL_WORKS = "1"
 
 ALTERNATIVE_${PN} = "sendmail"
-- 
1.9.1


