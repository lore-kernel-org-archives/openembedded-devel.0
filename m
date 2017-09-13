Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1217868B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 0B69E2607DE
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 17:58:11 +0200
Message-Id: <cover.1505317801.git.fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
Subject: [meta-multimedia][PATCH v3 0/2] Add libupnp1.8 recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 15:58:21 -0000

In order to build gerbera, we need to support libupnp >= 1.8.
However mpd won't build with this version probably due to API break.

So we add a new recipe libupnp1.8 to be able to use both version.
Both version can be run in parallel.

?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-neon/libupnp_1.6.21-r0_armhf.deb 
drwxrwxrwx root/root         0 2017-09-13 17:26 ./
drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/
drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/lib/
-rwxr-xr-x root/root     31600 2017-09-13 17:26 ./usr/lib/libixml.so.2.0.8
-rwxr-xr-x root/root     17912 2017-09-13 17:26 ./usr/lib/libthreadutil.so.6.0.4
-rwxr-xr-x root/root    117676 2017-09-13 17:26 ./usr/lib/libupnp.so.6.3.4
lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libixml.so.2 -> libixml.so.2.0.8
lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libthreadutil.so.6 -> libthreadutil.so.6.0.4
lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libupnp.so.6 -> libupnp.so.6.3.4
?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-neon/libupnp1.8_1.8.2-r0_armhf.deb 
drwxrwxrwx root/root         0 2017-09-13 17:43 ./
drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/
drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/lib/
-rwxr-xr-x root/root     35696 2017-09-13 17:43 ./usr/lib/libixml.so.10.0.1
-rwxr-xr-x root/root    155128 2017-09-13 17:43 ./usr/lib/libupnp.so.10.1.1
lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libixml.so.10 -> libixml.so.10.0.1
lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libupnp.so.10 -> libupnp.so.10.1.1

mpd and gerbera have been built successfully with this fix.

The patch also clean a bit gerbera recipe and fix dependency issue.

Fabien Lahoudere (2):
  libupnp: Add recipe for version 1.8.2
  gerbera: clean recipe

 .../recipes-connectivity/libupnp/libupnp1.8.bb     | 22 ++++++++++++++++++++++
 .../recipes-multimedia/gerbera/gerbera_git.bb      | 12 ++++++------
 2 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb

-- 
2.11.0


