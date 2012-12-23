Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmsEy-0002rr-9x
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 21:33:57 +0100
Received: by mail-ee0-f53.google.com with SMTP id c50so3355889eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 12:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=xhWjWCsq512SKPBXJ2ODZBzt6Shv2P5EtcJu56z/cYQ=;
	b=KAip1vhyPgGvuN2EDzLqysFkzXQ+k63n9Hifv0idD2xqVghe6V54KGXP+Ilp2e5AXj
	wOM3z93CZ88pX39eCIkvVET+EELRov3uP0umR0drgq8XMQxEe7Hzxs6s/Aj3gF+fd77A
	D23rGLTpifR/klMkfIamkAK1KP8SjD9/mwSqFhqvysW7ONzGww8upqUgl2QpIqwUqQil
	YWQ9b6u+XAqkLcJseMGxvEdWmywyExoLBjxWNub7RDL/zDob4aFi5I2shsvndPB+9Cnf
	CIMUYRlls2wKCuIQBdK7dglL9VTYjObGDlzKvDAlqHYeD9698uMmPPrwiLFTycx7ycqT
	xKjQ==
X-Received: by 10.14.225.4 with SMTP id y4mr49692282eep.6.1356293934746;
	Sun, 23 Dec 2012 12:18:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm36868420eep.1.2012.12.23.12.18.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 12:18:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 21:18:40 +0100
Message-Id: <f0528a3f6ccba54d50e50e85f66a18339706d587.1356293852.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <c0cc8c325b1bc9f0010d37a282a11d3bf74f5d69.1356293852.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
	<c0cc8c325b1bc9f0010d37a282a11d3bf74f5d69.1356293852.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356293852.git.Martin.Jansa@gmail.com>
References: <cover.1356293852.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 32/33] gvfs-gdu-volume-monitor: disable afc to fix build
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
X-List-Received-Date: Sun, 23 Dec 2012 20:33:58 -0000

* sometimes it autodetects libimobiledevice and fails to build:
  | gvfsbackendafc.c: In function '_idevice_event_cb':
  | gvfsbackendafc.c:352:25: error: 'idevice_event_t' has no member named 'uuid'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
index 1939f09..f52e338 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
@@ -4,10 +4,10 @@ BPN = "gvfs"
 
 DEPENDS = "gvfs gnome-disk-utility"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 # we need gdu files only: reduce files to delete in libexecdir
-EXTRA_OECONF += "--disable-gphoto2"
+EXTRA_OECONF += "--disable-gphoto2 --disable-afc"
 
 do_install_append() {
 	rm -rf ${D}${sysconfdir}
-- 
1.8.0.2



