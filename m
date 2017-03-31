Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C43AD77DCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:38:13 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w43so19841898wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HSTggRacDyVTNc8hjyDyKxkC3wtMVfA9eVmPTGIo5gM=;
	b=boHQjHDZVHf7SnYfgBQTSG8DqGr0nfQ9XQ8aJNDr5Uk720YVDpDP/kF4wymN9tDgL6
	vtWCD7IAvPhw8ckILFzauamJGWEjaaVJ4TsuG/yAPzWiFv6VvmmmYl6zMgi+1aRssa2b
	pvFugw+khGdaOzQnlJLxYIeYTNveZErHzjhNKkWcixE8XRi6c/7T3XfmKMTI5FZrGmE6
	Xd6LIgXS0oZz4UjP+haVQ+0T54LTz/IA04ePERjw5Wr9xawBTq1sVHGxc1nbKeLRGU2N
	BxvwiUblUV1OSYQvI9dlrTTj+/LHlgFYP2BBVqPYXTv8NhT7l82791bsBz8GE1UWQnAb
	hQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HSTggRacDyVTNc8hjyDyKxkC3wtMVfA9eVmPTGIo5gM=;
	b=FRVfYFwY5PF9u268KWCzp+gUzTS1mB7NfayFGrP4tHgfS4IA/sDWY7UgvePI9Sy8EA
	FBVyxf4Gq372n1z75D9XJ4WP6WCxDpBj3slBm85xPCj0dmjO3syqm/XKXX+WrYHi1GiL
	kMx65ml6z/KGlouyzZIDNkJ2nspJQL8lQJpd1r3FJc81r8SziSeH8hH0mD89jFRo7dto
	+ubGlO0WgQ5m7pyXutW5FTbPBazhsF4sgT+QoKkgWdw0Aj7KweM4cnlVzoDFSELK0JFm
	6c0PZrjwZpGLJxqBkHTgr/rbQjAgpwEbNLdUkx1IJHar/GH2EJOMeE2qb1XWoz5eevC8
	UK/A==
X-Gm-Message-State: AFeK/H1TU4I2UWv9Wqaw7n0zq1uY0niIEYrE6lnsd6cKCR5WHaDgtgt8c/ubpoWVgcgZGQ==
X-Received: by 10.28.1.209 with SMTP id 200mr2880109wmb.74.1490960294929;
	Fri, 31 Mar 2017 04:38:14 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l132sm2581055wmd.10.2017.03.31.04.38.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 04:38:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 13:38:02 +0200
Message-Id: <20170331113803.31535-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331113803.31535-1-Martin.Jansa@gmail.com>
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][morty 6/7] mailcap: use pagure.org instead of retired fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 11:38:14 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
index 7d87a5f1d..58b8f029e 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
@@ -12,12 +12,14 @@ by several applications e.g. to determine MIME types for filenames."
 
 SECTION = "System Environment/Base"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-46.tar.gz"
-SRC_URI[md5sum] = "eee03824bf86480dc1db20be4f78237f"
-SRC_URI[sha256sum] = "309059163fa3ef368f8a43fc38f7a45d9345fd725970d5b437ba175a0ee7ebc9"
 LICENSE = "PD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
-S = "${WORKDIR}/${BPN}-r2-1-46"
+
+SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "d865a1baf574ae5d309f5c1f79315800"
+SRC_URI[sha256sum] = "c68eb3b531d731476d5980c9b7cc287bd64c2a13bec5a537009a2c4af63f9bb0"
+
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
 }
-- 
2.12.2


