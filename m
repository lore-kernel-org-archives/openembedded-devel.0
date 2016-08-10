Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 45AFC771CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 17:59:03 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q11so1950259qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 10:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fqwkmfwBVHZ63t4IcYd/lGYIu6uJ67Ilo60KTp6IEcM=;
	b=En++aeAUPUsgeYZgVI49J5X8jK1oK0TDl9WsD+31bmBpaMWDGbgGA+EmtsKadbgsCb
	RISpaWQP9RT4tkztMA30KpskKHFkWE196ozmsWmcj1eMCC6S2HBkyOABnQ7eQcANW/8j
	8Z5UxEomGV7gHhKmzfCDUEtKNMmp7ZGHwxQCeDvGvvOO+6aFZ/N91SkkUTXhx/p9iYf3
	fx1ZVycazT68TTPlW1ssWl9SLQTFk52YrOXBHbJw7TjWDa/Tk9VKc66B/plMTbxIkkPh
	2JEQrFisUKcJWYKDFJA45vwVOWVrd0P95Mpx21FZM7nKQZCwGwpwHWAUjIFoAtHto1rq
	b77Q==
X-Gm-Message-State: AEkoouuTigx/VihSOzNevkMrO9HfqpAaR3OqiK3pQvKxdwxSQDosRaWDmOqDMXVCFE+vfQ==
X-Received: by 10.237.39.34 with SMTP id n31mr6039612qtd.55.1470851943986;
	Wed, 10 Aug 2016 10:59:03 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	j62sm23912493qtd.37.2016.08.10.10.59.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Aug 2016 10:59:03 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 13:58:54 -0400
Message-Id: <1470851934-20960-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470851934-20960-1-git-send-email-derek@asterius.io>
References: <1470851934-20960-1-git-send-email-derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] hiawatha: update to version 10.3
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
X-List-Received-Date: Wed, 10 Aug 2016 17:59:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../hiawatha/{hiawatha_9.2.bb => hiawatha_10.3.bb}          | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_9.2.bb => hiawatha_10.3.bb} (84%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.3.bb
similarity index 84%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_10.3.bb
index 7062174..7b6ab26 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.3.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[md5sum] = "a77f044634884c4cc5d21dab44e822a3"
-SRC_URI[sha256sum] = "5d9cdec51c618bb3efab747030e593d9bd49dfaf3236254c8e0cb60715716dbf"
+SRC_URI[md5sum] = "31567dfc18d435bd419be279f7970019"
+SRC_URI[sha256sum] = "99d185fb16bb1ab706724494d3cac86464f1485ed4b0fff09a192eca6da5ff8e"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
@@ -33,10 +33,7 @@ EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                   -DCMAKE_INSTALL_SBINDIR=${sbindir} \
                   -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
                   -DCMAKE_INSTALL_LIBDIR=${libdir} \
-                  -DLOG_DIR=/var/log/hiawatha \
-                  -DPID_DIR=/var/run \
-                  -DWEBROOT_DIR=/var/www/hiawatha \
-                  -DWORK_DIR=/var/lib/hiawatha "
+                  -DCMAKE_INSTALL_FULL_LOCALSTATEDIR=${localstatedir}"
 
 do_install_append() {
     # Copy over init script and sed in the correct sbin path
@@ -53,7 +50,7 @@ do_install_append() {
         install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
     fi
 
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}" "${D}${localstatedir}/run"
 }
 
 CONFFILES_${PN} = " \
@@ -63,3 +60,5 @@ CONFFILES_${PN} = " \
     ${sysconfdir}/hiawatha/mimetype.conf \
     ${sysconfdir}/hiawatha/php-fcgi.conf \
 "
+
+FILES_${PN}-dev = "${libdir}/hiawatha/*${SOLIBSDEV}"
-- 
1.9.1


