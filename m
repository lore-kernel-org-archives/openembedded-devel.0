Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 698346FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 22:30:26 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n24so5452816pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=quIWWWujyENcNrHqDLmOLWpisniYegZTFIAML4t9ZCY=;
	b=UxRuDYFVD7Jf9ZCjDDuwg53PUQMCgZ+OrLrhxWbEc2t9COa17LFoTwQY7VVvuCV8Oh
	iEAn7hpDU72bQbQKv2+ohUv7ZcJKOS5aUWFBvm1WszK4lZ2b6tRxI/5Tq3k0ZEx5ib74
	3CNL+Lk6ZIvl9o64sKd+YxEL9ORA1IFGAs2MDh5bOLOCllpRWIbqQuaUcnEpSudnAKnO
	mj95YYVGfecrCdg25RA4zGjfFq8RkT7uyWHFGPc48nT4FESn3szpiP6cecjKUT1tFSfx
	nRCrMrAcqn+kgGLJdX4E1yBccMwRck2ozwifBgIU47kObnNyYoRCGc04ieicMDf8aGo/
	leHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=quIWWWujyENcNrHqDLmOLWpisniYegZTFIAML4t9ZCY=;
	b=epKpHxcc07UENuxDJedKhNqE0rPC+KripV4qp8QWWDz6jGz+aMSzKyfwH7p7YcPJGx
	2lDo778UqSBxE3P63k4L/hSFxs5BCstCEiyIlYXhOhu+9yxQrZX4Rj2Mj6TvmaNjeHix
	k8XRI110XumjWiST6Yo1GEfmKzlF7Q0wn+HkBMf3EdmUg+YRQvjCG4W5Lir8VDZFfWex
	dbfErQZhnIoRqqAHH2zQysnEBR0Q2GVQhKUB8wGb6eMyoRv8u4DTd0IRYKe6WqdVNjxt
	R6VrIMT9pUarJKz47sVM5CWcNNY8dl55RutS3eZPI+YzGs81l3gbBTwjmpLyMx0F1WS6
	Hn4g==
X-Gm-Message-State: AA6/9RmE6QyXdYFtheCjwsQRz99HFIrHA3TllujVj4rfHV/c7eI26PxjeS1S8y/Lvbhj0w==
X-Received: by 10.98.61.198 with SMTP id x67mr3218199pfj.2.1475274627349;
	Fri, 30 Sep 2016 15:30:27 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h82sm30125150pfh.22.2016.09.30.15.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 15:30:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 15:30:12 -0700
Message-Id: <1475274614-10777-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475274614-10777-1-git-send-email-armccurdy@gmail.com>
References: <1475274614-10777-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 1/3] onig: add support for orig-native + misc minor fixes
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
X-List-Received-Date: Fri, 30 Sep 2016 22:30:26 -0000

 - Add support for orig-native
 - Drop unnecessary dependency on libevent
 - Update HOMEPAGE and SRC_URI to webarchive mirrors (originals no longer available)
 - Switch binconfig -> binconfig-disabled

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/onig/onig_5.9.3.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/onig/onig_5.9.3.bb b/meta-oe/recipes-support/onig/onig_5.9.3.bb
index 22db78a..416c2bf 100644
--- a/meta-oe/recipes-support/onig/onig_5.9.3.bb
+++ b/meta-oe/recipes-support/onig/onig_5.9.3.bb
@@ -1,17 +1,19 @@
 DESCRIPTION = "Regular expressions library. The characteristics of this \
 library is that different character encoding for every regular expression \
 object can be specified."
-HOMEPAGE = "http://www.geocities.jp/kosako3/oniguruma/"
+HOMEPAGE = "https://web.archive.org/web/20150807014439/http://www.geocities.jp/kosako3/oniguruma/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4861b5bc0c392a5aa90d9d76ebd86f"
 
-SRC_URI = "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV}.tar.gz \
+SRC_URI = "https://web.archive.org/web/20150807014439/http://www.geocities.jp/kosako3/oniguruma/archive/${BP}.tar.gz \
            file://do-not-use-system-headers.patch \
            file://configure.patch"
 
 SRC_URI[md5sum] = "0d4eda2066d3c92970842a6790ce897a"
 SRC_URI[sha256sum] = "c3bba66b2a84760e6582c40881db97c839d94f327870009724bb8b4d0c051f2a"
 
-DEPENDS = "libevent"
+BINCONFIG = "${bindir}/onig-config"
 
-inherit autotools binconfig
+inherit autotools binconfig-disabled
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


