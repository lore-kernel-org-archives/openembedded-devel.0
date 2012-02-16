Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlu-00063o-Qp
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:34 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479834eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=C8hJaIxi8Wckc7Wwi7VpmbYx/upIfI/GVttYBZlATnc=;
	b=ln5Mf3A4IOBu8iVE2G3JU9sVU76cen9jY+0+OqUjCN4OzIGjHwAw52l8HVNMtGYTZF
	t3eGm5cwPLxdV3TnwKN6Ae4YtFo8v1OJsE73fFdw1yfMJKOXqC7RL0za3c4NjZV0Rwpn
	BymxuvPtZHagUqBhF4jt7EkKOvn84nEaph+k4=
Received: by 10.14.181.193 with SMTP id l41mr356186eem.26.1329357624650;
	Wed, 15 Feb 2012 18:00:24 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:02:59 +0100
Message-Id: <1329357796-27398-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 05/22] automatically install all *.service and *.socket supplied in recipe's SRC_URI
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 0ea03ee..b2cf775 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -78,6 +78,17 @@ python __anonymous() {
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
 	def systemd_generate_package_scripts(pkg):
 		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
-- 
1.7.4.4



