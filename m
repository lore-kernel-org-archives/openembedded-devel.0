Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72FEC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 06:23:05 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.2407.1686118983356553962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 23:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f8orQ4vR;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso1728520276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 23:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686118982; x=1688710982;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0L2wRK5MWYuXB3UQRvUxZNbFnfr3p64QbFDTYAcjWU=;
        b=f8orQ4vRn/xIw8WgLR5s/rBthpl+YL/j7K/I90/7vYJBjBEAsAmD43XeNrAzvWvd/N
         qYy/Xx/XvPbCYS7hf/6feWq9q0cRyFixEhFXO+DwDH6BPR+klaLaE88Sph286UXPZG5w
         6l8SPtNbk3x2OmPU8Pf3y4/rufkb3GBWQvw0K2WCJS/fx4cn2hWU9w+2j2k1eiHw7m3X
         j9gIPbmB3VybzQpkLQjQ6sqj9tC/38H2Q7YumstcY/gZb5aUW9ohMW15FS1WFgsN1k9J
         4cnoP1M6wutsdBEfT6Rhcz8UNiNtXqwLex1cFMlItoigATehTNOEbn5WWWf4x1R/ziFU
         G+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686118982; x=1688710982;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0L2wRK5MWYuXB3UQRvUxZNbFnfr3p64QbFDTYAcjWU=;
        b=Y7A89s8xfX3ymSdi7Dg69sD3m1GfrcJvipp6BVRuK4tkS1J5DzJXb+z9aYMTWg7EaV
         UtC/vvObBdBdkk3bsc3Wha3UKdAtY2yEKwddP+yW91dTy7bJEaxPq138wTIkIwdR/GL6
         z/BO7UlNqGUigNM4BTj3tMzxR5ep3NsKf1pd2qF9Nx0p87p/cuGlknox6M7zpFjr2Tru
         8OeUQH+HWvR9qTmtoaj9+swt2sssR696PhJ3GvyhYGxKuL5nPgI2oG82z8KwCESDrGr1
         sTll+VUkbBu+kyHuT7HmI6RpZIEQqyEy09NRQPmafxgYD+YNTrm7Txh522shpsqKPgsT
         T5bg==
X-Gm-Message-State: AC+VfDyIw1GFe71uKKYZC+7ds+cy9QYKlvNKyIc9j8NsjndzSyxDK5GA
	CE1DDu7uARyzib5nzO2md3xEBqIzxpI=
X-Google-Smtp-Source: ACHHUZ7Wx4j7TA1qO7ze5fUGp3qAlqxzqw5rkXFLET0uXMm49kAQLiT844hyVBwcy6FoaDR95OPfTg==
X-Received: by 2002:a81:5d56:0:b0:54c:1d2e:f371 with SMTP id r83-20020a815d56000000b0054c1d2ef371mr4880580ywb.27.1686118982370;
        Tue, 06 Jun 2023 23:23:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:c463:b29:d008:874c? ([2600:1700:9190:ba10:c463:b29:d008:874c])
        by smtp.gmail.com with ESMTPSA id b9-20020a816709000000b0054f97b52934sm4611361ywc.54.2023.06.06.23.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 23:23:01 -0700 (PDT)
Message-ID: <e0866cc2-46db-7225-62da-49e06dcc845a@gmail.com>
Date: Wed, 7 Jun 2023 02:23:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-networking][master][PATCH] wireshark: Fix
 CVE-2023-2855 & CVE-2023-2856
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20230607051600.7107-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230607051600.7107-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 06:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103158



On 6/7/23 1:16 AM, Hitendra Prajapati wrote:
> Backport fixes for:
> * CVE-2023-2855 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb
> * CVE-2023-2856 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca

This will work for mickledore too.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../wireshark/files/CVE-2023-2855.patch       | 108 ++++++++++++++++++
>   .../wireshark/files/CVE-2023-2856.patch       |  69 +++++++++++
>   .../wireshark/wireshark_3.4.12.bb             |   2 +
>   3 files changed, 179 insertions(+)
>   create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
>   create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
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
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
> new file mode 100644
> index 000000000..863421f98
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
> @@ -0,0 +1,69 @@
> +From db5135826de3a5fdb3618225c2ff02f4207012ca Mon Sep 17 00:00:00 2001
> +From: Guy Harris <gharris@sonic.net>
> +Date: Thu, 18 May 2023 15:03:23 -0700
> +Subject: [PATCH] vms: fix the search for the packet length field.
> +
> +The packet length field is of the form
> +
> +    Total Length = DDD = ^xXXX
> +
> +where "DDD" is the length in decimal and "XXX" is the length in
> +hexadecimal.
> +
> +Search for "length ". not just "Length", as we skip past "Length ", not
> +just "Length", so if we assume we found "Length " but only found
> +"Length", we'd skip past the end of the string.
> +
> +While we're at it, fail if we don't find a length field, rather than
> +just blithely acting as if the packet length were zero.
> +
> +Fixes #19083.
> +
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca]
> +CVE: CVE-2023-2856
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + wiretap/vms.c | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/wiretap/vms.c b/wiretap/vms.c
> +index 0aa83ea..5f5fdbb 100644
> +--- a/wiretap/vms.c
> ++++ b/wiretap/vms.c
> +@@ -318,6 +318,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
> + {
> +     char    line[VMS_LINE_LENGTH + 1];
> +     int     num_items_scanned;
> ++    gboolean have_pkt_len = FALSE;
> +     guint32 pkt_len = 0;
> +     int     pktnum;
> +     int     csec = 101;
> +@@ -374,7 +375,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
> +                 return FALSE;
> +             }
> +         }
> +-        if ( (! pkt_len) && (p = strstr(line, "Length"))) {
> ++        if ( (! have_pkt_len) && (p = strstr(line, "Length "))) {
> +             p += sizeof("Length ");
> +             while (*p && ! g_ascii_isdigit(*p))
> +                 p++;
> +@@ -390,9 +391,15 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
> +                 *err_info = g_strdup_printf("vms: Length field '%s' not valid", p);
> +                 return FALSE;
> +             }
> ++            have_pkt_len = TRUE;
> +             break;
> +         }
> +     } while (! isdumpline(line));
> ++    if (! have_pkt_len) {
> ++        *err = WTAP_ERR_BAD_FILE;
> ++        *err_info = g_strdup_printf("vms: Length field not found");
> ++        return FALSE;
> ++    }
> +     if (pkt_len > WTAP_MAX_PACKET_SIZE_STANDARD) {
> +         /*
> +          * Probably a corrupt capture file; return an error,
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> index 693a16793..ff99a7508 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> @@ -16,6 +16,8 @@ SRC_URI += " \
>       file://0003-bison-Remove-line-directives.patch \
>       file://0004-lemon-Remove-line-directives.patch \
>       file://CVE-2022-3190.patch \
> +    file://CVE-2023-2855.patch \
> +    file://CVE-2023-2856.patch \
>   "
>   
>   UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103155): https://lists.openembedded.org/g/openembedded-devel/message/103155
> Mute This Topic: https://lists.openembedded.org/mt/99379081/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


