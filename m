Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B27CC7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 05:53:56 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.2160.1686117229827419113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 22:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bWXOlvJz;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-19f9f11ba3dso6326154fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 22:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686117229; x=1688709229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSnIQLSpRFxE4XoxCjFyyBMJMsheTJ23d3JnMlQC+jA=;
        b=bWXOlvJz0XfwhfLsiYZJGbKUDQIPr7xZnMbvMKDd8EvkXg3P+tYLkJX9/prFZlgJ2g
         msemUTsTieFo3LdKIqG0fWsQZdUFPdnol11VbqjJ/J3hKGAUcCuaVnBJWXlkeOE3z8k4
         1SUJoJsB3WkGSkk+oN8wiYSS7IHOzVyperVDishCa0pmZym/Rss3Rdc8qnRAau4QBi+3
         zLyYNPtAGT3f/tLK8jCpKwsP+Qtk3OS1p/zZ2/4kxfEV8FITvbUNgUZPgxKdiiCm7MM9
         MIEvjN8emaOZOVUSdnlJlIW5sJE1mcYYYnjNlRv25CmOVmxoCT5A6Gyd/NpN5qX1zxC/
         LNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686117229; x=1688709229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSnIQLSpRFxE4XoxCjFyyBMJMsheTJ23d3JnMlQC+jA=;
        b=cy4sKe5Zk7YxvxOH9v8IBJLljAudXg/IzsZcN1gwX+I+QRYTF0i6FJL9qDqlVpUoRQ
         r2E/rjQ1Q0OObcVcCTg7fl4ADFd+gPatU6aST+bsxZvS/NUFtn+kAq9u4QXZH8rLz6Xh
         71IUTnHaxEnq34NvChvqOTe+yNKDH6C8yRV76gfLkqMvBq79/T2Vi5z0vZR/pVrucUX2
         qo87gegxHA97YF4OTNL88oG8x+tM75BL0Y6ERFTaViPmvf1j4hU262CA58sk5sT+rVT6
         f45HFdFiXHwaBubeJvtHk8yOAJHyNJ3FXEyzGcPc1jWExGKM4iC1fIrG1rJ8sQMGY3yc
         MiYA==
X-Gm-Message-State: AC+VfDxFNzwbZJjoKYYFoDYFLyK5fo96SZi/fhSpT6c/UQHFmw3hUuAa
	lsshn/DnSYBRTY2Jc7kJpZnhxfbgaPOxGy7/shg=
X-Google-Smtp-Source: ACHHUZ59Suhf5Xg+ONXWA1qxcm+UroOlz6i4xlDvDyndPpX/tbk4F7g5a8RcRKPcOjuzZPDNC4lcForMUy9+ooszjws=
X-Received: by 2002:a05:6870:4155:b0:19f:ad08:f8bd with SMTP id
 r21-20020a056870415500b0019fad08f8bdmr3097777oad.22.1686117228703; Tue, 06
 Jun 2023 22:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230607051600.7107-1-hprajapati@mvista.com>
In-Reply-To: <20230607051600.7107-1-hprajapati@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2023 22:53:22 -0700
Message-ID: <CAMKF1sq9mW=Fy2USg4CLzjdWTqKiuqO_PEPUnpcXD5u7NL3zwQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][master][PATCH] wireshark: Fix
 CVE-2023-2855 & CVE-2023-2856
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 05:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103156

We have 4.0.6 staged in master-next, do we still need it with 4.0.6 ?
if so please rebase on master-next and resend.

On Tue, Jun 6, 2023 at 10:16=E2=80=AFPM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Backport fixes for:
> * CVE-2023-2855 - Upstream-Status: Backport from https://gitlab.com/wires=
hark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb
> * CVE-2023-2856 - Upstream-Status: Backport from https://gitlab.com/wires=
hark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../wireshark/files/CVE-2023-2855.patch       | 108 ++++++++++++++++++
>  .../wireshark/files/CVE-2023-2856.patch       |  69 +++++++++++
>  .../wireshark/wireshark_3.4.12.bb             |   2 +
>  3 files changed, 179 insertions(+)
>  create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2=
023-2855.patch
>  create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2=
023-2856.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-285=
5.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.pat=
ch
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
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/comm=
it/0181fafb2134a177328443a60b5e29c4ee1041cb]
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
> +@@ -26,8 +26,9 @@ static gboolean candump_seek_read(wtap *wth, gint64 se=
ek_off,
> +                                   wtap_rec *rec, Buffer *buf,
> +                                   int *err, gchar **err_info);
> +
> +-static void
> +-candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
> ++static gboolean
> ++candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg, int =
*err,
> ++                     gchar **err_info)
> + {
> +     static const char *can_proto_name    =3D "can-hostendian";
> +     static const char *canfd_proto_name  =3D "canfd";
> +@@ -59,6 +60,18 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, cons=
t msg_t *msg)
> +     {
> +         canfd_frame_t canfd_frame =3D {0};
> +
> ++        /*
> ++         * There's a maximum of CANFD_MAX_DLEN bytes in a CAN-FD frame.
> ++         */
> ++        if (msg->data.length > CANFD_MAX_DLEN) {
> ++            *err =3D WTAP_ERR_BAD_FILE;
> ++            if (err_info !=3D NULL) {
> ++              *err_info =3D g_strdup_printf("candump: File has %u-byte =
CAN FD packet, bigger than maximum of %u",
> ++                                             msg->data.length, CANFD_MA=
X_DLEN);
> ++            }
> ++            return FALSE;
> ++        }
> ++
> +         canfd_frame.can_id =3D msg->id;
> +         canfd_frame.flags  =3D msg->flags;
> +         canfd_frame.len    =3D msg->data.length;
> +@@ -70,6 +83,18 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, cons=
t msg_t *msg)
> +     {
> +         can_frame_t can_frame =3D {0};
> +
> ++        /*
> ++         * There's a maximum of CAN_MAX_DLEN bytes in a CAN frame.
> ++         */
> ++        if (msg->data.length > CAN_MAX_DLEN) {
> ++            *err =3D WTAP_ERR_BAD_FILE;
> ++            if (err_info !=3D NULL) {
> ++              *err_info =3D g_strdup_printf("candump: File has %u-byte =
CAN packet, bigger than maximum of %u",
> ++                                             msg->data.length, CAN_MAX_=
DLEN);
> ++            }
> ++            return FALSE;
> ++        }
> ++
> +         can_frame.can_id  =3D msg->id;
> +         can_frame.can_dlc =3D msg->data.length;
> +         memcpy(can_frame.data, msg->data.data, msg->data.length);
> +@@ -84,6 +109,8 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, cons=
t msg_t *msg)
> +
> +     rec->rec_header.packet_header.caplen =3D packet_length;
> +     rec->rec_header.packet_header.len    =3D packet_length;
> ++
> ++    return TRUE;
> + }
> +
> + static gboolean
> +@@ -190,9 +217,7 @@ candump_read(wtap *wth, wtap_rec *rec, Buffer *buf, =
int *err, gchar **err_info,
> +     ws_debug_printf("%s: Stopped at offset %" PRIi64 "\n", G_STRFUNC, f=
ile_tell(wth->fh));
> + #endif
> +
> +-    candump_write_packet(rec, buf, &msg);
> +-
> +-    return TRUE;
> ++    return candump_write_packet(rec, buf, &msg, err, err_info);
> + }
> +
> + static gboolean
> +@@ -216,9 +241,7 @@ candump_seek_read(wtap *wth , gint64 seek_off, wtap_=
rec *rec,
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
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-285=
6.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.pat=
ch
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
> +    Total Length =3D DDD =3D ^xXXX
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
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/comm=
it/db5135826de3a5fdb3618225c2ff02f4207012ca]
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
> +@@ -318,6 +318,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *b=
uf, int *err, gchar **err_in
> + {
> +     char    line[VMS_LINE_LENGTH + 1];
> +     int     num_items_scanned;
> ++    gboolean have_pkt_len =3D FALSE;
> +     guint32 pkt_len =3D 0;
> +     int     pktnum;
> +     int     csec =3D 101;
> +@@ -374,7 +375,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *b=
uf, int *err, gchar **err_in
> +                 return FALSE;
> +             }
> +         }
> +-        if ( (! pkt_len) && (p =3D strstr(line, "Length"))) {
> ++        if ( (! have_pkt_len) && (p =3D strstr(line, "Length "))) {
> +             p +=3D sizeof("Length ");
> +             while (*p && ! g_ascii_isdigit(*p))
> +                 p++;
> +@@ -390,9 +391,15 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *=
buf, int *err, gchar **err_in
> +                 *err_info =3D g_strdup_printf("vms: Length field '%s' n=
ot valid", p);
> +                 return FALSE;
> +             }
> ++            have_pkt_len =3D TRUE;
> +             break;
> +         }
> +     } while (! isdumpline(line));
> ++    if (! have_pkt_len) {
> ++        *err =3D WTAP_ERR_BAD_FILE;
> ++        *err_info =3D g_strdup_printf("vms: Length field not found");
> ++        return FALSE;
> ++    }
> +     if (pkt_len > WTAP_MAX_PACKET_SIZE_STANDARD) {
> +         /*
> +          * Probably a corrupt capture file; return an error,
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.b=
b b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> index 693a16793..ff99a7508 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> @@ -16,6 +16,8 @@ SRC_URI +=3D " \
>      file://0003-bison-Remove-line-directives.patch \
>      file://0004-lemon-Remove-line-directives.patch \
>      file://CVE-2022-3190.patch \
> +    file://CVE-2023-2855.patch \
> +    file://CVE-2023-2856.patch \
>  "
>
>  UPSTREAM_CHECK_URI =3D "https://1.as.dl.wireshark.org/src"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103155): https://lists.openembedded.org/g/openembedde=
d-devel/message/103155
> Mute This Topic: https://lists.openembedded.org/mt/99379081/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

