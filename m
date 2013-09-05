Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBFF6162A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 05:33:43 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so1425990pab.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 22:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=js+dtw0siimRiwbnXm1LueOOtDMJ5ydDVJWbLVmEQNQ=;
	b=evCSn2oUrmvH83cK5blj8mKIfn0bks5wk4RJvbY/TbkECZ1WIHNb1MkpZsLwPX6f8k
	qS42nejfPg0DV8aIldhCT2Nb58P+84LwTJ08w1UHo8puV9tJIMj451JJ3OhCRfZHTCf0
	WBpJxBCy8r2thZ+Wh+4jmmbDttejnuuR/IWH4c1kNwxOSW7pDbUw1jOvws4MxNGoCDRt
	4i3SX7anZdg+wn3L/akzXq+4svQwHK/KuLHoIHEyagdE/zBGHK/Jv+IF2CEFb2Fh3x2l
	PtXJsKiBmLSxO8ACBFb77a15gYlzgXwPs+nzvR4YPmNKDLXht/GNTblAO35FjC2R0yOJ
	2QJg==
X-Received: by 10.66.230.138 with SMTP id sy10mr7382627pac.103.1378359225180; 
	Wed, 04 Sep 2013 22:33:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	qp10sm35240349pab.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 22:33:44 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 15:30:16 +1000
Message-Id: <1378359016-5186-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] nostromo: specify configuration for systemd-tmpfiles --update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 05:33:43 -0000

Running systemd-tmpfiles --update without specifying a configuration
file results in all tmpfiles.d configuration files being processed.

/usr/lib/tmpfiles.d/systemd.conf creates /run/nologin on boot to
prevent non-root users from logging in while the system is booting.
If systemd-tmpfiles --update is run after the system has started,
it will still create /run/nologin which would prevent non-root users
from logging in with the message "System is booting up.".

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
index 3aaa5c2..fe860ec 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -61,7 +61,7 @@ CONFFILES_${PN} += "/var/nostromo/conf/mimes ${sysconfdir}/nhttpd.conf"
 pkg_postinst_${PN} () {
     if [ -z "$D" ]; then
         if [ -e /sys/fs/cgroup/systemd ]; then
-            systemd-tmpfiles --create
+            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nostromo.conf
         elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
             ${sysconfdir}/init.d/populate-volatile.sh update
         fi
-- 
1.8.4


