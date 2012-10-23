Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQgoX-0006MJ-N0
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 17:54:45 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so3153629wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=G6LAalselpVZj067wuuwMxPchw+zPNLM2UV1D8CE2yo=;
	b=poOtlP78VUAIqN9pRSYMRWzZxAog+SWMvEzfMSpERXBWtGqFQcN4Od37ldUiyTG0Lx
	gZ3LbEXX5I5gGDLlTMFaMPq+uj3kOQZy9/UpV0NQy6zmSo1UH4PzDlPkvek+pQb3qtPY
	w1bk6/meLQPVc2XhaXaxu6s7w458Ta9HdeijatcGkQ96f52Ar4TVOoiFzwhv/eN4FQi2
	io8uLKfA7NYJA9ijrFOUdTjfC8JJ1aTrOGVvNRcdY5m/J9+6Iqu7KdVoPhRitxlYqxCK
	hrr5yb7vsNDr3D8nONhvllK4+lV+V7ewXWvA9MRjl4JA/H2HGpFnbUios7OL96fKTl4s
	DNuQ==
Received: by 10.216.193.158 with SMTP id k30mr8031270wen.89.1351006879451;
	Tue, 23 Oct 2012 08:41:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm28524012wiy.5.2012.10.23.08.41.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 08:41:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 17:41:33 +0200
Message-Id: <1351006893-21274-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <20121023140323.GP3269@jama.jama.net>
References: <20121023140323.GP3269@jama.jama.net>
Subject: [meta-oe,meta-systemd][PATCH] systemd: disable python
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
X-List-Received-Date: Tue, 23 Oct 2012 15:54:45 -0000

* otherwise configure uses python-config from host and passes wrong CFLAGS
  see http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-October/042058.html
  for details

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index efc2d95..6deda82 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r8"
+PR = "r9"
 
 inherit useradd pkgconfig autotools perlnative
 
@@ -67,6 +67,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
+                 --without-python \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
-- 
1.7.12.4



