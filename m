Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B3AC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:08:37 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95238.1783091307030355842
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 08:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UW+2mISL;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664c4a04081so502294d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 08:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783091306; cv=none;
        d=google.com; s=arc-20260327;
        b=hHhw4lLuFsDUQzyiclCGpvxdnWf1AyTnHPLCutZL4C5cYCJ74K1iEPqkrfVrBTkL7+
         p+NukaLW3AqNn9BVS3Aprk3CXkHSxHFYtwm19c51WoyNbvNxJQ7jlZ9zd65nRIJp8/TJ
         AyQi2UKjXVoCuTcktYOOeUU/BEdYSpxas4rxdXDnyBsZuuKariwlw7A7eTs5Bo6O8eo/
         Wy4qMY7cKAB5QqGUylRRKFjH7XbMKVNtX3WT1WY0W1sp+rHV0NTO0+K09Bl2NAfz+n7C
         vcx47HE6MVe+ARkXDCHv4gtwtsyiwZca4B9VZt9vuoGZhIZ1jBBhDd+aDqwNaO6VseRr
         24XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/4SsCaXPtHdxMD5v2cvHC2Mi/C7KgyRVyf5yPzSpU0o=;
        fh=qwwDonjnKFlPVUFhx8uEFVcoh9RplhJOoVSXSZcX40U=;
        b=h1bR8Nt2OSWHMryj8c9pBCeXXLgGdMbe/2NC6sYxARR568LvQuRwfgd0M8BVmXI2WL
         qUjBNQgZpngbZhpdZkThdMn2lem1xw2skPGTWZfo/QnMQaoVIQb3jTsDNsWevErONvfE
         J7VOBrbCWz2atTaDy+iHAMklIibF44ZJCwV4TB0Hf4S/JteOctLMkLvLVxHyx3fFAvoo
         Z4w6XerQAKXvIcfhstR50hU2cL40ley/6vkqQ5uSJxFLFM8iO4lvJLdANUW2zcN6Zr6w
         dZnJ1dxDtjQ5Mgnp0Kc9vD0BBPIIB71y9AdKr6EGbPs96OlJyGEcS3ZjNhYz4R8G3h9I
         iHog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783091306; x=1783696106; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/4SsCaXPtHdxMD5v2cvHC2Mi/C7KgyRVyf5yPzSpU0o=;
        b=UW+2mISLfiDqgeK7kz8vgnXDYI8xNQx9aIKUnHA16xC03xVxNWin4wHvy3AmsPsaT3
         nDCe/yDJiyUc6JeGgazs70QgABDN398Rl9Zw6wrJJY8NwYEtrKcD2+kNHdOyn2CS47Fb
         BuGNFdhCY7kgtHVYRyL+nvJSHkCr9+mhokrm3gaAYRjpIm+7YQXp8Lu9JYIe78kZyNuN
         2/txhs7n7UYM+PURK48g+NQJgIhkqVMcMlcIh3/yA0/uHSnt1NNPRxq3DSX0vlQtwjRr
         XRE8CQVryRRYj/vTV+SNH1g2qlJPHl1gdFXUiNS9V5Ufd3tJzvtYXqDicY7qSTTRzi/R
         v84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091306; x=1783696106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4SsCaXPtHdxMD5v2cvHC2Mi/C7KgyRVyf5yPzSpU0o=;
        b=QZs07t/1cLeLNLtsng3yX57cjaRQ4cAam0060n6zh7z9g5n0yl897C/XGZKgb7fsBi
         5TIc+KfQQQXbcFSeMSPDRJloF5e6yhFGjrmo46IJgEs4Jrt2whyLixIK/yn3J7zJPJLd
         ODNQj9qyzvZp6S35cSMujjMaEebkDMtWN95KlKTvIw2B7bZNb2xioZeikc7TDRG5ALnJ
         XPGy1zjkH+SpHSNX4NhfIAEukptW7/nkVr0BY26AQoxYB4IjYi5uk+RZyLEUPXL7++Wp
         AdEDl7n3c9ePGz1D+LlmYaM3lLKuy1cm9EIyd6k7sfDahmNg1hVEg2RrXSl2gqxKcdCB
         qe1w==
X-Gm-Message-State: AOJu0YwjajMm98bXCUKOJgFg+v/COWyXIg8OC2L3mbTFajFTjWpv8Drr
	mU/pjeZ4KDDR6OKd49xiiXB61VqtUUaNS1yy69l5w2HRh9N3/DTe214gMBLcinT5vGaGARnlWpY
	Vzt5jtLoebbCdHlrV3NFj9LsqXk1O/t0rVgDyiSPrDg==
X-Gm-Gg: AfdE7clwLkMcPhLAbZ6gyJs0hUgC2HwDEg9OcH/lk5PKj0GaKOaKOsvHbik7FnAO+i1
	f6Xnml1cnC1umzcGs5eWBSNMv5OMrFYMzw9eCVBUJYnMwgYm7m2a3hVEOuLdK+z77SVbnI/g5t/
	WoWsk6D2l+Fhel2YG7da8wUWh4alKCjdmNLxWJli4s4ps2TTW/oOyglAi2T+jgxSKardR9aVg8a
	iqX6vPnPc8Bcj7vjw7ybUzySmSLp6eaMQvia1dDFriDtxRu7t/bBGYTS4sl/xV6laGCypWj4pfL
	f/yK0pevCTCXwpIlFvmTtQppDt4bimcjoAbPJadHffXXGENF2MO0SdeufhU/PrRCWbF0F+YDiG3
	MnXVe69j6SzbIOy/FMUqGDALuHpJW0mqEwWpkXPvb2jOKeLk2+dV302CuZQmVGEZGQK/4uw==
X-Received: by 2002:a05:690e:43c5:b0:664:ae68:33a1 with SMTP id
 956f58d0204a3-66650ef8d80mr132753d50.66.1783091305518; Fri, 03 Jul 2026
 08:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260703064544.2301345-1-harsh.rai@oss.qualcomm.com>
In-Reply-To: <20260703064544.2301345-1-harsh.rai@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jul 2026 08:07:59 -0700
X-Gm-Features: AVVi8CcOqobrmkdUZ3_e6Qy2IP7faE3zQqGdtvrqERBZyBDdG5z0u3h6ePl_M08
Message-ID: <CAMKF1sqaY_g9Hb2+OAU6gdgpszZ6FNziGPb6WJ5xwFURA5dE=Q@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: add MP3 compressed
 offload support
To: harsh.rai@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000de1c940655b64b32"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 15:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128010

--000000000000de1c940655b64b32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 2:25=E2=80=AFAM Harsh Rai via lists.openembedded.org
<harsh.rai=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Add a PipeWire Pulse virtual sink and forwarder for compressed offload,
> enabling MP3 compressed Pulse streams to be routed to a PAL compressed si=
nk.
>
> Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> ---
>  .../0001-pipewire-compress-offload.patch      | 1343 +++++++++++++++++
>  .../pipewire/pipewire_1.6.7.bb                |    1 +
>  2 files changed, 1344 insertions(+)
>  create mode 100644
> meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-compre=
ss-offload.patch
>
> diff --git
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-comp=
ress-offload.patch
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-comp=
ress-offload.patch
> new file mode 100644
> index 0000000000..9a60e5127a
> --- /dev/null
> +++
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-comp=
ress-offload.patch
> @@ -0,0 +1,1343 @@
> +From 345e4b033c2ff69ab7aa02a123f6041b878f7fb9 Mon Sep 17 00:00:00 2001
> +From: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +Date: Tue, 16 Jun 2026 19:21:37 +0530
> +Subject: [PATCH] pulse: enable MP3 compressed offload via Pulse
> +
> +Add PipeWire Pulse virtual sink and forwarder for offload.
> +Route compressed Pulse streams to PAL compressed sink.
> +
> +Upstream-Status: Submitted
>

Submitted tag should accompany with reference to where it was submitted,
perhaps a ML link or github PR link etc.


> +
> +Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
> +---
> + src/modules/meson.build                       |   2 +
> + .../module-compress-offload-forwarder.c       | 649 ++++++++++++++++++
> + .../modules/module-compress-offload-sink.c    | 293 ++++++++
> + .../module-protocol-pulse/pulse-server.c      | 254 ++++++-
> + 4 files changed, 1187 insertions(+), 11 deletions(-)
> + create mode 100644
> src/modules/module-protocol-pulse/modules/module-compress-offload-forward=
er.c
> + create mode 100644
> src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
> +
> +diff --git a/src/modules/meson.build b/src/modules/meson.build
> +index 59f46ae..900871d 100644
> +--- a/src/modules/meson.build
> ++++ b/src/modules/meson.build
> +@@ -324,6 +324,8 @@ pipewire_module_protocol_pulse_sources =3D [
> +   'module-protocol-pulse/modules/module-alsa-source.c',
> +   'module-protocol-pulse/modules/module-always-sink.c',
> +   'module-protocol-pulse/modules/module-combine-sink.c',
> ++  'module-protocol-pulse/modules/module-compress-offload-sink.c',
> ++  'module-protocol-pulse/modules/module-compress-offload-forwarder.c',
> +   'module-protocol-pulse/modules/module-device-manager.c',
> +   'module-protocol-pulse/modules/module-device-restore.c',
> +   'module-protocol-pulse/modules/module-echo-cancel.c',
> +diff --git
> a/src/modules/module-protocol-pulse/modules/module-compress-offload-forwa=
rder.c
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwa=
rder.c
> +new file mode 100644
> +index 0000000..33054e4
> +--- /dev/null
> ++++
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwa=
rder.c
> +@@ -0,0 +1,649 @@
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
> ++
> ++#define NAME "compress-offload-forwarder"
> ++
> ++#define DEFAULT_CODEC "mp3"
> ++#define DEFAULT_RATE 48000u
> ++#define DEFAULT_CHANNELS 2u
> ++#define DEFAULT_BITRATE 128000u
> ++#define DEFAULT_BLOCK_SIZE (16u * 1024u)
> ++
> ++static const char *const forwarder_options =3D
> ++      "source_sink=3D<Pulse-visible compress sink node.name> "
> ++      "target_sink=3D<PAL compress sink node.name> "
> ++      "codec=3D<codec name, default mp3> "
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
> ++      uint32_t rate;
> ++      uint32_t channels;
> ++      uint32_t bitrate;
> ++      uint32_t block_size;
> ++      uint32_t target_id;
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
> ++};
> ++
> ++static int create_playback_stream(struct forwarder_data *d);
> ++static void set_playback_active(struct forwarder_data *d, bool active);
> ++static void maybe_create_playback_stream(struct forwarder_data *d, cons=
t
> char *reason);
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
> ++      info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;
> ++      info.info.mp3.rate =3D d->rate;
> ++      info.info.mp3.channels =3D d->channels;
> ++      info.info.mp3.channel_mode =3D d->channels =3D=3D 1 ?
> ++              SPA_AUDIO_MP3_CHANNEL_MODE_MONO :
> SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
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
> PW_STREAM_STATE_ERROR)
> ++              set_playback_active(d, false);
> ++}
> ++
> ++static void capture_process(void *data)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++      struct pw_buffer *in_buf, *out_buf;
> ++      struct spa_data *in_data, *out_data;
> ++      uint32_t in_offset, in_size, out_size, copy_size;
> ++      const void *input_data;
> ++      const void *copy_data;
> ++      uint32_t copy_available;
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
> ++
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
> ++
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
> ++      copy_size =3D SPA_MIN(copy_available, out_size);
> ++      memcpy(out_data->data, copy_data, copy_size);
> ++      d->pending_offset +=3D copy_size;
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
> ++static void registry_global(void *data, uint32_t id, uint32_t
> permissions,
> ++              const char *type, uint32_t version, const struct spa_dict
> *props)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++      const char *name;
> ++
> ++      if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || props =3D=3D NULL=
)
> ++              return;
> ++      name =3D spa_dict_lookup(props, PW_KEY_NODE_NAME);
> ++      if (!spa_streq(name, d->target_name))
> ++              return;
> ++      d->target_id =3D id;
> ++      pw_log_info("compress-forwarder target:%s resolved id=3D%u",
> d->target_name, id);
> ++}
> ++
> ++static void registry_global_remove(void *data, uint32_t id)
> ++{
> ++      struct forwarder_data *d =3D data;
> ++
> ++      if (id !=3D d->target_id)
> ++              return;
> ++      pw_log_info("compress-forwarder target:%s removed id=3D%u",
> d->target_name, id);
> ++      d->target_id =3D PW_ID_ANY;
> ++      destroy_playback_stream(d);
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
> ++                      PW_KEY_NODE_RATE, "1/48000",
> ++                      "compress.offload", "true",
> ++                      "codec.type", d->codec,
> ++                      NULL);
> ++      if (props =3D=3D NULL)
> ++              return -errno;
> ++      pw_properties_setf(props, "codec.sample_rate", "%u", d->rate);
> ++      pw_properties_setf(props, "codec.channels", "%u", d->channels);
> ++      pw_properties_setf(props, "codec.bit_rate", "%u", d->bitrate);
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
> ++      pw_log_debug("compress-forwarder target:%s connect target-id=3D%u=
",
> d->target_name, d->target_id);
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
> ++      if (d->capture !=3D NULL) {
> ++              spa_hook_remove(&d->capture_listener);
> ++              pw_stream_destroy(d->capture);
> ++              d->capture =3D NULL;
> ++      }
> ++      destroy_playback_stream(d);
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
> ++
> ++      if (!spa_streq(d->codec, "mp3")) {
> ++              pw_log_warn("compress-forwarder only supports mp3 right
> now, requested codec=3D%s", d->codec);
> ++              return -ENOTSUP;
> ++      }
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
> ++      { PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
> ++      { PW_KEY_MODULE_DESCRIPTION, "Forward Pulse compress-offload sink
> data to PAL compress sink" },
> ++      { PW_KEY_MODULE_USAGE,       forwarder_options },
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
> a/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.=
c
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.=
c
> +new file mode 100644
> +index 0000000..243cc8e
> +--- /dev/null
> ++++
> b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.=
c
> +@@ -0,0 +1,293 @@
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
> ++static const char *const pulse_module_options =3D
> ++      "sink_name=3D<name of sink> "
> ++      "sink_properties=3D<properties for the sink> "
> ++      "target_sink=3D<node.name of the downstream compress-offload sink=
> "
> ++      "codec=3D<codec name, default mp3> "
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
> ++      pw_properties_set(props, "codec.type", str ? str : "mp3");
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
> "true");
> ++      pw_properties_set(props, "monitor.passthrough",
> "true");
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
> ++      { PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
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
> +diff --git a/src/modules/module-protocol-pulse/pulse-server.c
> b/src/modules/module-protocol-pulse/pulse-server.c
> +index eb3233b..61f0dfb 100644
> +--- a/src/modules/module-protocol-pulse/pulse-server.c
> ++++ b/src/modules/module-protocol-pulse/pulse-server.c
> +@@ -84,6 +84,9 @@ struct temporary_move_data {
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
> +@@ -1199,10 +1202,18 @@ static const struct spa_pod
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
> +@@ -1228,6 +1239,23 @@ static void stream_param_changed(void *data,
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
> +@@ -1243,6 +1271,9 @@ static void stream_param_changed(void *data,
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
> +@@ -1583,6 +1614,98 @@ static void log_format_info(struct impl *impl,
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
> ++      struct spa_audio_info info;
> ++      uint32_t sample_rate, channels, bitrate;
> ++
> ++      spa_zero(info);
> ++      info.media_type =3D SPA_MEDIA_TYPE_audio;
> ++      codec =3D pw_properties_get(props, "codec.type");
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
> ++              info.info.aac.stream_format =3D
> SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;
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
> ++      ss->format =3D SPA_AUDIO_FORMAT_S16_LE;
> ++      ss->rate =3D pw_properties_get_uint32(props, "codec.sample_rate",
> 44100);
> ++      channels =3D pw_properties_get_uint32(props, "codec.channels", 2)=
;
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
> + static int do_create_playback_stream(struct client *client, uint32_t
> command, uint32_t tag, struct message *m)
> + {
> +       struct impl *impl =3D client->impl;
> +@@ -1609,7 +1732,8 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> +               muted_set =3D false,
> +               fail_on_suspend =3D false,
> +               relative_volume =3D false,
> +-              passthrough =3D false;
> ++              passthrough =3D false,
> ++              compress_offload =3D false;
> +       struct volume volume;
> +       struct pw_properties *props =3D NULL;
> +       uint8_t n_formats =3D 0;
> +@@ -1668,6 +1792,68 @@ static int do_create_playback_stream(struct clien=
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
> ++                      pw_properties_set(props, "compress.offload",
> "true");
> ++                      pw_properties_set(props,
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
> +@@ -1715,6 +1901,9 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> +                       goto error_protocol;
> +       }
> +
> ++      compress_offload =3D pw_properties_parse_bool(
> ++                      pw_properties_get(props, "compress.offload"));
> ++
> +       if (client->version >=3D 21) {
> +               if (message_get(m,
> +                               TAG_U8, &n_formats,
> +@@ -1732,7 +1921,9 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> +                                               TAG_INVALID) < 0)
> +                                       goto error_protocol;
> +
> +-                              if (n_params < MAX_FORMATS &&
> ++                              if (compress_offload) {
> ++                                      log_format_info(impl,
> SPA_LOG_LEVEL_DEBUG, &format);
> ++                              } else if (n_params < MAX_FORMATS &&
> +                                   (params[n_params] =3D
> format_info_build_param(&b,
> +                                               SPA_PARAM_EnumFormat,
> &format, &r)) !=3D NULL) {
> +                                       n_params++;
> +@@ -1746,7 +1937,23 @@ static int do_create_playback_stream(struct clien=
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
> ++      } else if (sample_spec_valid(&ss)) {
> +               struct sample_spec sfix =3D ss;
> +               struct channel_map mfix =3D map;
> +
> +@@ -1770,6 +1977,8 @@ static int do_create_playback_stream(struct client
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
> +@@ -1806,6 +2015,8 @@ static int do_create_playback_stream(struct client
> *client, uint32_t command, ui
> +       flags =3D 0;
> +       if (no_move)
> +               flags |=3D PW_STREAM_FLAG_DONT_RECONNECT;
> ++      if (compress_offload)
> ++              flags |=3D PW_STREAM_FLAG_NO_CONVERT;
> +
> +       if (sink_name !=3D NULL) {
> +               if (o !=3D NULL)
> +@@ -1833,14 +2044,35 @@ static int do_create_playback_stream(struct
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
> +--
> +2.43.0
> +
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.b=
b
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
> index 50feeaf843..90815ba012 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
> @@ -15,6 +15,7 @@ DEPENDS =3D "dbus"
>  SRCREV =3D "3b2cb4fb037bf6033b87d3c87ee917b2f686d309"
>  BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
>  SRC_URI =3D "git://
> gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D${BRANCH};protocol=
=3Dhttps;tag=3D${PV}
> <http://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D$%7BBRANCH%=
7D;protocol=3Dhttps;tag=3D$%7BPV%7D>
> "
> +SRC_URI +=3D "file://0001-pipewire-compress-offload.patch"
>  SRC_URI +=3D
> "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"
>
>  inherit meson pkgconfig systemd gettext useradd
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128007):
> https://lists.openembedded.org/g/openembedded-devel/message/128007
> Mute This Topic: https://lists.openembedded.org/mt/120097215/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000de1c940655b64b32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 3, =
2026 at 2:25=E2=80=AFAM Harsh Rai via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;harsh.rai=3D<a href=3D"mailto:oss.qualc=
omm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add =
a PipeWire Pulse virtual sink and forwarder for compressed offload, enablin=
g MP3 compressed Pulse streams to be routed to a PAL compressed sink.<br>
<br>
Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" =
target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0.../0001-pipewire-compress-offload.patch=C2=A0 =C2=A0 =C2=A0 | 1343 +=
++++++++++++++++<br>
=C2=A0.../pipewire/<a href=3D"http://pipewire_1.6.7.bb" rel=3D"noreferrer" =
target=3D"_blank">pipewire_1.6.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A02 files changed, 1344 insertions(+)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewi=
re/0001-pipewire-compress-offload.patch<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipe=
wire-compress-offload.patch b/meta-multimedia/recipes-multimedia/pipewire/p=
ipewire/0001-pipewire-compress-offload.patch<br>
new file mode 100644<br>
index 0000000000..9a60e5127a<br>
--- /dev/null<br>
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-pipewire-co=
mpress-offload.patch<br>
@@ -0,0 +1,1343 @@<br>
+From 345e4b033c2ff69ab7aa02a123f6041b878f7fb9 Mon Sep 17 00:00:00 2001<br>
+From: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com" target=
=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+Date: Tue, 16 Jun 2026 19:21:37 +0530<br>
+Subject: [PATCH] pulse: enable MP3 compressed offload via Pulse<br>
+<br>
+Add PipeWire Pulse virtual sink and forwarder for offload.<br>
+Route compressed Pulse streams to PAL compressed sink.<br>
+<br>
+Upstream-Status: Submitted<br></blockquote><div><br></div><div>Submitted t=
ag should accompany with reference to where it was submitted, perhaps a ML =
link or github PR link etc.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+<br>
+Signed-off-by: Harsh Rai &lt;<a href=3D"mailto:harsh.rai@oss.qualcomm.com"=
 target=3D"_blank">harsh.rai@oss.qualcomm.com</a>&gt;<br>
+---<br>
+ src/modules/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
+ .../module-compress-offload-forwarder.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 649 +=
+++++++++++++++++<br>
+ .../modules/module-compress-offload-sink.c=C2=A0 =C2=A0 | 293 ++++++++<br=
>
+ .../module-protocol-pulse/pulse-server.c=C2=A0 =C2=A0 =C2=A0 | 254 ++++++=
-<br>
+ 4 files changed, 1187 insertions(+), 11 deletions(-)<br>
+ create mode 100644 src/modules/module-protocol-pulse/modules/module-compr=
ess-offload-forwarder.c<br>
+ create mode 100644 src/modules/module-protocol-pulse/modules/module-compr=
ess-offload-sink.c<br>
+<br>
+diff --git a/src/modules/meson.build b/src/modules/meson.build<br>
+index 59f46ae..900871d 100644<br>
+--- a/src/modules/meson.build<br>
++++ b/src/modules/meson.build<br>
+@@ -324,6 +324,8 @@ pipewire_module_protocol_pulse_sources =3D [<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-alsa-source.c&#39;,=
<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-always-sink.c&#39;,=
<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-combine-sink.c&#39;=
,<br>
++=C2=A0 &#39;module-protocol-pulse/modules/module-compress-offload-sink.c&=
#39;,<br>
++=C2=A0 &#39;module-protocol-pulse/modules/module-compress-offload-forward=
er.c&#39;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-device-manager.c&#3=
9;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-device-restore.c&#3=
9;,<br>
+=C2=A0 =C2=A0&#39;module-protocol-pulse/modules/module-echo-cancel.c&#39;,=
<br>
+diff --git a/src/modules/module-protocol-pulse/modules/module-compress-off=
load-forwarder.c b/src/modules/module-protocol-pulse/modules/module-compres=
s-offload-forwarder.c<br>
+new file mode 100644<br>
+index 0000000..33054e4<br>
+--- /dev/null<br>
++++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-fo=
rwarder.c<br>
+@@ -0,0 +1,649 @@<br>
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
++<br>
++#define NAME &quot;compress-offload-forwarder&quot;<br>
++<br>
++#define DEFAULT_CODEC &quot;mp3&quot;<br>
++#define DEFAULT_RATE 48000u<br>
++#define DEFAULT_CHANNELS 2u<br>
++#define DEFAULT_BITRATE 128000u<br>
++#define DEFAULT_BLOCK_SIZE (16u * 1024u)<br>
++<br>
++static const char *const forwarder_options =3D<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;source_sink=3D&lt;Pulse-visible compress sink =
<a href=3D"http://node.name" rel=3D"noreferrer" target=3D"_blank">node.name=
</a>&gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;target_sink=3D&lt;PAL compress sink <a href=3D=
"http://node.name" rel=3D"noreferrer" target=3D"_blank">node.name</a>&gt; &=
quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;codec=3D&lt;codec name, default mp3&gt; &quot;=
<br>
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
++=C2=A0 =C2=A0 =C2=A0 uint32_t rate;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t channels;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t bitrate;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t block_size;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t target_id;<br>
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
++};<br>
++<br>
++static int create_playback_stream(struct forwarder_data *d);<br>
++static void set_playback_active(struct forwarder_data *d, bool active);<b=
r>
++static void maybe_create_playback_stream(struct forwarder_data *d, const =
char *reason);<br>
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
++=C2=A0 =C2=A0 =C2=A0 info.media_subtype =3D SPA_MEDIA_SUBTYPE_mp3;<br>
++=C2=A0 =C2=A0 =C2=A0 info.info.mp3.rate =3D d-&gt;rate;<br>
++=C2=A0 =C2=A0 =C2=A0 info.info.mp3.channels =3D d-&gt;channels;<br>
++=C2=A0 =C2=A0 =C2=A0 info.info.mp3.channel_mode =3D d-&gt;channels =3D=3D=
 1 ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPA_AUDIO_MP3_CHANNEL_MO=
DE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;<br>
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
=3D PW_STREAM_STATE_ERROR)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_playback_active(d, f=
alse);<br>
++}<br>
++<br>
++static void capture_process(void *data)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 struct pw_buffer *in_buf, *out_buf;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_data *in_data, *out_data;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t in_offset, in_size, out_size, copy_size;<br=
>
++=C2=A0 =C2=A0 =C2=A0 const void *input_data;<br>
++=C2=A0 =C2=A0 =C2=A0 const void *copy_data;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t copy_available;<br>
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
++<br>
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
++<br>
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
++=C2=A0 =C2=A0 =C2=A0 copy_size =3D SPA_MIN(copy_available, out_size);<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(out_data-&gt;data, copy_data, copy_size);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;pending_offset +=3D copy_size;<br>
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
++static void registry_global(void *data, uint32_t id, uint32_t permissions=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *type, uint32=
_t version, const struct spa_dict *props)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *name;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || prop=
s =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 name =3D spa_dict_lookup(props, PW_KEY_NODE_NAME);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 if (!spa_streq(name, d-&gt;target_name))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D id;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder target:%s resol=
ved id=3D%u&quot;, d-&gt;target_name, id);<br>
++}<br>
++<br>
++static void registry_global_remove(void *data, uint32_t id)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct forwarder_data *d =3D data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (id !=3D d-&gt;target_id)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_info(&quot;compress-forwarder target:%s remov=
ed id=3D%u&quot;, d-&gt;target_name, id);<br>
++=C2=A0 =C2=A0 =C2=A0 d-&gt;target_id =3D PW_ID_ANY;<br>
++=C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(d);<br>
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
=A0 PW_KEY_NODE_RATE, &quot;1/48000&quot;,<br>
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
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;compress-forwarder target:%s conn=
ect target-id=3D%u&quot;, d-&gt;target_name, d-&gt;target_id);<br>
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
++=C2=A0 =C2=A0 =C2=A0 if (d-&gt;capture !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_hook_remove(&amp;d-&=
gt;capture_listener);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_stream_destroy(d-&gt;=
capture);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;capture =3D NULL;<=
br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 destroy_playback_stream(d);<br>
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
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!spa_streq(d-&gt;codec, &quot;mp3&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_log_warn(&quot;compre=
ss-forwarder only supports mp3 right now, requested codec=3D%s&quot;, d-&gt=
;codec);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
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
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_AUTHOR,=C2=A0 =C2=A0 =C2=A0 &quot;Qu=
alcomm Technologies, Inc.&quot; },<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_DESCRIPTION, &quot;Forward Pulse com=
press-offload sink data to PAL compress sink&quot; },<br>
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_USAGE,=C2=A0 =C2=A0 =C2=A0 =C2=A0for=
warder_options },<br>
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
+diff --git a/src/modules/module-protocol-pulse/modules/module-compress-off=
load-sink.c b/src/modules/module-protocol-pulse/modules/module-compress-off=
load-sink.c<br>
+new file mode 100644<br>
+index 0000000..243cc8e<br>
+--- /dev/null<br>
++++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-si=
nk.c<br>
+@@ -0,0 +1,293 @@<br>
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
++static const char *const pulse_module_options =3D<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sink_name=3D&lt;name of sink&gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sink_properties=3D&lt;properties for the sink&=
gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;target_sink=3D&lt;<a href=3D"http://node.name"=
 rel=3D"noreferrer" target=3D"_blank">node.name</a> of the downstream compr=
ess-offload sink&gt; &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;codec=3D&lt;codec name, default mp3&gt; &quot;=
<br>
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
 ? str : &quot;mp3&quot;);<br>
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
es&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pw_properties_set(props, &quot;monitor.passthrough&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;true&quot;);<br=
>
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
++=C2=A0 =C2=A0 =C2=A0 { PW_KEY_MODULE_AUTHOR,=C2=A0 =C2=A0 =C2=A0 &quot;Qu=
alcomm Technologies, Inc.&quot; },<br>
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
+diff --git a/src/modules/module-protocol-pulse/pulse-server.c b/src/module=
s/module-protocol-pulse/pulse-server.c<br>
+index eb3233b..61f0dfb 100644<br>
+--- a/src/modules/module-protocol-pulse/pulse-server.c<br>
++++ b/src/modules/module-protocol-pulse/pulse-server.c<br>
+@@ -84,6 +84,9 @@ struct temporary_move_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t used:1;<br>
+ };<br>
+<br>
++/* Buffer size used for compress-offload streams (frame_size =3D=3D 1). *=
/<br>
++#define COMPRESS_OFFLOAD_BUF_SIZE=C2=A0 16484u<br>
++<br>
+ static struct sample *find_sample(struct impl *impl, uint32_t index, cons=
t char *name)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0union pw_map_item *item;<br>
+@@ -1199,10 +1202,18 @@ static const struct spa_pod *get_buffers_param(str=
uct stream *s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0blocks =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stride =3D s-&gt;frame_size;<br>
+<br>
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
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pw_log_info(&quot;[%s] stride %d size %u&quot;,=
 s-&gt;client-&gt;name, stride, size);<br>
+<br>
++build_buffers_param:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0param =3D spa_pod_builder_add_object(b,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SPA_PARAM_BUFFERS_buffers, SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,<=
br>
+@@ -1228,6 +1239,23 @@ static void stream_param_changed(void *data, uint32=
_t id, const struct spa_pod *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (id !=3D SPA_PARAM_Format || param =3D=3D NU=
LL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
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
+@@ -1243,6 +1271,9 @@ static void stream_param_changed(void *data, uint32_=
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
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream-&gt;create_tag !=3D SPA_ID_INVALID) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_manager_o=
bject *peer;<br>
+@@ -1583,6 +1614,98 @@ static void log_format_info(struct impl *impl, enum=
 spa_log_level level, struct<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0impl, it-&gt;key, it-&gt;value);<br>
+ }<br>
+<br>
++static const struct spa_pod *build_compress_offload_format(struct spa_pod=
_builder *b,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t id, const struc=
t pw_properties *props, uint32_t *rate)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 const char *codec;<br>
++=C2=A0 =C2=A0 =C2=A0 struct spa_audio_info info;<br>
++=C2=A0 =C2=A0 =C2=A0 uint32_t sample_rate, channels, bitrate;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 spa_zero(info);<br>
++=C2=A0 =C2=A0 =C2=A0 info.media_type =3D SPA_MEDIA_TYPE_audio;<br>
++=C2=A0 =C2=A0 =C2=A0 codec =3D pw_properties_get(props, &quot;codec.type&=
quot;);<br>
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
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.info.aac.stream_for=
mat =3D SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;<br>
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
++=C2=A0 =C2=A0 =C2=A0 ss-&gt;format =3D SPA_AUDIO_FORMAT_S16_LE;<br>
++=C2=A0 =C2=A0 =C2=A0 ss-&gt;rate =3D pw_properties_get_uint32(props, &quo=
t;codec.sample_rate&quot;, 44100);<br>
++=C2=A0 =C2=A0 =C2=A0 channels =3D pw_properties_get_uint32(props, &quot;c=
odec.channels&quot;, 2);<br>
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
+ static int do_create_playback_stream(struct client *client, uint32_t comm=
and, uint32_t tag, struct message *m)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct impl *impl =3D client-&gt;impl;<br>
+@@ -1609,7 +1732,8 @@ static int do_create_playback_stream(struct client *=
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
se;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct volume volume;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pw_properties *props =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t n_formats =3D 0;<br>
+@@ -1668,6 +1792,68 @@ static int do_create_playback_stream(struct client =
*client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0o =3D find_device(client, sink_index, sink_name=
, true, &amp;is_monitor);<br>
+<br>
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
=A0 pw_properties_set(props, &quot;compress.offload&quot;, &quot;true&quot;=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_set(props, &quot;item.node.supports-encoded-fmts&quot;, &=
quot;true&quot;);<br>
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
+@@ -1715,6 +1901,9 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto error_protocol;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 compress_offload =3D pw_properties_parse_bool(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pw_properties_get(props, &quot;compress.offload&quot;));<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (client-&gt;version &gt;=3D 21) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (message_get(m,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TAG_U8, &amp;n_formats,<br>
+@@ -1732,7 +1921,9 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TAG_INVALID) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto erro=
r_protocol;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n_params &lt; MAX_FORMATS &amp;&amp;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (compress_offload) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_format_info=
(impl, SPA_LOG_LEVEL_DEBUG, &amp;format);<br>
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
+@@ -1746,7 +1937,23 @@ static int do_create_playback_stream(struct client =
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
++=C2=A0 =C2=A0 =C2=A0 } else if (sample_spec_valid(&amp;ss)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sample_spec =
sfix =3D ss;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct channel_map =
mfix =3D map;<br>
+<br>
+@@ -1770,6 +1977,8 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (m-&gt;offset !=3D m-&gt;length)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_protocol=
;<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 pw_log_debug(&quot;[%s] format check: n_valid=3D%u n=
_params=3D%u compress=3D%d passthrough=3D%d&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;name, n_valid_formats, n_params, compress_offload, passthrou=
gh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n_valid_formats =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_no_forma=
ts;<br>
+<br>
+@@ -1806,6 +2015,8 @@ static int do_create_playback_stream(struct client *=
client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (no_move)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D PW_STREA=
M_FLAG_DONT_RECONNECT;<br>
++=C2=A0 =C2=A0 =C2=A0 if (compress_offload)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D PW_STREAM_FLA=
G_NO_CONVERT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sink_name !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (o !=3D NULL)<br=
>
+@@ -1833,14 +2044,35 @@ static int do_create_playback_stream(struct client=
 *client, uint32_t command, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;stream-&gt;stream_listener,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;stream_events, stream);<br>
+<br>
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
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stream_update_tag_param(stream);<br>
+<br>
+--<br>
+2.43.0<br>
+<br>
diff --git a/meta-multimedia/recipes-multimedia/pipewire/<a href=3D"http://=
pipewire_1.6.7.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.7.bb</=
a> b/meta-multimedia/recipes-multimedia/pipewire/<a href=3D"http://pipewire=
_1.6.7.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.7.bb</a><br>
index 50feeaf843..90815ba012 100644<br>
--- a/meta-multimedia/recipes-multimedia/pipewire/<a href=3D"http://pipewir=
e_1.6.7.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.7.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/pipewire/<a href=3D"http://pipewir=
e_1.6.7.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.7.bb</a><br>
@@ -15,6 +15,7 @@ DEPENDS =3D &quot;dbus&quot;<br>
=C2=A0SRCREV =3D &quot;3b2cb4fb037bf6033b87d3c87ee917b2f686d309&quot;<br>
=C2=A0BRANCH =3D &quot;${@oe.utils.trim_version(&#39;${PV}&#39;, 2)}&quot;<=
br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/pipe=
wire/pipewire.git;branch=3D$%7BBRANCH%7D;protocol=3Dhttps;tag=3D$%7BPV%7D" =
rel=3D"noreferrer" target=3D"_blank">gitlab.freedesktop.org/pipewire/pipewi=
re.git;branch=3D${BRANCH};protocol=3Dhttps;tag=3D${PV}</a>&quot;<br>
+SRC_URI +=3D &quot;file://0001-pipewire-compress-offload.patch&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://0002-spa-plugins-alsa-acp-compat.h-p-is-alr=
eady-const-do-.patch&quot;<br>
<br>
=C2=A0inherit meson pkgconfig systemd gettext useradd<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128007): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128007" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128007</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120097215/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120097215/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000de1c940655b64b32--

