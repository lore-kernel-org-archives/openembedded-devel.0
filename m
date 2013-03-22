Received: from mail-yh0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJ208-0005D9-Ur
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 14:27:21 +0100
Received: by mail-yh0-f41.google.com with SMTP id 47so80608yhr.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=fHphGs7qqMaoEnrj8MrcxGAQ+LUPDaDKJiZr3gIK6qc=;
	b=a84i+X/Nk+Ys0SMmrUhSVzLN9vKhN9leXQzXJQ6qC260My1ZkNolTYpfLMLGIaXKAG
	vmUrfeA0YQQ/yZxCoFFGMYXWX+MHxAKFf5pVxIKyO/US6GgGMSJZd4Jcq7duUXfly5eY
	hJVrLAo2KtPWLaLIzgOadfOYcRSbsCVpS+Ne74uwfwzkzqJaBTYAzqClNBQexqD+2fq3
	cd0v+kXrJm7cKW8iO3XheMCrJB51zw1TTBN4C13ykdT/eh4qVpQXj7uJxdE3radbrbL8
	FqL2/aa1ZhEKJCaHUTwVuz9h9Ag4VFFZSXyx8eW+VlQPbV6+8AWhmjcqV9mk7HW2qte/
	lbUg==
X-Received: by 10.236.139.132 with SMTP id c4mr870590yhj.184.1363957824959;
	Fri, 22 Mar 2013 06:10:24 -0700 (PDT)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id e55sm2651485yhi.16.2013.03.22.06.10.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 06:10:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2013 10:10:16 -0300
Message-Id: <1363957816-11928-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][for-danny][PATCH] libdvdread: Update to newer GIT server
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
X-List-Received-Date: Fri, 22 Mar 2013 13:27:22 -0000

Daniel has moved to newer GIT server and also imported the Debian
packages on it so the previously used hash is not available. Update
accordingly.

Change-Id: I0b42d76031175b85bd1711ba5ef01f5a2a34dc46
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libdvdread/libdvdread_4.1.3-10.bb              |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
index f17043b..9212a8d 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
@@ -2,9 +2,11 @@ DESCRIPTION = "DVD access multimeda library"
 SECTION = "libs/multimedia"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SRC_URI = "git://git.debian-maintainers.org/git/daniel/${PN}.git;protocol=git;branch=debian"
+SRC_URI = "git://daniel-baumann.ch/git/debian/libdvdread.git;protocol=http;branch=debian"
 
-SRCREV = "e465b500c12be5b4c0b6918a9b98038611f66c57"
+PR = "r1"
+
+SRCREV = "a733b19584000a9c80ef5b8dfb187f8f00e4d1e7"
 S = "${WORKDIR}/git"
 
 inherit autotools lib_package binconfig pkgconfig
-- 
1.7.2.5



