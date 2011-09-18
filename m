Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYO-0003rN-Jf
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:56 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HZs0+P1Wh5OENSSlyPcw566QXO/hQ5VwGo0q9CyTn2c=;
	b=nwm/sv0xa8Js8y+MPQet6JGHME+M/gGj9VYbkvW8pVZdhdiBGnV9ldnq30dnmmVsYg
	WCaM6G8OFBJ7nFZVSQX5ZyIX/f1pB+n/4xaPh3X5BHc2iYfc5cATwhVTj+YNYe9HaLy+
	61zscWkLMfL0KxHBNG0nmE8C696gcTnq08/5w=
Received: by 10.223.62.8 with SMTP id v8mr3008730fah.43.1316345023728;
	Sun, 18 Sep 2011 04:23:43 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:43 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:11 +0400
Message-Id: <1316344999-26642-10-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 09/17] opie: drop MOC and UIC overrides on command line
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:56 -0000

We do already provide our OE values for MOC and UIC via
qmake.bbclass/linux-oe-g++ qmake config. Don't override MOC/UIC on
command line.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/libopie/libopie2.inc   |    2 +-
 recipes-opie/libqpe/libqpe-opie.inc |    2 +-
 recipes-opie/libqtaux/libqtaux2.inc |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-opie/libopie/libopie2.inc b/recipes-opie/libopie/libopie2.inc
index 67cae32..f64742d 100644
--- a/recipes-opie/libopie/libopie2.inc
+++ b/recipes-opie/libopie/libopie2.inc
@@ -59,7 +59,7 @@ do_compile() {
 		ln -sf ../../../opiepim/private/$header ${S}/include/opie2/private
 	done
 
-	oe_runmake MOC=${STAGING_BINDIR_NATIVE}/moc UIC=${STAGING_BINDIR_NATIVE}/uic DESTDIR=${S}
+	oe_runmake DESTDIR=${S}
 }
 
 do_install() {
diff --git a/recipes-opie/libqpe/libqpe-opie.inc b/recipes-opie/libqpe/libqpe-opie.inc
index 7ddc40c..34854b3 100644
--- a/recipes-opie/libqpe/libqpe-opie.inc
+++ b/recipes-opie/libqpe/libqpe-opie.inc
@@ -45,7 +45,7 @@ do_compile() {
                 install -m 0644 $i ${STAGING_INCDIR}/qtopia/private/`basename $i`
         done
         rm -f ${STAGING_INCDIR}/qtopia/*_p.h # remove private stuff out of qtopia
-        oe_runmake MOC=${STAGING_BINDIR_NATIVE}/moc UIC=${STAGING_BINDIR_NATIVE}/uic
+        oe_runmake
 }
 
 do_install() {
diff --git a/recipes-opie/libqtaux/libqtaux2.inc b/recipes-opie/libqtaux/libqtaux2.inc
index 2955ab8..81a8f4b 100644
--- a/recipes-opie/libqtaux/libqtaux2.inc
+++ b/recipes-opie/libqtaux/libqtaux2.inc
@@ -12,7 +12,7 @@ S = "${WORKDIR}/libqtaux"
 inherit opie
 
 do_compile() {
-        oe_runmake MOC=${STAGING_BINDIR_NATIVE}/moc UIC=${STAGING_BINDIR_NATIVE}/uic DESTDIR=${S}
+        oe_runmake DESTDIR=${S}
 }
 
 do_install() {
-- 
1.7.2.5



