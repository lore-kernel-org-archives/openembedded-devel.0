Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A1F097F9B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:53:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n7so9802341wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NIZx4btocztfXU9+KUxhWWBwzyFpD2A3UIFgZ+/bbTs=;
	b=cD6sggVBaKMefN83gKjAOMNCm8ppsehYj0owExbFg4n91PQsewTCXeLcLlhB+NbDmj
	rznBEdLMuxjjWPp0SX5eAEhC2i/RfGV53+5nqZ3HXsFhDItur3XROct04ZhNaLQcoxng
	z5GyiHh6yX678/U9SSKrf9aKcV6DnXUN0eIQmE+Ezp4QXla87yrCX15n5bwkqD8Slz5Y
	nYgfY8FosD7UtijikNxZG7of3oQw05FlUlYRS7K+N/uyToRfamu821Lk18xcfx0hdMe8
	flF0gXDkWiZ6Q55nMsj5Wcr3SsGs+ydv5eDeXdm6yALqpyqua30ZdaCwhcTjWtjNmCFb
	DeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NIZx4btocztfXU9+KUxhWWBwzyFpD2A3UIFgZ+/bbTs=;
	b=YOzrduDfZ7jrJDCTP/pAtoWctJpyVywZzhyVVsjn1jAJbk7tYQBC1dPZ6H3WkZOq1j
	0DdAgKqbJCcOjeEn7RDKvHDku3mpqAuPc7ceL22sPYxV5gyk+9PtQKbTgFDBjkV4je0L
	hjH2LCoCP2IJjDQZmmjnnNkzCVX1xZJa9Mm96XBUtZHZaLWO6hVtCbubUg1iywCwY18u
	ayDxZMdhImHOOENMkLP2iabg/JWxMuQLyybj3sCz1JFvxHZZ7i9NjJofEMakPvl+4Yyl
	KWNHN0pi8dV7MO1YzZ9GuWpfDR0G4GR7jbj1/7pQAxEUOf+GcoV5avnafkKRA6ZVGaqp
	PoDA==
X-Gm-Message-State: APjAAAWFg4Q91Q6dBIowsoZQo2e/90uKpFjqi5Yr6q4Z3r4xHZyAmpRy
	iBKNnBwUPlcDuUJVKbeBRn80D9Nt
X-Google-Smtp-Source: APXvYqx3TqI1odtrPhBaMhRk7XJ7xo3P9kh8hBuxuOWCq0irhWhOhqA5mQxtAyW6aR7KcAnLJC5+MQ==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr350371wmb.89.1572274434477;
	Mon, 28 Oct 2019 07:53:54 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	a189sm13222536wma.2.2019.10.28.07.53.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 07:53:53 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 14:53:48 +0000
Message-Id: <20191028145350.6606-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028145350.6606-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
	<20191028145350.6606-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/4] dbus-broker: backport patches from master
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
X-List-Received-Date: Mon, 28 Oct 2019 14:53:55 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

These patches fix issues found in Fedora 30, which switched from
dbus-daemon to dbus-broker.
These backports align meta-oe to Fedora 30.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: use SRC_URI instead of SRC_URI_append

 ...h-improve-error-handling-for-opendir.patch | 48 +++++++++++
 ...he-constant-used-for-invalid-timesta.patch | 86 +++++++++++++++++++
 ...s-socket-treat-MSG_CTRUNC-gracefully.patch | 83 ++++++++++++++++++
 meta-oe/recipes-core/dbus/dbus-broker_21.bb   |  3 +
 4 files changed, 220 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-launch-improve-error-handling-for-opendir.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0002-metrics-change-the-constant-used-for-invalid-timesta.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-launch-improve-error-handling-for-opendir.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-launch-improve-error-handling-for-opendir.patch
new file mode 100644
index 000000000..ccc175bb8
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0001-launch-improve-error-handling-for-opendir.patch
@@ -0,0 +1,48 @@
+From f42d5e38859c65a186acd0da94bbeeca12faf7a2 Mon Sep 17 00:00:00 2001
+From: David Rheinsberg <david.rheinsberg@gmail.com>
+Date: Thu, 2 May 2019 17:33:34 +0200
+Subject: [PATCH] launch: improve error handling for opendir()
+
+This improves the error-handling of opendir() by always printing
+diagnostics. Furthermore, it aligns the behavior with dbus-deamon and
+ignores EACCES.
+
+Signed-off-by: David Rheinsberg <david.rheinsberg@gmail.com>
+Upstream-Status: dbus-broker@f42d5e38859c65a186acd0da94bbeeca12faf7a2
+---
+ src/launch/launcher.c | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/src/launch/launcher.c b/src/launch/launcher.c
+index 31a5364..2ec4bda 100644
+--- a/src/launch/launcher.c
++++ b/src/launch/launcher.c
+@@ -749,10 +749,23 @@ static int launcher_load_service_dir(Launcher *launcher, const char *dirpath, NS
+ 
+         dir = opendir(dirpath);
+         if (!dir) {
+-                if (errno == ENOENT || errno == ENOTDIR)
++                if (errno == ENOENT || errno == ENOTDIR) {
+                         return 0;
+-                else
++                } else if (errno == EACCES) {
++                        log_append_here(&launcher->log, LOG_ERR, 0, NULL);
++                        r = log_commitf(&launcher->log, "Access denied to service directory '%s'\n", dirpath);
++                        if (r)
++                                return error_fold(r);
++
++                        return 0;
++                } else {
++                        log_append_here(&launcher->log, LOG_ERR, errno, NULL);
++                        r = log_commitf(&launcher->log, "Unable to open service directory '%s': %m\n", dirpath);
++                        if (r)
++                                return error_fold(r);
++
+                         return error_origin(-errno);
++                }
+         }
+ 
+         r = dirwatch_add(launcher->dirwatch, dirpath);
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0002-metrics-change-the-constant-used-for-invalid-timesta.patch b/meta-oe/recipes-core/dbus/dbus-broker/0002-metrics-change-the-constant-used-for-invalid-timesta.patch
new file mode 100644
index 000000000..67a2dc46f
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0002-metrics-change-the-constant-used-for-invalid-timesta.patch
@@ -0,0 +1,86 @@
+From 3570b3e9ba367f10718b56336ce32d5254f66575 Mon Sep 17 00:00:00 2001
+From: Tom Gundersen <teg@jklm.no>
+Date: Thu, 9 May 2019 13:00:37 +0200
+Subject: [PATCH] metrics: change the constant used for invalid timestamps
+
+Use (uint64_t)-1 rather than 0 to indicate an invalid timestamp. It
+should not be possible for the kernel to return 0 from
+clock_gettime(), but we have received some reports of our asserts
+triggering, so avoid the issue entirely  by using -1 instead (which
+really can never be returned).
+
+See https://retrace.fedoraproject.org/faf/reports/2539484/
+
+Signed-off-by: Tom Gundersen <teg@jklm.no>
+Upstream-Status: dbus-broker@3570b3e9ba367f10718b56336ce32d5254f66575
+---
+ src/util/metrics.c | 8 ++++----
+ src/util/metrics.h | 9 ++++++---
+ 2 files changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/src/util/metrics.c b/src/util/metrics.c
+index b5a7182..eef94eb 100644
+--- a/src/util/metrics.c
++++ b/src/util/metrics.c
+@@ -26,7 +26,7 @@ void metrics_init(Metrics *metrics, clockid_t id) {
+ }
+ 
+ void metrics_deinit(Metrics *metrics) {
+-        c_assert(!metrics->timestamp);
++        c_assert(metrics->timestamp == METRICS_TIMESTAMP_INVALID);
+         metrics_init(metrics, metrics->id);
+ }
+ 
+@@ -82,7 +82,7 @@ void metrics_sample_add(Metrics *metrics, uint64_t timestamp) {
+  * a sample is not currently running.
+  */
+ void metrics_sample_start(Metrics *metrics) {
+-        c_assert(!metrics->timestamp);
++        c_assert(metrics->timestamp == METRICS_TIMESTAMP_INVALID);
+         metrics->timestamp = metrics_get_time(metrics);
+ }
+ 
+@@ -93,11 +93,11 @@ void metrics_sample_start(Metrics *metrics) {
+  * End a currently running sample, and update the internal state.
+  */
+ void metrics_sample_end(Metrics *metrics) {
+-        c_assert(metrics->timestamp);
++        c_assert(metrics->timestamp != METRICS_TIMESTAMP_INVALID);
+ 
+         metrics_sample_add(metrics, metrics->timestamp);
+ 
+-        metrics->timestamp = 0;
++        metrics->timestamp = METRICS_TIMESTAMP_INVALID;
+ }
+ 
+ /**
+diff --git a/src/util/metrics.h b/src/util/metrics.h
+index a8ee915..b00dee6 100644
+--- a/src/util/metrics.h
++++ b/src/util/metrics.h
+@@ -8,6 +8,8 @@
+ #include <stdlib.h>
+ #include <time.h>
+ 
++#define METRICS_TIMESTAMP_INVALID ((uint64_t) -1)
++
+ typedef struct Metrics Metrics;
+ 
+ struct Metrics {
+@@ -23,9 +25,10 @@ struct Metrics {
+         uint64_t sum_of_squares;
+ };
+ 
+-#define METRICS_INIT(_id) {                     \
+-                .minimum = (uint64_t) -1,       \
+-                .id = (_id),                    \
++#define METRICS_INIT(_id) {                                     \
++                .minimum = (uint64_t) -1,                       \
++                .id = (_id),                                    \
++                .timestamp = METRICS_TIMESTAMP_INVALID,         \
+         }
+ 
+ void metrics_init(Metrics *metrics, clockid_t id);
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch b/meta-oe/recipes-core/dbus/dbus-broker/0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch
new file mode 100644
index 000000000..53f9e71aa
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch
@@ -0,0 +1,83 @@
+From 520c47c53deeb893e03194fefaf3c5b9223ede27 Mon Sep 17 00:00:00 2001
+From: David Rheinsberg <david.rheinsberg@gmail.com>
+Date: Fri, 10 May 2019 10:58:06 +0200
+Subject: [PATCH] dbus/socket: treat MSG_CTRUNC gracefully
+
+As it turns out, LSMs allow clients to trigger a MSG_CTRUNC on the
+remote side of a unix socket. Whenever LSMs reject the transmission of
+an FD, they will simply drop the FD and set MSG_CTRUNC, without any
+other error notification.
+
+Therefore, we must assume any occurance of MSG_CTRUNC is trigger by a
+client. This makes it impossible to consider MSG_CTRUNC for any other
+error handling, and as such we are left to disconnecting the client and
+ignoring the flag.
+
+Luckily, MSG_CTRUNC is expected for any other event, so we only used it
+for diagnostics so far.
+
+Signed-off-by: David Rheinsberg <david.rheinsberg@gmail.com>
+Upstream-Status: dbus-broker@520c47c53deeb893e03194fefaf3c5b9223ede27
+---
+ src/dbus/socket.c | 44 +++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 33 insertions(+), 11 deletions(-)
+
+diff --git a/src/dbus/socket.c b/src/dbus/socket.c
+index cacdff2..6e6ba10 100644
+--- a/src/dbus/socket.c
++++ b/src/dbus/socket.c
+@@ -593,18 +593,40 @@ static int socket_recvmsg(Socket *socket,
+ 
+         if (msg.msg_flags & MSG_CTRUNC) {
+                 /*
+-                 * This flag means the control-buffer was too small to retrieve
+-                 * all data. If this can be triggered remotely, it means a peer
+-                 * can cause us to miss FDs. Hence, we really must protect
+-                 * against this.
+-                 * We do provide suitably sized buffers to be prepared for any
+-                 * possible scenario. So if this happens, something is fishy
+-                 * and we better report it.
+-                 * Note that this is also reported by the kernel if we exceeded
+-                 * our NOFILE limit. Since this implies resource
+-                 * misconfiguration as well, we treat it the same way.
++                 * Our control-buffer-size is carefully calculated to be big
++                 * enough for any possible ancillary data we expect. Therefore,
++                 * the kernel should never be required to truncate it, and thus
++                 * MSG_CTRUNC will never be set. This is also foward compatible
++                 * to future extensions to the ancillary data, since these must
++                 * be enabled explicitly before the kernel considers forwarding
++                 * them.
++                 *
++                 * Unfortunately, the SCM_RIGHTS implementation might set this
++                 * flag as well. In particular, if not all FDs can be returned
++                 * to user-space, MSG_CTRUNC will be set (signalling that the
++                 * FD-set is non-complete). No other error is returned or
++                 * signalled, though. There are several reasons why the FD
++                 * transmission can fail. Most importantly, if we exhaust our
++                 * FD limit, further FDs will simply be discarded. We are
++                 * protected against this by our accounting-quotas, but we
++                 * would still like to catch this condition and warn loudly.
++                 * However, FDs are also dropped if the security layer refused
++                 * the transmission of the FD in question. This means, if an
++                 * LSM refuses the D-Bus client to send us an FD, the FD is
++                 * just dropped and MSG_CTRUNC will be set. This can be
++                 * triggered by clients.
++                 *
++                 * To summarize: In an ideal world, we would expect this flag
++                 * to never be set, and we would just use
++                 * `error_origin(-ENOTRECOVERABLE)` to provide diagnostics.
++                 * Unfortunately, the gross misuse of this flag for LSM
++                 * security enforcements means we have to assume any occurence
++                 * of MSG_CTRUNC means the client was refused to send a
++                 * specific message. Our only possible way to deal with this is
++                 * to disconnect the client.
+                  */
+-                r = error_origin(-ENOTRECOVERABLE);
++                socket_close(socket);
++                r = SOCKET_E_LOST_INTEREST;
+                 goto error;
+         }
+ 
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index f22916aba..425485a8b 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -7,6 +7,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
+SRC_URI += " file://0001-launch-improve-error-handling-for-opendir.patch"
+SRC_URI += " file://0002-metrics-change-the-constant-used-for-invalid-timesta.patch"
+SRC_URI += " file://0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch"
 SRC_URI[md5sum] = "7d2e7e72b45c3cb7c25d21a53ce30c7d"
 SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
 
-- 
2.20.1


