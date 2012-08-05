Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeU-0002TC-Kv
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:25:02 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1123970wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=o0xRntYxgQl4cTjJ5+6h8U4rPFh8xKwmXVjNJMqOU1E=;
	b=HahacEDF9nYqondnI6rvGgPg1VIaMjVQM36qvqVPkesl3xVTnRQ4Bb70vsCBPEBs9K
	sCLby/d+cHV7dsdquk1IHRaDYTTCeDsDofUpn/XlwU2wAeUU7B+p0UxNlFqHLhoOH2yg
	Jyl52AptGW5gGnKT2bnPRk4PmxWKNG/dJmfTjnKzPv6+VlGonQ6J1KlgMd68/D2s0k5r
	zkiVNrM0Ev+GDUROf7ZTs9hpDX5mKYw9UoAx7n8HOCcCv5+5NCv0oRInt3XQeXT4qwh7
	WNdzxb7GZ3Xj2en/qf3rATaJqAF0GUfOl1aHopI85K8k9fAhvYo5EUUKYADxuLbnSIhX
	/sYg==
Received: by 10.216.29.10 with SMTP id h10mr3266611wea.126.1344125602127;
	Sat, 04 Aug 2012 17:13:22 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:58 +0200
Message-Id: <1344126001-19256-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 13/16] angstrom-task-gnome3: split out task-gnome3-perl
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
X-List-Received-Date: Sun, 05 Aug 2012 00:25:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb |    7 +------
 recipes-angstrom/tasks/task-gnome-perl.bb      |    3 +++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 670b941..14f1998 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -9,12 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
-
-RDEPENDS_task-gnome3-perl = " \
-  perl \
-  libxml-parser-perl \
-"
+PACKAGES += "task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
 
 RDEPENDS_task-gnome3-themes = " \
   angstrom-gnome-icon-theme-enable \
diff --git a/recipes-angstrom/tasks/task-gnome-perl.bb b/recipes-angstrom/tasks/task-gnome-perl.bb
index 8c24f0d..cfc8ec4 100644
--- a/recipes-angstrom/tasks/task-gnome-perl.bb
+++ b/recipes-angstrom/tasks/task-gnome-perl.bb
@@ -6,6 +6,9 @@ PR = "r13"
 
 inherit task
 
+# for backwards compatibility
+RPROVIDES_${PN} += "task-gnome3-perl"
+
 RDEPENDS_${PN} = " \
   perl \
   libxml-parser-perl \
-- 
1.7.4.4



