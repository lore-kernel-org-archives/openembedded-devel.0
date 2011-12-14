Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTg-0004Ay-T0
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:49 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so267559yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ID9SwFHVR6eOijAMyTbyL75xtCv2OYyviGRRaSRtFCM=;
	b=orNzyMfBjQXHGciUS96SI92zm3El3HJxck2OyX4KU2YMGhAe7nKOG/aiDspcmZoQCZ
	h6NSNBEY0I1SQynWwxbWFqUB82og8+sUC/MbvG6MOW1MFgS6KmKyGJXSrYcWrbYBd83B
	UvjqY36vWtC7yFCRN7dDYSUU08GFKe4qxn8ko=
Received: by 10.236.93.4 with SMTP id k4mr7626788yhf.114.1323825053271;
	Tue, 13 Dec 2011 17:10:53 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.10.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:10:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:30 +0000
Message-Id: <6c4db013ff7c44d723127a065c52a3b62db84dfa.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/8] id3lib_3.8.3.bb: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:49 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 2c5e2ae..f743755 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -3,7 +3,6 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "files://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "zlib"
-PRIORITY = "optional"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
            http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.2.diff.gz;name=patch \
-- 
1.7.2.5



