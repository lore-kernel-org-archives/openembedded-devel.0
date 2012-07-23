Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StFEU-0006L0-QN
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 11:47:18 +0200
Received: by bkcik5 with SMTP id ik5so3871767bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 02:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tQsDJgnYrLbR6jh4e72ywjV5RqfwCh+3a0aFHqjnyfo=;
	b=BNdXem6bMjDMoQ4jcQI5kCMFlnQiTBxI/dLbyhhVWLc9gHNREO55w0qUJppmx80sol
	S6K6WHfVnDVyru8i6baYbvUYsHycF4Zh7ao1/fZFGBIAPF+d2yBWz832wCJvmbOvvVsc
	q9Zpggqzqp5cCe7vZfTp9MqE4RKb5Khnk+btCuel9LEE+FkpcwVzZ6JurD5BanMxwCnY
	Agex2fWYvRclUJdQyYW3vmpH3e4dzm01a/cF7Okax+N9dE5BC24KRC9Rg4nj/pxy2mw5
	0RYZBw5TxNeVTO3Rw8ncITq32GoI1e13Kr4fq+KKPds3cxflQexYlK+49tZE4fYa5mlm
	5ARg==
Received: by 10.204.157.6 with SMTP id z6mr7253137bkw.25.1343036152220;
	Mon, 23 Jul 2012 02:35:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm6637769bkv.8.2012.07.23.02.35.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 02:35:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2012 11:35:47 +0200
Message-Id: <1343036147-19312-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342857860.git.Martin.Jansa@gmail.com>
References: <cover.1342857860.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][PATCH 4/4] systemd: add glib-2.0 to DEPENDS
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
X-List-Received-Date: Mon, 23 Jul 2012 09:47:18 -0000

* | No package 'glib-2.0' found
  | No package 'gobject-2.0' found
  | configure:16371: error: Package requirements (glib-2.0 >= 2.22.0 gobject-2.0 >= 2.22.0) were not met:
  |
  | No package 'glib-2.0' found
  | No package 'gobject-2.0' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 3868438..39b883a 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r3"
+PR = "r4"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-- 
1.7.8.6



