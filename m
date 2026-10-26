Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39798.1793010970013302209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mTnWB/fj;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EWcOMiI9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAWfZ12986755
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bETmITVr2eyWlG/RLDX1adr
	/bnWSjh8z+Ffdt8py/M=; b=mTnWB/fjWOD+yYn95j+yhxPq2xusYHBkwRnQ1ZSZ
	twDAYcGFGT/VJaKQiyCZBpDGgcSb9xOYuIPJtsoNpSigweLEgOEJ08jJbyJXrCo6
	MnLqm75QQSRVHoLrFqrMqI9FX4++UJ+Ezf1p1Rp2ZlfxmpBidiF9TjLF/Dg6OQh9
	Tm2iFS5l1EfgXXec7le5aMKN9Pd3zGCHSeX8U+nShdabrVHsYKFcOnwzvW4IONC7
	62JtDYDjDGBFtMp99V6QMQR9F9TEBoMuVytJXyktTtlEFV67oe87e3rIjHBPrkLR
	958E1n92lfJ9g6R6kHnx/E5sQi4y/tmgaUSdfntpPYn1XA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y00dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:36:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b994cb09fso72557166d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010967; cv=none;
        d=google.com; s=arc-20260327;
        b=soa7gGp/7HpEW6EMrZW/2Qp7WIQbuTUVsR0FqeIFVI3UKAR463g1fosWXVeCAZ/I7k
         UjAJV10WfmpNA7Dy/ll5z8uwuygLdTJBNUtuk7RbxSuZJTbCbv5oMfLmqpxw8ubgYX6a
         0FujFWe3rdatedq/TG1cZZECzrBc4Tu6b0SKQl7QA1hyHczt1cYd4tshiCpP2u3j44b8
         2YoBhRRIdaLG7I3qh1ruPut7xabAqDdTmX17IkHvwGCES/ADi/YAiasovpsa+oEBH7gx
         tLuv4WGI9Om5UI7UAZikhp7f4apEyiNNFDCkh7PQ8YMZS8nnMFNAOg6u54p9956/1A/j
         tbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1bETmITVr2eyWlG/RLDX1adr/bnWSjh8z+Ffdt8py/M=;
        fh=qwwDonjnKFlPVUFhx8uEFVcoh9RplhJOoVSXSZcX40U=;
        b=o7So7WLBCG0/rI7LA1NZuZIqCxGg+P7r0IzciIKv+YBu38kSssZHAhb6P5uNlHj4iL
         qX7JK8z7Z2zbnHbWyraXsXpXDG2HBSPSUfDGZ1EXXm2A1p1GIj3aEZukg1Znq+tQ2ffg
         n4v6SzeTZNa2rZOW6c97crDFu/Y8lo1g000Ji8ZEq3xMHdYDUYE9d0VA5s6zzj9Lbeyq
         UG0POe+Ni6Hysi4vmyzsjRC57YN2/VYIoiFTGjEE5vcT/AizJAAzcpON+H20qdjY0BsC
         nx9vWI0bZMSkpTYyQ5bqVv6yYjhF+12ofO13X/5ZzzDwS6WY5tF3GSY71uYr5KeeDcFO
         //pg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010967; x=1793615767; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bETmITVr2eyWlG/RLDX1adr/bnWSjh8z+Ffdt8py/M=;
        b=EWcOMiI9VkO5Z32aJBxUcXg+AtaSVhGVRvHbfbDJOCTp3K8skftWt85YgMTEt7LULx
         eJw2Mvuln46S5YftnpYGl8E3YHvtekxAswJ9WmKbLgwpRNU8plh/APETtSefyHvYl00N
         usROxpYvnNQCOGzSH8/WHQFPPnkSY2yKOVcC7IV/Da4FC7C4DZul9I4obmtjSZ8sydd+
         fbnMXGAy3K+3xVTTgzWLtbvGOqqWMHKPXzvxtdY8nA1YmPI9BAsLjYOq7dZPpHkWQ+9u
         Yl7xMTRZ6VAbv1lHbE/yryxh8sgM+luD6Kh2aWIdemBz25IUAjCIk8az903lJP+3mVw5
         zzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010967; x=1793615767;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bETmITVr2eyWlG/RLDX1adr/bnWSjh8z+Ffdt8py/M=;
        b=RAzCZ984Dlgyh5EQEbCL/Tgy7h2blQzzoMfRaRVd69j9Nu+cPjJNqeOtbRujQ0fKsr
         2b/EunAFqTTp2eHbFsuUwvPnWTVrKOcYvCki6uXN/4nw5rGEXfpzNI5kUlqQsyANm4DJ
         EE7v2DFqDJQSH8N6Xgb0VCHz9/7wyseXgjYo2mIw82sojgLDlT5ADdYyJc1UWBje6KYj
         iIU6buUYM/G/HN2rs4J4LXYQO4ORWtnHgRayc0aPHsCcS59ZVG/3+ECbjF9Hv9ADfS/A
         AW++45emVkgyprXBrB4UZe5JDWPGGbBpT2u+9c4oNP0VLUscJYzc9XtmnDFyiSzYxm5e
         pkww==
X-Gm-Message-State: AFq9FYINjFRSRZ5CSa2trwzoZS4ORVVAurin+hmEaJsKMN9h+Ma6iWia
	0PbRHvP1FzA1lpEHQPpYqM6uqxnVI3Pxb/wtybF9ve3WBgE1Pvf1w8nGfpSbGmp6Hsrk0FuSOZh
	hr0qLvzwfgM55+v28Qd+nl/Z35f58RBJzdn14fjH89OxdnfQkp6ST3VlhNp2Cg9uDHqKXS0VyZU
	VQBJrWFznj4lTH0jat19EwuVTQkRHf9acVzi2PmTEFuHsnHhjH5+P3Ct3C0R47eufDVM73rg==
X-Gm-Gg: AYBFou299taJ2JA2O+VLJz0W4mG1y9oVziSfZbbo9xQxJEmB+eCyF3w0u0sHvfN2QPv
	40Sh+yNW3lnjupfgzRqyxziS+28D7mfsbBwS7yIrBpSQJpFm5hkrJ14LQ2NCA7ShdgqbdZunHkl
	7jNS3mAP9O/HIWO9TpO5v6o7B8wFNWny+h2D/z5jUudRaKYLNEtILghhWKe0w=
X-Received: by 2002:ad4:5def:0:b0:917:8aaf:bb9a with SMTP id 6a1803df08f44-91c48e63e29mr104760616d6.22.1793010965842;
        Mon, 26 Oct 2026 03:36:05 -0700 (PDT)
X-Received: by 2002:ad4:5def:0:b0:917:8aaf:bb9a with SMTP id
 6a1803df08f44-91c48e63e29mr104759796d6.22.1793010964406; Mon, 26 Oct 2026
 03:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261026102143.288505-1-harsh.rai@oss.qualcomm.com>
In-Reply-To: <20261026102143.288505-1-harsh.rai@oss.qualcomm.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:35:52 +0000
X-Gm-Features: AclHuK-zuLmPtH3WP7OqmxUDpswDZW55cU9dMEFIzP5gqCsYjpNRLDg5TulcYxc
Message-ID: <CADWMC-ahQty_=5PYUxkq8-FVaYevOpn-c_LfXKaKuc0=BQh84Q@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH v3] pipewire: add compressed offload support
To: harsh.rai@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009cb305065ebbe57c"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX9GpwP+Xfh3d+
 +EC1236K90ZRO+95FiBleK7x6VS7D4HndpZl9bQHv2pjw3hQ6+qJ42MyzsZawdjvUhCNjZ+Tu/t
 jl/mqCSuDbjc/3xCtEjp21dCsUj+WtU=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf2d18 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=evBs4gXxRpd540QFSCAA:9
 a=JlCXkTpkdGvNkSzj:21 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=OmlrTeWgAAAA:8
 a=Ambn15MlAAAA:8 a=eOddlG10FWRK79au4DAA:9 a=IX33rU-FV0YcBbIJ:21
 a=lqcHg5cX4UMA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=JsU07-YBAAI1T4UW_q9S:22 a=H7P9_EKEar6uRM4X9ry-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX7+j8DkBmN7lv
 w/DVmupkpNzogE4vIHAlUOo2XWrHAeMfsNEUVMzYpjGHF/76dqOnklNC/2irIsQQ3f/RO9R/DMh
 smdGlYMAK4S5VM3H3wvPMUk3lzWlhZH5n38qDdbNupeUtF7Ojh0jdpObOyCJoCsitnEYxqo5D62
 QYau2EsqC69o+zikRpDoTYHkrTQWtK2AHOpfTGEFzmFkPI23vFIjzwyCopjyhYsT1GaLyN6mSpL
 AQKTR20Z6vjIf6loozHMES+v795mS29/kZLbwJhgdBxmZYRqgH2QCu6n0K0FLsepPKhJ6A3mje1
 P7cBZntVXTQHMdGsJmHRc5zXmtjle899Apu3NKsUngdHPKQToPQQ8T5mU8EIn+Y5TN3lSuQSEJi
 IdfIMYEi1Jt/5CNEesGJFRpCx4yYjvON129gvQUkex65VqZLVAf8uc8RYIetw/3IpwhPUc1yhmZ
 ithpPwyMdK2Mz6E9fBg==
X-Proofpoint-GUID: NTLGYioyffgVtwSql-JxqFnE9BorUcAe
X-Proofpoint-ORIG-GUID: NTLGYioyffgVtwSql-JxqFnE9BorUcAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131434

--0000000000009cb305065ebbe57c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Harsh

It seems that this patch is incomplete.

On Mon, Oct 26, 2026 at 10:28=E2=80=AFAM Harsh Rai via lists.openembedded.o=
rg
<harsh.rai=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Add a PipeWire Pulse virtual sink and forwarder for compressed offload,
> enabling compressed Pulse streams to be routed to a PAL compressed sink.
> [New changes added]
>

Something is missing here, and please don't use very long lines on the
commit message.


>
> Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> ---
>  .../0001-pipewire-compress-offload.patch      | 4028 +++++++++++------
>  1 file changed, 2685 insertions(+), 1343 deletions(-)
>
> diff --git
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-comp=
ress-offload.patch
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-comp=
ress-offload.patch
> index 8a884d64cd..653f6c3268 100644
> ---
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-comp=
ress-offload.patch
> +++
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-comp=
ress-offload.patch
> @@ -1,1343 +1,2685 @@
> -From 345e4b033c2ff69ab7aa02a123f6041b878f7fb9 Mon Sep 17 00:00:00 2001
> -From: Harsh Rai <harsh.rai@oss.qualcomm.com>
> -Date: Tue, 16 Jun 2026 19:21:37 +0530
> -Subject: [PATCH] pulse: enable MP3 compressed offload via Pulse
> -
> -Add PipeWire Pulse virtual sink and forwarder for offload.
> -Route compressed Pulse streams to PAL compressed sink.
> -
> -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
>

 All headers have been removed here.

Jose

-
> -Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> ----
> - src/modules/meson.build                       |   2 +
> - .../module-compress-offload-forwarder.c       | 649 ++++++++++++++++++
> - .../modules/module-compress-offload-sink.c    | 293 ++++++++
> - .../module-protocol-pulse/pulse-server.c      | 254 ++++++-
> - 4 files changed, 1187 insertions(+), 11 deletions(-)
> - create mode 100644
> src/modules/module-protocol-pulse/modules/module-compress-offload-forward=
er.c
> - create mode 100644
> src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
> -
> -diff --git a/src/modules/meson.build b/src/modules/meson.build
> -index 59f46ae..900871d 100644
> ---- a/src/modules/meson.build
> -+++ b/src/modules/meson.build
> -@@ -324,6 +324,8 @@ pipewire_module_protocol_pulse_sources =3D [
> -   'module-protocol-pulse/modules/module-alsa-source.c',
> -   'module-protocol-pulse/modules/module-always-sink.c',
> -   'module-protocol-pulse/modules/module-combine-sink.c',
> -+  'module-protocol-pulse/modules/module-compress-offload-sink.c',
> -+  'module-protocol-pulse/modules/module-compress-offload-forwarder.c',
> -   'module-protocol-pulse/modules/module-device-manager.c',
> -   'module-protocol-pulse/modules/module-device-restore.c',
> -   'module-protocol-pulse/modules/module-echo-cancel.c',
> -diff --git
> a/src/modules/module-protocol-pulse/modules/module-compress-offload-forwa=
rder.c
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwa=
rder.c
> -new file mode 100644
> -index 0000000..33054e4
> ---- /dev/null
> -+++
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwa=
rder.c
> -@@ -0,0 +1,649 @@
> -+/* PipeWire */
> -+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. *=
/
> -+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> -+
> -+#include <errno.h>
> -+#include <limits.h>
> -+#include <stdint.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+
> -+#include <spa/param/audio/compressed.h>
> -+#include <spa/param/audio/format-utils.h>
> -+#include <spa/param/audio/raw.h>
> -+#include <spa/utils/result.h>
> -+#include <spa/utils/string.h>
> -+#include <pipewire/pipewire.h>
> -+
> -+#include "../module.h"
> -+
> -+#define NAME "compress-offload-forwarder"
> -+
> -+#define DEFAULT_CODEC "mp3"
> -+#define DEFAULT_RATE 48000u
> -+#define DEFAULT_CHANNELS 2u
> -+#define DEFAULT_BITRATE 128000u
> -+#define DEFAULT_BLOCK_SIZE (16u * 1024u)
> -+
> -+static const char *const forwarder_options =3D
> -+      "source_sink=3D<Pulse-visible compress sink node.name> "
> -+      "target_sink=3D<PAL compress sink node.name> "
> -+      "codec=3D<codec name, default mp3> "
> -+      "rate=3D<sample rate, default 48000> "
> -+      "channels=3D<number of channels, default 2> "
> -+      "bitrate=3D<bit rate, default 128000> "
> -+      "block_size=3D<buffer size in bytes, default 16384>";
> -+
> -+PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
> -+#define PW_LOG_TOPIC_DEFAULT mod_topic
> -+
> -+struct forwarder_data {
> -+      struct pw_core *core;
> -+      struct pw_loop *loop;
> -+      struct spa_source *activate_event;
> -+      struct spa_hook core_listener;
> -+      struct pw_registry *registry;
> -+      struct spa_hook registry_listener;
> -+
> -+      struct pw_stream *capture;
> -+      struct spa_hook capture_listener;
> -+      struct pw_stream *playback;
> -+      struct spa_hook playback_listener;
> -+
> -+      char source_name[256];
> -+      char monitor_name[280];
> -+      char target_name[256];
> -+      char codec[32];
> -+      uint32_t rate;
> -+      uint32_t channels;
> -+      uint32_t bitrate;
> -+      uint32_t block_size;
> -+      uint32_t target_id;
> -+      uint8_t *pending_data;
> -+      uint32_t pending_size;
> -+      uint32_t pending_offset;
> -+      uint8_t capture_streaming:1;
> -+      uint8_t logged_first_buffer:1;
> -+      uint8_t logged_first_output_buffer:1;
> -+      uint8_t logged_silence_buffer:1;
> -+      uint8_t activate_pending:1;
> -+      uint8_t playback_active:1;
> -+      uint8_t playback_failed:1;
> -+};
> -+
> -+static int create_playback_stream(struct forwarder_data *d);
> -+static void set_playback_active(struct forwarder_data *d, bool active);
> -+static void maybe_create_playback_stream(struct forwarder_data *d, cons=
t
> char *reason);
> -+
> -+static void request_playback_activation(struct forwarder_data *d)
> -+{
> -+      if (d->activate_event =3D=3D NULL || d->activate_pending)
> -+              return;
> -+      d->activate_pending =3D true;
> -+      pw_loop_signal_event(d->loop, d->activate_event);
> -+}
> -+
> -+static void playback_activate_event(void *data, uint64_t count)
> -+{
> -+      struct forwarder_data *d =3D data;
> -+
> -+      d->activate_pending =3D false;
> -+      maybe_create_playback_stream(d, "first-audio-buffer");
> -+}
> -+
> -+static bool buffer_is_zeroed(const void *data, uint32_t size)
> -+{
> -+      const uint8_t *bytes =3D data;
> -+      uint32_t index;
> -+
> -+      for (index =3D 0; index < size; index++) {
> -+              if (bytes[index] !=3D 0)
> -+                      return false;
> -+      }
> -+      return true;
> -+}
> -+
> -+static void clear_pending_data(struct forwarder_data *d)
> -+{
> -+      free(d->pending_data);
> -+      d->pending_data =3D NULL;
> -+      d->pending_size =3D 0;
> -+      d->pending_offset =3D 0;
> -+}
> -+
> -+static void compact_pending_data(struct forwarder_data *d)
> -+{
> -+      uint32_t remaining;
> -+
> -+      if (d->pending_offset =3D=3D 0)
> -+              return;
> -+      if (d->pending_offset >=3D d->pending_size) {
> -+              clear_pending_data(d);
> -+              return;
> -+      }
> -+      remaining =3D d->pending_size - d->pending_offset;
> -+      memmove(d->pending_data, d->pending_data + d->pending_offset,
> remaining);
> -+      d->pending_size =3D remaining;
> -+      d->pending_offset =3D 0;
> -+}
> -+
> -+static int append_pending_data(struct forwarder_data *d, const void
> *data, uint32_t size)
> -+{
> -+      uint8_t *pending_data;
> -+
> -+      if (size =3D=3D 0)
> -+              return 0;
> -+      compact_pending_data(d);
> -+      if (d->pending_size > UINT32_MAX - size)
> -+              return -EOVERFLOW;
> -+      pending_data =3D realloc(d->pending_data, d->pending_size + size)=
;
> -+      if (pending_data =3D=3D NULL)
> -+              return -errno;
> -+      d->pending_data =3D pending_data;
> -+      memcpy(d->pending_data + d->pending_size, data, size);
> -+      d->pending_size +=3D size;
> -+      return 0;
> -+}
> -+
> -+static void maybe_create_playback_stream(struct forwarder_data *d, cons=
t
> char *reason)
> -+{
> -+      int res;
> -+
> -+      if (!d->capture_streaming)
> -+              return;
> -+      if (d->playback !=3D NULL) {
> -+              set_playback_active(d, true);
> -+              return;
> -+      }
> -+      if (d->target_id =3D=3D PW_ID_ANY) {
> -+              pw_log_debug("compress-forwarder target:%s not resolved
> yet, defer output create (%s)",
> -+                              d->target_name, reason);
> -+              return;
> -+      }
> -+      res =3D create_playback_stream(d);
> -+      if (res < 0)
> -+              pw_log_error("compress-forwarder target:%s create failed
> (%s): %s",
> -+                              d->target_name, reason, spa_strerror(res)=
);
> -+      else
> -+              set_playback_active(d, true);
> -+}
> -+
> -+static void destroy_playback_stream(struct forwarder_data *d)
> -+{
> -+      clear_pending_data(d);
> -+      if (d->playback =3D=3D NULL)
> -+              return;
> -+      spa_hook_remove(&d->playback_listener);
> -+      pw_stream_destroy(d->playback);
> -+      d->playback =3D NULL;
> -+      d->playback_active =3D false;
> -+      d->playback_failed =3D false;
> -+}
> -+
> -+static const struct spa_pod *build_raw_format(struct forwarder_data *d,
> -+              struct spa_pod_builder *builder, uint32_t id)
> -+{
> -+      struct spa_audio_info_raw info;
> -+
> -+      spa_zero(info);
> -+      info.format =3D SPA_AUDIO_FORMAT_S16_LE;
> -+      info.rate =3D d->rate;
> -+      info.channels =3D d->channels;
> -+      if (info.channels =3D=3D 1) {
> -+              info.position[0] =3D SPA_AUDIO_CHANNEL_MONO;
> -+      } else {
> -+              info.channels =3D 2;
> -+              info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> -+              info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> -+      }
> -+      return spa_format_audio_raw_build(builder, id, &info);
> -+}
> -+
> -+static const struct spa_pod *build_encoded_format(struct forwarder_data
> *d,
> -+              struct spa_pod_builder *builder, uint32_t id)
> -+{
> -+      struct spa_audio_info info;
> -+
> -+      spa_zero(info);
> -+      info.media_type =3D SPA_MEDIA_TYPE_audio;
> -+      info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;
> -+      info.info.mp3.rate =3D d->rate;
> -+      info.info.mp3.channels =3D d->channels;
> -+      info.info.mp3.channel_mode =3D d->channels =3D=3D 1 ?
> -+              SPA_AUDIO_MP3_CHANNEL_MODE_MONO :
> SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
> -+
> -+      return spa_format_audio_build(builder, id, &info);
> -+}
> -+
> -+static void playback_state_changed(void *data, enum pw_stream_state old=
,
> -+              enum pw_stream_state state, const char *error)
> -+{
> -+      struct forwarder_data *d =3D data;
> -+
> -+      pw_log_debug("compress-forwarder target:%s state %d -> %d%s%s",
> -+                      d->target_name, old, state, error ? ": " : "",
> error ? error : "");
> -+      if (state =3D=3D PW_STREAM_STATE_ERROR)
> -+              d->playback_failed =3D true;
> -+}
> -+
> -+static void set_playback_active(struct forwarder_data *d, bool active)
> -+{
> -+      if (d->playback =3D=3D NULL || d->playback_active =3D=3D active)
> -+              return;
> -+      pw_log_debug("compress-forwarder target:%s active=3D%d",
> d->target_name, active);
> -+      pw_stream_set_active(d->playback, active);
> -+      d->playback_active =3D active;
> -+}
> -+
> -+static void capture_state_changed(void *data, enum pw_stream_state old,
> -+              enum pw_stream_state state, const char *error)
> -+{
> -+      struct forwarder_data *d =3D data;
> -+
> -+      pw_log_debug("compress-forwarder source:%s state %d -> %d%s%s",
> -+                      d->monitor_name, old, state, error ? ": " : "",
> error ? error : "");
> -+      if (d->playback_failed)
> -+              destroy_playback_stream(d);
> -+      d->capture_streaming =3D state =3D=3D PW_STREAM_STATE_STREAMING;
> -+      if (state =3D=3D PW_STREAM_STATE_PAUSED || state =3D=3D
> PW_STREAM_STATE_ERROR)
> -+              set_playback_active(d, false);
> -+}
> -+
> -+static void capture_process(void *data)
> -+{
> -+      struct forwarder_data *d =3D data;
> -+      struct pw_buffer *in_buf, *out_buf;
> -+      struct spa_data *in_data, *out_data;
> -+      uint32_t in_offset, in_size, out_size, copy_size;
> -+      const void *input_data;
> -+      const void *copy_data;
> -+      uint32_t copy_available;
> -+      int res;
> -+
> -+      in_buf =3D pw_stream_dequeue_buffer(d->capture);
> -+      if (in_buf =3D=3D NULL)
> -+              return;
> -+
> -+      in_data =3D &in_buf->buffer->datas[0];
> -+      if (in_data->data =3D=3D NULL || in_data->chunk =3D=3D NULL) {
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+      in_offset =3D SPA_MIN(in_data->chunk->offset, in_data->maxsize);
> -+      in_size =3D SPA_MIN(in_data->chunk->size, in_data->maxsize -
> in_offset);
> -+      input_data =3D SPA_PTROFF(in_data->data, in_offset, void);
> -+      if (in_size =3D=3D 0) {
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+      if (buffer_is_zeroed(input_data, in_size)) {
> -+              if (!d->logged_silence_buffer) {
> -+                      pw_log_debug("compress-forwarder source:%s
> ignoring zeroed startup buffer size=3D%u flags=3D0x%x",
> -+                                      d->monitor_name, in_size,
> in_data->chunk->flags);
> -+                      d->logged_silence_buffer =3D true;
> -+              }
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+      if (!d->logged_first_buffer) {
> -+              const uint8_t *bytes =3D SPA_PTROFF(in_data->data,
> in_offset, const uint8_t);
> -+              pw_log_debug("compress-forwarder source:%s first
> non-silence buffer size=3D%u offset=3D%u flags=3D0x%x",
> -+                              d->monitor_name, in_size, in_offset,
> in_data->chunk->flags);
> -+              pw_log_debug("compress-forwarder source:%s first
> non-silence bytes=3D%02x %02x %02x %02x %02x %02x %02x %02x",
> -+                              d->monitor_name,
> -+                              in_size > 0 ? bytes[0] : 0,
> -+                              in_size > 1 ? bytes[1] : 0,
> -+                              in_size > 2 ? bytes[2] : 0,
> -+                              in_size > 3 ? bytes[3] : 0,
> -+                              in_size > 4 ? bytes[4] : 0,
> -+                              in_size > 5 ? bytes[5] : 0,
> -+                              in_size > 6 ? bytes[6] : 0,
> -+                              in_size > 7 ? bytes[7] : 0);
> -+              d->logged_first_buffer =3D true;
> -+      }
> -+
> -+      if (d->playback_failed)
> -+              destroy_playback_stream(d);
> -+
> -+      res =3D append_pending_data(d, input_data, in_size);
> -+      if (res < 0) {
> -+              pw_log_error("compress-forwarder source:%s failed to
> preserve input before target write: %s",
> -+                              d->monitor_name, spa_strerror(res));
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+
> -+      if (d->playback =3D=3D NULL) {
> -+              request_playback_activation(d);
> -+              if (d->playback =3D=3D NULL) {
> -+                      pw_log_debug("compress-forwarder source:%s
> preserved %u bytes pending target create total=3D%u",
> -+                                      d->monitor_name, in_size,
> d->pending_size - d->pending_offset);
> -+                      pw_stream_queue_buffer(d->capture, in_buf);
> -+                      return;
> -+              }
> -+      }
> -+      if (!d->playback_active)
> -+              set_playback_active(d, true);
> -+      if (d->playback_failed || !d->playback_active) {
> -+              pw_log_debug("compress-forwarder source:%s preserved %u
> bytes pending inactive target total=3D%u",
> -+                              d->monitor_name, in_size, d->pending_size
> - d->pending_offset);
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+
> -+      out_buf =3D pw_stream_dequeue_buffer(d->playback);
> -+      if (out_buf =3D=3D NULL) {
> -+              pw_log_debug("compress-forwarder source:%s preserved %u
> bytes pending output buffer total=3D%u",
> -+                              d->monitor_name, in_size, d->pending_size
> - d->pending_offset);
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+
> -+      out_data =3D &out_buf->buffer->datas[0];
> -+      if (out_data->data =3D=3D NULL || out_data->chunk =3D=3D NULL) {
> -+              pw_stream_queue_buffer(d->playback, out_buf);
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+
> -+      out_size =3D out_data->maxsize;
> -+      if (out_size =3D=3D 0) {
> -+              pw_stream_queue_buffer(d->playback, out_buf);
> -+              pw_stream_queue_buffer(d->capture, in_buf);
> -+              return;
> -+      }
> -+      copy_data =3D d->pending_data + d->pending_offset;
> -+      copy_available =3D d->pending_size - d->pending_offset;
> -+      copy_size =3D SPA_MIN(copy_available, out_size);
> -+      memcpy(out_data->data, copy_data, copy_size);
> -+      d->pending_offset +=3D copy_size;
> -+      if (d->pending_offset >=3D d->pending_size)
> -+              clear_pending_data(d);
> -+
> -+      out_data->chunk->offset =3D 0;
> -+      out_data->chunk->size =3D copy_size;
> -+      out_data->chunk->stride =3D 1;
> -+      out_buf->size =3D copy_size;
> -+
> -+      if (!d->logged_first_output_buffer) {
> -+              const uint8_t *out_bytes =3D out_data->data;
> -+              pw_log_debug("compress-forwarder target:%s queue buffer
> copy_size=3D%u out_max=3D%u chunk=3D%u/%u/%d bytes=3D%02x %02x %02x %02x =
%02x %02x
> %02x %02x",
> -+                              d->target_name, copy_size,
> out_data->maxsize,
> -+                              out_data->chunk->offset,
> out_data->chunk->size,
> -+                              out_data->chunk->stride,
> -+                              copy_size > 0 ? out_bytes[0] : 0,
> -+                              copy_size > 1 ? out_bytes[1] : 0,
> -+                              copy_size > 2 ? out_bytes[2] : 0,
> -+                              copy_size > 3 ? out_bytes[3] : 0,
> -+                              copy_size > 4 ? out_bytes[4] : 0,
> -+                              copy_size > 5 ? out_bytes[5] : 0,
> -+                              copy_size > 6 ? out_bytes[6] : 0,
> -+                              copy_size > 7 ? out_bytes[7] : 0);
> -+              d->logged_first_output_buffer =3D true;
> -+      }
> -+
> -+      pw_stream_queue_buffer(d->playback, out_buf);
> -+      pw_stream_queue_buffer(d->capture, in_buf);
> -+}
> -+
> -+static const struct pw_stream_events capture_events =3D {
> -+      PW_VERSION_STREAM_EVENTS,
> -+      .state_changed =3D capture_state_changed,
> -+      .process =3D capture_process,
> -+};
> -+
> -+static const struct pw_stream_events playback_events =3D {
> -+      PW_VERSION_STREAM_EVENTS,
> -+      .state_changed =3D playback_state_changed,
> -+};
> -+
> -+static void registry_global(void *data, uint32_t id, uint32_t
> permissions,
> -+              const char *type, uint32_t version, const struct spa_dict
> *props)
> -+{
> -+      struct forwarder_data *d =3D data;
> -+      const char *name;
> -+
> -+      if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || props =3D=3D NULL=
)
> -+              return;
> -+      name =3D spa_dict_lookup(props, PW_KEY_NODE_NAME);
> -+      if (!spa_streq(name, d->target_name))
> -+              return;
> -+      d->target_id =3D id;
> -+      pw_log_info("compress-forwarder target:%s resolved id=3D%u",
> d->target_name, id);
> -+}
> -+
> -+static void registry_global_remove(void *data, uint32_t id)
> -+{
> -+      struct forwarder_data *d =3D data;
> -+
> -+      if (id !=3D d->target_id)
> -+              return;
> -+      pw_log_info("compress-forwarder target:%s removed id=3D%u",
> d->target_name, id);
> -+      d->target_id =3D PW_ID_ANY;
> -+      destroy_playback_stream(d);
> -+}
> -+
> -+static const struct pw_registry_events registry_events =3D {
> -+      PW_VERSION_REGISTRY_EVENTS,
> -+      .global =3D registry_global,
> -+      .global_remove =3D registry_global_remove,
> -+};
> -+
> -+static int create_playback_stream(struct forwarder_data *d)
> -+{
> -+      struct pw_properties *props;
> -+      const struct spa_pod *params[2];
> -+      uint8_t buffer[1024];
> -+      struct spa_pod_builder builder;
> -+      uint32_t n_params =3D 0;
> -+      int res;
> -+
> -+      props =3D pw_properties_new(PW_KEY_MEDIA_CLASS,
> "Stream/Output/Audio",
> -+                      PW_KEY_NODE_NAME,
> "compress-offload-forwarder-output",
> -+                      PW_KEY_MEDIA_TYPE, "Audio",
> -+                      PW_KEY_MEDIA_CATEGORY, "Playback",
> -+                      PW_KEY_MEDIA_ROLE, "Music",
> -+                      PW_KEY_TARGET_OBJECT, d->target_name,
> -+                      PW_KEY_NODE_AUTOCONNECT, "true",
> -+                      PW_KEY_STREAM_DONT_REMIX, "true",
> -+                      "node.dont-reconnect", "true",
> -+                      PW_KEY_NODE_RATE, "1/48000",
> -+                      "compress.offload", "true",
> -+                      "codec.type", d->codec,
> -+                      NULL);
> -+      if (props =3D=3D NULL)
> -+              return -errno;
> -+      pw_properties_setf(props, "codec.sample_rate", "%u", d->rate);
> -+      pw_properties_setf(props, "codec.channels", "%u", d->channels);
> -+      pw_properties_setf(props, "codec.bit_rate", "%u", d->bitrate);
> -+      pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
> -+
> -+      d->playback =3D pw_stream_new(d->core, "compress offload forwarde=
r
> output", props);
> -+      if (d->playback =3D=3D NULL)
> -+              return -errno;
> -+      pw_stream_add_listener(d->playback, &d->playback_listener,
> &playback_events, d);
> -+
> -+      spa_pod_builder_init(&builder, buffer, sizeof(buffer));
> -+      params[n_params++] =3D build_encoded_format(d, &builder,
> SPA_PARAM_EnumFormat);
> -+      pw_log_debug("compress-forwarder target:%s connect target-id=3D%u=
",
> d->target_name, d->target_id);
> -+      res =3D pw_stream_connect(d->playback, PW_DIRECTION_OUTPUT,
> d->target_id,
> -+                      PW_STREAM_FLAG_AUTOCONNECT |
> -+                      PW_STREAM_FLAG_NO_CONVERT |
> -+                      PW_STREAM_FLAG_MAP_BUFFERS |
> -+                      PW_STREAM_FLAG_RT_PROCESS,
> -+                      params, n_params);
> -+      if (res < 0) {
> -+              destroy_playback_stream(d);
> -+              return res;
> -+      }
> -+      pw_stream_set_active(d->playback, false);
> -+      d->playback_active =3D false;
> -+      d->playback_failed =3D false;
> -+      return 0;
> -+}
> -+
> -+static int create_capture_stream(struct forwarder_data *d)
> -+{
> -+      struct pw_properties *props;
> -+      const struct spa_pod *params[2];
> -+      uint8_t buffer[1024];
> -+      struct spa_pod_builder builder;
> -+      uint32_t n_params =3D 0;
> -+      int res;
> -+
> -+      props =3D pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Input/Aud=
io",
> -+                      PW_KEY_NODE_NAME,
> "compress-offload-forwarder-capture",
> -+                      PW_KEY_TARGET_OBJECT, d->source_name,
> -+                      PW_KEY_NODE_AUTOCONNECT, "true",
> -+                      PW_KEY_STREAM_CAPTURE_SINK, "true",
> -+                      PW_KEY_STREAM_DONT_REMIX, "true",
> -+                      "node.dont-reconnect", "true",
> -+                      NULL);
> -+      if (props =3D=3D NULL)
> -+              return -errno;
> -+      pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
> -+
> -+      d->capture =3D pw_stream_new(d->core, "compress offload forwarder
> capture", props);
> -+      if (d->capture =3D=3D NULL)
> -+              return -errno;
> -+      pw_stream_add_listener(d->capture, &d->capture_listener,
> &capture_events, d);
> -+
> -+      spa_pod_builder_init(&builder, buffer, sizeof(buffer));
> -+      params[n_params++] =3D build_raw_format(d, &builder,
> SPA_PARAM_EnumFormat);
> -+      res =3D pw_stream_connect(d->capture, PW_DIRECTION_INPUT, PW_ID_A=
NY,
> -+                      PW_STREAM_FLAG_AUTOCONNECT |
> -+                      PW_STREAM_FLAG_MAP_BUFFERS |
> -+                      PW_STREAM_FLAG_RT_PROCESS,
> -+                      params, n_params);
> -+      if (res < 0)
> -+              return res;
> -+      pw_stream_set_active(d->capture, true);
> -+      return 0;
> -+}
> -+
> -+static void core_error(void *data, uint32_t id, int seq, int res, const
> char *message)
> -+{
> -+      struct module *module =3D data;
> -+
> -+      pw_log_error("compress-forwarder error id:%u seq:%d res:%d (%s):
> %s",
> -+                      id, seq, res, spa_strerror(res), message);
> -+      if (id =3D=3D PW_ID_CORE && res =3D=3D -EPIPE)
> -+              module_schedule_unload(module);
> -+}
> -+
> -+static const struct pw_core_events core_events =3D {
> -+      PW_VERSION_CORE_EVENTS,
> -+      .error =3D core_error,
> -+};
> -+
> -+static int module_compress_offload_forwarder_load(struct module *module=
)
> -+{
> -+      struct forwarder_data *d =3D module->user_data;
> -+      int res;
> -+
> -+      PW_LOG_TOPIC_INIT(mod_topic);
> -+      d->loop =3D pw_context_get_main_loop(module->impl->context);
> -+      if (d->loop =3D=3D NULL)
> -+              return -EINVAL;
> -+      d->activate_event =3D pw_loop_add_event(d->loop,
> playback_activate_event, d);
> -+      if (d->activate_event =3D=3D NULL)
> -+              return -errno;
> -+      d->core =3D pw_context_connect(module->impl->context, NULL, 0);
> -+      if (d->core =3D=3D NULL)
> -+              return -errno;
> -+      pw_core_add_listener(d->core, &d->core_listener, &core_events,
> module);
> -+      d->target_id =3D PW_ID_ANY;
> -+      d->registry =3D pw_core_get_registry(d->core, PW_VERSION_REGISTRY=
,
> 0);
> -+      if (d->registry =3D=3D NULL)
> -+              return -errno;
> -+      pw_registry_add_listener(d->registry, &d->registry_listener,
> &registry_events, d);
> -+
> -+      res =3D create_capture_stream(d);
> -+      if (res < 0)
> -+              return res;
> -+
> -+      pw_log_info("compress-forwarder loaded: source=3D%s monitor=3D%s
> target=3D%s codec=3D%s rate=3D%u channels=3D%u",
> -+                      d->source_name, d->monitor_name, d->target_name,
> -+                      d->codec, d->rate, d->channels);
> -+      module_emit_loaded(module, 0);
> -+      return 0;
> -+}
> -+
> -+static int module_compress_offload_forwarder_unload(struct module
> *module)
> -+{
> -+      struct forwarder_data *d =3D module->user_data;
> -+
> -+      if (d->capture !=3D NULL) {
> -+              spa_hook_remove(&d->capture_listener);
> -+              pw_stream_destroy(d->capture);
> -+              d->capture =3D NULL;
> -+      }
> -+      destroy_playback_stream(d);
> -+      if (d->registry !=3D NULL) {
> -+              spa_hook_remove(&d->registry_listener);
> -+              pw_proxy_destroy((struct pw_proxy*)d->registry);
> -+              d->registry =3D NULL;
> -+      }
> -+      if (d->core !=3D NULL) {
> -+              spa_hook_remove(&d->core_listener);
> -+              pw_core_disconnect(d->core);
> -+              d->core =3D NULL;
> -+      }
> -+      if (d->activate_event !=3D NULL) {
> -+              pw_loop_destroy_source(d->loop, d->activate_event);
> -+              d->activate_event =3D NULL;
> -+      }
> -+      d->loop =3D NULL;
> -+      return 0;
> -+}
> -+
> -+static int module_compress_offload_forwarder_prepare(struct module
> *module)
> -+{
> -+      struct forwarder_data *d =3D module->user_data;
> -+      struct pw_properties *props =3D module->props;
> -+      const char *str;
> -+
> -+      PW_LOG_TOPIC_INIT(mod_topic);
> -+      str =3D pw_properties_get(props, "source_sink");
> -+      spa_scnprintf(d->source_name, sizeof(d->source_name), "%s",
> -+                      str ? str : "pal_speaker_compress");
> -+      str =3D pw_properties_get(props, "target_sink");
> -+      spa_scnprintf(d->target_name, sizeof(d->target_name), "%s",
> -+                      str ? str : "pal_sink_speaker_compress");
> -+      str =3D pw_properties_get(props, "codec");
> -+      spa_scnprintf(d->codec, sizeof(d->codec), "%s", str ? str :
> DEFAULT_CODEC);
> -+      d->rate =3D pw_properties_get_uint32(props, "rate", DEFAULT_RATE)=
;
> -+      d->channels =3D pw_properties_get_uint32(props, "channels",
> DEFAULT_CHANNELS);
> -+      d->bitrate =3D pw_properties_get_uint32(props, "bitrate",
> DEFAULT_BITRATE);
> -+      d->block_size =3D pw_properties_get_uint32(props, "block_size",
> DEFAULT_BLOCK_SIZE);
> -+      spa_scnprintf(d->monitor_name, sizeof(d->monitor_name),
> "%s.monitor", d->source_name);
> -+
> -+      if (!spa_streq(d->codec, "mp3")) {
> -+              pw_log_warn("compress-forwarder only supports mp3 right
> now, requested codec=3D%s", d->codec);
> -+              return -ENOTSUP;
> -+      }
> -+      if (d->channels =3D=3D 0)
> -+              d->channels =3D DEFAULT_CHANNELS;
> -+      if (d->rate =3D=3D 0)
> -+              d->rate =3D DEFAULT_RATE;
> -+      if (d->block_size =3D=3D 0)
> -+              d->block_size =3D DEFAULT_BLOCK_SIZE;
> -+
> -+      return 0;
> -+}
> -+
> -+static const struct spa_dict_item
> module_compress_offload_forwarder_info[] =3D {
> -+      { PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
> -+      { PW_KEY_MODULE_DESCRIPTION, "Forward Pulse compress-offload sink
> data to PAL compress sink" },
> -+      { PW_KEY_MODULE_USAGE,       forwarder_options },
> -+      { PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
> -+};
> -+
> -+DEFINE_MODULE_INFO(module_compress_offload_forwarder) =3D {
> -+      .name       =3D "module-compress-offload-forwarder",
> -+      .prepare    =3D module_compress_offload_forwarder_prepare,
> -+      .load       =3D module_compress_offload_forwarder_load,
> -+      .unload     =3D module_compress_offload_forwarder_unload,
> -+      .properties =3D
> &SPA_DICT_INIT_ARRAY(module_compress_offload_forwarder_info),
> -+      .data_size  =3D sizeof(struct forwarder_data),
> -+};
> -diff --git
> a/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.=
c
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.=
c
> -new file mode 100644
> -index 0000000..243cc8e
> ---- /dev/null
> -+++
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.=
c
> -@@ -0,0 +1,293 @@
> -+/* PipeWire */
> -+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. *=
/
> -+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> -+
> -+#include <errno.h>
> -+#include <stdlib.h>
> -+
> -+#include <spa/utils/result.h>
> -+#include <pipewire/pipewire.h>
> -+
> -+#include "../module.h"
> -+
> -+static const char *const pulse_module_options =3D
> -+      "sink_name=3D<name of sink> "
> -+      "sink_properties=3D<properties for the sink> "
> -+      "target_sink=3D<node.name of the downstream compress-offload sink=
> "
> -+      "codec=3D<codec name, default mp3> "
> -+      "rate=3D<sample rate, default 44100> "
> -+      "channels=3D<number of channels, default 2> "
> -+      "bitrate=3D<bit rate, default 128000>";
> -+
> -+#define NAME "compress-offload-sink"
> -+
> -+PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
> -+#define PW_LOG_TOPIC_DEFAULT mod_topic
> -+
> -+struct module_compress_offload_sink_data {
> -+      struct pw_core *core;
> -+      struct spa_hook core_listener;
> -+
> -+      struct pw_proxy *proxy;
> -+      struct spa_hook proxy_listener;
> -+};
> -+
> -+static void module_proxy_removed(void *data)
> -+{
> -+      struct module *module =3D data;
> -+      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> -+
> -+      pw_log_debug("compress-forwarder proxy removed: proxy=3D%p",
> d->proxy);
> -+      pw_proxy_destroy(d->proxy);
> -+}
> -+
> -+static void module_proxy_destroy(void *data)
> -+{
> -+      struct module *module =3D data;
> -+      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> -+
> -+      pw_log_debug("compress-forwarder proxy destroy: proxy=3D%p -
> scheduling module unload", d->proxy);
> -+      spa_hook_remove(&d->proxy_listener);
> -+      d->proxy =3D NULL;
> -+      module_schedule_unload(module);
> -+}
> -+
> -+static void module_proxy_bound_props(void *data, uint32_t global_id,
> const struct spa_dict *props)
> -+{
> -+      struct module *module =3D data;
> -+      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> -+
> -+      pw_log_debug("proxy %p bound id:%u module_index=3D%u", d->proxy,
> global_id, module->index);
> -+      pw_log_debug("compress-forwarder node successfully created and
> bound, emitting loaded");
> -+      module_emit_loaded(module, 0);
> -+}
> -+
> -+static void module_proxy_error(void *data, int seq, int res, const char
> *message)
> -+{
> -+      struct module *module =3D data;
> -+      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> -+
> -+      pw_log_error("proxy %p error %d: %s", d->proxy, res, message);
> -+      pw_proxy_destroy(d->proxy);
> -+}
> -+
> -+static const struct pw_proxy_events proxy_events =3D {
> -+      PW_VERSION_PROXY_EVENTS,
> -+      .removed      =3D module_proxy_removed,
> -+      .bound_props  =3D module_proxy_bound_props,
> -+      .error        =3D module_proxy_error,
> -+      .destroy      =3D module_proxy_destroy,
> -+};
> -+
> -+static void module_core_error(void *data, uint32_t id, int seq, int res=
,
> const char *message)
> -+{
> -+      struct module *module =3D data;
> -+
> -+      pw_log_error("error id:%u seq:%d res:%d (%s): %s",
> -+                      id, seq, res, spa_strerror(res), message);
> -+
> -+      if (id =3D=3D PW_ID_CORE && res =3D=3D -EPIPE)
> -+              module_schedule_unload(module);
> -+}
> -+
> -+static const struct pw_core_events core_events =3D {
> -+      PW_VERSION_CORE_EVENTS,
> -+      .error =3D module_core_error,
> -+};
> -+
> -+static int module_compress_offload_sink_load(struct module *module)
> -+{
> -+      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> -+
> -+      pw_log_info("compress-forwarder load: node=3D%s target=3D%s codec=
=3D%s
> rate=3D%s channels=3D%s bitrate=3D%s",
> -+                      pw_properties_get(module->props, PW_KEY_NODE_NAME=
),
> -+                      pw_properties_get(module->props,
> "compress.target.object"),
> -+                      pw_properties_get(module->props, "codec.type"),
> -+                      pw_properties_get(module->props,
> "codec.sample_rate"),
> -+                      pw_properties_get(module->props, "codec.channels"=
),
> -+                      pw_properties_get(module->props,
> "codec.bit_rate"));
> -+
> -+      d->core =3D pw_context_connect(module->impl->context, NULL, 0);
> -+      if (d->core =3D=3D NULL) {
> -+              pw_log_error("compress-forwarder core connect failed:
> errno=3D%d (%s)",
> -+                              errno, spa_strerror(-errno));
> -+              return -errno;
> -+      }
> -+
> -+      pw_log_debug("compress-forwarder core connected: core=3D%p",
> d->core);
> -+      pw_core_add_listener(d->core, &d->core_listener, &core_events,
> module);
> -+      pw_properties_setf(module->props, "pulse.module.id", "%u",
> module->index);
> -+
> -+      d->proxy =3D pw_core_create_object(d->core,
> -+                                       "adapter",
> PW_TYPE_INTERFACE_Node, PW_VERSION_NODE,
> -+                                       module->props ?
> &module->props->dict : NULL, 0);
> -+      if (d->proxy =3D=3D NULL) {
> -+              pw_log_error("compress-forwarder adapter create failed:
> errno=3D%d (%s)",
> -+                              errno, spa_strerror(-errno));
> -+              return -errno;
> -+      }
> -+
> -+      pw_log_debug("compress-forwarder adapter create requested:
> proxy=3D%p - waiting for bound_props", d->proxy);
> -+      pw_proxy_add_listener(d->proxy, &d->proxy_listener, &proxy_events=
,
> module);
> -+      return SPA_RESULT_RETURN_ASYNC(0);
> -+}
> -+
> -+static int module_compress_offload_sink_unload(struct module *module)
> -+{
> -+      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> -+
> -+      pw_log_debug("compress-forwarder unload: proxy=3D%p core=3D%p -
> cleaning up", d->proxy, d->core);
> -+      if (d->proxy !=3D NULL) {
> -+              spa_hook_remove(&d->proxy_listener);
> -+              pw_proxy_destroy(d->proxy);
> -+              d->proxy =3D NULL;
> -+      }
> -+      if (d->core !=3D NULL) {
> -+              spa_hook_remove(&d->core_listener);
> -+              pw_core_disconnect(d->core);
> -+              d->core =3D NULL;
> -+      }
> -+      return 0;
> -+}
> -+
> -+static int module_compress_offload_sink_prepare(struct module * const
> module)
> -+{
> -+      struct pw_properties * const props =3D module->props;
> -+      const char *str;
> -+      uint32_t rate =3D 44100;
> -+      uint32_t channels =3D 2;
> -+      uint32_t bitrate =3D 128000;
> -+
> -+      PW_LOG_TOPIC_INIT(mod_topic);
> -+
> -+      if ((str =3D pw_properties_get(props, "sink_name")) !=3D NULL) {
> -+              pw_log_debug("compress-forwarder option: sink_name=3D%s",
> str);
> -+              pw_properties_set(props, PW_KEY_NODE_NAME, str);
> -+              pw_properties_set(props, "sink_name", NULL);
> -+      } else {
> -+              pw_log_debug("compress-forwarder option: sink_name
> missing, using default");
> -+              pw_properties_set(props, PW_KEY_NODE_NAME,
> "compress-offload-sink");
> -+      }
> -+
> -+      if ((str =3D pw_properties_get(props, "sink_properties")) !=3D NU=
LL) {
> -+              pw_log_debug("compress-forwarder option:
> sink_properties=3D%s", str);
> -+              module_args_add_props(props, str);
> -+              pw_properties_set(props, "sink_properties", NULL);
> -+      }
> -+
> -+      if ((str =3D pw_properties_get(props, "target_sink")) !=3D NULL) =
{
> -+              pw_log_debug("compress-forwarder option: target_sink=3D%s=
",
> str);
> -+              pw_properties_set(props, "compress.target.object", str);
> -+              pw_properties_set(props, "target_sink", NULL);
> -+      } else {
> -+              pw_log_warn("compress-forwarder option: target_sink
> missing; stream will not have explicit compress target");
> -+      }
> -+
> -+      if ((str =3D pw_properties_get(props, "rate")) !=3D NULL) {
> -+              uint32_t v =3D (uint32_t)atoi(str);
> -+              if (v > 0)
> -+                      rate =3D v;
> -+              pw_properties_set(props, "rate", NULL);
> -+      }
> -+      if ((str =3D pw_properties_get(props, "channels")) !=3D NULL) {
> -+              uint32_t v =3D (uint32_t)atoi(str);
> -+              if (v > 0)
> -+                      channels =3D v;
> -+              pw_properties_set(props, "channels", NULL);
> -+      }
> -+      if ((str =3D pw_properties_get(props, "bitrate")) !=3D NULL) {
> -+              uint32_t v =3D (uint32_t)atoi(str);
> -+              if (v > 0)
> -+                      bitrate =3D v;
> -+              pw_properties_set(props, "bitrate", NULL);
> -+      }
> -+      if ((str =3D pw_properties_get(props, "channel_map")) !=3D NULL) =
{
> -+              pw_properties_set(props, "audio.position", str);
> -+              pw_properties_set(props, "channel_map", NULL);
> -+      } else {
> -+              switch (channels) {
> -+              case 1:
> -+                      pw_properties_set(props, "audio.position", "[ MON=
O
> ]");
> -+                      break;
> -+              case 2:
> -+                      pw_properties_set(props, "audio.position", "[ FL
> FR ]");
> -+                      break;
> -+              case 3:
> -+                      pw_properties_set(props, "audio.position", "[ FL
> FR LFE ]");
> -+                      break;
> -+              case 4:
> -+                      pw_properties_set(props, "audio.position", "[ FL
> FR RL RR ]");
> -+                      break;
> -+              case 5:
> -+                      pw_properties_set(props, "audio.position", "[ FL
> FR FC RL RR ]");
> -+                      break;
> -+              case 6:
> -+                      pw_properties_set(props, "audio.position", "[ FL
> FR FC LFE RL RR ]");
> -+                      break;
> -+              case 8:
> -+                      pw_properties_set(props, "audio.position", "[ FL
> FR FC LFE RL RR SL SR ]");
> -+                      break;
> -+              default:
> -+                      break;
> -+              }
> -+      }
> -+
> -+      str =3D pw_properties_get(props, "codec");
> -+      pw_properties_set(props, "codec.type", str ? str : "mp3");
> -+      pw_properties_setf(props, "codec.sample_rate", "%u", rate);
> -+      pw_properties_setf(props, "codec.channels",    "%u", channels);
> -+      pw_properties_setf(props, "codec.bit_rate",    "%u", bitrate);
> -+      pw_properties_set(props, "codec", NULL);
> -+
> -+      if (pw_properties_get(props, PW_KEY_MEDIA_CLASS) =3D=3D NULL)
> -+              pw_properties_set(props, PW_KEY_MEDIA_CLASS, "Audio/Sink"=
);
> -+      if (pw_properties_get(props, PW_KEY_NODE_DESCRIPTION) =3D=3D NULL=
)
> -+              pw_properties_setf(props, PW_KEY_NODE_DESCRIPTION, "%s
> (compress offload)",
> -+                              pw_properties_get(props,
> PW_KEY_NODE_NAME));
> -+
> -+      /*
> -+       * Advertise this node as an encoded-only sink so WirePlumber's
> -+       * canPassthrough() allows linking compress streams to it.
> -+       * audio.format=3DS16LE is kept as the synthetic PCM sample_spec =
that
> -+       * Pulse clients see in pactl; no PCM conversion ever occurs.
> -+       */
> -+      pw_properties_set(props, PW_KEY_AUDIO_FORMAT,
> "S16LE");
> -+      pw_properties_setf(props, PW_KEY_AUDIO_RATE,                 "%u"=
,
> rate);
> -+      pw_properties_setf(props, PW_KEY_AUDIO_CHANNELS,             "%u"=
,
> channels);
> -+      pw_properties_set(props, "item.node.supports-encoded-fmts",
> "true");
> -+      pw_properties_set(props, PW_KEY_NODE_VIRTUAL,
> "true");
> -+      pw_properties_set(props, PW_KEY_PRIORITY_SESSION,            "1")=
;
> -+      pw_properties_set(props, PW_KEY_PRIORITY_DRIVER,             "1")=
;
> -+      pw_properties_set(props, "monitor.channel-volumes",
> "true");
> -+      pw_properties_set(props, "monitor.passthrough",
> "true");
> -+      pw_properties_set(props, "compress.offload",
>  "true");
> -+      pw_properties_set(props, PW_KEY_FACTORY_NAME,
> "support.null-audio-sink");
> -+
> -+      pw_log_info("prepared compress-forwarder alias: name=3D%s target=
=3D%s
> codec=3D%s rate=3D%u channels=3D%u bitrate=3D%u media.class=3D%s audio.fo=
rmat=3D%s
> virtual=3D%s factory=3D%s",
> -+                      pw_properties_get(props, PW_KEY_NODE_NAME),
> -+                      pw_properties_get(props, "compress.target.object"=
),
> -+                      pw_properties_get(props, "codec.type"),
> -+                      rate, channels, bitrate,
> -+                      pw_properties_get(props, PW_KEY_MEDIA_CLASS),
> -+                      pw_properties_get(props, PW_KEY_AUDIO_FORMAT),
> -+                      pw_properties_get(props, PW_KEY_NODE_VIRTUAL),
> -+                      pw_properties_get(props, PW_KEY_FACTORY_NAME));
> -+
> -+      return 0;
> -+}
> -+
> -+static const struct spa_dict_item module_compress_offload_sink_info[] =
=3D {
> -+      { PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
> -+      { PW_KEY_MODULE_DESCRIPTION, "Pulse-visible alias sink for
> compressed offload playback" },
> -+      { PW_KEY_MODULE_USAGE,       pulse_module_options },
> -+      { PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
> -+};
> -+
> -+DEFINE_MODULE_INFO(module_compress_offload_sink) =3D {
> -+      .name       =3D "module-compress-offload-sink",
> -+      .prepare    =3D module_compress_offload_sink_prepare,
> -+      .load       =3D module_compress_offload_sink_load,
> -+      .unload     =3D module_compress_offload_sink_unload,
> -+      .properties =3D
> &SPA_DICT_INIT_ARRAY(module_compress_offload_sink_info),
> -+      .data_size  =3D sizeof(struct module_compress_offload_sink_data),
> -+};
> -diff --git a/src/modules/module-protocol-pulse/pulse-server.c
> b/src/modules/module-protocol-pulse/pulse-server.c
> -index eb3233b..61f0dfb 100644
> ---- a/src/modules/module-protocol-pulse/pulse-server.c
> -+++ b/src/modules/module-protocol-pulse/pulse-server.c
> -@@ -84,6 +84,9 @@ struct temporary_move_data {
> -       uint8_t used:1;
> - };
> -
> -+/* Buffer size used for compress-offload streams (frame_size =3D=3D 1).=
 */
> -+#define COMPRESS_OFFLOAD_BUF_SIZE  16484u
> -+
> - static struct sample *find_sample(struct impl *impl, uint32_t index,
> const char *name)
> - {
> -       union pw_map_item *item;
> -@@ -1199,10 +1202,18 @@ static const struct spa_pod
> *get_buffers_param(struct stream *s,
> -       blocks =3D 1;
> -       stride =3D s->frame_size;
> -
> -+      /* compressed offload uses byte granularity */
> -+      if (s->frame_size =3D=3D 1) {
> -+              size =3D COMPRESS_OFFLOAD_BUF_SIZE;
> -+              pw_log_debug("[%s] get_buffers_param: compress offload
> path size=3D%u", s->client->name, size);
> -+              goto build_buffers_param;
> -+      }
> -+
> -       size =3D defs->quantum_limit * s->frame_size;
> -
> -       pw_log_info("[%s] stride %d size %u", s->client->name, stride,
> size);
> -
> -+build_buffers_param:
> -       param =3D spa_pod_builder_add_object(b,
> -                       SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,
> -                       SPA_PARAM_BUFFERS_buffers,
> SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,
> -@@ -1228,6 +1239,23 @@ static void stream_param_changed(void *data,
> uint32_t id, const struct spa_pod *
> -       if (id !=3D SPA_PARAM_Format || param =3D=3D NULL)
> -               return;
> -
> -+      /* For compress-offload streams, force byte-granularity regardles=
s
> -+       * of negotiated format (we connect with S16LE but data is
> compressed). */
> -+      {
> -+              const char *co =3D stream->props ?
> -+                      pw_properties_get(stream->props,
> "compress.offload") : NULL;
> -+              if (co && pw_properties_parse_bool(co)) {
> -+                      uint32_t media_type =3D 0, media_subtype =3D 0;
> -+                      spa_format_parse(param, &media_type,
> &media_subtype);
> -+                      stream->frame_size =3D 1;
> -+                      stream->rate =3D stream->ss.rate ? stream->ss.rat=
e :
> -+                              pw_properties_get_uint32(stream->props,
> "codec.sample_rate", 44100);
> -+                      pw_log_debug("[%s] compress-offload
> stream_param_changed: forcing frame_size=3D1 rate=3D%u subtype=3D%u",
> -+                              stream->client->name, stream->rate,
> media_subtype);
> -+                      goto stream_param_format_done;
> -+              }
> -+      }
> -+
> -       if ((res =3D format_parse_param(param, false, &stream->ss,
> &stream->map, NULL, NULL)) < 0) {
> -               pw_stream_set_error(stream->stream, res, "format not
> supported");
> -               return;
> -@@ -1243,6 +1271,9 @@ static void stream_param_changed(void *data,
> uint32_t id, const struct spa_pod *
> -               return;
> -       }
> -       stream->rate =3D stream->ss.rate;
> -+stream_param_format_done:
> -+      pw_log_debug("[%s] stream param done: frame_size=3D%u rate=3D%u
> ss.format=3D%u",
> -+                      stream->client->name, stream->frame_size,
> stream->rate, stream->ss.format);
> -
> -       if (stream->create_tag !=3D SPA_ID_INVALID) {
> -               struct pw_manager_object *peer;
> -@@ -1583,6 +1614,98 @@ static void log_format_info(struct impl *impl,
> enum spa_log_level level, struct
> -                               impl, it->key, it->value);
> - }
> -
> -+static const struct spa_pod *build_compress_offload_format(struct
> spa_pod_builder *b,
> -+              uint32_t id, const struct pw_properties *props, uint32_t
> *rate)
> -+{
> -+      const char *codec;
> -+      struct spa_audio_info info;
> -+      uint32_t sample_rate, channels, bitrate;
> -+
> -+      spa_zero(info);
> -+      info.media_type =3D SPA_MEDIA_TYPE_audio;
> -+      codec =3D pw_properties_get(props, "codec.type");
> -+      sample_rate =3D pw_properties_get_uint32(props, "codec.sample_rat=
e",
> 44100);
> -+      channels =3D pw_properties_get_uint32(props, "codec.channels", 2)=
;
> -+      bitrate =3D pw_properties_get_uint32(props, "codec.bit_rate",
> 128000);
> -+
> -+      if (codec =3D=3D NULL || spa_streq(codec, "mp3")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;
> -+              info.info.mp3.rate =3D sample_rate;
> -+              info.info.mp3.channels =3D channels;
> -+              info.info.mp3.channel_mode =3D channels =3D=3D 1 ?
> -+                      SPA_AUDIO_MP3_CHANNEL_MODE_MONO :
> SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
> -+      } else if (spa_streq(codec, "aac") || spa_streq(codec,
> "aac_adts")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> -+              info.info.aac.rate =3D sample_rate;
> -+              info.info.aac.channels =3D channels;
> -+              info.info.aac.bitrate =3D bitrate;
> -+              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;
> -+      } else if (spa_streq(codec, "aac_adif")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> -+              info.info.aac.rate =3D sample_rate;
> -+              info.info.aac.channels =3D channels;
> -+              info.info.aac.bitrate =3D bitrate;
> -+              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_ADIF;
> -+      } else if (spa_streq(codec, "aac_latm")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> -+              info.info.aac.rate =3D sample_rate;
> -+              info.info.aac.channels =3D channels;
> -+              info.info.aac.bitrate =3D bitrate;
> -+              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4LATM;
> -+      } else if (spa_streq(codec, "flac")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_flac;
> -+              info.info.flac.rate =3D sample_rate;
> -+              info.info.flac.channels =3D channels;
> -+      } else if (spa_streq(codec, "vorbis")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_vorbis;
> -+              info.info.vorbis.rate =3D sample_rate;
> -+              info.info.vorbis.channels =3D channels;
> -+      } else if (spa_streq(codec, "opus")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_opus;
> -+              info.info.opus.rate =3D sample_rate;
> -+              info.info.opus.channels =3D channels;
> -+      } else if (spa_streq(codec, "wma") || spa_streq(codec, "wma_std")=
)
> {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_wma;
> -+              info.info.wma.rate =3D sample_rate;
> -+              info.info.wma.channels =3D channels;
> -+              info.info.wma.bitrate =3D bitrate;
> -+              info.info.wma.profile =3D SPA_AUDIO_WMA_PROFILE_WMA9;
> -+      } else if (spa_streq(codec, "wma_pro")) {
> -+              info.media_subtype =3D SPA_MEDIA_SUBTYPE_wma;
> -+              info.info.wma.rate =3D sample_rate;
> -+              info.info.wma.channels =3D channels;
> -+              info.info.wma.bitrate =3D bitrate;
> -+              info.info.wma.profile =3D SPA_AUDIO_WMA_PROFILE_WMA9_PRO;
> -+      } else {
> -+              errno =3D ENOTSUP;
> -+              return NULL;
> -+      }
> -+      if (rate !=3D NULL)
> -+              *rate =3D sample_rate;
> -+      return spa_format_audio_build(b, id, &info);
> -+}
> -+
> -+static void synthesize_compress_offload_spec(struct sample_spec *ss,
> -+              struct channel_map *map, const struct pw_properties *prop=
s)
> -+{
> -+      uint32_t channels;
> -+      ss->format =3D SPA_AUDIO_FORMAT_S16_LE;
> -+      ss->rate =3D pw_properties_get_uint32(props, "codec.sample_rate",
> 44100);
> -+      channels =3D pw_properties_get_uint32(props, "codec.channels", 2)=
;
> -+      ss->channels =3D (uint8_t)(channels > 0 ? channels : 2);
> -+      spa_zero(*map);
> -+      switch (ss->channels) {
> -+      case 1: channel_map_parse("mono", map); break;
> -+      case 2: channel_map_parse("stereo", map); break;
> -+      case 3: channel_map_parse("surround-21", map); break;
> -+      case 4: channel_map_parse("surround-40", map); break;
> -+      case 5: channel_map_parse("surround-50", map); break;
> -+      case 6: channel_map_parse("surround-51", map); break;
> -+      case 8: channel_map_parse("surround-71", map); break;
> -+      default: channel_map_parse("stereo", map); ss->channels =3D 2; br=
eak;
> -+      }
> -+}
> -+
> - static int do_create_playback_stream(struct client *client, uint32_t
> command, uint32_t tag, struct message *m)
> - {
> -       struct impl *impl =3D client->impl;
> -@@ -1609,7 +1732,8 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> -               muted_set =3D false,
> -               fail_on_suspend =3D false,
> -               relative_volume =3D false,
> --              passthrough =3D false;
> -+              passthrough =3D false,
> -+              compress_offload =3D false;
> -       struct volume volume;
> -       struct pw_properties *props =3D NULL;
> -       uint8_t n_formats =3D 0;
> -@@ -1668,6 +1792,68 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> -       }
> -       o =3D find_device(client, sink_index, sink_name, true, &is_monito=
r);
> -
> -+      if (o !=3D NULL) {
> -+              const struct pw_node_info *ninfo =3D o->info;
> -+              const struct spa_dict *sp =3D (ninfo && ninfo->props) ?
> ninfo->props : NULL;
> -+              char node_name_buf[256] =3D {0};
> -+              const char *node_name;
> -+              const char *co;
> -+              const char *_nn =3D pw_properties_get(o->props,
> PW_KEY_NODE_NAME);
> -+
> -+              if (_nn)
> -+                      snprintf(node_name_buf, sizeof(node_name_buf),
> "%s", _nn);
> -+              node_name =3D node_name_buf[0] ? node_name_buf : NULL;
> -+              co =3D sp ? spa_dict_lookup(sp, "compress.offload") : NUL=
L;
> -+              pw_log_debug("[%s] compress-offload check: node=3D%s
> ninfo=3D%p co=3D%s",
> -+                              client->name, node_name ? node_name :
> "(null)", ninfo, co ? co : "(null)");
> -+              if (co && spa_atob(co)) {
> -+                      char target_buf[256] =3D {0};
> -+                      char codec_buf[64] =3D {0};
> -+                      char rate_buf[32] =3D {0};
> -+                      char channels_buf[16] =3D {0};
> -+                      char bitrate_buf[32] =3D {0};
> -+                      const char *target;
> -+                      const char *codec;
> -+                      const char *rate_s;
> -+                      const char *channels;
> -+                      const char *bitrate;
> -+                      const char *_s;
> -+
> -+                      if ((_s =3D spa_dict_lookup(sp,
> "compress.target.object")) !=3D NULL)
> -+                              snprintf(target_buf, sizeof(target_buf),
> "%s", _s);
> -+                      if ((_s =3D spa_dict_lookup(sp, "codec.type")) !=
=3D
> NULL)
> -+                              snprintf(codec_buf, sizeof(codec_buf),
> "%s", _s);
> -+                      if ((_s =3D spa_dict_lookup(sp,
> "codec.sample_rate")) !=3D NULL)
> -+                              snprintf(rate_buf, sizeof(rate_buf), "%s"=
,
> _s);
> -+                      if ((_s =3D spa_dict_lookup(sp, "codec.channels")=
)
> !=3D NULL)
> -+                              snprintf(channels_buf,
> sizeof(channels_buf), "%s", _s);
> -+                      if ((_s =3D spa_dict_lookup(sp, "codec.bit_rate")=
)
> !=3D NULL)
> -+                              snprintf(bitrate_buf, sizeof(bitrate_buf)=
,
> "%s", _s);
> -+
> -+                      target =3D target_buf[0] ? target_buf : NULL;
> -+                      codec =3D codec_buf[0] ? codec_buf : NULL;
> -+                      rate_s =3D rate_buf[0] ? rate_buf : NULL;
> -+                      channels =3D channels_buf[0] ? channels_buf : NUL=
L;
> -+                      bitrate =3D bitrate_buf[0] ? bitrate_buf : NULL;
> -+
> -+                      pw_properties_set(props, "compress.offload",
> "true");
> -+                      pw_properties_set(props,
> "item.node.supports-encoded-fmts", "true");
> -+                      pw_properties_set(props, PW_KEY_MEDIA_TYPE,
> "Audio");
> -+                      pw_properties_set(props, PW_KEY_MEDIA_CATEGORY,
> "Playback");
> -+                      pw_properties_set(props, PW_KEY_MEDIA_ROLE,
> "Music");
> -+                      if (codec) pw_properties_set(props, "codec.type",
> codec);
> -+                      if (rate_s) pw_properties_set(props,
> "codec.sample_rate", rate_s);
> -+                      if (channels) pw_properties_set(props,
> "codec.channels", channels);
> -+                      if (bitrate) pw_properties_set(props,
> "codec.bit_rate", bitrate);
> -+
> -+                      pw_log_info("[%s] detected compress-offload
> sink=3D%s target=3D%s codec=3D%s",
> -+                                      client->name, node_name ?
> node_name : "(null)",
> -+                                      target ? target : "(null)", codec
> ? codec : "(null)");
> -+                      pw_log_debug("[%s] compress target=3D%s - leaving
> sink_name=3D%s for virtual sink routing",
> -+                                      client->name, target ? target :
> "(null)", sink_name ? sink_name : "(null)");
> -+              }
> -+      }
> -+
> -       spa_zero(fix_ss);
> -       spa_zero(fix_map);
> -       if ((fix_format || fix_rate || fix_channels) && o !=3D NULL) {
> -@@ -1715,6 +1901,9 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> -                       goto error_protocol;
> -       }
> -
> -+      compress_offload =3D pw_properties_parse_bool(
> -+                      pw_properties_get(props, "compress.offload"));
> -+
> -       if (client->version >=3D 21) {
> -               if (message_get(m,
> -                               TAG_U8, &n_formats,
> -@@ -1732,7 +1921,9 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> -                                               TAG_INVALID) < 0)
> -                                       goto error_protocol;
> -
> --                              if (n_params < MAX_FORMATS &&
> -+                              if (compress_offload) {
> -+                                      log_format_info(impl,
> SPA_LOG_LEVEL_DEBUG, &format);
> -+                              } else if (n_params < MAX_FORMATS &&
> -                                   (params[n_params] =3D
> format_info_build_param(&b,
> -                                               SPA_PARAM_EnumFormat,
> &format, &r)) !=3D NULL) {
> -                                       n_params++;
> -@@ -1746,7 +1937,23 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> -                       }
> -               }
> -       }
> --      if (sample_spec_valid(&ss)) {
> -+      if (compress_offload) {
> -+              uint32_t compress_rate =3D 0;
> -+              if (n_params < MAX_FORMATS &&
> -+                  (params[n_params] =3D build_compress_offload_format(&=
b,
> -+                                      SPA_PARAM_EnumFormat, props,
> &compress_rate)) !=3D NULL) {
> -+                      n_params++;
> -+                      n_valid_formats++;
> -+                      ss_rate =3D rate =3D compress_rate;
> -+                      synthesize_compress_offload_spec(&ss, &map, props=
);
> -+                      pw_log_debug("[%s] synthesized compress-offload
> format codec=3D%s rate=3D%u channels=3D%u",
> -+                                      client->name,
> pw_properties_get(props, "codec.type"), compress_rate,
> -+                                      pw_properties_get_uint32(props,
> "codec.channels", 2));
> -+              } else {
> -+                      pw_log_warn("%p: unsupported compress codec:%s",
> -+                                      impl, pw_properties_get(props,
> "codec.type"));
> -+              }
> -+      } else if (sample_spec_valid(&ss)) {
> -               struct sample_spec sfix =3D ss;
> -               struct channel_map mfix =3D map;
> -
> -@@ -1770,6 +1977,8 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> -       if (m->offset !=3D m->length)
> -               goto error_protocol;
> -
> -+      pw_log_debug("[%s] format check: n_valid=3D%u n_params=3D%u
> compress=3D%d passthrough=3D%d",
> -+                      client->name, n_valid_formats, n_params,
> compress_offload, passthrough);
> -       if (n_valid_formats =3D=3D 0)
> -               goto error_no_formats;
> -
> -@@ -1806,6 +2015,8 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> -       flags =3D 0;
> -       if (no_move)
> -               flags |=3D PW_STREAM_FLAG_DONT_RECONNECT;
> -+      if (compress_offload)
> -+              flags |=3D PW_STREAM_FLAG_NO_CONVERT;
> -
> -       if (sink_name !=3D NULL) {
> -               if (o !=3D NULL)
> -@@ -1833,14 +2044,35 @@ static int do_create_playback_stream(struct
> client *client, uint32_t command, ui
> -                       &stream->stream_listener,
> -                       &stream_events, stream);
> -
> --      pw_stream_connect(stream->stream,
> --                      PW_DIRECTION_OUTPUT,
> --                      SPA_ID_INVALID,
> --                      flags |
> --                      PW_STREAM_FLAG_AUTOCONNECT |
> --                      PW_STREAM_FLAG_RT_PROCESS |
> --                      PW_STREAM_FLAG_MAP_BUFFERS,
> --                      params, n_params);
> -+      if (compress_offload) {
> -+              uint8_t raw_buf[256];
> -+              struct spa_pod_builder rb =3D SPA_POD_BUILDER_INIT(raw_bu=
f,
> sizeof(raw_buf));
> -+              struct spa_audio_info_raw raw_info =3D {
> -+                      .format =3D SPA_AUDIO_FORMAT_S16_LE,
> -+                      .rate =3D ss.rate ? ss.rate : 44100,
> -+                      .channels =3D ss.channels ? ss.channels : 2,
> -+              };
> -+              const struct spa_pod *raw_params[1];
> -+              raw_params[0] =3D spa_format_audio_raw_build(&rb,
> SPA_PARAM_EnumFormat, &raw_info);
> -+              pw_log_debug("[%s] pw_stream_connect: using raw S16LE
> param for compress sink", client->name);
> -+              pw_stream_connect(stream->stream,
> -+                              PW_DIRECTION_OUTPUT,
> -+                              SPA_ID_INVALID,
> -+                              flags |
> -+                              PW_STREAM_FLAG_AUTOCONNECT |
> -+                              PW_STREAM_FLAG_RT_PROCESS |
> -+                              PW_STREAM_FLAG_MAP_BUFFERS,
> -+                              raw_params, 1);
> -+      } else {
> -+              pw_stream_connect(stream->stream,
> -+                              PW_DIRECTION_OUTPUT,
> -+                              SPA_ID_INVALID,
> -+                              flags |
> -+                              PW_STREAM_FLAG_AUTOCONNECT |
> -+                              PW_STREAM_FLAG_RT_PROCESS |
> -+                              PW_STREAM_FLAG_MAP_BUFFERS,
> -+                              params, n_params);
> -+      }
> -
> -       stream_update_tag_param(stream);
> -
> ---
> -2.43.0
> -
> +From 867d36a330d78e4e55348983eb0701c5d3cd7fa1 Mon Sep 17 00:00:00 2001
> +From: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +Date: Fri, 23 Oct 2026 17:22:01 +0530
> +Subject: [PATCH 1/4] spa: expose the AAC audio object type
> +
> +Add an audio object type field to spa_audio_info_aac and define the
> +matching SPA format property.
> +
> +Parse the property when an AAC format pod is received and include it
> +when building an AAC format pod. Omit the property when its value is
> +zero so existing AAC format descriptions remain unchanged when no
> +object type is available.
> +
> +The audio object type identifies the MPEG-4 AAC profile independently
> +of the transport format, allowing raw AAC and ADTS streams to carry the
> +profile selected by the client.
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
> +Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +---
> + spa/include/spa/param/audio/aac-utils.h | 6 +++++-
> + spa/include/spa/param/audio/aac.h       | 1 +
> + spa/include/spa/param/format-types.h    | 2 ++
> + spa/include/spa/param/format.h          | 2 ++
> + 4 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/spa/include/spa/param/audio/aac-utils.h
> b/spa/include/spa/param/audio/aac-utils.h
> +index 3ec362d19..7be3a7c94 100644
> +--- a/spa/include/spa/param/audio/aac-utils.h
> ++++ b/spa/include/spa/param/audio/aac-utils.h
> +@@ -36,7 +36,8 @@ spa_format_audio_aac_parse(const struct spa_pod
> *format, struct spa_audio_info_a
> +                       SPA_FORMAT_AUDIO_rate,
> SPA_POD_OPT_Int(&info->rate),
> +                       SPA_FORMAT_AUDIO_channels,
> SPA_POD_OPT_Int(&info->channels),
> +                       SPA_FORMAT_AUDIO_bitrate,
>  SPA_POD_OPT_Int(&info->bitrate),
> +-                      SPA_FORMAT_AUDIO_AAC_streamFormat,
> SPA_POD_OPT_Id(&info->stream_format));
> ++                      SPA_FORMAT_AUDIO_AAC_streamFormat,
> SPA_POD_OPT_Id(&info->stream_format),
> ++                      SPA_FORMAT_AUDIO_AAC_audioObjectType,
>  SPA_POD_OPT_Int(&info->audio_object_type));
> +
> +       return res;
> + }
> +@@ -64,6 +65,9 @@ spa_format_audio_aac_build(struct spa_pod_builder
> *builder, uint32_t id,
> +       if (info->stream_format !=3D 0)
> +               spa_pod_builder_add(builder,
> +                       SPA_FORMAT_AUDIO_AAC_streamFormat,
> SPA_POD_Id(info->stream_format), 0);
> ++      if (info->audio_object_type !=3D 0)
> ++              spa_pod_builder_add(builder,
> ++                      SPA_FORMAT_AUDIO_AAC_audioObjectType,
>  SPA_POD_Int(info->audio_object_type), 0);
> +       return (struct spa_pod*)spa_pod_builder_pop(builder, &f);
> + }
> +
> +diff --git a/spa/include/spa/param/audio/aac.h
> b/spa/include/spa/param/audio/aac.h
> +index 1a7fb1612..db6ca083a 100644
> +--- a/spa/include/spa/param/audio/aac.h
> ++++ b/spa/include/spa/param/audio/aac.h
> +@@ -41,6 +41,7 @@ struct spa_audio_info_aac {
> +       uint32_t channels;                              /*< number of
> channels */
> +       uint32_t bitrate;                               /*< stream bitrat=
e
> */
> +       enum spa_audio_aac_stream_format stream_format; /*< AAC audio
> stream format */
> ++      uint32_t audio_object_type;                     /*< MPEG-4 audio
> object type */
> + };
> +
> + #define SPA_AUDIO_INFO_AAC_INIT(...)          ((struct
> spa_audio_info_aac) { __VA_ARGS__ })
> +diff --git a/spa/include/spa/param/format-types.h
> b/spa/include/spa/param/format-types.h
> +index 1ca4f729b..99f60fcb7 100644
> +--- a/spa/include/spa/param/format-types.h
> ++++ b/spa/include/spa/param/format-types.h
> +@@ -144,6 +144,8 @@ static const struct spa_type_info spa_type_format[] =
=3D
> {
> +
> +       { SPA_FORMAT_AUDIO_AAC_streamFormat, SPA_TYPE_Id,
> SPA_TYPE_INFO_FORMAT_AUDIO_AAC_BASE "streamFormat",
> +               spa_type_audio_aac_stream_format },
> ++      { SPA_FORMAT_AUDIO_AAC_audioObjectType, SPA_TYPE_Int,
> ++              SPA_TYPE_INFO_FORMAT_AUDIO_AAC_BASE "audioObjectType",
> NULL },
> +       { SPA_FORMAT_AUDIO_WMA_profile, SPA_TYPE_Id,
> SPA_TYPE_INFO_FORMAT_AUDIO_WMA_BASE "profile",
> +               spa_type_audio_wma_profile },
> +       { SPA_FORMAT_AUDIO_AMR_bandMode, SPA_TYPE_Id,
> SPA_TYPE_INFO_FORMAT_AUDIO_AMR_BASE "bandMode",
> +diff --git a/spa/include/spa/param/format.h
> b/spa/include/spa/param/format.h
> +index bef5116e9..d5e0f00c7 100644
> +--- a/spa/include/spa/param/format.h
> ++++ b/spa/include/spa/param/format.h
> +@@ -110,6 +110,8 @@ enum spa_format {
> +       SPA_FORMAT_AUDIO_blockAlign,            /**< audio data block
> alignment (Int) */
> +
> +       SPA_FORMAT_AUDIO_AAC_streamFormat,      /**< AAC stream format,
> (Id enum spa_audio_aac_stream_format) */
> ++      SPA_FORMAT_AUDIO_AAC_audioObjectType =3D SPA_FORMAT_START_Audio +
> 0x100,
> ++                                              /**< AAC audio object typ=
e
> (Int) */
> +
> +       SPA_FORMAT_AUDIO_WMA_profile,           /**< WMA profile (Id enum
> spa_audio_wma_profile) */
> +
> +--
> +GitLab
> +
> +
> +From a009b6ba406ce7f12c4cda8ab52d6fb18a8db29a Mon Sep 17 00:00:00 2001
> +From: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +Date: Fri, 23 Oct 2026 17:22:01 +0530
> +Subject: [PATCH 2/4] pulse-server: describe MP3 and AAC encoded formats
> +
> +Add Pulse format encodings for MP3, AAC with ADTS transport, and raw
> +AAC.
> +
> +Convert PipeWire MP3 and AAC format pods into Pulse format information,
> +including sample rate, channel count, bitrate, AAC transport format,
> +and AAC audio object type. Build the corresponding PipeWire format pods
> +when a Pulse client selects one of these encoded formats.
> +
> +This keeps encoded stream negotiation in the existing Pulse format
> +conversion layer and preserves codec parameters without treating the
> +payload as PCM audio.
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
> +Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +---
> + src/modules/module-protocol-pulse/format.c | 115 +++++++++++++++++++++
> + src/modules/module-protocol-pulse/format.h |   3 +
> + 2 files changed, 118 insertions(+)
> +
> +diff --git a/src/modules/module-protocol-pulse/format.c
> b/src/modules/module-protocol-pulse/format.c
> +index 913cfe996..d16f824d0 100644
> +--- a/src/modules/module-protocol-pulse/format.c
> ++++ b/src/modules/module-protocol-pulse/format.c
> +@@ -484,6 +484,9 @@ static const struct encoding_info encoding_names[] =
=3D {
> +       [ENCODING_MPEG2_AAC_IEC61937] =3D { "MPEG2-AAC-IEC61937",
> SPA_AUDIO_IEC958_CODEC_MPEG2_AAC },
> +       [ENCODING_TRUEHD_IEC61937] =3D { "TRUEHD-IEC61937",
> SPA_AUDIO_IEC958_CODEC_TRUEHD },
> +       [ENCODING_DTSHD_IEC61937] =3D { "DTSHD-IEC61937",
> SPA_AUDIO_IEC958_CODEC_DTSHD },
> ++      [ENCODING_MP3] =3D { "MP3", SPA_ID_INVALID },
> ++      [ENCODING_AAC] =3D { "AAC", SPA_ID_INVALID },
> ++      [ENCODING_AAC_ADTS] =3D { "AAC-ADTS", SPA_ID_INVALID },
> + };
> +
> + const char *format_encoding2name(enum encoding enc)
> +@@ -775,6 +778,39 @@ static int format_info_iec958_from_param(struct
> format_info *info, struct spa_po
> +       return add_int(info, "format.rate", param, SPA_FORMAT_AUDIO_rate)=
;
> + }
> +
> ++static int format_info_encoded_from_param(struct format_info *info,
> struct spa_pod *param,
> ++              uint32_t index, enum encoding encoding)
> ++{
> ++      struct spa_audio_info audio_info;
> ++
> ++      if (index > 0)
> ++              return -ENOENT;
> ++      if (spa_format_audio_parse(param, &audio_info) < 0)
> ++              return -ENOTSUP;
> ++      if ((info->props =3D pw_properties_new(NULL, NULL)) =3D=3D NULL)
> ++              return -errno;
> ++      info->encoding =3D encoding;
> ++
> ++      switch (encoding) {
> ++      case ENCODING_MP3:
> ++              pw_properties_setf(info->props, "format.rate", "%u",
> audio_info.info.mp3.rate);
> ++              pw_properties_setf(info->props, "format.channels", "%u",
> audio_info.info.mp3.channels);
> ++              break;
> ++      case ENCODING_AAC:
> ++      case ENCODING_AAC_ADTS:
> ++              pw_properties_setf(info->props, "format.rate", "%u",
> audio_info.info.aac.rate);
> ++              pw_properties_setf(info->props, "format.channels", "%u",
> audio_info.info.aac.channels);
> ++              pw_properties_setf(info->props, "format.bit_rate", "%u",
> audio_info.info.aac.bitrate);
> ++              pw_properties_set(info->props, "format.stream_format",
> ++                              audio_info.info.aac.stream_format =3D=3D
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS ?
> ++                              "\"adts\"" : "\"raw\"");
> ++              break;
> ++      default:
> ++              return -ENOTSUP;
> ++      }
> ++      return 0;
> ++}
> ++
> + int format_info_from_param(struct format_info *info, struct spa_pod
> *param, uint32_t index)
> + {
> +       uint32_t media_type, media_subtype;
> +@@ -793,6 +829,20 @@ int format_info_from_param(struct format_info *info=
,
> struct spa_pod *param, uint
> +       case SPA_MEDIA_SUBTYPE_iec958:
> +               res =3D format_info_iec958_from_param(info, param, index)=
;
> +               break;
> ++      case SPA_MEDIA_SUBTYPE_mp3:
> ++              res =3D format_info_encoded_from_param(info, param, index=
,
> ENCODING_MP3);
> ++              break;
> ++      case SPA_MEDIA_SUBTYPE_aac:
> ++      {
> ++              struct spa_audio_info audio_info;
> ++
> ++              if (spa_format_audio_parse(param, &audio_info) < 0)
> ++                      return -ENOTSUP;
> ++              res =3D format_info_encoded_from_param(info, param, index=
,
> ++                              audio_info.info.aac.stream_format =3D=3D
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS ?
> ++                              ENCODING_AAC_ADTS : ENCODING_AAC);
> ++              break;
> ++      }
> +       default:
> +               return -ENOTSUP;
> +       }
> +@@ -836,6 +886,36 @@ static int format_info_get_rate(const struct
> format_info *info)
> +       return -ENOTSUP;
> + }
> +
> ++static uint32_t format_info_get_u32_prop(const struct format_info *info=
,
> ++              const char *key, uint32_t default_value)
> ++{
> ++      const char *str, *val;
> ++      struct spa_json it[2];
> ++      int len, value;
> ++
> ++      if (info->props =3D=3D NULL || (str =3D pw_properties_get(info->p=
rops,
> key)) =3D=3D NULL)
> ++              return default_value;
> ++      if ((len =3D spa_json_begin(&it[0], str, strlen(str), &val)) <=3D=
 0)
> ++              return default_value;
> ++      if (spa_json_is_int(val, len) && spa_json_parse_int(val, len,
> &value) > 0 && value > 0)
> ++              return (uint32_t)value;
> ++      return default_value;
> ++}
> ++
> ++static bool format_info_string_prop_equals(const struct format_info
> *info,
> ++              const char *key, const char *value)
> ++{
> ++      const char *str, *val;
> ++      struct spa_json it[2];
> ++      int len;
> ++
> ++      if (info->props =3D=3D NULL || (str =3D pw_properties_get(info->p=
rops,
> key)) =3D=3D NULL)
> ++              return false;
> ++      if ((len =3D spa_json_begin(&it[0], str, strlen(str), &val)) > 0 =
&&
> spa_json_is_string(val, len))
> ++              return strlen(value) =3D=3D (size_t)len - 2 && strncasecm=
p(val
> + 1, value, len - 2) =3D=3D 0;
> ++      return spa_streq(str, value);
> ++}
> ++
> + int format_info_to_spec(const struct format_info *info, struct
> sample_spec *ss,
> +                         struct channel_map *map)
> + {
> +@@ -926,6 +1006,41 @@ const struct spa_pod
> *format_info_build_param(struct spa_pod_builder *b, uint32_
> +               param =3D spa_format_audio_iec958_build(b, id, &i);
> +               break;
> +       }
> ++      case ENCODING_MP3:
> ++      case ENCODING_AAC:
> ++      case ENCODING_AAC_ADTS:
> ++      {
> ++              struct spa_audio_info audio_info;
> ++              uint32_t channels;
> ++
> ++              spa_zero(audio_info);
> ++              audio_info.media_type =3D SPA_MEDIA_TYPE_audio;
> ++              if ((res =3D format_info_get_rate(info)) <=3D 0) {
> ++                      errno =3D -res;
> ++                      return NULL;
> ++              }
> ++              channels =3D format_info_get_u32_prop(info,
> "format.channels", 2);
> ++              if (info->encoding =3D=3D ENCODING_MP3) {
> ++                      audio_info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp=
3;
> ++                      audio_info.info.mp3.rate =3D res;
> ++                      audio_info.info.mp3.channels =3D channels;
> ++                      audio_info.info.mp3.channel_mode =3D channels =3D=
=3D 1 ?
> ++                              SPA_AUDIO_MP3_CHANNEL_MODE_MONO :
> SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
> ++              } else {
> ++                      audio_info.media_subtype =3D SPA_MEDIA_SUBTYPE_aa=
c;
> ++                      audio_info.info.aac.rate =3D res;
> ++                      audio_info.info.aac.channels =3D channels;
> ++                      audio_info.info.aac.bitrate =3D
> format_info_get_u32_prop(info, "format.bit_rate", 128000);
> ++                      audio_info.info.aac.stream_format =3D
> ++                                      info->encoding =3D=3D
> ENCODING_AAC_ADTS ||
> ++
> format_info_string_prop_equals(info, "format.stream_format", "adts") ?
> ++
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS :
> ++                                      SPA_AUDIO_AAC_STREAM_FORMAT_RAW;
> ++              }
> ++              *rate =3D res;
> ++              param =3D spa_format_audio_build(b, id, &audio_info);
> ++              break;
> ++      }
> +       default:
> +               errno =3D ENOTSUP;
> +               break;
> +diff --git a/src/modules/module-protocol-pulse/format.h
> b/src/modules/module-protocol-pulse/format.h
> +index c91ec7076..d873a8065 100644
> +--- a/src/modules/module-protocol-pulse/format.h
> ++++ b/src/modules/module-protocol-pulse/format.h
> +@@ -163,6 +163,9 @@ enum encoding {
> +       ENCODING_MPEG2_AAC_IEC61937,
> +       ENCODING_TRUEHD_IEC61937,
> +       ENCODING_DTSHD_IEC61937,
> ++      ENCODING_MP3,
> ++      ENCODING_AAC,
> ++      ENCODING_AAC_ADTS,
> +       ENCODING_MAX,
> +       ENCODING_INVALID =3D -1,
> + };
> +--
> +GitLab
> +
> +
> +From a06592eb77ded07fe3673fd1a1098304f1995a35 Mon Sep 17 00:00:00 2001
> +From: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +Date: Fri, 23 Oct 2026 17:45:41 +0530
> +Subject: [PATCH 3/4] pulse-server: add compressed-offload sink modules
> +
> +Add a Pulse-visible sink module for compressed playback and a forwarder
> +module that sends its encoded stream to a configured compressed-offload
> +sink.
> +
> +The sink module creates the Pulse endpoint and carries codec properties
> +for MP3, AAC ADTS, and raw AAC streams. The forwarder observes the
> +encoded monitor stream, preserves packet data, creates a matching target
> +stream, and forwards codec metadata without decoding or converting the
> +payload.
> +
> +Handle target discovery, stream creation, pending data, client removal,
> +target removal, state transitions, and module cleanup so the forwarding
> +stream is destroyed when either side disappears.
> +
> +Register both modules in the protocol-pulse build and keep their module
> +arguments and descriptions independent of any particular hardware or
> +backend implementation.
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
> +Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +---
> + src/modules/meson.build                       |    2 +
> + .../pulse-module-compress-offload-forwarder.c | 1052 +++++++++++++++++
> + .../pulse-module-compress-offload-forwarder.h |   20 +
> + .../pulse-module-compress-offload-sink.c      |  308 +++++
> + 4 files changed, 1382 insertions(+)
> + create mode 100644
> src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-f=
orwarder.c
> + create mode 100644
> src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-f=
orwarder.h
> + create mode 100644
> src/modules/module-protocol-pulse/modules/pulse-module-compress-offload-s=
ink.c
> +
> +diff --git a/src/modules/meson.build b/src/modules/meson.build
> +index 79f599ba2..5802ab1dd 100644
> +--- a/src/modules/meson.build
> ++++ b/src/modules/meson.build
> +@@ -338,6 +338,8 @@ pipewire_module_protocol_pulse_sources =3D [
> +   'module-protocol-pulse/modules/pulse-module-alsa-source.c',
> +   'module-protocol-pulse/modules/pulse-module-always-sink.c',
> +   'module-protocol-pulse/modules/pulse-module-combine-sink.c',
> ++
> 'module-protocol-pulse/modules/pulse-module-compress-offload-forwarder.c'=
,
> ++  'module-protocol-pulse/modules/pulse-module-compress-offload-sink.c',
> +   'module-protocol-pulse/modules/pulse-module-device-manager.c',
> +   'module-protocol-pulse/modules/pulse-module-device-restore.c',
> +   'module-protocol-pulse/modules/pulse-module-echo-cancel.c',
> +diff --git
> a/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-forwarder.c
> b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-forwarder.c
> +new file mode 100644
> +index 000000000..8afc1c425
> +--- /dev/null
> ++++
> b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-forwarder.c
> +@@ -0,0 +1,1052 @@
> ++/* PipeWire */
> ++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. *=
/
> ++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> ++
> ++#include <errno.h>
> ++#include <limits.h>
> ++#include <stdint.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++
> ++#include <spa/param/audio/compressed.h>
> ++#include <spa/param/audio/format-utils.h>
> ++#include <spa/param/audio/raw.h>
> ++#include <spa/utils/result.h>
> ++#include <spa/utils/string.h>
> ++#include <pipewire/pipewire.h>
> ++
> ++#include "../module.h"
> ++#include "pulse-module-compress-offload-forwarder.h"
> ++
> ++/** \page page_pulse_module_compress_offload_forwarder Compress Offload
> Forwarder
> ++ *
> ++ * ## Module Name
> ++ *
> ++ * `module-compress-offload-forwarder`
> ++ *
> ++ * ## Module Options
> ++ *
> ++ * @pulse_module_options@
> ++ */
> ++
> ++#define NAME "compress-offload-forwarder"
> ++
> ++#define DEFAULT_CODEC "auto"
> ++#define DEFAULT_RATE 48000u
> ++#define DEFAULT_CHANNELS 2u
> ++#define DEFAULT_BITRATE 128000u
> ++#define DEFAULT_BLOCK_SIZE (16u * 1024u)
> ++#define MAX_PENDING_SIZE (1024u * 1024u)
> ++
> ++static const char *const pulse_module_options =3D
> ++      "source_sink=3D<Pulse-visible compress sink node.name> "
> ++      "target_sink=3D<compressed-offload sink node.name> "
> ++      "codec=3D<codec name, default auto> "
> ++      "rate=3D<sample rate, default 48000> "
> ++      "channels=3D<number of channels, default 2> "
> ++      "bitrate=3D<bit rate, default 128000> "
> ++      "block_size=3D<buffer size in bytes, default 16384>";
> ++
> ++PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
> ++#define PW_LOG_TOPIC_DEFAULT mod_topic
> ++
> ++struct forwarder_data {
> ++      struct pw_core *core;
> ++      struct pw_loop *loop;
> ++      struct spa_source *activate_event;
> ++      struct spa_hook core_listener;
> ++      struct pw_registry *registry;
> ++      struct spa_hook registry_listener;
> ++      struct pw_node *client_node;
> ++      struct spa_hook client_node_listener;
> ++
> ++      struct pw_stream *capture;
> ++      struct spa_hook capture_listener;
> ++      struct pw_stream *playback;
> ++      struct spa_hook playback_listener;
> ++
> ++      char source_name[256];
> ++      char monitor_name[280];
> ++      char target_name[256];
> ++      char codec[32];
> ++      char aac_stream_format[16];
> ++      char aac_codec_data[256];
> ++      uint32_t rate;
> ++      uint32_t channels;
> ++      uint32_t bitrate;
> ++      uint32_t aac_audio_object_type;
> ++      uint32_t block_size;
> ++      uint32_t target_id;
> ++      uint32_t client_node_id;
> ++      uint8_t *pending_data;
> ++      uint32_t pending_size;
> ++      uint32_t pending_offset;
> ++      uint8_t capture_streaming:1;
> ++      uint8_t logged_first_buffer:1;
> ++      uint8_t logged_first_output_buffer:1;
> ++      uint8_t logged_silence_buffer:1;
> ++      uint8_t activate_pending:1;
> ++      uint8_t playback_active:1;
> ++      uint8_t playback_failed:1;
> ++      uint8_t metadata_error_logged:1;
> ++};
> ++
> ++static struct forwarder_data *active_forwarder;
> ++
> ++static void destroy_playback_stream(struct forwarder_data *d);
> ++
> ++static int create_playback_stream(struct forwarder_data *d);
> ++static void set_playback_active(struct forwarder_data *d, bool active);
> ++static void maybe_create_playback_stream(struct forwarder_data *d, cons=
t
> char *reason);
> ++
> ++static bool codec_is_auto(const char *codec)
> ++{
> ++      return codec =3D=3D NULL || codec[0] =3D=3D '\0' || spa_streq(cod=
ec,
> "auto");
> ++}
> ++
> ++static void reset_codec_state(struct forwarder_data *d)
> ++{
> ++      spa_scnprintf(d->codec, sizeof(d->codec), "%s", DEFAULT_CODEC);
> ++      d->aac_stream_format[0] =3D '\0';
> ++      d->aac_codec_data[0] =3D '\0';
> ++      d->aac_audio_object_type =3D 0;
> ++      d->rate =3D DEFAULT_RATE;
> ++      d->channels =3D DEFAULT_CHANNELS;
> ++      d->bitrate =3D DEFAULT_BITRATE;
> ++      d->logged_first_buffer =3D false;
> ++      d->logged_first_output_buffer =3D false;
> ++      d->logged_silence_buffer =3D false;
> ++      d->metadata_error_logged =3D false;
> ++}
> ++
> ++static void request_playback_activation(struct forwarder_data *d)
> ++{
> ++      if (d->activate_event =3D=3D NULL || d->activate_pending)
> ++              return;
> ++      d->activate_pending =3D true;
> ++      pw_loop_signal_event(d->loop, d->activate_event);
> ++}
> ++
> ++static void playback_activate_event(void *data, uint64_t count)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++
> ++      d->activate_pending =3D false;
> ++      maybe_create_playback_stream(d, "first-audio-buffer");
> ++}
> ++
> ++static bool buffer_is_zeroed(const void *data, uint32_t size)
> ++{
> ++      const uint8_t *bytes =3D data;
> ++      uint32_t index;
> ++
> ++      for (index =3D 0; index < size; index++) {
> ++              if (bytes[index] !=3D 0)
> ++                      return false;
> ++      }
> ++      return true;
> ++}
> ++
> ++static void clear_pending_data(struct forwarder_data *d)
> ++{
> ++      free(d->pending_data);
> ++      d->pending_data =3D NULL;
> ++      d->pending_size =3D 0;
> ++      d->pending_offset =3D 0;
> ++}
> ++
> ++static void compact_pending_data(struct forwarder_data *d)
> ++{
> ++      uint32_t remaining;
> ++
> ++      if (d->pending_offset =3D=3D 0)
> ++              return;
> ++      if (d->pending_offset >=3D d->pending_size) {
> ++              clear_pending_data(d);
> ++              return;
> ++      }
> ++      remaining =3D d->pending_size - d->pending_offset;
> ++      memmove(d->pending_data, d->pending_data + d->pending_offset,
> remaining);
> ++      d->pending_size =3D remaining;
> ++      d->pending_offset =3D 0;
> ++}
> ++
> ++static int append_pending_data(struct forwarder_data *d, const void
> *data, uint32_t size)
> ++{
> ++      uint8_t *pending_data;
> ++
> ++      if (size =3D=3D 0)
> ++              return 0;
> ++      compact_pending_data(d);
> ++      if (size > MAX_PENDING_SIZE || d->pending_size > MAX_PENDING_SIZE
> - size)
> ++              return -ENOSPC;
> ++      if (d->pending_size > UINT32_MAX - size)
> ++              return -EOVERFLOW;
> ++      pending_data =3D realloc(d->pending_data, d->pending_size + size)=
;
> ++      if (pending_data =3D=3D NULL)
> ++              return -errno;
> ++      d->pending_data =3D pending_data;
> ++      memcpy(d->pending_data + d->pending_size, data, size);
> ++      d->pending_size +=3D size;
> ++      return 0;
> ++}
> ++
> ++static bool codec_is_mp3(const char *codec)
> ++{
> ++      return codec !=3D NULL && spa_streq(codec, "mp3");
> ++}
> ++
> ++static bool codec_is_aac_adts(const char *codec)
> ++{
> ++      return codec !=3D NULL && spa_streq(codec, "aac_adts");
> ++}
> ++
> ++static bool codec_is_aac_raw(const char *codec)
> ++{
> ++      return codec !=3D NULL && spa_streq(codec, "aac");
> ++}
> ++
> ++static bool codec_is_aac(const char *codec)
> ++{
> ++      return codec_is_aac_adts(codec) || codec_is_aac_raw(codec);
> ++}
> ++
> ++static bool raw_aac_transport_header(const uint8_t *data, uint32_t size=
,
> ++              uint32_t *frame_size)
> ++{
> ++      if (size < COMPRESS_RAW_AAC_HEADER_SIZE ||
> ++          data[0] !=3D COMPRESS_RAW_AAC_MAGIC_0 ||
> ++          data[1] !=3D COMPRESS_RAW_AAC_MAGIC_1 ||
> ++          data[2] !=3D COMPRESS_RAW_AAC_MAGIC_2 ||
> ++          data[3] !=3D COMPRESS_RAW_AAC_MAGIC_3)
> ++              return false;
> ++      *frame_size =3D (uint32_t)data[4] |
> ++                      ((uint32_t)data[5] << 8) |
> ++                      ((uint32_t)data[6] << 16) |
> ++                      ((uint32_t)data[7] << 24);
> ++      return *frame_size > 0 && *frame_size <=3D MAX_PENDING_SIZE;
> ++}
> ++
> ++static bool payload_is_aac_adts(const uint8_t *bytes, uint32_t size)
> ++{
> ++      return size >=3D 2 &&
> ++              bytes[0] =3D=3D 0xff &&
> ++              (bytes[1] & 0xf6) =3D=3D 0xf0;
> ++}
> ++
> ++static bool parse_aac_adts_header(const uint8_t *bytes, uint32_t size,
> ++              uint32_t *rate, uint32_t *channels, uint32_t *profile)
> ++{
> ++      static const uint32_t sample_rates[] =3D {
> ++              96000, 88200, 64000, 48000, 44100, 32000,
> ++              24000, 22050, 16000, 12000, 11025, 8000,
> ++              7350,
> ++      };
> ++      uint32_t sampling_index, parsed_channels, parsed_profile;
> ++
> ++      if (size < 7 || !payload_is_aac_adts(bytes, size))
> ++              return false;
> ++
> ++      parsed_profile =3D ((bytes[2] & 0xc0) >> 6) + 1;
> ++      sampling_index =3D (bytes[2] & 0x3c) >> 2;
> ++      parsed_channels =3D ((bytes[2] & 0x01) << 2) | ((bytes[3] & 0xc0)=
 >>
> 6);
> ++
> ++      if (sampling_index >=3D SPA_N_ELEMENTS(sample_rates) ||
> parsed_channels =3D=3D 0 || parsed_channels > 8)
> ++              return false;
> ++
> ++      if (rate !=3D NULL)
> ++              *rate =3D sample_rates[sampling_index];
> ++      if (channels !=3D NULL)
> ++              *channels =3D parsed_channels;
> ++      if (profile !=3D NULL)
> ++              *profile =3D parsed_profile;
> ++      return true;
> ++}
> ++
> ++static bool payload_is_mp3(const uint8_t *bytes, uint32_t size)
> ++{
> ++      return (size >=3D 3 && bytes[0] =3D=3D 'I' && bytes[1] =3D=3D 'D'=
 &&
> bytes[2] =3D=3D '3') ||
> ++              (size >=3D 2 &&
> ++               bytes[0] =3D=3D 0xff &&
> ++               (bytes[1] & 0xe0) =3D=3D 0xe0 &&
> ++               (bytes[1] & 0x06) !=3D 0x00);
> ++}
> ++
> ++static bool detect_payload_codec(struct forwarder_data *d, const void
> *data, uint32_t size)
> ++{
> ++      const uint8_t *bytes =3D data;
> ++      uint32_t rate, channels, profile;
> ++
> ++      if (payload_is_aac_adts(bytes, size)) {
> ++              if (!parse_aac_adts_header(bytes, size, &rate, &channels,
> &profile)) {
> ++                      pw_log_warn("compress-forwarder rejected invalid
> AAC ADTS header=3D%02x %02x %02x %02x size=3D%u",
> ++                                      size > 0 ? bytes[0] : 0, size > 1
> ? bytes[1] : 0,
> ++                                      size > 2 ? bytes[2] : 0, size > 3
> ? bytes[3] : 0, size);
> ++                      return false;
> ++              }
> ++              if (!codec_is_aac_adts(d->codec)) {
> ++                      spa_scnprintf(d->codec, sizeof(d->codec),
> "aac_adts");
> ++              }
> ++              d->rate =3D rate;
> ++              d->channels =3D channels;
> ++              d->aac_audio_object_type =3D profile;
> ++              pw_log_debug("compress-forwarder detected AAC ADTS payloa=
d
> header=3D%02x %02x rate=3D%u channels=3D%u object_type=3D%u",
> ++                              bytes[0], bytes[1], d->rate, d->channels,
> d->aac_audio_object_type);
> ++              return true;
> ++      }
> ++      if (payload_is_mp3(bytes, size)) {
> ++              if (!codec_is_mp3(d->codec)) {
> ++                      spa_scnprintf(d->codec, sizeof(d->codec), "mp3");
> ++                      pw_log_debug("compress-forwarder detected MP3
> payload header=3D%02x %02x %02x",
> ++                                      size > 0 ? bytes[0] : 0, size > 1
> ? bytes[1] : 0, size > 2 ? bytes[2] : 0);
> ++              }
> ++              return true;
> ++      }
> ++      return codec_is_aac_raw(d->codec);
> ++}
> ++
> ++static bool update_codec_from_props(struct forwarder_data *d, const
> struct spa_dict *props)
> ++{
> ++      const char *codec, *str;
> ++      char old_codec[sizeof(d->codec)];
> ++      char old_aac_stream_format[sizeof(d->aac_stream_format)];
> ++      char old_aac_codec_data[sizeof(d->aac_codec_data)];
> ++      uint32_t old_rate, old_channels, old_bitrate,
> old_aac_audio_object_type;
> ++      bool changed;
> ++
> ++      codec =3D spa_dict_lookup(props, "codec.type");
> ++      if (codec =3D=3D NULL || (!codec_is_mp3(codec) &&
> !codec_is_aac(codec)))
> ++              return false;
> ++
> ++      spa_scnprintf(old_codec, sizeof(old_codec), "%s", d->codec);
> ++      spa_scnprintf(old_aac_stream_format,
> sizeof(old_aac_stream_format), "%s", d->aac_stream_format);
> ++      spa_scnprintf(old_aac_codec_data, sizeof(old_aac_codec_data),
> "%s", d->aac_codec_data);
> ++      old_rate =3D d->rate;
> ++      old_channels =3D d->channels;
> ++      old_bitrate =3D d->bitrate;
> ++      old_aac_audio_object_type =3D d->aac_audio_object_type;
> ++
> ++      spa_scnprintf(d->codec, sizeof(d->codec), "%s", codec);
> ++      if ((str =3D spa_dict_lookup(props, "codec.sample_rate")) !=3D NU=
LL)
> ++              d->rate =3D (uint32_t)atoi(str);
> ++      if ((str =3D spa_dict_lookup(props, "codec.channels")) !=3D NULL)
> ++              d->channels =3D (uint32_t)atoi(str);
> ++      if ((str =3D spa_dict_lookup(props, "codec.bit_rate")) !=3D NULL)
> ++              d->bitrate =3D (uint32_t)atoi(str);
> ++      if ((str =3D spa_dict_lookup(props, "codec.aac.stream_format")) !=
=3D
> NULL)
> ++              spa_scnprintf(d->aac_stream_format,
> sizeof(d->aac_stream_format), "%s", str);
> ++      if ((str =3D spa_dict_lookup(props, "codec.aac.codec_data")) !=3D=
 NULL)
> ++              spa_scnprintf(d->aac_codec_data,
> sizeof(d->aac_codec_data), "%s", str);
> ++      if ((str =3D spa_dict_lookup(props, "codec.aac.audio_object_type"=
))
> !=3D NULL)
> ++              d->aac_audio_object_type =3D (uint32_t)atoi(str);
> ++      if (codec_is_aac_adts(d->codec) && d->aac_stream_format[0] =3D=3D=
 '\0')
> ++              spa_scnprintf(d->aac_stream_format,
> sizeof(d->aac_stream_format), "adts");
> ++      if (codec_is_aac_raw(d->codec) && d->aac_stream_format[0] =3D=3D =
'\0')
> ++              spa_scnprintf(d->aac_stream_format,
> sizeof(d->aac_stream_format), "raw");
> ++      pw_log_debug("compress-forwarder stream codec update codec=3D%s
> rate=3D%u channels=3D%u bitrate=3D%u stream_format=3D%s object_type=3D%u"=
,
> ++                      d->codec, d->rate, d->channels, d->bitrate,
> ++                      d->aac_stream_format[0] !=3D '\0' ?
> d->aac_stream_format : "none",
> ++                      d->aac_audio_object_type);
> ++
> ++      changed =3D !spa_streq(old_codec, d->codec) ||
> ++                      old_rate !=3D d->rate ||
> ++                      old_channels !=3D d->channels ||
> ++                      old_bitrate !=3D d->bitrate ||
> ++                      !spa_streq(old_aac_stream_format,
> d->aac_stream_format) ||
> ++                      !spa_streq(old_aac_codec_data, d->aac_codec_data)
> ||
> ++                      old_aac_audio_object_type !=3D
> d->aac_audio_object_type;
> ++      return changed;
> ++}
> ++
> ++void compress_offload_forwarder_update(const char *source_name,
> ++              const struct spa_dict *props)
> ++{
> ++      struct forwarder_data *d =3D active_forwarder;
> ++
> ++      if (d =3D=3D NULL || props =3D=3D NULL || !spa_streq(source_name,
> d->source_name))
> ++              return;
> ++      if (!update_codec_from_props(d, props))
> ++              return;
> ++
> ++      pw_log_debug("compress-forwarder direct stream codec update
> codec=3D%s rate=3D%u channels=3D%u object_type=3D%u",
> ++                      d->codec, d->rate, d->channels,
> d->aac_audio_object_type);
> ++      if (d->playback !=3D NULL)
> ++              destroy_playback_stream(d);
> ++      if (d->capture_streaming && d->pending_size > d->pending_offset)
> ++              request_playback_activation(d);
> ++}
> ++
> ++void compress_offload_forwarder_teardown(const char *source_name)
> ++{
> ++      struct forwarder_data *d =3D active_forwarder;
> ++
> ++      if (d =3D=3D NULL || source_name =3D=3D NULL ||
> ++          !spa_streq(source_name, d->source_name))
> ++              return;
> ++
> ++      pw_log_debug("compress-forwarder source:%s playback stream ended,
> destroying target stream",
> ++                      d->source_name);
> ++      destroy_playback_stream(d);
> ++      clear_pending_data(d);
> ++}
> ++
> ++static void maybe_create_playback_stream(struct forwarder_data *d, cons=
t
> char *reason)
> ++{
> ++      int res;
> ++
> ++      if (!d->capture_streaming)
> ++              return;
> ++      if (d->playback !=3D NULL) {
> ++              set_playback_active(d, true);
> ++              return;
> ++      }
> ++      if (d->target_id =3D=3D PW_ID_ANY) {
> ++              pw_log_debug("compress-forwarder target:%s not resolved
> yet, defer output create (%s)",
> ++                              d->target_name, reason);
> ++              return;
> ++      }
> ++      res =3D create_playback_stream(d);
> ++      if (res < 0)
> ++              pw_log_error("compress-forwarder target:%s create failed
> (%s): %s",
> ++                              d->target_name, reason, spa_strerror(res)=
);
> ++      else
> ++              set_playback_active(d, true);
> ++}
> ++
> ++static void destroy_playback_stream(struct forwarder_data *d)
> ++{
> ++      clear_pending_data(d);
> ++      if (d->playback =3D=3D NULL)
> ++              return;
> ++      spa_hook_remove(&d->playback_listener);
> ++      pw_stream_destroy(d->playback);
> ++      d->playback =3D NULL;
> ++      d->playback_active =3D false;
> ++      d->playback_failed =3D false;
> ++}
> ++
> ++static const struct spa_pod *build_raw_format(struct forwarder_data *d,
> ++              struct spa_pod_builder *builder, uint32_t id)
> ++{
> ++      struct spa_audio_info_raw info;
> ++
> ++      spa_zero(info);
> ++      info.format =3D SPA_AUDIO_FORMAT_S16_LE;
> ++      info.rate =3D d->rate;
> ++      info.channels =3D d->channels;
> ++      if (info.channels =3D=3D 1) {
> ++              info.position[0] =3D SPA_AUDIO_CHANNEL_MONO;
> ++      } else {
> ++              info.channels =3D 2;
> ++              info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> ++              info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> ++      }
> ++      return spa_format_audio_raw_build(builder, id, &info);
> ++}
> ++
> ++static const struct spa_pod *build_encoded_format(struct forwarder_data
> *d,
> ++              struct spa_pod_builder *builder, uint32_t id)
> ++{
> ++      struct spa_audio_info info;
> ++
> ++      spa_zero(info);
> ++      info.media_type =3D SPA_MEDIA_TYPE_audio;
> ++      if (codec_is_aac_adts(d->codec)) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> ++              info.info.aac.rate =3D d->rate;
> ++              info.info.aac.channels =3D d->channels;
> ++              info.info.aac.bitrate =3D d->bitrate;
> ++              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;
> ++              info.info.aac.audio_object_type =3D d->aac_audio_object_t=
ype;
> ++      } else if (codec_is_aac_raw(d->codec)) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> ++              info.info.aac.rate =3D d->rate;
> ++              info.info.aac.channels =3D d->channels;
> ++              info.info.aac.bitrate =3D d->bitrate;
> ++              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_RAW;
> ++              info.info.aac.audio_object_type =3D d->aac_audio_object_t=
ype;
> ++      } else {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;
> ++              info.info.mp3.rate =3D d->rate;
> ++              info.info.mp3.channels =3D d->channels;
> ++              info.info.mp3.channel_mode =3D d->channels =3D=3D 1 ?
> ++                      SPA_AUDIO_MP3_CHANNEL_MODE_MONO :
> SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
> ++      }
> ++
> ++      return spa_format_audio_build(builder, id, &info);
> ++}
> ++
> ++static void playback_state_changed(void *data, enum pw_stream_state old=
,
> ++              enum pw_stream_state state, const char *error)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++
> ++      pw_log_debug("compress-forwarder target:%s state %d -> %d%s%s",
> ++                      d->target_name, old, state, error ? ": " : "",
> error ? error : "");
> ++      if (state =3D=3D PW_STREAM_STATE_ERROR)
> ++              d->playback_failed =3D true;
> ++}
> ++
> ++static void set_playback_active(struct forwarder_data *d, bool active)
> ++{
> ++      if (d->playback =3D=3D NULL || d->playback_active =3D=3D active)
> ++              return;
> ++      pw_log_debug("compress-forwarder target:%s active=3D%d",
> d->target_name, active);
> ++      pw_stream_set_active(d->playback, active);
> ++      d->playback_active =3D active;
> ++}
> ++
> ++static void capture_state_changed(void *data, enum pw_stream_state old,
> ++              enum pw_stream_state state, const char *error)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++
> ++      pw_log_debug("compress-forwarder source:%s state %d -> %d%s%s",
> ++                      d->monitor_name, old, state, error ? ": " : "",
> error ? error : "");
> ++      if (d->playback_failed)
> ++              destroy_playback_stream(d);
> ++      d->capture_streaming =3D state =3D=3D PW_STREAM_STATE_STREAMING;
> ++      if (state =3D=3D PW_STREAM_STATE_PAUSED || state =3D=3D
> PW_STREAM_STATE_ERROR ||
> ++          state =3D=3D PW_STREAM_STATE_UNCONNECTED) {
> ++              if (d->playback !=3D NULL) {
> ++                      pw_log_debug("compress-forwarder source:%s
> stopped, destroying target stream",
> ++                                      d->monitor_name);
> ++                      destroy_playback_stream(d);
> ++              }
> ++              clear_pending_data(d);
> ++      }
> ++}
> ++
> ++static void capture_process(void *data)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++      struct pw_buffer *in_buf, *out_buf;
> ++      struct spa_data *in_data, *out_data;
> ++      uint32_t in_offset, in_size, out_size, copy_size;
> ++      uint32_t raw_frame_size =3D 0;
> ++      const void *input_data;
> ++      const void *copy_data;
> ++      uint32_t copy_available;
> ++      bool framed_raw_aac =3D false;
> ++      int res;
> ++
> ++      in_buf =3D pw_stream_dequeue_buffer(d->capture);
> ++      if (in_buf =3D=3D NULL)
> ++              return;
> ++
> ++      in_data =3D &in_buf->buffer->datas[0];
> ++      if (in_data->data =3D=3D NULL || in_data->chunk =3D=3D NULL) {
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++      in_offset =3D SPA_MIN(in_data->chunk->offset, in_data->maxsize);
> ++      in_size =3D SPA_MIN(in_data->chunk->size, in_data->maxsize -
> in_offset);
> ++      input_data =3D SPA_PTROFF(in_data->data, in_offset, void);
> ++      if (in_size =3D=3D 0) {
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++      if (buffer_is_zeroed(input_data, in_size)) {
> ++              if (!d->logged_silence_buffer) {
> ++                      pw_log_debug("compress-forwarder source:%s
> ignoring zeroed startup buffer size=3D%u flags=3D0x%x",
> ++                                      d->monitor_name, in_size,
> in_data->chunk->flags);
> ++                      d->logged_silence_buffer =3D true;
> ++              }
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++      if (!d->logged_first_buffer) {
> ++              const uint8_t *bytes =3D SPA_PTROFF(in_data->data,
> in_offset, const uint8_t);
> ++              pw_log_debug("compress-forwarder source:%s first
> non-silence buffer size=3D%u offset=3D%u flags=3D0x%x",
> ++                              d->monitor_name, in_size, in_offset,
> in_data->chunk->flags);
> ++              pw_log_debug("compress-forwarder source:%s first
> non-silence bytes=3D%02x %02x %02x %02x %02x %02x %02x %02x",
> ++                              d->monitor_name,
> ++                              in_size > 0 ? bytes[0] : 0,
> ++                              in_size > 1 ? bytes[1] : 0,
> ++                              in_size > 2 ? bytes[2] : 0,
> ++                              in_size > 3 ? bytes[3] : 0,
> ++                              in_size > 4 ? bytes[4] : 0,
> ++                              in_size > 5 ? bytes[5] : 0,
> ++                              in_size > 6 ? bytes[6] : 0,
> ++                              in_size > 7 ? bytes[7] : 0);
> ++              d->logged_first_buffer =3D true;
> ++      }
> ++      if (d->playback_failed)
> ++              destroy_playback_stream(d);
> ++
> ++      res =3D append_pending_data(d, input_data, in_size);
> ++      if (res < 0) {
> ++              pw_log_error("compress-forwarder source:%s failed to
> preserve input before target write: %s",
> ++                              d->monitor_name, spa_strerror(res));
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++      {
> ++              const uint8_t *pending =3D d->pending_data +
> d->pending_offset;
> ++              uint32_t available =3D d->pending_size - d->pending_offse=
t;
> ++
> ++              if (available >=3D COMPRESS_RAW_AAC_HEADER_SIZE &&
> ++                  raw_aac_transport_header(pending, available,
> &raw_frame_size)) {
> ++                      if (available < COMPRESS_RAW_AAC_HEADER_SIZE +
> raw_frame_size) {
> ++                              pw_stream_queue_buffer(d->capture, in_buf=
);
> ++                              return;
> ++                      }
> ++                      framed_raw_aac =3D true;
> ++                      input_data =3D pending +
> COMPRESS_RAW_AAC_HEADER_SIZE;
> ++                      in_size =3D raw_frame_size;
> ++              }
> ++      }
> ++      if (d->playback =3D=3D NULL && !detect_payload_codec(d, input_dat=
a,
> in_size)) {
> ++              if (codec_is_auto(d->codec)) {
> ++                      pw_log_debug("compress-forwarder source:%s waitin=
g
> for codec metadata, preserved=3D%u",
> ++                                      d->monitor_name, d->pending_size =
-
> d->pending_offset);
> ++                      pw_stream_queue_buffer(d->capture, in_buf);
> ++                      return;
> ++              }
> ++              pw_log_error("compress-forwarder source:%s unsupported
> payload header for codec=3D%s",
> ++                              d->monitor_name, d->codec);
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++      if (d->playback =3D=3D NULL) {
> ++              request_playback_activation(d);
> ++              if (d->playback =3D=3D NULL) {
> ++                      pw_log_debug("compress-forwarder source:%s
> preserved %u bytes pending target create total=3D%u",
> ++                                      d->monitor_name, in_size,
> d->pending_size - d->pending_offset);
> ++                      pw_stream_queue_buffer(d->capture, in_buf);
> ++                      return;
> ++              }
> ++      }
> ++      if (!d->playback_active)
> ++              set_playback_active(d, true);
> ++      if (d->playback_failed || !d->playback_active) {
> ++              pw_log_debug("compress-forwarder source:%s preserved %u
> bytes pending inactive target total=3D%u",
> ++                              d->monitor_name, in_size, d->pending_size
> - d->pending_offset);
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++
> ++      out_buf =3D pw_stream_dequeue_buffer(d->playback);
> ++      if (out_buf =3D=3D NULL) {
> ++              pw_log_debug("compress-forwarder source:%s preserved %u
> bytes pending output buffer total=3D%u",
> ++                              d->monitor_name, in_size, d->pending_size
> - d->pending_offset);
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++
> ++      out_data =3D &out_buf->buffer->datas[0];
> ++      if (out_data->data =3D=3D NULL || out_data->chunk =3D=3D NULL) {
> ++              pw_stream_queue_buffer(d->playback, out_buf);
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++
> ++      out_size =3D out_data->maxsize;
> ++      if (out_size =3D=3D 0) {
> ++              pw_stream_queue_buffer(d->playback, out_buf);
> ++              pw_stream_queue_buffer(d->capture, in_buf);
> ++              return;
> ++      }
> ++      copy_data =3D d->pending_data + d->pending_offset;
> ++      copy_available =3D d->pending_size - d->pending_offset;
> ++      if (framed_raw_aac) {
> ++              if (raw_frame_size > out_size) {
> ++                      pw_log_error("compress-forwarder raw AAC access
> unit too large size=3D%u output=3D%u",
> ++                                      raw_frame_size, out_size);
> ++                      pw_stream_queue_buffer(d->playback, out_buf);
> ++                      pw_stream_queue_buffer(d->capture, in_buf);
> ++                      return;
> ++              }
> ++              copy_data =3D SPA_PTROFF(copy_data,
> COMPRESS_RAW_AAC_HEADER_SIZE, const void);
> ++              copy_size =3D raw_frame_size;
> ++      } else {
> ++              copy_size =3D SPA_MIN(copy_available, out_size);
> ++      }
> ++      memcpy(out_data->data, copy_data, copy_size);
> ++      d->pending_offset +=3D copy_size +
> ++                      (framed_raw_aac ? COMPRESS_RAW_AAC_HEADER_SIZE :
> 0);
> ++      if (d->pending_offset >=3D d->pending_size)
> ++              clear_pending_data(d);
> ++
> ++      out_data->chunk->offset =3D 0;
> ++      out_data->chunk->size =3D copy_size;
> ++      out_data->chunk->stride =3D 1;
> ++      out_buf->size =3D copy_size;
> ++
> ++      if (!d->logged_first_output_buffer) {
> ++              const uint8_t *out_bytes =3D out_data->data;
> ++              pw_log_debug("compress-forwarder target:%s queue buffer
> copy_size=3D%u out_max=3D%u chunk=3D%u/%u/%d bytes=3D%02x %02x %02x %02x =
%02x %02x
> %02x %02x",
> ++                              d->target_name, copy_size,
> out_data->maxsize,
> ++                              out_data->chunk->offset,
> out_data->chunk->size,
> ++                              out_data->chunk->stride,
> ++                              copy_size > 0 ? out_bytes[0] : 0,
> ++                              copy_size > 1 ? out_bytes[1] : 0,
> ++                              copy_size > 2 ? out_bytes[2] : 0,
> ++                              copy_size > 3 ? out_bytes[3] : 0,
> ++                              copy_size > 4 ? out_bytes[4] : 0,
> ++                              copy_size > 5 ? out_bytes[5] : 0,
> ++                              copy_size > 6 ? out_bytes[6] : 0,
> ++                              copy_size > 7 ? out_bytes[7] : 0);
> ++              d->logged_first_output_buffer =3D true;
> ++      }
> ++
> ++      pw_stream_queue_buffer(d->playback, out_buf);
> ++      pw_stream_queue_buffer(d->capture, in_buf);
> ++}
> ++
> ++static const struct pw_stream_events capture_events =3D {
> ++      PW_VERSION_STREAM_EVENTS,
> ++      .state_changed =3D capture_state_changed,
> ++      .process =3D capture_process,
> ++};
> ++
> ++static const struct pw_stream_events playback_events =3D {
> ++      PW_VERSION_STREAM_EVENTS,
> ++      .state_changed =3D playback_state_changed,
> ++};
> ++
> ++static void clear_client_node(struct forwarder_data *d)
> ++{
> ++      if (d->client_node =3D=3D NULL)
> ++              return;
> ++      spa_hook_remove(&d->client_node_listener);
> ++      pw_proxy_destroy((struct pw_proxy *)d->client_node);
> ++      d->client_node =3D NULL;
> ++      d->client_node_id =3D PW_ID_ANY;
> ++}
> ++
> ++static void client_node_info(void *data, const struct pw_node_info *inf=
o)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++
> ++      if (info->props =3D=3D NULL || !update_codec_from_props(d,
> info->props))
> ++              return;
> ++      if (d->playback !=3D NULL) {
> ++              pw_log_info("compress-forwarder final stream codec
> changed, recreating target codec=3D%s rate=3D%u channels=3D%u",
> ++                              d->codec, d->rate, d->channels);
> ++              destroy_playback_stream(d);
> ++      }
> ++      if (d->capture_streaming && d->pending_size > d->pending_offset)
> ++              request_playback_activation(d);
> ++}
> ++
> ++static const struct pw_node_events client_node_events =3D {
> ++      PW_VERSION_NODE_EVENTS,
> ++      .info =3D client_node_info,
> ++};
> ++
> ++static void registry_global(void *data, uint32_t id, uint32_t
> permissions,
> ++              const char *type, uint32_t version, const struct spa_dict
> *props)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++      const char *name, *target, *media_class, *forwarder_source;
> ++
> ++      if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || props =3D=3D NULL=
)
> ++              return;
> ++      name =3D spa_dict_lookup(props, PW_KEY_NODE_NAME);
> ++      if (spa_streq(name, d->target_name)) {
> ++              d->target_id =3D id;
> ++              pw_log_debug("compress-forwarder target:%s resolved
> id=3D%u", d->target_name, id);
> ++              return;
> ++      }
> ++
> ++      media_class =3D spa_dict_lookup(props, PW_KEY_MEDIA_CLASS);
> ++      target =3D spa_dict_lookup(props, PW_KEY_TARGET_OBJECT);
> ++      forwarder_source =3D spa_dict_lookup(props,
> "compress.forwarder.source");
> ++      if (spa_streq(media_class, "Stream/Output/Audio") &&
> ++          !spa_streq(name, "compress-offload-forwarder-output") &&
> ++          (spa_streq(forwarder_source, d->source_name) ||
> ++           spa_streq(target, d->source_name) || spa_streq(target,
> d->monitor_name))) {
> ++              if (d->client_node !=3D NULL && d->client_node_id !=3D id=
) {
> ++                      destroy_playback_stream(d);
> ++                      clear_pending_data(d);
> ++              }
> ++              clear_client_node(d);
> ++              reset_codec_state(d);
> ++              update_codec_from_props(d, props);
> ++              d->client_node =3D pw_registry_bind(d->registry, id, type=
,
> ++                              version < (uint32_t)PW_VERSION_NODE ?
> version : PW_VERSION_NODE, 0);
> ++              if (d->client_node =3D=3D NULL) {
> ++                      pw_log_error("compress-forwarder failed to bind
> client stream node id=3D%u", id);
> ++                      return;
> ++              }
> ++              d->client_node_id =3D id;
> ++              pw_node_add_listener(d->client_node,
> &d->client_node_listener,
> ++                              &client_node_events, d);
> ++              pw_log_debug("compress-forwarder tracking client stream
> node id=3D%u", id);
> ++      }
> ++}
> ++
> ++static void registry_global_remove(void *data, uint32_t id)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++
> ++      if (id =3D=3D d->client_node_id) {
> ++              pw_log_debug("compress-forwarder client stream removed
> id=3D%u", id);
> ++              clear_client_node(d);
> ++              destroy_playback_stream(d);
> ++              clear_pending_data(d);
> ++              reset_codec_state(d);
> ++      }
> ++      if (id =3D=3D d->target_id) {
> ++              pw_log_debug("compress-forwarder target:%s removed id=3D%=
u",
> d->target_name, id);
> ++              d->target_id =3D PW_ID_ANY;
> ++              destroy_playback_stream(d);
> ++      }
> ++}
> ++
> ++static const struct pw_registry_events registry_events =3D {
> ++      PW_VERSION_REGISTRY_EVENTS,
> ++      .global =3D registry_global,
> ++      .global_remove =3D registry_global_remove,
> ++};
> ++
> ++static int create_playback_stream(struct forwarder_data *d)
> ++{
> ++      struct pw_properties *props;
> ++      const struct spa_pod *params[2];
> ++      uint8_t buffer[1024];
> ++      struct spa_pod_builder builder;
> ++      uint32_t n_params =3D 0;
> ++      int res;
> ++
> ++      if (codec_is_auto(d->codec))
> ++              return -EAGAIN;
> ++      if (codec_is_aac_raw(d->codec) && d->aac_audio_object_type =3D=3D=
 0) {
> ++              pw_log_error("compress-forwarder raw AAC missing audio
> object type");
> ++              return -EINVAL;
> ++      }
> ++
> ++      props =3D pw_properties_new(PW_KEY_MEDIA_CLASS,
> "Stream/Output/Audio",
> ++                      PW_KEY_NODE_NAME,
> "compress-offload-forwarder-output",
> ++                      PW_KEY_MEDIA_TYPE, "Audio",
> ++                      PW_KEY_MEDIA_CATEGORY, "Playback",
> ++                      PW_KEY_MEDIA_ROLE, "Music",
> ++                      PW_KEY_TARGET_OBJECT, d->target_name,
> ++                      PW_KEY_NODE_AUTOCONNECT, "true",
> ++                      PW_KEY_STREAM_DONT_REMIX, "true",
> ++                      "node.dont-reconnect", "true",
> ++                      "compress.offload", "true",
> ++                      "codec.type", d->codec,
> ++                      NULL);
> ++      if (props =3D=3D NULL)
> ++              return -errno;
> ++      pw_properties_setf(props, "codec.sample_rate", "%u", d->rate);
> ++      pw_properties_setf(props, "codec.channels", "%u", d->channels);
> ++      pw_properties_setf(props, "codec.bit_rate", "%u", d->bitrate);
> ++      if (codec_is_aac(d->codec)) {
> ++              pw_properties_set(props, "codec.aac.stream_format",
> ++                              d->aac_stream_format[0] !=3D '\0' ?
> d->aac_stream_format :
> ++                              (codec_is_aac_adts(d->codec) ? "adts" :
> "raw"));
> ++              pw_properties_setf(props, "codec.aac.audio_object_type",
> "%u",
> ++                              d->aac_audio_object_type !=3D 0 ?
> d->aac_audio_object_type :
> ++                              (codec_is_aac_adts(d->codec) ? 2 : 0));
> ++              if (d->aac_codec_data[0] !=3D '\0')
> ++                      pw_properties_set(props, "codec.aac.codec_data",
> d->aac_codec_data);
> ++      }
> ++      pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
> ++
> ++      d->playback =3D pw_stream_new(d->core, "compress offload forwarde=
r
> output", props);
> ++      if (d->playback =3D=3D NULL)
> ++              return -errno;
> ++      pw_stream_add_listener(d->playback, &d->playback_listener,
> &playback_events, d);
> ++
> ++      spa_pod_builder_init(&builder, buffer, sizeof(buffer));
> ++      params[n_params++] =3D build_encoded_format(d, &builder,
> SPA_PARAM_EnumFormat);
> ++      pw_log_info("compress-forwarder target:%s connect target-id=3D%u
> codec=3D%s rate=3D%u channels=3D%u bitrate=3D%u",
> ++                      d->target_name, d->target_id, d->codec, d->rate,
> d->channels, d->bitrate);
> ++      res =3D pw_stream_connect(d->playback, PW_DIRECTION_OUTPUT,
> d->target_id,
> ++                      PW_STREAM_FLAG_AUTOCONNECT |
> ++                      PW_STREAM_FLAG_NO_CONVERT |
> ++                      PW_STREAM_FLAG_MAP_BUFFERS |
> ++                      PW_STREAM_FLAG_RT_PROCESS,
> ++                      params, n_params);
> ++      if (res < 0) {
> ++              destroy_playback_stream(d);
> ++              return res;
> ++      }
> ++      pw_stream_set_active(d->playback, false);
> ++      d->playback_active =3D false;
> ++      d->playback_failed =3D false;
> ++      return 0;
> ++}
> ++
> ++static int create_capture_stream(struct forwarder_data *d)
> ++{
> ++      struct pw_properties *props;
> ++      const struct spa_pod *params[2];
> ++      uint8_t buffer[1024];
> ++      struct spa_pod_builder builder;
> ++      uint32_t n_params =3D 0;
> ++      int res;
> ++
> ++      props =3D pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Input/Aud=
io",
> ++                      PW_KEY_NODE_NAME,
> "compress-offload-forwarder-capture",
> ++                      PW_KEY_TARGET_OBJECT, d->source_name,
> ++                      PW_KEY_NODE_AUTOCONNECT, "true",
> ++                      PW_KEY_STREAM_CAPTURE_SINK, "true",
> ++                      PW_KEY_STREAM_DONT_REMIX, "true",
> ++                      "node.dont-reconnect", "true",
> ++                      NULL);
> ++      if (props =3D=3D NULL)
> ++              return -errno;
> ++      pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
> ++
> ++      d->capture =3D pw_stream_new(d->core, "compress offload forwarder
> capture", props);
> ++      if (d->capture =3D=3D NULL)
> ++              return -errno;
> ++      pw_stream_add_listener(d->capture, &d->capture_listener,
> &capture_events, d);
> ++
> ++      spa_pod_builder_init(&builder, buffer, sizeof(buffer));
> ++      params[n_params++] =3D build_raw_format(d, &builder,
> SPA_PARAM_EnumFormat);
> ++      res =3D pw_stream_connect(d->capture, PW_DIRECTION_INPUT, PW_ID_A=
NY,
> ++                      PW_STREAM_FLAG_AUTOCONNECT |
> ++                      PW_STREAM_FLAG_MAP_BUFFERS |
> ++                      PW_STREAM_FLAG_RT_PROCESS,
> ++                      params, n_params);
> ++      if (res < 0)
> ++              return res;
> ++      pw_stream_set_active(d->capture, true);
> ++      return 0;
> ++}
> ++
> ++static void core_error(void *data, uint32_t id, int seq, int res, const
> char *message)
> ++{
> ++      struct module *module =3D data;
> ++
> ++      pw_log_error("compress-forwarder error id:%u seq:%d res:%d (%s):
> %s",
> ++                      id, seq, res, spa_strerror(res), message);
> ++      if (id =3D=3D PW_ID_CORE && res =3D=3D -EPIPE)
> ++              module_schedule_unload(module);
> ++}
> ++
> ++static const struct pw_core_events core_events =3D {
> ++      PW_VERSION_CORE_EVENTS,
> ++      .error =3D core_error,
> ++};
> ++
> ++static int module_compress_offload_forwarder_load(struct module *module=
)
> ++{
> ++      struct forwarder_data *d =3D module->user_data;
> ++      int res;
> ++
> ++      PW_LOG_TOPIC_INIT(mod_topic);
> ++      d->loop =3D pw_context_get_main_loop(module->impl->context);
> ++      if (d->loop =3D=3D NULL)
> ++              return -EINVAL;
> ++      d->activate_event =3D pw_loop_add_event(d->loop,
> playback_activate_event, d);
> ++      if (d->activate_event =3D=3D NULL)
> ++              return -errno;
> ++      d->core =3D pw_context_connect(module->impl->context, NULL, 0);
> ++      if (d->core =3D=3D NULL)
> ++              return -errno;
> ++      pw_core_add_listener(d->core, &d->core_listener, &core_events,
> module);
> ++      d->target_id =3D PW_ID_ANY;
> ++      d->registry =3D pw_core_get_registry(d->core, PW_VERSION_REGISTRY=
,
> 0);
> ++      if (d->registry =3D=3D NULL)
> ++              return -errno;
> ++      pw_registry_add_listener(d->registry, &d->registry_listener,
> &registry_events, d);
> ++
> ++      res =3D create_capture_stream(d);
> ++      if (res < 0)
> ++              return res;
> ++      active_forwarder =3D d;
> ++
> ++      pw_log_info("compress-forwarder loaded: source=3D%s monitor=3D%s
> target=3D%s codec=3D%s rate=3D%u channels=3D%u",
> ++                      d->source_name, d->monitor_name, d->target_name,
> ++                      d->codec, d->rate, d->channels);
> ++      module_emit_loaded(module, 0);
> ++      return 0;
> ++}
> ++
> ++static int module_compress_offload_forwarder_unload(struct module
> *module)
> ++{
> ++      struct forwarder_data *d =3D module->user_data;
> ++
> ++      if (active_forwarder =3D=3D d)
> ++              active_forwarder =3D NULL;
> ++
> ++      if (d->capture !=3D NULL) {
> ++              spa_hook_remove(&d->capture_listener);
> ++              pw_stream_destroy(d->capture);
> ++              d->capture =3D NULL;
> ++      }
> ++      destroy_playback_stream(d);
> ++      clear_client_node(d);
> ++      if (d->registry !=3D NULL) {
> ++              spa_hook_remove(&d->registry_listener);
> ++              pw_proxy_destroy((struct pw_proxy*)d->registry);
> ++              d->registry =3D NULL;
> ++      }
> ++      if (d->core !=3D NULL) {
> ++              spa_hook_remove(&d->core_listener);
> ++              pw_core_disconnect(d->core);
> ++              d->core =3D NULL;
> ++      }
> ++      if (d->activate_event !=3D NULL) {
> ++              pw_loop_destroy_source(d->loop, d->activate_event);
> ++              d->activate_event =3D NULL;
> ++      }
> ++      d->loop =3D NULL;
> ++      return 0;
> ++}
> ++
> ++static int module_compress_offload_forwarder_prepare(struct module
> *module)
> ++{
> ++      struct forwarder_data *d =3D module->user_data;
> ++      struct pw_properties *props =3D module->props;
> ++      const char *str;
> ++
> ++      PW_LOG_TOPIC_INIT(mod_topic);
> ++      str =3D pw_properties_get(props, "source_sink");
> ++      spa_scnprintf(d->source_name, sizeof(d->source_name), "%s",
> ++                      str ? str : "pal_speaker_compress");
> ++      str =3D pw_properties_get(props, "target_sink");
> ++      spa_scnprintf(d->target_name, sizeof(d->target_name), "%s",
> ++                      str ? str : "pal_sink_speaker_compress");
> ++      str =3D pw_properties_get(props, "codec");
> ++      spa_scnprintf(d->codec, sizeof(d->codec), "%s", str ? str :
> DEFAULT_CODEC);
> ++      str =3D pw_properties_get(props, "codec.aac.stream_format");
> ++      spa_scnprintf(d->aac_stream_format, sizeof(d->aac_stream_format),
> "%s", str ? str : "");
> ++      str =3D pw_properties_get(props, "codec.aac.codec_data");
> ++      spa_scnprintf(d->aac_codec_data, sizeof(d->aac_codec_data), "%s",
> str ? str : "");
> ++      d->aac_audio_object_type =3D pw_properties_get_uint32(props,
> "codec.aac.audio_object_type", 0);
> ++      d->rate =3D pw_properties_get_uint32(props, "rate", DEFAULT_RATE)=
;
> ++      d->channels =3D pw_properties_get_uint32(props, "channels",
> DEFAULT_CHANNELS);
> ++      d->bitrate =3D pw_properties_get_uint32(props, "bitrate",
> DEFAULT_BITRATE);
> ++      d->block_size =3D pw_properties_get_uint32(props, "block_size",
> DEFAULT_BLOCK_SIZE);
> ++      spa_scnprintf(d->monitor_name, sizeof(d->monitor_name),
> "%s.monitor", d->source_name);
> ++      d->client_node_id =3D PW_ID_ANY;
> ++
> ++      if (!codec_is_auto(d->codec) && !codec_is_mp3(d->codec) &&
> !codec_is_aac(d->codec)) {
> ++              pw_log_warn("compress-forwarder only supports auto, mp3,
> aac and aac_adts right now, requested codec=3D%s", d->codec);
> ++              return -ENOTSUP;
> ++      }
> ++      if (codec_is_aac_adts(d->codec) && d->aac_stream_format[0] =3D=3D=
 '\0')
> ++              spa_scnprintf(d->aac_stream_format,
> sizeof(d->aac_stream_format), "adts");
> ++      if (codec_is_aac_raw(d->codec) && d->aac_stream_format[0] =3D=3D =
'\0')
> ++              spa_scnprintf(d->aac_stream_format,
> sizeof(d->aac_stream_format), "raw");
> ++      if (d->channels =3D=3D 0)
> ++              d->channels =3D DEFAULT_CHANNELS;
> ++      if (d->rate =3D=3D 0)
> ++              d->rate =3D DEFAULT_RATE;
> ++      if (d->block_size =3D=3D 0)
> ++              d->block_size =3D DEFAULT_BLOCK_SIZE;
> ++
> ++      return 0;
> ++}
> ++
> ++static const struct spa_dict_item
> module_compress_offload_forwarder_info[] =3D {
> ++      { PW_KEY_MODULE_DESCRIPTION, "Forward encoded PulseAudio streams
> to a compressed-offload sink" },
> ++      { PW_KEY_MODULE_USAGE,       pulse_module_options },
> ++      { PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
> ++};
> ++
> ++DEFINE_MODULE_INFO(module_compress_offload_forwarder) =3D {
> ++      .name       =3D "module-compress-offload-forwarder",
> ++      .prepare    =3D module_compress_offload_forwarder_prepare,
> ++      .load       =3D module_compress_offload_forwarder_load,
> ++      .unload     =3D module_compress_offload_forwarder_unload,
> ++      .properties =3D
> &SPA_DICT_INIT_ARRAY(module_compress_offload_forwarder_info),
> ++      .data_size  =3D sizeof(struct forwarder_data),
> ++};
> +diff --git
> a/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-forwarder.h
> b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-forwarder.h
> +new file mode 100644
> +index 000000000..e936aad09
> +--- /dev/null
> ++++
> b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-forwarder.h
> +@@ -0,0 +1,20 @@
> ++/* PipeWire */
> ++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. *=
/
> ++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> ++
> ++#ifndef MODULE_COMPRESS_OFFLOAD_FORWARDER_H
> ++#define MODULE_COMPRESS_OFFLOAD_FORWARDER_H
> ++
> ++#include <spa/utils/dict.h>
> ++
> ++#define COMPRESS_RAW_AAC_MAGIC_0 'P'
> ++#define COMPRESS_RAW_AAC_MAGIC_1 'W'
> ++#define COMPRESS_RAW_AAC_MAGIC_2 'A'
> ++#define COMPRESS_RAW_AAC_MAGIC_3 'A'
> ++#define COMPRESS_RAW_AAC_HEADER_SIZE 8u
> ++
> ++void compress_offload_forwarder_update(const char *source_name,
> ++              const struct spa_dict *props);
> ++void compress_offload_forwarder_teardown(const char *source_name);
> ++
> ++#endif
> +diff --git
> a/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-sink.c
> b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-sink.c
> +new file mode 100644
> +index 000000000..832131e68
> +--- /dev/null
> ++++
> b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offload=
-sink.c
> +@@ -0,0 +1,308 @@
> ++/* PipeWire */
> ++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. *=
/
> ++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> ++
> ++#include <errno.h>
> ++#include <stdlib.h>
> ++
> ++#include <spa/utils/result.h>
> ++#include <pipewire/pipewire.h>
> ++
> ++#include "../module.h"
> ++
> ++/** \page page_pulse_module_compress_offload_sink Compress Offload Sink
> ++ *
> ++ * ## Module Name
> ++ *
> ++ * `module-compress-offload-sink`
> ++ *
> ++ * ## Module Options
> ++ *
> ++ * @pulse_module_options@
> ++ */
> ++
> ++static const char *const pulse_module_options =3D
> ++      "sink_name=3D<name of sink> "
> ++      "sink_properties=3D<properties for the sink> "
> ++      "target_sink=3D<node.name of the downstream compress-offload sink=
> "
> ++      "codec=3D<codec name, default auto> "
> ++      "rate=3D<sample rate, default 44100> "
> ++      "channels=3D<number of channels, default 2> "
> ++      "bitrate=3D<bit rate, default 128000>";
> ++
> ++#define NAME "compress-offload-sink"
> ++
> ++PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
> ++#define PW_LOG_TOPIC_DEFAULT mod_topic
> ++
> ++struct module_compress_offload_sink_data {
> ++      struct pw_core *core;
> ++      struct spa_hook core_listener;
> ++
> ++      struct pw_proxy *proxy;
> ++      struct spa_hook proxy_listener;
> ++};
> ++
> ++static void module_proxy_removed(void *data)
> ++{
> ++      struct module *module =3D data;
> ++      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> ++
> ++      pw_log_debug("compress-forwarder proxy removed: proxy=3D%p",
> d->proxy);
> ++      pw_proxy_destroy(d->proxy);
> ++}
> ++
> ++static void module_proxy_destroy(void *data)
> ++{
> ++      struct module *module =3D data;
> ++      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> ++
> ++      pw_log_debug("compress-forwarder proxy destroy: proxy=3D%p -
> scheduling module unload", d->proxy);
> ++      spa_hook_remove(&d->proxy_listener);
> ++      d->proxy =3D NULL;
> ++      module_schedule_unload(module);
> ++}
> ++
> ++static void module_proxy_bound_props(void *data, uint32_t global_id,
> const struct spa_dict *props)
> ++{
> ++      struct module *module =3D data;
> ++      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> ++
> ++      pw_log_debug("proxy %p bound id:%u module_index=3D%u", d->proxy,
> global_id, module->index);
> ++      pw_log_debug("compress-forwarder node successfully created and
> bound, emitting loaded");
> ++      module_emit_loaded(module, 0);
> ++}
> ++
> ++static void module_proxy_error(void *data, int seq, int res, const char
> *message)
> ++{
> ++      struct module *module =3D data;
> ++      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> ++
> ++      pw_log_error("proxy %p error %d: %s", d->proxy, res, message);
> ++      pw_proxy_destroy(d->proxy);
> ++}
> ++
> ++static const struct pw_proxy_events proxy_events =3D {
> ++      PW_VERSION_PROXY_EVENTS,
> ++      .removed      =3D module_proxy_removed,
> ++      .bound_props  =3D module_proxy_bound_props,
> ++      .error        =3D module_proxy_error,
> ++      .destroy      =3D module_proxy_destroy,
> ++};
> ++
> ++static void module_core_error(void *data, uint32_t id, int seq, int res=
,
> const char *message)
> ++{
> ++      struct module *module =3D data;
> ++
> ++      pw_log_error("error id:%u seq:%d res:%d (%s): %s",
> ++                      id, seq, res, spa_strerror(res), message);
> ++
> ++      if (id =3D=3D PW_ID_CORE && res =3D=3D -EPIPE)
> ++              module_schedule_unload(module);
> ++}
> ++
> ++static const struct pw_core_events core_events =3D {
> ++      PW_VERSION_CORE_EVENTS,
> ++      .error =3D module_core_error,
> ++};
> ++
> ++static int module_compress_offload_sink_load(struct module *module)
> ++{
> ++      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> ++
> ++      pw_log_info("compress-forwarder load: node=3D%s target=3D%s codec=
=3D%s
> rate=3D%s channels=3D%s bitrate=3D%s",
> ++                      pw_properties_get(module->props, PW_KEY_NODE_NAME=
),
> ++                      pw_properties_get(module->props,
> "compress.target.object"),
> ++                      pw_properties_get(module->props, "codec.type"),
> ++                      pw_properties_get(module->props,
> "codec.sample_rate"),
> ++                      pw_properties_get(module->props, "codec.channels"=
),
> ++                      pw_properties_get(module->props,
> "codec.bit_rate"));
> ++
> ++      d->core =3D pw_context_connect(module->impl->context, NULL, 0);
> ++      if (d->core =3D=3D NULL) {
> ++              pw_log_error("compress-forwarder core connect failed:
> errno=3D%d (%s)",
> ++                              errno, spa_strerror(-errno));
> ++              return -errno;
> ++      }
> ++
> ++      pw_log_debug("compress-forwarder core connected: core=3D%p",
> d->core);
> ++      pw_core_add_listener(d->core, &d->core_listener, &core_events,
> module);
> ++      pw_properties_setf(module->props, "pulse.module.id", "%u",
> module->index);
> ++
> ++      d->proxy =3D pw_core_create_object(d->core,
> ++                                       "adapter",
> PW_TYPE_INTERFACE_Node, PW_VERSION_NODE,
> ++                                       module->props ?
> &module->props->dict : NULL, 0);
> ++      if (d->proxy =3D=3D NULL) {
> ++              pw_log_error("compress-forwarder adapter create failed:
> errno=3D%d (%s)",
> ++                              errno, spa_strerror(-errno));
> ++              return -errno;
> ++      }
> ++
> ++      pw_log_debug("compress-forwarder adapter create requested:
> proxy=3D%p - waiting for bound_props", d->proxy);
> ++      pw_proxy_add_listener(d->proxy, &d->proxy_listener, &proxy_events=
,
> module);
> ++      return SPA_RESULT_RETURN_ASYNC(0);
> ++}
> ++
> ++static int module_compress_offload_sink_unload(struct module *module)
> ++{
> ++      struct module_compress_offload_sink_data *d =3D module->user_data=
;
> ++
> ++      pw_log_debug("compress-forwarder unload: proxy=3D%p core=3D%p -
> cleaning up", d->proxy, d->core);
> ++      if (d->proxy !=3D NULL) {
> ++              spa_hook_remove(&d->proxy_listener);
> ++              pw_proxy_destroy(d->proxy);
> ++              d->proxy =3D NULL;
> ++      }
> ++      if (d->core !=3D NULL) {
> ++              spa_hook_remove(&d->core_listener);
> ++              pw_core_disconnect(d->core);
> ++              d->core =3D NULL;
> ++      }
> ++      return 0;
> ++}
> ++
> ++static int module_compress_offload_sink_prepare(struct module * const
> module)
> ++{
> ++      struct pw_properties * const props =3D module->props;
> ++      const char *str;
> ++      uint32_t rate =3D 44100;
> ++      uint32_t channels =3D 2;
> ++      uint32_t bitrate =3D 128000;
> ++
> ++      PW_LOG_TOPIC_INIT(mod_topic);
> ++
> ++      if ((str =3D pw_properties_get(props, "sink_name")) !=3D NULL) {
> ++              pw_log_debug("compress-forwarder option: sink_name=3D%s",
> str);
> ++              pw_properties_set(props, PW_KEY_NODE_NAME, str);
> ++              pw_properties_set(props, "sink_name", NULL);
> ++      } else {
> ++              pw_log_debug("compress-forwarder option: sink_name
> missing, using default");
> ++              pw_properties_set(props, PW_KEY_NODE_NAME,
> "compress-offload-sink");
> ++      }
> ++
> ++      if ((str =3D pw_properties_get(props, "sink_properties")) !=3D NU=
LL) {
> ++              pw_log_debug("compress-forwarder option:
> sink_properties=3D%s", str);
> ++              module_args_add_props(props, str);
> ++              pw_properties_set(props, "sink_properties", NULL);
> ++      }
> ++
> ++      if ((str =3D pw_properties_get(props, "target_sink")) !=3D NULL) =
{
> ++              pw_log_debug("compress-forwarder option: target_sink=3D%s=
",
> str);
> ++              pw_properties_set(props, "compress.target.object", str);
> ++              pw_properties_set(props, "target_sink", NULL);
> ++      } else {
> ++              pw_log_warn("compress-forwarder option: target_sink
> missing; stream will not have explicit compress target");
> ++      }
> ++
> ++      if ((str =3D pw_properties_get(props, "rate")) !=3D NULL) {
> ++              uint32_t v =3D (uint32_t)atoi(str);
> ++              if (v > 0)
> ++                      rate =3D v;
> ++              pw_properties_set(props, "rate", NULL);
> ++      }
> ++      if ((str =3D pw_properties_get(props, "channels")) !=3D NULL) {
> ++              uint32_t v =3D (uint32_t)atoi(str);
> ++              if (v > 0)
> ++                      channels =3D v;
> ++              pw_properties_set(props, "channels", NULL);
> ++      }
> ++      if ((str =3D pw_properties_get(props, "bitrate")) !=3D NULL) {
> ++              uint32_t v =3D (uint32_t)atoi(str);
> ++              if (v > 0)
> ++                      bitrate =3D v;
> ++              pw_properties_set(props, "bitrate", NULL);
> ++      }
> ++      if ((str =3D pw_properties_get(props, "channel_map")) !=3D NULL) =
{
> ++              pw_properties_set(props, "audio.position", str);
> ++              pw_properties_set(props, "channel_map", NULL);
> ++      } else {
> ++              switch (channels) {
> ++              case 1:
> ++                      pw_properties_set(props, "audio.position", "[ MON=
O
> ]");
> ++                      break;
> ++              case 2:
> ++                      pw_properties_set(props, "audio.position", "[ FL
> FR ]");
> ++                      break;
> ++              case 3:
> ++                      pw_properties_set(props, "audio.position", "[ FL
> FR LFE ]");
> ++                      break;
> ++              case 4:
> ++                      pw_properties_set(props, "audio.position", "[ FL
> FR RL RR ]");
> ++                      break;
> ++              case 5:
> ++                      pw_properties_set(props, "audio.position", "[ FL
> FR FC RL RR ]");
> ++                      break;
> ++              case 6:
> ++                      pw_properties_set(props, "audio.position", "[ FL
> FR FC LFE RL RR ]");
> ++                      break;
> ++              case 8:
> ++                      pw_properties_set(props, "audio.position", "[ FL
> FR FC LFE RL RR SL SR ]");
> ++                      break;
> ++              default:
> ++                      break;
> ++              }
> ++      }
> ++
> ++      str =3D pw_properties_get(props, "codec");
> ++      pw_properties_set(props, "codec.type", str ? str : "auto");
> ++      pw_properties_set(props, "codec.formats", "[ mp3 aac_adts aac ]")=
;
> ++      pw_properties_setf(props, "codec.sample_rate", "%u", rate);
> ++      pw_properties_setf(props, "codec.channels",    "%u", channels);
> ++      pw_properties_setf(props, "codec.bit_rate",    "%u", bitrate);
> ++      pw_properties_set(props, "codec", NULL);
> ++
> ++      if (pw_properties_get(props, PW_KEY_MEDIA_CLASS) =3D=3D NULL)
> ++              pw_properties_set(props, PW_KEY_MEDIA_CLASS, "Audio/Sink"=
);
> ++      if (pw_properties_get(props, PW_KEY_NODE_DESCRIPTION) =3D=3D NULL=
)
> ++              pw_properties_setf(props, PW_KEY_NODE_DESCRIPTION, "%s
> (compress offload)",
> ++                              pw_properties_get(props,
> PW_KEY_NODE_NAME));
> ++
> ++      /*
> ++       * Advertise this node as an encoded-only sink so WirePlumber's
> ++       * canPassthrough() allows linking compress streams to it.
> ++       * audio.format=3DS16LE is kept as the synthetic PCM sample_spec =
that
> ++       * Pulse clients see in pactl; no PCM conversion ever occurs.
> ++       */
> ++      pw_properties_set(props, PW_KEY_AUDIO_FORMAT,
> "S16LE");
> ++      pw_properties_setf(props, PW_KEY_AUDIO_RATE,                 "%u"=
,
> rate);
> ++      pw_properties_setf(props, PW_KEY_AUDIO_CHANNELS,             "%u"=
,
> channels);
> ++      pw_properties_set(props, "item.node.supports-encoded-fmts",
> "true");
> ++      pw_properties_set(props, PW_KEY_NODE_VIRTUAL,
> "true");
> ++      pw_properties_set(props, PW_KEY_PRIORITY_SESSION,            "1")=
;
> ++      pw_properties_set(props, PW_KEY_PRIORITY_DRIVER,             "1")=
;
> ++      pw_properties_set(props, "monitor.channel-volumes",
> "false");
> ++      pw_properties_set(props, "monitor.passthrough",
> "true");
> ++      pw_properties_set(props, "channelmix.disable",
> "true");
> ++      pw_properties_set(props, "resample.disable",
> "true");
> ++      pw_properties_set(props, "compress.carrier.rate",
>  "48000");
> ++      pw_properties_set(props, "compress.carrier.channels",         "2"=
);
> ++      pw_properties_set(props, "compress.offload",
>  "true");
> ++      pw_properties_set(props, PW_KEY_FACTORY_NAME,
> "support.null-audio-sink");
> ++
> ++      pw_log_info("prepared compress-forwarder alias: name=3D%s target=
=3D%s
> codec=3D%s rate=3D%u channels=3D%u bitrate=3D%u media.class=3D%s audio.fo=
rmat=3D%s
> virtual=3D%s factory=3D%s",
> ++                      pw_properties_get(props, PW_KEY_NODE_NAME),
> ++                      pw_properties_get(props, "compress.target.object"=
),
> ++                      pw_properties_get(props, "codec.type"),
> ++                      rate, channels, bitrate,
> ++                      pw_properties_get(props, PW_KEY_MEDIA_CLASS),
> ++                      pw_properties_get(props, PW_KEY_AUDIO_FORMAT),
> ++                      pw_properties_get(props, PW_KEY_NODE_VIRTUAL),
> ++                      pw_properties_get(props, PW_KEY_FACTORY_NAME));
> ++
> ++      return 0;
> ++}
> ++
> ++static const struct spa_dict_item module_compress_offload_sink_info[] =
=3D {
> ++      { PW_KEY_MODULE_DESCRIPTION, "Pulse-visible alias sink for
> compressed offload playback" },
> ++      { PW_KEY_MODULE_USAGE,       pulse_module_options },
> ++      { PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
> ++};
> ++
> ++DEFINE_MODULE_INFO(module_compress_offload_sink) =3D {
> ++      .name       =3D "module-compress-offload-sink",
> ++      .prepare    =3D module_compress_offload_sink_prepare,
> ++      .load       =3D module_compress_offload_sink_load,
> ++      .unload     =3D module_compress_offload_sink_unload,
> ++      .properties =3D
> &SPA_DICT_INIT_ARRAY(module_compress_offload_sink_info),
> ++      .data_size  =3D sizeof(struct module_compress_offload_sink_data),
> ++};
> +--
> +GitLab
> +
> +
> +From 574fec7ebc482a462b2842422cec156aa9a43f1e Mon Sep 17 00:00:00 2001
> +From: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +Date: Fri, 23 Oct 2026 17:45:41 +0530
> +Subject: [PATCH 4/4] pulse-server: preserve encoded streams for compress=
ed
> + offload
> +
> +Recognize compressed-offload sinks when Pulse playback streams are
> +created and advertise MP3, AAC ADTS, and raw AAC formats with their
> +codec parameters.
> +
> +Configure compressed streams for byte-preserving transport: use a
> +single-byte frame size, disable format conversion, remove playback
> +prebuffering, and connect the stream with an encoded format while
> +retaining the negotiated codec properties.
> +
> +Frame each raw AAC access unit with its payload length before writing it
> +to the Pulse ring buffer. Include the framing bytes in buffer-capacity
> +checks and use the stream's allocated buffer size when wrapping the
> +write position.
> +
> +Track the forwarding source on each stream and notify the forwarder when
> +the Pulse playback stream is freed. This lets the target stream and any
> +pending encoded data be released when playback ends or the client is
> +removed.
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
> +Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +---
> + .../module-protocol-pulse/pulse-server.c      | 654 +++++++++++++++++-
> + src/modules/module-protocol-pulse/server.c    |  35 +-
> + src/modules/module-protocol-pulse/stream.c    |   5 +
> + src/modules/module-protocol-pulse/stream.h    |   2 +
> + 4 files changed, 675 insertions(+), 21 deletions(-)
> +
> +diff --git a/src/modules/module-protocol-pulse/pulse-server.c
> b/src/modules/module-protocol-pulse/pulse-server.c
> +index 153be0c4f..d8a8591d8 100644
> +--- a/src/modules/module-protocol-pulse/pulse-server.c
> ++++ b/src/modules/module-protocol-pulse/pulse-server.c
> +@@ -34,6 +34,7 @@
> + #include <pipewire/extensions/metadata.h>
> +
> + #include "pulse-server.h"
> ++#include "modules/pulse-module-compress-offload-forwarder.h"
> + #include "client.h"
> + #include "collect.h"
> + #include "commands.h"
> +@@ -89,6 +90,9 @@ struct temporary_move_data {
> +       uint8_t used:1;
> + };
> +
> ++/* Buffer size used for compress-offload streams (frame_size =3D=3D 1).=
 */
> ++#define COMPRESS_OFFLOAD_BUF_SIZE  16484u
> ++
> + static struct sample *find_sample(struct impl *impl, uint32_t index,
> const char *name)
> + {
> +       union pw_map_item *item;
> +@@ -1223,10 +1227,18 @@ static const struct spa_pod
> *get_buffers_param(struct stream *s,
> +       blocks =3D 1;
> +       stride =3D s->frame_size;
> +
> ++      /* compressed offload uses byte granularity */
> ++      if (s->frame_size =3D=3D 1) {
> ++              size =3D COMPRESS_OFFLOAD_BUF_SIZE;
> ++              pw_log_debug("[%s] get_buffers_param: compress offload
> path size=3D%u", s->client->name, size);
> ++              goto build_buffers_param;
> ++      }
> ++
> +       size =3D defs->quantum_limit * s->frame_size;
> +
> +       pw_log_info("[%s] stride %d size %u", s->client->name, stride,
> size);
> +
> ++build_buffers_param:
> +       param =3D spa_pod_builder_add_object(b,
> +                       SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,
> +                       SPA_PARAM_BUFFERS_buffers,
> SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,
> +@@ -1252,6 +1264,23 @@ static void stream_param_changed(void *data,
> uint32_t id, const struct spa_pod *
> +       if (id !=3D SPA_PARAM_Format || param =3D=3D NULL)
> +               return;
> +
> ++      /* For compress-offload streams, force byte-granularity regardles=
s
> ++       * of negotiated format (we connect with S16LE but data is
> compressed). */
> ++      {
> ++              const char *co =3D stream->props ?
> ++                      pw_properties_get(stream->props,
> "compress.offload") : NULL;
> ++              if (co && pw_properties_parse_bool(co)) {
> ++                      uint32_t media_type =3D 0, media_subtype =3D 0;
> ++                      spa_format_parse(param, &media_type,
> &media_subtype);
> ++                      stream->frame_size =3D 1;
> ++                      stream->rate =3D stream->ss.rate ? stream->ss.rat=
e :
> ++                              pw_properties_get_uint32(stream->props,
> "codec.sample_rate", 44100);
> ++                      pw_log_debug("[%s] compress-offload
> stream_param_changed: forcing frame_size=3D1 rate=3D%u subtype=3D%u",
> ++                              stream->client->name, stream->rate,
> media_subtype);
> ++                      goto stream_param_format_done;
> ++              }
> ++      }
> ++
> +       if ((res =3D format_parse_param(param, false, &stream->ss,
> &stream->map, NULL, NULL)) < 0) {
> +               pw_stream_set_error(stream->stream, res, "format not
> supported");
> +               return;
> +@@ -1267,6 +1296,9 @@ static void stream_param_changed(void *data,
> uint32_t id, const struct spa_pod *
> +               return;
> +       }
> +       stream->rate =3D stream->ss.rate;
> ++stream_param_format_done:
> ++      pw_log_debug("[%s] stream param done: frame_size=3D%u rate=3D%u
> ss.format=3D%u",
> ++                      stream->client->name, stream->frame_size,
> stream->rate, stream->ss.format);
> +
> +       if (stream->create_tag !=3D SPA_ID_INVALID) {
> +               struct pw_manager_object *peer;
> +@@ -1621,6 +1653,395 @@ static void log_format_info(struct impl *impl,
> enum spa_log_level level, struct
> +                               impl, it->key, it->value);
> + }
> +
> ++static const struct spa_pod *build_compress_offload_format(struct
> spa_pod_builder *b,
> ++              uint32_t id, const struct pw_properties *props, uint32_t
> *rate)
> ++{
> ++      const char *codec;
> ++      const char *stream_format;
> ++      struct spa_audio_info info;
> ++      uint32_t sample_rate, channels, bitrate;
> ++
> ++      spa_zero(info);
> ++      info.media_type =3D SPA_MEDIA_TYPE_audio;
> ++      codec =3D pw_properties_get(props, "codec.type");
> ++      stream_format =3D pw_properties_get(props,
> "codec.aac.stream_format");
> ++      sample_rate =3D pw_properties_get_uint32(props, "codec.sample_rat=
e",
> 44100);
> ++      channels =3D pw_properties_get_uint32(props, "codec.channels", 2)=
;
> ++      bitrate =3D pw_properties_get_uint32(props, "codec.bit_rate",
> 128000);
> ++
> ++      if (codec =3D=3D NULL || spa_streq(codec, "mp3")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;
> ++              info.info.mp3.rate =3D sample_rate;
> ++              info.info.mp3.channels =3D channels;
> ++              info.info.mp3.channel_mode =3D channels =3D=3D 1 ?
> ++                      SPA_AUDIO_MP3_CHANNEL_MODE_MONO :
> SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
> ++      } else if (spa_streq(codec, "aac") || spa_streq(codec,
> "aac_adts")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> ++              info.info.aac.rate =3D sample_rate;
> ++              info.info.aac.channels =3D channels;
> ++              info.info.aac.bitrate =3D bitrate;
> ++              info.info.aac.audio_object_type =3D
> pw_properties_get_uint32(props,
> ++                              "codec.aac.audio_object_type", 0);
> ++              info.info.aac.stream_format =3D spa_streq(codec, "aac_adt=
s")
> ||
> ++                              stream_format =3D=3D NULL ||
> spa_streq(stream_format, "adts") ?
> ++                              SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS :
> ++                              SPA_AUDIO_AAC_STREAM_FORMAT_RAW;
> ++      } else if (spa_streq(codec, "aac_adif")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> ++              info.info.aac.rate =3D sample_rate;
> ++              info.info.aac.channels =3D channels;
> ++              info.info.aac.bitrate =3D bitrate;
> ++              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_ADIF;
> ++      } else if (spa_streq(codec, "aac_latm")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;
> ++              info.info.aac.rate =3D sample_rate;
> ++              info.info.aac.channels =3D channels;
> ++              info.info.aac.bitrate =3D bitrate;
> ++              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4LATM;
> ++      } else if (spa_streq(codec, "flac")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_flac;
> ++              info.info.flac.rate =3D sample_rate;
> ++              info.info.flac.channels =3D channels;
> ++      } else if (spa_streq(codec, "vorbis")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_vorbis;
> ++              info.info.vorbis.rate =3D sample_rate;
> ++              info.info.vorbis.channels =3D channels;
> ++      } else if (spa_streq(codec, "opus")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_opus;
> ++              info.info.opus.rate =3D sample_rate;
> ++              info.info.opus.channels =3D channels;
> ++      } else if (spa_streq(codec, "wma") || spa_streq(codec, "wma_std")=
)
> {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_wma;
> ++              info.info.wma.rate =3D sample_rate;
> ++              info.info.wma.channels =3D channels;
> ++              info.info.wma.bitrate =3D bitrate;
> ++              info.info.wma.profile =3D SPA_AUDIO_WMA_PROFILE_WMA9;
> ++      } else if (spa_streq(codec, "wma_pro")) {
> ++              info.media_subtype =3D SPA_MEDIA_SUBTYPE_wma;
> ++              info.info.wma.rate =3D sample_rate;
> ++              info.info.wma.channels =3D channels;
> ++              info.info.wma.bitrate =3D bitrate;
> ++              info.info.wma.profile =3D SPA_AUDIO_WMA_PROFILE_WMA9_PRO;
> ++      } else {
> ++              errno =3D ENOTSUP;
> ++              return NULL;
> ++      }
> ++      if (rate !=3D NULL)
> ++              *rate =3D sample_rate;
> ++      return spa_format_audio_build(b, id, &info);
> ++}
> ++
> ++static void synthesize_compress_offload_spec(struct sample_spec *ss,
> ++              struct channel_map *map, const struct pw_properties *prop=
s)
> ++{
> ++      uint32_t channels;
> ++
> ++      ss->format =3D SPA_AUDIO_FORMAT_S16_LE;
> ++      ss->rate =3D pw_properties_get_uint32(props,
> "compress.carrier.rate", 48000);
> ++      channels =3D pw_properties_get_uint32(props,
> "compress.carrier.channels", 2);
> ++      ss->channels =3D (uint8_t)(channels > 0 ? channels : 2);
> ++      spa_zero(*map);
> ++      switch (ss->channels) {
> ++      case 1: channel_map_parse("mono", map); break;
> ++      case 2: channel_map_parse("stereo", map); break;
> ++      case 3: channel_map_parse("surround-21", map); break;
> ++      case 4: channel_map_parse("surround-40", map); break;
> ++      case 5: channel_map_parse("surround-50", map); break;
> ++      case 6: channel_map_parse("surround-51", map); break;
> ++      case 8: channel_map_parse("surround-71", map); break;
> ++      default: channel_map_parse("stereo", map); ss->channels =3D 2; br=
eak;
> ++      }
> ++}
> ++
> ++static uint32_t compress_format_get_u32_prop(const struct format_info
> *format,
> ++              const char *key, uint32_t default_value)
> ++{
> ++      const char *str, *val;
> ++      struct spa_json it[2];
> ++      int len, value;
> ++
> ++      if (format->props =3D=3D NULL || (str =3D
> pw_properties_get(format->props, key)) =3D=3D NULL)
> ++              return default_value;
> ++      if ((len =3D spa_json_begin(&it[0], str, strlen(str), &val)) <=3D=
 0)
> ++              return default_value;
> ++      if (spa_json_is_int(val, len) && spa_json_parse_int(val, len,
> &value) > 0 && value > 0)
> ++              return (uint32_t)value;
> ++      if ((value =3D atoi(str)) > 0)
> ++              return (uint32_t)value;
> ++      return default_value;
> ++}
> ++
> ++static const char *compress_format_get_string_prop(const struct
> format_info *format,
> ++              const char *key, char *buffer, size_t size)
> ++{
> ++      const char *str, *val;
> ++      struct spa_json it[2];
> ++      int len;
> ++
> ++      if (format->props =3D=3D NULL || (str =3D
> pw_properties_get(format->props, key)) =3D=3D NULL)
> ++              return NULL;
> ++      if ((len =3D spa_json_begin(&it[0], str, strlen(str), &val)) > 0 =
&&
> spa_json_is_string(val, len))
> ++              return spa_scnprintf(buffer, size, "%.*s", len - 2, val +
> 1) >=3D 0 ? buffer : NULL;
> ++      return str;
> ++}
> ++
> ++static uint32_t compress_format_get_u32_prop_compat(const struct
> format_info *format,
> ++              const char *primary, const char *compat, uint32_t
> default_value)
> ++{
> ++      uint32_t value;
> ++
> ++      value =3D compress_format_get_u32_prop(format, primary, 0);
> ++      if (value =3D=3D 0 && compat !=3D NULL)
> ++              value =3D compress_format_get_u32_prop(format, compat, 0)=
;
> ++      return value !=3D 0 ? value : default_value;
> ++}
> ++
> ++static const char *compress_format_get_string_prop_compat(
> ++              const struct format_info *format, const char *primary,
> ++              const char *compat, char *buffer, size_t size)
> ++{
> ++      const char *str;
> ++
> ++      str =3D compress_format_get_string_prop(format, primary, buffer,
> size);
> ++      if (str =3D=3D NULL && compat !=3D NULL)
> ++              str =3D compress_format_get_string_prop(format, compat,
> buffer, size);
> ++      return str;
> ++}
> ++
> ++static bool compress_format_stream_format_is(const struct format_info
> *format, const char *expected)
> ++{
> ++      char stream_format[32];
> ++      const char *str;
> ++
> ++      str =3D compress_format_get_string_prop_compat(format,
> "format.stream_format",
> ++                      "stream-format", stream_format,
> sizeof(stream_format));
> ++      return str =3D=3D NULL ? spa_streq(expected, "adts") : spa_streq(=
str,
> expected);
> ++}
> ++
> ++static bool compress_hex_nibble(char c, uint8_t *value)
> ++{
> ++      if (c >=3D '0' && c <=3D '9')
> ++              *value =3D c - '0';
> ++      else if (c >=3D 'a' && c <=3D 'f')
> ++              *value =3D c - 'a' + 10;
> ++      else if (c >=3D 'A' && c <=3D 'F')
> ++              *value =3D c - 'A' + 10;
> ++      else
> ++              return false;
> ++      return true;
> ++}
> ++
> ++static uint32_t compress_read_bits(const uint8_t *data, size_t size,
> ++              uint32_t *bit_offset, uint32_t n_bits)
> ++{
> ++      uint32_t value =3D 0, i;
> ++
> ++      if (*bit_offset + n_bits > size * 8)
> ++              return SPA_ID_INVALID;
> ++      for (i =3D 0; i < n_bits; i++) {
> ++              uint32_t byte =3D (*bit_offset + i) / 8;
> ++              uint32_t bit =3D 7 - ((*bit_offset + i) % 8);
> ++              value =3D (value << 1) | ((data[byte] >> bit) & 1);
> ++      }
> ++      *bit_offset +=3D n_bits;
> ++      return value;
> ++}
> ++
> ++struct compress_aac_config {
> ++      uint32_t object_type;
> ++      uint32_t rate;
> ++      uint32_t channels;
> ++};
> ++
> ++static uint32_t compress_aac_sample_rate(const uint8_t *data, size_t
> size,
> ++              uint32_t *bit_offset)
> ++{
> ++      static const uint32_t rates[] =3D {
> ++              96000, 88200, 64000, 48000, 44100, 32000, 24000,
> ++              22050, 16000, 12000, 11025, 8000, 7350,
> ++      };
> ++      uint32_t index =3D compress_read_bits(data, size, bit_offset, 4);
> ++
> ++      if (index =3D=3D SPA_ID_INVALID)
> ++              return 0;
> ++      if (index =3D=3D 15) {
> ++              uint32_t rate =3D compress_read_bits(data, size, bit_offs=
et,
> 24);
> ++              return rate =3D=3D SPA_ID_INVALID ? 0 : rate;
> ++      }
> ++      return index < SPA_N_ELEMENTS(rates) ? rates[index] : 0;
> ++}
> ++
> ++static uint32_t compress_aac_object_type(const uint8_t *data, size_t
> size,
> ++              uint32_t *bit_offset)
> ++{
> ++      uint32_t object_type =3D compress_read_bits(data, size, bit_offse=
t,
> 5);
> ++
> ++      if (object_type =3D=3D SPA_ID_INVALID)
> ++              return 0;
> ++      if (object_type =3D=3D 31) {
> ++              uint32_t ext =3D compress_read_bits(data, size, bit_offse=
t,
> 6);
> ++              if (ext =3D=3D SPA_ID_INVALID)
> ++                      return 0;
> ++              object_type =3D 32 + ext;
> ++      }
> ++      return object_type;
> ++}
> ++
> ++static bool compress_parse_audio_specific_config(const char *str,
> ++              struct compress_aac_config *config)
> ++{
> ++      uint8_t data[64];
> ++      uint32_t bit_offset =3D 0, channel_config, extension_rate;
> ++      size_t n_data =3D 0;
> ++      bool high =3D true;
> ++      uint8_t byte =3D 0;
> ++      static const uint8_t channel_count[] =3D { 0, 1, 2, 3, 4, 5, 6, 8=
 };
> ++
> ++      if (str =3D=3D NULL || config =3D=3D NULL)
> ++              return false;
> ++      spa_zero(*config);
> ++      if (spa_strstartswith(str, "(buffer)"))
> ++              str +=3D strlen("(buffer)");
> ++      if (spa_strstartswith(str, "0x") || spa_strstartswith(str, "0X"))
> ++              str +=3D 2;
> ++      for (; *str !=3D '\0' && n_data < sizeof(data); str++) {
> ++              uint8_t nibble;
> ++
> ++              if (!compress_hex_nibble(*str, &nibble))
> ++                      continue;
> ++              if (high) {
> ++                      byte =3D nibble << 4;
> ++                      high =3D false;
> ++              } else {
> ++                      data[n_data++] =3D byte | nibble;
> ++                      high =3D true;
> ++              }
> ++      }
> ++      if (!high || n_data =3D=3D 0)
> ++              return false;
> ++
> ++      config->object_type =3D compress_aac_object_type(data, n_data,
> &bit_offset);
> ++      config->rate =3D compress_aac_sample_rate(data, n_data, &bit_offs=
et);
> ++      channel_config =3D compress_read_bits(data, n_data, &bit_offset, =
4);
> ++      if (config->object_type =3D=3D 0 || config->rate =3D=3D 0 ||
> ++          channel_config =3D=3D SPA_ID_INVALID)
> ++              return false;
> ++      if (channel_config < SPA_N_ELEMENTS(channel_count))
> ++              config->channels =3D channel_count[channel_config];
> ++
> ++      if (config->object_type =3D=3D 5 || config->object_type =3D=3D 29=
) {
> ++              extension_rate =3D compress_aac_sample_rate(data, n_data,
> &bit_offset);
> ++              if (extension_rate !=3D 0)
> ++                      config->rate =3D extension_rate;
> ++      }
> ++      return true;
> ++}
> ++
> ++static int set_compress_offload_props_from_format(struct pw_properties
> *props,
> ++              const struct format_info *format)
> ++{
> ++      const char *codec, *stream_format;
> ++      char stream_format_buffer[32];
> ++      bool is_aac =3D false;
> ++
> ++      switch (format->encoding) {
> ++      case ENCODING_MP3:
> ++              codec =3D "mp3";
> ++              break;
> ++      case ENCODING_AAC:
> ++              if (!compress_format_stream_format_is(format, "raw"))
> ++                      return -ENOTSUP;
> ++              codec =3D "aac";
> ++              is_aac =3D true;
> ++              break;
> ++      case ENCODING_AAC_ADTS:
> ++              if (!compress_format_stream_format_is(format, "adts"))
> ++                      return -ENOTSUP;
> ++              codec =3D "aac_adts";
> ++              is_aac =3D true;
> ++              break;
> ++      case ENCODING_MPEG2_AAC_IEC61937:
> ++              stream_format =3D
> compress_format_get_string_prop_compat(format,
> ++                              "format.stream_format", "stream-format",
> ++                              stream_format_buffer,
> sizeof(stream_format_buffer));
> ++              if (stream_format =3D=3D NULL || spa_streq(stream_format,
> "adts"))
> ++                      codec =3D "aac_adts";
> ++              else if (spa_streq(stream_format, "raw"))
> ++                      codec =3D "aac";
> ++              else
> ++                      return -ENOTSUP;
> ++              is_aac =3D true;
> ++              break;
> ++      default:
> ++              return -ENOTSUP;
> ++      }
> ++
> ++      pw_properties_set(props, "codec.type", codec);
> ++      pw_properties_setf(props, "codec.sample_rate", "%u",
> ++                      compress_format_get_u32_prop(format, "format.rate=
",
> ++                              pw_properties_get_uint32(props,
> "codec.sample_rate", 48000)));
> ++      pw_properties_setf(props, "codec.channels", "%u",
> ++                      compress_format_get_u32_prop_compat(format,
> "format.channels", "channels",
> ++                              pw_properties_get_uint32(props,
> "codec.channels", 2)));
> ++      pw_properties_setf(props, "codec.bit_rate", "%u",
> ++                      compress_format_get_u32_prop_compat(format,
> "format.bit_rate", "bitrate",
> ++                              pw_properties_get_uint32(props,
> "codec.bit_rate", 128000)));
> ++      if (is_aac) {
> ++              char stream_format[32], codec_data[256];
> ++              const char *str;
> ++              struct compress_aac_config aac_config;
> ++              uint32_t object_type =3D
> compress_format_get_u32_prop_compat(format,
> ++                              "format.audio_object_type",
> "audio-object-type",
> ++                              pw_properties_get_uint32(props,
> "codec.aac.audio_object_type", 0));
> ++
> ++              str =3D compress_format_get_string_prop_compat(format,
> "format.stream_format",
> ++                              "stream-format", stream_format,
> sizeof(stream_format));
> ++              pw_properties_set(props, "codec.aac.stream_format",
> ++                              str !=3D NULL ? str : (spa_streq(codec,
> "aac_adts") ? "adts" : "raw"));
> ++              str =3D compress_format_get_string_prop_compat(format,
> "format.codec_data",
> ++                              "codec_data", codec_data,
> sizeof(codec_data));
> ++              if (str =3D=3D NULL)
> ++                      str =3D compress_format_get_string_prop(format,
> "codec-data",
> ++                                      codec_data, sizeof(codec_data));
> ++              if (str =3D=3D NULL)
> ++                      str =3D pw_properties_get(props,
> "codec.aac.codec_data");
> ++              if (str !=3D NULL) {
> ++                      pw_properties_set(props, "codec.aac.codec_data",
> str);
> ++                      if (compress_parse_audio_specific_config(str,
> &aac_config)) {
> ++                              if (object_type =3D=3D 0)
> ++                                      object_type =3D
> aac_config.object_type;
> ++                              if (aac_config.rate !=3D 0)
> ++                                      pw_properties_setf(props,
> "codec.sample_rate", "%u", aac_config.rate);
> ++                              if (aac_config.channels !=3D 0)
> ++                                      pw_properties_setf(props,
> "codec.channels", "%u", aac_config.channels);
> ++                      }
> ++              }
> ++              if (object_type =3D=3D 0 && spa_streq(codec, "aac_adts"))
> ++                      object_type =3D 2;
> ++              if (object_type !=3D 0)
> ++                      pw_properties_setf(props,
> "codec.aac.audio_object_type", "%u", object_type);
> ++      }
> ++      return 0;
> ++}
> ++
> ++static int init_compress_format_info(struct format_info *format,
> ++              enum encoding encoding, uint32_t rate, uint32_t channels,
> uint32_t bitrate)
> ++{
> ++      spa_zero(*format);
> ++      format->encoding =3D encoding;
> ++      format->props =3D pw_properties_new(NULL, NULL);
> ++      if (format->props =3D=3D NULL)
> ++              return -errno;
> ++      pw_properties_setf(format->props, "format.rate", "%u", rate);
> ++      pw_properties_setf(format->props, "format.channels", "%u",
> channels);
> ++      if (encoding =3D=3D ENCODING_AAC || encoding =3D=3D ENCODING_AAC_=
ADTS) {
> ++              pw_properties_setf(format->props, "format.bit_rate", "%u"=
,
> bitrate);
> ++              pw_properties_set(format->props, "format.stream_format",
> ++                              encoding =3D=3D ENCODING_AAC_ADTS ? "\"ad=
ts\""
> : "\"raw\"");
> ++      }
> ++      return 0;
> ++}
> ++
> + static int do_create_playback_stream(struct client *client, uint32_t
> command, uint32_t tag, struct message *m)
> + {
> +       struct impl *impl =3D client->impl;
> +@@ -1646,7 +2067,9 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> +               muted_set =3D false,
> +               fail_on_suspend =3D false,
> +               relative_volume =3D false,
> +-              passthrough =3D false;
> ++              passthrough =3D false,
> ++              compress_offload =3D false,
> ++              compress_format_selected =3D false;
> +       struct volume volume;
> +       struct pw_properties *props =3D NULL;
> +       uint8_t n_formats =3D 0;
> +@@ -1705,6 +2128,70 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> +       }
> +       o =3D find_device(client, sink_index, sink_name, true, &is_monito=
r);
> +
> ++      if (o !=3D NULL) {
> ++              const struct pw_node_info *ninfo =3D o->info;
> ++              const struct spa_dict *sp =3D (ninfo && ninfo->props) ?
> ninfo->props : NULL;
> ++              char node_name_buf[256] =3D {0};
> ++              const char *node_name;
> ++              const char *co;
> ++              const char *_nn =3D pw_properties_get(o->props,
> PW_KEY_NODE_NAME);
> ++
> ++              if (_nn)
> ++                      snprintf(node_name_buf, sizeof(node_name_buf),
> "%s", _nn);
> ++              node_name =3D node_name_buf[0] ? node_name_buf : NULL;
> ++              co =3D sp ? spa_dict_lookup(sp, "compress.offload") : NUL=
L;
> ++              pw_log_debug("[%s] compress-offload check: node=3D%s
> ninfo=3D%p co=3D%s",
> ++                              client->name, node_name ? node_name :
> "(null)", ninfo, co ? co : "(null)");
> ++              if (co && spa_atob(co)) {
> ++                      char target_buf[256] =3D {0};
> ++                      char codec_buf[64] =3D {0};
> ++                      char rate_buf[32] =3D {0};
> ++                      char channels_buf[16] =3D {0};
> ++                      char bitrate_buf[32] =3D {0};
> ++                      const char *target;
> ++                      const char *codec;
> ++                      const char *rate_s;
> ++                      const char *channels;
> ++                      const char *bitrate;
> ++                      const char *_s;
> ++
> ++                      if ((_s =3D spa_dict_lookup(sp,
> "compress.target.object")) !=3D NULL)
> ++                              snprintf(target_buf, sizeof(target_buf),
> "%s", _s);
> ++                      if ((_s =3D spa_dict_lookup(sp, "codec.type")) !=
=3D
> NULL)
> ++                              snprintf(codec_buf, sizeof(codec_buf),
> "%s", _s);
> ++                      if ((_s =3D spa_dict_lookup(sp,
> "codec.sample_rate")) !=3D NULL)
> ++                              snprintf(rate_buf, sizeof(rate_buf), "%s"=
,
> _s);
> ++                      if ((_s =3D spa_dict_lookup(sp, "codec.channels")=
)
> !=3D NULL)
> ++                              snprintf(channels_buf,
> sizeof(channels_buf), "%s", _s);
> ++                      if ((_s =3D spa_dict_lookup(sp, "codec.bit_rate")=
)
> !=3D NULL)
> ++                              snprintf(bitrate_buf, sizeof(bitrate_buf)=
,
> "%s", _s);
> ++
> ++                      target =3D target_buf[0] ? target_buf : NULL;
> ++                      codec =3D codec_buf[0] ? codec_buf : NULL;
> ++                      rate_s =3D rate_buf[0] ? rate_buf : NULL;
> ++                      channels =3D channels_buf[0] ? channels_buf : NUL=
L;
> ++                      bitrate =3D bitrate_buf[0] ? bitrate_buf : NULL;
> ++
> ++                              pw_properties_set(props,
> "compress.offload", "true");
> ++                              if (node_name !=3D NULL)
> ++                                      pw_properties_set(props,
> "compress.forwarder.source", node_name);
> ++                              pw_properties_set(props,
> "item.node.supports-encoded-fmts", "true");
> ++                      pw_properties_set(props, PW_KEY_MEDIA_TYPE,
> "Audio");
> ++                      pw_properties_set(props, PW_KEY_MEDIA_CATEGORY,
> "Playback");
> ++                      pw_properties_set(props, PW_KEY_MEDIA_ROLE,
> "Music");
> ++                      if (codec) pw_properties_set(props, "codec.type",
> codec);
> ++                      if (rate_s) pw_properties_set(props,
> "codec.sample_rate", rate_s);
> ++                      if (channels) pw_properties_set(props,
> "codec.channels", channels);
> ++                      if (bitrate) pw_properties_set(props,
> "codec.bit_rate", bitrate);
> ++
> ++                      pw_log_info("[%s] detected compress-offload
> sink=3D%s target=3D%s codec=3D%s",
> ++                                      client->name, node_name ?
> node_name : "(null)",
> ++                                      target ? target : "(null)", codec
> ? codec : "(null)");
> ++                      pw_log_debug("[%s] compress target=3D%s - leaving
> sink_name=3D%s for virtual sink routing",
> ++                                      client->name, target ? target :
> "(null)", sink_name ? sink_name : "(null)");
> ++              }
> ++      }
> ++
> +       spa_zero(fix_ss);
> +       spa_zero(fix_map);
> +       if ((fix_format || fix_rate || fix_channels) && o !=3D NULL) {
> +@@ -1752,6 +2239,27 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> +                       goto error_protocol;
> +       }
> +
> ++      compress_offload =3D pw_properties_parse_bool(
> ++                      pw_properties_get(props, "compress.offload"));
> ++      if (!compress_offload && sink_name !=3D NULL &&
> ++          spa_streq(sink_name, "pal_speaker_compress")) {
> ++              compress_offload =3D true;
> ++              pw_properties_set(props, "compress.offload", "true");
> ++              pw_properties_set(props, "compress.forwarder.source",
> "pal_speaker_compress");
> ++              pw_properties_set(props, "compress.target.object",
> "pal_sink_speaker_compress");
> ++              pw_properties_set(props,
> "item.node.supports-encoded-fmts", "true");
> ++              if (pw_properties_get(props, "codec.type") =3D=3D NULL)
> ++                      pw_properties_set(props, "codec.type", "mp3");
> ++              if (pw_properties_get(props, "codec.sample_rate") =3D=3D =
NULL)
> ++                      pw_properties_set(props, "codec.sample_rate",
> "48000");
> ++              if (pw_properties_get(props, "codec.channels") =3D=3D NUL=
L)
> ++                      pw_properties_set(props, "codec.channels", "2");
> ++              if (pw_properties_get(props, "codec.bit_rate") =3D=3D NUL=
L)
> ++                      pw_properties_set(props, "codec.bit_rate",
> "128000");
> ++              pw_log_debug("[%s] using byte-preserving compress-offload
> path for sink=3D%s",
> ++                              client->name, sink_name);
> ++      }
> ++
> +       if (client->version >=3D 21) {
> +               if (message_get(m,
> +                               TAG_U8, &n_formats,
> +@@ -1769,7 +2277,12 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> +                                               TAG_INVALID) < 0)
> +                                       goto error_protocol;
> +
> +-                              if (n_params < MAX_FORMATS &&
> ++                              if (compress_offload) {
> ++                                      log_format_info(impl,
> SPA_LOG_LEVEL_DEBUG, &format);
> ++                                      if (!compress_format_selected &&
> ++
> set_compress_offload_props_from_format(props, &format) =3D=3D 0)
> ++                                              compress_format_selected =
=3D
> true;
> ++                              } else if (n_params < MAX_FORMATS &&
> +                                   (params[n_params] =3D
> format_info_build_param(&b,
> +                                               SPA_PARAM_EnumFormat,
> &format, &r)) !=3D NULL) {
> +                                       n_params++;
> +@@ -1783,7 +2296,26 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> +                       }
> +               }
> +       }
> +-      if (sample_spec_valid(&ss)) {
> ++      if (compress_offload) {
> ++              uint32_t compress_rate =3D 0;
> ++              if (n_params < MAX_FORMATS &&
> ++                  (params[n_params] =3D build_compress_offload_format(&=
b,
> ++                                      SPA_PARAM_EnumFormat, props,
> &compress_rate)) !=3D NULL) {
> ++                      n_params++;
> ++                      n_valid_formats++;
> ++                      ss_rate =3D rate =3D compress_rate;
> ++                      synthesize_compress_offload_spec(&ss, &map, props=
);
> ++                      pw_log_debug("[%s] synthesized compress-offload
> format codec=3D%s rate=3D%u channels=3D%u",
> ++                                      client->name,
> pw_properties_get(props, "codec.type"), compress_rate,
> ++                                      pw_properties_get_uint32(props,
> "codec.channels", 2));
> ++              } else {
> ++                      pw_log_warn("%p: unsupported compress codec:%s",
> ++                                      impl, pw_properties_get(props,
> "codec.type"));
> ++              }
> ++              compress_offload_forwarder_update(
> ++                              pw_properties_get(props,
> "compress.forwarder.source"),
> ++                              &props->dict);
> ++      } else if (sample_spec_valid(&ss)) {
> +               struct sample_spec sfix =3D ss;
> +               struct channel_map mfix =3D map;
> +
> +@@ -1807,6 +2339,8 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> +       if (m->offset !=3D m->length)
> +               goto error_protocol;
> +
> ++      pw_log_debug("[%s] format check: n_valid=3D%u n_params=3D%u
> compress=3D%d passthrough=3D%d",
> ++                      client->name, n_valid_formats, n_params,
> compress_offload, passthrough);
> +       if (n_valid_formats =3D=3D 0)
> +               goto error_no_formats;
> +
> +@@ -1816,6 +2350,16 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> +       stream =3D stream_new(client, STREAM_TYPE_PLAYBACK, tag, &ss, &ma=
p,
> &attr);
> +       if (stream =3D=3D NULL)
> +               goto error_errno;
> ++      stream->compress_offload =3D compress_offload;
> ++      if (compress_offload) {
> ++              const char *forwarder_source =3D
> ++                              pw_properties_get(props,
> "compress.forwarder.source");
> ++
> ++              if (forwarder_source !=3D NULL)
> ++                      spa_scnprintf(stream->compress_forwarder_source,
> ++
> sizeof(stream->compress_forwarder_source), "%s",
> ++                                      forwarder_source);
> ++      }
> +
> +       stream->corked =3D corked;
> +       stream->is_paused =3D corked;
> +@@ -1835,6 +2379,11 @@ static int do_create_playback_stream(struct clien=
t
> *client, uint32_t command, ui
> +       if (rate !=3D 0) {
> +               struct spa_fraction lat;
> +               fix_playback_buffer_attr(stream, &attr, ss_rate, &lat);
> ++              if (compress_offload) {
> ++                      attr.prebuf =3D 0;
> ++                      pw_log_debug("[%s] compress-offload uses immediat=
e
> playback prebuf=3D0",
> ++                                      client->name);
> ++              }
> +               pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", rate)=
;
> +               pw_properties_setf(props, PW_KEY_NODE_LATENCY, "%u/%u",
> +                               lat.num, lat.denom);
> +@@ -1844,6 +2393,8 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> +       flags =3D 0;
> +       if (no_move)
> +               flags |=3D PW_STREAM_FLAG_DONT_RECONNECT;
> ++      if (compress_offload)
> ++              flags |=3D PW_STREAM_FLAG_NO_CONVERT;
> +       if (corked)
> +               flags |=3D PW_STREAM_FLAG_INACTIVE;
> +
> +@@ -1875,14 +2426,35 @@ static int do_create_playback_stream(struct
> client *client, uint32_t command, ui
> +                       &stream->stream_listener,
> +                       &stream_events, stream);
> +
> +-      pw_stream_connect(stream->stream,
> +-                      PW_DIRECTION_OUTPUT,
> +-                      SPA_ID_INVALID,
> +-                      flags |
> +-                      PW_STREAM_FLAG_AUTOCONNECT |
> +-                      PW_STREAM_FLAG_RT_PROCESS |
> +-                      PW_STREAM_FLAG_MAP_BUFFERS,
> +-                      params, n_params);
> ++      if (compress_offload) {
> ++              uint8_t raw_buf[256];
> ++              struct spa_pod_builder rb =3D SPA_POD_BUILDER_INIT(raw_bu=
f,
> sizeof(raw_buf));
> ++              struct spa_audio_info_raw raw_info =3D {
> ++                      .format =3D SPA_AUDIO_FORMAT_S16_LE,
> ++                      .rate =3D ss.rate ? ss.rate : 44100,
> ++                      .channels =3D ss.channels ? ss.channels : 2,
> ++              };
> ++              const struct spa_pod *raw_params[1];
> ++              raw_params[0] =3D spa_format_audio_raw_build(&rb,
> SPA_PARAM_EnumFormat, &raw_info);
> ++              pw_log_debug("[%s] pw_stream_connect: using raw S16LE
> param for compress sink", client->name);
> ++              pw_stream_connect(stream->stream,
> ++                              PW_DIRECTION_OUTPUT,
> ++                              SPA_ID_INVALID,
> ++                              flags |
> ++                              PW_STREAM_FLAG_AUTOCONNECT |
> ++                              PW_STREAM_FLAG_RT_PROCESS |
> ++                              PW_STREAM_FLAG_MAP_BUFFERS,
> ++                              raw_params, 1);
> ++      } else {
> ++              pw_stream_connect(stream->stream,
> ++                              PW_DIRECTION_OUTPUT,
> ++                              SPA_ID_INVALID,
> ++                              flags |
> ++                              PW_STREAM_FLAG_AUTOCONNECT |
> ++                              PW_STREAM_FLAG_RT_PROCESS |
> ++                              PW_STREAM_FLAG_MAP_BUFFERS,
> ++                              params, n_params);
> ++      }
> +
> +       stream_update_tag_param(stream);
> +
> +@@ -3927,9 +4499,50 @@ static int fill_sink_info(struct client *client,
> struct message *m,
> +       }
> +       if (client->version >=3D 21) {
> +               struct pw_manager_param *p;
> +-              struct format_info info[32];
> ++              struct format_info formats[32];
> +               uint32_t i, n_info =3D 0;
> +               struct spa_list *param_list =3D
> pw_manager_object_get_param_list(o);
> ++              bool compress_offload =3D pw_properties_parse_bool(
> ++                              spa_dict_lookup(info->props,
> "compress.offload"));
> ++              uint32_t compress_rate =3D 48000, compress_channels =3D 2=
,
> compress_bitrate =3D 128000;
> ++
> ++              if (compress_offload) {
> ++                      const char *str;
> ++
> ++                      if ((str =3D spa_dict_lookup(info->props,
> "codec.sample_rate")) !=3D NULL)
> ++                              compress_rate =3D (uint32_t)atoi(str);
> ++                      if ((str =3D spa_dict_lookup(info->props,
> "codec.channels")) !=3D NULL)
> ++                              compress_channels =3D (uint32_t)atoi(str)=
;
> ++                      if ((str =3D spa_dict_lookup(info->props,
> "codec.bit_rate")) !=3D NULL)
> ++                              compress_bitrate =3D (uint32_t)atoi(str);
> ++                      if (compress_rate =3D=3D 0)
> ++                              compress_rate =3D 48000;
> ++                      if (compress_channels =3D=3D 0)
> ++                              compress_channels =3D 2;
> ++                      if (compress_bitrate =3D=3D 0)
> ++                              compress_bitrate =3D 128000;
> ++                      if (n_info < SPA_N_ELEMENTS(formats) &&
> ++                          init_compress_format_info(&formats[n_info],
> ENCODING_MP3,
> ++                                      compress_rate, compress_channels,
> compress_bitrate) =3D=3D 0)
> ++                              n_info++;
> ++                      if (n_info < SPA_N_ELEMENTS(formats) &&
> ++                          init_compress_format_info(&formats[n_info],
> ENCODING_AAC_ADTS,
> ++                                      compress_rate, compress_channels,
> compress_bitrate) =3D=3D 0)
> ++                              n_info++;
> ++                      if (n_info < SPA_N_ELEMENTS(formats) &&
> ++                          init_compress_format_info(&formats[n_info],
> ENCODING_AAC,
> ++                                      48000, 2, compress_bitrate) =3D=
=3D 0)
> ++                              n_info++;
> ++                      if (n_info < SPA_N_ELEMENTS(formats) &&
> ++                          init_compress_format_info(&formats[n_info],
> ENCODING_AAC,
> ++                                      16000, 1, compress_bitrate) =3D=
=3D 0)
> ++                              n_info++;
> ++                      if (n_info < SPA_N_ELEMENTS(formats) &&
> ++                          init_compress_format_info(&formats[n_info],
> ENCODING_AAC,
> ++                                      12000, 1, compress_bitrate) =3D=
=3D 0)
> ++                              n_info++;
> ++                      goto send_formats;
> ++              }
> +
> +               spa_list_for_each(p, param_list, link) {
> +                       uint32_t index =3D 0;
> +@@ -3937,26 +4550,27 @@ static int fill_sink_info(struct client *client,
> struct message *m,
> +                       if (p->id !=3D SPA_PARAM_EnumFormat)
> +                               continue;
> +
> +-                      while (n_info < SPA_N_ELEMENTS(info)) {
> +-                              spa_zero(info[n_info]);
> +-                              if (format_info_from_param(&info[n_info],
> p->param, index++) < 0)
> ++                      while (n_info < SPA_N_ELEMENTS(formats)) {
> ++                              spa_zero(formats[n_info]);
> ++                              if
> (format_info_from_param(&formats[n_info], p->param, index++) < 0)
> +                                       break;
> +-                              if (info[n_info].encoding =3D=3D ENCODING=
_ANY
> ||
> +-                                  (info[n_info].encoding =3D=3D ENCODIN=
G_PCM
> && info[n_info].props !=3D NULL)) {
> +-                                      format_info_clear(&info[n_info]);
> ++                              if (formats[n_info].encoding =3D=3D
> ENCODING_ANY ||
> ++                                  (formats[n_info].encoding =3D=3D
> ENCODING_PCM && formats[n_info].props !=3D NULL)) {
> ++
> format_info_clear(&formats[n_info]);
> +                                       continue;
> +                               }
> +                               n_info++;
> +                       }
> +               }
> ++      send_formats:
> +               message_put(m,
> +                       TAG_U8, n_info,                         /*
> n_formats */
> +                       TAG_INVALID);
> +               for (i =3D 0; i < n_info; i++) {
> +                       message_put(m,
> +-                              TAG_FORMAT_INFO, &info[i],
> ++                              TAG_FORMAT_INFO, &formats[i],
> +                               TAG_INVALID);
> +-                      format_info_clear(&info[i]);
> ++                      format_info_clear(&formats[i]);
> +               }
> +       }
> +       return 0;
> +diff --git a/src/modules/module-protocol-pulse/server.c
> b/src/modules/module-protocol-pulse/server.c
> +index c00ea8e55..ae8091403 100644
> +--- a/src/modules/module-protocol-pulse/server.c
> ++++ b/src/modules/module-protocol-pulse/server.c
> +@@ -33,6 +33,7 @@
> + #include "commands.h"
> + #include "defs.h"
> + #include "internal.h"
> ++#include "modules/pulse-module-compress-offload-forwarder.h"
> + #include "log.h"
> + #include "message.h"
> + #include "reply.h"
> +@@ -113,9 +114,13 @@ static int handle_memblock(struct client *client,
> struct message *msg)
> + {
> +       struct stream *stream;
> +       uint32_t channel, flags, index;
> ++      uint32_t transport_size;
> +       int64_t offset, diff;
> +       int32_t filled;
> +       int res =3D 0;
> ++      bool frame_raw_aac;
> ++      const char *compress_offload;
> ++      uint8_t raw_aac_header[COMPRESS_RAW_AAC_HEADER_SIZE];
> +
> +       channel =3D ntohl(client->desc.channel);
> +       offset =3D (int64_t) (
> +@@ -133,6 +138,25 @@ static int handle_memblock(struct client *client,
> struct message *msg)
> +                           client, client->name, channel);
> +               goto finish;
> +       }
> ++      compress_offload =3D stream->props !=3D NULL ?
> ++                      pw_properties_get(stream->props,
> "compress.offload") : NULL;
> ++      frame_raw_aac =3D compress_offload !=3D NULL &&
> spa_atob(compress_offload);
> ++      transport_size =3D msg->length;
> ++      if (frame_raw_aac) {
> ++              if (msg->length > UINT32_MAX -
> COMPRESS_RAW_AAC_HEADER_SIZE) {
> ++                      res =3D -EOVERFLOW;
> ++                      goto finish;
> ++              }
> ++              transport_size +=3D COMPRESS_RAW_AAC_HEADER_SIZE;
> ++              raw_aac_header[0] =3D COMPRESS_RAW_AAC_MAGIC_0;
> ++              raw_aac_header[1] =3D COMPRESS_RAW_AAC_MAGIC_1;
> ++              raw_aac_header[2] =3D COMPRESS_RAW_AAC_MAGIC_2;
> ++              raw_aac_header[3] =3D COMPRESS_RAW_AAC_MAGIC_3;
> ++              raw_aac_header[4] =3D msg->length & 0xff;
> ++              raw_aac_header[5] =3D (msg->length >> 8) & 0xff;
> ++              raw_aac_header[6] =3D (msg->length >> 16) & 0xff;
> ++              raw_aac_header[7] =3D (msg->length >> 24) & 0xff;
> ++      }
> +
> +       filled =3D spa_ringbuffer_get_write_index(&stream->ring, &index);
> +       pw_log_trace("new block %p %p/%u filled:%d index:%d flags:%02x
> offset:%" PRIu64,
> +@@ -173,13 +197,22 @@ static int handle_memblock(struct client *client,
> struct message *msg)
> +
> +       if (filled < 0) {
> +               /* underrun, reported on reader side */
> +-      } else if (filled + msg->length > stream->attr.maxlength) {
> ++      } else if (filled + transport_size > stream->attr.maxlength) {
> +               /* overrun */
> +               stream_send_overflow(stream);
> +       }
> +
> +       /* always write data to ringbuffer, we expect the other side
> +        * to recover */
> ++      if (frame_raw_aac) {
> ++              spa_ringbuffer_write_data(&stream->ring,
> ++                              stream->buffer, stream->bufsize,
> ++                              index % stream->bufsize,
> ++                              raw_aac_header, sizeof(raw_aac_header));
> ++              index +=3D sizeof(raw_aac_header);
> ++              pw_log_debug("client %p [%s]: framed raw AAC access unit
> size=3D%u",
> ++                              client, client->name, msg->length);
> ++      }
> +       spa_ringbuffer_write_data(&stream->ring,
> +                       stream->buffer, stream->bufsize,
> +                       index % stream->bufsize,
> +diff --git a/src/modules/module-protocol-pulse/stream.c
> b/src/modules/module-protocol-pulse/stream.c
> +index 4b223b878..484a12a05 100644
> +--- a/src/modules/module-protocol-pulse/stream.c
> ++++ b/src/modules/module-protocol-pulse/stream.c
> +@@ -24,6 +24,7 @@
> + #include "internal.h"
> + #include "log.h"
> + #include "message.h"
> ++#include "modules/pulse-module-compress-offload-forwarder.h"
> + #include "reply.h"
> + #include "stream.h"
> +
> +@@ -148,6 +149,10 @@ void stream_free(struct stream *stream)
> +       if (stream->killed)
> +               stream_send_killed(stream);
> +
> ++      if (stream->type =3D=3D STREAM_TYPE_PLAYBACK &&
> stream->compress_offload)
> ++              compress_offload_forwarder_teardown(
> ++                              stream->compress_forwarder_source);
> ++
> +       if (stream->stream) {
> +               spa_hook_remove(&stream->stream_listener);
> +               pw_stream_disconnect(stream->stream);
> +diff --git a/src/modules/module-protocol-pulse/stream.h
> b/src/modules/module-protocol-pulse/stream.h
> +index 8e1fe178c..d2ff2edaa 100644
> +--- a/src/modules/module-protocol-pulse/stream.h
> ++++ b/src/modules/module-protocol-pulse/stream.h
> +@@ -87,6 +87,7 @@ struct stream {
> +       uint32_t frame_size;
> +       uint32_t rate;
> +       uint64_t lat_usec;
> ++      char compress_forwarder_source[128];
> +
> +       struct volume volume;
> +       bool muted;
> +@@ -107,6 +108,7 @@ struct stream {
> +       unsigned int fail_on_suspend:1;
> +       unsigned int is_suspended:1;
> +       unsigned int dont_inhibit_auto_suspend:1;
> ++      unsigned int compress_offload:1;
> + };
> +
> + struct stream *stream_new(struct client *client, enum stream_type type,
> uint32_t create_tag,
> +--
> +Gitlab
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131433):
> https://lists.openembedded.org/g/openembedded-devel/message/131433
> Mute This Topic: https://lists.openembedded.org/mt/121939506/10043485
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009cb305065ebbe57c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Harsh</div><div><br></div><div>It seem=
s that this patch is incomplete.</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 26, 2026 =
at 10:28=E2=80=AFAM Harsh Rai via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;harsh.rai=3D<a href=3D"mailto:oss.qualcomm.=
com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add a Pi=
peWire Pulse virtual sink and forwarder for compressed offload, enabling co=
mpressed Pulse streams to be routed to a PAL compressed sink.<br>
[New changes added]<br></blockquote><div><br>Something is missing here, and=
 please don&#39;t use very long lines on the commit message.<br>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" =
target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0.../0001-pipewire-compress-offload.patch=C2=A0 =C2=A0 =C2=A0 | 4028 +=
++++++++++------<br>
=C2=A01 file changed, 2685 insertions(+), 1343 deletions(-)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipe=
wire-compress-offload.patch b/meta-multimedia/recipes-multimedia/pipewire/p=
ipewire/0001-pipewire-compress-offload.patch<br>
index 8a884d64cd..653f6c3268 100644<br>
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-co=
mpress-offload.patch<br>
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-co=
mpress-offload.patch<br>
@@ -1,1343 +1,2685 @@<br>
-From 345e4b033c2ff69ab7aa02a123f6041b878f7fb9 Mon Sep 17 00:00:00 2001<br>
-From: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" target=
=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
-Date: Tue, 16 Jun 2026 19:21:37 +0530<br>
-Subject: [PATCH] pulse: enable MP3 compressed offload via Pulse<br>
-<br>
-Add PipeWire Pulse virtual sink and forwarder for offload.<br>
-Route compressed Pulse streams to PAL compressed sink.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/pipe=
wire/pipewire/-/merge_requests/2878" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878</a>]<=
br></blockquote><div><br></div><div>=C2=A0All headers have been removed her=
e.<br><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
-<br>
-Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com"=
 target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
----<br>
- src/modules/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
- .../module-compress-offload-forwarder.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 649 +=
+++++++++++++++++<br>
- .../modules/module-compress-offload-sink.c=C2=A0 =C2=A0 | 293 ++++++++<br=
>
- .../module-protocol-pulse/pulse-server.c=C2=A0 =C2=A0 =C2=A0 | 254 ++++++=
-<br>
- 4 files changed, 1187 insertions(+), 11 deletions(-)<br>
- create mode 100644 src/modules/module-protocol-pulse/modules/module-compr=
ess-offload-forwarder.c<br>
- create mode 100644 src/modules/module-protocol-pulse/modules/module-compr=
ess-offload-sink.c<br>
-<br>
-diff --git a/src/modules/meson.build b/src/modules/meson.build<br>
-index 59f46ae..900871d 100644<br>
---- a/src/modules/meson.build<br>
-+++ b/src/modules/meson.build<br>
-@@ -324,6 +324,8 @@ pipewire_module_protocol_pulse_sources =3D [<br>
-=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-alsa-source.c&#39;,=
<br>
-=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-always-sink.c&#39;,=
<br>
-=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-combine-sink.c&#39;=
,<br>
-+=C2=A0 &#39;module-protocol-pulse/modules/module-compress-offload-sink.c&=
#39;,<br>
-+=C2=A0 &#39;module-protocol-pulse/modules/module-compress-offload-forward=
er.c&#39;,<br>
-=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-device-manager.c&#3=
9;,<br>
-=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-device-restore.c&#3=
9;,<br>
-=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-echo-cancel.c&#39;,=
<br>
-diff --git a/src/modules/module-protocol-pulse/modules/module-compress-off=
load-forwarder.c b/src/modules/module-protocol-pulse/modules/module-compres=
s-offload-forwarder.c<br>
-new file mode 100644<br>
-index 0000000..33054e4<br>
---- /dev/null<br>
-+++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-fo=
rwarder.c<br>
-@@ -0,0 +1,649 @@<br>
-+/* PipeWire */<br>
-+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */<=
br>
-+/* SPDX-License-Identifier: BSD-3-Clause-Clear */<br>
-+<br>
-+#include &lt;errno.h&gt;<br>
-+#include &lt;limits.h&gt;<br>
-+#include &lt;stdint.h&gt;<br>
-+#include &lt;stdlib.h&gt;<br>
-+#include &lt;string.h&gt;<br>
-+<br>
-+#include &lt;spa/param/audio/compressed.h&gt;<br>
-+#include &lt;spa/param/audio/format-utils.h&gt;<br>
-+#include &lt;spa/param/audio/raw.h&gt;<br>
-+#include &lt;spa/utils/result.h&gt;<br>
-+#include &lt;spa/utils/string.h&gt;<br>
-+#include &lt;pipewire/pipewire.h&gt;<br>
-+<br>
-+#include &quot;../module.h&quot;<br>
-+<br>
-+#define NAME &quot;compress-offload-forwarder&quot;<br>
-+<br>
-+#define DEFAULT_CODEC &quot;mp3&quot;<br>
-+#define DEFAULT_RATE 48000u<br>
-+#define DEFAULT_CHANNELS 2u<br>
-+#define DEFAULT_BITRATE 128000u<br>
-+#define DEFAULT_BLOCK_SIZE (16u * 1024u)<br>
-+<br>
-+static const char *const forwarder_options =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;source_sink=3D&lt;Pulse-visible compress sink =
<a href=3D"http://node.name" rel=3D"noreferrer" target=3D"_blank">node.name=
</a>&gt; &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;target_sink=3D&lt;PAL compress sink <a href=3D=
"http://node.name" rel=3D"noreferrer" target=3D"_blank">node.name</a>&gt; &=
quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;codec=3D&lt;codec name, default mp3&gt; &quot;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;rate=3D&lt;sample rate, default 48000&gt; &quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;channels=3D&lt;number of channels, default 2&g=
t; &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;bitrate=3D&lt;bit rate, default 128000&gt; &qu=
ot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;block_size=3D&lt;buffer size in bytes, default=
 16384&gt;&quot;;<br>
-+<br>
-+PW_LOG_TOPIC_STATIC(mod_topic, &quot;mod.&quot; NAME);<br>
-+#define PW_LOG_TOPIC_DEFAULT mod_topic<br>
-+<br>
-+struct forwarder_data {<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_core *core;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_loop *loop;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_source *activate_event;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_hook core_listener;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_registry *registry;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_hook registry_listener;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_stream *capture;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_hook capture_listener;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_stream *playback;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_hook playback_listener;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 char source_name[256];<br>
-+=C2=A0 =C2=A0 =C2=A0 char monitor_name[280];<br>
-+=C2=A0 =C2=A0 =C2=A0 char target_name[256];<br>
-+=C2=A0 =C2=A0 =C2=A0 char codec[32];<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t bitrate;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t block_size;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t target_id;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t *pending_data;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t pending_size;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t pending_offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t capture_streaming:1;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t logged_first_buffer:1;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t logged_first_output_buffer:1;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t logged_silence_buffer:1;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t activate_pending:1;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t playback_active:1;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t playback_failed:1;<br>
-+};<br>
-+<br>
-+static int create_playback_stream(struct forwarder_data *d);<br>
-+static void set_playback_active(struct forwarder_data *d, bool active);<b=
r>
-+static void maybe_create_playback_stream(struct forwarder_data *d, const =
char *reason);<br>
-+<br>
-+static void request_playback_activation(struct forwarder_data *d)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;activate_event =3D=3D NULL || d-&gt;activa=
te_pending)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;activate_pending =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_loop_signal_event(d-&gt;loop, d-&gt;activate_even=
t);<br>
-+}<br>
-+<br>
-+static void playback_activate_event(void *data, uint64_t count)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;activate_pending =3D false;<br>
-+=C2=A0 =C2=A0 =C2=A0 maybe_create_playback_stream(d, &quot;first-audio-bu=
ffer&quot;);<br>
-+}<br>
-+<br>
-+static bool buffer_is_zeroed(const void *data, uint32_t size)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 const uint8_t *bytes =3D data;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t index;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 for (index =3D 0; index &lt; size; index++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes[index] !=3D 0)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return false;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+}<br>
-+<br>
-+static void clear_pending_data(struct forwarder_data *d)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 free(d-&gt;pending_data);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_data =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_size =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_offset =3D 0;<br>
-+}<br>
-+<br>
-+static void compact_pending_data(struct forwarder_data *d)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t remaining;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_offset =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_offset &gt;=3D d-&gt;pending_size)=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 remaining =3D d-&gt;pending_size - d-&gt;pending_off=
set;<br>
-+=C2=A0 =C2=A0 =C2=A0 memmove(d-&gt;pending_data, d-&gt;pending_data + d-&=
gt;pending_offset, remaining);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_size =3D remaining;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_offset =3D 0;<br>
-+}<br>
-+<br>
-+static int append_pending_data(struct forwarder_data *d, const void *data=
, uint32_t size)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t *pending_data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 compact_pending_data(d);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_size &gt; UINT32_MAX - size)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EOVERFLOW;<br>
-+=C2=A0 =C2=A0 =C2=A0 pending_data =3D realloc(d-&gt;pending_data, d-&gt;p=
ending_size + size);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (pending_data =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_data =3D pending_data;<br>
-+=C2=A0 =C2=A0 =C2=A0 memcpy(d-&gt;pending_data + d-&gt;pending_size, data=
, size);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_size +=3D size;<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static void maybe_create_playback_stream(struct forwarder_data *d, const =
char *reason)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 int res;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;capture_streaming)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, t=
rue);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;target_id =3D=3D PW_ID_ANY) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder target:%s not resolved yet, defer output create (%s)&quot;,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_name, reason);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 res =3D create_playback_stream(d);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder target:%s create failed (%s): %s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_name, reason, spa_strerror(res=
));<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, t=
rue);<br>
-+}<br>
-+<br>
-+static void destroy_playback_stream(struct forwarder_data *d)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&gt;playback_listener);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(d-&gt;playback);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;playback =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_active =3D false;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_failed =3D false;<br>
-+}<br>
-+<br>
-+static const struct spa_pod *build_raw_format(struct forwarder_data *d,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder *=
builder, uint32_t id)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info_raw info;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_zero(info);<br>
-+=C2=A0 =C2=A0 =C2=A0 info.format =3D SPA_AUDIO_FORMAT_S16_LE;<br>
-+=C2=A0 =C2=A0 =C2=A0 info.rate =3D d-&gt;rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 info.channels =3D d-&gt;channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (info.channels =3D=3D 1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.position[0] =3D SPA=
_AUDIO_CHANNEL_MONO;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.channels =3D 2;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.position[0] =3D SPA=
_AUDIO_CHANNEL_FL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.position[1] =3D SPA=
_AUDIO_CHANNEL_FR;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return spa_format_audio_raw_build(builder, id, &amp;=
info);<br>
-+}<br>
-+<br>
-+static const struct spa_pod *build_encoded_format(struct forwarder_data *=
d,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder *=
builder, uint32_t id)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info info;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_zero(info);<br>
-+=C2=A0 =C2=A0 =C2=A0 info.media_type =3D SPA_MEDIA_TYPE_audio;<br>
-+=C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;<br>
-+=C2=A0 =C2=A0 =C2=A0 info.info.mp3.rate =3D d-&gt;rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 info.info.mp3.channels =3D d-&gt;channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 info.info.mp3.channel_mode =3D d-&gt;channels =3D=3D=
 1 ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_AUDIO_MP3_CHANNEL_MO=
DE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return spa_format_audio_build(builder, id, &amp;info=
);<br>
-+}<br>
-+<br>
-+static void playback_state_changed(void *data, enum pw_stream_state old,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum pw_stream_state sta=
te, const char *error)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder target:%s stat=
e %d -&gt; %d%s%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;target_name, old, state, error ? &quot;: &quot; : &quot;&quot;, e=
rror ? error : &quot;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (state =3D=3D PW_STREAM_STATE_ERROR)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;playback_failed =
=3D true;<br>
-+}<br>
-+<br>
-+static void set_playback_active(struct forwarder_data *d, bool active)<br=
>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL || d-&gt;playback_act=
ive =3D=3D active)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder target:%s acti=
ve=3D%d&quot;, d-&gt;target_name, active);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_set_active(d-&gt;playback, active);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_active =3D active;<br>
-+}<br>
-+<br>
-+static void capture_state_changed(void *data, enum pw_stream_state old,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum pw_stream_state sta=
te, const char *error)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder source:%s stat=
e %d -&gt; %d%s%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;monitor_name, old, state, error ? &quot;: &quot; : &quot;&quot;, =
error ? error : &quot;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback_failed)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;capture_streaming =3D state =3D=3D PW_STREAM_S=
TATE_STREAMING;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (state =3D=3D PW_STREAM_STATE_PAUSED || state =3D=
=3D PW_STREAM_STATE_ERROR)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, f=
alse);<br>
-+}<br>
-+<br>
-+static void capture_process(void *data)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_buffer *in_buf, *out_buf;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_data *in_data, *out_data;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t in_offset, in_size, out_size, copy_size;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 const void *input_data;<br>
-+=C2=A0 =C2=A0 =C2=A0 const void *copy_data;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t copy_available;<br>
-+=C2=A0 =C2=A0 =C2=A0 int res;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 in_buf =3D pw_stream_dequeue_buffer(d-&gt;capture);<=
br>
-+=C2=A0 =C2=A0 =C2=A0 if (in_buf =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 in_data =3D &amp;in_buf-&gt;buffer-&gt;datas[0];<br>
-+=C2=A0 =C2=A0 =C2=A0 if (in_data-&gt;data =3D=3D NULL || in_data-&gt;chun=
k =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 in_offset =3D SPA_MIN(in_data-&gt;chunk-&gt;offset, =
in_data-&gt;maxsize);<br>
-+=C2=A0 =C2=A0 =C2=A0 in_size =3D SPA_MIN(in_data-&gt;chunk-&gt;size, in_d=
ata-&gt;maxsize - in_offset);<br>
-+=C2=A0 =C2=A0 =C2=A0 input_data =3D SPA_PTROFF(in_data-&gt;data, in_offse=
t, void);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (in_size =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (buffer_is_zeroed(input_data, in_size)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!d-&gt;logged_silenc=
e_buffer) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;compress-forwarder source:%s ignoring zeroed startup=
 buffer size=3D%u flags=3D0x%x&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_n=
ame, in_size, in_data-&gt;chunk-&gt;flags);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;logged_silence_buffer =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;logged_first_buffer) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *bytes =3D=
 SPA_PTROFF(in_data-&gt;data, in_offset, const uint8_t);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s first non-silence buffer size=3D%u offset=3D%u flag=
s=3D0x%x&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, in_size, in_offset, in_=
data-&gt;chunk-&gt;flags);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s first non-silence bytes=3D%02x %02x %02x %02x %02x =
%02x %02x %02x&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 0 ? bytes[0] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 1 ? bytes[1] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 2 ? bytes[2] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 3 ? bytes[3] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 4 ? bytes[4] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 5 ? bytes[5] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 6 ? bytes[6] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 7 ? bytes[7] : 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;logged_first_buffe=
r =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback_failed)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 res =3D append_pending_data(d, input_data, in_size);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder source:%s failed to preserve input before target write: %s&qu=
ot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, spa_strerror(res));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 request_playback_activat=
ion(d);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=
=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;compress-forwarder source:%s preserved %u bytes pend=
ing target create total=3D%u&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_n=
ame, in_size, d-&gt;pending_size - d-&gt;pending_offset);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_stream_queue_buffer(d-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;playback_active)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, t=
rue);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback_failed || !d-&gt;playback_active)=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s preserved %u bytes pending inactive target total=3D=
%u&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, in_size, d-&gt;pending_=
size - d-&gt;pending_offset);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 out_buf =3D pw_stream_dequeue_buffer(d-&gt;playback)=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (out_buf =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s preserved %u bytes pending output buffer total=3D%u=
&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, in_size, d-&gt;pending_=
size - d-&gt;pending_offset);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 out_data =3D &amp;out_buf-&gt;buffer-&gt;datas[0];<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 if (out_data-&gt;data =3D=3D NULL || out_data-&gt;ch=
unk =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;playback, out_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 out_size =3D out_data-&gt;maxsize;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (out_size =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;playback, out_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 copy_data =3D d-&gt;pending_data + d-&gt;pending_off=
set;<br>
-+=C2=A0 =C2=A0 =C2=A0 copy_available =3D d-&gt;pending_size - d-&gt;pendin=
g_offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 copy_size =3D SPA_MIN(copy_available, out_size);<br>
-+=C2=A0 =C2=A0 =C2=A0 memcpy(out_data-&gt;data, copy_data, copy_size);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_offset +=3D copy_size;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_offset &gt;=3D d-&gt;pending_size)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<b=
r>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;offset =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;size =3D copy_size;<br>
-+=C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;stride =3D 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 out_buf-&gt;size =3D copy_size;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;logged_first_output_buffer) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *out_bytes=
 =3D out_data-&gt;data;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder target:%s queue buffer copy_size=3D%u out_max=3D%u chunk=3D%u=
/%u/%d bytes=3D%02x %02x %02x %02x %02x %02x %02x %02x&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_name, copy_size, out_data-&gt;=
maxsize,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;offset, out_data-&gt=
;chunk-&gt;size,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;stride,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 0 ? out_bytes[0] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 1 ? out_bytes[1] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 2 ? out_bytes[2] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 3 ? out_bytes[3] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 4 ? out_bytes[4] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 5 ? out_bytes[5] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 6 ? out_bytes[6] : 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 7 ? out_bytes[7] : 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;logged_first_outpu=
t_buffer =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d-&gt;playback, out_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d-&gt;capture, in_buf);<br>
-+}<br>
-+<br>
-+static const struct pw_stream_events capture_events =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
-+=C2=A0 =C2=A0 =C2=A0 .state_changed =3D capture_state_changed,<br>
-+=C2=A0 =C2=A0 =C2=A0 .process =3D capture_process,<br>
-+};<br>
-+<br>
-+static const struct pw_stream_events playback_events =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
-+=C2=A0 =C2=A0 =C2=A0 .state_changed =3D playback_state_changed,<br>
-+};<br>
-+<br>
-+static void registry_global(void *data, uint32_t id, uint32_t permissions=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *type, uint32=
_t version, const struct spa_dict *props)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *name;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || prop=
s =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 name =3D spa_dict_lookup(props, PW_KEY_NODE_NAME);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 if (!spa_streq(name, d-&gt;target_name))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D id;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder target:%s resol=
ved id=3D%u&quot;, d-&gt;target_name, id);<br>
-+}<br>
-+<br>
-+static void registry_global_remove(void *data, uint32_t id)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (id !=3D d-&gt;target_id)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder target:%s remov=
ed id=3D%u&quot;, d-&gt;target_name, id);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D PW_ID_ANY;<br>
-+=C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(d);<br>
-+}<br>
-+<br>
-+static const struct pw_registry_events registry_events =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_VERSION_REGISTRY_EVENTS,<br>
-+=C2=A0 =C2=A0 =C2=A0 .global =3D registry_global,<br>
-+=C2=A0 =C2=A0 =C2=A0 .global_remove =3D registry_global_remove,<br>
-+};<br>
-+<br>
-+static int create_playback_stream(struct forwarder_data *d)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_properties *props;<br>
-+=C2=A0 =C2=A0 =C2=A0 const struct spa_pod *params[2];<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t buffer[1024];<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder builder;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t n_params =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 int res;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 props =3D pw_properties_new(PW_KEY_MEDIA_CLASS, &quo=
t;Stream/Output/Audio&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_NAME, &quot;compress-offload-forwarder-output&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_MEDIA_TYPE, &quot;Audio&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_MEDIA_CATEGORY, &quot;Playback&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_MEDIA_ROLE, &quot;Music&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_TARGET_OBJECT, d-&gt;target_name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_AUTOCONNECT, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_STREAM_DONT_REMIX, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;node.dont-reconnect&quot;, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_RATE, &quot;1/48000&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;compress.offload&quot;, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;codec.type&quot;, d-&gt;codec,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (props =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.sample_rate&qu=
ot;, &quot;%u&quot;, d-&gt;rate);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.channels&quot;=
, &quot;%u&quot;, d-&gt;channels);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.bit_rate&quot;=
, &quot;%u&quot;, d-&gt;bitrate);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_NODE_RATE, &quot;1/=
%u&quot;, d-&gt;rate);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;playback =3D pw_stream_new(d-&gt;core, &quot;c=
ompress offload forwarder output&quot;, props);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(d-&gt;playback, &amp;d-&gt;pl=
ayback_listener, &amp;playback_events, d);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_pod_builder_init(&amp;builder, buffer, sizeof(bu=
ffer));<br>
-+=C2=A0 =C2=A0 =C2=A0 params[n_params++] =3D build_encoded_format(d, &amp;=
builder, SPA_PARAM_EnumFormat);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder target:%s conn=
ect target-id=3D%u&quot;, d-&gt;target_name, d-&gt;target_id);<br>
-+=C2=A0 =C2=A0 =C2=A0 res =3D pw_stream_connect(d-&gt;playback, PW_DIRECTI=
ON_OUTPUT, d-&gt;target_id,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_NO_CONVERT |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_MAP_BUFFERS |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_RT_PROCESS,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params, n_params);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_set_active(d-&gt;playback, false);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_active =3D false;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_failed =3D false;<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static int create_capture_stream(struct forwarder_data *d)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_properties *props;<br>
-+=C2=A0 =C2=A0 =C2=A0 const struct spa_pod *params[2];<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t buffer[1024];<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder builder;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t n_params =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 int res;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 props =3D pw_properties_new(PW_KEY_MEDIA_CLASS, &quo=
t;Stream/Input/Audio&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_NAME, &quot;compress-offload-forwarder-capture&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_TARGET_OBJECT, d-&gt;source_name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_AUTOCONNECT, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_STREAM_CAPTURE_SINK, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_STREAM_DONT_REMIX, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;node.dont-reconnect&quot;, &quot;true&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (props =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_NODE_RATE, &quot;1/=
%u&quot;, d-&gt;rate);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;capture =3D pw_stream_new(d-&gt;core, &quot;co=
mpress offload forwarder capture&quot;, props);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;capture =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(d-&gt;capture, &amp;d-&gt;cap=
ture_listener, &amp;capture_events, d);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_pod_builder_init(&amp;builder, buffer, sizeof(bu=
ffer));<br>
-+=C2=A0 =C2=A0 =C2=A0 params[n_params++] =3D build_raw_format(d, &amp;buil=
der, SPA_PARAM_EnumFormat);<br>
-+=C2=A0 =C2=A0 =C2=A0 res =3D pw_stream_connect(d-&gt;capture, PW_DIRECTIO=
N_INPUT, PW_ID_ANY,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_MAP_BUFFERS |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_RT_PROCESS,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params, n_params);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_stream_set_active(d-&gt;capture, true);<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static void core_error(void *data, uint32_t id, int seq, int res, const c=
har *message)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compress-forwarder error id:%u se=
q:%d res:%d (%s): %s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 id, seq, res, spa_strerror(res), message);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (id =3D=3D PW_ID_CORE &amp;&amp; res =3D=3D -EPIP=
E)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_schedule_unload(m=
odule);<br>
-+}<br>
-+<br>
-+static const struct pw_core_events core_events =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_VERSION_CORE_EVENTS,<br>
-+=C2=A0 =C2=A0 =C2=A0 .error =3D core_error,<br>
-+};<br>
-+<br>
-+static int module_compress_offload_forwarder_load(struct module *module)<=
br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D module-&gt;user_data;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 int res;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_LOG_TOPIC_INIT(mod_topic);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;loop =3D pw_context_get_main_loop(module-&gt;i=
mpl-&gt;context);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;loop =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;activate_event =3D pw_loop_add_event(d-&gt;loo=
p, playback_activate_event, d);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;activate_event =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D pw_context_connect(module-&gt;impl-&g=
t;context, NULL, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_core_add_listener(d-&gt;core, &amp;d-&gt;core_lis=
tener, &amp;core_events, module);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D PW_ID_ANY;<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;registry =3D pw_core_get_registry(d-&gt;core, =
PW_VERSION_REGISTRY, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;registry =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_registry_add_listener(d-&gt;registry, &amp;d-&gt;=
registry_listener, &amp;registry_events, d);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 res =3D create_capture_stream(d);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder loaded: source=
=3D%s monitor=3D%s target=3D%s codec=3D%s rate=3D%u channels=3D%u&quot;,<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;source_name, d-&gt;monitor_name, d-&gt;target_name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;codec, d-&gt;rate, d-&gt;channels);<br>
-+=C2=A0 =C2=A0 =C2=A0 module_emit_loaded(module, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static int module_compress_offload_forwarder_unload(struct module *module=
)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D module-&gt;user_data;<b=
r>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;capture !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;capture_listener);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(d-&gt;=
capture);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;capture =3D NULL;<=
br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(d);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;registry !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;registry_listener);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy((struct=
 pw_proxy*)d-&gt;registry);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;registry =3D NULL;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;core_listener);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_core_disconnect(d-&gt=
;core);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;activate_event !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_loop_destroy_source(d=
-&gt;loop, d-&gt;activate_event);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;activate_event =3D=
 NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;loop =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static int module_compress_offload_forwarder_prepare(struct module *modul=
e)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D module-&gt;user_data;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_properties *props =3D module-&gt;props;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 const char *str;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_LOG_TOPIC_INIT(mod_topic);<br>
-+=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;source_sink&q=
uot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;source_name, sizeof(d-&gt;source=
_name), &quot;%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 str ? str : &quot;pal_speaker_compress&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;target_sink&q=
uot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;target_name, sizeof(d-&gt;target=
_name), &quot;%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 str ? str : &quot;pal_sink_speaker_compress&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;codec&quot;);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;codec, sizeof(d-&gt;codec), &quo=
t;%s&quot;, str ? str : DEFAULT_CODEC);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;rate =3D pw_properties_get_uint32(props, &quot=
;rate&quot;, DEFAULT_RATE);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;channels =3D pw_properties_get_uint32(props, &=
quot;channels&quot;, DEFAULT_CHANNELS);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;bitrate =3D pw_properties_get_uint32(props, &q=
uot;bitrate&quot;, DEFAULT_BITRATE);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;block_size =3D pw_properties_get_uint32(props,=
 &quot;block_size&quot;, DEFAULT_BLOCK_SIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;monitor_name, sizeof(d-&gt;monit=
or_name), &quot;%s.monitor&quot;, d-&gt;source_name);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!spa_streq(d-&gt;codec, &quot;mp3&quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;compre=
ss-forwarder only supports mp3 right now, requested codec=3D%s&quot;, d-&gt=
;codec);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;channels =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;channels =3D DEFAU=
LT_CHANNELS;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;rate =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;rate =3D DEFAULT_R=
ATE;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;block_size =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;block_size =3D DEF=
AULT_BLOCK_SIZE;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static const struct spa_dict_item module_compress_offload_forwarder_info[=
] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_AUTHOR,=C2=A0 =C2=A0 =C2=A0 &quot;Qu=
alcomm Technologies, Inc.&quot; },<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_DESCRIPTION, &quot;Forward Pulse com=
press-offload sink data to PAL compress sink&quot; },<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_USAGE,=C2=A0 =C2=A0 =C2=A0 =C2=A0for=
warder_options },<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_VERSION,=C2=A0 =C2=A0 =C2=A0PACKAGE_=
VERSION },<br>
-+};<br>
-+<br>
-+DEFINE_MODULE_INFO(module_compress_offload_forwarder) =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;module-com=
press-offload-forwarder&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 .prepare=C2=A0 =C2=A0 =3D module_compress_offload_fo=
rwarder_prepare,<br>
-+=C2=A0 =C2=A0 =C2=A0 .load=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D module_compress_=
offload_forwarder_load,<br>
-+=C2=A0 =C2=A0 =C2=A0 .unload=C2=A0 =C2=A0 =C2=A0=3D module_compress_offlo=
ad_forwarder_unload,<br>
-+=C2=A0 =C2=A0 =C2=A0 .properties =3D &amp;SPA_DICT_INIT_ARRAY(module_comp=
ress_offload_forwarder_info),<br>
-+=C2=A0 =C2=A0 =C2=A0 .data_size=C2=A0 =3D sizeof(struct forwarder_data),<=
br>
-+};<br>
-diff --git a/src/modules/module-protocol-pulse/modules/module-compress-off=
load-sink.c b/src/modules/module-protocol-pulse/modules/module-compress-off=
load-sink.c<br>
-new file mode 100644<br>
-index 0000000..243cc8e<br>
---- /dev/null<br>
-+++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-si=
nk.c<br>
-@@ -0,0 +1,293 @@<br>
-+/* PipeWire */<br>
-+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */<=
br>
-+/* SPDX-License-Identifier: BSD-3-Clause-Clear */<br>
-+<br>
-+#include &lt;errno.h&gt;<br>
-+#include &lt;stdlib.h&gt;<br>
-+<br>
-+#include &lt;spa/utils/result.h&gt;<br>
-+#include &lt;pipewire/pipewire.h&gt;<br>
-+<br>
-+#include &quot;../module.h&quot;<br>
-+<br>
-+static const char *const pulse_module_options =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;sink_name=3D&lt;name of sink&gt; &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;sink_properties=3D&lt;properties for the sink&=
gt; &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;target_sink=3D&lt;<a href=3D"http://node.name"=
 rel=3D"noreferrer" target=3D"_blank">node.name</a> of the downstream compr=
ess-offload sink&gt; &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;codec=3D&lt;codec name, default mp3&gt; &quot;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;rate=3D&lt;sample rate, default 44100&gt; &quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;channels=3D&lt;number of channels, default 2&g=
t; &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;bitrate=3D&lt;bit rate, default 128000&gt;&quo=
t;;<br>
-+<br>
-+#define NAME &quot;compress-offload-sink&quot;<br>
-+<br>
-+PW_LOG_TOPIC_STATIC(mod_topic, &quot;mod.&quot; NAME);<br>
-+#define PW_LOG_TOPIC_DEFAULT mod_topic<br>
-+<br>
-+struct module_compress_offload_sink_data {<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_core *core;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_hook core_listener;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_proxy *proxy;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_hook proxy_listener;<br>
-+};<br>
-+<br>
-+static void module_proxy_removed(void *data)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder proxy removed:=
 proxy=3D%p&quot;, d-&gt;proxy);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy(d-&gt;proxy);<br>
-+}<br>
-+<br>
-+static void module_proxy_destroy(void *data)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder proxy destroy:=
 proxy=3D%p - scheduling module unload&quot;, d-&gt;proxy);<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&gt;proxy_listener);<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;proxy =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 module_schedule_unload(module);<br>
-+}<br>
-+<br>
-+static void module_proxy_bound_props(void *data, uint32_t global_id, cons=
t struct spa_dict *props)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;proxy %p bound id:%u module_index=
=3D%u&quot;, d-&gt;proxy, global_id, module-&gt;index);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder node successfu=
lly created and bound, emitting loaded&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 module_emit_loaded(module, 0);<br>
-+}<br>
-+<br>
-+static void module_proxy_error(void *data, int seq, int res, const char *=
message)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;proxy %p error %d: %s&quot;, d-&g=
t;proxy, res, message);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy(d-&gt;proxy);<br>
-+}<br>
-+<br>
-+static const struct pw_proxy_events proxy_events =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_VERSION_PROXY_EVENTS,<br>
-+=C2=A0 =C2=A0 =C2=A0 .removed=C2=A0 =C2=A0 =C2=A0 =3D module_proxy_remove=
d,<br>
-+=C2=A0 =C2=A0 =C2=A0 .bound_props=C2=A0 =3D module_proxy_bound_props,<br>
-+=C2=A0 =C2=A0 =C2=A0 .error=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D module_proxy_e=
rror,<br>
-+=C2=A0 =C2=A0 =C2=A0 .destroy=C2=A0 =C2=A0 =C2=A0 =3D module_proxy_destro=
y,<br>
-+};<br>
-+<br>
-+static void module_core_error(void *data, uint32_t id, int seq, int res, =
const char *message)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;error id:%u seq:%d res:%d (%s): %=
s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 id, seq, res, spa_strerror(res), message);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (id =3D=3D PW_ID_CORE &amp;&amp; res =3D=3D -EPIP=
E)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_schedule_unload(m=
odule);<br>
-+}<br>
-+<br>
-+static const struct pw_core_events core_events =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_VERSION_CORE_EVENTS,<br>
-+=C2=A0 =C2=A0 =C2=A0 .error =3D module_core_error,<br>
-+};<br>
-+<br>
-+static int module_compress_offload_sink_load(struct module *module)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder load: node=3D%s=
 target=3D%s codec=3D%s rate=3D%s channels=3D%s bitrate=3D%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, PW_KEY_NODE_NAME),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;compress.target.object&quot;)=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.type&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.sample_rate&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.channels&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.bit_rate&quot;));<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D pw_context_connect(module-&gt;impl-&g=
t;context, NULL, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder core connect failed: errno=3D%d (%s)&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno, spa_strerror(-errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder core connected=
: core=3D%p&quot;, d-&gt;core);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_core_add_listener(d-&gt;core, &amp;d-&gt;core_lis=
tener, &amp;core_events, module);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(module-&gt;props, &quot;<a href=
=3D"http://pulse.module.id" rel=3D"noreferrer" target=3D"_blank">pulse.modu=
le.id</a>&quot;, &quot;%u&quot;, module-&gt;index);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 d-&gt;proxy =3D pw_core_create_object(d-&gt;core,<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ada=
pter&quot;, PW_TYPE_INTERFACE_Node, PW_VERSION_NODE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module-&g=
t;props ? &amp;module-&gt;props-&gt;dict : NULL, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;proxy =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder adapter create failed: errno=3D%d (%s)&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno, spa_strerror(-errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder adapter create=
 requested: proxy=3D%p - waiting for bound_props&quot;, d-&gt;proxy);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_proxy_add_listener(d-&gt;proxy, &amp;d-&gt;proxy_=
listener, &amp;proxy_events, module);<br>
-+=C2=A0 =C2=A0 =C2=A0 return SPA_RESULT_RETURN_ASYNC(0);<br>
-+}<br>
-+<br>
-+static int module_compress_offload_sink_unload(struct module *module)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder unload: proxy=
=3D%p core=3D%p - cleaning up&quot;, d-&gt;proxy, d-&gt;core);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;proxy !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;proxy_listener);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy(d-&gt;p=
roxy);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;proxy =3D NULL;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;core_listener);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_core_disconnect(d-&gt=
;core);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static int module_compress_offload_sink_prepare(struct module * const mod=
ule)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct pw_properties * const props =3D module-&gt;pr=
ops;<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *str;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t rate =3D 44100;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t channels =3D 2;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t bitrate =3D 128000;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 PW_LOG_TOPIC_INIT(mod_topic);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;sink_nam=
e&quot;)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: sink_name=3D%s&quot;, str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 PW_KEY_NODE_NAME, str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;sink_name&quot;, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: sink_name missing, using default&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 PW_KEY_NODE_NAME, &quot;compress-offload-sink&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;sink_pro=
perties&quot;)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: sink_properties=3D%s&quot;, str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_args_add_props(pr=
ops, str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;sink_properties&quot;, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;target_s=
ink&quot;)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: target_sink=3D%s&quot;, str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;compress.target.object&quot;, str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;target_sink&quot;, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;compre=
ss-forwarder option: target_sink missing; stream will not have explicit com=
press target&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;rate&quo=
t;)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t v =3D (uint32_t=
)atoi(str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (v &gt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rate =3D v;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;rate&quot;, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;channels=
&quot;)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t v =3D (uint32_t=
)atoi(str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (v &gt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 channels =3D v;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;channels&quot;, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;bitrate&=
quot;)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t v =3D (uint32_t=
)atoi(str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (v &gt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bitrate =3D v;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;bitrate&quot;, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;channel_=
map&quot;)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;audio.position&quot;, str);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;channel_map&quot;, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (channels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ MONO ]&quo=
t;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR ]&qu=
ot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR LFE =
]&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR RL R=
R ]&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 5:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR FC R=
L RR ]&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 6:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR FC L=
FE RL RR ]&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 8:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR FC L=
FE RL RR SL SR ]&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;codec&quot;);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;codec.type&quot;, str=
 ? str : &quot;mp3&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.sample_rate&qu=
ot;, &quot;%u&quot;, rate);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.channels&quot;=
,=C2=A0 =C2=A0 &quot;%u&quot;, channels);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.bit_rate&quot;=
,=C2=A0 =C2=A0 &quot;%u&quot;, bitrate);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;codec&quot;, NULL);<b=
r>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(props, PW_KEY_MEDIA_CLASS) =3D=
=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 PW_KEY_MEDIA_CLASS, &quot;Audio/Sink&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(props, PW_KEY_NODE_DESCRIPTION=
) =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props=
, PW_KEY_NODE_DESCRIPTION, &quot;%s (compress offload)&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get(props, PW_KEY_NODE_NAME))=
;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* Advertise this node as an encoded-only sink =
so WirePlumber&#39;s<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* canPassthrough() allows linking compress str=
eams to it.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* audio.format=3DS16LE is kept as the syntheti=
c PCM sample_spec that<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* Pulse clients see in pactl; no PCM conversio=
n ever occurs.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_AUDIO_FORMAT,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;S16LE&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_AUDIO_RATE,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%u&quot;, rate=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_AUDIO_CHANNELS,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%u&quot;, channels);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;item.node.supports-en=
coded-fmts&quot;,=C2=A0 &quot;true&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_NODE_VIRTUAL,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_PRIORITY_SESSION,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_PRIORITY_DRIVER,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;1&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;monitor.channel-volum=
es&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;monitor.passthrough&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot;);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;compress.offload&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;true&=
quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_FACTORY_NAME,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;support.null-audio-s=
ink&quot;);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;prepared compress-forwarder alias:=
 name=3D%s target=3D%s codec=3D%s rate=3D%u channels=3D%u bitrate=3D%u medi=
a.class=3D%s audio.format=3D%s virtual=3D%s factory=3D%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_NODE_NAME),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, &quot;compress.target.object&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, &quot;codec.type&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rate, channels, bitrate,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_MEDIA_CLASS),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_AUDIO_FORMAT),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_NODE_VIRTUAL),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_FACTORY_NAME));<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static const struct spa_dict_item module_compress_offload_sink_info[] =3D=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_AUTHOR,=C2=A0 =C2=A0 =C2=A0 &quot;Qu=
alcomm Technologies, Inc.&quot; },<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_DESCRIPTION, &quot;Pulse-visible ali=
as sink for compressed offload playback&quot; },<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_USAGE,=C2=A0 =C2=A0 =C2=A0 =C2=A0pul=
se_module_options },<br>
-+=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_VERSION,=C2=A0 =C2=A0 =C2=A0PACKAGE_=
VERSION },<br>
-+};<br>
-+<br>
-+DEFINE_MODULE_INFO(module_compress_offload_sink) =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;module-com=
press-offload-sink&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 .prepare=C2=A0 =C2=A0 =3D module_compress_offload_si=
nk_prepare,<br>
-+=C2=A0 =C2=A0 =C2=A0 .load=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D module_compress_=
offload_sink_load,<br>
-+=C2=A0 =C2=A0 =C2=A0 .unload=C2=A0 =C2=A0 =C2=A0=3D module_compress_offlo=
ad_sink_unload,<br>
-+=C2=A0 =C2=A0 =C2=A0 .properties =3D &amp;SPA_DICT_INIT_ARRAY(module_comp=
ress_offload_sink_info),<br>
-+=C2=A0 =C2=A0 =C2=A0 .data_size=C2=A0 =3D sizeof(struct module_compress_o=
ffload_sink_data),<br>
-+};<br>
-diff --git a/src/modules/module-protocol-pulse/pulse-server.c b/src/module=
s/module-protocol-pulse/pulse-server.c<br>
-index eb3233b..61f0dfb 100644<br>
---- a/src/modules/module-protocol-pulse/pulse-server.c<br>
-+++ b/src/modules/module-protocol-pulse/pulse-server.c<br>
-@@ -84,6 +84,9 @@ struct temporary_move_data {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t used:1;<br>
- };<br>
-<br>
-+/* Buffer size used for compress-offload streams (frame_size =3D=3D 1). *=
/<br>
-+#define COMPRESS_OFFLOAD_BUF_SIZE=C2=A0 16484u<br>
-+<br>
- static struct sample *find_sample(struct impl *impl, uint32_t index, cons=
t char *name)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0union pw_map_item *item;<br>
-@@ -1199,10 +1202,18 @@ static const struct spa_pod *get_buffers_param(str=
uct stream *s,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0blocks =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stride =3D s-&gt;frame_size;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 /* compressed offload uses byte granularity */<br>
-+=C2=A0 =C2=A0 =C2=A0 if (s-&gt;frame_size =3D=3D 1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D COMPRESS_OFFLOA=
D_BUF_SIZE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] =
get_buffers_param: compress offload path size=3D%u&quot;, s-&gt;client-&gt;=
name, size);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto build_buffers_param=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D defs-&gt;quantum_limit * s-&gt;frame_s=
ize;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_log_info(&quot;[%s] stride %d size %u&quot;,=
 s-&gt;client-&gt;name, stride, size);<br>
-<br>
-+build_buffers_param:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0param =3D spa_pod_builder_add_object(b,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_PARAM_BUFFERS_buffers, SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,<=
br>
-@@ -1228,6 +1239,23 @@ static void stream_param_changed(void *data, uint32=
_t id, const struct spa_pod *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (id !=3D SPA_PARAM_Format || param =3D=3D NU=
LL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 /* For compress-offload streams, force byte-granular=
ity regardless<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* of negotiated format (we connect with S16LE =
but data is compressed). */<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *co =3D strea=
m-&gt;props ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(stream-&gt;props, &quot;compress.offload&quot;) : NUL=
L;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (co &amp;&amp; pw_pro=
perties_parse_bool(co)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint32_t media_type =3D 0, media_subtype =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spa_format_parse(param, &amp;media_type, &amp;media_subtype);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stream-&gt;frame_size =3D 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stream-&gt;rate =3D stream-&gt;ss.rate ? stream-&gt;ss.rate :<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get_uint32(stream-&gt;props, =
&quot;codec.sample_rate&quot;, 44100);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;[%s] compress-offload stream_param_changed: forcing =
frame_size=3D1 rate=3D%u subtype=3D%u&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;client-&gt;name, stream-&gt;rate=
, media_subtype);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto stream_param_format_done;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((res =3D format_parse_param(param, false, &=
amp;stream-&gt;ss, &amp;stream-&gt;map, NULL, NULL)) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw_stream_set_error=
(stream-&gt;stream, res, &quot;format not supported&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-@@ -1243,6 +1271,9 @@ static void stream_param_changed(void *data, uint32_=
t id, const struct spa_pod *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stream-&gt;rate =3D stream-&gt;ss.rate;<br>
-+stream_param_format_done:<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] stream param done: frame_siz=
e=3D%u rate=3D%u ss.format=3D%u&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stream-&gt;client-&gt;name, stream-&gt;frame_size, stream-&gt;rate, str=
eam-&gt;ss.format);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream-&gt;create_tag !=3D SPA_ID_INVALID) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_manager_o=
bject *peer;<br>
-@@ -1583,6 +1614,98 @@ static void log_format_info(struct impl *impl, enum=
 spa_log_level level, struct<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0impl, it-&gt;key, it-&gt;value);<br>
- }<br>
-<br>
-+static const struct spa_pod *build_compress_offload_format(struct spa_pod=
_builder *b,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t id, const struc=
t pw_properties *props, uint32_t *rate)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *codec;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info info;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t sample_rate, channels, bitrate;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_zero(info);<br>
-+=C2=A0 =C2=A0 =C2=A0 info.media_type =3D SPA_MEDIA_TYPE_audio;<br>
-+=C2=A0 =C2=A0 =C2=A0 codec =3D pw_properties_get(props, &quot;codec.type&=
quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 sample_rate =3D pw_properties_get_uint32(props, &quo=
t;codec.sample_rate&quot;, 44100);<br>
-+=C2=A0 =C2=A0 =C2=A0 channels =3D pw_properties_get_uint32(props, &quot;c=
odec.channels&quot;, 2);<br>
-+=C2=A0 =C2=A0 =C2=A0 bitrate =3D pw_properties_get_uint32(props, &quot;co=
dec.bit_rate&quot;, 128000);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (codec =3D=3D NULL || spa_streq(codec, &quot;mp3&=
quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_mp3;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.rate =3D s=
ample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.channel_mo=
de =3D channels =3D=3D 1 ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;aac&quot;) || spa_=
streq(codec, &quot;aac_adts&quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D s=
ample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D bitrate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;aac_adif&quot;)) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D s=
ample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D bitrate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_ADIF;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;aac_latm&quot;)) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D s=
ample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D bitrate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_MP4LATM;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;flac&quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_flac;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.flac.rate =3D =
sample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.flac.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;vorbis&quot;)) {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_vorbis;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.vorbis.rate =
=3D sample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.vorbis.channel=
s =3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;opus&quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_opus;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.opus.rate =3D =
sample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.opus.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;wma&quot;) || spa_=
streq(codec, &quot;wma_std&quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_wma;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.rate =3D s=
ample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.bitrate =
=3D bitrate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.profile =
=3D SPA_AUDIO_WMA_PROFILE_WMA9;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;wma_pro&quot;)) {<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_wma;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.rate =3D s=
ample_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.channels =
=3D channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.bitrate =
=3D bitrate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.profile =
=3D SPA_AUDIO_WMA_PROFILE_WMA9_PRO;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOTSUP;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (rate !=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *rate =3D sample_rate;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 return spa_format_audio_build(b, id, &amp;info);<br>
-+}<br>
-+<br>
-+static void synthesize_compress_offload_spec(struct sample_spec *ss,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct channel_map *map,=
 const struct pw_properties *props)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 ss-&gt;format =3D SPA_AUDIO_FORMAT_S16_LE;<br>
-+=C2=A0 =C2=A0 =C2=A0 ss-&gt;rate =3D pw_properties_get_uint32(props, &quo=
t;codec.sample_rate&quot;, 44100);<br>
-+=C2=A0 =C2=A0 =C2=A0 channels =3D pw_properties_get_uint32(props, &quot;c=
odec.channels&quot;, 2);<br>
-+=C2=A0 =C2=A0 =C2=A0 ss-&gt;channels =3D (uint8_t)(channels &gt; 0 ? chan=
nels : 2);<br>
-+=C2=A0 =C2=A0 =C2=A0 spa_zero(*map);<br>
-+=C2=A0 =C2=A0 =C2=A0 switch (ss-&gt;channels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 case 1: channel_map_parse(&quot;mono&quot;, map); br=
eak;<br>
-+=C2=A0 =C2=A0 =C2=A0 case 2: channel_map_parse(&quot;stereo&quot;, map); =
break;<br>
-+=C2=A0 =C2=A0 =C2=A0 case 3: channel_map_parse(&quot;surround-21&quot;, m=
ap); break;<br>
-+=C2=A0 =C2=A0 =C2=A0 case 4: channel_map_parse(&quot;surround-40&quot;, m=
ap); break;<br>
-+=C2=A0 =C2=A0 =C2=A0 case 5: channel_map_parse(&quot;surround-50&quot;, m=
ap); break;<br>
-+=C2=A0 =C2=A0 =C2=A0 case 6: channel_map_parse(&quot;surround-51&quot;, m=
ap); break;<br>
-+=C2=A0 =C2=A0 =C2=A0 case 8: channel_map_parse(&quot;surround-71&quot;, m=
ap); break;<br>
-+=C2=A0 =C2=A0 =C2=A0 default: channel_map_parse(&quot;stereo&quot;, map);=
 ss-&gt;channels =3D 2; break;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
- static int do_create_playback_stream(struct client *client, uint32_t comm=
and, uint32_t tag, struct message *m)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct impl *impl =3D client-&gt;impl;<br>
-@@ -1609,7 +1732,8 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muted_set =3D false=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail_on_suspend =3D=
 false,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0relative_volume =3D=
 false,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passthrough =3D false;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passthrough =3D false,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_offload =3D fal=
se;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct volume volume;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_properties *props =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t n_formats =3D 0;<br>
-@@ -1668,6 +1792,68 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0o =3D find_device(client, sink_index, sink_name=
, true, &amp;is_monitor);<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 if (o !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct pw_node_inf=
o *ninfo =3D o-&gt;info;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spa_dict *s=
p =3D (ninfo &amp;&amp; ninfo-&gt;props) ? ninfo-&gt;props : NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char node_name_buf[256] =
=3D {0};<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *node_name;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *co;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_nn =3D pw_p=
roperties_get(o-&gt;props, PW_KEY_NODE_NAME);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_nn)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 snprintf(node_name_buf, sizeof(node_name_buf), &quot;%s&quot;, _nn);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_name =3D node_name_=
buf[0] ? node_name_buf : NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 co =3D sp ? spa_dict_loo=
kup(sp, &quot;compress.offload&quot;) : NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] =
compress-offload check: node=3D%s ninfo=3D%p co=3D%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name, node_name ? node_name : &q=
uot;(null)&quot;, ninfo, co ? co : &quot;(null)&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (co &amp;&amp; spa_at=
ob(co)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char target_buf[256] =3D {0};<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char codec_buf[64] =3D {0};<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char rate_buf[32] =3D {0};<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char channels_buf[16] =3D {0};<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char bitrate_buf[32] =3D {0};<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *target;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *codec;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *rate_s;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *channels;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *bitrate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *_s;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;compress.target.object&quot;)) !=
=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(target_buf, sizeof(target_buf), &q=
uot;%s&quot;, _s);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.type&quot;)) !=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(codec_buf, sizeof(codec_buf), &quo=
t;%s&quot;, _s);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.sample_rate&quot;)) !=3D NU=
LL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(rate_buf, sizeof(rate_buf), &quot;=
%s&quot;, _s);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.channels&quot;)) !=3D NULL)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(channels_buf, sizeof(channels_buf)=
, &quot;%s&quot;, _s);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.bit_rate&quot;)) !=3D NULL)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(bitrate_buf, sizeof(bitrate_buf), =
&quot;%s&quot;, _s);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 target =3D target_buf[0] ? target_buf : NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 codec =3D codec_buf[0] ? codec_buf : NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rate_s =3D rate_buf[0] ? rate_buf : NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 channels =3D channels_buf[0] ? channels_buf : NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bitrate =3D bitrate_buf[0] ? bitrate_buf : NULL;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;compress.offload&quot;, &quot;true&quot;=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;item.node.supports-encoded-fmts&quot;, &=
quot;true&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, PW_KEY_MEDIA_TYPE, &quot;Audio&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, PW_KEY_MEDIA_CATEGORY, &quot;Playback&quot;);<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, PW_KEY_MEDIA_ROLE, &quot;Music&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (codec) pw_properties_set(props, &quot;codec.type&quot;, codec);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (rate_s) pw_properties_set(props, &quot;codec.sample_rate&quot;, rat=
e_s);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (channels) pw_properties_set(props, &quot;codec.channels&quot;, chan=
nels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (bitrate) pw_properties_set(props, &quot;codec.bit_rate&quot;, bitra=
te);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_info(&quot;[%s] detected compress-offload sink=3D%s target=3D%s =
codec=3D%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name=
, node_name ? node_name : &quot;(null)&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target ? target=
 : &quot;(null)&quot;, codec ? codec : &quot;(null)&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;[%s] compress target=3D%s - leaving sink_name=3D%s f=
or virtual sink routing&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name=
, target ? target : &quot;(null)&quot;, sink_name ? sink_name : &quot;(null=
)&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0spa_zero(fix_ss);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0spa_zero(fix_map);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fix_format || fix_rate || fix_channels) &a=
mp;&amp; o !=3D NULL) {<br>
-@@ -1715,6 +1901,9 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto error_protocol;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 compress_offload =3D pw_properties_parse_bool(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, &quot;compress.offload&quot;));<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;version &gt;=3D 21) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (message_get(m,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TAG_U8, &amp;n_formats,<br>
-@@ -1732,7 +1921,9 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TAG_INVALID) &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto erro=
r_protocol;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n_params &lt; MAX_FORMATS &amp;&amp;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_format_info=
(impl, SPA_LOG_LEVEL_DEBUG, &amp;format);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (n_params &lt; MAX_FORMATS &amp;&=
amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(params[n_params] =3D f=
ormat_info_build_param(&amp;b,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0SPA_PARAM_EnumFormat, &amp;format, &amp;r)) !=3D NULL) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_params+=
+;<br>
-@@ -1746,7 +1937,23 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 if (sample_spec_valid(&amp;ss)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t compress_rate =
=3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n_params &lt; MAX_FO=
RMATS &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (params[n_=
params] =3D build_compress_offload_format(&amp;b,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PARAM_EnumF=
ormat, props, &amp;compress_rate)) !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 n_params++;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 n_valid_formats++;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ss_rate =3D rate =3D compress_rate;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 synthesize_compress_offload_spec(&amp;ss, &amp;map, props);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;[%s] synthesized compress-offload format codec=3D%s =
rate=3D%u channels=3D%u&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name=
, pw_properties_get(props, &quot;codec.type&quot;), compress_rate,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_g=
et_uint32(props, &quot;codec.channels&quot;, 2));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_warn(&quot;%p: unsupported compress codec:%s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 impl, pw_proper=
ties_get(props, &quot;codec.type&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 } else if (sample_spec_valid(&amp;ss)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sample_spec =
sfix =3D ss;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct channel_map =
mfix =3D map;<br>
-<br>
-@@ -1770,6 +1977,8 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (m-&gt;offset !=3D m-&gt;length)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_protocol=
;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] format check: n_valid=3D%u n=
_params=3D%u compress=3D%d passthrough=3D%d&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;name, n_valid_formats, n_params, compress_offload, passthrou=
gh);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n_valid_formats =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_no_forma=
ts;<br>
-<br>
-@@ -1806,6 +2015,8 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (no_move)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D PW_STREA=
M_FLAG_DONT_RECONNECT;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (compress_offload)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D PW_STREAM_FLA=
G_NO_CONVERT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sink_name !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (o !=3D NULL)<br=
>
-@@ -1833,14 +2044,35 @@ static int do_create_playback_stream(struct client=
 *client, uint32_t command, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;stream-&gt;stream_listener,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;stream_events, stream);<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 pw_stream_connect(stream-&gt;stream,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_DIRECTION_OUTPUT,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_ID_INVALID,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 flags |<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_RT_PROCESS |<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_MAP_BUFFERS,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params, n_params);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t raw_buf[256];<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder r=
b =3D SPA_POD_BUILDER_INIT(raw_buf, sizeof(raw_buf));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_audio_info_ra=
w raw_info =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .format =3D SPA_AUDIO_FORMAT_S16_LE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .rate =3D ss.rate ? ss.rate : 44100,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels =3D ss.channels ? ss.channels : 2,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spa_pod *ra=
w_params[1];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_params[0] =3D spa_fo=
rmat_audio_raw_build(&amp;rb, SPA_PARAM_EnumFormat, &amp;raw_info);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] =
pw_stream_connect: using raw S16LE param for compress sink&quot;, client-&g=
t;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_connect(stream=
-&gt;stream,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_DIRECTION_OUTPUT,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_ID_INVALID,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_RT_PROCESS |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_MAP_BUFFERS,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_params, 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_connect(stream=
-&gt;stream,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_DIRECTION_OUTPUT,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_ID_INVALID,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_RT_PROCESS |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_MAP_BUFFERS,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params, n_params);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stream_update_tag_param(stream);<br>
-<br>
---<br>
-2.43.0<br>
-<br>
+From 867d36a330d78e4e55348983eb0701c5d3cd7fa1 Mon Sep 17 00:00:00 2001<br>
+From: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" target=
=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+Date: Fri, 23 Oct 2026 17:22:01 +0530<br>
+Subject: [PATCH 1/4] spa: expose the AAC audio object type<br>
+<br>
+Add an audio object type field to spa_audio_info_aac and define the<br>
+matching SPA format property.<br>
+<br>
+Parse the property when an AAC format pod is received and include it<br>
+when building an AAC format pod. Omit the property when its value is<br>
+zero so existing AAC format descriptions remain unchanged when no<br>
+object type is available.<br>
+<br>
+The audio object type identifies the MPEG-4 AAC profile independently<br>
+of the transport format, allowing raw AAC and ADTS streams to carry the<br=
>
+profile selected by the client.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/pipe=
wire/pipewire/-/merge_requests/2878" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878</a>]<=
br>
+Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com"=
 target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+---<br>
+ spa/include/spa/param/audio/aac-utils.h | 6 +++++-<br>
+ spa/include/spa/param/audio/aac.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
+ spa/include/spa/param/format-types.h=C2=A0 =C2=A0 | 2 ++<br>
+ spa/include/spa/param/format.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<b=
r>
+ 4 files changed, 10 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/spa/include/spa/param/audio/aac-utils.h b/spa/include/spa/par=
am/audio/aac-utils.h<br>
+index 3ec362d19..7be3a7c94 100644<br>
+--- a/spa/include/spa/param/audio/aac-utils.h<br>
++++ b/spa/include/spa/param/audio/aac-utils.h<br>
+@@ -36,7 +36,8 @@ spa_format_audio_aac_parse(const struct spa_pod *format,=
 struct spa_audio_info_a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_FORMAT_AUDIO_rate,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_POD_=
OPT_Int(&amp;info-&gt;rate),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_FORMAT_AUDIO_channels,=C2=A0 =C2=A0 =C2=A0 SPA_POD_OPT_Int(&a=
mp;info-&gt;channels),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_FORMAT_AUDIO_bitrate,=C2=A0 =C2=A0 =C2=A0 =C2=A0SPA_POD_OPT_I=
nt(&amp;info-&gt;bitrate),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_FORMAT_AUDIO_AAC_streamFormat,=C2=A0 =C2=A0 =C2=A0 SPA_POD_OPT_Id(&=
amp;info-&gt;stream_format));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_FORMAT_AUDIO_AAC_streamFormat,=C2=A0 =C2=A0 =C2=A0 SPA_POD_OPT_Id(&=
amp;info-&gt;stream_format),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_FORMAT_AUDIO_AAC_audioObjectType,=C2=A0 =C2=A0SPA_POD_OPT_Int(&amp;=
info-&gt;audio_object_type));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return res;<br>
+ }<br>
+@@ -64,6 +65,9 @@ spa_format_audio_aac_build(struct spa_pod_builder *build=
er, uint32_t id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info-&gt;stream_format !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spa_pod_builder_add=
(builder,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_FORMAT_AUDIO_AAC_streamFormat,=C2=A0 =C2=A0 =C2=A0 SPA_POD_Id=
(info-&gt;stream_format), 0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;audio_object_type !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_pod_builder_add(buil=
der,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_FORMAT_AUDIO_AAC_audioObjectType,=C2=A0 =C2=A0SPA_POD_Int(info-&gt;=
audio_object_type), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (struct spa_pod*)spa_pod_builder_pop(bui=
lder, &amp;f);<br>
+ }<br>
+ <br>
+diff --git a/spa/include/spa/param/audio/aac.h b/spa/include/spa/param/aud=
io/aac.h<br>
+index 1a7fb1612..db6ca083a 100644<br>
+--- a/spa/include/spa/param/audio/aac.h<br>
++++ b/spa/include/spa/param/audio/aac.h<br>
+@@ -41,6 +41,7 @@ struct spa_audio_info_aac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t channels;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /*&lt; number of channels */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t bitrate;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*&lt; stream bitrate */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum spa_audio_aac_stream_format stream_format;=
 /*&lt; AAC audio stream format */<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t audio_object_type;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*&lt; MPEG-4 audio obj=
ect type */<br>
+ };<br>
+ <br>
+ #define SPA_AUDIO_INFO_AAC_INIT(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((=
struct spa_audio_info_aac) { __VA_ARGS__ })<br>
+diff --git a/spa/include/spa/param/format-types.h b/spa/include/spa/param/=
format-types.h<br>
+index 1ca4f729b..99f60fcb7 100644<br>
+--- a/spa/include/spa/param/format-types.h<br>
++++ b/spa/include/spa/param/format-types.h<br>
+@@ -144,6 +144,8 @@ static const struct spa_type_info spa_type_format[] =
=3D {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ SPA_FORMAT_AUDIO_AAC_streamFormat, SPA_TYPE_I=
d, SPA_TYPE_INFO_FORMAT_AUDIO_AAC_BASE &quot;streamFormat&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spa_type_audio_aac_=
stream_format },<br>
++=C2=A0 =C2=A0 =C2=A0 { SPA_FORMAT_AUDIO_AAC_audioObjectType, SPA_TYPE_Int=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_TYPE_INFO_FORMAT_AUD=
IO_AAC_BASE &quot;audioObjectType&quot;, NULL },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ SPA_FORMAT_AUDIO_WMA_profile, SPA_TYPE_Id, SP=
A_TYPE_INFO_FORMAT_AUDIO_WMA_BASE &quot;profile&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spa_type_audio_wma_=
profile },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ SPA_FORMAT_AUDIO_AMR_bandMode, SPA_TYPE_Id, S=
PA_TYPE_INFO_FORMAT_AUDIO_AMR_BASE &quot;bandMode&quot;,<br>
+diff --git a/spa/include/spa/param/format.h b/spa/include/spa/param/format=
.h<br>
+index bef5116e9..d5e0f00c7 100644<br>
+--- a/spa/include/spa/param/format.h<br>
++++ b/spa/include/spa/param/format.h<br>
+@@ -110,6 +110,8 @@ enum spa_format {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SPA_FORMAT_AUDIO_blockAlign,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /**&lt; audio data block alignment (Int) */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SPA_FORMAT_AUDIO_AAC_streamFormat,=C2=A0 =C2=A0=
 =C2=A0 /**&lt; AAC stream format, (Id enum spa_audio_aac_stream_format) */=
<br>
++=C2=A0 =C2=A0 =C2=A0 SPA_FORMAT_AUDIO_AAC_audioObjectType =3D SPA_FORMAT_=
START_Audio + 0x100,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /**&lt; AAC audio object type (Int) */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SPA_FORMAT_AUDIO_WMA_profile,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/**&lt; WMA profile (Id enum spa_audio_wma_profile)=
 */<br>
+ <br>
+-- <br>
+GitLab<br>
+<br>
+<br>
+From a009b6ba406ce7f12c4cda8ab52d6fb18a8db29a Mon Sep 17 00:00:00 2001<br>
+From: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" target=
=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+Date: Fri, 23 Oct 2026 17:22:01 +0530<br>
+Subject: [PATCH 2/4] pulse-server: describe MP3 and AAC encoded formats<br=
>
+<br>
+Add Pulse format encodings for MP3, AAC with ADTS transport, and raw<br>
+AAC.<br>
+<br>
+Convert PipeWire MP3 and AAC format pods into Pulse format information,<br=
>
+including sample rate, channel count, bitrate, AAC transport format,<br>
+and AAC audio object type. Build the corresponding PipeWire format pods<br=
>
+when a Pulse client selects one of these encoded formats.<br>
+<br>
+This keeps encoded stream negotiation in the existing Pulse format<br>
+conversion layer and preserves codec parameters without treating the<br>
+payload as PCM audio.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/pipe=
wire/pipewire/-/merge_requests/2878" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878</a>]<=
br>
+Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com"=
 target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+---<br>
+ src/modules/module-protocol-pulse/format.c | 115 +++++++++++++++++++++<br=
>
+ src/modules/module-protocol-pulse/format.h |=C2=A0 =C2=A03 +<br>
+ 2 files changed, 118 insertions(+)<br>
+<br>
+diff --git a/src/modules/module-protocol-pulse/format.c b/src/modules/modu=
le-protocol-pulse/format.c<br>
+index 913cfe996..d16f824d0 100644<br>
+--- a/src/modules/module-protocol-pulse/format.c<br>
++++ b/src/modules/module-protocol-pulse/format.c<br>
+@@ -484,6 +484,9 @@ static const struct encoding_info encoding_names[] =3D=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ENCODING_MPEG2_AAC_IEC61937] =3D { &quot;MPEG2=
-AAC-IEC61937&quot;, SPA_AUDIO_IEC958_CODEC_MPEG2_AAC },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ENCODING_TRUEHD_IEC61937] =3D { &quot;TRUEHD-I=
EC61937&quot;, SPA_AUDIO_IEC958_CODEC_TRUEHD },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ENCODING_DTSHD_IEC61937] =3D { &quot;DTSHD-IEC=
61937&quot;, SPA_AUDIO_IEC958_CODEC_DTSHD },<br>
++=C2=A0 =C2=A0 =C2=A0 [ENCODING_MP3] =3D { &quot;MP3&quot;, SPA_ID_INVALID=
 },<br>
++=C2=A0 =C2=A0 =C2=A0 [ENCODING_AAC] =3D { &quot;AAC&quot;, SPA_ID_INVALID=
 },<br>
++=C2=A0 =C2=A0 =C2=A0 [ENCODING_AAC_ADTS] =3D { &quot;AAC-ADTS&quot;, SPA_=
ID_INVALID },<br>
+ };<br>
+ <br>
+ const char *format_encoding2name(enum encoding enc)<br>
+@@ -775,6 +778,39 @@ static int format_info_iec958_from_param(struct forma=
t_info *info, struct spa_po<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return add_int(info, &quot;format.rate&quot;, p=
aram, SPA_FORMAT_AUDIO_rate);<br>
+ }<br>
+ <br>
++static int format_info_encoded_from_param(struct format_info *info, struc=
t spa_pod *param,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t index, enum enc=
oding encoding)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info audio_info;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (index &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;<br>
++=C2=A0 =C2=A0 =C2=A0 if (spa_format_audio_parse(param, &amp;audio_info) &=
lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 if ((info-&gt;props =3D pw_properties_new(NULL, NULL=
)) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 info-&gt;encoding =3D encoding;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 switch (encoding) {<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_MP3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(info-=
&gt;props, &quot;format.rate&quot;, &quot;%u&quot;, audio_info.info.mp3.rat=
e);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(info-=
&gt;props, &quot;format.channels&quot;, &quot;%u&quot;, audio_info.info.mp3=
.channels);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_AAC:<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_AAC_ADTS:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(info-=
&gt;props, &quot;format.rate&quot;, &quot;%u&quot;, audio_info.info.aac.rat=
e);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(info-=
&gt;props, &quot;format.channels&quot;, &quot;%u&quot;, audio_info.info.aac=
.channels);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(info-=
&gt;props, &quot;format.bit_rate&quot;, &quot;%u&quot;, audio_info.info.aac=
.bitrate);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(info-&=
gt;props, &quot;format.stream_format&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_info.info.aac.stream_format =3D=3D SP=
A_AUDIO_AAC_STREAM_FORMAT_MP4ADTS ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\&quot;adts\&quot;&quot; : &quot;\&qu=
ot;raw\&quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
+ int format_info_from_param(struct format_info *info, struct spa_pod *para=
m, uint32_t index)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t media_type, media_subtype;<br>
+@@ -793,6 +829,20 @@ int format_info_from_param(struct format_info *info, =
struct spa_pod *param, uint<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case SPA_MEDIA_SUBTYPE_iec958:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D format_info=
_iec958_from_param(info, param, index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 case SPA_MEDIA_SUBTYPE_mp3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D format_info_enco=
ded_from_param(info, param, index, ENCODING_MP3);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 case SPA_MEDIA_SUBTYPE_aac:<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_audio_info au=
dio_info;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (spa_format_audio_par=
se(param, &amp;audio_info) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D format_info_enco=
ded_from_param(info, param, index,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_info.info.aac.stream_format =3D=3D SP=
A_AUDIO_AAC_STREAM_FORMAT_MP4ADTS ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ENCODING_AAC_ADTS : ENCODING_AAC);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -836,6 +886,36 @@ static int format_info_get_rate(const struct format_i=
nfo *info)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
+ }<br>
+ <br>
++static uint32_t format_info_get_u32_prop(const struct format_info *info,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *key, uint32_=
t default_value)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *str, *val;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_json it[2];<br>
++=C2=A0 =C2=A0 =C2=A0 int len, value;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;props =3D=3D NULL || (str =3D pw_proper=
ties_get(info-&gt;props, key)) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default_value;<br=
>
++=C2=A0 =C2=A0 =C2=A0 if ((len =3D spa_json_begin(&amp;it[0], str, strlen(=
str), &amp;val)) &lt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default_value;<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (spa_json_is_int(val, len) &amp;&amp; spa_json_pa=
rse_int(val, len, &amp;value) &gt; 0 &amp;&amp; value &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uint32_t)value;<=
br>
++=C2=A0 =C2=A0 =C2=A0 return default_value;<br>
++}<br>
++<br>
++static bool format_info_string_prop_equals(const struct format_info *info=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *key, const c=
har *value)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *str, *val;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_json it[2];<br>
++=C2=A0 =C2=A0 =C2=A0 int len;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;props =3D=3D NULL || (str =3D pw_proper=
ties_get(info-&gt;props, key)) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 if ((len =3D spa_json_begin(&amp;it[0], str, strlen(=
str), &amp;val)) &gt; 0 &amp;&amp; spa_json_is_string(val, len))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return strlen(value) =3D=
=3D (size_t)len - 2 &amp;&amp; strncasecmp(val + 1, value, len - 2) =3D=3D =
0;<br>
++=C2=A0 =C2=A0 =C2=A0 return spa_streq(str, value);<br>
++}<br>
++<br>
+ int format_info_to_spec(const struct format_info *info, struct sample_spe=
c *ss,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct channel_map *map)<br>
+ {<br>
+@@ -926,6 +1006,41 @@ const struct spa_pod *format_info_build_param(struct=
 spa_pod_builder *b, uint32_<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0param =3D spa_forma=
t_audio_iec958_build(b, id, &amp;i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_MP3:<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_AAC:<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_AAC_ADTS:<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_audio_info au=
dio_info;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t channels;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_zero(audio_info);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_info.media_type =
=3D SPA_MEDIA_TYPE_audio;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((res =3D format_info=
_get_rate(info)) &lt;=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 errno =3D -res;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 channels =3D format_info=
_get_u32_prop(info, &quot;format.channels&quot;, 2);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;encoding =
=3D=3D ENCODING_MP3) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.info.mp3.rate =3D res;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.info.mp3.channels =3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.info.mp3.channel_mode =3D channels =3D=3D 1 ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO=
_MP3_CHANNEL_MODE_STEREO;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.media_subtype =3D SPA_MEDIA_SUBTYPE_aac;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.info.aac.rate =3D res;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.info.aac.channels =3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.info.aac.bitrate =3D format_info_get_u32_prop(info, &quot;fo=
rmat.bit_rate&quot;, 128000);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 audio_info.info.aac.stream_format =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;encodi=
ng =3D=3D ENCODING_AAC_ADTS ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 format_info_str=
ing_prop_equals(info, &quot;format.stream_format&quot;, &quot;adts&quot;) ?=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_AUDIO_AAC_S=
TREAM_FORMAT_MP4ADTS :<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_AUDIO_AAC_S=
TREAM_FORMAT_RAW;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *rate =3D res;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 param =3D spa_format_aud=
io_build(b, id, &amp;audio_info);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ENOTSUP;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+diff --git a/src/modules/module-protocol-pulse/format.h b/src/modules/modu=
le-protocol-pulse/format.h<br>
+index c91ec7076..d873a8065 100644<br>
+--- a/src/modules/module-protocol-pulse/format.h<br>
++++ b/src/modules/module-protocol-pulse/format.h<br>
+@@ -163,6 +163,9 @@ enum encoding {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ENCODING_MPEG2_AAC_IEC61937,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ENCODING_TRUEHD_IEC61937,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ENCODING_DTSHD_IEC61937,<br>
++=C2=A0 =C2=A0 =C2=A0 ENCODING_MP3,<br>
++=C2=A0 =C2=A0 =C2=A0 ENCODING_AAC,<br>
++=C2=A0 =C2=A0 =C2=A0 ENCODING_AAC_ADTS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ENCODING_MAX,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ENCODING_INVALID =3D -1,<br>
+ };<br>
+-- <br>
+GitLab<br>
+<br>
+<br>
+From a06592eb77ded07fe3673fd1a1098304f1995a35 Mon Sep 17 00:00:00 2001<br>
+From: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" target=
=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+Date: Fri, 23 Oct 2026 17:45:41 +0530<br>
+Subject: [PATCH 3/4] pulse-server: add compressed-offload sink modules<br>
+<br>
+Add a Pulse-visible sink module for compressed playback and a forwarder<br=
>
+module that sends its encoded stream to a configured compressed-offload<br=
>
+sink.<br>
+<br>
+The sink module creates the Pulse endpoint and carries codec properties<br=
>
+for MP3, AAC ADTS, and raw AAC streams. The forwarder observes the<br>
+encoded monitor stream, preserves packet data, creates a matching target<b=
r>
+stream, and forwards codec metadata without decoding or converting the<br>
+payload.<br>
+<br>
+Handle target discovery, stream creation, pending data, client removal,<br=
>
+target removal, state transitions, and module cleanup so the forwarding<br=
>
+stream is destroyed when either side disappears.<br>
+<br>
+Register both modules in the protocol-pulse build and keep their module<br=
>
+arguments and descriptions independent of any particular hardware or<br>
+backend implementation.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/pipe=
wire/pipewire/-/merge_requests/2878" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878</a>]<=
br>
+Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com"=
 target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+---<br>
+ src/modules/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
+ .../pulse-module-compress-offload-forwarder.c | 1052 +++++++++++++++++<br=
>
+ .../pulse-module-compress-offload-forwarder.h |=C2=A0 =C2=A020 +<br>
+ .../pulse-module-compress-offload-sink.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 308 =
+++++<br>
+ 4 files changed, 1382 insertions(+)<br>
+ create mode 100644 src/modules/module-protocol-pulse/modules/pulse-module=
-compress-offload-forwarder.c<br>
+ create mode 100644 src/modules/module-protocol-pulse/modules/pulse-module=
-compress-offload-forwarder.h<br>
+ create mode 100644 src/modules/module-protocol-pulse/modules/pulse-module=
-compress-offload-sink.c<br>
+<br>
+diff --git a/src/modules/meson.build b/src/modules/meson.build<br>
+index 79f599ba2..5802ab1dd 100644<br>
+--- a/src/modules/meson.build<br>
++++ b/src/modules/meson.build<br>
+@@ -338,6 +338,8 @@ pipewire_module_protocol_pulse_sources =3D [<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/pulse-module-alsa-source.c=
&#39;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/pulse-module-always-sink.c=
&#39;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/pulse-module-combine-sink.=
c&#39;,<br>
++=C2=A0 &#39;module-protocol-pulse/modules/pulse-module-compress-offload-f=
orwarder.c&#39;,<br>
++=C2=A0 &#39;module-protocol-pulse/modules/pulse-module-compress-offload-s=
ink.c&#39;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/pulse-module-device-manage=
r.c&#39;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/pulse-module-device-restor=
e.c&#39;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/pulse-module-echo-cancel.c=
&#39;,<br>
+diff --git a/src/modules/module-protocol-pulse/modules/pulse-module-compre=
ss-offload-forwarder.c b/src/modules/module-protocol-pulse/modules/pulse-mo=
dule-compress-offload-forwarder.c<br>
+new file mode 100644<br>
+index 000000000..8afc1c425<br>
+--- /dev/null<br>
++++ b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offl=
oad-forwarder.c<br>
+@@ -0,0 +1,1052 @@<br>
++/* PipeWire */<br>
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */<=
br>
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */<br>
++<br>
++#include &lt;errno.h&gt;<br>
++#include &lt;limits.h&gt;<br>
++#include &lt;stdint.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
++#include &lt;string.h&gt;<br>
++<br>
++#include &lt;spa/param/audio/compressed.h&gt;<br>
++#include &lt;spa/param/audio/format-utils.h&gt;<br>
++#include &lt;spa/param/audio/raw.h&gt;<br>
++#include &lt;spa/utils/result.h&gt;<br>
++#include &lt;spa/utils/string.h&gt;<br>
++#include &lt;pipewire/pipewire.h&gt;<br>
++<br>
++#include &quot;../module.h&quot;<br>
++#include &quot;pulse-module-compress-offload-forwarder.h&quot;<br>
++<br>
++/** \page page_pulse_module_compress_offload_forwarder Compress Offload F=
orwarder<br>
++ *<br>
++ * ## Module Name<br>
++ *<br>
++ * `module-compress-offload-forwarder`<br>
++ *<br>
++ * ## Module Options<br>
++ *<br>
++ * @pulse_module_options@<br>
++ */<br>
++<br>
++#define NAME &quot;compress-offload-forwarder&quot;<br>
++<br>
++#define DEFAULT_CODEC &quot;auto&quot;<br>
++#define DEFAULT_RATE 48000u<br>
++#define DEFAULT_CHANNELS 2u<br>
++#define DEFAULT_BITRATE 128000u<br>
++#define DEFAULT_BLOCK_SIZE (16u * 1024u)<br>
++#define MAX_PENDING_SIZE (1024u * 1024u)<br>
++<br>
++static const char *const pulse_module_options =3D<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;source_sink=3D&lt;Pulse-visible compress sink =
<a href=3D"http://node.name" rel=3D"noreferrer" target=3D"_blank">node.name=
</a>&gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;target_sink=3D&lt;compressed-offload sink <a h=
ref=3D"http://node.name" rel=3D"noreferrer" target=3D"_blank">node.name</a>=
&gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;codec=3D&lt;codec name, default auto&gt; &quot=
;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;rate=3D&lt;sample rate, default 48000&gt; &quo=
t;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;channels=3D&lt;number of channels, default 2&g=
t; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;bitrate=3D&lt;bit rate, default 128000&gt; &qu=
ot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;block_size=3D&lt;buffer size in bytes, default=
 16384&gt;&quot;;<br>
++<br>
++PW_LOG_TOPIC_STATIC(mod_topic, &quot;mod.&quot; NAME);<br>
++#define PW_LOG_TOPIC_DEFAULT mod_topic<br>
++<br>
++struct forwarder_data {<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_core *core;<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_loop *loop;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_source *activate_event;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_hook core_listener;<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_registry *registry;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_hook registry_listener;<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_node *client_node;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_hook client_node_listener;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_stream *capture;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_hook capture_listener;<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_stream *playback;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_hook playback_listener;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 char source_name[256];<br>
++=C2=A0 =C2=A0 =C2=A0 char monitor_name[280];<br>
++=C2=A0 =C2=A0 =C2=A0 char target_name[256];<br>
++=C2=A0 =C2=A0 =C2=A0 char codec[32];<br>
++=C2=A0 =C2=A0 =C2=A0 char aac_stream_format[16];<br>
++=C2=A0 =C2=A0 =C2=A0 char aac_codec_data[256];<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t rate;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t channels;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t aac_audio_object_type;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t block_size;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t target_id;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t client_node_id;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *pending_data;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t pending_size;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t pending_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t capture_streaming:1;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t logged_first_buffer:1;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t logged_first_output_buffer:1;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t logged_silence_buffer:1;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t activate_pending:1;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t playback_active:1;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t playback_failed:1;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t metadata_error_logged:1;<br>
++};<br>
++<br>
++static struct forwarder_data *active_forwarder;<br>
++<br>
++static void destroy_playback_stream(struct forwarder_data *d);<br>
++<br>
++static int create_playback_stream(struct forwarder_data *d);<br>
++static void set_playback_active(struct forwarder_data *d, bool active);<b=
r>
++static void maybe_create_playback_stream(struct forwarder_data *d, const =
char *reason);<br>
++<br>
++static bool codec_is_auto(const char *codec)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return codec =3D=3D NULL || codec[0] =3D=3D &#39;\0&=
#39; || spa_streq(codec, &quot;auto&quot;);<br>
++}<br>
++<br>
++static void reset_codec_state(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;codec, sizeof(d-&gt;codec), &quo=
t;%s&quot;, DEFAULT_CODEC);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;aac_stream_format[0] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;aac_codec_data[0] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;aac_audio_object_type =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;rate =3D DEFAULT_RATE;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;channels =3D DEFAULT_CHANNELS;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;bitrate =3D DEFAULT_BITRATE;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;logged_first_buffer =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;logged_first_output_buffer =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;logged_silence_buffer =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;metadata_error_logged =3D false;<br>
++}<br>
++<br>
++static void request_playback_activation(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;activate_event =3D=3D NULL || d-&gt;activa=
te_pending)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;activate_pending =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_loop_signal_event(d-&gt;loop, d-&gt;activate_even=
t);<br>
++}<br>
++<br>
++static void playback_activate_event(void *data, uint64_t count)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;activate_pending =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 maybe_create_playback_stream(d, &quot;first-audio-bu=
ffer&quot;);<br>
++}<br>
++<br>
++static bool buffer_is_zeroed(const void *data, uint32_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const uint8_t *bytes =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t index;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (index =3D 0; index &lt; size; index++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes[index] !=3D 0)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return true;<br>
++}<br>
++<br>
++static void clear_pending_data(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 free(d-&gt;pending_data);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_data =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_size =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_offset =3D 0;<br>
++}<br>
++<br>
++static void compact_pending_data(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t remaining;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_offset =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_offset &gt;=3D d-&gt;pending_size)=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 remaining =3D d-&gt;pending_size - d-&gt;pending_off=
set;<br>
++=C2=A0 =C2=A0 =C2=A0 memmove(d-&gt;pending_data, d-&gt;pending_data + d-&=
gt;pending_offset, remaining);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_size =3D remaining;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_offset =3D 0;<br>
++}<br>
++<br>
++static int append_pending_data(struct forwarder_data *d, const void *data=
, uint32_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *pending_data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 compact_pending_data(d);<br>
++=C2=A0 =C2=A0 =C2=A0 if (size &gt; MAX_PENDING_SIZE || d-&gt;pending_size=
 &gt; MAX_PENDING_SIZE - size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSPC;<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_size &gt; UINT32_MAX - size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EOVERFLOW;<br>
++=C2=A0 =C2=A0 =C2=A0 pending_data =3D realloc(d-&gt;pending_data, d-&gt;p=
ending_size + size);<br>
++=C2=A0 =C2=A0 =C2=A0 if (pending_data =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_data =3D pending_data;<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(d-&gt;pending_data + d-&gt;pending_size, data=
, size);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_size +=3D size;<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static bool codec_is_mp3(const char *codec)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return codec !=3D NULL &amp;&amp; spa_streq(codec, &=
quot;mp3&quot;);<br>
++}<br>
++<br>
++static bool codec_is_aac_adts(const char *codec)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return codec !=3D NULL &amp;&amp; spa_streq(codec, &=
quot;aac_adts&quot;);<br>
++}<br>
++<br>
++static bool codec_is_aac_raw(const char *codec)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return codec !=3D NULL &amp;&amp; spa_streq(codec, &=
quot;aac&quot;);<br>
++}<br>
++<br>
++static bool codec_is_aac(const char *codec)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return codec_is_aac_adts(codec) || codec_is_aac_raw(=
codec);<br>
++}<br>
++<br>
++static bool raw_aac_transport_header(const uint8_t *data, uint32_t size,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *frame_size)<br=
>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 if (size &lt; COMPRESS_RAW_AAC_HEADER_SIZE ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[0] !=3D COMPRESS_RAW_AAC_MAGIC_0 =
||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[1] !=3D COMPRESS_RAW_AAC_MAGIC_1 =
||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[2] !=3D COMPRESS_RAW_AAC_MAGIC_2 =
||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[3] !=3D COMPRESS_RAW_AAC_MAGIC_3)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 *frame_size =3D (uint32_t)data[4] |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ((uint32_t)data[5] &lt;&lt; 8) |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ((uint32_t)data[6] &lt;&lt; 16) |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ((uint32_t)data[7] &lt;&lt; 24);<br>
++=C2=A0 =C2=A0 =C2=A0 return *frame_size &gt; 0 &amp;&amp; *frame_size &lt=
;=3D MAX_PENDING_SIZE;<br>
++}<br>
++<br>
++static bool payload_is_aac_adts(const uint8_t *bytes, uint32_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return size &gt;=3D 2 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[0] =3D=3D 0xff &am=
p;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (bytes[1] &amp; 0xf6) =
=3D=3D 0xf0;<br>
++}<br>
++<br>
++static bool parse_aac_adts_header(const uint8_t *bytes, uint32_t size,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *rate, uint32_t=
 *channels, uint32_t *profile)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 static const uint32_t sample_rates[] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 96000, 88200, 64000, 480=
00, 44100, 32000,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 24000, 22050, 16000, 120=
00, 11025, 8000,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7350,<br>
++=C2=A0 =C2=A0 =C2=A0 };<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t sampling_index, parsed_channels, parsed_pro=
file;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (size &lt; 7 || !payload_is_aac_adts(bytes, size)=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 parsed_profile =3D ((bytes[2] &amp; 0xc0) &gt;&gt; 6=
) + 1;<br>
++=C2=A0 =C2=A0 =C2=A0 sampling_index =3D (bytes[2] &amp; 0x3c) &gt;&gt; 2;=
<br>
++=C2=A0 =C2=A0 =C2=A0 parsed_channels =3D ((bytes[2] &amp; 0x01) &lt;&lt; =
2) | ((bytes[3] &amp; 0xc0) &gt;&gt; 6);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (sampling_index &gt;=3D SPA_N_ELEMENTS(sample_rat=
es) || parsed_channels =3D=3D 0 || parsed_channels &gt; 8)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (rate !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *rate =3D sample_rates[s=
ampling_index];<br>
++=C2=A0 =C2=A0 =C2=A0 if (channels !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *channels =3D parsed_cha=
nnels;<br>
++=C2=A0 =C2=A0 =C2=A0 if (profile !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *profile =3D parsed_prof=
ile;<br>
++=C2=A0 =C2=A0 =C2=A0 return true;<br>
++}<br>
++<br>
++static bool payload_is_mp3(const uint8_t *bytes, uint32_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return (size &gt;=3D 3 &amp;&amp; bytes[0] =3D=3D &#=
39;I&#39; &amp;&amp; bytes[1] =3D=3D &#39;D&#39; &amp;&amp; bytes[2] =3D=3D=
 &#39;3&#39;) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (size &gt;=3D 2 &amp;&am=
p;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes[0] =3D=3D 0x=
ff &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(bytes[1] &amp; 0x=
e0) =3D=3D 0xe0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(bytes[1] &amp; 0x=
06) !=3D 0x00);<br>
++}<br>
++<br>
++static bool detect_payload_codec(struct forwarder_data *d, const void *da=
ta, uint32_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const uint8_t *bytes =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t rate, channels, profile;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (payload_is_aac_adts(bytes, size)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!parse_aac_adts_head=
er(bytes, size, &amp;rate, &amp;channels, &amp;profile)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_warn(&quot;compress-forwarder rejected invalid AAC ADTS header=
=3D%02x %02x %02x %02x size=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size &gt; 0 ? b=
ytes[0] : 0, size &gt; 1 ? bytes[1] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size &gt; 2 ? b=
ytes[2] : 0, size &gt; 3 ? bytes[3] : 0, size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!codec_is_aac_adts(d=
-&gt;codec)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spa_scnprintf(d-&gt;codec, sizeof(d-&gt;codec), &quot;aac_adts&quot;);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;rate =3D rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;channels =3D chann=
els;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;aac_audio_object_t=
ype =3D profile;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder detected AAC ADTS payload header=3D%02x %02x rate=3D%u channe=
ls=3D%u object_type=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[0], bytes[1], d-&gt;rate, d-&gt;chann=
els, d-&gt;aac_audio_object_type);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (payload_is_mp3(bytes, size)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!codec_is_mp3(d-&gt;=
codec)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spa_scnprintf(d-&gt;codec, sizeof(d-&gt;codec), &quot;mp3&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;compress-forwarder detected MP3 payload header=3D%02=
x %02x %02x&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size &gt; 0 ? b=
ytes[0] : 0, size &gt; 1 ? bytes[1] : 0, size &gt; 2 ? bytes[2] : 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return codec_is_aac_raw(d-&gt;codec);<br>
++}<br>
++<br>
++static bool update_codec_from_props(struct forwarder_data *d, const struc=
t spa_dict *props)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *codec, *str;<br>
++=C2=A0 =C2=A0 =C2=A0 char old_codec[sizeof(d-&gt;codec)];<br>
++=C2=A0 =C2=A0 =C2=A0 char old_aac_stream_format[sizeof(d-&gt;aac_stream_f=
ormat)];<br>
++=C2=A0 =C2=A0 =C2=A0 char old_aac_codec_data[sizeof(d-&gt;aac_codec_data)=
];<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t old_rate, old_channels, old_bitrate, old_aa=
c_audio_object_type;<br>
++=C2=A0 =C2=A0 =C2=A0 bool changed;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 codec =3D spa_dict_lookup(props, &quot;codec.type&qu=
ot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec =3D=3D NULL || (!codec_is_mp3(codec) &amp;=
&amp; !codec_is_aac(codec)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(old_codec, sizeof(old_codec), &quot;%s=
&quot;, d-&gt;codec);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(old_aac_stream_format, sizeof(old_aac_=
stream_format), &quot;%s&quot;, d-&gt;aac_stream_format);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(old_aac_codec_data, sizeof(old_aac_cod=
ec_data), &quot;%s&quot;, d-&gt;aac_codec_data);<br>
++=C2=A0 =C2=A0 =C2=A0 old_rate =3D d-&gt;rate;<br>
++=C2=A0 =C2=A0 =C2=A0 old_channels =3D d-&gt;channels;<br>
++=C2=A0 =C2=A0 =C2=A0 old_bitrate =3D d-&gt;bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 old_aac_audio_object_type =3D d-&gt;aac_audio_object=
_type;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;codec, sizeof(d-&gt;codec), &quo=
t;%s&quot;, codec);<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D spa_dict_lookup(props, &quot;codec.samp=
le_rate&quot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;rate =3D (uint32_t=
)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D spa_dict_lookup(props, &quot;codec.chan=
nels&quot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;channels =3D (uint=
32_t)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D spa_dict_lookup(props, &quot;codec.bit_=
rate&quot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;bitrate =3D (uint3=
2_t)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D spa_dict_lookup(props, &quot;codec.aac.=
stream_format&quot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_=
stream_format, sizeof(d-&gt;aac_stream_format), &quot;%s&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D spa_dict_lookup(props, &quot;codec.aac.=
codec_data&quot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_=
codec_data, sizeof(d-&gt;aac_codec_data), &quot;%s&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D spa_dict_lookup(props, &quot;codec.aac.=
audio_object_type&quot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;aac_audio_object_t=
ype =3D (uint32_t)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_aac_adts(d-&gt;codec) &amp;&amp; d-&gt;=
aac_stream_format[0] =3D=3D &#39;\0&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_=
stream_format, sizeof(d-&gt;aac_stream_format), &quot;adts&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_aac_raw(d-&gt;codec) &amp;&amp; d-&gt;a=
ac_stream_format[0] =3D=3D &#39;\0&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_=
stream_format, sizeof(d-&gt;aac_stream_format), &quot;raw&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder stream codec u=
pdate codec=3D%s rate=3D%u channels=3D%u bitrate=3D%u stream_format=3D%s ob=
ject_type=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;codec, d-&gt;rate, d-&gt;channels, d-&gt;bitrate,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;aac_stream_format[0] !=3D &#39;\0&#39; ? d-&gt;aac_stream_format =
: &quot;none&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;aac_audio_object_type);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 changed =3D !spa_streq(old_codec, d-&gt;codec) ||<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 old_rate !=3D d-&gt;rate ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 old_channels !=3D d-&gt;channels ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 old_bitrate !=3D d-&gt;bitrate ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 !spa_streq(old_aac_stream_format, d-&gt;aac_stream_format) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 !spa_streq(old_aac_codec_data, d-&gt;aac_codec_data) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 old_aac_audio_object_type !=3D d-&gt;aac_audio_object_type;<br>
++=C2=A0 =C2=A0 =C2=A0 return changed;<br>
++}<br>
++<br>
++void compress_offload_forwarder_update(const char *source_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spa_dict *p=
rops)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D active_forwarder;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (d =3D=3D NULL || props =3D=3D NULL || !spa_streq=
(source_name, d-&gt;source_name))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 if (!update_codec_from_props(d, props))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder direct stream =
codec update codec=3D%s rate=3D%u channels=3D%u object_type=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;codec, d-&gt;rate, d-&gt;channels, d-&gt;aac_audio_object_type);<=
br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;capture_streaming &amp;&amp; d-&gt;pending=
_size &gt; d-&gt;pending_offset)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 request_playback_activat=
ion(d);<br>
++}<br>
++<br>
++void compress_offload_forwarder_teardown(const char *source_name)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D active_forwarder;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (d =3D=3D NULL || source_name =3D=3D NULL ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !spa_streq(source_name, d-&gt;source_n=
ame))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder source:%s play=
back stream ended, destroying target stream&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;source_name);<br>
++=C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(d);<br>
++=C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<br>
++}<br>
++<br>
++static void maybe_create_playback_stream(struct forwarder_data *d, const =
char *reason)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 int res;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;capture_streaming)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, t=
rue);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;target_id =3D=3D PW_ID_ANY) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder target:%s not resolved yet, defer output create (%s)&quot;,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_name, reason);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D create_playback_stream(d);<br>
++=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder target:%s create failed (%s): %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_name, reason, spa_strerror(res=
));<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, t=
rue);<br>
++}<br>
++<br>
++static void destroy_playback_stream(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&gt;playback_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(d-&gt;playback);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;playback =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_active =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_failed =3D false;<br>
++}<br>
++<br>
++static const struct spa_pod *build_raw_format(struct forwarder_data *d,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder *=
builder, uint32_t id)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info_raw info;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_zero(info);<br>
++=C2=A0 =C2=A0 =C2=A0 info.format =3D SPA_AUDIO_FORMAT_S16_LE;<br>
++=C2=A0 =C2=A0 =C2=A0 info.rate =3D d-&gt;rate;<br>
++=C2=A0 =C2=A0 =C2=A0 info.channels =3D d-&gt;channels;<br>
++=C2=A0 =C2=A0 =C2=A0 if (info.channels =3D=3D 1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.position[0] =3D SPA=
_AUDIO_CHANNEL_MONO;<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.channels =3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.position[0] =3D SPA=
_AUDIO_CHANNEL_FL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.position[1] =3D SPA=
_AUDIO_CHANNEL_FR;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return spa_format_audio_raw_build(builder, id, &amp;=
info);<br>
++}<br>
++<br>
++static const struct spa_pod *build_encoded_format(struct forwarder_data *=
d,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder *=
builder, uint32_t id)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info info;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_zero(info);<br>
++=C2=A0 =C2=A0 =C2=A0 info.media_type =3D SPA_MEDIA_TYPE_audio;<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_aac_adts(d-&gt;codec)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D d=
-&gt;rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D d-&gt;channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D d-&gt;bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.audio_obje=
ct_type =3D d-&gt;aac_audio_object_type;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (codec_is_aac_raw(d-&gt;codec)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D d=
-&gt;rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D d-&gt;channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D d-&gt;bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_RAW;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.audio_obje=
ct_type =3D d-&gt;aac_audio_object_type;<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_mp3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.rate =3D d=
-&gt;rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.channels =
=3D d-&gt;channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.channel_mo=
de =3D d-&gt;channels =3D=3D 1 ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;<br=
>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return spa_format_audio_build(builder, id, &amp;info=
);<br>
++}<br>
++<br>
++static void playback_state_changed(void *data, enum pw_stream_state old,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum pw_stream_state sta=
te, const char *error)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder target:%s stat=
e %d -&gt; %d%s%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;target_name, old, state, error ? &quot;: &quot; : &quot;&quot;, e=
rror ? error : &quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (state =3D=3D PW_STREAM_STATE_ERROR)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;playback_failed =
=3D true;<br>
++}<br>
++<br>
++static void set_playback_active(struct forwarder_data *d, bool active)<br=
>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL || d-&gt;playback_act=
ive =3D=3D active)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder target:%s acti=
ve=3D%d&quot;, d-&gt;target_name, active);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_set_active(d-&gt;playback, active);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_active =3D active;<br>
++}<br>
++<br>
++static void capture_state_changed(void *data, enum pw_stream_state old,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum pw_stream_state sta=
te, const char *error)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder source:%s stat=
e %d -&gt; %d%s%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;monitor_name, old, state, error ? &quot;: &quot; : &quot;&quot;, =
error ? error : &quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback_failed)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;capture_streaming =3D state =3D=3D PW_STREAM_S=
TATE_STREAMING;<br>
++=C2=A0 =C2=A0 =C2=A0 if (state =3D=3D PW_STREAM_STATE_PAUSED || state =3D=
=3D PW_STREAM_STATE_ERROR ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D=3D PW_STREAM_STATE_UNCONNECT=
ED) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback !=3D =
NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;compress-forwarder source:%s stopped, destroying tar=
get stream&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_n=
ame);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 destroy_playback_stream(d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++static void capture_process(void *data)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_buffer *in_buf, *out_buf;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_data *in_data, *out_data;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t in_offset, in_size, out_size, copy_size;<br=
>
++=C2=A0 =C2=A0 =C2=A0 uint32_t raw_frame_size =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 const void *input_data;<br>
++=C2=A0 =C2=A0 =C2=A0 const void *copy_data;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t copy_available;<br>
++=C2=A0 =C2=A0 =C2=A0 bool framed_raw_aac =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 int res;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 in_buf =3D pw_stream_dequeue_buffer(d-&gt;capture);<=
br>
++=C2=A0 =C2=A0 =C2=A0 if (in_buf =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 in_data =3D &amp;in_buf-&gt;buffer-&gt;datas[0];<br>
++=C2=A0 =C2=A0 =C2=A0 if (in_data-&gt;data =3D=3D NULL || in_data-&gt;chun=
k =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 in_offset =3D SPA_MIN(in_data-&gt;chunk-&gt;offset, =
in_data-&gt;maxsize);<br>
++=C2=A0 =C2=A0 =C2=A0 in_size =3D SPA_MIN(in_data-&gt;chunk-&gt;size, in_d=
ata-&gt;maxsize - in_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 input_data =3D SPA_PTROFF(in_data-&gt;data, in_offse=
t, void);<br>
++=C2=A0 =C2=A0 =C2=A0 if (in_size =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (buffer_is_zeroed(input_data, in_size)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!d-&gt;logged_silenc=
e_buffer) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;compress-forwarder source:%s ignoring zeroed startup=
 buffer size=3D%u flags=3D0x%x&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_n=
ame, in_size, in_data-&gt;chunk-&gt;flags);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;logged_silence_buffer =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;logged_first_buffer) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *bytes =3D=
 SPA_PTROFF(in_data-&gt;data, in_offset, const uint8_t);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s first non-silence buffer size=3D%u offset=3D%u flag=
s=3D0x%x&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, in_size, in_offset, in_=
data-&gt;chunk-&gt;flags);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s first non-silence bytes=3D%02x %02x %02x %02x %02x =
%02x %02x %02x&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 0 ? bytes[0] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 1 ? bytes[1] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 2 ? bytes[2] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 3 ? bytes[3] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 4 ? bytes[4] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 5 ? bytes[5] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 6 ? bytes[6] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_size &gt; 7 ? bytes[7] : 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;logged_first_buffe=
r =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback_failed)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D append_pending_data(d, input_data, in_size);=
<br>
++=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder source:%s failed to preserve input before target write: %s&qu=
ot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, spa_strerror(res));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *pending =
=3D d-&gt;pending_data + d-&gt;pending_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t available =3D d=
-&gt;pending_size - d-&gt;pending_offset;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (available &gt;=3D CO=
MPRESS_RAW_AAC_HEADER_SIZE &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_tr=
ansport_header(pending, available, &amp;raw_frame_size)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (available &lt; COMPRESS_RAW_AAC_HEADER_SIZE + raw_frame_size) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d-&gt;capture, in_bu=
f);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 framed_raw_aac =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 input_data =3D pending + COMPRESS_RAW_AAC_HEADER_SIZE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 in_size =3D raw_frame_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL &amp;&amp; !detect_pa=
yload_codec(d, input_data, in_size)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (codec_is_auto(d-&gt;=
codec)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;compress-forwarder source:%s waiting for codec metad=
ata, preserved=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_n=
ame, d-&gt;pending_size - d-&gt;pending_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_stream_queue_buffer(d-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder source:%s unsupported payload header for codec=3D%s&quot;,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, d-&gt;codec);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 request_playback_activat=
ion(d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=
=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;compress-forwarder source:%s preserved %u bytes pend=
ing target create total=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_n=
ame, in_size, d-&gt;pending_size - d-&gt;pending_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_stream_queue_buffer(d-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;playback_active)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, t=
rue);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback_failed || !d-&gt;playback_active)=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s preserved %u bytes pending inactive target total=3D=
%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, in_size, d-&gt;pending_=
size - d-&gt;pending_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 out_buf =3D pw_stream_dequeue_buffer(d-&gt;playback)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 if (out_buf =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder source:%s preserved %u bytes pending output buffer total=3D%u=
&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;monitor_name, in_size, d-&gt;pending_=
size - d-&gt;pending_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 out_data =3D &amp;out_buf-&gt;buffer-&gt;datas[0];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 if (out_data-&gt;data =3D=3D NULL || out_data-&gt;ch=
unk =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;playback, out_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 out_size =3D out_data-&gt;maxsize;<br>
++=C2=A0 =C2=A0 =C2=A0 if (out_size =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;playback, out_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d=
-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 copy_data =3D d-&gt;pending_data + d-&gt;pending_off=
set;<br>
++=C2=A0 =C2=A0 =C2=A0 copy_available =3D d-&gt;pending_size - d-&gt;pendin=
g_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 if (framed_raw_aac) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (raw_frame_size &gt; =
out_size) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_error(&quot;compress-forwarder raw AAC access unit too large siz=
e=3D%u output=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_frame_size,=
 out_size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_stream_queue_buffer(d-&gt;playback, out_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_stream_queue_buffer(d-&gt;capture, in_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_data =3D SPA_PTROFF=
(copy_data, COMPRESS_RAW_AAC_HEADER_SIZE, const void);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size =3D raw_frame_=
size;<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size =3D SPA_MIN(co=
py_available, out_size);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(out_data-&gt;data, copy_data, copy_size);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_offset +=3D copy_size +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (framed_raw_aac ? COMPRESS_RAW_AAC_HEADER_SIZE : 0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;pending_offset &gt;=3D d-&gt;pending_size)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;offset =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;size =3D copy_size;<br>
++=C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;stride =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 out_buf-&gt;size =3D copy_size;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!d-&gt;logged_first_output_buffer) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *out_bytes=
 =3D out_data-&gt;data;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder target:%s queue buffer copy_size=3D%u out_max=3D%u chunk=3D%u=
/%u/%d bytes=3D%02x %02x %02x %02x %02x %02x %02x %02x&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_name, copy_size, out_data-&gt;=
maxsize,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;offset, out_data-&gt=
;chunk-&gt;size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_data-&gt;chunk-&gt;stride,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 0 ? out_bytes[0] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 1 ? out_bytes[1] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 2 ? out_bytes[2] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 3 ? out_bytes[3] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 4 ? out_bytes[4] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 5 ? out_bytes[5] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 6 ? out_bytes[6] : 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_size &gt; 7 ? out_bytes[7] : 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;logged_first_outpu=
t_buffer =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d-&gt;playback, out_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_queue_buffer(d-&gt;capture, in_buf);<br>
++}<br>
++<br>
++static const struct pw_stream_events capture_events =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
++=C2=A0 =C2=A0 =C2=A0 .state_changed =3D capture_state_changed,<br>
++=C2=A0 =C2=A0 =C2=A0 .process =3D capture_process,<br>
++};<br>
++<br>
++static const struct pw_stream_events playback_events =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 PW_VERSION_STREAM_EVENTS,<br>
++=C2=A0 =C2=A0 =C2=A0 .state_changed =3D playback_state_changed,<br>
++};<br>
++<br>
++static void clear_client_node(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;client_node =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&gt;client_node_listener);<br=
>
++=C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy((struct pw_proxy *)d-&gt;client_nod=
e);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;client_node =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;client_node_id =3D PW_ID_ANY;<br>
++}<br>
++<br>
++static void client_node_info(void *data, const struct pw_node_info *info)=
<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;props =3D=3D NULL || !update_codec_from=
_props(d, info-&gt;props))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compre=
ss-forwarder final stream codec changed, recreating target codec=3D%s rate=
=3D%u channels=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;codec, d-&gt;rate, d-&gt;channels);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;capture_streaming &amp;&amp; d-&gt;pending=
_size &gt; d-&gt;pending_offset)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 request_playback_activat=
ion(d);<br>
++}<br>
++<br>
++static const struct pw_node_events client_node_events =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 PW_VERSION_NODE_EVENTS,<br>
++=C2=A0 =C2=A0 =C2=A0 .info =3D client_node_info,<br>
++};<br>
++<br>
++static void registry_global(void *data, uint32_t id, uint32_t permissions=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *type, uint32=
_t version, const struct spa_dict *props)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *name, *target, *media_class, *forwarder_=
source;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || prop=
s =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 name =3D spa_dict_lookup(props, PW_KEY_NODE_NAME);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 if (spa_streq(name, d-&gt;target_name)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D id;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder target:%s resolved id=3D%u&quot;, d-&gt;target_name, id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 media_class =3D spa_dict_lookup(props, PW_KEY_MEDIA_=
CLASS);<br>
++=C2=A0 =C2=A0 =C2=A0 target =3D spa_dict_lookup(props, PW_KEY_TARGET_OBJE=
CT);<br>
++=C2=A0 =C2=A0 =C2=A0 forwarder_source =3D spa_dict_lookup(props, &quot;co=
mpress.forwarder.source&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (spa_streq(media_class, &quot;Stream/Output/Audio=
&quot;) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !spa_streq(name, &quot;compress-offloa=
d-forwarder-output&quot;) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (spa_streq(forwarder_source, d-&gt;sou=
rce_name) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spa_streq(target, d-&gt;source_n=
ame) || spa_streq(target, d-&gt;monitor_name))) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-&gt;client_node !=
=3D NULL &amp;&amp; d-&gt;client_node_id !=3D id) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 destroy_playback_stream(d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clear_pending_data(d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_client_node(d);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset_codec_state(d);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_codec_from_props(=
d, props);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;client_node =3D pw=
_registry_bind(d-&gt;registry, id, type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version &lt; (uint32_t)PW_VERSION_NODE ? ve=
rsion : PW_VERSION_NODE, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-&gt;client_node =
=3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_error(&quot;compress-forwarder failed to bind client stream node=
 id=3D%u&quot;, id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;client_node_id =3D=
 id;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_node_add_listener(d-&=
gt;client_node, &amp;d-&gt;client_node_listener,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;client_node_events, d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder tracking client stream node id=3D%u&quot;, id);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++static void registry_global_remove(void *data, uint32_t id)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (id =3D=3D d-&gt;client_node_id) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder client stream removed id=3D%u&quot;, id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_client_node(d);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_pending_data(d);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset_codec_state(d);<br=
>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (id =3D=3D d-&gt;target_id) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder target:%s removed id=3D%u&quot;, d-&gt;target_name, id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D PW_I=
D_ANY;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++static const struct pw_registry_events registry_events =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 PW_VERSION_REGISTRY_EVENTS,<br>
++=C2=A0 =C2=A0 =C2=A0 .global =3D registry_global,<br>
++=C2=A0 =C2=A0 =C2=A0 .global_remove =3D registry_global_remove,<br>
++};<br>
++<br>
++static int create_playback_stream(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_properties *props;<br>
++=C2=A0 =C2=A0 =C2=A0 const struct spa_pod *params[2];<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t buffer[1024];<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder builder;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t n_params =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 int res;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_auto(d-&gt;codec))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_aac_raw(d-&gt;codec) &amp;&amp; d-&gt;a=
ac_audio_object_type =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder raw AAC missing audio object type&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 props =3D pw_properties_new(PW_KEY_MEDIA_CLASS, &quo=
t;Stream/Output/Audio&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_NAME, &quot;compress-offload-forwarder-output&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_MEDIA_TYPE, &quot;Audio&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_MEDIA_CATEGORY, &quot;Playback&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_MEDIA_ROLE, &quot;Music&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_TARGET_OBJECT, d-&gt;target_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_AUTOCONNECT, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_STREAM_DONT_REMIX, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;node.dont-reconnect&quot;, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;compress.offload&quot;, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;codec.type&quot;, d-&gt;codec,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 if (props =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.sample_rate&qu=
ot;, &quot;%u&quot;, d-&gt;rate);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.channels&quot;=
, &quot;%u&quot;, d-&gt;channels);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.bit_rate&quot;=
, &quot;%u&quot;, d-&gt;bitrate);<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_aac(d-&gt;codec)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;codec.aac.stream_format&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;aac_stream_format[0] !=3D &#39;\0&#39=
; ? d-&gt;aac_stream_format :<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (codec_is_aac_adts(d-&gt;codec) ? &quot;adt=
s&quot; : &quot;raw&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props=
, &quot;codec.aac.audio_object_type&quot;, &quot;%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;aac_audio_object_type !=3D 0 ? d-&gt;=
aac_audio_object_type :<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (codec_is_aac_adts(d-&gt;codec) ? 2 : 0));<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-&gt;aac_codec_data=
[0] !=3D &#39;\0&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;codec.aac.codec_data&quot;, d-&gt;aac_co=
dec_data);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_NODE_RATE, &quot;1/=
%u&quot;, d-&gt;rate);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;playback =3D pw_stream_new(d-&gt;core, &quot;c=
ompress offload forwarder output&quot;, props);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;playback =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(d-&gt;playback, &amp;d-&gt;pl=
ayback_listener, &amp;playback_events, d);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_pod_builder_init(&amp;builder, buffer, sizeof(bu=
ffer));<br>
++=C2=A0 =C2=A0 =C2=A0 params[n_params++] =3D build_encoded_format(d, &amp;=
builder, SPA_PARAM_EnumFormat);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder target:%s conne=
ct target-id=3D%u codec=3D%s rate=3D%u channels=3D%u bitrate=3D%u&quot;,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;target_name, d-&gt;target_id, d-&gt;codec, d-&gt;rate, d-&gt;chan=
nels, d-&gt;bitrate);<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D pw_stream_connect(d-&gt;playback, PW_DIRECTI=
ON_OUTPUT, d-&gt;target_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_NO_CONVERT |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_MAP_BUFFERS |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_RT_PROCESS,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params, n_params);<br>
++=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(=
d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_set_active(d-&gt;playback, false);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_active =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;playback_failed =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int create_capture_stream(struct forwarder_data *d)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_properties *props;<br>
++=C2=A0 =C2=A0 =C2=A0 const struct spa_pod *params[2];<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t buffer[1024];<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder builder;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t n_params =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 int res;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 props =3D pw_properties_new(PW_KEY_MEDIA_CLASS, &quo=
t;Stream/Input/Audio&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_NAME, &quot;compress-offload-forwarder-capture&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_TARGET_OBJECT, d-&gt;source_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_NODE_AUTOCONNECT, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_STREAM_CAPTURE_SINK, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_KEY_STREAM_DONT_REMIX, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;node.dont-reconnect&quot;, &quot;true&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 if (props =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_NODE_RATE, &quot;1/=
%u&quot;, d-&gt;rate);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;capture =3D pw_stream_new(d-&gt;core, &quot;co=
mpress offload forwarder capture&quot;, props);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;capture =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_add_listener(d-&gt;capture, &amp;d-&gt;cap=
ture_listener, &amp;capture_events, d);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_pod_builder_init(&amp;builder, buffer, sizeof(bu=
ffer));<br>
++=C2=A0 =C2=A0 =C2=A0 params[n_params++] =3D build_raw_format(d, &amp;buil=
der, SPA_PARAM_EnumFormat);<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D pw_stream_connect(d-&gt;capture, PW_DIRECTIO=
N_INPUT, PW_ID_ANY,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_MAP_BUFFERS |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_RT_PROCESS,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params, n_params);<br>
++=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_stream_set_active(d-&gt;capture, true);<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static void core_error(void *data, uint32_t id, int seq, int res, const c=
har *message)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compress-forwarder error id:%u se=
q:%d res:%d (%s): %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 id, seq, res, spa_strerror(res), message);<br>
++=C2=A0 =C2=A0 =C2=A0 if (id =3D=3D PW_ID_CORE &amp;&amp; res =3D=3D -EPIP=
E)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_schedule_unload(m=
odule);<br>
++}<br>
++<br>
++static const struct pw_core_events core_events =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 PW_VERSION_CORE_EVENTS,<br>
++=C2=A0 =C2=A0 =C2=A0 .error =3D core_error,<br>
++};<br>
++<br>
++static int module_compress_offload_forwarder_load(struct module *module)<=
br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D module-&gt;user_data;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 int res;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 PW_LOG_TOPIC_INIT(mod_topic);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;loop =3D pw_context_get_main_loop(module-&gt;i=
mpl-&gt;context);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;loop =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;activate_event =3D pw_loop_add_event(d-&gt;loo=
p, playback_activate_event, d);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;activate_event =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D pw_context_connect(module-&gt;impl-&g=
t;context, NULL, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_core_add_listener(d-&gt;core, &amp;d-&gt;core_lis=
tener, &amp;core_events, module);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D PW_ID_ANY;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;registry =3D pw_core_get_registry(d-&gt;core, =
PW_VERSION_REGISTRY, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;registry =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_registry_add_listener(d-&gt;registry, &amp;d-&gt;=
registry_listener, &amp;registry_events, d);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D create_capture_stream(d);<br>
++=C2=A0 =C2=A0 =C2=A0 if (res &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
++=C2=A0 =C2=A0 =C2=A0 active_forwarder =3D d;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder loaded: source=
=3D%s monitor=3D%s target=3D%s codec=3D%s rate=3D%u channels=3D%u&quot;,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;source_name, d-&gt;monitor_name, d-&gt;target_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d-&gt;codec, d-&gt;rate, d-&gt;channels);<br>
++=C2=A0 =C2=A0 =C2=A0 module_emit_loaded(module, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int module_compress_offload_forwarder_unload(struct module *module=
)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D module-&gt;user_data;<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (active_forwarder =3D=3D d)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 active_forwarder =3D NUL=
L;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;capture !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;capture_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(d-&gt;=
capture);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;capture =3D NULL;<=
br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(d);<br>
++=C2=A0 =C2=A0 =C2=A0 clear_client_node(d);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;registry !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;registry_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy((struct=
 pw_proxy*)d-&gt;registry);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;registry =3D NULL;=
<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;core_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_core_disconnect(d-&gt=
;core);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;activate_event !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_loop_destroy_source(d=
-&gt;loop, d-&gt;activate_event);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;activate_event =3D=
 NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;loop =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int module_compress_offload_forwarder_prepare(struct module *modul=
e)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D module-&gt;user_data;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 struct pw_properties *props =3D module-&gt;props;<br=
>
++=C2=A0 =C2=A0 =C2=A0 const char *str;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 PW_LOG_TOPIC_INIT(mod_topic);<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;source_sink&q=
uot;);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;source_name, sizeof(d-&gt;source=
_name), &quot;%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 str ? str : &quot;pal_speaker_compress&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;target_sink&q=
uot;);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;target_name, sizeof(d-&gt;target=
_name), &quot;%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 str ? str : &quot;pal_sink_speaker_compress&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;codec&quot;);=
<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;codec, sizeof(d-&gt;codec), &quo=
t;%s&quot;, str ? str : DEFAULT_CODEC);<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;codec.aac.str=
eam_format&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_stream_format, sizeof(d-&gt;=
aac_stream_format), &quot;%s&quot;, str ? str : &quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;codec.aac.cod=
ec_data&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_codec_data, sizeof(d-&gt;aac=
_codec_data), &quot;%s&quot;, str ? str : &quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;aac_audio_object_type =3D pw_properties_get_ui=
nt32(props, &quot;codec.aac.audio_object_type&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;rate =3D pw_properties_get_uint32(props, &quot=
;rate&quot;, DEFAULT_RATE);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;channels =3D pw_properties_get_uint32(props, &=
quot;channels&quot;, DEFAULT_CHANNELS);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;bitrate =3D pw_properties_get_uint32(props, &q=
uot;bitrate&quot;, DEFAULT_BITRATE);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;block_size =3D pw_properties_get_uint32(props,=
 &quot;block_size&quot;, DEFAULT_BLOCK_SIZE);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;monitor_name, sizeof(d-&gt;monit=
or_name), &quot;%s.monitor&quot;, d-&gt;source_name);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;client_node_id =3D PW_ID_ANY;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!codec_is_auto(d-&gt;codec) &amp;&amp; !codec_is=
_mp3(d-&gt;codec) &amp;&amp; !codec_is_aac(d-&gt;codec)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;compre=
ss-forwarder only supports auto, mp3, aac and aac_adts right now, requested=
 codec=3D%s&quot;, d-&gt;codec);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_aac_adts(d-&gt;codec) &amp;&amp; d-&gt;=
aac_stream_format[0] =3D=3D &#39;\0&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_=
stream_format, sizeof(d-&gt;aac_stream_format), &quot;adts&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec_is_aac_raw(d-&gt;codec) &amp;&amp; d-&gt;a=
ac_stream_format[0] =3D=3D &#39;\0&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_scnprintf(d-&gt;aac_=
stream_format, sizeof(d-&gt;aac_stream_format), &quot;raw&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;channels =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;channels =3D DEFAU=
LT_CHANNELS;<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;rate =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;rate =3D DEFAULT_R=
ATE;<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;block_size =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;block_size =3D DEF=
AULT_BLOCK_SIZE;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static const struct spa_dict_item module_compress_offload_forwarder_info[=
] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_DESCRIPTION, &quot;Forward encoded P=
ulseAudio streams to a compressed-offload sink&quot; },<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_USAGE,=C2=A0 =C2=A0 =C2=A0 =C2=A0pul=
se_module_options },<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_VERSION,=C2=A0 =C2=A0 =C2=A0PACKAGE_=
VERSION },<br>
++};<br>
++<br>
++DEFINE_MODULE_INFO(module_compress_offload_forwarder) =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;module-com=
press-offload-forwarder&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 .prepare=C2=A0 =C2=A0 =3D module_compress_offload_fo=
rwarder_prepare,<br>
++=C2=A0 =C2=A0 =C2=A0 .load=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D module_compress_=
offload_forwarder_load,<br>
++=C2=A0 =C2=A0 =C2=A0 .unload=C2=A0 =C2=A0 =C2=A0=3D module_compress_offlo=
ad_forwarder_unload,<br>
++=C2=A0 =C2=A0 =C2=A0 .properties =3D &amp;SPA_DICT_INIT_ARRAY(module_comp=
ress_offload_forwarder_info),<br>
++=C2=A0 =C2=A0 =C2=A0 .data_size=C2=A0 =3D sizeof(struct forwarder_data),<=
br>
++};<br>
+diff --git a/src/modules/module-protocol-pulse/modules/pulse-module-compre=
ss-offload-forwarder.h b/src/modules/module-protocol-pulse/modules/pulse-mo=
dule-compress-offload-forwarder.h<br>
+new file mode 100644<br>
+index 000000000..e936aad09<br>
+--- /dev/null<br>
++++ b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offl=
oad-forwarder.h<br>
+@@ -0,0 +1,20 @@<br>
++/* PipeWire */<br>
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */<=
br>
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */<br>
++<br>
++#ifndef MODULE_COMPRESS_OFFLOAD_FORWARDER_H<br>
++#define MODULE_COMPRESS_OFFLOAD_FORWARDER_H<br>
++<br>
++#include &lt;spa/utils/dict.h&gt;<br>
++<br>
++#define COMPRESS_RAW_AAC_MAGIC_0 &#39;P&#39;<br>
++#define COMPRESS_RAW_AAC_MAGIC_1 &#39;W&#39;<br>
++#define COMPRESS_RAW_AAC_MAGIC_2 &#39;A&#39;<br>
++#define COMPRESS_RAW_AAC_MAGIC_3 &#39;A&#39;<br>
++#define COMPRESS_RAW_AAC_HEADER_SIZE 8u<br>
++<br>
++void compress_offload_forwarder_update(const char *source_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spa_dict *p=
rops);<br>
++void compress_offload_forwarder_teardown(const char *source_name);<br>
++<br>
++#endif<br>
+diff --git a/src/modules/module-protocol-pulse/modules/pulse-module-compre=
ss-offload-sink.c b/src/modules/module-protocol-pulse/modules/pulse-module-=
compress-offload-sink.c<br>
+new file mode 100644<br>
+index 000000000..832131e68<br>
+--- /dev/null<br>
++++ b/src/modules/module-protocol-pulse/modules/pulse-module-compress-offl=
oad-sink.c<br>
+@@ -0,0 +1,308 @@<br>
++/* PipeWire */<br>
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */<=
br>
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */<br>
++<br>
++#include &lt;errno.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
++<br>
++#include &lt;spa/utils/result.h&gt;<br>
++#include &lt;pipewire/pipewire.h&gt;<br>
++<br>
++#include &quot;../module.h&quot;<br>
++<br>
++/** \page page_pulse_module_compress_offload_sink Compress Offload Sink<b=
r>
++ *<br>
++ * ## Module Name<br>
++ *<br>
++ * `module-compress-offload-sink`<br>
++ *<br>
++ * ## Module Options<br>
++ *<br>
++ * @pulse_module_options@<br>
++ */<br>
++<br>
++static const char *const pulse_module_options =3D<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sink_name=3D&lt;name of sink&gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sink_properties=3D&lt;properties for the sink&=
gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;target_sink=3D&lt;<a href=3D"http://node.name"=
 rel=3D"noreferrer" target=3D"_blank">node.name</a> of the downstream compr=
ess-offload sink&gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;codec=3D&lt;codec name, default auto&gt; &quot=
;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;rate=3D&lt;sample rate, default 44100&gt; &quo=
t;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;channels=3D&lt;number of channels, default 2&g=
t; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;bitrate=3D&lt;bit rate, default 128000&gt;&quo=
t;;<br>
++<br>
++#define NAME &quot;compress-offload-sink&quot;<br>
++<br>
++PW_LOG_TOPIC_STATIC(mod_topic, &quot;mod.&quot; NAME);<br>
++#define PW_LOG_TOPIC_DEFAULT mod_topic<br>
++<br>
++struct module_compress_offload_sink_data {<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_core *core;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_hook core_listener;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_proxy *proxy;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_hook proxy_listener;<br>
++};<br>
++<br>
++static void module_proxy_removed(void *data)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder proxy removed:=
 proxy=3D%p&quot;, d-&gt;proxy);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy(d-&gt;proxy);<br>
++}<br>
++<br>
++static void module_proxy_destroy(void *data)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder proxy destroy:=
 proxy=3D%p - scheduling module unload&quot;, d-&gt;proxy);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&gt;proxy_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;proxy =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 module_schedule_unload(module);<br>
++}<br>
++<br>
++static void module_proxy_bound_props(void *data, uint32_t global_id, cons=
t struct spa_dict *props)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;proxy %p bound id:%u module_index=
=3D%u&quot;, d-&gt;proxy, global_id, module-&gt;index);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder node successfu=
lly created and bound, emitting loaded&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 module_emit_loaded(module, 0);<br>
++}<br>
++<br>
++static void module_proxy_error(void *data, int seq, int res, const char *=
message)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;proxy %p error %d: %s&quot;, d-&g=
t;proxy, res, message);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy(d-&gt;proxy);<br>
++}<br>
++<br>
++static const struct pw_proxy_events proxy_events =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 PW_VERSION_PROXY_EVENTS,<br>
++=C2=A0 =C2=A0 =C2=A0 .removed=C2=A0 =C2=A0 =C2=A0 =3D module_proxy_remove=
d,<br>
++=C2=A0 =C2=A0 =C2=A0 .bound_props=C2=A0 =3D module_proxy_bound_props,<br>
++=C2=A0 =C2=A0 =C2=A0 .error=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D module_proxy_e=
rror,<br>
++=C2=A0 =C2=A0 =C2=A0 .destroy=C2=A0 =C2=A0 =C2=A0 =3D module_proxy_destro=
y,<br>
++};<br>
++<br>
++static void module_core_error(void *data, uint32_t id, int seq, int res, =
const char *message)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module *module =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;error id:%u seq:%d res:%d (%s): %=
s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 id, seq, res, spa_strerror(res), message);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (id =3D=3D PW_ID_CORE &amp;&amp; res =3D=3D -EPIP=
E)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_schedule_unload(m=
odule);<br>
++}<br>
++<br>
++static const struct pw_core_events core_events =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 PW_VERSION_CORE_EVENTS,<br>
++=C2=A0 =C2=A0 =C2=A0 .error =3D module_core_error,<br>
++};<br>
++<br>
++static int module_compress_offload_sink_load(struct module *module)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder load: node=3D%s=
 target=3D%s codec=3D%s rate=3D%s channels=3D%s bitrate=3D%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, PW_KEY_NODE_NAME),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;compress.target.object&quot;)=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.type&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.sample_rate&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.channels&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(module-&gt;props, &quot;codec.bit_rate&quot;));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D pw_context_connect(module-&gt;impl-&g=
t;context, NULL, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder core connect failed: errno=3D%d (%s)&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno, spa_strerror(-errno));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder core connected=
: core=3D%p&quot;, d-&gt;core);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_core_add_listener(d-&gt;core, &amp;d-&gt;core_lis=
tener, &amp;core_events, module);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(module-&gt;props, &quot;<a href=
=3D"http://pulse.module.id" rel=3D"noreferrer" target=3D"_blank">pulse.modu=
le.id</a>&quot;, &quot;%u&quot;, module-&gt;index);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;proxy =3D pw_core_create_object(d-&gt;core,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ada=
pter&quot;, PW_TYPE_INTERFACE_Node, PW_VERSION_NODE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module-&g=
t;props ? &amp;module-&gt;props-&gt;dict : NULL, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;proxy =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_error(&quot;compr=
ess-forwarder adapter create failed: errno=3D%d (%s)&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno, spa_strerror(-errno));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder adapter create=
 requested: proxy=3D%p - waiting for bound_props&quot;, d-&gt;proxy);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_proxy_add_listener(d-&gt;proxy, &amp;d-&gt;proxy_=
listener, &amp;proxy_events, module);<br>
++=C2=A0 =C2=A0 =C2=A0 return SPA_RESULT_RETURN_ASYNC(0);<br>
++}<br>
++<br>
++static int module_compress_offload_sink_unload(struct module *module)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_compress_offload_sink_data *d =3D modu=
le-&gt;user_data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder unload: proxy=
=3D%p core=3D%p - cleaning up&quot;, d-&gt;proxy, d-&gt;core);<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;proxy !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;proxy_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_proxy_destroy(d-&gt;p=
roxy);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;proxy =3D NULL;<br=
>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;core !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;core_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_core_disconnect(d-&gt=
;core);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;core =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int module_compress_offload_sink_prepare(struct module * const mod=
ule)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_properties * const props =3D module-&gt;pr=
ops;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *str;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t rate =3D 44100;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t channels =3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t bitrate =3D 128000;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 PW_LOG_TOPIC_INIT(mod_topic);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;sink_nam=
e&quot;)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: sink_name=3D%s&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 PW_KEY_NODE_NAME, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;sink_name&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: sink_name missing, using default&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 PW_KEY_NODE_NAME, &quot;compress-offload-sink&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;sink_pro=
perties&quot;)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: sink_properties=3D%s&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_args_add_props(pr=
ops, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;sink_properties&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;target_s=
ink&quot;)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compr=
ess-forwarder option: target_sink=3D%s&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;compress.target.object&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;target_sink&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;compre=
ss-forwarder option: target_sink missing; stream will not have explicit com=
press target&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;rate&quo=
t;)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t v =3D (uint32_t=
)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (v &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rate =3D v;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;rate&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;channels=
&quot;)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t v =3D (uint32_t=
)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (v &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 channels =3D v;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;channels&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;bitrate&=
quot;)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t v =3D (uint32_t=
)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (v &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bitrate =3D v;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;bitrate&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if ((str =3D pw_properties_get(props, &quot;channel_=
map&quot;)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;audio.position&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;channel_map&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (channels) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ MONO ]&quo=
t;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR ]&qu=
ot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR LFE =
]&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR RL R=
R ]&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 5:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR FC R=
L RR ]&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 6:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR FC L=
FE RL RR ]&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 8:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;audio.position&quot;, &quot;[ FL FR FC L=
FE RL RR SL SR ]&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D pw_properties_get(props, &quot;codec&quot;);=
<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;codec.type&quot;, str=
 ? str : &quot;auto&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;codec.formats&quot;, =
&quot;[ mp3 aac_adts aac ]&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.sample_rate&qu=
ot;, &quot;%u&quot;, rate);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.channels&quot;=
,=C2=A0 =C2=A0 &quot;%u&quot;, channels);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.bit_rate&quot;=
,=C2=A0 =C2=A0 &quot;%u&quot;, bitrate);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;codec&quot;, NULL);<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(props, PW_KEY_MEDIA_CLASS) =3D=
=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 PW_KEY_MEDIA_CLASS, &quot;Audio/Sink&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(props, PW_KEY_NODE_DESCRIPTION=
) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props=
, PW_KEY_NODE_DESCRIPTION, &quot;%s (compress offload)&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get(props, PW_KEY_NODE_NAME))=
;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Advertise this node as an encoded-only sink =
so WirePlumber&#39;s<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* canPassthrough() allows linking compress str=
eams to it.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* audio.format=3DS16LE is kept as the syntheti=
c PCM sample_spec that<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Pulse clients see in pactl; no PCM conversio=
n ever occurs.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_AUDIO_FORMAT,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;S16LE&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_AUDIO_RATE,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%u&quot;, rate=
);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, PW_KEY_AUDIO_CHANNELS,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%u&quot;, channels);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;item.node.supports-en=
coded-fmts&quot;,=C2=A0 &quot;true&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_NODE_VIRTUAL,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_PRIORITY_SESSION,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_PRIORITY_DRIVER,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;1&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;monitor.channel-volum=
es&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;false&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;monitor.passthrough&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot;);<br=
>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;channelmix.disable&qu=
ot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot=
;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;resample.disable&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true=
&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;compress.carrier.rate=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;48000&quot;);<=
br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;compress.carrier.chan=
nels&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;2&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;compress.offload&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;true&=
quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, PW_KEY_FACTORY_NAME,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;support.null-audio-s=
ink&quot;);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;prepared compress-forwarder alias:=
 name=3D%s target=3D%s codec=3D%s rate=3D%u channels=3D%u bitrate=3D%u medi=
a.class=3D%s audio.format=3D%s virtual=3D%s factory=3D%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_NODE_NAME),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, &quot;compress.target.object&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, &quot;codec.type&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rate, channels, bitrate,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_MEDIA_CLASS),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_AUDIO_FORMAT),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_NODE_VIRTUAL),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, PW_KEY_FACTORY_NAME));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static const struct spa_dict_item module_compress_offload_sink_info[] =3D=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_DESCRIPTION, &quot;Pulse-visible ali=
as sink for compressed offload playback&quot; },<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_USAGE,=C2=A0 =C2=A0 =C2=A0 =C2=A0pul=
se_module_options },<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_VERSION,=C2=A0 =C2=A0 =C2=A0PACKAGE_=
VERSION },<br>
++};<br>
++<br>
++DEFINE_MODULE_INFO(module_compress_offload_sink) =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;module-com=
press-offload-sink&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 .prepare=C2=A0 =C2=A0 =3D module_compress_offload_si=
nk_prepare,<br>
++=C2=A0 =C2=A0 =C2=A0 .load=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D module_compress_=
offload_sink_load,<br>
++=C2=A0 =C2=A0 =C2=A0 .unload=C2=A0 =C2=A0 =C2=A0=3D module_compress_offlo=
ad_sink_unload,<br>
++=C2=A0 =C2=A0 =C2=A0 .properties =3D &amp;SPA_DICT_INIT_ARRAY(module_comp=
ress_offload_sink_info),<br>
++=C2=A0 =C2=A0 =C2=A0 .data_size=C2=A0 =3D sizeof(struct module_compress_o=
ffload_sink_data),<br>
++};<br>
+-- <br>
+GitLab<br>
+<br>
+<br>
+From 574fec7ebc482a462b2842422cec156aa9a43f1e Mon Sep 17 00:00:00 2001<br>
+From: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" target=
=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+Date: Fri, 23 Oct 2026 17:45:41 +0530<br>
+Subject: [PATCH 4/4] pulse-server: preserve encoded streams for compressed=
<br>
+ offload<br>
+<br>
+Recognize compressed-offload sinks when Pulse playback streams are<br>
+created and advertise MP3, AAC ADTS, and raw AAC formats with their<br>
+codec parameters.<br>
+<br>
+Configure compressed streams for byte-preserving transport: use a<br>
+single-byte frame size, disable format conversion, remove playback<br>
+prebuffering, and connect the stream with an encoded format while<br>
+retaining the negotiated codec properties.<br>
+<br>
+Frame each raw AAC access unit with its payload length before writing it<b=
r>
+to the Pulse ring buffer. Include the framing bytes in buffer-capacity<br>
+checks and use the stream&#39;s allocated buffer size when wrapping the<br=
>
+write position.<br>
+<br>
+Track the forwarding source on each stream and notify the forwarder when<b=
r>
+the Pulse playback stream is freed. This lets the target stream and any<br=
>
+pending encoded data be released when playback ends or the client is<br>
+removed.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/pipe=
wire/pipewire/-/merge_requests/2878" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878</a>]<=
br>
+Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com"=
 target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+---<br>
+ .../module-protocol-pulse/pulse-server.c=C2=A0 =C2=A0 =C2=A0 | 654 ++++++=
+++++++++++-<br>
+ src/modules/module-protocol-pulse/server.c=C2=A0 =C2=A0 |=C2=A0 35 +-<br>
+ src/modules/module-protocol-pulse/stream.c=C2=A0 =C2=A0 |=C2=A0 =C2=A05 +=
<br>
+ src/modules/module-protocol-pulse/stream.h=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +=
<br>
+ 4 files changed, 675 insertions(+), 21 deletions(-)<br>
+<br>
+diff --git a/src/modules/module-protocol-pulse/pulse-server.c b/src/module=
s/module-protocol-pulse/pulse-server.c<br>
+index 153be0c4f..d8a8591d8 100644<br>
+--- a/src/modules/module-protocol-pulse/pulse-server.c<br>
++++ b/src/modules/module-protocol-pulse/pulse-server.c<br>
+@@ -34,6 +34,7 @@<br>
+ #include &lt;pipewire/extensions/metadata.h&gt;<br>
+ <br>
+ #include &quot;pulse-server.h&quot;<br>
++#include &quot;modules/pulse-module-compress-offload-forwarder.h&quot;<br=
>
+ #include &quot;client.h&quot;<br>
+ #include &quot;collect.h&quot;<br>
+ #include &quot;commands.h&quot;<br>
+@@ -89,6 +90,9 @@ struct temporary_move_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t used:1;<br>
+ };<br>
+ <br>
++/* Buffer size used for compress-offload streams (frame_size =3D=3D 1). *=
/<br>
++#define COMPRESS_OFFLOAD_BUF_SIZE=C2=A0 16484u<br>
++<br>
+ static struct sample *find_sample(struct impl *impl, uint32_t index, cons=
t char *name)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0union pw_map_item *item;<br>
+@@ -1223,10 +1227,18 @@ static const struct spa_pod *get_buffers_param(str=
uct stream *s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0blocks =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stride =3D s-&gt;frame_size;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 /* compressed offload uses byte granularity */<br>
++=C2=A0 =C2=A0 =C2=A0 if (s-&gt;frame_size =3D=3D 1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D COMPRESS_OFFLOA=
D_BUF_SIZE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] =
get_buffers_param: compress offload path size=3D%u&quot;, s-&gt;client-&gt;=
name, size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto build_buffers_param=
;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D defs-&gt;quantum_limit * s-&gt;frame_s=
ize;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_log_info(&quot;[%s] stride %d size %u&quot;,=
 s-&gt;client-&gt;name, stride, size);<br>
+ <br>
++build_buffers_param:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0param =3D spa_pod_builder_add_object(b,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_PARAM_BUFFERS_buffers, SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,<=
br>
+@@ -1252,6 +1264,23 @@ static void stream_param_changed(void *data, uint32=
_t id, const struct spa_pod *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (id !=3D SPA_PARAM_Format || param =3D=3D NU=
LL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 /* For compress-offload streams, force byte-granular=
ity regardless<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* of negotiated format (we connect with S16LE =
but data is compressed). */<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *co =3D strea=
m-&gt;props ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(stream-&gt;props, &quot;compress.offload&quot;) : NUL=
L;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (co &amp;&amp; pw_pro=
perties_parse_bool(co)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint32_t media_type =3D 0, media_subtype =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spa_format_parse(param, &amp;media_type, &amp;media_subtype);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stream-&gt;frame_size =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stream-&gt;rate =3D stream-&gt;ss.rate ? stream-&gt;ss.rate :<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get_uint32(stream-&gt;props, =
&quot;codec.sample_rate&quot;, 44100);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;[%s] compress-offload stream_param_changed: forcing =
frame_size=3D1 rate=3D%u subtype=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;client-&gt;name, stream-&gt;rate=
, media_subtype);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto stream_param_format_done;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((res =3D format_parse_param(param, false, &=
amp;stream-&gt;ss, &amp;stream-&gt;map, NULL, NULL)) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw_stream_set_error=
(stream-&gt;stream, res, &quot;format not supported&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+@@ -1267,6 +1296,9 @@ static void stream_param_changed(void *data, uint32_=
t id, const struct spa_pod *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stream-&gt;rate =3D stream-&gt;ss.rate;<br>
++stream_param_format_done:<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] stream param done: frame_siz=
e=3D%u rate=3D%u ss.format=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stream-&gt;client-&gt;name, stream-&gt;frame_size, stream-&gt;rate, str=
eam-&gt;ss.format);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream-&gt;create_tag !=3D SPA_ID_INVALID) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_manager_o=
bject *peer;<br>
+@@ -1621,6 +1653,395 @@ static void log_format_info(struct impl *impl, enu=
m spa_log_level level, struct<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0impl, it-&gt;key, it-&gt;value);<br>
+ }<br>
+ <br>
++static const struct spa_pod *build_compress_offload_format(struct spa_pod=
_builder *b,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t id, const struc=
t pw_properties *props, uint32_t *rate)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *codec;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *stream_format;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info info;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t sample_rate, channels, bitrate;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_zero(info);<br>
++=C2=A0 =C2=A0 =C2=A0 info.media_type =3D SPA_MEDIA_TYPE_audio;<br>
++=C2=A0 =C2=A0 =C2=A0 codec =3D pw_properties_get(props, &quot;codec.type&=
quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 stream_format =3D pw_properties_get(props, &quot;cod=
ec.aac.stream_format&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 sample_rate =3D pw_properties_get_uint32(props, &quo=
t;codec.sample_rate&quot;, 44100);<br>
++=C2=A0 =C2=A0 =C2=A0 channels =3D pw_properties_get_uint32(props, &quot;c=
odec.channels&quot;, 2);<br>
++=C2=A0 =C2=A0 =C2=A0 bitrate =3D pw_properties_get_uint32(props, &quot;co=
dec.bit_rate&quot;, 128000);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (codec =3D=3D NULL || spa_streq(codec, &quot;mp3&=
quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_mp3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.rate =3D s=
ample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.mp3.channel_mo=
de =3D channels =3D=3D 1 ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;<br=
>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;aac&quot;) || spa_=
streq(codec, &quot;aac_adts&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D s=
ample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.audio_obje=
ct_type =3D pw_properties_get_uint32(props,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codec.aac.audio_object_type&quot;, 0)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D spa_streq(codec, &quot;aac_adts&quot;) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream_format =3D=3D NULL || spa_streq(stre=
am_format, &quot;adts&quot;) ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS :<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_AUDIO_AAC_STREAM_FORMAT_RAW;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;aac_adif&quot;)) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D s=
ample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_ADIF;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;aac_latm&quot;)) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_aac;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.rate =3D s=
ample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.bitrate =
=3D bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_MP4LATM;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;flac&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_flac;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.flac.rate =3D =
sample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.flac.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;vorbis&quot;)) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_vorbis;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.vorbis.rate =
=3D sample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.vorbis.channel=
s =3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;opus&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_opus;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.opus.rate =3D =
sample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.opus.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;wma&quot;) || spa_=
streq(codec, &quot;wma_std&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_wma;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.rate =3D s=
ample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.bitrate =
=3D bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.profile =
=3D SPA_AUDIO_WMA_PROFILE_WMA9;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (spa_streq(codec, &quot;wma_pro&quot;)) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D S=
PA_MEDIA_SUBTYPE_wma;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.rate =3D s=
ample_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.channels =
=3D channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.bitrate =
=3D bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.wma.profile =
=3D SPA_AUDIO_WMA_PROFILE_WMA9_PRO;<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (rate !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *rate =3D sample_rate;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 return spa_format_audio_build(b, id, &amp;info);<br>
++}<br>
++<br>
++static void synthesize_compress_offload_spec(struct sample_spec *ss,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct channel_map *map,=
 const struct pw_properties *props)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t channels;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ss-&gt;format =3D SPA_AUDIO_FORMAT_S16_LE;<br>
++=C2=A0 =C2=A0 =C2=A0 ss-&gt;rate =3D pw_properties_get_uint32(props, &quo=
t;compress.carrier.rate&quot;, 48000);<br>
++=C2=A0 =C2=A0 =C2=A0 channels =3D pw_properties_get_uint32(props, &quot;c=
ompress.carrier.channels&quot;, 2);<br>
++=C2=A0 =C2=A0 =C2=A0 ss-&gt;channels =3D (uint8_t)(channels &gt; 0 ? chan=
nels : 2);<br>
++=C2=A0 =C2=A0 =C2=A0 spa_zero(*map);<br>
++=C2=A0 =C2=A0 =C2=A0 switch (ss-&gt;channels) {<br>
++=C2=A0 =C2=A0 =C2=A0 case 1: channel_map_parse(&quot;mono&quot;, map); br=
eak;<br>
++=C2=A0 =C2=A0 =C2=A0 case 2: channel_map_parse(&quot;stereo&quot;, map); =
break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 3: channel_map_parse(&quot;surround-21&quot;, m=
ap); break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 4: channel_map_parse(&quot;surround-40&quot;, m=
ap); break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 5: channel_map_parse(&quot;surround-50&quot;, m=
ap); break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 6: channel_map_parse(&quot;surround-51&quot;, m=
ap); break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 8: channel_map_parse(&quot;surround-71&quot;, m=
ap); break;<br>
++=C2=A0 =C2=A0 =C2=A0 default: channel_map_parse(&quot;stereo&quot;, map);=
 ss-&gt;channels =3D 2; break;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++static uint32_t compress_format_get_u32_prop(const struct format_info *fo=
rmat,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *key, uint32_=
t default_value)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *str, *val;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_json it[2];<br>
++=C2=A0 =C2=A0 =C2=A0 int len, value;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (format-&gt;props =3D=3D NULL || (str =3D pw_prop=
erties_get(format-&gt;props, key)) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default_value;<br=
>
++=C2=A0 =C2=A0 =C2=A0 if ((len =3D spa_json_begin(&amp;it[0], str, strlen(=
str), &amp;val)) &lt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default_value;<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (spa_json_is_int(val, len) &amp;&amp; spa_json_pa=
rse_int(val, len, &amp;value) &gt; 0 &amp;&amp; value &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uint32_t)value;<=
br>
++=C2=A0 =C2=A0 =C2=A0 if ((value =3D atoi(str)) &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uint32_t)value;<=
br>
++=C2=A0 =C2=A0 =C2=A0 return default_value;<br>
++}<br>
++<br>
++static const char *compress_format_get_string_prop(const struct format_in=
fo *format,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *key, char *b=
uffer, size_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *str, *val;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_json it[2];<br>
++=C2=A0 =C2=A0 =C2=A0 int len;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (format-&gt;props =3D=3D NULL || (str =3D pw_prop=
erties_get(format-&gt;props, key)) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 if ((len =3D spa_json_begin(&amp;it[0], str, strlen(=
str), &amp;val)) &gt; 0 &amp;&amp; spa_json_is_string(val, len))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return spa_scnprintf(buf=
fer, size, &quot;%.*s&quot;, len - 2, val + 1) &gt;=3D 0 ? buffer : NULL;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 return str;<br>
++}<br>
++<br>
++static uint32_t compress_format_get_u32_prop_compat(const struct format_i=
nfo *format,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *primary, con=
st char *compat, uint32_t default_value)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t value;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 value =3D compress_format_get_u32_prop(format, prima=
ry, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (value =3D=3D 0 &amp;&amp; compat !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D compress_forma=
t_get_u32_prop(format, compat, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 return value !=3D 0 ? value : default_value;<br>
++}<br>
++<br>
++static const char *compress_format_get_string_prop_compat(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct format_info=
 *format, const char *primary,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *compat, char=
 *buffer, size_t size)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *str;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D compress_format_get_string_prop(format, prim=
ary, buffer, size);<br>
++=C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL &amp;&amp; compat !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str =3D compress_format_=
get_string_prop(format, compat, buffer, size);<br>
++=C2=A0 =C2=A0 =C2=A0 return str;<br>
++}<br>
++<br>
++static bool compress_format_stream_format_is(const struct format_info *fo=
rmat, const char *expected)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 char stream_format[32];<br>
++=C2=A0 =C2=A0 =C2=A0 const char *str;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 str =3D compress_format_get_string_prop_compat(forma=
t, &quot;format.stream_format&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;stream-format&quot;, stream_format, sizeof(stream_format));<br>
++=C2=A0 =C2=A0 =C2=A0 return str =3D=3D NULL ? spa_streq(expected, &quot;a=
dts&quot;) : spa_streq(str, expected);<br>
++}<br>
++<br>
++static bool compress_hex_nibble(char c, uint8_t *value)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 if (c &gt;=3D &#39;0&#39; &amp;&amp; c &lt;=3D &#39;=
9&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D c - &#39;0&#3=
9;;<br>
++=C2=A0 =C2=A0 =C2=A0 else if (c &gt;=3D &#39;a&#39; &amp;&amp; c &lt;=3D =
&#39;f&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D c - &#39;a&#3=
9; + 10;<br>
++=C2=A0 =C2=A0 =C2=A0 else if (c &gt;=3D &#39;A&#39; &amp;&amp; c &lt;=3D =
&#39;F&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D c - &#39;A&#3=
9; + 10;<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 return true;<br>
++}<br>
++<br>
++static uint32_t compress_read_bits(const uint8_t *data, size_t size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *bit_offset, ui=
nt32_t n_bits)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t value =3D 0, i;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (*bit_offset + n_bits &gt; size * 8)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SPA_ID_INVALID;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; n_bits; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t byte =3D (*bit_=
offset + i) / 8;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t bit =3D 7 - ((*=
bit_offset + i) % 8);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D (value &lt;&lt=
; 1) | ((data[byte] &gt;&gt; bit) &amp; 1);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 *bit_offset +=3D n_bits;<br>
++=C2=A0 =C2=A0 =C2=A0 return value;<br>
++}<br>
++<br>
++struct compress_aac_config {<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t object_type;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t rate;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t channels;<br>
++};<br>
++<br>
++static uint32_t compress_aac_sample_rate(const uint8_t *data, size_t size=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *bit_offset)<br=
>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 static const uint32_t rates[] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 96000, 88200, 64000, 480=
00, 44100, 32000, 24000,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 22050, 16000, 12000, 110=
25, 8000, 7350,<br>
++=C2=A0 =C2=A0 =C2=A0 };<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t index =3D compress_read_bits(data, size, bi=
t_offset, 4);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (index =3D=3D SPA_ID_INVALID)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 if (index =3D=3D 15) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rate =3D compre=
ss_read_bits(data, size, bit_offset, 24);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rate =3D=3D SPA_I=
D_INVALID ? 0 : rate;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return index &lt; SPA_N_ELEMENTS(rates) ? rates[inde=
x] : 0;<br>
++}<br>
++<br>
++static uint32_t compress_aac_object_type(const uint8_t *data, size_t size=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *bit_offset)<br=
>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t object_type =3D compress_read_bits(data, si=
ze, bit_offset, 5);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (object_type =3D=3D SPA_ID_INVALID)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 if (object_type =3D=3D 31) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t ext =3D compres=
s_read_bits(data, size, bit_offset, 6);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ext =3D=3D SPA_ID_IN=
VALID)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_type =3D 32 + ext=
;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return object_type;<br>
++}<br>
++<br>
++static bool compress_parse_audio_specific_config(const char *str,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct compress_aac_conf=
ig *config)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t data[64];<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t bit_offset =3D 0, channel_config, extension=
_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t n_data =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 bool high =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t byte =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 static const uint8_t channel_count[] =3D { 0, 1, 2, =
3, 4, 5, 6, 8 };<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL || config =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 spa_zero(*config);<br>
++=C2=A0 =C2=A0 =C2=A0 if (spa_strstartswith(str, &quot;(buffer)&quot;))<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str +=3D strlen(&quot;(b=
uffer)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (spa_strstartswith(str, &quot;0x&quot;) || spa_st=
rstartswith(str, &quot;0X&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str +=3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 for (; *str !=3D &#39;\0&#39; &amp;&amp; n_data &lt;=
 sizeof(data); str++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t nibble;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!compress_hex_nibble=
(*str, &amp;nibble))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (high) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 byte =3D nibble &lt;&lt; 4;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 high =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 data[n_data++] =3D byte | nibble;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 high =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (!high || n_data =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 config-&gt;object_type =3D compress_aac_object_type(=
data, n_data, &amp;bit_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 config-&gt;rate =3D compress_aac_sample_rate(data, n=
_data, &amp;bit_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 channel_config =3D compress_read_bits(data, n_data, =
&amp;bit_offset, 4);<br>
++=C2=A0 =C2=A0 =C2=A0 if (config-&gt;object_type =3D=3D 0 || config-&gt;ra=
te =3D=3D 0 ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 channel_config =3D=3D SPA_ID_INVALID)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 if (channel_config &lt; SPA_N_ELEMENTS(channel_count=
))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;channels =3D =
channel_count[channel_config];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (config-&gt;object_type =3D=3D 5 || config-&gt;ob=
ject_type =3D=3D 29) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extension_rate =3D compr=
ess_aac_sample_rate(data, n_data, &amp;bit_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (extension_rate !=3D =
0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 config-&gt;rate =3D extension_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return true;<br>
++}<br>
++<br>
++static int set_compress_offload_props_from_format(struct pw_properties *p=
rops,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct format_info=
 *format)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *codec, *stream_format;<br>
++=C2=A0 =C2=A0 =C2=A0 char stream_format_buffer[32];<br>
++=C2=A0 =C2=A0 =C2=A0 bool is_aac =3D false;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 switch (format-&gt;encoding) {<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_MP3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 codec =3D &quot;mp3&quot=
;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_AAC:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!compress_format_str=
eam_format_is(format, &quot;raw&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 codec =3D &quot;aac&quot=
;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_aac =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_AAC_ADTS:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!compress_format_str=
eam_format_is(format, &quot;adts&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 codec =3D &quot;aac_adts=
&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_aac =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 case ENCODING_MPEG2_AAC_IEC61937:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream_format =3D compre=
ss_format_get_string_prop_compat(format,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;format.stream_format&quot;, &quot;str=
eam-format&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream_format_buffer, sizeof(stream_format_=
buffer));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stream_format =3D=3D=
 NULL || spa_streq(stream_format, &quot;adts&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 codec =3D &quot;aac_adts&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (spa_streq(strea=
m_format, &quot;raw&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 codec =3D &quot;aac&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_aac =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;codec.type&quot;, cod=
ec);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.sample_rate&qu=
ot;, &quot;%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 compress_format_get_u32_prop(format, &quot;format.rate&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get_uint32(props, &quot;codec=
.sample_rate&quot;, 48000)));<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.channels&quot;=
, &quot;%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 compress_format_get_u32_prop_compat(format, &quot;format.channels&quot;=
, &quot;channels&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get_uint32(props, &quot;codec=
.channels&quot;, 2)));<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(props, &quot;codec.bit_rate&quot;=
, &quot;%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 compress_format_get_u32_prop_compat(format, &quot;format.bit_rate&quot;=
, &quot;bitrate&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get_uint32(props, &quot;codec=
.bit_rate&quot;, 128000)));<br>
++=C2=A0 =C2=A0 =C2=A0 if (is_aac) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char stream_format[32], =
codec_data[256];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *str;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct compress_aac_conf=
ig aac_config;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t object_type =3D=
 compress_format_get_u32_prop_compat(format,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;format.audio_object_type&quot;, &quot=
;audio-object-type&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get_uint32(props, &quot;codec=
.aac.audio_object_type&quot;, 0));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str =3D compress_format_=
get_string_prop_compat(format, &quot;format.stream_format&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stream-format&quot;, stream_format, s=
izeof(stream_format));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;codec.aac.stream_format&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str !=3D NULL ? str : (spa_streq(codec, &qu=
ot;aac_adts&quot;) ? &quot;adts&quot; : &quot;raw&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str =3D compress_format_=
get_string_prop_compat(format, &quot;format.codec_data&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codec_data&quot;, codec_data, sizeof(=
codec_data));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 str =3D compress_format_get_string_prop(format, &quot;codec-data&quot;,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 codec_data, siz=
eof(codec_data));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (str =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 str =3D pw_properties_get(props, &quot;codec.aac.codec_data&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (str !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;codec.aac.codec_data&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (compress_parse_audio_specific_config(str, &amp;aac_config)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (object_type =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_type =3D=
 aac_config.object_type;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aac_config.rate !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_s=
etf(props, &quot;codec.sample_rate&quot;, &quot;%u&quot;, aac_config.rate);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aac_config.channels !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_s=
etf(props, &quot;codec.channels&quot;, &quot;%u&quot;, aac_config.channels)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (object_type =3D=3D 0=
 &amp;&amp; spa_streq(codec, &quot;aac_adts&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 object_type =3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (object_type !=3D 0)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_setf(props, &quot;codec.aac.audio_object_type&quot;, &quo=
t;%u&quot;, object_type);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int init_compress_format_info(struct format_info *format,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum encoding encoding, =
uint32_t rate, uint32_t channels, uint32_t bitrate)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 spa_zero(*format);<br>
++=C2=A0 =C2=A0 =C2=A0 format-&gt;encoding =3D encoding;<br>
++=C2=A0 =C2=A0 =C2=A0 format-&gt;props =3D pw_properties_new(NULL, NULL);<=
br>
++=C2=A0 =C2=A0 =C2=A0 if (format-&gt;props =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(format-&gt;props, &quot;format.ra=
te&quot;, &quot;%u&quot;, rate);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_setf(format-&gt;props, &quot;format.ch=
annels&quot;, &quot;%u&quot;, channels);<br>
++=C2=A0 =C2=A0 =C2=A0 if (encoding =3D=3D ENCODING_AAC || encoding =3D=3D =
ENCODING_AAC_ADTS) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_setf(forma=
t-&gt;props, &quot;format.bit_rate&quot;, &quot;%u&quot;, bitrate);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(format=
-&gt;props, &quot;format.stream_format&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding =3D=3D ENCODING_AAC_ADTS ? &quot;\=
&quot;adts\&quot;&quot; : &quot;\&quot;raw\&quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
+ static int do_create_playback_stream(struct client *client, uint32_t comm=
and, uint32_t tag, struct message *m)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct impl *impl =3D client-&gt;impl;<br>
+@@ -1646,7 +2067,9 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muted_set =3D false=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail_on_suspend =3D=
 false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0relative_volume =3D=
 false,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passthrough =3D false;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passthrough =3D false,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_offload =3D fal=
se,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_format_selected=
 =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct volume volume;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_properties *props =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t n_formats =3D 0;<br>
+@@ -1705,6 +2128,70 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0o =3D find_device(client, sink_index, sink_name=
, true, &amp;is_monitor);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if (o !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct pw_node_inf=
o *ninfo =3D o-&gt;info;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spa_dict *s=
p =3D (ninfo &amp;&amp; ninfo-&gt;props) ? ninfo-&gt;props : NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char node_name_buf[256] =
=3D {0};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *node_name;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *co;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_nn =3D pw_p=
roperties_get(o-&gt;props, PW_KEY_NODE_NAME);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_nn)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 snprintf(node_name_buf, sizeof(node_name_buf), &quot;%s&quot;, _nn);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_name =3D node_name_=
buf[0] ? node_name_buf : NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 co =3D sp ? spa_dict_loo=
kup(sp, &quot;compress.offload&quot;) : NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] =
compress-offload check: node=3D%s ninfo=3D%p co=3D%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name, node_name ? node_name : &q=
uot;(null)&quot;, ninfo, co ? co : &quot;(null)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (co &amp;&amp; spa_at=
ob(co)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char target_buf[256] =3D {0};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char codec_buf[64] =3D {0};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char rate_buf[32] =3D {0};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char channels_buf[16] =3D {0};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char bitrate_buf[32] =3D {0};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *target;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *codec;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *rate_s;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *channels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *_s;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;compress.target.object&quot;)) !=
=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(target_buf, sizeof(target_buf), &q=
uot;%s&quot;, _s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.type&quot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(codec_buf, sizeof(codec_buf), &quo=
t;%s&quot;, _s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.sample_rate&quot;)) !=3D NU=
LL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(rate_buf, sizeof(rate_buf), &quot;=
%s&quot;, _s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.channels&quot;)) !=3D NULL)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(channels_buf, sizeof(channels_buf)=
, &quot;%s&quot;, _s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((_s =3D spa_dict_lookup(sp, &quot;codec.bit_rate&quot;)) !=3D NULL)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(bitrate_buf, sizeof(bitrate_buf), =
&quot;%s&quot;, _s);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 target =3D target_buf[0] ? target_buf : NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 codec =3D codec_buf[0] ? codec_buf : NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rate_s =3D rate_buf[0] ? rate_buf : NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 channels =3D channels_buf[0] ? channels_buf : NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bitrate =3D bitrate_buf[0] ? bitrate_buf : NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;compress.off=
load&quot;, &quot;true&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (node_name !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_s=
et(props, &quot;compress.forwarder.source&quot;, node_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;item.node.su=
pports-encoded-fmts&quot;, &quot;true&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, PW_KEY_MEDIA_TYPE, &quot;Audio&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, PW_KEY_MEDIA_CATEGORY, &quot;Playback&quot;);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, PW_KEY_MEDIA_ROLE, &quot;Music&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (codec) pw_properties_set(props, &quot;codec.type&quot;, codec);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (rate_s) pw_properties_set(props, &quot;codec.sample_rate&quot;, rat=
e_s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (channels) pw_properties_set(props, &quot;codec.channels&quot;, chan=
nels);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (bitrate) pw_properties_set(props, &quot;codec.bit_rate&quot;, bitra=
te);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_info(&quot;[%s] detected compress-offload sink=3D%s target=3D%s =
codec=3D%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name=
, node_name ? node_name : &quot;(null)&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target ? target=
 : &quot;(null)&quot;, codec ? codec : &quot;(null)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;[%s] compress target=3D%s - leaving sink_name=3D%s f=
or virtual sink routing&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name=
, target ? target : &quot;(null)&quot;, sink_name ? sink_name : &quot;(null=
)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spa_zero(fix_ss);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spa_zero(fix_map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fix_format || fix_rate || fix_channels) &a=
mp;&amp; o !=3D NULL) {<br>
+@@ -1752,6 +2239,27 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto error_protocol;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 compress_offload =3D pw_properties_parse_bool(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, &quot;compress.offload&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 if (!compress_offload &amp;&amp; sink_name !=3D NULL=
 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_streq(sink_name, &quot;pal_speaker=
_compress&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_offload =3D tru=
e;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;compress.offload&quot;, &quot;true&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;compress.forwarder.source&quot;, &quot;pal_speaker_compress&quot;);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;compress.target.object&quot;, &quot;pal_sink_speaker_compress&quot;)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_set(props,=
 &quot;item.node.supports-encoded-fmts&quot;, &quot;true&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(pr=
ops, &quot;codec.type&quot;) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;codec.type&quot;, &quot;mp3&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(pr=
ops, &quot;codec.sample_rate&quot;) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;codec.sample_rate&quot;, &quot;48000&quo=
t;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(pr=
ops, &quot;codec.channels&quot;) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;codec.channels&quot;, &quot;2&quot;);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pw_properties_get(pr=
ops, &quot;codec.bit_rate&quot;) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;codec.bit_rate&quot;, &quot;128000&quot;=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] =
using byte-preserving compress-offload path for sink=3D%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name, sink_name);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;version &gt;=3D 21) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (message_get(m,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TAG_U8, &amp;n_formats,<br>
+@@ -1769,7 +2277,12 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TAG_INVALID) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto erro=
r_protocol;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n_params &lt; MAX_FORMATS &amp;&amp;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_format_info=
(impl, SPA_LOG_LEVEL_DEBUG, &amp;format);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!compress_f=
ormat_selected &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
et_compress_offload_props_from_format(props, &amp;format) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 compress_format_selected =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (n_params &lt; MAX_FORMATS &amp;&=
amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(params[n_params] =3D f=
ormat_info_build_param(&amp;b,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0SPA_PARAM_EnumFormat, &amp;format, &amp;r)) !=3D NULL) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_params+=
+;<br>
+@@ -1783,7 +2296,26 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 if (sample_spec_valid(&amp;ss)) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t compress_rate =
=3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n_params &lt; MAX_FO=
RMATS &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (params[n_=
params] =3D build_compress_offload_format(&amp;b,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_PARAM_EnumF=
ormat, props, &amp;compress_rate)) !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 n_params++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 n_valid_formats++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ss_rate =3D rate =3D compress_rate;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 synthesize_compress_offload_spec(&amp;ss, &amp;map, props);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;[%s] synthesized compress-offload format codec=3D%s =
rate=3D%u channels=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name=
, pw_properties_get(props, &quot;codec.type&quot;), compress_rate,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_g=
et_uint32(props, &quot;codec.channels&quot;, 2));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_warn(&quot;%p: unsupported compress codec:%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 impl, pw_proper=
ties_get(props, &quot;codec.type&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_offload_forward=
er_update(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get(props, &quot;compress.for=
warder.source&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;props-&gt;dict);<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (sample_spec_valid(&amp;ss)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sample_spec =
sfix =3D ss;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct channel_map =
mfix =3D map;<br>
+ <br>
+@@ -1807,6 +2339,8 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (m-&gt;offset !=3D m-&gt;length)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_protocol=
;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] format check: n_valid=3D%u n=
_params=3D%u compress=3D%d passthrough=3D%d&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;name, n_valid_formats, n_params, compress_offload, passthrou=
gh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n_valid_formats =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_no_forma=
ts;<br>
+ <br>
+@@ -1816,6 +2350,16 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stream =3D stream_new(client, STREAM_TYPE_PLAYB=
ACK, tag, &amp;ss, &amp;map, &amp;attr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_errno;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 stream-&gt;compress_offload =3D compress_offload;<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *forwarder_so=
urce =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_properties_get(props, &quot;compress.for=
warder.source&quot;);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (forwarder_source !=
=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spa_scnprintf(stream-&gt;compress_forwarder_source,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(stream-&=
gt;compress_forwarder_source), &quot;%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 forwarder_sourc=
e);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stream-&gt;corked =3D corked;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stream-&gt;is_paused =3D corked;<br>
+@@ -1835,6 +2379,11 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rate !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_fraction=
 lat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fix_playback_buffer=
_attr(stream, &amp;attr, ss_rate, &amp;lat);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 attr.prebuf =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_log_debug(&quot;[%s] compress-offload uses immediate playback prebuf=
=3D0&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;name=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw_properties_setf(=
props, PW_KEY_NODE_RATE, &quot;1/%u&quot;, rate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw_properties_setf(=
props, PW_KEY_NODE_LATENCY, &quot;%u/%u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lat.num, lat.denom);<br>
+@@ -1844,6 +2393,8 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (no_move)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D PW_STREA=
M_FLAG_DONT_RECONNECT;<br>
++=C2=A0 =C2=A0 =C2=A0 if (compress_offload)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D PW_STREAM_FLA=
G_NO_CONVERT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (corked)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D PW_STREA=
M_FLAG_INACTIVE;<br>
+ <br>
+@@ -1875,14 +2426,35 @@ static int do_create_playback_stream(struct client=
 *client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;stream-&gt;stream_listener,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;stream_events, stream);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 pw_stream_connect(stream-&gt;stream,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_DIRECTION_OUTPUT,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SPA_ID_INVALID,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 flags |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_RT_PROCESS |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PW_STREAM_FLAG_MAP_BUFFERS,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params, n_params);<br>
++=C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t raw_buf[256];<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_pod_builder r=
b =3D SPA_POD_BUILDER_INIT(raw_buf, sizeof(raw_buf));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spa_audio_info_ra=
w raw_info =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .format =3D SPA_AUDIO_FORMAT_S16_LE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .rate =3D ss.rate ? ss.rate : 44100,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels =3D ss.channels ? ss.channels : 2,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spa_pod *ra=
w_params[1];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_params[0] =3D spa_fo=
rmat_audio_raw_build(&amp;rb, SPA_PARAM_EnumFormat, &amp;raw_info);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] =
pw_stream_connect: using raw S16LE param for compress sink&quot;, client-&g=
t;name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_connect(stream=
-&gt;stream,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_DIRECTION_OUTPUT,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_ID_INVALID,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_RT_PROCESS |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_MAP_BUFFERS,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_params, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_connect(stream=
-&gt;stream,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_DIRECTION_OUTPUT,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_ID_INVALID,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_AUTOCONNECT |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_RT_PROCESS |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PW_STREAM_FLAG_MAP_BUFFERS,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params, n_params);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stream_update_tag_param(stream);<br>
+ <br>
+@@ -3927,9 +4499,50 @@ static int fill_sink_info(struct client *client, st=
ruct message *m,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;version &gt;=3D 21) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_manager_p=
aram *p;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct format_info info[=
32];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct format_info forma=
ts[32];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t i, n_info =
=3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct spa_list *pa=
ram_list =3D pw_manager_object_get_param_list(o);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool compress_offload =
=3D pw_properties_parse_bool(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_dict_lookup(info-&gt;props, &quot;compr=
ess.offload&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t compress_rate =
=3D 48000, compress_channels =3D 2, compress_bitrate =3D 128000;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *str;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((str =3D spa_dict_lookup(info-&gt;props, &quot;codec.sample_rate&qu=
ot;)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_rate =3D (uint32_t)atoi(str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((str =3D spa_dict_lookup(info-&gt;props, &quot;codec.channels&quot;=
)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_channels =3D (uint32_t)atoi(str);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((str =3D spa_dict_lookup(info-&gt;props, &quot;codec.bit_rate&quot;=
)) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_bitrate =3D (uint32_t)atoi(str);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (compress_rate =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_rate =3D 48000;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (compress_channels =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_channels =3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (compress_bitrate =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_bitrate =3D 128000;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (n_info &lt; SPA_N_ELEMENTS(formats) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 init_compress_format_info(&amp;formats[n_info], ENCODING_=
MP3,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_rate, =
compress_channels, compress_bitrate) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_info++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (n_info &lt; SPA_N_ELEMENTS(formats) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 init_compress_format_info(&amp;formats[n_info], ENCODING_=
AAC_ADTS,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_rate, =
compress_channels, compress_bitrate) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_info++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (n_info &lt; SPA_N_ELEMENTS(formats) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 init_compress_format_info(&amp;formats[n_info], ENCODING_=
AAC,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48000, 2, compr=
ess_bitrate) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_info++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (n_info &lt; SPA_N_ELEMENTS(formats) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 init_compress_format_info(&amp;formats[n_info], ENCODING_=
AAC,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16000, 1, compr=
ess_bitrate) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_info++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (n_info &lt; SPA_N_ELEMENTS(formats) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 init_compress_format_info(&amp;formats[n_info], ENCODING_=
AAC,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12000, 1, compr=
ess_bitrate) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_info++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto send_formats;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spa_list_for_each(p=
, param_list, link) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t index =3D 0;<br>
+@@ -3937,26 +4550,27 @@ static int fill_sink_info(struct client *client, s=
truct message *m,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (p-&gt;id !=3D SPA_PARAM_EnumFormat)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 while (n_info &lt; SPA_N_ELEMENTS(info)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_zero(info[n_info]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (format_info_from_param(&amp;info[n_info=
], p-&gt;param, index++) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 while (n_info &lt; SPA_N_ELEMENTS(formats)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_zero(formats[n_info]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (format_info_from_param(&amp;formats[n_i=
nfo], p-&gt;param, index++) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info[n_info].encoding =3D=3D ENCODING_A=
NY ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (info[n_info].encoding =3D=3D=
 ENCODING_PCM &amp;&amp; info[n_info].props !=3D NULL)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 format_info_cle=
ar(&amp;info[n_info]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (formats[n_info].encoding =3D=3D ENCODIN=
G_ANY ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (formats[n_info].encoding =3D=
=3D ENCODING_PCM &amp;&amp; formats[n_info].props !=3D NULL)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 format_info_cle=
ar(&amp;formats[n_info]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_info++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 send_formats:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message_put(m,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TAG_U8, n_info,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* n_formats */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TAG_INVALID);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; n_info; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0message_put(m,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TAG_FORMAT_INFO, &amp;info[i],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TAG_FORMAT_INFO, &amp;formats[i],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TAG_INVALID);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 format_info_clear(&amp;info[i]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 format_info_clear(&amp;formats[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+diff --git a/src/modules/module-protocol-pulse/server.c b/src/modules/modu=
le-protocol-pulse/server.c<br>
+index c00ea8e55..ae8091403 100644<br>
+--- a/src/modules/module-protocol-pulse/server.c<br>
++++ b/src/modules/module-protocol-pulse/server.c<br>
+@@ -33,6 +33,7 @@<br>
+ #include &quot;commands.h&quot;<br>
+ #include &quot;defs.h&quot;<br>
+ #include &quot;internal.h&quot;<br>
++#include &quot;modules/pulse-module-compress-offload-forwarder.h&quot;<br=
>
+ #include &quot;log.h&quot;<br>
+ #include &quot;message.h&quot;<br>
+ #include &quot;reply.h&quot;<br>
+@@ -113,9 +114,13 @@ static int handle_memblock(struct client *client, str=
uct message *msg)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stream *stream;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t channel, flags, index;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t transport_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t offset, diff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t filled;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int res =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 bool frame_raw_aac;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *compress_offload;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t raw_aac_header[COMPRESS_RAW_AAC_HEADER_SIZE]=
;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D ntohl(client-&gt;desc.channel);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D (int64_t) (<br>
+@@ -133,6 +138,25 @@ static int handle_memblock(struct client *client, str=
uct message *msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0client, client-&gt;name, channel);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto finish;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 compress_offload =3D stream-&gt;props !=3D NULL ?<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(stream-&gt;props, &quot;compress.offload&quot;) : NUL=
L;<br>
++=C2=A0 =C2=A0 =C2=A0 frame_raw_aac =3D compress_offload !=3D NULL &amp;&a=
mp; spa_atob(compress_offload);<br>
++=C2=A0 =C2=A0 =C2=A0 transport_size =3D msg-&gt;length;<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame_raw_aac) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (msg-&gt;length &gt; =
UINT32_MAX - COMPRESS_RAW_AAC_HEADER_SIZE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 res =3D -EOVERFLOW;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto finish;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 transport_size +=3D COMP=
RESS_RAW_AAC_HEADER_SIZE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[0] =3D CO=
MPRESS_RAW_AAC_MAGIC_0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[1] =3D CO=
MPRESS_RAW_AAC_MAGIC_1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[2] =3D CO=
MPRESS_RAW_AAC_MAGIC_2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[3] =3D CO=
MPRESS_RAW_AAC_MAGIC_3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[4] =3D ms=
g-&gt;length &amp; 0xff;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[5] =3D (m=
sg-&gt;length &gt;&gt; 8) &amp; 0xff;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[6] =3D (m=
sg-&gt;length &gt;&gt; 16) &amp; 0xff;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header[7] =3D (m=
sg-&gt;length &gt;&gt; 24) &amp; 0xff;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0filled =3D spa_ringbuffer_get_write_index(&amp;=
stream-&gt;ring, &amp;index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_log_trace(&quot;new block %p %p/%u filled:%d=
 index:%d flags:%02x offset:%&quot; PRIu64,<br>
+@@ -173,13 +197,22 @@ static int handle_memblock(struct client *client, st=
ruct message *msg)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (filled &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* underrun, report=
ed on reader side */<br>
+-=C2=A0 =C2=A0 =C2=A0 } else if (filled + msg-&gt;length &gt; stream-&gt;a=
ttr.maxlength) {<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (filled + transport_size &gt; stream-&gt;a=
ttr.maxlength) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* overrun */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stream_send_overflo=
w(stream);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* always write data to ringbuffer, we expect t=
he other side<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to recover */<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame_raw_aac) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_ringbuffer_write_dat=
a(&amp;stream-&gt;ring,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;buffer, stream-&gt;bufsize,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index % stream-&gt;bufsize,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_aac_header, sizeof(raw_aac_header));<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index +=3D sizeof(raw_aa=
c_header);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;clien=
t %p [%s]: framed raw AAC access unit size=3D%u&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client, client-&gt;name, msg-&gt;length);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spa_ringbuffer_write_data(&amp;stream-&gt;ring,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0stream-&gt;buffer, stream-&gt;bufsize,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0index % stream-&gt;bufsize,<br>
+diff --git a/src/modules/module-protocol-pulse/stream.c b/src/modules/modu=
le-protocol-pulse/stream.c<br>
+index 4b223b878..484a12a05 100644<br>
+--- a/src/modules/module-protocol-pulse/stream.c<br>
++++ b/src/modules/module-protocol-pulse/stream.c<br>
+@@ -24,6 +24,7 @@<br>
+ #include &quot;internal.h&quot;<br>
+ #include &quot;log.h&quot;<br>
+ #include &quot;message.h&quot;<br>
++#include &quot;modules/pulse-module-compress-offload-forwarder.h&quot;<br=
>
+ #include &quot;reply.h&quot;<br>
+ #include &quot;stream.h&quot;<br>
+ <br>
+@@ -148,6 +149,10 @@ void stream_free(struct stream *stream)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream-&gt;killed)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stream_send_killed(=
stream);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if (stream-&gt;type =3D=3D STREAM_TYPE_PLAYBACK &amp=
;&amp; stream-&gt;compress_offload)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compress_offload_forward=
er_teardown(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;compress_forwarder_source);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream-&gt;stream) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spa_hook_remove(&am=
p;stream-&gt;stream_listener);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw_stream_disconnec=
t(stream-&gt;stream);<br>
+diff --git a/src/modules/module-protocol-pulse/stream.h b/src/modules/modu=
le-protocol-pulse/stream.h<br>
+index 8e1fe178c..d2ff2edaa 100644<br>
+--- a/src/modules/module-protocol-pulse/stream.h<br>
++++ b/src/modules/module-protocol-pulse/stream.h<br>
+@@ -87,6 +87,7 @@ struct stream {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t frame_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t rate;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t lat_usec;<br>
++=C2=A0 =C2=A0 =C2=A0 char compress_forwarder_source[128];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct volume volume;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool muted;<br>
+@@ -107,6 +108,7 @@ struct stream {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int fail_on_suspend:1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int is_suspended:1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int dont_inhibit_auto_suspend:1;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int compress_offload:1;<br>
+ };<br>
+ <br>
+ struct stream *stream_new(struct client *client, enum stream_type type, u=
int32_t create_tag,<br>
+-- <br>
+Gitlab<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131433): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131433" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131433</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121939506/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/121939506/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualco=
mm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009cb305065ebbe57c--
