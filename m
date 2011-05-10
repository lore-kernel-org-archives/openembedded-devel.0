Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlLj-0005rZ-IX
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:43:36 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FSj2m1/ER3ms4/rYwEbHBNvCGyy2MULHXIsLfypbmqQ=;
	b=AstompBHTBypBqQ8+awNN78/M9NIQ2r0NTtsZrFg8aFrvbLV/xdt9BxuQ2Bb+fKb8N
	nXz1nKiY0DYEcrWIUif4EEVKuXkSr2zv2U6FBNG52OTvYT4svL6pGZQaeRaGAoGcM3Z3
	nXt2gW4BhokZnl+m5e7pBlSNXdfdLKd4k+FQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pDXzQtlvUtZpABqNRfYBmsdMYeAyWvh8T+Pwhq7/x4g44h52Iql/5oIsjfhFF86ohb
	xWJEFg7nrV7GZ9jjZAGjPb5Me5iV88UAFfekxetXJT32kl46No53ebkRWtmv6SHJCVww
	2VM2TD0fwsv0JwqtUF4rY2WV5m2hsPuIXVFJk=
Received: by 10.223.101.72 with SMTP id b8mr257178fao.15.1305027652060;
	Tue, 10 May 2011 04:40:52 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm443854fak.3.2011.05.10.04.40.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:40:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:40:45 +0200
Message-Id: <3873fa2cb11e3f49ba643115862f1c0c8039b433.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/9] gdbus-binding-tool: bump SRCREV
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
X-List-Received-Date: Tue, 10 May 2011 11:43:36 -0000

* old version was failing to build after upgrading glib-2.0
* needs new python-argparse and libffi
* be aware that command line params changed as well as generated code,
  and this recipe will be deprecated as soon as we switch to glib-2.29.3
  or newer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gdbus-binding-tool/gdbus-binding-tool_git.bb   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool_git.bb b/meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool_git.bb
index 286434d..715a7a9 100644
--- a/meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool_git.bb
+++ b/meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "gdbus-binding-tool is used to generate C code for interacting with remote objects using D-Bus."
-DEPENDS = "glib-2.0 gdbus-binding-tool-native"
-DEPENDS_virtclass-native = "glib-2.0-native"
+DEPENDS = "glib-2.0 libffi python-argparse gdbus-binding-tool-native"
+DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-argparse-native"
 RDEPENDS_${PN} = "glib-2.0-utils"
 # taken from glib where this is supposed to be moved later
 LICENSE = "LGPLv2+ & BSD & public domain"
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "git://anongit.freedesktop.org/~david/${BPN};protocol=git;branch=master \
            file://COPYING"
-SRCREV = "229fd9adbb6bd9d824b38a3bd092229016540f41"
+SRCREV = "286f4eaf48ea79821be5a4e6bf493566b156faa4"
 PV = "0.1+gitr${SRCPV}"
 S = "${WORKDIR}/git"
 
-- 
1.7.5.rc3



