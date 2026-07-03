Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F4DC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 09:25:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87146.1783062725092779823
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 00:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NRmCE18h;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NySVqJC+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: harsh.rai@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rwfm3126415
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jul 2026 06:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4Fr+bECDlP1SqlY6KEV9p5HsdZ6YK8VM49+
	UThNmBss=; b=NRmCE18hHpx4Z2t/OWjJ72v1UFe9ycILrF5698PI6QMGFtXj/3M
	uXk2ztwRb0SwUm+ZBFoPkzBIVnA8UrPPHR8JKRQ57TYl+HOk5SaawXi7u+6ujoKx
	OCCfwHHQ7Tu47CI6V1DR9giR6Re6obqD4mdJLz+Mx6O5BAB3i6VbnpPuN2yKCVsw
	Mou1aI9F1t45tL7orJBenQ/DVQjEmOARf974tOvUeXngsVx/mGlXdBIteBC4URJE
	N0eTGe9Wu9cA52BekJeBur+tRFFVMTGOqwu3G9/6QSbc2JDJm5vhDfjZHdBjR4wD
	f9UWjXNhFkmTDSllhTEO1yaXStumRqvJhHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnk4j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 06:45:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c804e38c65so5119765ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 23:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783061154; x=1783665954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Fr+bECDlP1SqlY6KEV9p5HsdZ6YK8VM49+UThNmBss=;
        b=NySVqJC+syy9ft9yWZI5E5qoNGw7mkNQ6fuuC9qMLXZRr/y/g4664gKSoJVrUL1GXP
         9roazuFFdI7yN6oqL535AibGv25ZRh4PaEVi9UAdcgMe137foUuMeyxsfjK00aSmw26p
         b+uI8mIte2zlSFd4HsQkWO5N7jxfHrwnLTR/7yIj1JJo6FE81Yl/iAQNxji58BjxB3YT
         No/hpkasQj48EvpNtuwdKDG3GEh951OGkeNyUy2eciEKk84IPQdXJRiX9e/XxhjoxK2K
         N9zNu5xmFtaIlJmpak1hFtv49KQ8+XgMMm7FWG+gV0je45briMqCK1M5WUXjdIW5SI6D
         1x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061154; x=1783665954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Fr+bECDlP1SqlY6KEV9p5HsdZ6YK8VM49+UThNmBss=;
        b=kzaDHX/8b02xu2JyjK3W66knNL+Y3u+lN8JJa51aY6WKX0YA8BmzWNhWd5sjfL+v1/
         hfUIh9SJALLwiZ6+cUXzkYBYgH1QJ7UfbwV61KrSnPMRz+HXaUysKP4d8tVdCZ4g5OQZ
         owsgAD4Sz0m72pxD5jIrcHRJpYUopagXYrCEMLqbOvLKdyT+owt/tKWZJpacnQSLYung
         CQj6tq3/Fuqh84JLvDW9XmecHzPwwa2Ei7lge+5knTGP9s0JBPSb3H47xCld24qjqwiu
         OjJ6sj8pIJ3QIyVsE4o6cgeWx7MYDkpTeGLd4uAwnT8uBfI3W2DW5Ep9TRtXP7y+4sff
         lMYg==
X-Gm-Message-State: AOJu0YxUQw1OELwS46A6wUsHOnuFspv8iDXEdeS7xSv4B6VD3rGl83eN
	BAdTQYzQjFzwi7PBK05V+GYn51I/sVtpnG7Fy8NI03WX10tgVYj1BdmYKtdRMo2qHSWbPL8zZje
	iYt0t4OXKVcUjTgDGQoj6Rz2vP68p9Bgq2igbgO74K78T6XhNKhUG5mdchNN5/grQPW51pKq6m+
	T5kyupU7bEgEITGfwU
X-Gm-Gg: AfdE7ck1jyEFn4sEQRnJYXnvucm1f6rJiqOMCxVpQJLpLDEQ8l3b8NVtiR5CylYxO4a
	RQ2ocSb2MHVhVgXhU7PYc0x4aeJqkIOYqZ8pL066oGfLbNBVIkEEUF+ehLH4QxdH7gFFDyzQWDB
	ZeG/pk0ViNmlm9P0BZRzDwzGrDdGAIKE/AGMUompWC0YzfN+dpFojLWZ0WwDYjEkWuOgRgl6dcs
	xA0gK8sG2SKGbK1VV+T58++8jM92b5Tt5rB4HKRejscIxQjPoW0Tva6CBkktg4kmgNcgTXCNwo+
	IU9dd2ITaXl7GN3KqUmuyqx1Maj5+7++bp93L/5kDsvknUECj4pSYn8FQPvo0u1/8H/0qce6vD6
	pzFwXrXy9GEPKv/BX4I23yESYDnGDhLQ5FQ==
X-Received: by 2002:a17:902:f711:b0:2ca:302:2a36 with SMTP id d9443c01a7336-2ca7e678096mr105070615ad.2.1783061153076;
        Thu, 02 Jul 2026 23:45:53 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2ca:302:2a36 with SMTP id d9443c01a7336-2ca7e678096mr105069635ad.2.1783061151621;
        Thu, 02 Jul 2026 23:45:51 -0700 (PDT)
Received: from hu-hrai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad776592csm4607055ad.54.2026.07.02.23.45.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:45:50 -0700 (PDT)
From: Harsh Rai <harsh.rai@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: add MP3 compressed offload support
Date: Fri,  3 Jul 2026 12:15:44 +0530
Message-ID: <20260703064544.2301345-1-harsh.rai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: vxKWcPQaHG3dxJY-UEM1Ec3ozhSIrTqt
X-Proofpoint-ORIG-GUID: vxKWcPQaHG3dxJY-UEM1Ec3ozhSIrTqt
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a475aa2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=e5mUnYsNAAAA:8 a=lDFgMhe873SP4Aq6--UA:9 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2MiBTYWx0ZWRfX0UH6po2f480P
 oXEjKCZcMgVH+2aJ+QDK/oO88haUQ86KrwhZ/q++wjf3uQDkKdC9B0PBTGwdr/ofi5ZB4DbMsHL
 iG0rrJoQbDVHu4xpivdBr2brZ0PJfcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2MiBTYWx0ZWRfX1vhMLg990j+l
 1cNBeXjZZ9AcbPcC9PGFj98wVcL3mahikcK2QB2isiUZg17mzoviKvCJFwVzHjHNFBhF4Hko3Wv
 Oy2lsaYWo+nNvU5aMbpgrwRmc7oo4ypmbItPLcQgqBuJKB2Su4XScAd2UKA/2dMot+522vp9AWb
 CilxMpCATmwCT/PH5j3oE0oHeEZVeEuSosLzKBn8/Jh5I0tsbGxZexzEBA7WujgqqR/ooFjqZwt
 /UoIU5oxhXiRicruXlM6tA2YlfNdziFCwSAWJxdPMlJ+Cz0wsphKKGx56RMdATEpT/xLCuPFd3h
 bJt0wKNxL+H1oCXviPsBEXdrajTFDE8V3xpzEQOAWPvYSX0mevvw4nrlm0CIM/Ti20J6NSe1ROm
 hcDdThkxfq1lMiYQ9nRBWlxRlq60UGgeiqvayuH5vGNoSGWh/TeWcX26/oOJ2uO/PUFnpoNO1xI
 4qEMEt7YOxYyOLXh5Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030062
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 09:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128007

Add a PipeWire Pulse virtual sink and forwarder for compressed offload, enabling MP3 compressed Pulse streams to be routed to a PAL compressed sink.

Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
---
 .../0001-pipewire-compress-offload.patch      | 1343 +++++++++++++++++
 .../pipewire/pipewire_1.6.7.bb                |    1 +
 2 files changed, 1344 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
new file mode 100644
index 0000000000..9a60e5127a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
@@ -0,0 +1,1343 @@
+From 345e4b033c2ff69ab7aa02a123f6041b878f7fb9 Mon Sep 17 00:00:00 2001
+From: Harsh Rai <harsh.rai@oss.qualcomm.com>
+Date: Tue, 16 Jun 2026 19:21:37 +0530
+Subject: [PATCH] pulse: enable MP3 compressed offload via Pulse
+
+Add PipeWire Pulse virtual sink and forwarder for offload.
+Route compressed Pulse streams to PAL compressed sink.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
+---
+ src/modules/meson.build                       |   2 +
+ .../module-compress-offload-forwarder.c       | 649 ++++++++++++++++++
+ .../modules/module-compress-offload-sink.c    | 293 ++++++++
+ .../module-protocol-pulse/pulse-server.c      | 254 ++++++-
+ 4 files changed, 1187 insertions(+), 11 deletions(-)
+ create mode 100644 src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
+ create mode 100644 src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
+
+diff --git a/src/modules/meson.build b/src/modules/meson.build
+index 59f46ae..900871d 100644
+--- a/src/modules/meson.build
++++ b/src/modules/meson.build
+@@ -324,6 +324,8 @@ pipewire_module_protocol_pulse_sources = [
+   'module-protocol-pulse/modules/module-alsa-source.c',
+   'module-protocol-pulse/modules/module-always-sink.c',
+   'module-protocol-pulse/modules/module-combine-sink.c',
++  'module-protocol-pulse/modules/module-compress-offload-sink.c',
++  'module-protocol-pulse/modules/module-compress-offload-forwarder.c',
+   'module-protocol-pulse/modules/module-device-manager.c',
+   'module-protocol-pulse/modules/module-device-restore.c',
+   'module-protocol-pulse/modules/module-echo-cancel.c',
+diff --git a/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
+new file mode 100644
+index 0000000..33054e4
+--- /dev/null
++++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
+@@ -0,0 +1,649 @@
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
++
++#define NAME "compress-offload-forwarder"
++
++#define DEFAULT_CODEC "mp3"
++#define DEFAULT_RATE 48000u
++#define DEFAULT_CHANNELS 2u
++#define DEFAULT_BITRATE 128000u
++#define DEFAULT_BLOCK_SIZE (16u * 1024u)
++
++static const char *const forwarder_options =
++	"source_sink=<Pulse-visible compress sink node.name> "
++	"target_sink=<PAL compress sink node.name> "
++	"codec=<codec name, default mp3> "
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
++	uint32_t rate;
++	uint32_t channels;
++	uint32_t bitrate;
++	uint32_t block_size;
++	uint32_t target_id;
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
++};
++
++static int create_playback_stream(struct forwarder_data *d);
++static void set_playback_active(struct forwarder_data *d, bool active);
++static void maybe_create_playback_stream(struct forwarder_data *d, const char *reason);
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
++	info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
++	info.info.mp3.rate = d->rate;
++	info.info.mp3.channels = d->channels;
++	info.info.mp3.channel_mode = d->channels == 1 ?
++		SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
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
++	if (state == PW_STREAM_STATE_PAUSED || state == PW_STREAM_STATE_ERROR)
++		set_playback_active(d, false);
++}
++
++static void capture_process(void *data)
++{
++	struct forwarder_data *d = data;
++	struct pw_buffer *in_buf, *out_buf;
++	struct spa_data *in_data, *out_data;
++	uint32_t in_offset, in_size, out_size, copy_size;
++	const void *input_data;
++	const void *copy_data;
++	uint32_t copy_available;
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
++
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
++
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
++	copy_size = SPA_MIN(copy_available, out_size);
++	memcpy(out_data->data, copy_data, copy_size);
++	d->pending_offset += copy_size;
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
++static void registry_global(void *data, uint32_t id, uint32_t permissions,
++		const char *type, uint32_t version, const struct spa_dict *props)
++{
++	struct forwarder_data *d = data;
++	const char *name;
++
++	if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || props == NULL)
++		return;
++	name = spa_dict_lookup(props, PW_KEY_NODE_NAME);
++	if (!spa_streq(name, d->target_name))
++		return;
++	d->target_id = id;
++	pw_log_info("compress-forwarder target:%s resolved id=%u", d->target_name, id);
++}
++
++static void registry_global_remove(void *data, uint32_t id)
++{
++	struct forwarder_data *d = data;
++
++	if (id != d->target_id)
++		return;
++	pw_log_info("compress-forwarder target:%s removed id=%u", d->target_name, id);
++	d->target_id = PW_ID_ANY;
++	destroy_playback_stream(d);
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
++	props = pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Output/Audio",
++			PW_KEY_NODE_NAME, "compress-offload-forwarder-output",
++			PW_KEY_MEDIA_TYPE, "Audio",
++			PW_KEY_MEDIA_CATEGORY, "Playback",
++			PW_KEY_MEDIA_ROLE, "Music",
++			PW_KEY_TARGET_OBJECT, d->target_name,
++			PW_KEY_NODE_AUTOCONNECT, "true",
++			PW_KEY_STREAM_DONT_REMIX, "true",
++			"node.dont-reconnect", "true",
++			PW_KEY_NODE_RATE, "1/48000",
++			"compress.offload", "true",
++			"codec.type", d->codec,
++			NULL);
++	if (props == NULL)
++		return -errno;
++	pw_properties_setf(props, "codec.sample_rate", "%u", d->rate);
++	pw_properties_setf(props, "codec.channels", "%u", d->channels);
++	pw_properties_setf(props, "codec.bit_rate", "%u", d->bitrate);
++	pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
++
++	d->playback = pw_stream_new(d->core, "compress offload forwarder output", props);
++	if (d->playback == NULL)
++		return -errno;
++	pw_stream_add_listener(d->playback, &d->playback_listener, &playback_events, d);
++
++	spa_pod_builder_init(&builder, buffer, sizeof(buffer));
++	params[n_params++] = build_encoded_format(d, &builder, SPA_PARAM_EnumFormat);
++	pw_log_debug("compress-forwarder target:%s connect target-id=%u", d->target_name, d->target_id);
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
++	if (d->capture != NULL) {
++		spa_hook_remove(&d->capture_listener);
++		pw_stream_destroy(d->capture);
++		d->capture = NULL;
++	}
++	destroy_playback_stream(d);
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
++	d->rate = pw_properties_get_uint32(props, "rate", DEFAULT_RATE);
++	d->channels = pw_properties_get_uint32(props, "channels", DEFAULT_CHANNELS);
++	d->bitrate = pw_properties_get_uint32(props, "bitrate", DEFAULT_BITRATE);
++	d->block_size = pw_properties_get_uint32(props, "block_size", DEFAULT_BLOCK_SIZE);
++	spa_scnprintf(d->monitor_name, sizeof(d->monitor_name), "%s.monitor", d->source_name);
++
++	if (!spa_streq(d->codec, "mp3")) {
++		pw_log_warn("compress-forwarder only supports mp3 right now, requested codec=%s", d->codec);
++		return -ENOTSUP;
++	}
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
++	{ PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
++	{ PW_KEY_MODULE_DESCRIPTION, "Forward Pulse compress-offload sink data to PAL compress sink" },
++	{ PW_KEY_MODULE_USAGE,       forwarder_options },
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
+diff --git a/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
+new file mode 100644
+index 0000000..243cc8e
+--- /dev/null
++++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
+@@ -0,0 +1,293 @@
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
++static const char *const pulse_module_options =
++	"sink_name=<name of sink> "
++	"sink_properties=<properties for the sink> "
++	"target_sink=<node.name of the downstream compress-offload sink> "
++	"codec=<codec name, default mp3> "
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
++	pw_properties_set(props, "codec.type", str ? str : "mp3");
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
++	pw_properties_set(props, "monitor.channel-volumes",          "true");
++	pw_properties_set(props, "monitor.passthrough",              "true");
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
++	{ PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
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
+diff --git a/src/modules/module-protocol-pulse/pulse-server.c b/src/modules/module-protocol-pulse/pulse-server.c
+index eb3233b..61f0dfb 100644
+--- a/src/modules/module-protocol-pulse/pulse-server.c
++++ b/src/modules/module-protocol-pulse/pulse-server.c
+@@ -84,6 +84,9 @@ struct temporary_move_data {
+ 	uint8_t used:1;
+ };
+
++/* Buffer size used for compress-offload streams (frame_size == 1). */
++#define COMPRESS_OFFLOAD_BUF_SIZE  16484u
++
+ static struct sample *find_sample(struct impl *impl, uint32_t index, const char *name)
+ {
+ 	union pw_map_item *item;
+@@ -1199,10 +1202,18 @@ static const struct spa_pod *get_buffers_param(struct stream *s,
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
+@@ -1228,6 +1239,23 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
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
+@@ -1243,6 +1271,9 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
+ 		return;
+ 	}
+ 	stream->rate = stream->ss.rate;
++stream_param_format_done:
++	pw_log_debug("[%s] stream param done: frame_size=%u rate=%u ss.format=%u",
++			stream->client->name, stream->frame_size, stream->rate, stream->ss.format);
+
+ 	if (stream->create_tag != SPA_ID_INVALID) {
+ 		struct pw_manager_object *peer;
+@@ -1583,6 +1614,98 @@ static void log_format_info(struct impl *impl, enum spa_log_level level, struct
+ 				impl, it->key, it->value);
+ }
+
++static const struct spa_pod *build_compress_offload_format(struct spa_pod_builder *b,
++		uint32_t id, const struct pw_properties *props, uint32_t *rate)
++{
++	const char *codec;
++	struct spa_audio_info info;
++	uint32_t sample_rate, channels, bitrate;
++
++	spa_zero(info);
++	info.media_type = SPA_MEDIA_TYPE_audio;
++	codec = pw_properties_get(props, "codec.type");
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
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;
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
++	ss->format = SPA_AUDIO_FORMAT_S16_LE;
++	ss->rate = pw_properties_get_uint32(props, "codec.sample_rate", 44100);
++	channels = pw_properties_get_uint32(props, "codec.channels", 2);
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
+ static int do_create_playback_stream(struct client *client, uint32_t command, uint32_t tag, struct message *m)
+ {
+ 	struct impl *impl = client->impl;
+@@ -1609,7 +1732,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 		muted_set = false,
+ 		fail_on_suspend = false,
+ 		relative_volume = false,
+-		passthrough = false;
++		passthrough = false,
++		compress_offload = false;
+ 	struct volume volume;
+ 	struct pw_properties *props = NULL;
+ 	uint8_t n_formats = 0;
+@@ -1668,6 +1792,68 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
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
++			pw_properties_set(props, "compress.offload", "true");
++			pw_properties_set(props, "item.node.supports-encoded-fmts", "true");
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
+@@ -1715,6 +1901,9 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 			goto error_protocol;
+ 	}
+
++	compress_offload = pw_properties_parse_bool(
++			pw_properties_get(props, "compress.offload"));
++
+ 	if (client->version >= 21) {
+ 		if (message_get(m,
+ 				TAG_U8, &n_formats,
+@@ -1732,7 +1921,9 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 						TAG_INVALID) < 0)
+ 					goto error_protocol;
+
+-				if (n_params < MAX_FORMATS &&
++				if (compress_offload) {
++					log_format_info(impl, SPA_LOG_LEVEL_DEBUG, &format);
++				} else if (n_params < MAX_FORMATS &&
+ 				    (params[n_params] = format_info_build_param(&b,
+ 						SPA_PARAM_EnumFormat, &format, &r)) != NULL) {
+ 					n_params++;
+@@ -1746,7 +1937,23 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
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
++	} else if (sample_spec_valid(&ss)) {
+ 		struct sample_spec sfix = ss;
+ 		struct channel_map mfix = map;
+
+@@ -1770,6 +1977,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	if (m->offset != m->length)
+ 		goto error_protocol;
+
++	pw_log_debug("[%s] format check: n_valid=%u n_params=%u compress=%d passthrough=%d",
++			client->name, n_valid_formats, n_params, compress_offload, passthrough);
+ 	if (n_valid_formats == 0)
+ 		goto error_no_formats;
+
+@@ -1806,6 +2015,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	flags = 0;
+ 	if (no_move)
+ 		flags |= PW_STREAM_FLAG_DONT_RECONNECT;
++	if (compress_offload)
++		flags |= PW_STREAM_FLAG_NO_CONVERT;
+
+ 	if (sink_name != NULL) {
+ 		if (o != NULL)
+@@ -1833,14 +2044,35 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
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
+--
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
index 50feeaf843..90815ba012 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
@@ -15,6 +15,7 @@ DEPENDS = "dbus"
 SRCREV = "3b2cb4fb037bf6033b87d3c87ee917b2f686d309"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
+SRC_URI += "file://0001-pipewire-compress-offload.patch"
 SRC_URI += "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"
 
 inherit meson pkgconfig systemd gettext useradd
-- 
2.43.0


