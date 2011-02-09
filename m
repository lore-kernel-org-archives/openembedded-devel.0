Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier.martin@vista-silicon.com>) id 1Pn6VZ-0001ln-Bh
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:38:45 +0100
Received: by mail-ww0-f43.google.com with SMTP id 17so6659183wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 01:37:44 -0800 (PST)
Received: by 10.227.201.5 with SMTP id ey5mr1626105wbb.182.1297244264494;
	Wed, 09 Feb 2011 01:37:44 -0800 (PST)
Received: from localhost.localdomain (58.50.18.95.dynamic.jazztel.es
	[95.18.50.58])
	by mx.google.com with ESMTPS id u9sm109430wbg.0.2011.02.09.01.37.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Feb 2011 01:37:43 -0800 (PST)
From: Javier Martin <javier.martin@vista-silicon.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Feb 2011 10:37:14 +0100
Message-Id: <1297244237-9508-5-git-send-email-javier.martin@vista-silicon.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
References: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
Subject: [PATCH 4/7] Add custom opkg settings for Visstrim_M10 board.
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
X-List-Received-Date: Wed, 09 Feb 2011 09:38:45 -0000

"/opt" is used in Visstrim_M10 boards as the working directory
for opkg.

Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
---
 recipes/opkg/opkg-collateral/visstrim_m10/dest    |    1 +
 recipes/opkg/opkg-collateral/visstrim_m10/lists   |    2 ++
 recipes/opkg/opkg-collateral/visstrim_m10/tmp_dir |    4 ++++
 recipes/opkg/opkg_svn.bb                          |    2 ++
 4 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 recipes/opkg/opkg-collateral/visstrim_m10/dest
 create mode 100644 recipes/opkg/opkg-collateral/visstrim_m10/lists
 create mode 100644 recipes/opkg/opkg-collateral/visstrim_m10/tmp_dir

diff --git a/recipes/opkg/opkg-collateral/visstrim_m10/dest b/recipes/opkg/opkg-collateral/visstrim_m10/dest
new file mode 100644
index 0000000..c2b9657
--- /dev/null
+++ b/recipes/opkg/opkg-collateral/visstrim_m10/dest
@@ -0,0 +1 @@
+dest root /opt
diff --git a/recipes/opkg/opkg-collateral/visstrim_m10/lists b/recipes/opkg/opkg-collateral/visstrim_m10/lists
new file mode 100644
index 0000000..77c0834
--- /dev/null
+++ b/recipes/opkg/opkg-collateral/visstrim_m10/lists
@@ -0,0 +1,2 @@
+lists_dir ext /opt/var/lib/opkg
+
diff --git a/recipes/opkg/opkg-collateral/visstrim_m10/tmp_dir b/recipes/opkg/opkg-collateral/visstrim_m10/tmp_dir
new file mode 100644
index 0000000..b3f8d53
--- /dev/null
+++ b/recipes/opkg/opkg-collateral/visstrim_m10/tmp_dir
@@ -0,0 +1,4 @@
+# We have whole /tmp in volatile tmpfs which is better than wear leveling NAND or uSD
+# But also bad for big upgrades where tmpfs eats whole memory,
+# device starts swapping (possibly using more NAND/uSD than temporary unpack) and then segfaults because of lack of space
+option tmp_dir /tmp
diff --git a/recipes/opkg/opkg_svn.bb b/recipes/opkg/opkg_svn.bb
index cfdf9fc..7ea1510 100644
--- a/recipes/opkg/opkg_svn.bb
+++ b/recipes/opkg/opkg_svn.bb
@@ -21,3 +21,5 @@ pkg_postrm_${PN} () {
 }
 
 require update-alternatives-merge.inc
+
+EXTRA_OECONF_append_visstrim_m10 = " --with-opkglockfile=/var/lock/opkg.lock"
-- 
1.7.0.4



