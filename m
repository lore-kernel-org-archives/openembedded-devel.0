Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJoKD-0007DY-8R
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 16:54:13 +0200
Received: by gxk3 with SMTP id 3so1570090gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=ZKYdQU+parnL/Fq0wVYWbfUzRdIF2s3ZeHRCCtJbGyE=;
	b=XR32AG1IHPStVimyNhBg6ihzXJ3P9hHgCjCivli+utIXHlygljADsGVtZobM2GI1B/
	n0eHpaTpta7aTR1TJQ1iMbM+Jx+XShBwJgALx/CzYsCumWe6uuzYBBVnrAkTwWnIKq1c
	o7sjhqbLlfq7toIOFLPiNcgWNAccTCkSb+SCQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=wj3uyN7Ucpo3lbpOKXQ8zGbxcTwe4h1urnxu95wZn2XzytItZDm4M1QmGTi9Gl3Qww
	qFWia+v3jlLGwr/ucVqfzDtva5SfpOCGoVEvGeazZkJsnYUwSaMdrv3GYQwwzPOsMniN
	Gb1rp6/iUpyPz+ilROIIxZotEbn+OYP584NRw=
Received: by 10.236.19.171 with SMTP id n31mr9449536yhn.436.1305039087110;
	Tue, 10 May 2011 07:51:27 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l73sm3147845yhn.98.2011.05.10.07.51.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:51:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 14:51:05 +0000
Message-Id: <1305039065-1326-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305039065-1326-1-git-send-email-otavio@ossystems.com.br>
References: <1305039065-1326-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 4/4] glib-2.0: depends on python-argparse-native
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
X-List-Received-Date: Tue, 10 May 2011 14:54:13 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb b/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
index f95d162..51b0448 100644
--- a/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
@@ -1,10 +1,11 @@
 require glib.inc
 
 PE = "1"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS += "libffi" 
+DEPENDS += "libffi python-argparse-native"
 
 SRC_URI = "git://git.gnome.org/glib;protocol=git;branch=master \
            file://configure-libtool.patch \
-- 
1.7.2.5



