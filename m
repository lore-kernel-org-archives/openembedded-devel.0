Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8121C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:55:10 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.6769.1686052503863294386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=N2Gva8Cw;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-ba8cd61ee2dso10452364276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 04:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686052503; x=1688644503;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjSVdl19lbIYroTZ37DX4Pk04jis8IyQ7cavgjAbl0A=;
        b=N2Gva8CwkBMb8NwlBpRnB94LYYZ6bUrCsxKPVXTxH/g5OIsQRYr4MDcAOcgpUx9aTp
         vI+aWcO58Mx8WhdcA8czxrBGL5CH2vVMSTCgWKj49R/eTII5ZkshXdgaxyAWHE1Q4YLB
         daT3YsWjsLwPq0Q6rGoFKV3dOQwPlXy8kBPVN/Pb7MiSY3wA10dsJHaGjueLrrS36PXT
         6mVeQXSn/M+4sjqdxHYIKvgOMhpGkyCPVD7i3FYwsBS7NVxstfAn/nrnXv0LJltFafXf
         1ESQ75rXU6w0NndCqbabmpH/N46yExORRxfIeKdqI15/y+nGiCmlGdN/vsgt0Nuu+1zM
         TSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686052503; x=1688644503;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjSVdl19lbIYroTZ37DX4Pk04jis8IyQ7cavgjAbl0A=;
        b=YVdh/IjwvwWq/D0IBV7mV/69DA5YkViK4iDkIyrrXtcGmG6qBq0m6Edxc+XuxEypi4
         N9sPqrIYsYQ4I34T5SW0nkEWl7Bsr5Bjs00lxLADHACXt7bdZo9phHMyDUs99kbA8XAt
         ocAlIZQvGiPka0Orvz0wl1/C+2tNg+BUj5UMNtHwaDxlfO6HooX4oNraGqAy8OilDJO0
         pfoBAASoghdvaNWAa4KAIH9pZrEzqSW8Pq739bLKz4dpzQ5eslHKRlzod7dQ+AgEnpYX
         D5HOoDKw2Mrb3vTttLu6qj4lYGjrdqIy+0xJJYGIN/oPIWb2Qe/MSv2h8o28qHX2e3iz
         ZxSw==
X-Gm-Message-State: AC+VfDwYUcHQr+WzGoTSNdbCW3Fa3HSMcT83CJ6xujOVqww8b7mhPCkb
	0e2nKLlqMEn5m5xmLQRGm1Jl2s81Ro8=
X-Google-Smtp-Source: ACHHUZ6aTNWiUDTziXV3Ca/mqjRlT4d4tJ8RDBLgO2YYcHKH3ZZ89qNz05GbV2HZrYfJWwhFRt5CzQ==
X-Received: by 2002:a81:49c4:0:b0:565:6a95:51 with SMTP id w187-20020a8149c4000000b005656a950051mr12698003ywa.15.1686052502887;
        Tue, 06 Jun 2023 04:55:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:80a4:77d9:1771:30e8? ([2600:1700:9190:ba10:80a4:77d9:1771:30e8])
        by smtp.gmail.com with ESMTPSA id p68-20020a0dcd47000000b0055a382ae26fsm4026306ywd.49.2023.06.06.04.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:55:02 -0700 (PDT)
Message-ID: <be3cb96a-f707-45bb-c551-312a5e310278@gmail.com>
Date: Tue, 6 Jun 2023 07:55:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] wireshark: CVE-2023-2855
 Candump log file parser crash
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20230606083524.123709-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230606083524.123709-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 11:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103140



On 6/6/23 4:35 AM, Hitendra Prajapati wrote:
> Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>

These need to go into master first.

-armin
> ---
>   .../wireshark/files/CVE-2023-2855.patch       | 108 ++++++++++++++++++
>   .../wireshark/wireshark_3.4.12.bb             |   1 +
>   2 files changed, 109 insertions(+)
>   create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
> new file mode 100644
> index 000000000..b4718f460
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
> @@ -0,0 +1,108 @@
> +From 0181fafb2134a177328443a60b5e29c4ee1041cb Mon Sep 17 00:00:00 2001
> +From: Guy Harris <gharris@sonic.net>
> +Date: Tue, 16 May 2023 12:05:07 -0700
> +Subject: [PATCH] candump: check for a too-long frame length.
> +
> +If the frame length is longer than the maximum, report an error in the
> +file.
> +
> +Fixes #19062, preventing the overflow on a buffer on the stack (assuming
> +your compiler doesn't call a bounds-checknig version of memcpy() if the
> +size of the target space is known).
> +
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb]
> +CVE: CVE-2023-2855
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + wiretap/candump.c | 39 +++++++++++++++++++++++++++++++--------
> + 1 file changed, 31 insertions(+), 8 deletions(-)
> +
> +diff --git a/wiretap/candump.c b/wiretap/candump.c
> +index 0def7bc..3f7c2b2 100644
> +--- a/wiretap/candump.c
> ++++ b/wiretap/candump.c
> +@@ -26,8 +26,9 @@ static gboolean candump_seek_read(wtap *wth, gint64 seek_off,
> +                                   wtap_rec *rec, Buffer *buf,
> +                                   int *err, gchar **err_info);
> +
> +-static void
> +-candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
> ++static gboolean
> ++candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg, int *err,
> ++                     gchar **err_info)
> + {
> +     static const char *can_proto_name    = "can-hostendian";
> +     static const char *canfd_proto_name  = "canfd";
> +@@ -59,6 +60,18 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
> +     {
> +         canfd_frame_t canfd_frame = {0};
> +
> ++        /*
> ++         * There's a maximum of CANFD_MAX_DLEN bytes in a CAN-FD frame.
> ++         */
> ++        if (msg->data.length > CANFD_MAX_DLEN) {
> ++            *err = WTAP_ERR_BAD_FILE;
> ++            if (err_info != NULL) {
> ++	        *err_info = g_strdup_printf("candump: File has %u-byte CAN FD packet, bigger than maximum of %u",
> ++                                             msg->data.length, CANFD_MAX_DLEN);
> ++            }
> ++            return FALSE;
> ++        }
> ++
> +         canfd_frame.can_id = msg->id;
> +         canfd_frame.flags  = msg->flags;
> +         canfd_frame.len    = msg->data.length;
> +@@ -70,6 +83,18 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
> +     {
> +         can_frame_t can_frame = {0};
> +
> ++        /*
> ++         * There's a maximum of CAN_MAX_DLEN bytes in a CAN frame.
> ++         */
> ++        if (msg->data.length > CAN_MAX_DLEN) {
> ++            *err = WTAP_ERR_BAD_FILE;
> ++            if (err_info != NULL) {
> ++	        *err_info = g_strdup_printf("candump: File has %u-byte CAN packet, bigger than maximum of %u",
> ++                                             msg->data.length, CAN_MAX_DLEN);
> ++            }
> ++            return FALSE;
> ++        }
> ++
> +         can_frame.can_id  = msg->id;
> +         can_frame.can_dlc = msg->data.length;
> +         memcpy(can_frame.data, msg->data.data, msg->data.length);
> +@@ -84,6 +109,8 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
> +
> +     rec->rec_header.packet_header.caplen = packet_length;
> +     rec->rec_header.packet_header.len    = packet_length;
> ++
> ++    return TRUE;
> + }
> +
> + static gboolean
> +@@ -190,9 +217,7 @@ candump_read(wtap *wth, wtap_rec *rec, Buffer *buf, int *err, gchar **err_info,
> +     ws_debug_printf("%s: Stopped at offset %" PRIi64 "\n", G_STRFUNC, file_tell(wth->fh));
> + #endif
> +
> +-    candump_write_packet(rec, buf, &msg);
> +-
> +-    return TRUE;
> ++    return candump_write_packet(rec, buf, &msg, err, err_info);
> + }
> +
> + static gboolean
> +@@ -216,9 +241,7 @@ candump_seek_read(wtap *wth , gint64 seek_off, wtap_rec *rec,
> +     if (!candump_parse(wth->random_fh, &msg, NULL, err, err_info))
> +         return FALSE;
> +
> +-    candump_write_packet(rec, buf, &msg);
> +-
> +-    return TRUE;
> ++    return candump_write_packet(rec, buf, &msg, err, err_info);
> + }
> +
> + /*
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> index 1a4aedc13..b1f484803 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> @@ -16,6 +16,7 @@ SRC_URI += " \
>       file://0003-bison-Remove-line-directives.patch \
>       file://0004-lemon-Remove-line-directives.patch \
>       file://CVE-2022-3190.patch \
> +    file://CVE-2023-2855.patch \
>   "
>   
>   UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103134): https://lists.openembedded.org/g/openembedded-devel/message/103134
> Mute This Topic: https://lists.openembedded.org/mt/99359292/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


