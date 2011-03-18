Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aGA-0005OF-98
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:02:34 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3154740bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=TF1QOqz6K7Oo7Qql1xi9ikxsviyuUJF/Aj82B7QaSLk=;
	b=uGrIvo3R2bJXTB9HirpClT5GDZA7IWEfPErlYObuMQ9DiLARcuaz7j8JboH+4HG3+f
	EBTHKDhlVpHd8zFAa4ZAns+c5xvLZu0fatx9qmoNu2+v+42CIu5pNDzAHk5CyTx3pwyB
	PVsbaKfZxnr71jnXQe9iKkVv3ZrVmcOpy92OE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rv8m1StHwWTulGGEd9NwuutsPcHg1KR4IkzjA/Xa+pFyuQ5oXH/NXhPYkLqt29uvCe
	cc0bPTnnIqHCyjV8qZrXbp5grbAZB6fKJ41NAami5PpZNF3amt+q8672g7oflB8dOyhL
	ChEy5ThjOh2uUnC/4HqIF8WAcPDYEuMRnudpA=
Received: by 10.204.82.224 with SMTP id c32mr975720bkl.161.1300456851178;
	Fri, 18 Mar 2011 07:00:51 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x6sm2165591bkv.12.2011.03.18.07.00.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:00:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:19 +0100
Message-Id: <1300456829-25755-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 02/12] libnl: don't use /usr/include/libnl2 anymore
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
X-List-Received-Date: Fri, 18 Mar 2011 14:02:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/libnl/libnl_2.0.bb |    4 +---
 recipes/libnl/libnl_git.bb |    2 --
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/recipes/libnl/libnl_2.0.bb b/recipes/libnl/libnl_2.0.bb
index 7e9336e..8b77d07 100644
--- a/recipes/libnl/libnl_2.0.bb
+++ b/recipes/libnl/libnl_2.0.bb
@@ -9,14 +9,12 @@ DEPENDS = "flex-native bison-native"
 
 inherit autotools pkgconfig
 
-includedir = ${prefix}/include/libnl2
-
-S = "${WORKDIR}/libnl-${PV}"
 SRC_URI = "\
   http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
   file://fix-pc-file.patch \
   file://fix-pktloc-dep-race.patch \
 "
+
 SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
 SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"
 
diff --git a/recipes/libnl/libnl_git.bb b/recipes/libnl/libnl_git.bb
index b667815..b3bb749 100644
--- a/recipes/libnl/libnl_git.bb
+++ b/recipes/libnl/libnl_git.bb
@@ -11,8 +11,6 @@ DEPENDS = "flex-native bison-native"
 
 inherit autotools
 
-includedir = ${prefix}/include/libnl2
-
 SRC_URI = "\
   git://git.kernel.org/pub/scm/libs/netlink/libnl.git;protocol=git \
   file://fix-pc-file.patch \
-- 
1.7.4.1



