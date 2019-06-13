Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6087E7E6E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 16:29:31 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id x4so18817606wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 09:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ryQ+53ahS/zq8G3FUQ/DitDG0OcbabBmxKdiB79xECE=;
	b=huEG21nP51AgxkOwWpB49yVj/+lvG/ThQTXTv8Mif7p1hi619pYN2HcnJ2qMXsIepS
	bCJLWZvsCqNtTj1gKY/M3lKl94NgdEwCYCeMUHvpXaTmO0phrTzpvAShwpmnFqznhQvH
	qTJ+tIJoW5hX0kcYQEsl5oydoweuTBSof1Gj5GZJqLSMKnMZkpVBrH/vWuF4wOAQHSzL
	jxUYQImrJtYxxQrjPnb0Th4NetH0n/5O29tjU/Ithdh1CaU/6oiogKUcdSIZKoZAM8tP
	zohPY8v0mb0dF6OYdFLIBle8zbD2swmLxqV3yIHYqSwdH04QI51P3Kez/03RS+G2I1qV
	SPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ryQ+53ahS/zq8G3FUQ/DitDG0OcbabBmxKdiB79xECE=;
	b=CxUO9gYG4ErKte2SdXlLcpwrC1nIG4vc11h2Ad8+D33947HD9hYSv0Hyx+NydzO3pO
	Rh9EN7zSX95DTApEq0/j4kpoYqlBDfH6c8wQsAWJs1kW8bn1jkYzBt30C2mLxzikiiNz
	xzeQiFs3HmMJ+VDoOskaHTd4AtC/8mgi2CAEDDJkaq+CIJSjZ58TlgkR+n1UX6XSTip2
	klTfEALqzSIExPMO//yG7WxJmIem5TSzYaVfgJl/MH3sQzY1maaxKyLOe886vDFdtI+q
	c7EVzMngsKTaBUvnx2Z68feDO8YGC+4HIsKdQrgArxXfpLRmhxnIBdhUbTcpQq7czNAj
	CJNA==
X-Gm-Message-State: APjAAAW09piDKnOx7PJI67kRegvg4La4fhplh/WRQCRwrdHiMakycmnE
	/CBd7f+Ys5kw2Xss9PTaCQ2px2xU
X-Google-Smtp-Source: APXvYqynxSpzgXXUwuVnAbXTiYMvdgWBLOFxSTppblINnaqvBbUsVrZuPFktOGn1x7Ntza11bNpWHA==
X-Received: by 2002:adf:a18a:: with SMTP id u10mr38076661wru.351.1560443371783;
	Thu, 13 Jun 2019 09:29:31 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id t63sm493363wmt.6.2019.06.13.09.29.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Jun 2019 09:29:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2019 16:29:34 +0000
Message-Id: <20190613162934.1394-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d053ceef-cf1b-01da-5805-e02d5effecc1@windriver.com>
References: <d053ceef-cf1b-01da-5805-e02d5effecc1@windriver.com>
Subject: [meta-networking][PATCHv2] spice: fix compile errors on 32bit system
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
X-List-Received-Date: Thu, 13 Jun 2019 16:29:31 -0000

From: "Hongzhi.Song" <hongzhi.song@windriver.com>

There are folowing compile errors on Linux 32bit system:

red-channel.c:207:73: error: format '%x' expects argument of type
'unsigned int', but argument 7 has type 'long unsigned int' [-Werror=format=]
|207| red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
                                ~~~~~~~~~~~~~~~~~~~~~^
                        self->priv->thread_id);
                ~~~~~~~~~~~~~~~~~~~~~^

On 32bit system, #define G_GSIZE_MODIFIER "". But the type of
'self->priv->thread_id' is 'unsigned long int' which should match '%lx'
not '%x'.

So we should recovery the <0x%" G_GSIZE_MODIFIER "x"> to <0x%lx">.
And others files modification are similar to G_GSIZE_MODIFIER.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

v2: fixed Upstream-Status

---
 ...compile-errors-on-Linux-32bit-system.patch | 96 +++++++++++++++++++
 .../recipes-support/spice/spice_git.bb        |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch

diff --git a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch b/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
new file mode 100644
index 0000000000..d04bee95fa
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
@@ -0,0 +1,96 @@
+From a2af005b5d4a62839e56f42a43df793356e78f58 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 4 Jun 2019 03:58:17 -0400
+Subject: [PATCH] Fix compile errors on Linux 32bit system
+
+There are folowing compile errors on Linux 32bit system:
+
+red-channel.c:207:73: error: format '%x' expects argument of type
+'unsigned int', but argument 7 has type 'long unsigned int' [-Werror=format=]
+|207| red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
+                                ~~~~~~~~~~~~~~~~~~~~~^
+                        self->priv->thread_id);
+                ~~~~~~~~~~~~~~~~~~~~~^
+
+On 32bit system, #define G_GSIZE_MODIFIER "". But the type of
+'self->priv->thread_id' is 'unsigned long int' which should match '%lx'
+not '%x'.
+
+So we should recovery the <0x%" G_GSIZE_MODIFIER "x"> to <0x%lx">.
+And others files modification are similar to G_GSIZE_MODIFIER.
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+Upstream-Status: Submitted [https://lists.freedesktop.org/archives/spice-devel/2019-June/049285.html]
+
+ server/red-channel.c    | 6 +++---
+ server/red-client.c     | 8 ++++----
+ server/red-replay-qxl.c | 2 +-
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/server/red-channel.c b/server/red-channel.c
+index f81142d..6a03ec2 100644
+--- a/server/red-channel.c
++++ b/server/red-channel.c
+@@ -202,7 +202,7 @@ red_channel_constructed(GObject *object)
+ {
+     RedChannel *self = RED_CHANNEL(object);
+ 
+-    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", (unsigned long)self->priv->thread_id);
++    red_channel_debug(self, "thread_id 0x%lx", (unsigned long)self->priv->thread_id);
+ 
+     RedChannelClass *klass = RED_CHANNEL_GET_CLASS(self);
+ 
+@@ -473,8 +473,8 @@ void red_channel_remove_client(RedChannel *channel, RedChannelClient *rcc)
+ 
+     if (!pthread_equal(pthread_self(), channel->priv->thread_id)) {
+         red_channel_warning(channel,
+-                            "channel->thread_id (0x%" G_GSIZE_MODIFIER "x) != "
+-                            "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
++                            "channel->thread_id (0x%lx) != "
++                            "pthread_self (0x%lx)."
+                             "If one of the threads is != io-thread && != vcpu-thread, "
+                             "this might be a BUG",
+                             (unsigned long)channel->priv->thread_id,
+diff --git a/server/red-client.c b/server/red-client.c
+index 2b859cb..ff4da2a 100644
+--- a/server/red-client.c
++++ b/server/red-client.c
+@@ -174,8 +174,8 @@ void red_client_migrate(RedClient *client)
+     RedChannel *channel;
+ 
+     if (!pthread_equal(pthread_self(), client->thread_id)) {
+-        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) != "
+-                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
++        spice_warning("client->thread_id (0x%lx) != "
++                      "pthread_self (0x%lx)."
+                       "If one of the threads is != io-thread && != vcpu-thread,"
+                       " this might be a BUG",
+                       (unsigned long)client->thread_id, (unsigned long)pthread_self());
+@@ -193,8 +193,8 @@ void red_client_destroy(RedClient *client)
+     RedChannelClient *rcc;
+ 
+     if (!pthread_equal(pthread_self(), client->thread_id)) {
+-        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) != "
+-                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
++        spice_warning("client->thread_id (0x%lx) != "
++                      "pthread_self (0x%lx)."
+                       "If one of the threads is != io-thread && != vcpu-thread,"
+                       " this might be a BUG",
+                       (unsigned long)client->thread_id,
+diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
+index 6d34818..0deb406 100644
+--- a/server/red-replay-qxl.c
++++ b/server/red-replay-qxl.c
+@@ -264,7 +264,7 @@ static replay_t read_binary(SpiceReplay *replay, const char *prefix, size_t *siz
+             exit(1);
+         }
+         if ((ret = inflate(&strm, Z_NO_FLUSH)) != Z_STREAM_END) {
+-            spice_error("inflate error %d (disc: %" G_GSSIZE_FORMAT ")",
++            spice_error("inflate error %d (disc: %li)",
+                         ret, *size - strm.total_out);
+             if (ret == Z_DATA_ERROR) {
+                 /* last operation may be wrong. since we do the recording
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index b0fab0d65f..552f81df0a 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice;name=spice \
     git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
     file://0001-Convert-pthread_t-to-be-numeric.patch \
+    file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


