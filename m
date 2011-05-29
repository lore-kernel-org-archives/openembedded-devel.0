Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXW-0007YZ-Qc
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:20:42 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=FCjBg8zlvrp+1sJFeXL6verGX4hM1J7hl7A/PbqfZeQ=;
	b=ZhIITF0IqzICj00ZBhGcTxmTQHhFPSytiNw6sROl2iVrSnRAuTSyWTGusvZt9EKcQ5
	lVZri6GX7WPjjbGhnNI/OlOOOf0rvnJDpoqt9a9BjnS03TGLMDHsBhwt3H1EQn2mNspS
	yNiL/hv099YPvUZso3opTqHpdN1yueoLW3mKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OD4Ogrhw1QUnFPPdHTDalHHmuvd87z8HT0GX+AzaesnOwv8IlUGNAmMj1e7URRUPDV
	jQKL/atbo/0zrFHx64ZtIaF6mVdqDgScln4NUTrHKVE5lVVEEMhdrBamDNFn9PIhvP8/
	GYTU5GnGKj+B2muFtcMOlT3+pG6MmajVIZ6ZM=
Received: by 10.223.53.85 with SMTP id l21mr2160940fag.26.1306696657287;
	Sun, 29 May 2011 12:17:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b25sm496743fab.28.2011.05.29.12.17.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:17:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:12 +0200
Message-Id: <e29cc0c79553561b866e2a336fc29f51ed2c698a.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/16] libnice: improve LICENSE and add LIC_FILES_CHKSUM
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
X-List-Received-Date: Sun, 29 May 2011 19:20:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 81f9c98..3cac198 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -2,7 +2,12 @@ DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactice Conn
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"
 SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
 
-LICENSE = "LGPL/MPL"
+LICENSE = "LGPLv2.1 MPLv1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
+                    file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
+"
+
 DEPENDS = "glib-2.0 gstreamer"
 
 inherit autotools
-- 
1.7.5.rc3



