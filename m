Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4C27075438
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 07:54:54 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id z9-v6so7426642plk.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 00:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iGUjNU31XQ6JMDA/0/Iih3GZV9VKMYuTBhwCqoOlzQU=;
	b=pxr8beWr0aQDjd91svoi0KfIlBW1P/EPenUFl0y/JsPk0hHMoJ88vJiKIfgseS1Whj
	PPJc/miHZrsafHgS7YUEVFJm/wz/xIGWfALL6FCl3ARTPpVPYKIdRtaUjdXXebZQqPz6
	yk6bPmjDqTg+kNwrRxF+p4xbY0bwp957TAqxmZkIiNHN+Z39IHE9wwwercxVv7WXLuMx
	z5JOZxH3mSrUVwxJerqTQ6MxckA6RDA2N+VcZCu76WI2WIns5J1T8Vaw8PrMfWCoQ4F5
	0fdlUxK7cbQ83cIRR05P5A676FrS3/ctlearHjZZnbjcMImRhP2KRaCVsOQ957++bxhU
	HV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iGUjNU31XQ6JMDA/0/Iih3GZV9VKMYuTBhwCqoOlzQU=;
	b=hEiS5ekB/CYHKDXqfpL1PcLseDxfLmMakbOtflckFftFnMu9XT4ubKKstGR5XPBmTj
	TlSbF5R5Uh4w/eZ7UKh9srrRSNWx0DYBH6u1V4Bb4HU8IJNL3069kbOxXrteCAEFIoaK
	EHFJ+oHkanvGS4uG+3A6Dbtoux/7x2KghlItc++p2HrO5OOnn7hT4BCV5vHo/XPVUlnJ
	KEb5QI/gQt8YQWEPGc519z/PmCCZLPXO0qDeGjjEKi85jIENWSuhDayjbgwwegU2AZeA
	P6G/sMxn03xfZEaPxUuUSOyrx9jIf4Nk/vqXS5rIQYUfq4lV7KszlF2Qb0o9/KV98EG0
	EubQ==
X-Gm-Message-State: APt69E2x3vY5unCjcZrQdGFYnRx6xduZyMMko3Urrc+zvEyu7PSUnQWy
	DZg184fLYq5GhFVCMkO/hic38w==
X-Google-Smtp-Source: ADUXVKK+9/z0O7MgT6AVHRAngKTO21uZUMmWrfSClw8Ug0XAbQpAfoSXfdPjJhAxyIlNYI7HV3zZGg==
X-Received: by 2002:a17:902:2006:: with SMTP id
	n6-v6mr9154884pla.125.1529222094889; 
	Sun, 17 Jun 2018 00:54:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	p3-v6sm14538587pga.72.2018.06.17.00.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Jun 2018 00:54:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jun 2018 00:54:54 -0700
Message-Id: <20180617075454.17209-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180617075454.17209-1-raj.khem@gmail.com>
References: <20180617075454.17209-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] spice: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jun 2018 07:54:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Convert-pthread_t-to-be-numeric.patch | 66 +++++++++++++++++++
 .../recipes-support/spice/spice_git.bb        |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch

diff --git a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch b/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
new file mode 100644
index 0000000000..505b7c890b
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
@@ -0,0 +1,66 @@
+From 0726ce6d6f52e135e28f15ca8392568c84909b1d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Jun 2018 16:21:39 -0700
+Subject: [PATCH] Convert pthread_t to be numeric
+
+typecast pthread_t to unsigned long
+pthread_t is implemented as a struct point in musl and its as per standard
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ server/red-channel.c | 5 +++--
+ server/red-client.c  | 6 +++---
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/server/red-channel.c b/server/red-channel.c
+index 1b38f04d..11dc667b 100644
+--- a/server/red-channel.c
++++ b/server/red-channel.c
+@@ -192,7 +192,7 @@ red_channel_constructed(GObject *object)
+ {
+     RedChannel *self = RED_CHANNEL(object);
+ 
+-    red_channel_debug(self, "thread_id 0x%lx", self->priv->thread_id);
++    red_channel_debug(self, "thread_id 0x%lx", (unsigned long)self->priv->thread_id);
+ 
+     RedChannelClass *klass = RED_CHANNEL_GET_CLASS(self);
+ 
+@@ -475,7 +475,8 @@ void red_channel_remove_client(RedChannel *channel, RedChannelClient *rcc)
+         red_channel_warning(channel, "channel->thread_id (0x%lx) != pthread_self (0x%lx)."
+                             "If one of the threads is != io-thread && != vcpu-thread, "
+                             "this might be a BUG",
+-                            channel->priv->thread_id, pthread_self());
++                            (unsigned long)channel->priv->thread_id,
++                            (unsigned long)pthread_self());
+     }
+     spice_return_if_fail(channel);
+     link = g_list_find(channel->priv->clients, rcc);
+diff --git a/server/red-client.c b/server/red-client.c
+index ddfc5400..76986640 100644
+--- a/server/red-client.c
++++ b/server/red-client.c
+@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *client)
+         spice_warning("client->thread_id (0x%lx) != pthread_self (0x%lx)."
+                       "If one of the threads is != io-thread && != vcpu-thread,"
+                       " this might be a BUG",
+-                      client->thread_id, pthread_self());
++                      (unsigned long)client->thread_id, (unsigned long)pthread_self());
+     }
+     FOREACH_CHANNEL_CLIENT(client, rcc) {
+         if (red_channel_client_is_connected(rcc)) {
+@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *client)
+         spice_warning("client->thread_id (0x%lx) != pthread_self (0x%lx)."
+                       "If one of the threads is != io-thread && != vcpu-thread,"
+                       " this might be a BUG",
+-                      client->thread_id,
+-                      pthread_self());
++                      (unsigned long)client->thread_id,
++                      (unsigned long)pthread_self());
+     }
+     red_client_set_disconnecting(client);
+     FOREACH_CHANNEL_CLIENT(client, rcc) {
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 508bb36996..bf4b083461 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -23,6 +23,7 @@ SRCREV_FORMAT = "spice_spice-common"
 SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice;name=spice \
     git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
+    file://0001-Convert-pthread_t-to-be-numeric.patch \
 "
 FOO = "\
     file://0001-build-allow-separated-src-and-build-dirs.patch \
-- 
2.17.1


