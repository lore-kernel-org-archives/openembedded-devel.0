Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBRVG-0006ot-BA
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 16:31:50 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so429158eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DCr0r55OVZL3DZEY+rSQWb+iBH6iUcwI5cn8KdhNBOg=;
	b=A21mhyOGFMqpawPPbFB04Y8r+yVBvL9CwZ//KyLihNXUtBOeRa+hP0hl+OqoSNi1SF
	1SyXaUkuS2YUMxhN9YTAsW1+ZwPaaHtd3U5jHrhzoId01DPz7qG1HTZX+qei/nf9tZSx
	aIQl9BDduGcH3nStQ/cqvX4t/CmHBqsxU6lscPWR9+fFtQmigCETr0CnpdcJuumhr442
	XbnDAJ/hRrlSkuxnVB6TmM3wBV0x9D8EltrVORtwx87fIilZgnSGQpPK/xh1UJ54q9nB
	S7UUWLHPB3C38quVvv2n3FrdHJWOqufFsq6UcFsIKN6XbRkJ9Nw8vDCPcO88y4AgjXgP
	3k+A==
Received: by 10.204.4.130 with SMTP id 2mr4769721bkr.37.1347373161682;
	Tue, 11 Sep 2012 07:19:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm9792050bkm.10.2012.09.11.07.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 07:19:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:19:00 +0200
Message-Id: <9295d48aba0f7e5f87f66b895e559cfdbc859519.1347363666.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/5] libwmf: fix DEPENDS_virtclass-native
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
X-List-Received-Date: Tue, 11 Sep 2012 14:31:50 -0000

* libpng and jpeg are not expaned to native variants, causing different
  sstate checksums when libwmf-native is build with MACHINEs with
  e.g. different PACKAGE_ARCH
* maybe it's fault in handling DEPENDS_virtclass-native and it should
  expand it, but this patch fixes it too
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029394.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index fed33a4..cedfd3b 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r1"
+PR = "r2"
 
-DEPENDS_virtclass-native = "libpng jpeg"
+DEPENDS_virtclass-native = "libpng-native jpeg-native"
 DEPENDS = "libpng jpeg expat gtk+"
 
 BBCLASSEXTEND = "native"
-- 
1.7.12



