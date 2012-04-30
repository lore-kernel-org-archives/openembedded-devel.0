Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkLt-0005DC-An
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:53 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1806484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8r79eTXV05nXUeE5Qfhynrcj2hFU+iYDS9MIbBJDPrM=;
	b=NzcispRz5qDe/6FCeWhWLgldYOqqhctNayrZrpoYPE/Id1PFjfH8tBqa85gXIAxMQH
	xzprZ280LvGYWWw2VxQBKTjGLvGUjJsf1QG6X+BOJdSQ7qpCtcgnBv2qacfq0HdLi06A
	VA/+Zdd0Qdv/mTyyUl3SKb0CtY7p15+1xAqFDCY8lTPvFjH9Wl6wZlQ+Tt+hP1woZn9X
	uDNHh6i9LflsErlU/Q5w54ZLZm5JNu8b8u7aTgxJPZNqHzLuZZk+q7wsVsFh4qLqtIM5
	7f8gaWqrOk1IcahGQCyFNCAiKvjG6ZPNw9Pq0MYyqUjw7ut8jN74k30kde+6cjidkDkI
	3Q7w==
Received: by 10.180.101.230 with SMTP id fj6mr26380073wib.13.1335767713245;
	Sun, 29 Apr 2012 23:35:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm41922649wiv.11.2012.04.29.23.35.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:35:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:12 +0200
Message-Id: <a243ddc2afff482914c3b75862cb5af7bf8c22a1.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/16] gpsd: add chrpath-native to depends
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:53 -0000

* on debian wheezy I've seen this
$ tmp-eglibc/sysroots/x86_64-linux/usr/bin/chrpath ../../../shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/image/usr/sbin/gpsd
../../../shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/image/usr/sbin/gpsd: RPATH=/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/gpsd-3.4:/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib
$ chrpath ../../../shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/image/usr/sbin/gpsd
`../../../shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.4-r2/image/usr/sbin/gpsd' probably isn't a 64-bit LSB-first ELF file.
Usage: chrpath [-v|-d|-c|-r <path>] <program> [<program> ...]
                               with the path given
   -l|--list                   List the current rpath/runpath (default)
   -h|--help                   Show this usage information.

$ chrpath -v
chrpath version 0.13
$ tmp-eglibc/sysroots/x86_64-linux/usr/bin/chrpath -v
chrpath version 0.14

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 37bd319..8cd806f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1"
+DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
-- 
1.7.8.6



