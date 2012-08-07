Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Systi-0004q7-SK
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 01:09:10 +0200
Received: by wgbdr1 with SMTP id dr1so101291wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GmWUGS977zBsoB60SeD/e/59lwD+5UDUybqbuKrjRQQ=;
	b=P7H/iF5i7pu9lZfquJlx0BU8ArhQkvy+PczjtC8tl1DwxUv1Lbx25DsGtLT98enbN2
	4Q3eX92FjWJupU9oaMLz/nlcPqclmVqpiFDzTggRW1TeqRI/b/n33vZ3yk/PUOPeBaMh
	h1ZSZFprJvnBjnXP7PIixdkNaY3REiCKxxU67IV0Ms/fLI5iJ3GP4jIQY3Qgq1CZoYBk
	aD8CElkBKVrCdTkn/qTa/S2zgCFfqdLnH8aWzgj6YQxzTZuhHQsTTmWzmndFlj5LhB4f
	4ejJU+krvjmjQbmrbB0kNGgl5fbc+Z9mnfq9fB7IB/jHnw2NX3ST+dNSTydGXwbrLITP
	t1oQ==
Received: by 10.180.103.4 with SMTP id fs4mr550480wib.16.1344380244551;
	Tue, 07 Aug 2012 15:57:24 -0700 (PDT)
Received: from localhost.localdomain (p5B0A309E.dip.t-dialin.net.
	[91.10.48.158])
	by mx.google.com with ESMTPS id l6sm1882009wiz.4.2012.08.07.15.57.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 15:57:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Aug 2012 01:04:25 +0200
Message-Id: <1344380665-3759-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344380665-3759-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344380665-3759-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd 2/2] gdm: replace 'WantedBy=graphical.target' by 'Alias=display-manager.service'
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
X-List-Received-Date: Tue, 07 Aug 2012 23:09:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found at lxdm. Error message was there
| systemd[1]: Cannot add dependency job for unit display-manager.service ...

Inspired by [1]

[1] https://bbs.archlinux.org/viewtopic.php?pid=1131267

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../meta-gnome/recipes-gnome/gdm/gdm/gdm.service   |    2 +-
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
index 72a56f9..adfc565 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
@@ -8,4 +8,4 @@ ExecStart=/usr/sbin/gdm -nodaemon
 StandardOutput=syslog
 
 [Install]
-WantedBy=graphical.target
+Alias=display-manager.service
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index 7308346..963e3e8 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
-- 
1.7.4.4



