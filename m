Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nmacgum@gmail.com>) id 1RLHb7-0003TF-O9
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 17:54:02 +0100
Received: by ggnj1 with SMTP id j1so6976193ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=jYagGCx00XX8+NN7HnBwe2SSPmVsNWODCjZMhJQ0vco=;
	b=n4BHoS0dlXBEmNbbpCWjFlP5XdA9OE5ReUUwWaHCGB3KDGafbrOArh6ByoFdvugJJd
	qyh2dnTFiHp1ZP8/V7BZP/C6NMKxt/zFOcyyp3pZH49bHlzQXISLz2NNDzxSMxM/ym+w
	macYM42DpbFXqmzxzjiAOZzorC+HREDMa3l9Q=
Received: by 10.42.135.66 with SMTP id o2mr367738ict.0.1320166072855;
	Tue, 01 Nov 2011 09:47:52 -0700 (PDT)
Received: from localhost.localdomain ([74.3.164.55])
	by mx.google.com with ESMTPS id ge16sm31587188ibb.2.2011.11.01.09.47.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 09:47:52 -0700 (PDT)
From: nmacgum@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:46:57 -0700
Message-Id: <1320166017-12836-1-git-send-email-nmacgum@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Neil MacMunn <neil@gumstix.com>
Subject: [PATCH] guilt-native: changed SRC_URI
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
X-List-Received-Date: Tue, 01 Nov 2011 16:54:02 -0000

From: Neil MacMunn <neil@gumstix.com>

* the old kernel.org URI is no longer reachable

Signed-off-by: Neil MacMunn <neil@gumstix.com>
---
 meta/recipes-devtools/guilt/guilt-native_0.33.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 54b1b90..325118a 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -8,7 +8,7 @@ PR = r1
 
 inherit native
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/people/jsipek/guilt/guilt-${PV}.tar.gz\
+SRC_URI = "http://ftp.sunet.se/pub/Linux/kernels/people/jsipek/guilt/guilt-${PV}.tar.gz\
            file://guilt-push.patch \
 	   file://guilt-pop.patch \
 	   file://guilt.patch \
-- 
1.7.1



