Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlor-0007Fd-1I
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:36:37 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317697fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5dxsU7Z6Wbvpl6NgEth2hetXSHF3Vy6JxTafnH+kcAQ=;
	b=vggIVn3sLanZJDytsHRigb+bwm/RnwPYIGFVIDzSMqRFehPO1v/zfIC4pWYp4z/vrq
	KnneFbKnsiHRe0j2YpZUS6VzOOzzqSUYaznSwpQZYVGARkzQzt7UknVuRNwD5W02Ofv7
	qY3zaN/R1dSVVrjWw9iB9dTzSaLP8WDzXY0j0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lalhjfyRShwPN+FWs+jhOcwNRigLUsI2a2QVWx6LMXpLUqz+30RBRqqpIEm/6BPPRh
	WkPYxw+yGvPak0J0yT1q2thbScI3QjrCxfqyZGmOk2q44qIHWGGDUMdKzJIgG6mMw9fy
	fsGuumUB9nt5/3ofzlY/eEu6tnrOeZWcYv198=
Received: by 10.223.85.196 with SMTP id p4mr2746053fal.5.1303122852908;
	Mon, 18 Apr 2011 03:34:12 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t2sm1623757faa.23.2011.04.18.03.34.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:34:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:34:11 +0200
Message-Id: <876a9efdf8e0a66e8c67f467638ae42aae30387a.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/13] libiconv: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 18 Apr 2011 10:36:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/libiconv/libiconv_1.13.1.bb    |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
index bdfb898..4db70cb 100644
--- a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -1,5 +1,10 @@
 require libiconv.inc
+# GPLv3 for iconv program and documentation, LGPLv2 for libiconv and libcharset _libraries_ and their header files
+# would be nice to split to separate PACKAGES
 LICENSE = "GPLv3 LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+
 BBCLASSEXTEND = "native nativesdk"
 
 PROVIDES = "virtual/libiconv"
-- 
1.7.5.rc1



