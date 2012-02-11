Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rw2L7-0002Gc-NR
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 03:05:30 +0100
Received: by eaal10 with SMTP id l10so900148eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 17:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=qDStnjtHabFbXruEYGJqJWkO6FJzUH+dkvPFHLHkK1Y=;
	b=Y7hy8m+FjK2w0roG0EvFZJA02a/8gDLxhKqVcOyh+FyqsXyB7LpCKRPl8lb/vLoc/t
	ZMTEqjv9lQAquB20eOwfOKpQO7qTzsw9BBT1PLRHZa+gkcerA7thVoCVzjY2i6SR+fP3
	Ig3G3/1PYFNziJsxuHZF2iIaFoWZ9baxCcS+0=
Received: by 10.213.108.212 with SMTP id g20mr1379742ebp.122.1328925436977;
	Fri, 10 Feb 2012 17:57:16 -0800 (PST)
Received: from localhost.localdomain (p5B0A16A6.dip.t-dialin.net.
	[91.10.22.166])
	by mx.google.com with ESMTPS id n17sm29065006eei.3.2012.02.10.17.57.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 17:57:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2012 03:00:01 +0100
Message-Id: <1328925603-2967-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 5/7] automatically install all *.service and *.socket supplied in recipe's SRC_URI
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
X-List-Received-Date: Sat, 11 Feb 2012 02:05:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index ffcabe9..3c1ed14 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -74,6 +74,17 @@ python __anonymous() {
     systemd_after_parse(d)
 }
 
+# automatically install all *.service and *.socket supplied in recipe's SRC_URI
+do_install_append() {
+    install -d ${D}${base_libdir}/systemd/system
+    for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
+	# ensure installing systemd-files only (e.g not avahi *.service)
+	if grep -q '\[Unit\]' $service ; then
+	        install -m 644 $service ${D}${base_libdir}/systemd/system
+	fi
+    done
+}
+
 python populate_packages_prepend () {
 	def systemd_prepost_instrm(pkg):
 		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
-- 
1.7.4.4



