Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39703.1793010494970483555
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=io8wwMoa;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GwikqbFm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: harsh.rai@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aVcD1708697
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F9L/VIsUfR5JrlsRQ9Jyd5MEkaVRijh1LhJ
	p/Yul4Ug=; b=io8wwMoaB1QzFQBWHYs7JMk7U7Hk9X35NXndl70H+69XeYjptrS
	onbMJqFBUOwWWlAo1gT9UUH7j/Mq9YYKHzgIOervYIlql7cCk6YmGVvo6mqdyU71
	QeRPC1YBsBSRrgfECSKo7SMv1DA9N6hzILjws/AjPP3kV+Uu3hweYI39LPJzS6Zz
	dmeno8ZkmIX4bgQkl8/hAPHUh5iQZYGPXm50CidvPzaD1LjcY7qLJ/JYUBI00cQR
	3JHjkjvEzHwEKvphOVCMvwmOFoJ02eqJZNYz2p71v16DzJjNCd/0YL0Ni4JH6wxm
	HIr7MOZ8ZM5XnO4rm0gWHjxYeBYyasGPovw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9yvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:22:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3692c5b061bso10857897eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010134; x=1793614934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9L/VIsUfR5JrlsRQ9Jyd5MEkaVRijh1LhJp/Yul4Ug=;
        b=GwikqbFmkhGS6xJ69JB/WFP2RvS5BKz4vdvmYck4kd8dN/IhAMdfyeTpEviei9mU27
         pafv6xDxuNzrMdDk3MY6NGGSKEZNcyr0NzR1jp6hW5R/pN3Qh3kkkINrWJ+tzIHJfgAQ
         d3vxU4UUAQJD220yz2HYjTwqyGt6s9vWjbVNbTYUqhJk3kluHahoGxWRgwR9RCf8NiX2
         gdq51PUA565+y+3Vc4OD+UN2p/lGRT8qN1vixpXeRNtJlVhaYSFySMcXL001x/WZ0gZf
         pwohTI1wg5nZB7wdjyltYBx8e0+VJ9VT3WSQZ8cN+9Gfc7BCEtqFJzpJ/KASEO1akqu9
         QmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010134; x=1793614934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F9L/VIsUfR5JrlsRQ9Jyd5MEkaVRijh1LhJp/Yul4Ug=;
        b=d3Rja2nl2LFRAVrC1Ng5KnXUDk+aCwu44nGso5U0F+Xx4T5FLi49DxZubYfZF0YnbC
         za5RLIjojISpCRi1SyypfrNbD5TTj0V20No90z/rujUD+y029oHu2T2OCbepFZ3SYZW7
         Ud87CL/M5gZhhuP8icbrc8uYbRetnFOmdLKlLaGDGY9GK3CYhm5tzby8Yg1bceGKkJz5
         xaQChtCR+ejaGFcpR1l7EkPvxbluBMt4dspcWe5WEzXItwTKQoeRNIY0YKNcik6UsvrT
         X7MYbC6r3lQ3CcbonAq1gffbfMXuvSDBG9SPwjsWSNtnvuNtkcC31qnP9Dk8wQWLnM4p
         x7Qw==
X-Gm-Message-State: AFq9FYKPsZYhYJrQ8DW5D0AEt38Q3koi27jp5HvQ3nTroZA9PmFAFT4n
	kqDP4Z1JLrwPSaNM3SLXtlyRIE2NOZ0U7X+QXeAt/MqeRjkyyL1pUtajSZQeGggvcmzSckLcXiL
	+UWf/0spocLTDjgH6kJJnWiaQX/UJ9C4LrisYm2iLLsMgh0xXIaTuW50IUWDJKvMcEYDPNpVQ4S
	kMpRMHc2yKA0U+XmN0
X-Gm-Gg: AYBFou0zQ/n/zTwe/dZ1wZOMGoYo/ZPPkhMLmd6N+Pb763X03vZ6DC9Z0Ade5d7aaXt
	/XDFefoAahyV/rBrIObZCgJeWqjNcsWdFs0o8EUtV1UzauXo1BqciVVYyAWC5aVyslNzgKgziei
	gU5WeSDPzD3ZoZzK2ZKdYzxNib1unSS43GrDwQK75Ho6E0g3MarAX0LVpHfncbHGM90lXuR4p2+
	y6WPUVmCs0gbxd4gPl6ZI9nqKeluFhuni8WzB1oo72DxdJL6KKZ87QmzYYG4vQb/bAoR4obclwT
	6nT3n6CNsqoqdEewmke1Ctfm3T7vujQhhjOYHMnazpZ2MtoMqe7XLtPxtiFgLncZuENHV9b7Hg0
	nz/NczkXUXUHZimbDm7j8qQ==
X-Received: by 2002:a05:693c:66c4:20b0:369:f17d:f02 with SMTP id 5a478bee46e88-369f17d152bmr6899965eec.14.1793010131233;
        Mon, 26 Oct 2026 03:22:11 -0700 (PDT)
X-Received: by 2002:a05:693c:66c4:20b0:369:f17d:f02 with SMTP id 5a478bee46e88-369f17d152bmr6899830eec.14.1793010128015;
        Mon, 26 Oct 2026 03:22:08 -0700 (PDT)
Received: from hu-hrai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm45674879eec.23.2026.10.26.03.22.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:22:07 -0700 (PDT)
From: Harsh Rai <harsh.rai@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH v3] pipewire: add compressed offload support
Date: Mon, 26 Oct 2026 15:51:43 +0530
Message-ID: <20261026102143.288505-1-harsh.rai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: xT5VqzmU55sSxDqMM7eFbQXToQoJPxLH
X-Proofpoint-GUID: xT5VqzmU55sSxDqMM7eFbQXToQoJPxLH
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf29d7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=6KE5vAiihv2d1Hk0wFQA:9 a=JlCXkTpkdGvNkSzj:21
 a=O8hF6Hzn-FEA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX6g0ZW2A1Iv+w
 H5EkJJC34oFAwCffQEMlYyETFkp18w1JxuUEwTEWm5uKzvjKNYdfH1A/ul/fCWfotAUvS1QB4zp
 yjBntdAOrMK71/HHNUaUcxPP/PkVBL0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX5EkS951jxFIc
 ewpTgb/a7eivt3UeYbN9d1dXi4HYibl9mBwaJq3+nierMbAEONnqX6wrt44m8vNtfCGXiZJkuhs
 7Sxa85LMcjur7dEoYphCnzdlcU0Kc6bZSprICd4B8YfjkYtZhVUIqbkVEsmKRqbq/nob0l5mT6P
 oEy06Q1dhl1ocDKQ81rvPibf0n7CYlh4KaGqyWU3k1GlO9Zt94gqFv8KH7aZu8V0e6WSPTLiBco
 Cb44AfzbQTBaSuxbVYFOlJDJUnwgtzX6S6jVDY6VA8zwW5Qr5VW4phxxptEJpjsnMvA1FAL2YiG
 dU7pqqEH+QRVCViomRyTDkjG0EafUsWM2mTNEPCUN6PUCKaM+OHn174zCBiDYrhQw63S4cIRJ6Z
 vzWTBSHMkm0TBYBBf+42AfwJa/xri5LXT0J84NbVyf4AZnpkXynUrq8iXD8zCD++54w2gz+14bt
 Q1s8HkOxR2Wa+KouWtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131433
Content-Type: text/plain; charset="utf-8"

Add a PipeWire Pulse virtual sink and forwarder for compressed offload, enabling compressed Pulse streams to be routed to a PAL compressed sink.
[New changes added]

Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
---
 .../0001-pipewire-compress-offload.patch      | 4028 +++++++++++------
 1 file changed, 2685 insertions(+), 1343 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
index 8a884d64cd..653f6c3268 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
@@ -1,1343 +1,2685 @@
-From 345e4b033c2ff69ab7aa02a123f6041b878f7fb9 Mon Sep 17 00:00:00 2001
-From: Harsh Rai <harsh.rai@oss.qualcomm.com>
-Date: Tue, 16 Jun 2026 19:21:37 +0530
-Subject: [PATCH] pulse: enable MP3 compressed offload via Pulse
-
-Add PipeWire Pulse virtual sink and forwarder for offload.
-Route compressed Pulse streams to PAL compressed sink.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
-
-Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
----
- src/modules/meson.build                       |   2 +
- .../module-compress-offload-forwarder.c       | 649 ++++++++++++++++++
- .../modules/module-compress-offload-sink.c    | 293 ++++++++
- .../module-protocol-pulse/pulse-server.c      | 254 ++++++-
- 4 files changed, 1187 insertions(+), 11 deletions(-)
- create mode 100644 src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
- create mode 100644 src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
-
-diff --git a/src/modules/meson.build b/src/modules/meson.build
-index 59f46ae..900871d 100644
---- a/src/modules/meson.build
-+++ b/src/modules/meson.build
-@@ -324,6 +324,8 @@ pipewire_module_protocol_pulse_sources = [
-   'module-protocol-pulse/modules/module-alsa-source.c',
-   'module-protocol-pulse/modules/module-always-sink.c',
-   'module-protocol-pulse/modules/module-combine-sink.c',
-+  'module-protocol-pulse/modules/module-compress-offload-sink.c',
-+  'module-protocol-pulse/modules/module-compress-offload-forwarder.c',
-   'module-protocol-pulse/modules/module-device-manager.c',
-   'module-protocol-pulse/modules/module-device-restore.c',
-   'module-protocol-pulse/modules/module-echo-cancel.c',
-diff --git a/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
-new file mode 100644
-index 0000000..33054e4
---- /dev/null
-+++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
-@@ -0,0 +1,649 @@
-+/* PipeWire */
-+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
-+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
-+
-+#include <errno.h>
-+#include <limits.h>
-+#include <stdint.h>
-+#include <stdlib.h>
-+#include <string.h>
-+
-+#include <spa/param/audio/compressed.h>
-+#include <spa/param/audio/format-utils.h>
-+#include <spa/param/audio/raw.h>
-+#include <spa/utils/result.h>
-+#include <spa/utils/string.h>
-+#include <pipewire/pipewire.h>
-+
-+#include "../module.h"
-+
-+#define NAME "compress-offload-forwarder"
-+
-+#define DEFAULT_CODEC "mp3"
-+#define DEFAULT_RATE 48000u
-+#define DEFAULT_CHANNELS 2u
-+#define DEFAULT_BITRATE 128000u
-+#define DEFAULT_BLOCK_SIZE (16u * 1024u)
-+
-+static const char *const forwarder_options =
-+	"source_sink=<Pulse-visible compress sink node.name> "
-+	"target_sink=<PAL compress sink node.name> "
-+	"codec=<codec name, default mp3> "
-+	"rate=<sample rate, default 48000> "
-+	"channels=<number of channels, default 2> "
-+	"bitrate=<bit rate, default 128000> "
-+	"block_size=<buffer size in bytes, default 16384>";
-+
-+PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
-+#define PW_LOG_TOPIC_DEFAULT mod_topic
-+
-+struct forwarder_data {
-+	struct pw_core *core;
-+	struct pw_loop *loop;
-+	struct spa_source *activate_event;
-+	struct spa_hook core_listener;
-+	struct pw_registry *registry;
-+	struct spa_hook registry_listener;
-+
-+	struct pw_stream *capture;
-+	struct spa_hook capture_listener;
-+	struct pw_stream *playback;
-+	struct spa_hook playback_listener;
-+
-+	char source_name[256];
-+	char monitor_name[280];
-+	char target_name[256];
-+	char codec[32];
-+	uint32_t rate;
-+	uint32_t channels;
-+	uint32_t bitrate;
-+	uint32_t block_size;
-+	uint32_t target_id;
-+	uint8_t *pending_data;
-+	uint32_t pending_size;
-+	uint32_t pending_offset;
-+	uint8_t capture_streaming:1;
-+	uint8_t logged_first_buffer:1;
-+	uint8_t logged_first_output_buffer:1;
-+	uint8_t logged_silence_buffer:1;
-+	uint8_t activate_pending:1;
-+	uint8_t playback_active:1;
-+	uint8_t playback_failed:1;
-+};
-+
-+static int create_playback_stream(struct forwarder_data *d);
-+static void set_playback_active(struct forwarder_data *d, bool active);
-+static void maybe_create_playback_stream(struct forwarder_data *d, const char *reason);
-+
-+static void request_playback_activation(struct forwarder_data *d)
-+{
-+	if (d->activate_event == NULL || d->activate_pending)
-+		return;
-+	d->activate_pending = true;
-+	pw_loop_signal_event(d->loop, d->activate_event);
-+}
-+
-+static void playback_activate_event(void *data, uint64_t count)
-+{
-+	struct forwarder_data *d = data;
-+
-+	d->activate_pending = false;
-+	maybe_create_playback_stream(d, "first-audio-buffer");
-+}
-+
-+static bool buffer_is_zeroed(const void *data, uint32_t size)
-+{
-+	const uint8_t *bytes = data;
-+	uint32_t index;
-+
-+	for (index = 0; index < size; index++) {
-+		if (bytes[index] != 0)
-+			return false;
-+	}
-+	return true;
-+}
-+
-+static void clear_pending_data(struct forwarder_data *d)
-+{
-+	free(d->pending_data);
-+	d->pending_data = NULL;
-+	d->pending_size = 0;
-+	d->pending_offset = 0;
-+}
-+
-+static void compact_pending_data(struct forwarder_data *d)
-+{
-+	uint32_t remaining;
-+
-+	if (d->pending_offset == 0)
-+		return;
-+	if (d->pending_offset >= d->pending_size) {
-+		clear_pending_data(d);
-+		return;
-+	}
-+	remaining = d->pending_size - d->pending_offset;
-+	memmove(d->pending_data, d->pending_data + d->pending_offset, remaining);
-+	d->pending_size = remaining;
-+	d->pending_offset = 0;
-+}
-+
-+static int append_pending_data(struct forwarder_data *d, const void *data, uint32_t size)
-+{
-+	uint8_t *pending_data;
-+
-+	if (size == 0)
-+		return 0;
-+	compact_pending_data(d);
-+	if (d->pending_size > UINT32_MAX - size)
-+		return -EOVERFLOW;
-+	pending_data = realloc(d->pending_data, d->pending_size + size);
-+	if (pending_data == NULL)
-+		return -errno;
-+	d->pending_data = pending_data;
-+	memcpy(d->pending_data + d->pending_size, data, size);
-+	d->pending_size += size;
-+	return 0;
-+}
-+
-+static void maybe_create_playback_stream(struct forwarder_data *d, const char *reason)
-+{
-+	int res;
-+
-+	if (!d->capture_streaming)
-+		return;
-+	if (d->playback != NULL) {
-+		set_playback_active(d, true);
-+		return;
-+	}
-+	if (d->target_id == PW_ID_ANY) {
-+		pw_log_debug("compress-forwarder target:%s not resolved yet, defer output create (%s)",
-+				d->target_name, reason);
-+		return;
-+	}
-+	res = create_playback_stream(d);
-+	if (res < 0)
-+		pw_log_error("compress-forwarder target:%s create failed (%s): %s",
-+				d->target_name, reason, spa_strerror(res));
-+	else
-+		set_playback_active(d, true);
-+}
-+
-+static void destroy_playback_stream(struct forwarder_data *d)
-+{
-+	clear_pending_data(d);
-+	if (d->playback == NULL)
-+		return;
-+	spa_hook_remove(&d->playback_listener);
-+	pw_stream_destroy(d->playback);
-+	d->playback = NULL;
-+	d->playback_active = false;
-+	d->playback_failed = false;
-+}
-+
-+static const struct spa_pod *build_raw_format(struct forwarder_data *d,
-+		struct spa_pod_builder *builder, uint32_t id)
-+{
-+	struct spa_audio_info_raw info;
-+
-+	spa_zero(info);
-+	info.format = SPA_AUDIO_FORMAT_S16_LE;
-+	info.rate = d->rate;
-+	info.channels = d->channels;
-+	if (info.channels == 1) {
-+		info.position[0] = SPA_AUDIO_CHANNEL_MONO;
-+	} else {
-+		info.channels = 2;
-+		info.position[0] = SPA_AUDIO_CHANNEL_FL;
-+		info.position[1] = SPA_AUDIO_CHANNEL_FR;
-+	}
-+	return spa_format_audio_raw_build(builder, id, &info);
-+}
-+
-+static const struct spa_pod *build_encoded_format(struct forwarder_data *d,
-+		struct spa_pod_builder *builder, uint32_t id)
-+{
-+	struct spa_audio_info info;
-+
-+	spa_zero(info);
-+	info.media_type = SPA_MEDIA_TYPE_audio;
-+	info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
-+	info.info.mp3.rate = d->rate;
-+	info.info.mp3.channels = d->channels;
-+	info.info.mp3.channel_mode = d->channels == 1 ?
-+		SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
-+
-+	return spa_format_audio_build(builder, id, &info);
-+}
-+
-+static void playback_state_changed(void *data, enum pw_stream_state old,
-+		enum pw_stream_state state, const char *error)
-+{
-+	struct forwarder_data *d = data;
-+
-+	pw_log_debug("compress-forwarder target:%s state %d -> %d%s%s",
-+			d->target_name, old, state, error ? ": " : "", error ? error : "");
-+	if (state == PW_STREAM_STATE_ERROR)
-+		d->playback_failed = true;
-+}
-+
-+static void set_playback_active(struct forwarder_data *d, bool active)
-+{
-+	if (d->playback == NULL || d->playback_active == active)
-+		return;
-+	pw_log_debug("compress-forwarder target:%s active=%d", d->target_name, active);
-+	pw_stream_set_active(d->playback, active);
-+	d->playback_active = active;
-+}
-+
-+static void capture_state_changed(void *data, enum pw_stream_state old,
-+		enum pw_stream_state state, const char *error)
-+{
-+	struct forwarder_data *d = data;
-+
-+	pw_log_debug("compress-forwarder source:%s state %d -> %d%s%s",
-+			d->monitor_name, old, state, error ? ": " : "", error ? error : "");
-+	if (d->playback_failed)
-+		destroy_playback_stream(d);
-+	d->capture_streaming = state == PW_STREAM_STATE_STREAMING;
-+	if (state == PW_STREAM_STATE_PAUSED || state == PW_STREAM_STATE_ERROR)
-+		set_playback_active(d, false);
-+}
-+
-+static void capture_process(void *data)
-+{
-+	struct forwarder_data *d = data;
-+	struct pw_buffer *in_buf, *out_buf;
-+	struct spa_data *in_data, *out_data;
-+	uint32_t in_offset, in_size, out_size, copy_size;
-+	const void *input_data;
-+	const void *copy_data;
-+	uint32_t copy_available;
-+	int res;
-+
-+	in_buf = pw_stream_dequeue_buffer(d->capture);
-+	if (in_buf == NULL)
-+		return;
-+
-+	in_data = &in_buf->buffer->datas[0];
-+	if (in_data->data == NULL || in_data->chunk == NULL) {
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+	in_offset = SPA_MIN(in_data->chunk->offset, in_data->maxsize);
-+	in_size = SPA_MIN(in_data->chunk->size, in_data->maxsize - in_offset);
-+	input_data = SPA_PTROFF(in_data->data, in_offset, void);
-+	if (in_size == 0) {
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+	if (buffer_is_zeroed(input_data, in_size)) {
-+		if (!d->logged_silence_buffer) {
-+			pw_log_debug("compress-forwarder source:%s ignoring zeroed startup buffer size=%u flags=0x%x",
-+					d->monitor_name, in_size, in_data->chunk->flags);
-+			d->logged_silence_buffer = true;
-+		}
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+	if (!d->logged_first_buffer) {
-+		const uint8_t *bytes = SPA_PTROFF(in_data->data, in_offset, const uint8_t);
-+		pw_log_debug("compress-forwarder source:%s first non-silence buffer size=%u offset=%u flags=0x%x",
-+				d->monitor_name, in_size, in_offset, in_data->chunk->flags);
-+		pw_log_debug("compress-forwarder source:%s first non-silence bytes=%02x %02x %02x %02x %02x %02x %02x %02x",
-+				d->monitor_name,
-+				in_size > 0 ? bytes[0] : 0,
-+				in_size > 1 ? bytes[1] : 0,
-+				in_size > 2 ? bytes[2] : 0,
-+				in_size > 3 ? bytes[3] : 0,
-+				in_size > 4 ? bytes[4] : 0,
-+				in_size > 5 ? bytes[5] : 0,
-+				in_size > 6 ? bytes[6] : 0,
-+				in_size > 7 ? bytes[7] : 0);
-+		d->logged_first_buffer = true;
-+	}
-+
-+	if (d->playback_failed)
-+		destroy_playback_stream(d);
-+
-+	res = append_pending_data(d, input_data, in_size);
-+	if (res < 0) {
-+		pw_log_error("compress-forwarder source:%s failed to preserve input before target write: %s",
-+				d->monitor_name, spa_strerror(res));
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+
-+	if (d->playback == NULL) {
-+		request_playback_activation(d);
-+		if (d->playback == NULL) {
-+			pw_log_debug("compress-forwarder source:%s preserved %u bytes pending target create total=%u",
-+					d->monitor_name, in_size, d->pending_size - d->pending_offset);
-+			pw_stream_queue_buffer(d->capture, in_buf);
-+			return;
-+		}
-+	}
-+	if (!d->playback_active)
-+		set_playback_active(d, true);
-+	if (d->playback_failed || !d->playback_active) {
-+		pw_log_debug("compress-forwarder source:%s preserved %u bytes pending inactive target total=%u",
-+				d->monitor_name, in_size, d->pending_size - d->pending_offset);
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+
-+	out_buf = pw_stream_dequeue_buffer(d->playback);
-+	if (out_buf == NULL) {
-+		pw_log_debug("compress-forwarder source:%s preserved %u bytes pending output buffer total=%u",
-+				d->monitor_name, in_size, d->pending_size - d->pending_offset);
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+
-+	out_data = &out_buf->buffer->datas[0];
-+	if (out_data->data == NULL || out_data->chunk == NULL) {
-+		pw_stream_queue_buffer(d->playback, out_buf);
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+
-+	out_size = out_data->maxsize;
-+	if (out_size == 0) {
-+		pw_stream_queue_buffer(d->playback, out_buf);
-+		pw_stream_queue_buffer(d->capture, in_buf);
-+		return;
-+	}
-+	copy_data = d->pending_data + d->pending_offset;
-+	copy_available = d->pending_size - d->pending_offset;
-+	copy_size = SPA_MIN(copy_available, out_size);
-+	memcpy(out_data->data, copy_data, copy_size);
-+	d->pending_offset += copy_size;
-+	if (d->pending_offset >= d->pending_size)
-+		clear_pending_data(d);
-+
-+	out_data->chunk->offset = 0;
-+	out_data->chunk->size = copy_size;
-+	out_data->chunk->stride = 1;
-+	out_buf->size = copy_size;
-+
-+	if (!d->logged_first_output_buffer) {
-+		const uint8_t *out_bytes = out_data->data;
-+		pw_log_debug("compress-forwarder target:%s queue buffer copy_size=%u out_max=%u chunk=%u/%u/%d bytes=%02x %02x %02x %02x %02x %02x %02x %02x",
-+				d->target_name, copy_size, out_data->maxsize,
-+				out_data->chunk->offset, out_data->chunk->size,
-+				out_data->chunk->stride,
-+				copy_size > 0 ? out_bytes[0] : 0,
-+				copy_size > 1 ? out_bytes[1] : 0,
-+				copy_size > 2 ? out_bytes[2] : 0,
-+				copy_size > 3 ? out_bytes[3] : 0,
-+				copy_size > 4 ? out_bytes[4] : 0,
-+				copy_size > 5 ? out_bytes[5] : 0,
-+				copy_size > 6 ? out_bytes[6] : 0,
-+				copy_size > 7 ? out_bytes[7] : 0);
-+		d->logged_first_output_buffer = true;
-+	}
-+
-+	pw_stream_queue_buffer(d->playback, out_buf);
-+	pw_stream_queue_buffer(d->capture, in_buf);
-+}
-+
-+static const struct pw_stream_events capture_events = {
-+	PW_VERSION_STREAM_EVENTS,
-+	.state_changed = capture_state_changed,
-+	.process = capture_process,
-+};
-+
-+static const struct pw_stream_events playback_events = {
-+	PW_VERSION_STREAM_EVENTS,
-+	.state_changed = playback_state_changed,
-+};
-+
-+static void registry_global(void *data, uint32_t id, uint32_t permissions,
-+		const char *type, uint32_t version, const struct spa_dict *props)
-+{
-+	struct forwarder_data *d = data;
-+	const char *name;
-+
-+	if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || props == NULL)
-+		return;
-+	name = spa_dict_lookup(props, PW_KEY_NODE_NAME);
-+	if (!spa_streq(name, d->target_name))
-+		return;
-+	d->target_id = id;
-+	pw_log_info("compress-forwarder target:%s resolved id=%u", d->target_name, id);
-+}
-+
-+static void registry_global_remove(void *data, uint32_t id)
-+{
-+	struct forwarder_data *d = data;
-+
-+	if (id != d->target_id)
-+		return;
-+	pw_log_info("compress-forwarder target:%s removed id=%u", d->target_name, id);
-+	d->target_id = PW_ID_ANY;
-+	destroy_playback_stream(d);
-+}
-+
-+static const struct pw_registry_events registry_events = {
-+	PW_VERSION_REGISTRY_EVENTS,
-+	.global = registry_global,
-+	.global_remove = registry_global_remove,
-+};
-+
-+static int create_playback_stream(struct forwarder_data *d)
-+{
-+	struct pw_properties *props;
-+	const struct spa_pod *params[2];
-+	uint8_t buffer[1024];
-+	struct spa_pod_builder builder;
-+	uint32_t n_params = 0;
-+	int res;
-+
-+	props = pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Output/Audio",
-+			PW_KEY_NODE_NAME, "compress-offload-forwarder-output",
-+			PW_KEY_MEDIA_TYPE, "Audio",
-+			PW_KEY_MEDIA_CATEGORY, "Playback",
-+			PW_KEY_MEDIA_ROLE, "Music",
-+			PW_KEY_TARGET_OBJECT, d->target_name,
-+			PW_KEY_NODE_AUTOCONNECT, "true",
-+			PW_KEY_STREAM_DONT_REMIX, "true",
-+			"node.dont-reconnect", "true",
-+			PW_KEY_NODE_RATE, "1/48000",
-+			"compress.offload", "true",
-+			"codec.type", d->codec,
-+			NULL);
-+	if (props == NULL)
-+		return -errno;
-+	pw_properties_setf(props, "codec.sample_rate", "%u", d->rate);
-+	pw_properties_setf(props, "codec.channels", "%u", d->channels);
-+	pw_properties_setf(props, "codec.bit_rate", "%u", d->bitrate);
-+	pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
-+
-+	d->playback = pw_stream_new(d->core, "compress offload forwarder output", props);
-+	if (d->playback == NULL)
-+		return -errno;
-+	pw_stream_add_listener(d->playback, &d->playback_listener, &playback_events, d);
-+
-+	spa_pod_builder_init(&builder, buffer, sizeof(buffer));
-+	params[n_params++] = build_encoded_format(d, &builder, SPA_PARAM_EnumFormat);
-+	pw_log_debug("compress-forwarder target:%s connect target-id=%u", d->target_name, d->target_id);
-+	res = pw_stream_connect(d->playback, PW_DIRECTION_OUTPUT, d->target_id,
-+			PW_STREAM_FLAG_AUTOCONNECT |
-+			PW_STREAM_FLAG_NO_CONVERT |
-+			PW_STREAM_FLAG_MAP_BUFFERS |
-+			PW_STREAM_FLAG_RT_PROCESS,
-+			params, n_params);
-+	if (res < 0) {
-+		destroy_playback_stream(d);
-+		return res;
-+	}
-+	pw_stream_set_active(d->playback, false);
-+	d->playback_active = false;
-+	d->playback_failed = false;
-+	return 0;
-+}
-+
-+static int create_capture_stream(struct forwarder_data *d)
-+{
-+	struct pw_properties *props;
-+	const struct spa_pod *params[2];
-+	uint8_t buffer[1024];
-+	struct spa_pod_builder builder;
-+	uint32_t n_params = 0;
-+	int res;
-+
-+	props = pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Input/Audio",
-+			PW_KEY_NODE_NAME, "compress-offload-forwarder-capture",
-+			PW_KEY_TARGET_OBJECT, d->source_name,
-+			PW_KEY_NODE_AUTOCONNECT, "true",
-+			PW_KEY_STREAM_CAPTURE_SINK, "true",
-+			PW_KEY_STREAM_DONT_REMIX, "true",
-+			"node.dont-reconnect", "true",
-+			NULL);
-+	if (props == NULL)
-+		return -errno;
-+	pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
-+
-+	d->capture = pw_stream_new(d->core, "compress offload forwarder capture", props);
-+	if (d->capture == NULL)
-+		return -errno;
-+	pw_stream_add_listener(d->capture, &d->capture_listener, &capture_events, d);
-+
-+	spa_pod_builder_init(&builder, buffer, sizeof(buffer));
-+	params[n_params++] = build_raw_format(d, &builder, SPA_PARAM_EnumFormat);
-+	res = pw_stream_connect(d->capture, PW_DIRECTION_INPUT, PW_ID_ANY,
-+			PW_STREAM_FLAG_AUTOCONNECT |
-+			PW_STREAM_FLAG_MAP_BUFFERS |
-+			PW_STREAM_FLAG_RT_PROCESS,
-+			params, n_params);
-+	if (res < 0)
-+		return res;
-+	pw_stream_set_active(d->capture, true);
-+	return 0;
-+}
-+
-+static void core_error(void *data, uint32_t id, int seq, int res, const char *message)
-+{
-+	struct module *module = data;
-+
-+	pw_log_error("compress-forwarder error id:%u seq:%d res:%d (%s): %s",
-+			id, seq, res, spa_strerror(res), message);
-+	if (id == PW_ID_CORE && res == -EPIPE)
-+		module_schedule_unload(module);
-+}
-+
-+static const struct pw_core_events core_events = {
-+	PW_VERSION_CORE_EVENTS,
-+	.error = core_error,
-+};
-+
-+static int module_compress_offload_forwarder_load(struct module *module)
-+{
-+	struct forwarder_data *d = module->user_data;
-+	int res;
-+
-+	PW_LOG_TOPIC_INIT(mod_topic);
-+	d->loop = pw_context_get_main_loop(module->impl->context);
-+	if (d->loop == NULL)
-+		return -EINVAL;
-+	d->activate_event = pw_loop_add_event(d->loop, playback_activate_event, d);
-+	if (d->activate_event == NULL)
-+		return -errno;
-+	d->core = pw_context_connect(module->impl->context, NULL, 0);
-+	if (d->core == NULL)
-+		return -errno;
-+	pw_core_add_listener(d->core, &d->core_listener, &core_events, module);
-+	d->target_id = PW_ID_ANY;
-+	d->registry = pw_core_get_registry(d->core, PW_VERSION_REGISTRY, 0);
-+	if (d->registry == NULL)
-+		return -errno;
-+	pw_registry_add_listener(d->registry, &d->registry_listener, &registry_events, d);
-+
-+	res = create_capture_stream(d);
-+	if (res < 0)
-+		return res;
-+
-+	pw_log_info("compress-forwarder loaded: source=%s monitor=%s target=%s codec=%s rate=%u channels=%u",
-+			d->source_name, d->monitor_name, d->target_name,
-+			d->codec, d->rate, d->channels);
-+	module_emit_loaded(module, 0);
-+	return 0;
-+}
-+
-+static int module_compress_offload_forwarder_unload(struct module *module)
-+{
-+	struct forwarder_data *d = module->user_data;
-+
-+	if (d->capture != NULL) {
-+		spa_hook_remove(&d->capture_listener);
-+		pw_stream_destroy(d->capture);
-+		d->capture = NULL;
-+	}
-+	destroy_playback_stream(d);
-+	if (d->registry != NULL) {
-+		spa_hook_remove(&d->registry_listener);
-+		pw_proxy_destroy((struct pw_proxy*)d->registry);
-+		d->registry = NULL;
-+	}
-+	if (d->core != NULL) {
-+		spa_hook_remove(&d->core_listener);
-+		pw_core_disconnect(d->core);
-+		d->core = NULL;
-+	}
-+	if (d->activate_event != NULL) {
-+		pw_loop_destroy_source(d->loop, d->activate_event);
-+		d->activate_event = NULL;
-+	}
-+	d->loop = NULL;
-+	return 0;
-+}
-+
-+static int module_compress_offload_forwarder_prepare(struct module *module)
-+{
-+	struct forwarder_data *d = module->user_data;
-+	struct pw_properties *props = module->props;
-+	const char *str;
-+
-+	PW_LOG_TOPIC_INIT(mod_topic);
-+	str = pw_properties_get(props, "source_sink");
-+	spa_scnprintf(d->source_name, sizeof(d->source_name), "%s",
-+			str ? str : "pal_speaker_compress");
-+	str = pw_properties_get(props, "target_sink");
-+	spa_scnprintf(d->target_name, sizeof(d->target_name), "%s",
-+			str ? str : "pal_sink_speaker_compress");
-+	str = pw_properties_get(props, "codec");
-+	spa_scnprintf(d->codec, sizeof(d->codec), "%s", str ? str : DEFAULT_CODEC);
-+	d->rate = pw_properties_get_uint32(props, "rate", DEFAULT_RATE);
-+	d->channels = pw_properties_get_uint32(props, "channels", DEFAULT_CHANNELS);
-+	d->bitrate = pw_properties_get_uint32(props, "bitrate", DEFAULT_BITRATE);
-+	d->block_size = pw_properties_get_uint32(props, "block_size", DEFAULT_BLOCK_SIZE);
-+	spa_scnprintf(d->monitor_name, sizeof(d->monitor_name), "%s.monitor", d->source_name);
-+
-+	if (!spa_streq(d->codec, "mp3")) {
-+		pw_log_warn("compress-forwarder only supports mp3 right now, requested codec=%s", d->codec);
-+		return -ENOTSUP;
-+	}
-+	if (d->channels == 0)
-+		d->channels = DEFAULT_CHANNELS;
-+	if (d->rate == 0)
-+		d->rate = DEFAULT_RATE;
-+	if (d->block_size == 0)
-+		d->block_size = DEFAULT_BLOCK_SIZE;
-+
-+	return 0;
-+}
-+
-+static const struct spa_dict_item module_compress_offload_forwarder_info[] = {
-+	{ PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
-+	{ PW_KEY_MODULE_DESCRIPTION, "Forward Pulse compress-offload sink data to PAL compress sink" },
-+	{ PW_KEY_MODULE_USAGE,       forwarder_options },
-+	{ PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
-+};
-+
-+DEFINE_MODULE_INFO(module_compress_offload_forwarder) = {
-+	.name       = "module-compress-offload-forwarder",
-+	.prepare    = module_compress_offload_forwarder_prepare,
-+	.load       = module_compress_offload_forwarder_load,
-+	.unload     = module_compress_offload_forwarder_unload,
-+	.properties = &SPA_DICT_INIT_ARRAY(module_compress_offload_forwarder_info),
-+	.data_size  = sizeof(struct forwarder_data),
-+};
-diff --git a/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
-new file mode 100644
-index 0000000..243cc8e
---- /dev/null
-+++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
-@@ -0,0 +1,293 @@
-+/* PipeWire */
-+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
-+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
-+
-+#include <errno.h>
-+#include <stdlib.h>
-+
-+#include <spa/utils/result.h>
-+#include <pipewire/pipewire.h>
-+
-+#include "../module.h"
-+
-+static const char *const pulse_module_options =
-+	"sink_name=<name of sink> "
-+	"sink_properties=<properties for the sink> "
-+	"target_sink=<node.name of the downstream compress-offload sink> "
-+	"codec=<codec name, default mp3> "
-+	"rate=<sample rate, default 44100> "
-+	"channels=<number of channels, default 2> "
-+	"bitrate=<bit rate, default 128000>";
-+
-+#define NAME "compress-offload-sink"
-+
-+PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
-+#define PW_LOG_TOPIC_DEFAULT mod_topic
-+
-+struct module_compress_offload_sink_data {
-+	struct pw_core *core;
-+	struct spa_hook core_listener;
-+
-+	struct pw_proxy *proxy;
-+	struct spa_hook proxy_listener;
-+};
-+
-+static void module_proxy_removed(void *data)
-+{
-+	struct module *module = data;
-+	struct module_compress_offload_sink_data *d = module->user_data;
-+
-+	pw_log_debug("compress-forwarder proxy removed: proxy=%p", d->proxy);
-+	pw_proxy_destroy(d->proxy);
-+}
-+
-+static void module_proxy_destroy(void *data)
-+{
-+	struct module *module = data;
-+	struct module_compress_offload_sink_data *d = module->user_data;
-+
-+	pw_log_debug("compress-forwarder proxy destroy: proxy=%p - scheduling module unload", d->proxy);
-+	spa_hook_remove(&d->proxy_listener);
-+	d->proxy = NULL;
-+	module_schedule_unload(module);
-+}
-+
-+static void module_proxy_bound_props(void *data, uint32_t global_id, const struct spa_dict *props)
-+{
-+	struct module *module = data;
-+	struct module_compress_offload_sink_data *d = module->user_data;
-+
-+	pw_log_debug("proxy %p bound id:%u module_index=%u", d->proxy, global_id, module->index);
-+	pw_log_debug("compress-forwarder node successfully created and bound, emitting loaded");
-+	module_emit_loaded(module, 0);
-+}
-+
-+static void module_proxy_error(void *data, int seq, int res, const char *message)
-+{
-+	struct module *module = data;
-+	struct module_compress_offload_sink_data *d = module->user_data;
-+
-+	pw_log_error("proxy %p error %d: %s", d->proxy, res, message);
-+	pw_proxy_destroy(d->proxy);
-+}
-+
-+static const struct pw_proxy_events proxy_events = {
-+	PW_VERSION_PROXY_EVENTS,
-+	.removed      = module_proxy_removed,
-+	.bound_props  = module_proxy_bound_props,
-+	.error        = module_proxy_error,
-+	.destroy      = module_proxy_destroy,
-+};
-+
-+static void module_core_error(void *data, uint32_t id, int seq, int res, const char *message)
-+{
-+	struct module *module = data;
-+
-+	pw_log_error("error id:%u seq:%d res:%d (%s): %s",
-+			id, seq, res, spa_strerror(res), message);
-+
-+	if (id == PW_ID_CORE && res == -EPIPE)
-+		module_schedule_unload(module);
-+}
-+
-+static const struct pw_core_events core_events = {
-+	PW_VERSION_CORE_EVENTS,
-+	.error = module_core_error,
-+};
-+
-+static int module_compress_offload_sink_load(struct module *module)
-+{
-+	struct module_compress_offload_sink_data *d = module->user_data;
-+
-+	pw_log_info("compress-forwarder load: node=%s target=%s codec=%s rate=%s channels=%s bitrate=%s",
-+			pw_properties_get(module->props, PW_KEY_NODE_NAME),
-+			pw_properties_get(module->props, "compress.target.object"),
-+			pw_properties_get(module->props, "codec.type"),
-+			pw_properties_get(module->props, "codec.sample_rate"),
-+			pw_properties_get(module->props, "codec.channels"),
-+			pw_properties_get(module->props, "codec.bit_rate"));
-+
-+	d->core = pw_context_connect(module->impl->context, NULL, 0);
-+	if (d->core == NULL) {
-+		pw_log_error("compress-forwarder core connect failed: errno=%d (%s)",
-+				errno, spa_strerror(-errno));
-+		return -errno;
-+	}
-+
-+	pw_log_debug("compress-forwarder core connected: core=%p", d->core);
-+	pw_core_add_listener(d->core, &d->core_listener, &core_events, module);
-+	pw_properties_setf(module->props, "pulse.module.id", "%u", module->index);
-+
-+	d->proxy = pw_core_create_object(d->core,
-+					 "adapter", PW_TYPE_INTERFACE_Node, PW_VERSION_NODE,
-+					 module->props ? &module->props->dict : NULL, 0);
-+	if (d->proxy == NULL) {
-+		pw_log_error("compress-forwarder adapter create failed: errno=%d (%s)",
-+				errno, spa_strerror(-errno));
-+		return -errno;
-+	}
-+
-+	pw_log_debug("compress-forwarder adapter create requested: proxy=%p - waiting for bound_props", d->proxy);
-+	pw_proxy_add_listener(d->proxy, &d->proxy_listener, &proxy_events, module);
-+	return SPA_RESULT_RETURN_ASYNC(0);
-+}
-+
-+static int module_compress_offload_sink_unload(struct module *module)
-+{
-+	struct module_compress_offload_sink_data *d = module->user_data;
-+
-+	pw_log_debug("compress-forwarder unload: proxy=%p core=%p - cleaning up", d->proxy, d->core);
-+	if (d->proxy != NULL) {
-+		spa_hook_remove(&d->proxy_listener);
-+		pw_proxy_destroy(d->proxy);
-+		d->proxy = NULL;
-+	}
-+	if (d->core != NULL) {
-+		spa_hook_remove(&d->core_listener);
-+		pw_core_disconnect(d->core);
-+		d->core = NULL;
-+	}
-+	return 0;
-+}
-+
-+static int module_compress_offload_sink_prepare(struct module * const module)
-+{
-+	struct pw_properties * const props = module->props;
-+	const char *str;
-+	uint32_t rate = 44100;
-+	uint32_t channels = 2;
-+	uint32_t bitrate = 128000;
-+
-+	PW_LOG_TOPIC_INIT(mod_topic);
-+
-+	if ((str = pw_properties_get(props, "sink_name")) != NULL) {
-+		pw_log_debug("compress-forwarder option: sink_name=%s", str);
-+		pw_properties_set(props, PW_KEY_NODE_NAME, str);
-+		pw_properties_set(props, "sink_name", NULL);
-+	} else {
-+		pw_log_debug("compress-forwarder option: sink_name missing, using default");
-+		pw_properties_set(props, PW_KEY_NODE_NAME, "compress-offload-sink");
-+	}
-+
-+	if ((str = pw_properties_get(props, "sink_properties")) != NULL) {
-+		pw_log_debug("compress-forwarder option: sink_properties=%s", str);
-+		module_args_add_props(props, str);
-+		pw_properties_set(props, "sink_properties", NULL);
-+	}
-+
-+	if ((str = pw_properties_get(props, "target_sink")) != NULL) {
-+		pw_log_debug("compress-forwarder option: target_sink=%s", str);
-+		pw_properties_set(props, "compress.target.object", str);
-+		pw_properties_set(props, "target_sink", NULL);
-+	} else {
-+		pw_log_warn("compress-forwarder option: target_sink missing; stream will not have explicit compress target");
-+	}
-+
-+	if ((str = pw_properties_get(props, "rate")) != NULL) {
-+		uint32_t v = (uint32_t)atoi(str);
-+		if (v > 0)
-+			rate = v;
-+		pw_properties_set(props, "rate", NULL);
-+	}
-+	if ((str = pw_properties_get(props, "channels")) != NULL) {
-+		uint32_t v = (uint32_t)atoi(str);
-+		if (v > 0)
-+			channels = v;
-+		pw_properties_set(props, "channels", NULL);
-+	}
-+	if ((str = pw_properties_get(props, "bitrate")) != NULL) {
-+		uint32_t v = (uint32_t)atoi(str);
-+		if (v > 0)
-+			bitrate = v;
-+		pw_properties_set(props, "bitrate", NULL);
-+	}
-+	if ((str = pw_properties_get(props, "channel_map")) != NULL) {
-+		pw_properties_set(props, "audio.position", str);
-+		pw_properties_set(props, "channel_map", NULL);
-+	} else {
-+		switch (channels) {
-+		case 1:
-+			pw_properties_set(props, "audio.position", "[ MONO ]");
-+			break;
-+		case 2:
-+			pw_properties_set(props, "audio.position", "[ FL FR ]");
-+			break;
-+		case 3:
-+			pw_properties_set(props, "audio.position", "[ FL FR LFE ]");
-+			break;
-+		case 4:
-+			pw_properties_set(props, "audio.position", "[ FL FR RL RR ]");
-+			break;
-+		case 5:
-+			pw_properties_set(props, "audio.position", "[ FL FR FC RL RR ]");
-+			break;
-+		case 6:
-+			pw_properties_set(props, "audio.position", "[ FL FR FC LFE RL RR ]");
-+			break;
-+		case 8:
-+			pw_properties_set(props, "audio.position", "[ FL FR FC LFE RL RR SL SR ]");
-+			break;
-+		default:
-+			break;
-+		}
-+	}
-+
-+	str = pw_properties_get(props, "codec");
-+	pw_properties_set(props, "codec.type", str ? str : "mp3");
-+	pw_properties_setf(props, "codec.sample_rate", "%u", rate);
-+	pw_properties_setf(props, "codec.channels",    "%u", channels);
-+	pw_properties_setf(props, "codec.bit_rate",    "%u", bitrate);
-+	pw_properties_set(props, "codec", NULL);
-+
-+	if (pw_properties_get(props, PW_KEY_MEDIA_CLASS) == NULL)
-+		pw_properties_set(props, PW_KEY_MEDIA_CLASS, "Audio/Sink");
-+	if (pw_properties_get(props, PW_KEY_NODE_DESCRIPTION) == NULL)
-+		pw_properties_setf(props, PW_KEY_NODE_DESCRIPTION, "%s (compress offload)",
-+				pw_properties_get(props, PW_KEY_NODE_NAME));
-+
-+	/*
-+	 * Advertise this node as an encoded-only sink so WirePlumber's
-+	 * canPassthrough() allows linking compress streams to it.
-+	 * audio.format=S16LE is kept as the synthetic PCM sample_spec that
-+	 * Pulse clients see in pactl; no PCM conversion ever occurs.
-+	 */
-+	pw_properties_set(props, PW_KEY_AUDIO_FORMAT,                "S16LE");
-+	pw_properties_setf(props, PW_KEY_AUDIO_RATE,                 "%u", rate);
-+	pw_properties_setf(props, PW_KEY_AUDIO_CHANNELS,             "%u", channels);
-+	pw_properties_set(props, "item.node.supports-encoded-fmts",  "true");
-+	pw_properties_set(props, PW_KEY_NODE_VIRTUAL,                "true");
-+	pw_properties_set(props, PW_KEY_PRIORITY_SESSION,            "1");
-+	pw_properties_set(props, PW_KEY_PRIORITY_DRIVER,             "1");
-+	pw_properties_set(props, "monitor.channel-volumes",          "true");
-+	pw_properties_set(props, "monitor.passthrough",              "true");
-+	pw_properties_set(props, "compress.offload",                 "true");
-+	pw_properties_set(props, PW_KEY_FACTORY_NAME,                "support.null-audio-sink");
-+
-+	pw_log_info("prepared compress-forwarder alias: name=%s target=%s codec=%s rate=%u channels=%u bitrate=%u media.class=%s audio.format=%s virtual=%s factory=%s",
-+			pw_properties_get(props, PW_KEY_NODE_NAME),
-+			pw_properties_get(props, "compress.target.object"),
-+			pw_properties_get(props, "codec.type"),
-+			rate, channels, bitrate,
-+			pw_properties_get(props, PW_KEY_MEDIA_CLASS),
-+			pw_properties_get(props, PW_KEY_AUDIO_FORMAT),
-+			pw_properties_get(props, PW_KEY_NODE_VIRTUAL),
-+			pw_properties_get(props, PW_KEY_FACTORY_NAME));
-+
-+	return 0;
-+}
-+
-+static const struct spa_dict_item module_compress_offload_sink_info[] = {
-+	{ PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
-+	{ PW_KEY_MODULE_DESCRIPTION, "Pulse-visible alias sink for compressed offload playback" },
-+	{ PW_KEY_MODULE_USAGE,       pulse_module_options },
-+	{ PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
-+};
-+
-+DEFINE_MODULE_INFO(module_compress_offload_sink) = {
-+	.name       = "module-compress-offload-sink",
-+	.prepare    = module_compress_offload_sink_prepare,
-+	.load       = module_compress_offload_sink_load,
-+	.unload     = module_compress_offload_sink_unload,
-+	.properties = &SPA_DICT_INIT_ARRAY(module_compress_offload_sink_info),
-+	.data_size  = sizeof(struct module_compress_offload_sink_data),
-+};
-diff --git a/src/modules/module-protocol-pulse/pulse-server.c b/src/modules/module-protocol-pulse/pulse-server.c
-index eb3233b..61f0dfb 100644
---- a/src/modules/module-protocol-pulse/pulse-server.c
-+++ b/src/modules/module-protocol-pulse/pulse-server.c
-@@ -84,6 +84,9 @@ struct temporary_move_data {
- 	uint8_t used:1;
- };
-
-+/* Buffer size used for compress-offload streams (frame_size == 1). */
-+#define COMPRESS_OFFLOAD_BUF_SIZE  16484u
-+
- static struct sample *find_sample(struct impl *impl, uint32_t index, const char *name)
- {
- 	union pw_map_item *item;
-@@ -1199,10 +1202,18 @@ static const struct spa_pod *get_buffers_param(struct stream *s,
- 	blocks = 1;
- 	stride = s->frame_size;
-
-+	/* compressed offload uses byte granularity */
-+	if (s->frame_size == 1) {
-+		size = COMPRESS_OFFLOAD_BUF_SIZE;
-+		pw_log_debug("[%s] get_buffers_param: compress offload path size=%u", s->client->name, size);
-+		goto build_buffers_param;
-+	}
-+
- 	size = defs->quantum_limit * s->frame_size;
-
- 	pw_log_info("[%s] stride %d size %u", s->client->name, stride, size);
-
-+build_buffers_param:
- 	param = spa_pod_builder_add_object(b,
- 			SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,
- 			SPA_PARAM_BUFFERS_buffers, SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,
-@@ -1228,6 +1239,23 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
- 	if (id != SPA_PARAM_Format || param == NULL)
- 		return;
-
-+	/* For compress-offload streams, force byte-granularity regardless
-+	 * of negotiated format (we connect with S16LE but data is compressed). */
-+	{
-+		const char *co = stream->props ?
-+			pw_properties_get(stream->props, "compress.offload") : NULL;
-+		if (co && pw_properties_parse_bool(co)) {
-+			uint32_t media_type = 0, media_subtype = 0;
-+			spa_format_parse(param, &media_type, &media_subtype);
-+			stream->frame_size = 1;
-+			stream->rate = stream->ss.rate ? stream->ss.rate :
-+				pw_properties_get_uint32(stream->props, "codec.sample_rate", 44100);
-+			pw_log_debug("[%s] compress-offload stream_param_changed: forcing frame_size=1 rate=%u subtype=%u",
-+				stream->client->name, stream->rate, media_subtype);
-+			goto stream_param_format_done;
-+		}
-+	}
-+
- 	if ((res = format_parse_param(param, false, &stream->ss, &stream->map, NULL, NULL)) < 0) {
- 		pw_stream_set_error(stream->stream, res, "format not supported");
- 		return;
-@@ -1243,6 +1271,9 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
- 		return;
- 	}
- 	stream->rate = stream->ss.rate;
-+stream_param_format_done:
-+	pw_log_debug("[%s] stream param done: frame_size=%u rate=%u ss.format=%u",
-+			stream->client->name, stream->frame_size, stream->rate, stream->ss.format);
-
- 	if (stream->create_tag != SPA_ID_INVALID) {
- 		struct pw_manager_object *peer;
-@@ -1583,6 +1614,98 @@ static void log_format_info(struct impl *impl, enum spa_log_level level, struct
- 				impl, it->key, it->value);
- }
-
-+static const struct spa_pod *build_compress_offload_format(struct spa_pod_builder *b,
-+		uint32_t id, const struct pw_properties *props, uint32_t *rate)
-+{
-+	const char *codec;
-+	struct spa_audio_info info;
-+	uint32_t sample_rate, channels, bitrate;
-+
-+	spa_zero(info);
-+	info.media_type = SPA_MEDIA_TYPE_audio;
-+	codec = pw_properties_get(props, "codec.type");
-+	sample_rate = pw_properties_get_uint32(props, "codec.sample_rate", 44100);
-+	channels = pw_properties_get_uint32(props, "codec.channels", 2);
-+	bitrate = pw_properties_get_uint32(props, "codec.bit_rate", 128000);
-+
-+	if (codec == NULL || spa_streq(codec, "mp3")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
-+		info.info.mp3.rate = sample_rate;
-+		info.info.mp3.channels = channels;
-+		info.info.mp3.channel_mode = channels == 1 ?
-+			SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
-+	} else if (spa_streq(codec, "aac") || spa_streq(codec, "aac_adts")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
-+		info.info.aac.rate = sample_rate;
-+		info.info.aac.channels = channels;
-+		info.info.aac.bitrate = bitrate;
-+		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;
-+	} else if (spa_streq(codec, "aac_adif")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
-+		info.info.aac.rate = sample_rate;
-+		info.info.aac.channels = channels;
-+		info.info.aac.bitrate = bitrate;
-+		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_ADIF;
-+	} else if (spa_streq(codec, "aac_latm")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
-+		info.info.aac.rate = sample_rate;
-+		info.info.aac.channels = channels;
-+		info.info.aac.bitrate = bitrate;
-+		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_MP4LATM;
-+	} else if (spa_streq(codec, "flac")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_flac;
-+		info.info.flac.rate = sample_rate;
-+		info.info.flac.channels = channels;
-+	} else if (spa_streq(codec, "vorbis")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_vorbis;
-+		info.info.vorbis.rate = sample_rate;
-+		info.info.vorbis.channels = channels;
-+	} else if (spa_streq(codec, "opus")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_opus;
-+		info.info.opus.rate = sample_rate;
-+		info.info.opus.channels = channels;
-+	} else if (spa_streq(codec, "wma") || spa_streq(codec, "wma_std")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_wma;
-+		info.info.wma.rate = sample_rate;
-+		info.info.wma.channels = channels;
-+		info.info.wma.bitrate = bitrate;
-+		info.info.wma.profile = SPA_AUDIO_WMA_PROFILE_WMA9;
-+	} else if (spa_streq(codec, "wma_pro")) {
-+		info.media_subtype = SPA_MEDIA_SUBTYPE_wma;
-+		info.info.wma.rate = sample_rate;
-+		info.info.wma.channels = channels;
-+		info.info.wma.bitrate = bitrate;
-+		info.info.wma.profile = SPA_AUDIO_WMA_PROFILE_WMA9_PRO;
-+	} else {
-+		errno = ENOTSUP;
-+		return NULL;
-+	}
-+	if (rate != NULL)
-+		*rate = sample_rate;
-+	return spa_format_audio_build(b, id, &info);
-+}
-+
-+static void synthesize_compress_offload_spec(struct sample_spec *ss,
-+		struct channel_map *map, const struct pw_properties *props)
-+{
-+	uint32_t channels;
-+	ss->format = SPA_AUDIO_FORMAT_S16_LE;
-+	ss->rate = pw_properties_get_uint32(props, "codec.sample_rate", 44100);
-+	channels = pw_properties_get_uint32(props, "codec.channels", 2);
-+	ss->channels = (uint8_t)(channels > 0 ? channels : 2);
-+	spa_zero(*map);
-+	switch (ss->channels) {
-+	case 1: channel_map_parse("mono", map); break;
-+	case 2: channel_map_parse("stereo", map); break;
-+	case 3: channel_map_parse("surround-21", map); break;
-+	case 4: channel_map_parse("surround-40", map); break;
-+	case 5: channel_map_parse("surround-50", map); break;
-+	case 6: channel_map_parse("surround-51", map); break;
-+	case 8: channel_map_parse("surround-71", map); break;
-+	default: channel_map_parse("stereo", map); ss->channels = 2; break;
-+	}
-+}
-+
- static int do_create_playback_stream(struct client *client, uint32_t command, uint32_t tag, struct message *m)
- {
- 	struct impl *impl = client->impl;
-@@ -1609,7 +1732,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 		muted_set = false,
- 		fail_on_suspend = false,
- 		relative_volume = false,
--		passthrough = false;
-+		passthrough = false,
-+		compress_offload = false;
- 	struct volume volume;
- 	struct pw_properties *props = NULL;
- 	uint8_t n_formats = 0;
-@@ -1668,6 +1792,68 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 	}
- 	o = find_device(client, sink_index, sink_name, true, &is_monitor);
-
-+	if (o != NULL) {
-+		const struct pw_node_info *ninfo = o->info;
-+		const struct spa_dict *sp = (ninfo && ninfo->props) ? ninfo->props : NULL;
-+		char node_name_buf[256] = {0};
-+		const char *node_name;
-+		const char *co;
-+		const char *_nn = pw_properties_get(o->props, PW_KEY_NODE_NAME);
-+
-+		if (_nn)
-+			snprintf(node_name_buf, sizeof(node_name_buf), "%s", _nn);
-+		node_name = node_name_buf[0] ? node_name_buf : NULL;
-+		co = sp ? spa_dict_lookup(sp, "compress.offload") : NULL;
-+		pw_log_debug("[%s] compress-offload check: node=%s ninfo=%p co=%s",
-+				client->name, node_name ? node_name : "(null)", ninfo, co ? co : "(null)");
-+		if (co && spa_atob(co)) {
-+			char target_buf[256] = {0};
-+			char codec_buf[64] = {0};
-+			char rate_buf[32] = {0};
-+			char channels_buf[16] = {0};
-+			char bitrate_buf[32] = {0};
-+			const char *target;
-+			const char *codec;
-+			const char *rate_s;
-+			const char *channels;
-+			const char *bitrate;
-+			const char *_s;
-+
-+			if ((_s = spa_dict_lookup(sp, "compress.target.object")) != NULL)
-+				snprintf(target_buf, sizeof(target_buf), "%s", _s);
-+			if ((_s = spa_dict_lookup(sp, "codec.type")) != NULL)
-+				snprintf(codec_buf, sizeof(codec_buf), "%s", _s);
-+			if ((_s = spa_dict_lookup(sp, "codec.sample_rate")) != NULL)
-+				snprintf(rate_buf, sizeof(rate_buf), "%s", _s);
-+			if ((_s = spa_dict_lookup(sp, "codec.channels")) != NULL)
-+				snprintf(channels_buf, sizeof(channels_buf), "%s", _s);
-+			if ((_s = spa_dict_lookup(sp, "codec.bit_rate")) != NULL)
-+				snprintf(bitrate_buf, sizeof(bitrate_buf), "%s", _s);
-+
-+			target = target_buf[0] ? target_buf : NULL;
-+			codec = codec_buf[0] ? codec_buf : NULL;
-+			rate_s = rate_buf[0] ? rate_buf : NULL;
-+			channels = channels_buf[0] ? channels_buf : NULL;
-+			bitrate = bitrate_buf[0] ? bitrate_buf : NULL;
-+
-+			pw_properties_set(props, "compress.offload", "true");
-+			pw_properties_set(props, "item.node.supports-encoded-fmts", "true");
-+			pw_properties_set(props, PW_KEY_MEDIA_TYPE, "Audio");
-+			pw_properties_set(props, PW_KEY_MEDIA_CATEGORY, "Playback");
-+			pw_properties_set(props, PW_KEY_MEDIA_ROLE, "Music");
-+			if (codec) pw_properties_set(props, "codec.type", codec);
-+			if (rate_s) pw_properties_set(props, "codec.sample_rate", rate_s);
-+			if (channels) pw_properties_set(props, "codec.channels", channels);
-+			if (bitrate) pw_properties_set(props, "codec.bit_rate", bitrate);
-+
-+			pw_log_info("[%s] detected compress-offload sink=%s target=%s codec=%s",
-+					client->name, node_name ? node_name : "(null)",
-+					target ? target : "(null)", codec ? codec : "(null)");
-+			pw_log_debug("[%s] compress target=%s - leaving sink_name=%s for virtual sink routing",
-+					client->name, target ? target : "(null)", sink_name ? sink_name : "(null)");
-+		}
-+	}
-+
- 	spa_zero(fix_ss);
- 	spa_zero(fix_map);
- 	if ((fix_format || fix_rate || fix_channels) && o != NULL) {
-@@ -1715,6 +1901,9 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 			goto error_protocol;
- 	}
-
-+	compress_offload = pw_properties_parse_bool(
-+			pw_properties_get(props, "compress.offload"));
-+
- 	if (client->version >= 21) {
- 		if (message_get(m,
- 				TAG_U8, &n_formats,
-@@ -1732,7 +1921,9 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 						TAG_INVALID) < 0)
- 					goto error_protocol;
-
--				if (n_params < MAX_FORMATS &&
-+				if (compress_offload) {
-+					log_format_info(impl, SPA_LOG_LEVEL_DEBUG, &format);
-+				} else if (n_params < MAX_FORMATS &&
- 				    (params[n_params] = format_info_build_param(&b,
- 						SPA_PARAM_EnumFormat, &format, &r)) != NULL) {
- 					n_params++;
-@@ -1746,7 +1937,23 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 			}
- 		}
- 	}
--	if (sample_spec_valid(&ss)) {
-+	if (compress_offload) {
-+		uint32_t compress_rate = 0;
-+		if (n_params < MAX_FORMATS &&
-+		    (params[n_params] = build_compress_offload_format(&b,
-+					SPA_PARAM_EnumFormat, props, &compress_rate)) != NULL) {
-+			n_params++;
-+			n_valid_formats++;
-+			ss_rate = rate = compress_rate;
-+			synthesize_compress_offload_spec(&ss, &map, props);
-+			pw_log_debug("[%s] synthesized compress-offload format codec=%s rate=%u channels=%u",
-+					client->name, pw_properties_get(props, "codec.type"), compress_rate,
-+					pw_properties_get_uint32(props, "codec.channels", 2));
-+		} else {
-+			pw_log_warn("%p: unsupported compress codec:%s",
-+					impl, pw_properties_get(props, "codec.type"));
-+		}
-+	} else if (sample_spec_valid(&ss)) {
- 		struct sample_spec sfix = ss;
- 		struct channel_map mfix = map;
-
-@@ -1770,6 +1977,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 	if (m->offset != m->length)
- 		goto error_protocol;
-
-+	pw_log_debug("[%s] format check: n_valid=%u n_params=%u compress=%d passthrough=%d",
-+			client->name, n_valid_formats, n_params, compress_offload, passthrough);
- 	if (n_valid_formats == 0)
- 		goto error_no_formats;
-
-@@ -1806,6 +2015,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 	flags = 0;
- 	if (no_move)
- 		flags |= PW_STREAM_FLAG_DONT_RECONNECT;
-+	if (compress_offload)
-+		flags |= PW_STREAM_FLAG_NO_CONVERT;
-
- 	if (sink_name != NULL) {
- 		if (o != NULL)
-@@ -1833,14 +2044,35 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
- 			&stream->stream_listener,
- 			&stream_events, stream);
-
--	pw_stream_connect(stream->stream,
--			PW_DIRECTION_OUTPUT,
--			SPA_ID_INVALID,
--			flags |
--			PW_STREAM_FLAG_AUTOCONNECT |
--			PW_STREAM_FLAG_RT_PROCESS |
--			PW_STREAM_FLAG_MAP_BUFFERS,
--			params, n_params);
-+	if (compress_offload) {
-+		uint8_t raw_buf[256];
-+		struct spa_pod_builder rb = SPA_POD_BUILDER_INIT(raw_buf, sizeof(raw_buf));
-+		struct spa_audio_info_raw raw_info = {
-+			.format = SPA_AUDIO_FORMAT_S16_LE,
-+			.rate = ss.rate ? ss.rate : 44100,
-+			.channels = ss.channels ? ss.channels : 2,
-+		};
-+		const struct spa_pod *raw_params[1];
-+		raw_params[0] = spa_format_audio_raw_build(&rb, SPA_PARAM_EnumFormat, &raw_info);
-+		pw_log_debug("[%s] pw_stream_connect: using raw S16LE param for compress sink", client->name);
-+		pw_stream_connect(stream->stream,
-+				PW_DIRECTION_OUTPUT,
-+				SPA_ID_INVALID,
-+				flags |
-+				PW_STREAM_FLAG_AUTOCONNECT |
-+				PW_STREAM_FLAG_RT_PROCESS |
-+				PW_STREAM_FLAG_MAP_BUFFERS,
-+				raw_params, 1);
-+	} else {
-+		pw_stream_connect(stream->stream,
-+				PW_DIRECTION_OUTPUT,
-+				SPA_ID_INVALID,
-+				flags |
-+				PW_STREAM_FLAG_AUTOCONNECT |
-+				PW_STREAM_FLAG_RT_PROCESS |
-+				PW_STREAM_FLAG_MAP_BUFFERS,
-+				params, n_params);
-+	}
-
- 	stream_update_tag_param(stream);
-
---
-2.43.0
-
+From 867d36a330d78e4e55348983eb0701c5d3cd7fa1 Mon Sep 17 00:00:00 2001
+From: Harsh Rai <harsh.rai@oss.qualcomm.com>
+Date: Fri, 23 Oct 2026 17:22:01 +0530
+Subject: [PATCH 1/4] spa: expose the AAC audio object type
+
+Add an audio object type field to spa_audio_info_aac and define the
+matching SPA format property.
+
+Parse the property when an AAC format pod is received and include it
+when building an AAC format pod. Omit the property when its value is
+zero so existing AAC format descriptions remain unchanged when no
+object type is available.
+
+The audio object type identifies the MPEG-4 AAC profile independently
+of the transport format, allowing raw AAC and ADTS streams to carry the
+profile selected by the client.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
+Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
+---
+ spa/include/spa/param/audio/aac-utils.h | 6 +++++-
+ spa/include/spa/param/audio/aac.h       | 1 +
+ spa/include/spa/param/format-types.h    | 2 ++
+ spa/include/spa/param/format.h          | 2 ++
+ 4 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/spa/include/spa/param/audio/aac-utils.h b/spa/include/spa/param/audio/aac-utils.h
+index 3ec362d19..7be3a7c94 100644
+--- a/spa/include/spa/param/audio/aac-utils.h
++++ b/spa/include/spa/param/audio/aac-utils.h
+@@ -36,7 +36,8 @@ spa_format_audio_aac_parse(const struct spa_pod *format, struct spa_audio_info_a
+ 			SPA_FORMAT_AUDIO_rate,		SPA_POD_OPT_Int(&info->rate),
+ 			SPA_FORMAT_AUDIO_channels,	SPA_POD_OPT_Int(&info->channels),
+ 			SPA_FORMAT_AUDIO_bitrate,	SPA_POD_OPT_Int(&info->bitrate),
+-			SPA_FORMAT_AUDIO_AAC_streamFormat,	SPA_POD_OPT_Id(&info->stream_format));
++			SPA_FORMAT_AUDIO_AAC_streamFormat,	SPA_POD_OPT_Id(&info->stream_format),
++			SPA_FORMAT_AUDIO_AAC_audioObjectType,	SPA_POD_OPT_Int(&info->audio_object_type));
+ 
+ 	return res;
+ }
+@@ -64,6 +65,9 @@ spa_format_audio_aac_build(struct spa_pod_builder *builder, uint32_t id,
+ 	if (info->stream_format != 0)
+ 		spa_pod_builder_add(builder,
+ 			SPA_FORMAT_AUDIO_AAC_streamFormat,	SPA_POD_Id(info->stream_format), 0);
++	if (info->audio_object_type != 0)
++		spa_pod_builder_add(builder,
++			SPA_FORMAT_AUDIO_AAC_audioObjectType,	SPA_POD_Int(info->audio_object_type), 0);
+ 	return (struct spa_pod*)spa_pod_builder_pop(builder, &f);
+ }
+ 
+diff --git a/spa/include/spa/param/audio/aac.h b/spa/include/spa/param/audio/aac.h
+index 1a7fb1612..db6ca083a 100644
+--- a/spa/include/spa/param/audio/aac.h
++++ b/spa/include/spa/param/audio/aac.h
+@@ -41,6 +41,7 @@ struct spa_audio_info_aac {
+ 	uint32_t channels;				/*< number of channels */
+ 	uint32_t bitrate;				/*< stream bitrate */
+ 	enum spa_audio_aac_stream_format stream_format;	/*< AAC audio stream format */
++	uint32_t audio_object_type;			/*< MPEG-4 audio object type */
+ };
+ 
+ #define SPA_AUDIO_INFO_AAC_INIT(...)		((struct spa_audio_info_aac) { __VA_ARGS__ })
+diff --git a/spa/include/spa/param/format-types.h b/spa/include/spa/param/format-types.h
+index 1ca4f729b..99f60fcb7 100644
+--- a/spa/include/spa/param/format-types.h
++++ b/spa/include/spa/param/format-types.h
+@@ -144,6 +144,8 @@ static const struct spa_type_info spa_type_format[] = {
+ 
+ 	{ SPA_FORMAT_AUDIO_AAC_streamFormat, SPA_TYPE_Id, SPA_TYPE_INFO_FORMAT_AUDIO_AAC_BASE "streamFormat",
+ 		spa_type_audio_aac_stream_format },
++	{ SPA_FORMAT_AUDIO_AAC_audioObjectType, SPA_TYPE_Int,
++		SPA_TYPE_INFO_FORMAT_AUDIO_AAC_BASE "audioObjectType", NULL },
+ 	{ SPA_FORMAT_AUDIO_WMA_profile, SPA_TYPE_Id, SPA_TYPE_INFO_FORMAT_AUDIO_WMA_BASE "profile",
+ 		spa_type_audio_wma_profile },
+ 	{ SPA_FORMAT_AUDIO_AMR_bandMode, SPA_TYPE_Id, SPA_TYPE_INFO_FORMAT_AUDIO_AMR_BASE "bandMode",
+diff --git a/spa/include/spa/param/format.h b/spa/include/spa/param/format.h
+index bef5116e9..d5e0f00c7 100644
+--- a/spa/include/spa/param/format.h
++++ b/spa/include/spa/param/format.h
+@@ -110,6 +110,8 @@ enum spa_format {
+ 	SPA_FORMAT_AUDIO_blockAlign,    	/**< audio data block alignment (Int) */
+ 
+ 	SPA_FORMAT_AUDIO_AAC_streamFormat,	/**< AAC stream format, (Id enum spa_audio_aac_stream_format) */
++	SPA_FORMAT_AUDIO_AAC_audioObjectType = SPA_FORMAT_START_Audio + 0x100,
++						/**< AAC audio object type (Int) */
+ 
+ 	SPA_FORMAT_AUDIO_WMA_profile,		/**< WMA profile (Id enum spa_audio_wma_profile) */
+ 
+-- 
+GitLab
+
+
+From a009b6ba406ce7f12c4cda8ab52d6fb18a8db29a Mon Sep 17 00:00:00 2001
+From: Harsh Rai <harsh.rai@oss.qualcomm.com>
+Date: Fri, 23 Oct 2026 17:22:01 +0530
+Subject: [PATCH 2/4] pulse-server: describe MP3 and AAC encoded formats
+
+Add Pulse format encodings for MP3, AAC with ADTS transport, and raw
+AAC.
+
+Convert PipeWire MP3 and AAC format pods into Pulse format information,
+including sample rate, channel count, bitrate, AAC transport format,
+and AAC audio object type. Build the corresponding PipeWire format pods
+when a Pulse client selects one of these encoded formats.
+
+This keeps encoded stream negotiation in the existing Pulse format
+conversion layer and preserves codec parameters without treating the
+payload as PCM audio.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
+Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
+---
+ src/modules/module-protocol-pulse/format.c | 115 +++++++++++++++++++++
+ src/modules/module-protocol-pulse/format.h |   3 +
+ 2 files changed, 118 insertions(+)
+
+diff --git a/src/modules/module-protocol-pulse/format.c b/src/modules/module-protocol-pulse/format.c
+index 913cfe996..d16f824d0 100644
+--- a/src/modules/module-protocol-pulse/format.c
++++ b/src/modules/module-protocol-pulse/format.c
+@@ -484,6 +484,9 @@ static const struct encoding_info encoding_names[] = {
+ 	[ENCODING_MPEG2_AAC_IEC61937] = { "MPEG2-AAC-IEC61937", SPA_AUDIO_IEC958_CODEC_MPEG2_AAC },
+ 	[ENCODING_TRUEHD_IEC61937] = { "TRUEHD-IEC61937", SPA_AUDIO_IEC958_CODEC_TRUEHD },
+ 	[ENCODING_DTSHD_IEC61937] = { "DTSHD-IEC61937", SPA_AUDIO_IEC958_CODEC_DTSHD },
++	[ENCODING_MP3] = { "MP3", SPA_ID_INVALID },
++	[ENCODING_AAC] = { "AAC", SPA_ID_INVALID },
++	[ENCODING_AAC_ADTS] = { "AAC-ADTS", SPA_ID_INVALID },
+ };
+ 
+ const char *format_encoding2name(enum encoding enc)
+@@ -775,6 +778,39 @@ static int format_info_iec958_from_param(struct format_info *info, struct spa_po
+ 	return add_int(info, "format.rate", param, SPA_FORMAT_AUDIO_rate);
+ }
+ 
++static int format_info_encoded_from_param(struct format_info *info, struct spa_pod *param,
++		uint32_t index, enum encoding encoding)
++{
++	struct spa_audio_info audio_info;
++
++	if (index > 0)
++		return -ENOENT;
++	if (spa_format_audio_parse(param, &audio_info) < 0)
++		return -ENOTSUP;
++	if ((info->props = pw_properties_new(NULL, NULL)) == NULL)
++		return -errno;
++	info->encoding = encoding;
++
++	switch (encoding) {
++	case ENCODING_MP3:
++		pw_properties_setf(info->props, "format.rate", "%u", audio_info.info.mp3.rate);
++		pw_properties_setf(info->props, "format.channels", "%u", audio_info.info.mp3.channels);
++		break;
++	case ENCODING_AAC:
++	case ENCODING_AAC_ADTS:
++		pw_properties_setf(info->props, "format.rate", "%u", audio_info.info.aac.rate);
++		pw_properties_setf(info->props, "format.channels", "%u", audio_info.info.aac.channels);
++		pw_properties_setf(info->props, "format.bit_rate", "%u", audio_info.info.aac.bitrate);
++		pw_properties_set(info->props, "format.stream_format",
++				audio_info.info.aac.stream_format == SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS ?
++				"\"adts\"" : "\"raw\"");
++		break;
++	default:
++		return -ENOTSUP;
++	}
++	return 0;
++}
++
+ int format_info_from_param(struct format_info *info, struct spa_pod *param, uint32_t index)
+ {
+ 	uint32_t media_type, media_subtype;
+@@ -793,6 +829,20 @@ int format_info_from_param(struct format_info *info, struct spa_pod *param, uint
+ 	case SPA_MEDIA_SUBTYPE_iec958:
+ 		res = format_info_iec958_from_param(info, param, index);
+ 		break;
++	case SPA_MEDIA_SUBTYPE_mp3:
++		res = format_info_encoded_from_param(info, param, index, ENCODING_MP3);
++		break;
++	case SPA_MEDIA_SUBTYPE_aac:
++	{
++		struct spa_audio_info audio_info;
++
++		if (spa_format_audio_parse(param, &audio_info) < 0)
++			return -ENOTSUP;
++		res = format_info_encoded_from_param(info, param, index,
++				audio_info.info.aac.stream_format == SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS ?
++				ENCODING_AAC_ADTS : ENCODING_AAC);
++		break;
++	}
+ 	default:
+ 		return -ENOTSUP;
+ 	}
+@@ -836,6 +886,36 @@ static int format_info_get_rate(const struct format_info *info)
+ 	return -ENOTSUP;
+ }
+ 
++static uint32_t format_info_get_u32_prop(const struct format_info *info,
++		const char *key, uint32_t default_value)
++{
++	const char *str, *val;
++	struct spa_json it[2];
++	int len, value;
++
++	if (info->props == NULL || (str = pw_properties_get(info->props, key)) == NULL)
++		return default_value;
++	if ((len = spa_json_begin(&it[0], str, strlen(str), &val)) <= 0)
++		return default_value;
++	if (spa_json_is_int(val, len) && spa_json_parse_int(val, len, &value) > 0 && value > 0)
++		return (uint32_t)value;
++	return default_value;
++}
++
++static bool format_info_string_prop_equals(const struct format_info *info,
++		const char *key, const char *value)
++{
++	const char *str, *val;
++	struct spa_json it[2];
++	int len;
++
++	if (info->props == NULL || (str = pw_properties_get(info->props, key)) == NULL)
++		return false;
++	if ((len = spa_json_begin(&it[0], str, strlen(str), &val)) > 0 && spa_json_is_string(val, len))
++		return strlen(value) == (size_t)len - 2 && strncasecmp(val + 1, value, len - 2) == 0;
++	return spa_streq(str, value);
++}
++
+ int format_info_to_spec(const struct format_info *info, struct sample_spec *ss,
+ 			  struct channel_map *map)
+ {
+@@ -926,6 +1006,41 @@ const struct spa_pod *format_info_build_param(struct spa_pod_builder *b, uint32_
+ 		param = spa_format_audio_iec958_build(b, id, &i);
+ 		break;
+ 	}
++	case ENCODING_MP3:
++	case ENCODING_AAC:
++	case ENCODING_AAC_ADTS:
++	{
++		struct spa_audio_info audio_info;
++		uint32_t channels;
++
++		spa_zero(audio_info);
++		audio_info.media_type = SPA_MEDIA_TYPE_audio;
++		if ((res = format_info_get_rate(info)) <= 0) {
++			errno = -res;
++			return NULL;
++		}
++		channels = format_info_get_u32_prop(info, "format.channels", 2);
++		if (info->encoding == ENCODING_MP3) {
++			audio_info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
++			audio_info.info.mp3.rate = res;
++			audio_info.info.mp3.channels = channels;
++			audio_info.info.mp3.channel_mode = channels == 1 ?
++				SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
++		} else {
++			audio_info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++			audio_info.info.aac.rate = res;
++			audio_info.info.aac.channels = channels;
++			audio_info.info.aac.bitrate = format_info_get_u32_prop(info, "format.bit_rate", 128000);
++			audio_info.info.aac.stream_format =
++					info->encoding == ENCODING_AAC_ADTS ||
++					format_info_string_prop_equals(info, "format.stream_format", "adts") ?
++					SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS :
++					SPA_AUDIO_AAC_STREAM_FORMAT_RAW;
++		}
++		*rate = res;
++		param = spa_format_audio_build(b, id, &audio_info);
++		break;
++	}
+ 	default:
+ 		errno = ENOTSUP;
+ 		break;
+diff --git a/src/modules/module-protocol-pulse/format.h b/src/modules/module-protocol-pulse/format.h
+index c91ec7076..d873a8065 100644
+--- a/src/modules/module-protocol-pulse/format.h
++++ b/src/modules/module-protocol-pulse/format.h
+@@ -163,6 +163,9 @@ enum encoding {
+ 	ENCODING_MPEG2_AAC_IEC61937,
+ 	ENCODING_TRUEHD_IEC61937,
+ 	ENCODING_DTSHD_IEC61937,
++	ENCODING_MP3,
++	ENCODING_AAC,
++	ENCODING_AAC_ADTS,
+ 	ENCODING_MAX,
+ 	ENCODING_INVALID = -1,
+ };
+-- 
+GitLab
+
+
+From a06592eb77ded07fe3673fd1a1098304f1995a35 Mon Sep 17 00:00:00 2001
+From: Harsh Rai <harsh.rai@oss.qualcomm.com>
+Date: Fri, 23 Oct 2026 17:45:41 +0530
+Subject: [PATCH 3/4] pulse-server: add compressed-offload sink modules
+
+Add a Pulse-visible sink module for compressed playback and a forwarder
+module that sends its encoded stream to a configured compressed-offload
+sink.
+
+The sink module creates the Pulse endpoint and carries codec properties
+for MP3, AAC ADTS, and raw AAC streams. The forwarder observes the
+encoded monitor stream, preserves packet data, creates a matching target
+stream, and forwards codec metadata without decoding or converting the
+payload.
+
+Handle target discovery, stream creation, pending data, client removal,
+target removal, state transitions, and module cleanup so the forwarding
+stream is destroyed when either side disappears.
+
+Register both modules in the protocol-pulse build and keep their module
+arguments and descriptions independent of any particular hardware or
+backend implementation.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
+Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
+---
+ src/modules/meson.build                       |    2 +
+ .../pulse-module-compress-offload-forwarder.c | 1052 +++++++++++++++++
+ .../pulse-module-compress-offload-forwarder.h |   20 +
+ .../pulse-module-compress-offload-sink.c      |  308 +++++
+ 4 files changed, 1382 insertions(+)
+ create mode 100644 src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.c
+ create mode 100644 src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.h
+ create mode 100644 src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-sink.c
+
+diff --git a/src/modules/meson.build b/src/modules/meson.build
+index 79f599ba2..5802ab1dd 100644
+--- a/src/modules/meson.build
++++ b/src/modules/meson.build
+@@ -338,6 +338,8 @@ pipewire_module_protocol_pulse_sources = [
+   'module-protocol-pulse/modules/pulse-module-alsa-source.c',
+   'module-protocol-pulse/modules/pulse-module-always-sink.c',
+   'module-protocol-pulse/modules/pulse-module-combine-sink.c',
++  'module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.c',
++  'module-protocol-pulse/modules/pulse-module-compress-offload-sink.c',
+   'module-protocol-pulse/modules/pulse-module-device-manager.c',
+   'module-protocol-pulse/modules/pulse-module-device-restore.c',
+   'module-protocol-pulse/modules/pulse-module-echo-cancel.c',
+diff --git a/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.c b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.c
+new file mode 100644
+index 000000000..8afc1c425
+--- /dev/null
++++ b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.c
+@@ -0,0 +1,1052 @@
++/* PipeWire */
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
++
++#include <errno.h>
++#include <limits.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <spa/param/audio/compressed.h>
++#include <spa/param/audio/format-utils.h>
++#include <spa/param/audio/raw.h>
++#include <spa/utils/result.h>
++#include <spa/utils/string.h>
++#include <pipewire/pipewire.h>
++
++#include "../module.h"
++#include "pulse-module-compress-offload-forwarder.h"
++
++/** \page page_pulse_module_compress_offload_forwarder Compress Offload Forwarder
++ *
++ * ## Module Name
++ *
++ * `module-compress-offload-forwarder`
++ *
++ * ## Module Options
++ *
++ * @pulse_module_options@
++ */
++
++#define NAME "compress-offload-forwarder"
++
++#define DEFAULT_CODEC "auto"
++#define DEFAULT_RATE 48000u
++#define DEFAULT_CHANNELS 2u
++#define DEFAULT_BITRATE 128000u
++#define DEFAULT_BLOCK_SIZE (16u * 1024u)
++#define MAX_PENDING_SIZE (1024u * 1024u)
++
++static const char *const pulse_module_options =
++	"source_sink=<Pulse-visible compress sink node.name> "
++	"target_sink=<compressed-offload sink node.name> "
++	"codec=<codec name, default auto> "
++	"rate=<sample rate, default 48000> "
++	"channels=<number of channels, default 2> "
++	"bitrate=<bit rate, default 128000> "
++	"block_size=<buffer size in bytes, default 16384>";
++
++PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
++#define PW_LOG_TOPIC_DEFAULT mod_topic
++
++struct forwarder_data {
++	struct pw_core *core;
++	struct pw_loop *loop;
++	struct spa_source *activate_event;
++	struct spa_hook core_listener;
++	struct pw_registry *registry;
++	struct spa_hook registry_listener;
++	struct pw_node *client_node;
++	struct spa_hook client_node_listener;
++
++	struct pw_stream *capture;
++	struct spa_hook capture_listener;
++	struct pw_stream *playback;
++	struct spa_hook playback_listener;
++
++	char source_name[256];
++	char monitor_name[280];
++	char target_name[256];
++	char codec[32];
++	char aac_stream_format[16];
++	char aac_codec_data[256];
++	uint32_t rate;
++	uint32_t channels;
++	uint32_t bitrate;
++	uint32_t aac_audio_object_type;
++	uint32_t block_size;
++	uint32_t target_id;
++	uint32_t client_node_id;
++	uint8_t *pending_data;
++	uint32_t pending_size;
++	uint32_t pending_offset;
++	uint8_t capture_streaming:1;
++	uint8_t logged_first_buffer:1;
++	uint8_t logged_first_output_buffer:1;
++	uint8_t logged_silence_buffer:1;
++	uint8_t activate_pending:1;
++	uint8_t playback_active:1;
++	uint8_t playback_failed:1;
++	uint8_t metadata_error_logged:1;
++};
++
++static struct forwarder_data *active_forwarder;
++
++static void destroy_playback_stream(struct forwarder_data *d);
++
++static int create_playback_stream(struct forwarder_data *d);
++static void set_playback_active(struct forwarder_data *d, bool active);
++static void maybe_create_playback_stream(struct forwarder_data *d, const char *reason);
++
++static bool codec_is_auto(const char *codec)
++{
++	return codec == NULL || codec[0] == '\0' || spa_streq(codec, "auto");
++}
++
++static void reset_codec_state(struct forwarder_data *d)
++{
++	spa_scnprintf(d->codec, sizeof(d->codec), "%s", DEFAULT_CODEC);
++	d->aac_stream_format[0] = '\0';
++	d->aac_codec_data[0] = '\0';
++	d->aac_audio_object_type = 0;
++	d->rate = DEFAULT_RATE;
++	d->channels = DEFAULT_CHANNELS;
++	d->bitrate = DEFAULT_BITRATE;
++	d->logged_first_buffer = false;
++	d->logged_first_output_buffer = false;
++	d->logged_silence_buffer = false;
++	d->metadata_error_logged = false;
++}
++
++static void request_playback_activation(struct forwarder_data *d)
++{
++	if (d->activate_event == NULL || d->activate_pending)
++		return;
++	d->activate_pending = true;
++	pw_loop_signal_event(d->loop, d->activate_event);
++}
++
++static void playback_activate_event(void *data, uint64_t count)
++{
++	struct forwarder_data *d = data;
++
++	d->activate_pending = false;
++	maybe_create_playback_stream(d, "first-audio-buffer");
++}
++
++static bool buffer_is_zeroed(const void *data, uint32_t size)
++{
++	const uint8_t *bytes = data;
++	uint32_t index;
++
++	for (index = 0; index < size; index++) {
++		if (bytes[index] != 0)
++			return false;
++	}
++	return true;
++}
++
++static void clear_pending_data(struct forwarder_data *d)
++{
++	free(d->pending_data);
++	d->pending_data = NULL;
++	d->pending_size = 0;
++	d->pending_offset = 0;
++}
++
++static void compact_pending_data(struct forwarder_data *d)
++{
++	uint32_t remaining;
++
++	if (d->pending_offset == 0)
++		return;
++	if (d->pending_offset >= d->pending_size) {
++		clear_pending_data(d);
++		return;
++	}
++	remaining = d->pending_size - d->pending_offset;
++	memmove(d->pending_data, d->pending_data + d->pending_offset, remaining);
++	d->pending_size = remaining;
++	d->pending_offset = 0;
++}
++
++static int append_pending_data(struct forwarder_data *d, const void *data, uint32_t size)
++{
++	uint8_t *pending_data;
++
++	if (size == 0)
++		return 0;
++	compact_pending_data(d);
++	if (size > MAX_PENDING_SIZE || d->pending_size > MAX_PENDING_SIZE - size)
++		return -ENOSPC;
++	if (d->pending_size > UINT32_MAX - size)
++		return -EOVERFLOW;
++	pending_data = realloc(d->pending_data, d->pending_size + size);
++	if (pending_data == NULL)
++		return -errno;
++	d->pending_data = pending_data;
++	memcpy(d->pending_data + d->pending_size, data, size);
++	d->pending_size += size;
++	return 0;
++}
++
++static bool codec_is_mp3(const char *codec)
++{
++	return codec != NULL && spa_streq(codec, "mp3");
++}
++
++static bool codec_is_aac_adts(const char *codec)
++{
++	return codec != NULL && spa_streq(codec, "aac_adts");
++}
++
++static bool codec_is_aac_raw(const char *codec)
++{
++	return codec != NULL && spa_streq(codec, "aac");
++}
++
++static bool codec_is_aac(const char *codec)
++{
++	return codec_is_aac_adts(codec) || codec_is_aac_raw(codec);
++}
++
++static bool raw_aac_transport_header(const uint8_t *data, uint32_t size,
++		uint32_t *frame_size)
++{
++	if (size < COMPRESS_RAW_AAC_HEADER_SIZE ||
++	    data[0] != COMPRESS_RAW_AAC_MAGIC_0 ||
++	    data[1] != COMPRESS_RAW_AAC_MAGIC_1 ||
++	    data[2] != COMPRESS_RAW_AAC_MAGIC_2 ||
++	    data[3] != COMPRESS_RAW_AAC_MAGIC_3)
++		return false;
++	*frame_size = (uint32_t)data[4] |
++			((uint32_t)data[5] << 8) |
++			((uint32_t)data[6] << 16) |
++			((uint32_t)data[7] << 24);
++	return *frame_size > 0 && *frame_size <= MAX_PENDING_SIZE;
++}
++
++static bool payload_is_aac_adts(const uint8_t *bytes, uint32_t size)
++{
++	return size >= 2 &&
++		bytes[0] == 0xff &&
++		(bytes[1] & 0xf6) == 0xf0;
++}
++
++static bool parse_aac_adts_header(const uint8_t *bytes, uint32_t size,
++		uint32_t *rate, uint32_t *channels, uint32_t *profile)
++{
++	static const uint32_t sample_rates[] = {
++		96000, 88200, 64000, 48000, 44100, 32000,
++		24000, 22050, 16000, 12000, 11025, 8000,
++		7350,
++	};
++	uint32_t sampling_index, parsed_channels, parsed_profile;
++
++	if (size < 7 || !payload_is_aac_adts(bytes, size))
++		return false;
++
++	parsed_profile = ((bytes[2] & 0xc0) >> 6) + 1;
++	sampling_index = (bytes[2] & 0x3c) >> 2;
++	parsed_channels = ((bytes[2] & 0x01) << 2) | ((bytes[3] & 0xc0) >> 6);
++
++	if (sampling_index >= SPA_N_ELEMENTS(sample_rates) || parsed_channels == 0 || parsed_channels > 8)
++		return false;
++
++	if (rate != NULL)
++		*rate = sample_rates[sampling_index];
++	if (channels != NULL)
++		*channels = parsed_channels;
++	if (profile != NULL)
++		*profile = parsed_profile;
++	return true;
++}
++
++static bool payload_is_mp3(const uint8_t *bytes, uint32_t size)
++{
++	return (size >= 3 && bytes[0] == 'I' && bytes[1] == 'D' && bytes[2] == '3') ||
++		(size >= 2 &&
++		 bytes[0] == 0xff &&
++		 (bytes[1] & 0xe0) == 0xe0 &&
++		 (bytes[1] & 0x06) != 0x00);
++}
++
++static bool detect_payload_codec(struct forwarder_data *d, const void *data, uint32_t size)
++{
++	const uint8_t *bytes = data;
++	uint32_t rate, channels, profile;
++
++	if (payload_is_aac_adts(bytes, size)) {
++		if (!parse_aac_adts_header(bytes, size, &rate, &channels, &profile)) {
++			pw_log_warn("compress-forwarder rejected invalid AAC ADTS header=%02x %02x %02x %02x size=%u",
++					size > 0 ? bytes[0] : 0, size > 1 ? bytes[1] : 0,
++					size > 2 ? bytes[2] : 0, size > 3 ? bytes[3] : 0, size);
++			return false;
++		}
++		if (!codec_is_aac_adts(d->codec)) {
++			spa_scnprintf(d->codec, sizeof(d->codec), "aac_adts");
++		}
++		d->rate = rate;
++		d->channels = channels;
++		d->aac_audio_object_type = profile;
++		pw_log_debug("compress-forwarder detected AAC ADTS payload header=%02x %02x rate=%u channels=%u object_type=%u",
++				bytes[0], bytes[1], d->rate, d->channels, d->aac_audio_object_type);
++		return true;
++	}
++	if (payload_is_mp3(bytes, size)) {
++		if (!codec_is_mp3(d->codec)) {
++			spa_scnprintf(d->codec, sizeof(d->codec), "mp3");
++			pw_log_debug("compress-forwarder detected MP3 payload header=%02x %02x %02x",
++					size > 0 ? bytes[0] : 0, size > 1 ? bytes[1] : 0, size > 2 ? bytes[2] : 0);
++		}
++		return true;
++	}
++	return codec_is_aac_raw(d->codec);
++}
++
++static bool update_codec_from_props(struct forwarder_data *d, const struct spa_dict *props)
++{
++	const char *codec, *str;
++	char old_codec[sizeof(d->codec)];
++	char old_aac_stream_format[sizeof(d->aac_stream_format)];
++	char old_aac_codec_data[sizeof(d->aac_codec_data)];
++	uint32_t old_rate, old_channels, old_bitrate, old_aac_audio_object_type;
++	bool changed;
++
++	codec = spa_dict_lookup(props, "codec.type");
++	if (codec == NULL || (!codec_is_mp3(codec) && !codec_is_aac(codec)))
++		return false;
++
++	spa_scnprintf(old_codec, sizeof(old_codec), "%s", d->codec);
++	spa_scnprintf(old_aac_stream_format, sizeof(old_aac_stream_format), "%s", d->aac_stream_format);
++	spa_scnprintf(old_aac_codec_data, sizeof(old_aac_codec_data), "%s", d->aac_codec_data);
++	old_rate = d->rate;
++	old_channels = d->channels;
++	old_bitrate = d->bitrate;
++	old_aac_audio_object_type = d->aac_audio_object_type;
++
++	spa_scnprintf(d->codec, sizeof(d->codec), "%s", codec);
++	if ((str = spa_dict_lookup(props, "codec.sample_rate")) != NULL)
++		d->rate = (uint32_t)atoi(str);
++	if ((str = spa_dict_lookup(props, "codec.channels")) != NULL)
++		d->channels = (uint32_t)atoi(str);
++	if ((str = spa_dict_lookup(props, "codec.bit_rate")) != NULL)
++		d->bitrate = (uint32_t)atoi(str);
++	if ((str = spa_dict_lookup(props, "codec.aac.stream_format")) != NULL)
++		spa_scnprintf(d->aac_stream_format, sizeof(d->aac_stream_format), "%s", str);
++	if ((str = spa_dict_lookup(props, "codec.aac.codec_data")) != NULL)
++		spa_scnprintf(d->aac_codec_data, sizeof(d->aac_codec_data), "%s", str);
++	if ((str = spa_dict_lookup(props, "codec.aac.audio_object_type")) != NULL)
++		d->aac_audio_object_type = (uint32_t)atoi(str);
++	if (codec_is_aac_adts(d->codec) && d->aac_stream_format[0] == '\0')
++		spa_scnprintf(d->aac_stream_format, sizeof(d->aac_stream_format), "adts");
++	if (codec_is_aac_raw(d->codec) && d->aac_stream_format[0] == '\0')
++		spa_scnprintf(d->aac_stream_format, sizeof(d->aac_stream_format), "raw");
++	pw_log_debug("compress-forwarder stream codec update codec=%s rate=%u channels=%u bitrate=%u stream_format=%s object_type=%u",
++			d->codec, d->rate, d->channels, d->bitrate,
++			d->aac_stream_format[0] != '\0' ? d->aac_stream_format : "none",
++			d->aac_audio_object_type);
++
++	changed = !spa_streq(old_codec, d->codec) ||
++			old_rate != d->rate ||
++			old_channels != d->channels ||
++			old_bitrate != d->bitrate ||
++			!spa_streq(old_aac_stream_format, d->aac_stream_format) ||
++			!spa_streq(old_aac_codec_data, d->aac_codec_data) ||
++			old_aac_audio_object_type != d->aac_audio_object_type;
++	return changed;
++}
++
++void compress_offload_forwarder_update(const char *source_name,
++		const struct spa_dict *props)
++{
++	struct forwarder_data *d = active_forwarder;
++
++	if (d == NULL || props == NULL || !spa_streq(source_name, d->source_name))
++		return;
++	if (!update_codec_from_props(d, props))
++		return;
++
++	pw_log_debug("compress-forwarder direct stream codec update codec=%s rate=%u channels=%u object_type=%u",
++			d->codec, d->rate, d->channels, d->aac_audio_object_type);
++	if (d->playback != NULL)
++		destroy_playback_stream(d);
++	if (d->capture_streaming && d->pending_size > d->pending_offset)
++		request_playback_activation(d);
++}
++
++void compress_offload_forwarder_teardown(const char *source_name)
++{
++	struct forwarder_data *d = active_forwarder;
++
++	if (d == NULL || source_name == NULL ||
++	    !spa_streq(source_name, d->source_name))
++		return;
++
++	pw_log_debug("compress-forwarder source:%s playback stream ended, destroying target stream",
++			d->source_name);
++	destroy_playback_stream(d);
++	clear_pending_data(d);
++}
++
++static void maybe_create_playback_stream(struct forwarder_data *d, const char *reason)
++{
++	int res;
++
++	if (!d->capture_streaming)
++		return;
++	if (d->playback != NULL) {
++		set_playback_active(d, true);
++		return;
++	}
++	if (d->target_id == PW_ID_ANY) {
++		pw_log_debug("compress-forwarder target:%s not resolved yet, defer output create (%s)",
++				d->target_name, reason);
++		return;
++	}
++	res = create_playback_stream(d);
++	if (res < 0)
++		pw_log_error("compress-forwarder target:%s create failed (%s): %s",
++				d->target_name, reason, spa_strerror(res));
++	else
++		set_playback_active(d, true);
++}
++
++static void destroy_playback_stream(struct forwarder_data *d)
++{
++	clear_pending_data(d);
++	if (d->playback == NULL)
++		return;
++	spa_hook_remove(&d->playback_listener);
++	pw_stream_destroy(d->playback);
++	d->playback = NULL;
++	d->playback_active = false;
++	d->playback_failed = false;
++}
++
++static const struct spa_pod *build_raw_format(struct forwarder_data *d,
++		struct spa_pod_builder *builder, uint32_t id)
++{
++	struct spa_audio_info_raw info;
++
++	spa_zero(info);
++	info.format = SPA_AUDIO_FORMAT_S16_LE;
++	info.rate = d->rate;
++	info.channels = d->channels;
++	if (info.channels == 1) {
++		info.position[0] = SPA_AUDIO_CHANNEL_MONO;
++	} else {
++		info.channels = 2;
++		info.position[0] = SPA_AUDIO_CHANNEL_FL;
++		info.position[1] = SPA_AUDIO_CHANNEL_FR;
++	}
++	return spa_format_audio_raw_build(builder, id, &info);
++}
++
++static const struct spa_pod *build_encoded_format(struct forwarder_data *d,
++		struct spa_pod_builder *builder, uint32_t id)
++{
++	struct spa_audio_info info;
++
++	spa_zero(info);
++	info.media_type = SPA_MEDIA_TYPE_audio;
++	if (codec_is_aac_adts(d->codec)) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = d->rate;
++		info.info.aac.channels = d->channels;
++		info.info.aac.bitrate = d->bitrate;
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;
++		info.info.aac.audio_object_type = d->aac_audio_object_type;
++	} else if (codec_is_aac_raw(d->codec)) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = d->rate;
++		info.info.aac.channels = d->channels;
++		info.info.aac.bitrate = d->bitrate;
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_RAW;
++		info.info.aac.audio_object_type = d->aac_audio_object_type;
++	} else {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
++		info.info.mp3.rate = d->rate;
++		info.info.mp3.channels = d->channels;
++		info.info.mp3.channel_mode = d->channels == 1 ?
++			SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
++	}
++
++	return spa_format_audio_build(builder, id, &info);
++}
++
++static void playback_state_changed(void *data, enum pw_stream_state old,
++		enum pw_stream_state state, const char *error)
++{
++	struct forwarder_data *d = data;
++
++	pw_log_debug("compress-forwarder target:%s state %d -> %d%s%s",
++			d->target_name, old, state, error ? ": " : "", error ? error : "");
++	if (state == PW_STREAM_STATE_ERROR)
++		d->playback_failed = true;
++}
++
++static void set_playback_active(struct forwarder_data *d, bool active)
++{
++	if (d->playback == NULL || d->playback_active == active)
++		return;
++	pw_log_debug("compress-forwarder target:%s active=%d", d->target_name, active);
++	pw_stream_set_active(d->playback, active);
++	d->playback_active = active;
++}
++
++static void capture_state_changed(void *data, enum pw_stream_state old,
++		enum pw_stream_state state, const char *error)
++{
++	struct forwarder_data *d = data;
++
++	pw_log_debug("compress-forwarder source:%s state %d -> %d%s%s",
++			d->monitor_name, old, state, error ? ": " : "", error ? error : "");
++	if (d->playback_failed)
++		destroy_playback_stream(d);
++	d->capture_streaming = state == PW_STREAM_STATE_STREAMING;
++	if (state == PW_STREAM_STATE_PAUSED || state == PW_STREAM_STATE_ERROR ||
++	    state == PW_STREAM_STATE_UNCONNECTED) {
++		if (d->playback != NULL) {
++			pw_log_debug("compress-forwarder source:%s stopped, destroying target stream",
++					d->monitor_name);
++			destroy_playback_stream(d);
++		}
++		clear_pending_data(d);
++	}
++}
++
++static void capture_process(void *data)
++{
++	struct forwarder_data *d = data;
++	struct pw_buffer *in_buf, *out_buf;
++	struct spa_data *in_data, *out_data;
++	uint32_t in_offset, in_size, out_size, copy_size;
++	uint32_t raw_frame_size = 0;
++	const void *input_data;
++	const void *copy_data;
++	uint32_t copy_available;
++	bool framed_raw_aac = false;
++	int res;
++
++	in_buf = pw_stream_dequeue_buffer(d->capture);
++	if (in_buf == NULL)
++		return;
++
++	in_data = &in_buf->buffer->datas[0];
++	if (in_data->data == NULL || in_data->chunk == NULL) {
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	in_offset = SPA_MIN(in_data->chunk->offset, in_data->maxsize);
++	in_size = SPA_MIN(in_data->chunk->size, in_data->maxsize - in_offset);
++	input_data = SPA_PTROFF(in_data->data, in_offset, void);
++	if (in_size == 0) {
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	if (buffer_is_zeroed(input_data, in_size)) {
++		if (!d->logged_silence_buffer) {
++			pw_log_debug("compress-forwarder source:%s ignoring zeroed startup buffer size=%u flags=0x%x",
++					d->monitor_name, in_size, in_data->chunk->flags);
++			d->logged_silence_buffer = true;
++		}
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	if (!d->logged_first_buffer) {
++		const uint8_t *bytes = SPA_PTROFF(in_data->data, in_offset, const uint8_t);
++		pw_log_debug("compress-forwarder source:%s first non-silence buffer size=%u offset=%u flags=0x%x",
++				d->monitor_name, in_size, in_offset, in_data->chunk->flags);
++		pw_log_debug("compress-forwarder source:%s first non-silence bytes=%02x %02x %02x %02x %02x %02x %02x %02x",
++				d->monitor_name,
++				in_size > 0 ? bytes[0] : 0,
++				in_size > 1 ? bytes[1] : 0,
++				in_size > 2 ? bytes[2] : 0,
++				in_size > 3 ? bytes[3] : 0,
++				in_size > 4 ? bytes[4] : 0,
++				in_size > 5 ? bytes[5] : 0,
++				in_size > 6 ? bytes[6] : 0,
++				in_size > 7 ? bytes[7] : 0);
++		d->logged_first_buffer = true;
++	}
++	if (d->playback_failed)
++		destroy_playback_stream(d);
++
++	res = append_pending_data(d, input_data, in_size);
++	if (res < 0) {
++		pw_log_error("compress-forwarder source:%s failed to preserve input before target write: %s",
++				d->monitor_name, spa_strerror(res));
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	{
++		const uint8_t *pending = d->pending_data + d->pending_offset;
++		uint32_t available = d->pending_size - d->pending_offset;
++
++		if (available >= COMPRESS_RAW_AAC_HEADER_SIZE &&
++		    raw_aac_transport_header(pending, available, &raw_frame_size)) {
++			if (available < COMPRESS_RAW_AAC_HEADER_SIZE + raw_frame_size) {
++				pw_stream_queue_buffer(d->capture, in_buf);
++				return;
++			}
++			framed_raw_aac = true;
++			input_data = pending + COMPRESS_RAW_AAC_HEADER_SIZE;
++			in_size = raw_frame_size;
++		}
++	}
++	if (d->playback == NULL && !detect_payload_codec(d, input_data, in_size)) {
++		if (codec_is_auto(d->codec)) {
++			pw_log_debug("compress-forwarder source:%s waiting for codec metadata, preserved=%u",
++					d->monitor_name, d->pending_size - d->pending_offset);
++			pw_stream_queue_buffer(d->capture, in_buf);
++			return;
++		}
++		pw_log_error("compress-forwarder source:%s unsupported payload header for codec=%s",
++				d->monitor_name, d->codec);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	if (d->playback == NULL) {
++		request_playback_activation(d);
++		if (d->playback == NULL) {
++			pw_log_debug("compress-forwarder source:%s preserved %u bytes pending target create total=%u",
++					d->monitor_name, in_size, d->pending_size - d->pending_offset);
++			pw_stream_queue_buffer(d->capture, in_buf);
++			return;
++		}
++	}
++	if (!d->playback_active)
++		set_playback_active(d, true);
++	if (d->playback_failed || !d->playback_active) {
++		pw_log_debug("compress-forwarder source:%s preserved %u bytes pending inactive target total=%u",
++				d->monitor_name, in_size, d->pending_size - d->pending_offset);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++
++	out_buf = pw_stream_dequeue_buffer(d->playback);
++	if (out_buf == NULL) {
++		pw_log_debug("compress-forwarder source:%s preserved %u bytes pending output buffer total=%u",
++				d->monitor_name, in_size, d->pending_size - d->pending_offset);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++
++	out_data = &out_buf->buffer->datas[0];
++	if (out_data->data == NULL || out_data->chunk == NULL) {
++		pw_stream_queue_buffer(d->playback, out_buf);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++
++	out_size = out_data->maxsize;
++	if (out_size == 0) {
++		pw_stream_queue_buffer(d->playback, out_buf);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	copy_data = d->pending_data + d->pending_offset;
++	copy_available = d->pending_size - d->pending_offset;
++	if (framed_raw_aac) {
++		if (raw_frame_size > out_size) {
++			pw_log_error("compress-forwarder raw AAC access unit too large size=%u output=%u",
++					raw_frame_size, out_size);
++			pw_stream_queue_buffer(d->playback, out_buf);
++			pw_stream_queue_buffer(d->capture, in_buf);
++			return;
++		}
++		copy_data = SPA_PTROFF(copy_data, COMPRESS_RAW_AAC_HEADER_SIZE, const void);
++		copy_size = raw_frame_size;
++	} else {
++		copy_size = SPA_MIN(copy_available, out_size);
++	}
++	memcpy(out_data->data, copy_data, copy_size);
++	d->pending_offset += copy_size +
++			(framed_raw_aac ? COMPRESS_RAW_AAC_HEADER_SIZE : 0);
++	if (d->pending_offset >= d->pending_size)
++		clear_pending_data(d);
++
++	out_data->chunk->offset = 0;
++	out_data->chunk->size = copy_size;
++	out_data->chunk->stride = 1;
++	out_buf->size = copy_size;
++
++	if (!d->logged_first_output_buffer) {
++		const uint8_t *out_bytes = out_data->data;
++		pw_log_debug("compress-forwarder target:%s queue buffer copy_size=%u out_max=%u chunk=%u/%u/%d bytes=%02x %02x %02x %02x %02x %02x %02x %02x",
++				d->target_name, copy_size, out_data->maxsize,
++				out_data->chunk->offset, out_data->chunk->size,
++				out_data->chunk->stride,
++				copy_size > 0 ? out_bytes[0] : 0,
++				copy_size > 1 ? out_bytes[1] : 0,
++				copy_size > 2 ? out_bytes[2] : 0,
++				copy_size > 3 ? out_bytes[3] : 0,
++				copy_size > 4 ? out_bytes[4] : 0,
++				copy_size > 5 ? out_bytes[5] : 0,
++				copy_size > 6 ? out_bytes[6] : 0,
++				copy_size > 7 ? out_bytes[7] : 0);
++		d->logged_first_output_buffer = true;
++	}
++
++	pw_stream_queue_buffer(d->playback, out_buf);
++	pw_stream_queue_buffer(d->capture, in_buf);
++}
++
++static const struct pw_stream_events capture_events = {
++	PW_VERSION_STREAM_EVENTS,
++	.state_changed = capture_state_changed,
++	.process = capture_process,
++};
++
++static const struct pw_stream_events playback_events = {
++	PW_VERSION_STREAM_EVENTS,
++	.state_changed = playback_state_changed,
++};
++
++static void clear_client_node(struct forwarder_data *d)
++{
++	if (d->client_node == NULL)
++		return;
++	spa_hook_remove(&d->client_node_listener);
++	pw_proxy_destroy((struct pw_proxy *)d->client_node);
++	d->client_node = NULL;
++	d->client_node_id = PW_ID_ANY;
++}
++
++static void client_node_info(void *data, const struct pw_node_info *info)
++{
++	struct forwarder_data *d = data;
++
++	if (info->props == NULL || !update_codec_from_props(d, info->props))
++		return;
++	if (d->playback != NULL) {
++		pw_log_info("compress-forwarder final stream codec changed, recreating target codec=%s rate=%u channels=%u",
++				d->codec, d->rate, d->channels);
++		destroy_playback_stream(d);
++	}
++	if (d->capture_streaming && d->pending_size > d->pending_offset)
++		request_playback_activation(d);
++}
++
++static const struct pw_node_events client_node_events = {
++	PW_VERSION_NODE_EVENTS,
++	.info = client_node_info,
++};
++
++static void registry_global(void *data, uint32_t id, uint32_t permissions,
++		const char *type, uint32_t version, const struct spa_dict *props)
++{
++	struct forwarder_data *d = data;
++	const char *name, *target, *media_class, *forwarder_source;
++
++	if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || props == NULL)
++		return;
++	name = spa_dict_lookup(props, PW_KEY_NODE_NAME);
++	if (spa_streq(name, d->target_name)) {
++		d->target_id = id;
++		pw_log_debug("compress-forwarder target:%s resolved id=%u", d->target_name, id);
++		return;
++	}
++
++	media_class = spa_dict_lookup(props, PW_KEY_MEDIA_CLASS);
++	target = spa_dict_lookup(props, PW_KEY_TARGET_OBJECT);
++	forwarder_source = spa_dict_lookup(props, "compress.forwarder.source");
++	if (spa_streq(media_class, "Stream/Output/Audio") &&
++	    !spa_streq(name, "compress-offload-forwarder-output") &&
++	    (spa_streq(forwarder_source, d->source_name) ||
++	     spa_streq(target, d->source_name) || spa_streq(target, d->monitor_name))) {
++		if (d->client_node != NULL && d->client_node_id != id) {
++			destroy_playback_stream(d);
++			clear_pending_data(d);
++		}
++		clear_client_node(d);
++		reset_codec_state(d);
++		update_codec_from_props(d, props);
++		d->client_node = pw_registry_bind(d->registry, id, type,
++				version < (uint32_t)PW_VERSION_NODE ? version : PW_VERSION_NODE, 0);
++		if (d->client_node == NULL) {
++			pw_log_error("compress-forwarder failed to bind client stream node id=%u", id);
++			return;
++		}
++		d->client_node_id = id;
++		pw_node_add_listener(d->client_node, &d->client_node_listener,
++				&client_node_events, d);
++		pw_log_debug("compress-forwarder tracking client stream node id=%u", id);
++	}
++}
++
++static void registry_global_remove(void *data, uint32_t id)
++{
++	struct forwarder_data *d = data;
++
++	if (id == d->client_node_id) {
++		pw_log_debug("compress-forwarder client stream removed id=%u", id);
++		clear_client_node(d);
++		destroy_playback_stream(d);
++		clear_pending_data(d);
++		reset_codec_state(d);
++	}
++	if (id == d->target_id) {
++		pw_log_debug("compress-forwarder target:%s removed id=%u", d->target_name, id);
++		d->target_id = PW_ID_ANY;
++		destroy_playback_stream(d);
++	}
++}
++
++static const struct pw_registry_events registry_events = {
++	PW_VERSION_REGISTRY_EVENTS,
++	.global = registry_global,
++	.global_remove = registry_global_remove,
++};
++
++static int create_playback_stream(struct forwarder_data *d)
++{
++	struct pw_properties *props;
++	const struct spa_pod *params[2];
++	uint8_t buffer[1024];
++	struct spa_pod_builder builder;
++	uint32_t n_params = 0;
++	int res;
++
++	if (codec_is_auto(d->codec))
++		return -EAGAIN;
++	if (codec_is_aac_raw(d->codec) && d->aac_audio_object_type == 0) {
++		pw_log_error("compress-forwarder raw AAC missing audio object type");
++		return -EINVAL;
++	}
++
++	props = pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Output/Audio",
++			PW_KEY_NODE_NAME, "compress-offload-forwarder-output",
++			PW_KEY_MEDIA_TYPE, "Audio",
++			PW_KEY_MEDIA_CATEGORY, "Playback",
++			PW_KEY_MEDIA_ROLE, "Music",
++			PW_KEY_TARGET_OBJECT, d->target_name,
++			PW_KEY_NODE_AUTOCONNECT, "true",
++			PW_KEY_STREAM_DONT_REMIX, "true",
++			"node.dont-reconnect", "true",
++			"compress.offload", "true",
++			"codec.type", d->codec,
++			NULL);
++	if (props == NULL)
++		return -errno;
++	pw_properties_setf(props, "codec.sample_rate", "%u", d->rate);
++	pw_properties_setf(props, "codec.channels", "%u", d->channels);
++	pw_properties_setf(props, "codec.bit_rate", "%u", d->bitrate);
++	if (codec_is_aac(d->codec)) {
++		pw_properties_set(props, "codec.aac.stream_format",
++				d->aac_stream_format[0] != '\0' ? d->aac_stream_format :
++				(codec_is_aac_adts(d->codec) ? "adts" : "raw"));
++		pw_properties_setf(props, "codec.aac.audio_object_type", "%u",
++				d->aac_audio_object_type != 0 ? d->aac_audio_object_type :
++				(codec_is_aac_adts(d->codec) ? 2 : 0));
++		if (d->aac_codec_data[0] != '\0')
++			pw_properties_set(props, "codec.aac.codec_data", d->aac_codec_data);
++	}
++	pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
++
++	d->playback = pw_stream_new(d->core, "compress offload forwarder output", props);
++	if (d->playback == NULL)
++		return -errno;
++	pw_stream_add_listener(d->playback, &d->playback_listener, &playback_events, d);
++
++	spa_pod_builder_init(&builder, buffer, sizeof(buffer));
++	params[n_params++] = build_encoded_format(d, &builder, SPA_PARAM_EnumFormat);
++	pw_log_info("compress-forwarder target:%s connect target-id=%u codec=%s rate=%u channels=%u bitrate=%u",
++			d->target_name, d->target_id, d->codec, d->rate, d->channels, d->bitrate);
++	res = pw_stream_connect(d->playback, PW_DIRECTION_OUTPUT, d->target_id,
++			PW_STREAM_FLAG_AUTOCONNECT |
++			PW_STREAM_FLAG_NO_CONVERT |
++			PW_STREAM_FLAG_MAP_BUFFERS |
++			PW_STREAM_FLAG_RT_PROCESS,
++			params, n_params);
++	if (res < 0) {
++		destroy_playback_stream(d);
++		return res;
++	}
++	pw_stream_set_active(d->playback, false);
++	d->playback_active = false;
++	d->playback_failed = false;
++	return 0;
++}
++
++static int create_capture_stream(struct forwarder_data *d)
++{
++	struct pw_properties *props;
++	const struct spa_pod *params[2];
++	uint8_t buffer[1024];
++	struct spa_pod_builder builder;
++	uint32_t n_params = 0;
++	int res;
++
++	props = pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Input/Audio",
++			PW_KEY_NODE_NAME, "compress-offload-forwarder-capture",
++			PW_KEY_TARGET_OBJECT, d->source_name,
++			PW_KEY_NODE_AUTOCONNECT, "true",
++			PW_KEY_STREAM_CAPTURE_SINK, "true",
++			PW_KEY_STREAM_DONT_REMIX, "true",
++			"node.dont-reconnect", "true",
++			NULL);
++	if (props == NULL)
++		return -errno;
++	pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
++
++	d->capture = pw_stream_new(d->core, "compress offload forwarder capture", props);
++	if (d->capture == NULL)
++		return -errno;
++	pw_stream_add_listener(d->capture, &d->capture_listener, &capture_events, d);
++
++	spa_pod_builder_init(&builder, buffer, sizeof(buffer));
++	params[n_params++] = build_raw_format(d, &builder, SPA_PARAM_EnumFormat);
++	res = pw_stream_connect(d->capture, PW_DIRECTION_INPUT, PW_ID_ANY,
++			PW_STREAM_FLAG_AUTOCONNECT |
++			PW_STREAM_FLAG_MAP_BUFFERS |
++			PW_STREAM_FLAG_RT_PROCESS,
++			params, n_params);
++	if (res < 0)
++		return res;
++	pw_stream_set_active(d->capture, true);
++	return 0;
++}
++
++static void core_error(void *data, uint32_t id, int seq, int res, const char *message)
++{
++	struct module *module = data;
++
++	pw_log_error("compress-forwarder error id:%u seq:%d res:%d (%s): %s",
++			id, seq, res, spa_strerror(res), message);
++	if (id == PW_ID_CORE && res == -EPIPE)
++		module_schedule_unload(module);
++}
++
++static const struct pw_core_events core_events = {
++	PW_VERSION_CORE_EVENTS,
++	.error = core_error,
++};
++
++static int module_compress_offload_forwarder_load(struct module *module)
++{
++	struct forwarder_data *d = module->user_data;
++	int res;
++
++	PW_LOG_TOPIC_INIT(mod_topic);
++	d->loop = pw_context_get_main_loop(module->impl->context);
++	if (d->loop == NULL)
++		return -EINVAL;
++	d->activate_event = pw_loop_add_event(d->loop, playback_activate_event, d);
++	if (d->activate_event == NULL)
++		return -errno;
++	d->core = pw_context_connect(module->impl->context, NULL, 0);
++	if (d->core == NULL)
++		return -errno;
++	pw_core_add_listener(d->core, &d->core_listener, &core_events, module);
++	d->target_id = PW_ID_ANY;
++	d->registry = pw_core_get_registry(d->core, PW_VERSION_REGISTRY, 0);
++	if (d->registry == NULL)
++		return -errno;
++	pw_registry_add_listener(d->registry, &d->registry_listener, &registry_events, d);
++
++	res = create_capture_stream(d);
++	if (res < 0)
++		return res;
++	active_forwarder = d;
++
++	pw_log_info("compress-forwarder loaded: source=%s monitor=%s target=%s codec=%s rate=%u channels=%u",
++			d->source_name, d->monitor_name, d->target_name,
++			d->codec, d->rate, d->channels);
++	module_emit_loaded(module, 0);
++	return 0;
++}
++
++static int module_compress_offload_forwarder_unload(struct module *module)
++{
++	struct forwarder_data *d = module->user_data;
++
++	if (active_forwarder == d)
++		active_forwarder = NULL;
++
++	if (d->capture != NULL) {
++		spa_hook_remove(&d->capture_listener);
++		pw_stream_destroy(d->capture);
++		d->capture = NULL;
++	}
++	destroy_playback_stream(d);
++	clear_client_node(d);
++	if (d->registry != NULL) {
++		spa_hook_remove(&d->registry_listener);
++		pw_proxy_destroy((struct pw_proxy*)d->registry);
++		d->registry = NULL;
++	}
++	if (d->core != NULL) {
++		spa_hook_remove(&d->core_listener);
++		pw_core_disconnect(d->core);
++		d->core = NULL;
++	}
++	if (d->activate_event != NULL) {
++		pw_loop_destroy_source(d->loop, d->activate_event);
++		d->activate_event = NULL;
++	}
++	d->loop = NULL;
++	return 0;
++}
++
++static int module_compress_offload_forwarder_prepare(struct module *module)
++{
++	struct forwarder_data *d = module->user_data;
++	struct pw_properties *props = module->props;
++	const char *str;
++
++	PW_LOG_TOPIC_INIT(mod_topic);
++	str = pw_properties_get(props, "source_sink");
++	spa_scnprintf(d->source_name, sizeof(d->source_name), "%s",
++			str ? str : "pal_speaker_compress");
++	str = pw_properties_get(props, "target_sink");
++	spa_scnprintf(d->target_name, sizeof(d->target_name), "%s",
++			str ? str : "pal_sink_speaker_compress");
++	str = pw_properties_get(props, "codec");
++	spa_scnprintf(d->codec, sizeof(d->codec), "%s", str ? str : DEFAULT_CODEC);
++	str = pw_properties_get(props, "codec.aac.stream_format");
++	spa_scnprintf(d->aac_stream_format, sizeof(d->aac_stream_format), "%s", str ? str : "");
++	str = pw_properties_get(props, "codec.aac.codec_data");
++	spa_scnprintf(d->aac_codec_data, sizeof(d->aac_codec_data), "%s", str ? str : "");
++	d->aac_audio_object_type = pw_properties_get_uint32(props, "codec.aac.audio_object_type", 0);
++	d->rate = pw_properties_get_uint32(props, "rate", DEFAULT_RATE);
++	d->channels = pw_properties_get_uint32(props, "channels", DEFAULT_CHANNELS);
++	d->bitrate = pw_properties_get_uint32(props, "bitrate", DEFAULT_BITRATE);
++	d->block_size = pw_properties_get_uint32(props, "block_size", DEFAULT_BLOCK_SIZE);
++	spa_scnprintf(d->monitor_name, sizeof(d->monitor_name), "%s.monitor", d->source_name);
++	d->client_node_id = PW_ID_ANY;
++
++	if (!codec_is_auto(d->codec) && !codec_is_mp3(d->codec) && !codec_is_aac(d->codec)) {
++		pw_log_warn("compress-forwarder only supports auto, mp3, aac and aac_adts right now, requested codec=%s", d->codec);
++		return -ENOTSUP;
++	}
++	if (codec_is_aac_adts(d->codec) && d->aac_stream_format[0] == '\0')
++		spa_scnprintf(d->aac_stream_format, sizeof(d->aac_stream_format), "adts");
++	if (codec_is_aac_raw(d->codec) && d->aac_stream_format[0] == '\0')
++		spa_scnprintf(d->aac_stream_format, sizeof(d->aac_stream_format), "raw");
++	if (d->channels == 0)
++		d->channels = DEFAULT_CHANNELS;
++	if (d->rate == 0)
++		d->rate = DEFAULT_RATE;
++	if (d->block_size == 0)
++		d->block_size = DEFAULT_BLOCK_SIZE;
++
++	return 0;
++}
++
++static const struct spa_dict_item module_compress_offload_forwarder_info[] = {
++	{ PW_KEY_MODULE_DESCRIPTION, "Forward encoded PulseAudio streams to a compressed-offload sink" },
++	{ PW_KEY_MODULE_USAGE,       pulse_module_options },
++	{ PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
++};
++
++DEFINE_MODULE_INFO(module_compress_offload_forwarder) = {
++	.name       = "module-compress-offload-forwarder",
++	.prepare    = module_compress_offload_forwarder_prepare,
++	.load       = module_compress_offload_forwarder_load,
++	.unload     = module_compress_offload_forwarder_unload,
++	.properties = &SPA_DICT_INIT_ARRAY(module_compress_offload_forwarder_info),
++	.data_size  = sizeof(struct forwarder_data),
++};
+diff --git a/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.h b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.h
+new file mode 100644
+index 000000000..e936aad09
+--- /dev/null
++++ b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.h
+@@ -0,0 +1,20 @@
++/* PipeWire */
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
++
++#ifndef MODULE_COMPRESS_OFFLOAD_FORWARDER_H
++#define MODULE_COMPRESS_OFFLOAD_FORWARDER_H
++
++#include <spa/utils/dict.h>
++
++#define COMPRESS_RAW_AAC_MAGIC_0 'P'
++#define COMPRESS_RAW_AAC_MAGIC_1 'W'
++#define COMPRESS_RAW_AAC_MAGIC_2 'A'
++#define COMPRESS_RAW_AAC_MAGIC_3 'A'
++#define COMPRESS_RAW_AAC_HEADER_SIZE 8u
++
++void compress_offload_forwarder_update(const char *source_name,
++		const struct spa_dict *props);
++void compress_offload_forwarder_teardown(const char *source_name);
++
++#endif
+diff --git a/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-sink.c b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-sink.c
+new file mode 100644
+index 000000000..832131e68
+--- /dev/null
++++ b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-sink.c
+@@ -0,0 +1,308 @@
++/* PipeWire */
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
++
++#include <errno.h>
++#include <stdlib.h>
++
++#include <spa/utils/result.h>
++#include <pipewire/pipewire.h>
++
++#include "../module.h"
++
++/** \page page_pulse_module_compress_offload_sink Compress Offload Sink
++ *
++ * ## Module Name
++ *
++ * `module-compress-offload-sink`
++ *
++ * ## Module Options
++ *
++ * @pulse_module_options@
++ */
++
++static const char *const pulse_module_options =
++	"sink_name=<name of sink> "
++	"sink_properties=<properties for the sink> "
++	"target_sink=<node.name of the downstream compress-offload sink> "
++	"codec=<codec name, default auto> "
++	"rate=<sample rate, default 44100> "
++	"channels=<number of channels, default 2> "
++	"bitrate=<bit rate, default 128000>";
++
++#define NAME "compress-offload-sink"
++
++PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
++#define PW_LOG_TOPIC_DEFAULT mod_topic
++
++struct module_compress_offload_sink_data {
++	struct pw_core *core;
++	struct spa_hook core_listener;
++
++	struct pw_proxy *proxy;
++	struct spa_hook proxy_listener;
++};
++
++static void module_proxy_removed(void *data)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("compress-forwarder proxy removed: proxy=%p", d->proxy);
++	pw_proxy_destroy(d->proxy);
++}
++
++static void module_proxy_destroy(void *data)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("compress-forwarder proxy destroy: proxy=%p - scheduling module unload", d->proxy);
++	spa_hook_remove(&d->proxy_listener);
++	d->proxy = NULL;
++	module_schedule_unload(module);
++}
++
++static void module_proxy_bound_props(void *data, uint32_t global_id, const struct spa_dict *props)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("proxy %p bound id:%u module_index=%u", d->proxy, global_id, module->index);
++	pw_log_debug("compress-forwarder node successfully created and bound, emitting loaded");
++	module_emit_loaded(module, 0);
++}
++
++static void module_proxy_error(void *data, int seq, int res, const char *message)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_error("proxy %p error %d: %s", d->proxy, res, message);
++	pw_proxy_destroy(d->proxy);
++}
++
++static const struct pw_proxy_events proxy_events = {
++	PW_VERSION_PROXY_EVENTS,
++	.removed      = module_proxy_removed,
++	.bound_props  = module_proxy_bound_props,
++	.error        = module_proxy_error,
++	.destroy      = module_proxy_destroy,
++};
++
++static void module_core_error(void *data, uint32_t id, int seq, int res, const char *message)
++{
++	struct module *module = data;
++
++	pw_log_error("error id:%u seq:%d res:%d (%s): %s",
++			id, seq, res, spa_strerror(res), message);
++
++	if (id == PW_ID_CORE && res == -EPIPE)
++		module_schedule_unload(module);
++}
++
++static const struct pw_core_events core_events = {
++	PW_VERSION_CORE_EVENTS,
++	.error = module_core_error,
++};
++
++static int module_compress_offload_sink_load(struct module *module)
++{
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_info("compress-forwarder load: node=%s target=%s codec=%s rate=%s channels=%s bitrate=%s",
++			pw_properties_get(module->props, PW_KEY_NODE_NAME),
++			pw_properties_get(module->props, "compress.target.object"),
++			pw_properties_get(module->props, "codec.type"),
++			pw_properties_get(module->props, "codec.sample_rate"),
++			pw_properties_get(module->props, "codec.channels"),
++			pw_properties_get(module->props, "codec.bit_rate"));
++
++	d->core = pw_context_connect(module->impl->context, NULL, 0);
++	if (d->core == NULL) {
++		pw_log_error("compress-forwarder core connect failed: errno=%d (%s)",
++				errno, spa_strerror(-errno));
++		return -errno;
++	}
++
++	pw_log_debug("compress-forwarder core connected: core=%p", d->core);
++	pw_core_add_listener(d->core, &d->core_listener, &core_events, module);
++	pw_properties_setf(module->props, "pulse.module.id", "%u", module->index);
++
++	d->proxy = pw_core_create_object(d->core,
++					 "adapter", PW_TYPE_INTERFACE_Node, PW_VERSION_NODE,
++					 module->props ? &module->props->dict : NULL, 0);
++	if (d->proxy == NULL) {
++		pw_log_error("compress-forwarder adapter create failed: errno=%d (%s)",
++				errno, spa_strerror(-errno));
++		return -errno;
++	}
++
++	pw_log_debug("compress-forwarder adapter create requested: proxy=%p - waiting for bound_props", d->proxy);
++	pw_proxy_add_listener(d->proxy, &d->proxy_listener, &proxy_events, module);
++	return SPA_RESULT_RETURN_ASYNC(0);
++}
++
++static int module_compress_offload_sink_unload(struct module *module)
++{
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("compress-forwarder unload: proxy=%p core=%p - cleaning up", d->proxy, d->core);
++	if (d->proxy != NULL) {
++		spa_hook_remove(&d->proxy_listener);
++		pw_proxy_destroy(d->proxy);
++		d->proxy = NULL;
++	}
++	if (d->core != NULL) {
++		spa_hook_remove(&d->core_listener);
++		pw_core_disconnect(d->core);
++		d->core = NULL;
++	}
++	return 0;
++}
++
++static int module_compress_offload_sink_prepare(struct module * const module)
++{
++	struct pw_properties * const props = module->props;
++	const char *str;
++	uint32_t rate = 44100;
++	uint32_t channels = 2;
++	uint32_t bitrate = 128000;
++
++	PW_LOG_TOPIC_INIT(mod_topic);
++
++	if ((str = pw_properties_get(props, "sink_name")) != NULL) {
++		pw_log_debug("compress-forwarder option: sink_name=%s", str);
++		pw_properties_set(props, PW_KEY_NODE_NAME, str);
++		pw_properties_set(props, "sink_name", NULL);
++	} else {
++		pw_log_debug("compress-forwarder option: sink_name missing, using default");
++		pw_properties_set(props, PW_KEY_NODE_NAME, "compress-offload-sink");
++	}
++
++	if ((str = pw_properties_get(props, "sink_properties")) != NULL) {
++		pw_log_debug("compress-forwarder option: sink_properties=%s", str);
++		module_args_add_props(props, str);
++		pw_properties_set(props, "sink_properties", NULL);
++	}
++
++	if ((str = pw_properties_get(props, "target_sink")) != NULL) {
++		pw_log_debug("compress-forwarder option: target_sink=%s", str);
++		pw_properties_set(props, "compress.target.object", str);
++		pw_properties_set(props, "target_sink", NULL);
++	} else {
++		pw_log_warn("compress-forwarder option: target_sink missing; stream will not have explicit compress target");
++	}
++
++	if ((str = pw_properties_get(props, "rate")) != NULL) {
++		uint32_t v = (uint32_t)atoi(str);
++		if (v > 0)
++			rate = v;
++		pw_properties_set(props, "rate", NULL);
++	}
++	if ((str = pw_properties_get(props, "channels")) != NULL) {
++		uint32_t v = (uint32_t)atoi(str);
++		if (v > 0)
++			channels = v;
++		pw_properties_set(props, "channels", NULL);
++	}
++	if ((str = pw_properties_get(props, "bitrate")) != NULL) {
++		uint32_t v = (uint32_t)atoi(str);
++		if (v > 0)
++			bitrate = v;
++		pw_properties_set(props, "bitrate", NULL);
++	}
++	if ((str = pw_properties_get(props, "channel_map")) != NULL) {
++		pw_properties_set(props, "audio.position", str);
++		pw_properties_set(props, "channel_map", NULL);
++	} else {
++		switch (channels) {
++		case 1:
++			pw_properties_set(props, "audio.position", "[ MONO ]");
++			break;
++		case 2:
++			pw_properties_set(props, "audio.position", "[ FL FR ]");
++			break;
++		case 3:
++			pw_properties_set(props, "audio.position", "[ FL FR LFE ]");
++			break;
++		case 4:
++			pw_properties_set(props, "audio.position", "[ FL FR RL RR ]");
++			break;
++		case 5:
++			pw_properties_set(props, "audio.position", "[ FL FR FC RL RR ]");
++			break;
++		case 6:
++			pw_properties_set(props, "audio.position", "[ FL FR FC LFE RL RR ]");
++			break;
++		case 8:
++			pw_properties_set(props, "audio.position", "[ FL FR FC LFE RL RR SL SR ]");
++			break;
++		default:
++			break;
++		}
++	}
++
++	str = pw_properties_get(props, "codec");
++	pw_properties_set(props, "codec.type", str ? str : "auto");
++	pw_properties_set(props, "codec.formats", "[ mp3 aac_adts aac ]");
++	pw_properties_setf(props, "codec.sample_rate", "%u", rate);
++	pw_properties_setf(props, "codec.channels",    "%u", channels);
++	pw_properties_setf(props, "codec.bit_rate",    "%u", bitrate);
++	pw_properties_set(props, "codec", NULL);
++
++	if (pw_properties_get(props, PW_KEY_MEDIA_CLASS) == NULL)
++		pw_properties_set(props, PW_KEY_MEDIA_CLASS, "Audio/Sink");
++	if (pw_properties_get(props, PW_KEY_NODE_DESCRIPTION) == NULL)
++		pw_properties_setf(props, PW_KEY_NODE_DESCRIPTION, "%s (compress offload)",
++				pw_properties_get(props, PW_KEY_NODE_NAME));
++
++	/*
++	 * Advertise this node as an encoded-only sink so WirePlumber's
++	 * canPassthrough() allows linking compress streams to it.
++	 * audio.format=S16LE is kept as the synthetic PCM sample_spec that
++	 * Pulse clients see in pactl; no PCM conversion ever occurs.
++	 */
++	pw_properties_set(props, PW_KEY_AUDIO_FORMAT,                "S16LE");
++	pw_properties_setf(props, PW_KEY_AUDIO_RATE,                 "%u", rate);
++	pw_properties_setf(props, PW_KEY_AUDIO_CHANNELS,             "%u", channels);
++	pw_properties_set(props, "item.node.supports-encoded-fmts",  "true");
++	pw_properties_set(props, PW_KEY_NODE_VIRTUAL,                "true");
++	pw_properties_set(props, PW_KEY_PRIORITY_SESSION,            "1");
++	pw_properties_set(props, PW_KEY_PRIORITY_DRIVER,             "1");
++	pw_properties_set(props, "monitor.channel-volumes",          "false");
++	pw_properties_set(props, "monitor.passthrough",              "true");
++	pw_properties_set(props, "channelmix.disable",                "true");
++	pw_properties_set(props, "resample.disable",                  "true");
++	pw_properties_set(props, "compress.carrier.rate",             "48000");
++	pw_properties_set(props, "compress.carrier.channels",         "2");
++	pw_properties_set(props, "compress.offload",                 "true");
++	pw_properties_set(props, PW_KEY_FACTORY_NAME,                "support.null-audio-sink");
++
++	pw_log_info("prepared compress-forwarder alias: name=%s target=%s codec=%s rate=%u channels=%u bitrate=%u media.class=%s audio.format=%s virtual=%s factory=%s",
++			pw_properties_get(props, PW_KEY_NODE_NAME),
++			pw_properties_get(props, "compress.target.object"),
++			pw_properties_get(props, "codec.type"),
++			rate, channels, bitrate,
++			pw_properties_get(props, PW_KEY_MEDIA_CLASS),
++			pw_properties_get(props, PW_KEY_AUDIO_FORMAT),
++			pw_properties_get(props, PW_KEY_NODE_VIRTUAL),
++			pw_properties_get(props, PW_KEY_FACTORY_NAME));
++
++	return 0;
++}
++
++static const struct spa_dict_item module_compress_offload_sink_info[] = {
++	{ PW_KEY_MODULE_DESCRIPTION, "Pulse-visible alias sink for compressed offload playback" },
++	{ PW_KEY_MODULE_USAGE,       pulse_module_options },
++	{ PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
++};
++
++DEFINE_MODULE_INFO(module_compress_offload_sink) = {
++	.name       = "module-compress-offload-sink",
++	.prepare    = module_compress_offload_sink_prepare,
++	.load       = module_compress_offload_sink_load,
++	.unload     = module_compress_offload_sink_unload,
++	.properties = &SPA_DICT_INIT_ARRAY(module_compress_offload_sink_info),
++	.data_size  = sizeof(struct module_compress_offload_sink_data),
++};
+-- 
+GitLab
+
+
+From 574fec7ebc482a462b2842422cec156aa9a43f1e Mon Sep 17 00:00:00 2001
+From: Harsh Rai <harsh.rai@oss.qualcomm.com>
+Date: Fri, 23 Oct 2026 17:45:41 +0530
+Subject: [PATCH 4/4] pulse-server: preserve encoded streams for compressed
+ offload
+
+Recognize compressed-offload sinks when Pulse playback streams are
+created and advertise MP3, AAC ADTS, and raw AAC formats with their
+codec parameters.
+
+Configure compressed streams for byte-preserving transport: use a
+single-byte frame size, disable format conversion, remove playback
+prebuffering, and connect the stream with an encoded format while
+retaining the negotiated codec properties.
+
+Frame each raw AAC access unit with its payload length before writing it
+to the Pulse ring buffer. Include the framing bytes in buffer-capacity
+checks and use the stream's allocated buffer size when wrapping the
+write position.
+
+Track the forwarding source on each stream and notify the forwarder when
+the Pulse playback stream is freed. This lets the target stream and any
+pending encoded data be released when playback ends or the client is
+removed.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
+Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
+---
+ .../module-protocol-pulse/pulse-server.c      | 654 +++++++++++++++++-
+ src/modules/module-protocol-pulse/server.c    |  35 +-
+ src/modules/module-protocol-pulse/stream.c    |   5 +
+ src/modules/module-protocol-pulse/stream.h    |   2 +
+ 4 files changed, 675 insertions(+), 21 deletions(-)
+
+diff --git a/src/modules/module-protocol-pulse/pulse-server.c b/src/modules/module-protocol-pulse/pulse-server.c
+index 153be0c4f..d8a8591d8 100644
+--- a/src/modules/module-protocol-pulse/pulse-server.c
++++ b/src/modules/module-protocol-pulse/pulse-server.c
+@@ -34,6 +34,7 @@
+ #include <pipewire/extensions/metadata.h>
+ 
+ #include "pulse-server.h"
++#include "modules/pulse-module-compress-offload-forwarder.h"
+ #include "client.h"
+ #include "collect.h"
+ #include "commands.h"
+@@ -89,6 +90,9 @@ struct temporary_move_data {
+ 	uint8_t used:1;
+ };
+ 
++/* Buffer size used for compress-offload streams (frame_size == 1). */
++#define COMPRESS_OFFLOAD_BUF_SIZE  16484u
++
+ static struct sample *find_sample(struct impl *impl, uint32_t index, const char *name)
+ {
+ 	union pw_map_item *item;
+@@ -1223,10 +1227,18 @@ static const struct spa_pod *get_buffers_param(struct stream *s,
+ 	blocks = 1;
+ 	stride = s->frame_size;
+ 
++	/* compressed offload uses byte granularity */
++	if (s->frame_size == 1) {
++		size = COMPRESS_OFFLOAD_BUF_SIZE;
++		pw_log_debug("[%s] get_buffers_param: compress offload path size=%u", s->client->name, size);
++		goto build_buffers_param;
++	}
++
+ 	size = defs->quantum_limit * s->frame_size;
+ 
+ 	pw_log_info("[%s] stride %d size %u", s->client->name, stride, size);
+ 
++build_buffers_param:
+ 	param = spa_pod_builder_add_object(b,
+ 			SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,
+ 			SPA_PARAM_BUFFERS_buffers, SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,
+@@ -1252,6 +1264,23 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
+ 	if (id != SPA_PARAM_Format || param == NULL)
+ 		return;
+ 
++	/* For compress-offload streams, force byte-granularity regardless
++	 * of negotiated format (we connect with S16LE but data is compressed). */
++	{
++		const char *co = stream->props ?
++			pw_properties_get(stream->props, "compress.offload") : NULL;
++		if (co && pw_properties_parse_bool(co)) {
++			uint32_t media_type = 0, media_subtype = 0;
++			spa_format_parse(param, &media_type, &media_subtype);
++			stream->frame_size = 1;
++			stream->rate = stream->ss.rate ? stream->ss.rate :
++				pw_properties_get_uint32(stream->props, "codec.sample_rate", 44100);
++			pw_log_debug("[%s] compress-offload stream_param_changed: forcing frame_size=1 rate=%u subtype=%u",
++				stream->client->name, stream->rate, media_subtype);
++			goto stream_param_format_done;
++		}
++	}
++
+ 	if ((res = format_parse_param(param, false, &stream->ss, &stream->map, NULL, NULL)) < 0) {
+ 		pw_stream_set_error(stream->stream, res, "format not supported");
+ 		return;
+@@ -1267,6 +1296,9 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
+ 		return;
+ 	}
+ 	stream->rate = stream->ss.rate;
++stream_param_format_done:
++	pw_log_debug("[%s] stream param done: frame_size=%u rate=%u ss.format=%u",
++			stream->client->name, stream->frame_size, stream->rate, stream->ss.format);
+ 
+ 	if (stream->create_tag != SPA_ID_INVALID) {
+ 		struct pw_manager_object *peer;
+@@ -1621,6 +1653,395 @@ static void log_format_info(struct impl *impl, enum spa_log_level level, struct
+ 				impl, it->key, it->value);
+ }
+ 
++static const struct spa_pod *build_compress_offload_format(struct spa_pod_builder *b,
++		uint32_t id, const struct pw_properties *props, uint32_t *rate)
++{
++	const char *codec;
++	const char *stream_format;
++	struct spa_audio_info info;
++	uint32_t sample_rate, channels, bitrate;
++
++	spa_zero(info);
++	info.media_type = SPA_MEDIA_TYPE_audio;
++	codec = pw_properties_get(props, "codec.type");
++	stream_format = pw_properties_get(props, "codec.aac.stream_format");
++	sample_rate = pw_properties_get_uint32(props, "codec.sample_rate", 44100);
++	channels = pw_properties_get_uint32(props, "codec.channels", 2);
++	bitrate = pw_properties_get_uint32(props, "codec.bit_rate", 128000);
++
++	if (codec == NULL || spa_streq(codec, "mp3")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
++		info.info.mp3.rate = sample_rate;
++		info.info.mp3.channels = channels;
++		info.info.mp3.channel_mode = channels == 1 ?
++			SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
++	} else if (spa_streq(codec, "aac") || spa_streq(codec, "aac_adts")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = sample_rate;
++		info.info.aac.channels = channels;
++		info.info.aac.bitrate = bitrate;
++		info.info.aac.audio_object_type = pw_properties_get_uint32(props,
++				"codec.aac.audio_object_type", 0);
++		info.info.aac.stream_format = spa_streq(codec, "aac_adts") ||
++				stream_format == NULL || spa_streq(stream_format, "adts") ?
++				SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS :
++				SPA_AUDIO_AAC_STREAM_FORMAT_RAW;
++	} else if (spa_streq(codec, "aac_adif")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = sample_rate;
++		info.info.aac.channels = channels;
++		info.info.aac.bitrate = bitrate;
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_ADIF;
++	} else if (spa_streq(codec, "aac_latm")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = sample_rate;
++		info.info.aac.channels = channels;
++		info.info.aac.bitrate = bitrate;
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_MP4LATM;
++	} else if (spa_streq(codec, "flac")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_flac;
++		info.info.flac.rate = sample_rate;
++		info.info.flac.channels = channels;
++	} else if (spa_streq(codec, "vorbis")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_vorbis;
++		info.info.vorbis.rate = sample_rate;
++		info.info.vorbis.channels = channels;
++	} else if (spa_streq(codec, "opus")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_opus;
++		info.info.opus.rate = sample_rate;
++		info.info.opus.channels = channels;
++	} else if (spa_streq(codec, "wma") || spa_streq(codec, "wma_std")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_wma;
++		info.info.wma.rate = sample_rate;
++		info.info.wma.channels = channels;
++		info.info.wma.bitrate = bitrate;
++		info.info.wma.profile = SPA_AUDIO_WMA_PROFILE_WMA9;
++	} else if (spa_streq(codec, "wma_pro")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_wma;
++		info.info.wma.rate = sample_rate;
++		info.info.wma.channels = channels;
++		info.info.wma.bitrate = bitrate;
++		info.info.wma.profile = SPA_AUDIO_WMA_PROFILE_WMA9_PRO;
++	} else {
++		errno = ENOTSUP;
++		return NULL;
++	}
++	if (rate != NULL)
++		*rate = sample_rate;
++	return spa_format_audio_build(b, id, &info);
++}
++
++static void synthesize_compress_offload_spec(struct sample_spec *ss,
++		struct channel_map *map, const struct pw_properties *props)
++{
++	uint32_t channels;
++
++	ss->format = SPA_AUDIO_FORMAT_S16_LE;
++	ss->rate = pw_properties_get_uint32(props, "compress.carrier.rate", 48000);
++	channels = pw_properties_get_uint32(props, "compress.carrier.channels", 2);
++	ss->channels = (uint8_t)(channels > 0 ? channels : 2);
++	spa_zero(*map);
++	switch (ss->channels) {
++	case 1: channel_map_parse("mono", map); break;
++	case 2: channel_map_parse("stereo", map); break;
++	case 3: channel_map_parse("surround-21", map); break;
++	case 4: channel_map_parse("surround-40", map); break;
++	case 5: channel_map_parse("surround-50", map); break;
++	case 6: channel_map_parse("surround-51", map); break;
++	case 8: channel_map_parse("surround-71", map); break;
++	default: channel_map_parse("stereo", map); ss->channels = 2; break;
++	}
++}
++
++static uint32_t compress_format_get_u32_prop(const struct format_info *format,
++		const char *key, uint32_t default_value)
++{
++	const char *str, *val;
++	struct spa_json it[2];
++	int len, value;
++
++	if (format->props == NULL || (str = pw_properties_get(format->props, key)) == NULL)
++		return default_value;
++	if ((len = spa_json_begin(&it[0], str, strlen(str), &val)) <= 0)
++		return default_value;
++	if (spa_json_is_int(val, len) && spa_json_parse_int(val, len, &value) > 0 && value > 0)
++		return (uint32_t)value;
++	if ((value = atoi(str)) > 0)
++		return (uint32_t)value;
++	return default_value;
++}
++
++static const char *compress_format_get_string_prop(const struct format_info *format,
++		const char *key, char *buffer, size_t size)
++{
++	const char *str, *val;
++	struct spa_json it[2];
++	int len;
++
++	if (format->props == NULL || (str = pw_properties_get(format->props, key)) == NULL)
++		return NULL;
++	if ((len = spa_json_begin(&it[0], str, strlen(str), &val)) > 0 && spa_json_is_string(val, len))
++		return spa_scnprintf(buffer, size, "%.*s", len - 2, val + 1) >= 0 ? buffer : NULL;
++	return str;
++}
++
++static uint32_t compress_format_get_u32_prop_compat(const struct format_info *format,
++		const char *primary, const char *compat, uint32_t default_value)
++{
++	uint32_t value;
++
++	value = compress_format_get_u32_prop(format, primary, 0);
++	if (value == 0 && compat != NULL)
++		value = compress_format_get_u32_prop(format, compat, 0);
++	return value != 0 ? value : default_value;
++}
++
++static const char *compress_format_get_string_prop_compat(
++		const struct format_info *format, const char *primary,
++		const char *compat, char *buffer, size_t size)
++{
++	const char *str;
++
++	str = compress_format_get_string_prop(format, primary, buffer, size);
++	if (str == NULL && compat != NULL)
++		str = compress_format_get_string_prop(format, compat, buffer, size);
++	return str;
++}
++
++static bool compress_format_stream_format_is(const struct format_info *format, const char *expected)
++{
++	char stream_format[32];
++	const char *str;
++
++	str = compress_format_get_string_prop_compat(format, "format.stream_format",
++			"stream-format", stream_format, sizeof(stream_format));
++	return str == NULL ? spa_streq(expected, "adts") : spa_streq(str, expected);
++}
++
++static bool compress_hex_nibble(char c, uint8_t *value)
++{
++	if (c >= '0' && c <= '9')
++		*value = c - '0';
++	else if (c >= 'a' && c <= 'f')
++		*value = c - 'a' + 10;
++	else if (c >= 'A' && c <= 'F')
++		*value = c - 'A' + 10;
++	else
++		return false;
++	return true;
++}
++
++static uint32_t compress_read_bits(const uint8_t *data, size_t size,
++		uint32_t *bit_offset, uint32_t n_bits)
++{
++	uint32_t value = 0, i;
++
++	if (*bit_offset + n_bits > size * 8)
++		return SPA_ID_INVALID;
++	for (i = 0; i < n_bits; i++) {
++		uint32_t byte = (*bit_offset + i) / 8;
++		uint32_t bit = 7 - ((*bit_offset + i) % 8);
++		value = (value << 1) | ((data[byte] >> bit) & 1);
++	}
++	*bit_offset += n_bits;
++	return value;
++}
++
++struct compress_aac_config {
++	uint32_t object_type;
++	uint32_t rate;
++	uint32_t channels;
++};
++
++static uint32_t compress_aac_sample_rate(const uint8_t *data, size_t size,
++		uint32_t *bit_offset)
++{
++	static const uint32_t rates[] = {
++		96000, 88200, 64000, 48000, 44100, 32000, 24000,
++		22050, 16000, 12000, 11025, 8000, 7350,
++	};
++	uint32_t index = compress_read_bits(data, size, bit_offset, 4);
++
++	if (index == SPA_ID_INVALID)
++		return 0;
++	if (index == 15) {
++		uint32_t rate = compress_read_bits(data, size, bit_offset, 24);
++		return rate == SPA_ID_INVALID ? 0 : rate;
++	}
++	return index < SPA_N_ELEMENTS(rates) ? rates[index] : 0;
++}
++
++static uint32_t compress_aac_object_type(const uint8_t *data, size_t size,
++		uint32_t *bit_offset)
++{
++	uint32_t object_type = compress_read_bits(data, size, bit_offset, 5);
++
++	if (object_type == SPA_ID_INVALID)
++		return 0;
++	if (object_type == 31) {
++		uint32_t ext = compress_read_bits(data, size, bit_offset, 6);
++		if (ext == SPA_ID_INVALID)
++			return 0;
++		object_type = 32 + ext;
++	}
++	return object_type;
++}
++
++static bool compress_parse_audio_specific_config(const char *str,
++		struct compress_aac_config *config)
++{
++	uint8_t data[64];
++	uint32_t bit_offset = 0, channel_config, extension_rate;
++	size_t n_data = 0;
++	bool high = true;
++	uint8_t byte = 0;
++	static const uint8_t channel_count[] = { 0, 1, 2, 3, 4, 5, 6, 8 };
++
++	if (str == NULL || config == NULL)
++		return false;
++	spa_zero(*config);
++	if (spa_strstartswith(str, "(buffer)"))
++		str += strlen("(buffer)");
++	if (spa_strstartswith(str, "0x") || spa_strstartswith(str, "0X"))
++		str += 2;
++	for (; *str != '\0' && n_data < sizeof(data); str++) {
++		uint8_t nibble;
++
++		if (!compress_hex_nibble(*str, &nibble))
++			continue;
++		if (high) {
++			byte = nibble << 4;
++			high = false;
++		} else {
++			data[n_data++] = byte | nibble;
++			high = true;
++		}
++	}
++	if (!high || n_data == 0)
++		return false;
++
++	config->object_type = compress_aac_object_type(data, n_data, &bit_offset);
++	config->rate = compress_aac_sample_rate(data, n_data, &bit_offset);
++	channel_config = compress_read_bits(data, n_data, &bit_offset, 4);
++	if (config->object_type == 0 || config->rate == 0 ||
++	    channel_config == SPA_ID_INVALID)
++		return false;
++	if (channel_config < SPA_N_ELEMENTS(channel_count))
++		config->channels = channel_count[channel_config];
++
++	if (config->object_type == 5 || config->object_type == 29) {
++		extension_rate = compress_aac_sample_rate(data, n_data, &bit_offset);
++		if (extension_rate != 0)
++			config->rate = extension_rate;
++	}
++	return true;
++}
++
++static int set_compress_offload_props_from_format(struct pw_properties *props,
++		const struct format_info *format)
++{
++	const char *codec, *stream_format;
++	char stream_format_buffer[32];
++	bool is_aac = false;
++
++	switch (format->encoding) {
++	case ENCODING_MP3:
++		codec = "mp3";
++		break;
++	case ENCODING_AAC:
++		if (!compress_format_stream_format_is(format, "raw"))
++			return -ENOTSUP;
++		codec = "aac";
++		is_aac = true;
++		break;
++	case ENCODING_AAC_ADTS:
++		if (!compress_format_stream_format_is(format, "adts"))
++			return -ENOTSUP;
++		codec = "aac_adts";
++		is_aac = true;
++		break;
++	case ENCODING_MPEG2_AAC_IEC61937:
++		stream_format = compress_format_get_string_prop_compat(format,
++				"format.stream_format", "stream-format",
++				stream_format_buffer, sizeof(stream_format_buffer));
++		if (stream_format == NULL || spa_streq(stream_format, "adts"))
++			codec = "aac_adts";
++		else if (spa_streq(stream_format, "raw"))
++			codec = "aac";
++		else
++			return -ENOTSUP;
++		is_aac = true;
++		break;
++	default:
++		return -ENOTSUP;
++	}
++
++	pw_properties_set(props, "codec.type", codec);
++	pw_properties_setf(props, "codec.sample_rate", "%u",
++			compress_format_get_u32_prop(format, "format.rate",
++				pw_properties_get_uint32(props, "codec.sample_rate", 48000)));
++	pw_properties_setf(props, "codec.channels", "%u",
++			compress_format_get_u32_prop_compat(format, "format.channels", "channels",
++				pw_properties_get_uint32(props, "codec.channels", 2)));
++	pw_properties_setf(props, "codec.bit_rate", "%u",
++			compress_format_get_u32_prop_compat(format, "format.bit_rate", "bitrate",
++				pw_properties_get_uint32(props, "codec.bit_rate", 128000)));
++	if (is_aac) {
++		char stream_format[32], codec_data[256];
++		const char *str;
++		struct compress_aac_config aac_config;
++		uint32_t object_type = compress_format_get_u32_prop_compat(format,
++				"format.audio_object_type", "audio-object-type",
++				pw_properties_get_uint32(props, "codec.aac.audio_object_type", 0));
++
++		str = compress_format_get_string_prop_compat(format, "format.stream_format",
++				"stream-format", stream_format, sizeof(stream_format));
++		pw_properties_set(props, "codec.aac.stream_format",
++				str != NULL ? str : (spa_streq(codec, "aac_adts") ? "adts" : "raw"));
++		str = compress_format_get_string_prop_compat(format, "format.codec_data",
++				"codec_data", codec_data, sizeof(codec_data));
++		if (str == NULL)
++			str = compress_format_get_string_prop(format, "codec-data",
++					codec_data, sizeof(codec_data));
++		if (str == NULL)
++			str = pw_properties_get(props, "codec.aac.codec_data");
++		if (str != NULL) {
++			pw_properties_set(props, "codec.aac.codec_data", str);
++			if (compress_parse_audio_specific_config(str, &aac_config)) {
++				if (object_type == 0)
++					object_type = aac_config.object_type;
++				if (aac_config.rate != 0)
++					pw_properties_setf(props, "codec.sample_rate", "%u", aac_config.rate);
++				if (aac_config.channels != 0)
++					pw_properties_setf(props, "codec.channels", "%u", aac_config.channels);
++			}
++		}
++		if (object_type == 0 && spa_streq(codec, "aac_adts"))
++			object_type = 2;
++		if (object_type != 0)
++			pw_properties_setf(props, "codec.aac.audio_object_type", "%u", object_type);
++	}
++	return 0;
++}
++
++static int init_compress_format_info(struct format_info *format,
++		enum encoding encoding, uint32_t rate, uint32_t channels, uint32_t bitrate)
++{
++	spa_zero(*format);
++	format->encoding = encoding;
++	format->props = pw_properties_new(NULL, NULL);
++	if (format->props == NULL)
++		return -errno;
++	pw_properties_setf(format->props, "format.rate", "%u", rate);
++	pw_properties_setf(format->props, "format.channels", "%u", channels);
++	if (encoding == ENCODING_AAC || encoding == ENCODING_AAC_ADTS) {
++		pw_properties_setf(format->props, "format.bit_rate", "%u", bitrate);
++		pw_properties_set(format->props, "format.stream_format",
++				encoding == ENCODING_AAC_ADTS ? "\"adts\"" : "\"raw\"");
++	}
++	return 0;
++}
++
+ static int do_create_playback_stream(struct client *client, uint32_t command, uint32_t tag, struct message *m)
+ {
+ 	struct impl *impl = client->impl;
+@@ -1646,7 +2067,9 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 		muted_set = false,
+ 		fail_on_suspend = false,
+ 		relative_volume = false,
+-		passthrough = false;
++		passthrough = false,
++		compress_offload = false,
++		compress_format_selected = false;
+ 	struct volume volume;
+ 	struct pw_properties *props = NULL;
+ 	uint8_t n_formats = 0;
+@@ -1705,6 +2128,70 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	}
+ 	o = find_device(client, sink_index, sink_name, true, &is_monitor);
+ 
++	if (o != NULL) {
++		const struct pw_node_info *ninfo = o->info;
++		const struct spa_dict *sp = (ninfo && ninfo->props) ? ninfo->props : NULL;
++		char node_name_buf[256] = {0};
++		const char *node_name;
++		const char *co;
++		const char *_nn = pw_properties_get(o->props, PW_KEY_NODE_NAME);
++
++		if (_nn)
++			snprintf(node_name_buf, sizeof(node_name_buf), "%s", _nn);
++		node_name = node_name_buf[0] ? node_name_buf : NULL;
++		co = sp ? spa_dict_lookup(sp, "compress.offload") : NULL;
++		pw_log_debug("[%s] compress-offload check: node=%s ninfo=%p co=%s",
++				client->name, node_name ? node_name : "(null)", ninfo, co ? co : "(null)");
++		if (co && spa_atob(co)) {
++			char target_buf[256] = {0};
++			char codec_buf[64] = {0};
++			char rate_buf[32] = {0};
++			char channels_buf[16] = {0};
++			char bitrate_buf[32] = {0};
++			const char *target;
++			const char *codec;
++			const char *rate_s;
++			const char *channels;
++			const char *bitrate;
++			const char *_s;
++
++			if ((_s = spa_dict_lookup(sp, "compress.target.object")) != NULL)
++				snprintf(target_buf, sizeof(target_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.type")) != NULL)
++				snprintf(codec_buf, sizeof(codec_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.sample_rate")) != NULL)
++				snprintf(rate_buf, sizeof(rate_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.channels")) != NULL)
++				snprintf(channels_buf, sizeof(channels_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.bit_rate")) != NULL)
++				snprintf(bitrate_buf, sizeof(bitrate_buf), "%s", _s);
++
++			target = target_buf[0] ? target_buf : NULL;
++			codec = codec_buf[0] ? codec_buf : NULL;
++			rate_s = rate_buf[0] ? rate_buf : NULL;
++			channels = channels_buf[0] ? channels_buf : NULL;
++			bitrate = bitrate_buf[0] ? bitrate_buf : NULL;
++
++				pw_properties_set(props, "compress.offload", "true");
++				if (node_name != NULL)
++					pw_properties_set(props, "compress.forwarder.source", node_name);
++				pw_properties_set(props, "item.node.supports-encoded-fmts", "true");
++			pw_properties_set(props, PW_KEY_MEDIA_TYPE, "Audio");
++			pw_properties_set(props, PW_KEY_MEDIA_CATEGORY, "Playback");
++			pw_properties_set(props, PW_KEY_MEDIA_ROLE, "Music");
++			if (codec) pw_properties_set(props, "codec.type", codec);
++			if (rate_s) pw_properties_set(props, "codec.sample_rate", rate_s);
++			if (channels) pw_properties_set(props, "codec.channels", channels);
++			if (bitrate) pw_properties_set(props, "codec.bit_rate", bitrate);
++
++			pw_log_info("[%s] detected compress-offload sink=%s target=%s codec=%s",
++					client->name, node_name ? node_name : "(null)",
++					target ? target : "(null)", codec ? codec : "(null)");
++			pw_log_debug("[%s] compress target=%s - leaving sink_name=%s for virtual sink routing",
++					client->name, target ? target : "(null)", sink_name ? sink_name : "(null)");
++		}
++	}
++
+ 	spa_zero(fix_ss);
+ 	spa_zero(fix_map);
+ 	if ((fix_format || fix_rate || fix_channels) && o != NULL) {
+@@ -1752,6 +2239,27 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 			goto error_protocol;
+ 	}
+ 
++	compress_offload = pw_properties_parse_bool(
++			pw_properties_get(props, "compress.offload"));
++	if (!compress_offload && sink_name != NULL &&
++	    spa_streq(sink_name, "pal_speaker_compress")) {
++		compress_offload = true;
++		pw_properties_set(props, "compress.offload", "true");
++		pw_properties_set(props, "compress.forwarder.source", "pal_speaker_compress");
++		pw_properties_set(props, "compress.target.object", "pal_sink_speaker_compress");
++		pw_properties_set(props, "item.node.supports-encoded-fmts", "true");
++		if (pw_properties_get(props, "codec.type") == NULL)
++			pw_properties_set(props, "codec.type", "mp3");
++		if (pw_properties_get(props, "codec.sample_rate") == NULL)
++			pw_properties_set(props, "codec.sample_rate", "48000");
++		if (pw_properties_get(props, "codec.channels") == NULL)
++			pw_properties_set(props, "codec.channels", "2");
++		if (pw_properties_get(props, "codec.bit_rate") == NULL)
++			pw_properties_set(props, "codec.bit_rate", "128000");
++		pw_log_debug("[%s] using byte-preserving compress-offload path for sink=%s",
++				client->name, sink_name);
++	}
++
+ 	if (client->version >= 21) {
+ 		if (message_get(m,
+ 				TAG_U8, &n_formats,
+@@ -1769,7 +2277,12 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 						TAG_INVALID) < 0)
+ 					goto error_protocol;
+ 
+-				if (n_params < MAX_FORMATS &&
++				if (compress_offload) {
++					log_format_info(impl, SPA_LOG_LEVEL_DEBUG, &format);
++					if (!compress_format_selected &&
++					    set_compress_offload_props_from_format(props, &format) == 0)
++						compress_format_selected = true;
++				} else if (n_params < MAX_FORMATS &&
+ 				    (params[n_params] = format_info_build_param(&b,
+ 						SPA_PARAM_EnumFormat, &format, &r)) != NULL) {
+ 					n_params++;
+@@ -1783,7 +2296,26 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 			}
+ 		}
+ 	}
+-	if (sample_spec_valid(&ss)) {
++	if (compress_offload) {
++		uint32_t compress_rate = 0;
++		if (n_params < MAX_FORMATS &&
++		    (params[n_params] = build_compress_offload_format(&b,
++					SPA_PARAM_EnumFormat, props, &compress_rate)) != NULL) {
++			n_params++;
++			n_valid_formats++;
++			ss_rate = rate = compress_rate;
++			synthesize_compress_offload_spec(&ss, &map, props);
++			pw_log_debug("[%s] synthesized compress-offload format codec=%s rate=%u channels=%u",
++					client->name, pw_properties_get(props, "codec.type"), compress_rate,
++					pw_properties_get_uint32(props, "codec.channels", 2));
++		} else {
++			pw_log_warn("%p: unsupported compress codec:%s",
++					impl, pw_properties_get(props, "codec.type"));
++		}
++		compress_offload_forwarder_update(
++				pw_properties_get(props, "compress.forwarder.source"),
++				&props->dict);
++	} else if (sample_spec_valid(&ss)) {
+ 		struct sample_spec sfix = ss;
+ 		struct channel_map mfix = map;
+ 
+@@ -1807,6 +2339,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	if (m->offset != m->length)
+ 		goto error_protocol;
+ 
++	pw_log_debug("[%s] format check: n_valid=%u n_params=%u compress=%d passthrough=%d",
++			client->name, n_valid_formats, n_params, compress_offload, passthrough);
+ 	if (n_valid_formats == 0)
+ 		goto error_no_formats;
+ 
+@@ -1816,6 +2350,16 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	stream = stream_new(client, STREAM_TYPE_PLAYBACK, tag, &ss, &map, &attr);
+ 	if (stream == NULL)
+ 		goto error_errno;
++	stream->compress_offload = compress_offload;
++	if (compress_offload) {
++		const char *forwarder_source =
++				pw_properties_get(props, "compress.forwarder.source");
++
++		if (forwarder_source != NULL)
++			spa_scnprintf(stream->compress_forwarder_source,
++					sizeof(stream->compress_forwarder_source), "%s",
++					forwarder_source);
++	}
+ 
+ 	stream->corked = corked;
+ 	stream->is_paused = corked;
+@@ -1835,6 +2379,11 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	if (rate != 0) {
+ 		struct spa_fraction lat;
+ 		fix_playback_buffer_attr(stream, &attr, ss_rate, &lat);
++		if (compress_offload) {
++			attr.prebuf = 0;
++			pw_log_debug("[%s] compress-offload uses immediate playback prebuf=0",
++					client->name);
++		}
+ 		pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", rate);
+ 		pw_properties_setf(props, PW_KEY_NODE_LATENCY, "%u/%u",
+ 				lat.num, lat.denom);
+@@ -1844,6 +2393,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	flags = 0;
+ 	if (no_move)
+ 		flags |= PW_STREAM_FLAG_DONT_RECONNECT;
++	if (compress_offload)
++		flags |= PW_STREAM_FLAG_NO_CONVERT;
+ 	if (corked)
+ 		flags |= PW_STREAM_FLAG_INACTIVE;
+ 
+@@ -1875,14 +2426,35 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 			&stream->stream_listener,
+ 			&stream_events, stream);
+ 
+-	pw_stream_connect(stream->stream,
+-			PW_DIRECTION_OUTPUT,
+-			SPA_ID_INVALID,
+-			flags |
+-			PW_STREAM_FLAG_AUTOCONNECT |
+-			PW_STREAM_FLAG_RT_PROCESS |
+-			PW_STREAM_FLAG_MAP_BUFFERS,
+-			params, n_params);
++	if (compress_offload) {
++		uint8_t raw_buf[256];
++		struct spa_pod_builder rb = SPA_POD_BUILDER_INIT(raw_buf, sizeof(raw_buf));
++		struct spa_audio_info_raw raw_info = {
++			.format = SPA_AUDIO_FORMAT_S16_LE,
++			.rate = ss.rate ? ss.rate : 44100,
++			.channels = ss.channels ? ss.channels : 2,
++		};
++		const struct spa_pod *raw_params[1];
++		raw_params[0] = spa_format_audio_raw_build(&rb, SPA_PARAM_EnumFormat, &raw_info);
++		pw_log_debug("[%s] pw_stream_connect: using raw S16LE param for compress sink", client->name);
++		pw_stream_connect(stream->stream,
++				PW_DIRECTION_OUTPUT,
++				SPA_ID_INVALID,
++				flags |
++				PW_STREAM_FLAG_AUTOCONNECT |
++				PW_STREAM_FLAG_RT_PROCESS |
++				PW_STREAM_FLAG_MAP_BUFFERS,
++				raw_params, 1);
++	} else {
++		pw_stream_connect(stream->stream,
++				PW_DIRECTION_OUTPUT,
++				SPA_ID_INVALID,
++				flags |
++				PW_STREAM_FLAG_AUTOCONNECT |
++				PW_STREAM_FLAG_RT_PROCESS |
++				PW_STREAM_FLAG_MAP_BUFFERS,
++				params, n_params);
++	}
+ 
+ 	stream_update_tag_param(stream);
+ 
+@@ -3927,9 +4499,50 @@ static int fill_sink_info(struct client *client, struct message *m,
+ 	}
+ 	if (client->version >= 21) {
+ 		struct pw_manager_param *p;
+-		struct format_info info[32];
++		struct format_info formats[32];
+ 		uint32_t i, n_info = 0;
+ 		struct spa_list *param_list = pw_manager_object_get_param_list(o);
++		bool compress_offload = pw_properties_parse_bool(
++				spa_dict_lookup(info->props, "compress.offload"));
++		uint32_t compress_rate = 48000, compress_channels = 2, compress_bitrate = 128000;
++
++		if (compress_offload) {
++			const char *str;
++
++			if ((str = spa_dict_lookup(info->props, "codec.sample_rate")) != NULL)
++				compress_rate = (uint32_t)atoi(str);
++			if ((str = spa_dict_lookup(info->props, "codec.channels")) != NULL)
++				compress_channels = (uint32_t)atoi(str);
++			if ((str = spa_dict_lookup(info->props, "codec.bit_rate")) != NULL)
++				compress_bitrate = (uint32_t)atoi(str);
++			if (compress_rate == 0)
++				compress_rate = 48000;
++			if (compress_channels == 0)
++				compress_channels = 2;
++			if (compress_bitrate == 0)
++				compress_bitrate = 128000;
++			if (n_info < SPA_N_ELEMENTS(formats) &&
++			    init_compress_format_info(&formats[n_info], ENCODING_MP3,
++					compress_rate, compress_channels, compress_bitrate) == 0)
++				n_info++;
++			if (n_info < SPA_N_ELEMENTS(formats) &&
++			    init_compress_format_info(&formats[n_info], ENCODING_AAC_ADTS,
++					compress_rate, compress_channels, compress_bitrate) == 0)
++				n_info++;
++			if (n_info < SPA_N_ELEMENTS(formats) &&
++			    init_compress_format_info(&formats[n_info], ENCODING_AAC,
++					48000, 2, compress_bitrate) == 0)
++				n_info++;
++			if (n_info < SPA_N_ELEMENTS(formats) &&
++			    init_compress_format_info(&formats[n_info], ENCODING_AAC,
++					16000, 1, compress_bitrate) == 0)
++				n_info++;
++			if (n_info < SPA_N_ELEMENTS(formats) &&
++			    init_compress_format_info(&formats[n_info], ENCODING_AAC,
++					12000, 1, compress_bitrate) == 0)
++				n_info++;
++			goto send_formats;
++		}
+ 
+ 		spa_list_for_each(p, param_list, link) {
+ 			uint32_t index = 0;
+@@ -3937,26 +4550,27 @@ static int fill_sink_info(struct client *client, struct message *m,
+ 			if (p->id != SPA_PARAM_EnumFormat)
+ 				continue;
+ 
+-			while (n_info < SPA_N_ELEMENTS(info)) {
+-				spa_zero(info[n_info]);
+-				if (format_info_from_param(&info[n_info], p->param, index++) < 0)
++			while (n_info < SPA_N_ELEMENTS(formats)) {
++				spa_zero(formats[n_info]);
++				if (format_info_from_param(&formats[n_info], p->param, index++) < 0)
+ 					break;
+-				if (info[n_info].encoding == ENCODING_ANY ||
+-				    (info[n_info].encoding == ENCODING_PCM && info[n_info].props != NULL)) {
+-					format_info_clear(&info[n_info]);
++				if (formats[n_info].encoding == ENCODING_ANY ||
++				    (formats[n_info].encoding == ENCODING_PCM && formats[n_info].props != NULL)) {
++					format_info_clear(&formats[n_info]);
+ 					continue;
+ 				}
+ 				n_info++;
+ 			}
+ 		}
++	send_formats:
+ 		message_put(m,
+ 			TAG_U8, n_info,				/* n_formats */
+ 			TAG_INVALID);
+ 		for (i = 0; i < n_info; i++) {
+ 			message_put(m,
+-				TAG_FORMAT_INFO, &info[i],
++				TAG_FORMAT_INFO, &formats[i],
+ 				TAG_INVALID);
+-			format_info_clear(&info[i]);
++			format_info_clear(&formats[i]);
+ 		}
+ 	}
+ 	return 0;
+diff --git a/src/modules/module-protocol-pulse/server.c b/src/modules/module-protocol-pulse/server.c
+index c00ea8e55..ae8091403 100644
+--- a/src/modules/module-protocol-pulse/server.c
++++ b/src/modules/module-protocol-pulse/server.c
+@@ -33,6 +33,7 @@
+ #include "commands.h"
+ #include "defs.h"
+ #include "internal.h"
++#include "modules/pulse-module-compress-offload-forwarder.h"
+ #include "log.h"
+ #include "message.h"
+ #include "reply.h"
+@@ -113,9 +114,13 @@ static int handle_memblock(struct client *client, struct message *msg)
+ {
+ 	struct stream *stream;
+ 	uint32_t channel, flags, index;
++	uint32_t transport_size;
+ 	int64_t offset, diff;
+ 	int32_t filled;
+ 	int res = 0;
++	bool frame_raw_aac;
++	const char *compress_offload;
++	uint8_t raw_aac_header[COMPRESS_RAW_AAC_HEADER_SIZE];
+ 
+ 	channel = ntohl(client->desc.channel);
+ 	offset = (int64_t) (
+@@ -133,6 +138,25 @@ static int handle_memblock(struct client *client, struct message *msg)
+ 			    client, client->name, channel);
+ 		goto finish;
+ 	}
++	compress_offload = stream->props != NULL ?
++			pw_properties_get(stream->props, "compress.offload") : NULL;
++	frame_raw_aac = compress_offload != NULL && spa_atob(compress_offload);
++	transport_size = msg->length;
++	if (frame_raw_aac) {
++		if (msg->length > UINT32_MAX - COMPRESS_RAW_AAC_HEADER_SIZE) {
++			res = -EOVERFLOW;
++			goto finish;
++		}
++		transport_size += COMPRESS_RAW_AAC_HEADER_SIZE;
++		raw_aac_header[0] = COMPRESS_RAW_AAC_MAGIC_0;
++		raw_aac_header[1] = COMPRESS_RAW_AAC_MAGIC_1;
++		raw_aac_header[2] = COMPRESS_RAW_AAC_MAGIC_2;
++		raw_aac_header[3] = COMPRESS_RAW_AAC_MAGIC_3;
++		raw_aac_header[4] = msg->length & 0xff;
++		raw_aac_header[5] = (msg->length >> 8) & 0xff;
++		raw_aac_header[6] = (msg->length >> 16) & 0xff;
++		raw_aac_header[7] = (msg->length >> 24) & 0xff;
++	}
+ 
+ 	filled = spa_ringbuffer_get_write_index(&stream->ring, &index);
+ 	pw_log_trace("new block %p %p/%u filled:%d index:%d flags:%02x offset:%" PRIu64,
+@@ -173,13 +197,22 @@ static int handle_memblock(struct client *client, struct message *msg)
+ 
+ 	if (filled < 0) {
+ 		/* underrun, reported on reader side */
+-	} else if (filled + msg->length > stream->attr.maxlength) {
++	} else if (filled + transport_size > stream->attr.maxlength) {
+ 		/* overrun */
+ 		stream_send_overflow(stream);
+ 	}
+ 
+ 	/* always write data to ringbuffer, we expect the other side
+ 	 * to recover */
++	if (frame_raw_aac) {
++		spa_ringbuffer_write_data(&stream->ring,
++				stream->buffer, stream->bufsize,
++				index % stream->bufsize,
++				raw_aac_header, sizeof(raw_aac_header));
++		index += sizeof(raw_aac_header);
++		pw_log_debug("client %p [%s]: framed raw AAC access unit size=%u",
++				client, client->name, msg->length);
++	}
+ 	spa_ringbuffer_write_data(&stream->ring,
+ 			stream->buffer, stream->bufsize,
+ 			index % stream->bufsize,
+diff --git a/src/modules/module-protocol-pulse/stream.c b/src/modules/module-protocol-pulse/stream.c
+index 4b223b878..484a12a05 100644
+--- a/src/modules/module-protocol-pulse/stream.c
++++ b/src/modules/module-protocol-pulse/stream.c
+@@ -24,6 +24,7 @@
+ #include "internal.h"
+ #include "log.h"
+ #include "message.h"
++#include "modules/pulse-module-compress-offload-forwarder.h"
+ #include "reply.h"
+ #include "stream.h"
+ 
+@@ -148,6 +149,10 @@ void stream_free(struct stream *stream)
+ 	if (stream->killed)
+ 		stream_send_killed(stream);
+ 
++	if (stream->type == STREAM_TYPE_PLAYBACK && stream->compress_offload)
++		compress_offload_forwarder_teardown(
++				stream->compress_forwarder_source);
++
+ 	if (stream->stream) {
+ 		spa_hook_remove(&stream->stream_listener);
+ 		pw_stream_disconnect(stream->stream);
+diff --git a/src/modules/module-protocol-pulse/stream.h b/src/modules/module-protocol-pulse/stream.h
+index 8e1fe178c..d2ff2edaa 100644
+--- a/src/modules/module-protocol-pulse/stream.h
++++ b/src/modules/module-protocol-pulse/stream.h
+@@ -87,6 +87,7 @@ struct stream {
+ 	uint32_t frame_size;
+ 	uint32_t rate;
+ 	uint64_t lat_usec;
++	char compress_forwarder_source[128];
+ 
+ 	struct volume volume;
+ 	bool muted;
+@@ -107,6 +108,7 @@ struct stream {
+ 	unsigned int fail_on_suspend:1;
+ 	unsigned int is_suspended:1;
+ 	unsigned int dont_inhibit_auto_suspend:1;
++	unsigned int compress_offload:1;
+ };
+ 
+ struct stream *stream_new(struct client *client, enum stream_type type, uint32_t create_tag,
+-- 
+Gitlab
-- 
2.43.0

