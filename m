Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpkC-0003Mh-Pe
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:16 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=swtnGNoJYmqELdFfOg+V6dPh2wDAzLDmlxMyEy5SW+I=;
	b=IorPdvx+tDFRKOZ0gU0y+rqqcOM5fZqkqVgKXOUS62qTpTyQgs7WAU5fSXy4qnKGc0
	iHKOaBRFRMGb5bYa839L1/SA2p0Iny3yuKJqdJhUv6Z7Rn9JdlMvGlbe0pbWHXDkFDYl
	rcyYCAFhAHN8o7GyHAN+Zy0/AjzvSulcaWN6dJA9oUUT+hlLbN1CLoq12/oV6eR/AShe
	ijHSZy8+1zHR6aC/Ma5zK8PHdEeMD/UnhV05jd4ZaJKfFhHu1PffV2U48rzlCHtiuPWC
	8EbolwkBHaB8Q3t675m/gb5W/3JQssJFX3v5SkUnbJHA/9RqeKCk6m4ht5rn6mk8yT7/
	0K0w==
Received: by 10.216.243.10 with SMTP id j10mr1627645wer.211.1344606449396;
	Fri, 10 Aug 2012 06:47:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm11637808wib.8.2012.08.10.06.47.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:22 +0200
Message-Id: <4e6ade68e4d9651e0e5e1758734cffd9898e4c61.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 27/46] emotion: add eio dependency
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:16 -0000

* fixes:  emotion_smart.c:10:18: fatal error: Eio.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/emotion_svn.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index eb28d9a..bf75d9e 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -5,6 +5,8 @@ PV = "1.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+DEPENDS += "eio"
+
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
-- 
1.7.8.6



