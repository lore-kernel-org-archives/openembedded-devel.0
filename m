Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C889CCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 11:35:56 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.15781.1760960148109231515
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 04:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Na8idZpQ;
 spf=pass (domain: mvista.com, ip: 209.85.218.45, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b403bb7843eso782696366b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760960146; x=1761564946; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KOJzb4de57dtIcD+vbRj4F0Fl1L8ovULczGUUTtY50=;
        b=Na8idZpQ5wj/VoUCwHSq3Y1T3zpF+RTU7ub0q+eI4svjTsiQdx950szEglOs4Y91wW
         g2iebl/kt3AFxZdDcQ4sRWbV7VsqCNno1ueWa7OfQ/5A9/MQm73vlvak/BMhZYG87Tdo
         RfVhzNEE3VTVbVgpVUG+rEpe9zq6xgZ87CcvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760960146; x=1761564946;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KOJzb4de57dtIcD+vbRj4F0Fl1L8ovULczGUUTtY50=;
        b=OSXjli3VeXuIxKHIYrlePR88MueQyf7LHEpm3+bivf8VIYGZNA0xIVcAoNsmcfU39U
         a9TE9pIXQWrj4Rq0iY00sMUah7GIOZe27c5vvHLFFUN7efjjyVo9+MVd7WC/xMW7g9fv
         Tm9hDys5Mjl/YZoqYJxIgJp+47bcwgh3e0bhdFx+pp10ahHmwthD/j3rzdo8agBA0Alg
         ocInPjao9zK8I8YgFnpfOEBertD9qGuAijXUJera2fQx739utbQaKkLphCUfSrfkGzAe
         kU38iCyR9GAerwJOU8LtVkc3eDXZT5i8qDMbby8aKXAbCb5gXduMreTp+uY9GBV8efRi
         5VeQ==
X-Gm-Message-State: AOJu0YyvKretoPY9S7utWSR/3FchUpo/YrHAZ1JRhENMPE0BNAXBc8Gb
	r6P1sZNvy/CMHlvcxHCtm1xmxTSA0SjdWUD/cH8CqCOofUf7lvPNWVkk4HLsrQbggEW6p0LN4WO
	wbddXnpPMhKpIpLQoebeoxQg4DN6efRV5VKW/ZrmzB9/1x/l1yblW
X-Gm-Gg: ASbGncujDHK7uGVEFrB70Rc+OCeaVW7pjlu0V5NHCXMoC8IEMFuhsqwWM0xe3w+eqvj
	vwQhP06uylc7IwcBdyJUQ8/sXLy9OVxlvsIDuobHG10sW1Ojwg39OkiiRmHezHWIpGsUsZmY6hP
	csxnw21HND8LI4AudEwhQ45Ke9fh6u/LyDT/7OyQiooI5aorP6G01TBY5CPbiQCzZ78TXRnEQiU
	pZIoOr1u3zN3lJZZCKKm9vY8d2Hzz079tqbSOB+pwZnBaLL9Wa9y8zGd5ugnh4iN76YjMwTVtB/
	Weymevurk4YbeK8Wz4Zc45DwRSjl8Q==
X-Google-Smtp-Source: AGHT+IGArmvJTnI6WgTxb0T+35QfmPpkGm8i8H2XrLbOLfuBUj3WriA7R3GvnajXpMF2NCqCYp8+g5E9t1m8GfN5r8c=
X-Received: by 2002:a17:906:b2d2:b0:b64:aa4c:c54 with SMTP id
 a640c23a62f3a-b64aa4c0cadmr1062045266b.14.1760960145436; Mon, 20 Oct 2025
 04:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251020113015.1701620-1-vanusuri@mvista.com>
In-Reply-To: <20251020113015.1701620-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 20 Oct 2025 17:05:32 +0530
X-Gm-Features: AS18NWBbwG9Da9I1Yk7jcklf3uXGmjY4YFrxESKfr_-_67NAX0QcDjx98k3-OSI
Message-ID: <CANQUz19V=_4Q4KkLK+t3Z2jTuBsgNpRPK_HXLRrO57uEu5ZHtA@mail.gmail.com>
Subject: Re: [oe][meta-networking][patch] proftpd: Fix CVE-2023-48795
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eec2440641957b8d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 11:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120812

--000000000000eec2440641957b8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Please ignore this patch. This particular patch was intended for the
`scarthgap` branch, not `master`. I have already sent a separate patch for
`scarthgap`.

Thanks,
Vijay
On Mon, Oct 20, 2025 at 5:00=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:

> Upstream-Status: Backport from
> https://github.com/proftpd/proftpd/commit/bcec15efe6c53dac40420731013f1cd=
2fd54123b
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../proftpd/files/CVE-2023-48795.patch        | 751 ++++++++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |   1 +
>  2 files changed, 752 insertions(+)
>  create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
>
> diff --git
> a/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
> b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
> new file mode 100644
> index 0000000000..39def781fb
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
> @@ -0,0 +1,751 @@
> +From bcec15efe6c53dac40420731013f1cd2fd54123b Mon Sep 17 00:00:00 2001
> +From: TJ Saunders <tj@castaglia.org>
> +Date: Tue, 19 Dec 2023 18:55:58 -0800
> +Subject: [PATCH] Issue #1760: Implement the "strict KEX" mitigations for
> the
> + Terrapin SSH protocol attack (CVE-2023-48795).
> +
> +Upstream-Status: Backport [
> https://github.com/proftpd/proftpd/commit/bcec15efe6c53dac40420731013f1cd=
2fd54123b
> ]
> +CVE: CVE-2023-48795
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + contrib/mod_sftp/kex.c                        | 124 ++++++++--
> + contrib/mod_sftp/mod_sftp.c                   |   8 +-
> + contrib/mod_sftp/mod_sftp.h.in                |   1 +
> + contrib/mod_sftp/packet.c                     |  12 +
> + contrib/mod_sftp/packet.h                     |   9 +-
> + contrib/mod_sftp/tap.c                        |  26 ++-
> + contrib/mod_sftp/tap.h                        |   5 +-
> + doc/contrib/mod_sftp.html                     |  15 +-
> + tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm | 217 ++++++++++++++++++
> + 9 files changed, 380 insertions(+), 37 deletions(-)
> +
> +diff --git a/contrib/mod_sftp/kex.c b/contrib/mod_sftp/kex.c
> +index 754bd9e87..c1caa1c27 100644
> +--- a/contrib/mod_sftp/kex.c
> ++++ b/contrib/mod_sftp/kex.c
> +@@ -149,6 +149,13 @@ static struct sftp_kex *kex_first_kex =3D NULL;
> + static struct sftp_kex *kex_rekey_kex =3D NULL;
> + static int kex_sent_kexinit =3D FALSE;
> +
> ++/* Using strict kex?  Note that we maintain this value here, rather tha=
n
> ++ * in the sftp_kex struct, so that any "use strict KEX" flag set via th=
e
> ++ * first KEXINIT is used through any subsequent KEXINITs.
> ++ */
> ++static int use_strict_kex =3D FALSE;
> ++static int kex_done_first_kex =3D FALSE;
> ++
> + /* Diffie-Hellman group moduli */
> +
> + static const char *dh_group1_str =3D
> +@@ -1593,6 +1600,16 @@ static const char *get_kexinit_exchange_list(pool
> *p) {
> +     res =3D pstrcat(p, res, *res ? "," : "", pstrdup(p, "ext-info-s"),
> NULL);
> +   }
> +
> ++  if (!(sftp_opts & SFTP_OPT_NO_STRICT_KEX)) {
> ++    /* Indicate support for OpenSSH's custom "strict KEX" mode extensio=
n,
> ++     * but only if we have not done/completed our first KEX.
> ++     */
> ++    if (kex_done_first_kex =3D=3D FALSE) {
> ++      res =3D pstrcat(p, res, *res ? "," : "",
> ++        pstrdup(p, "kex-strict-s-v00@openssh.com"), NULL);
> ++    }
> ++  }
> ++
> +   return res;
> + }
> +
> +@@ -2174,6 +2191,21 @@ static int get_session_names(struct sftp_kex *kex=
,
> int *correct_guess) {
> +     pr_trace_msg(trace_channel, 20, "client %s EXT_INFO support",
> +       kex->use_ext_info ? "signaled" : "did not signal" );
> +
> ++    if (!(sftp_opts & SFTP_OPT_NO_STRICT_KEX)) {
> ++      /* Did the client indicate "strict kex" support (Issue 1760)?
> ++       *
> ++       * Note that we only check for this if it is our first KEXINIT.
> ++       * The "strict kex" extension is ignored in any subsequent
> KEXINITs, as
> ++       * for rekeys.
> ++       */
> ++      if (kex_done_first_kex =3D=3D FALSE) {
> ++        use_strict_kex =3D sftp_misc_namelist_contains(kex->pool,
> ++          client_list, "kex-strict-c-v00@openssh.com");
> ++        pr_trace_msg(trace_channel, 20, "client %s strict KEX support",
> ++          use_strict_kex ? "signaled" : "did not signal" );
> ++      }
> ++    }
> ++
> +   } else {
> +     (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> +       "no shared key exchange algorithm found (client sent '%s', server
> sent "
> +@@ -4406,7 +4438,6 @@ static int handle_kex_ecdh(struct ssh2_packet *pkt=
,
> struct sftp_kex *kex) {
> +   destroy_pool(pkt->pool);
> +   return 0;
> + }
> +-
> + #endif /* PR_USE_OPENSSL_ECC */
> +
> + static struct ssh2_packet *read_kex_packet(pool *p, struct sftp_kex *ke=
x,
> +@@ -4457,6 +4488,10 @@ static struct ssh2_packet *read_kex_packet(pool
> *p, struct sftp_kex *kex,
> +     /* Per RFC 4253, Section 11, DEBUG, DISCONNECT, IGNORE, and
> UNIMPLEMENTED
> +      * messages can occur at any time, even during KEX.  We have to be
> prepared
> +      * for this, and Do The Right Thing(tm).
> ++     *
> ++     * However, due to the Terrapin attack, if we are using a "strict
> KEX"
> ++     * mode, then only DISCONNECT messages can occur during KEX; DEBUG,
> ++     * IGNORE, and UNIMPLEMENTED messages will lead to disconnecting.
> +      */
> +
> +     mesg_type =3D sftp_ssh2_packet_get_mesg_type(pkt);
> +@@ -4485,35 +4520,43 @@ static struct ssh2_packet *read_kex_packet(pool
> *p, struct sftp_kex *kex,
> +     }
> +
> +     switch (mesg_type) {
> +-      case SFTP_SSH2_MSG_DEBUG:
> +-        sftp_ssh2_packet_handle_debug(pkt);
> +-        pr_response_set_pool(NULL);
> +-        pkt =3D NULL;
> +-        break;
> +-
> ++      /* DISCONNECT messages are always allowed. */
> +       case SFTP_SSH2_MSG_DISCONNECT:
> +         sftp_ssh2_packet_handle_disconnect(pkt);
> +         pr_response_set_pool(NULL);
> +         pkt =3D NULL;
> +         break;
> +
> ++      case SFTP_SSH2_MSG_DEBUG:
> ++        if (use_strict_kex =3D=3D FALSE) {
> ++          sftp_ssh2_packet_handle_debug(pkt);
> ++          pr_response_set_pool(NULL);
> ++          pkt =3D NULL;
> ++          break;
> ++        }
> ++
> +       case SFTP_SSH2_MSG_IGNORE:
> +-        sftp_ssh2_packet_handle_ignore(pkt);
> +-        pr_response_set_pool(NULL);
> +-        pkt =3D NULL;
> +-        break;
> ++        if (use_strict_kex =3D=3D FALSE) {
> ++          sftp_ssh2_packet_handle_ignore(pkt);
> ++          pr_response_set_pool(NULL);
> ++          pkt =3D NULL;
> ++          break;
> ++        }
> +
> +       case SFTP_SSH2_MSG_UNIMPLEMENTED:
> +-        sftp_ssh2_packet_handle_unimplemented(pkt);
> +-        pr_response_set_pool(NULL);
> +-        pkt =3D NULL;
> +-        break;
> ++        if (use_strict_kex =3D=3D FALSE) {
> ++          sftp_ssh2_packet_handle_unimplemented(pkt);
> ++          pr_response_set_pool(NULL);
> ++          pkt =3D NULL;
> ++          break;
> ++        }
> +
> +       default:
> +         /* For any other message type, it's considered a protocol error=
.
> */
> +         (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> +-          "received %s (%d) unexpectedly, disconnecting",
> +-          sftp_ssh2_packet_get_mesg_type_desc(mesg_type), mesg_type);
> ++          "received %s (%d) unexpectedly%s, disconnecting",
> ++          sftp_ssh2_packet_get_mesg_type_desc(mesg_type), mesg_type,
> ++          use_strict_kex ? " during strict KEX" : "");
> +         pr_response_set_pool(NULL);
> +         destroy_kex(kex);
> +         destroy_pool(pkt->pool);
> +@@ -4534,7 +4577,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +    * initial connect (kex_first_kex not null), or because we
> +    * are in a server-initiated rekeying (kex_rekey_kex not null).
> +    */
> +-  if (kex_first_kex) {
> ++  if (kex_first_kex !=3D NULL) {
> +     kex =3D kex_first_kex;
> +
> +     /* We need to assign the client/server versions, which this struct
> +@@ -4543,7 +4586,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +     kex->client_version =3D kex_client_version;
> +     kex->server_version =3D kex_server_version;
> +
> +-  } else if (kex_rekey_kex) {
> ++  } else if (kex_rekey_kex !=3D NULL) {
> +     kex =3D kex_rekey_kex;
> +
> +   } else {
> +@@ -4579,6 +4622,24 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +     return -1;
> +   }
> +
> ++  if (use_strict_kex =3D=3D TRUE &&
> ++      kex_done_first_kex =3D=3D FALSE) {
> ++    uint32_t client_seqno;
> ++
> ++    client_seqno =3D sftp_ssh2_packet_get_client_seqno();
> ++    if (client_seqno !=3D 1) {
> ++      /* Receiving any messages other than a KEXINIT as the first clien=
t
> ++       * message indicates the possibility of the Terrapin attack being
> ++       * conducted (Issue 1760).  Thus we disconnect the client in such
> ++       * cases.
> ++       */
> ++      (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> ++        "'strict KEX' violation, as KEXINIT was not the first message;
> disconnecting");
> ++      destroy_kex(kex);
> ++      SFTP_DISCONNECT_CONN(SFTP_SSH2_DISCONNECT_BY_APPLICATION, NULL);
> ++    }
> ++  }
> ++
> +   /* Once we have received the client KEXINIT message, we can compare
> what we
> +    * want to send against what we already received from the client.
> +    *
> +@@ -4637,7 +4698,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +
> +       destroy_pool(pkt->pool);
> +
> +-      if (!kex_sent_kexinit) {
> ++      if (kex_sent_kexinit =3D=3D FALSE) {
> +         pkt =3D sftp_ssh2_packet_create(kex_pool);
> +         res =3D write_kexinit(pkt, kex);
> +         if (res < 0) {
> +@@ -4660,7 +4721,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +       }
> +     }
> +
> +-    if (!kex_sent_kexinit) {
> ++    if (kex_sent_kexinit =3D=3D FALSE) {
> +       pkt =3D sftp_ssh2_packet_create(kex_pool);
> +       res =3D write_kexinit(pkt, kex);
> +       if (res < 0) {
> +@@ -4785,7 +4846,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +     NULL, 1, SFTP_SSH2_MSG_NEWKEYS);
> +
> +   /* If we didn't send our NEWKEYS message earlier, do it now. */
> +-  if (!sent_newkeys) {
> ++  if (sent_newkeys =3D=3D FALSE) {
> +     struct ssh2_packet *pkt2;
> +
> +     pr_trace_msg(trace_channel, 9, "sending NEWKEYS message to client")=
;
> +@@ -4809,6 +4870,11 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +     destroy_pool(pkt2->pool);
> +   }
> +
> ++  if (use_strict_kex =3D=3D TRUE) {
> ++    sftp_ssh2_packet_reset_client_seqno();
> ++    sftp_ssh2_packet_reset_server_seqno();
> ++  }
> ++
> +   /* Last but certainly not least, set up the keys for encryption and
> +    * authentication, based on H and K.
> +    */
> +@@ -4828,6 +4894,9 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +   destroy_pool(pkt->pool);
> +   cmd =3D NULL;
> +
> ++  /* We've now completed our KEX, possibly our first. */
> ++  kex_done_first_kex =3D TRUE;
> ++
> +   /* If extension negotiation has not been disabled, AND if we have not
> +    * received a service request, AND if the client sent "ext-info-c",
> THEN
> +    * send our EXT_INFO.  We do not want send this during rekeys.
> +@@ -4864,6 +4933,12 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> +     cmd =3D NULL;
> +   }
> +
> ++  /* Only start the TAP timer after we have completed our first KEX.
> ++   * Otherwise, we risk sending "illegal" packets prior to, or during,
> ++   * a "strict KEX" session (Issue 1760).
> ++   */
> ++  sftp_tap_start_policy();
> ++
> +   /* Reset this flag for the next time through. */
> +   kex_sent_kexinit =3D FALSE;
> +
> +@@ -4893,7 +4968,7 @@ int sftp_kex_free(void) {
> +     destroy_kex(rekey_kex);
> +   }
> +
> +-  if (kex_pool) {
> ++  if (kex_pool !=3D NULL) {
> +     destroy_pool(kex_pool);
> +     kex_pool =3D NULL;
> +   }
> +@@ -5065,7 +5140,7 @@ int sftp_kex_send_first_kexinit(void) {
> +   struct ssh2_packet *pkt;
> +   int res;
> +
> +-  if (!kex_pool) {
> ++  if (kex_pool =3D=3D NULL) {
> +     kex_pool =3D make_sub_pool(sftp_pool);
> +     pr_pool_tag(kex_pool, "Kex Pool");
> +   }
> +@@ -5100,4 +5175,3 @@ int sftp_kex_send_first_kexinit(void) {
> +   destroy_pool(pkt->pool);
> +   return 0;
> + }
> +-
> +diff --git a/contrib/mod_sftp/mod_sftp.c b/contrib/mod_sftp/mod_sftp.c
> +index b84b1a77b..2406ea611 100644
> +--- a/contrib/mod_sftp/mod_sftp.c
> ++++ b/contrib/mod_sftp/mod_sftp.c
> +@@ -1,6 +1,6 @@
> + /*
> +  * ProFTPD - mod_sftp
> +- * Copyright (c) 2008-2020 TJ Saunders
> ++ * Copyright (c) 2008-2023 TJ Saunders
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -1411,8 +1411,9 @@ MODRET set_sftpoptions(cmd_rec *cmd) {
> +   config_rec *c;
> +   unsigned long opts =3D 0UL;
> +
> +-  if (cmd->argc-1 =3D=3D 0)
> ++  if (cmd->argc-1 =3D=3D 0) {
> +     CONF_ERROR(cmd, "wrong number of parameters");
> ++  }
> +
> +   CHECK_CONF(cmd, CONF_ROOT|CONF_VIRTUAL|CONF_GLOBAL);
> +
> +@@ -1476,6 +1477,9 @@ MODRET set_sftpoptions(cmd_rec *cmd) {
> +     } else if (strcmp(cmd->argv[i], "NoExtensionNegotiation") =3D=3D 0)=
 {
> +       opts |=3D SFTP_OPT_NO_EXT_INFO;
> +
> ++    } else if (strcmp(cmd->argv[i], "NoStrictKex") =3D=3D 0) {
> ++      opts |=3D SFTP_OPT_NO_STRICT_KEX;
> ++
> +     } else {
> +       CONF_ERROR(cmd, pstrcat(cmd->tmp_pool, ": unknown SFTPOption '",
> +         cmd->argv[i], "'", NULL));
> +diff --git a/contrib/mod_sftp/mod_sftp.h.in b/contrib/mod_sftp/
> mod_sftp.h.in
> +index 065981c31..adcf71276 100644
> +--- a/contrib/mod_sftp/mod_sftp.h.in
> ++++ b/contrib/mod_sftp/mod_sftp.h.in
> +@@ -131,6 +131,7 @@
> + #define SFTP_OPT_IGNORE_SFTP_SET_XATTRS               0x04000
> + #define SFTP_OPT_INCLUDE_SFTP_TIMES           0x08000
> + #define SFTP_OPT_NO_EXT_INFO                  0x10000
> ++#define SFTP_OPT_NO_STRICT_KEX                        0x040000
> +
> + /* mod_sftp service flags */
> + #define SFTP_SERVICE_FL_SFTP          0x0001
> +diff --git a/contrib/mod_sftp/packet.c b/contrib/mod_sftp/packet.c
> +index b0067ea80..d8c97e92b 100644
> +--- a/contrib/mod_sftp/packet.c
> ++++ b/contrib/mod_sftp/packet.c
> +@@ -1742,6 +1742,18 @@ int sftp_ssh2_packet_rekey_set_size(off_t size) {
> +   return 0;
> + }
> +
> ++uint32_t sftp_ssh2_packet_get_client_seqno(void) {
> ++  return packet_client_seqno;
> ++}
> ++
> ++void sftp_ssh2_packet_reset_client_seqno(void) {
> ++  packet_client_seqno =3D 0;
> ++}
> ++
> ++void sftp_ssh2_packet_reset_server_seqno(void) {
> ++  packet_server_seqno =3D 0;
> ++}
> ++
> + int sftp_ssh2_packet_send_version(void) {
> +   if (!sent_version_id) {
> +     int res;
> +diff --git a/contrib/mod_sftp/packet.h b/contrib/mod_sftp/packet.h
> +index a424e9b25..fe538cbd7 100644
> +--- a/contrib/mod_sftp/packet.h
> ++++ b/contrib/mod_sftp/packet.h
> +@@ -1,6 +1,6 @@
> + /*
> +  * ProFTPD - mod_sftp packet IO
> +- * Copyright (c) 2008-2020 TJ Saunders
> ++ * Copyright (c) 2008-2023 TJ Saunders
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -107,6 +107,13 @@ int sftp_ssh2_packet_rekey_reset(void);
> + int sftp_ssh2_packet_rekey_set_seqno(uint32_t);
> + int sftp_ssh2_packet_rekey_set_size(off_t);
> +
> ++/* These are used for implementing the "strict KEX" mitigations of the
> Terrapin
> ++ * attack (Issue 1760).
> ++ */
> ++uint32_t sftp_ssh2_packet_get_client_seqno(void);
> ++void sftp_ssh2_packet_reset_client_seqno(void);
> ++void sftp_ssh2_packet_reset_server_seqno(void);
> ++
> + int sftp_ssh2_packet_send_version(void);
> + int sftp_ssh2_packet_set_poll_timeout(int);
> + int sftp_ssh2_packet_set_version(const char *);
> +diff --git a/contrib/mod_sftp/tap.c b/contrib/mod_sftp/tap.c
> +index 95f388e43..7eaf959e2 100644
> +--- a/contrib/mod_sftp/tap.c
> ++++ b/contrib/mod_sftp/tap.c
> +@@ -1,6 +1,6 @@
> + /*
> +  * ProFTPD - mod_sftp traffic analysis protection
> +- * Copyright (c) 2008-2016 TJ Saunders
> ++ * Copyright (c) 2008-2023 TJ Saunders
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -149,7 +149,6 @@ static void set_policy_chance(struct sftp_tap_policy
> *policy) {
> + }
> +
> + static void set_policy_timer(struct sftp_tap_policy *policy) {
> +-
> +   /* Start a timer which checks the last times we received and sent
> packets.
> +    * From there, we may want to inject a TAP message, depending on the
> +    * policy.
> +@@ -177,6 +176,16 @@ int sftp_tap_send_packet(void) {
> +   int rnd;
> +   unsigned int chance;
> +
> ++  /* Due to chances of violating client-side "strict KEX" Terrapin
> ++   * mitigations, we will not send packets if we are in the middle of a
> KEX.
> ++   */
> ++  if (!(sftp_sess_state & SFTP_SESS_STATE_HAVE_KEX) ||
> ++      (sftp_sess_state & SFTP_SESS_STATE_REKEYING)) {
> ++    pr_trace_msg(trace_channel, 11,
> ++      "unwilling to send TAP packet during KEX");
> ++    return 0;
> ++  }
> ++
> +   if (!sftp_interop_supports_feature(SFTP_SSH2_FEAT_IGNORE_MSG)) {
> +     pr_trace_msg(trace_channel, 3,
> +       "unable to send TAP packet: IGNORE not supported by client");
> +@@ -205,7 +214,7 @@ int sftp_tap_send_packet(void) {
> +     struct ssh2_packet *pkt;
> +     unsigned int max_datalen =3D 8192;
> +
> +-    if (curr_policy.max_datalen) {
> ++    if (curr_policy.max_datalen > 0) {
> +       max_datalen =3D curr_policy.max_datalen;
> +     }
> +
> +@@ -246,15 +255,15 @@ int sftp_tap_send_packet(void) {
> + int sftp_tap_set_policy(const char *policy) {
> +   register unsigned int i;
> +
> +-  if (tap_pool) {
> ++  if (tap_pool !=3D NULL) {
> +
> +     /* Special case: IFF the existing policy is 'none' AND the given
> +      * policy is 'rogaway', just return.  The 'none' policy must have
> been
> +      * explicitly configured, and it should override the automatic use =
of
> +      * the 'rogaway' policy.
> +      */
> +-    if (strncmp(curr_policy.policy, "none", 5) =3D=3D 0 &&
> +-        strncasecmp(policy, "rogaway", 8) =3D=3D 0) {
> ++    if (strcasecmp(curr_policy.policy, "none") =3D=3D 0 &&
> ++        strcasecmp(policy, "rogaway") =3D=3D 0) {
> +       (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> +         "'none' traffic policy explicitly configured, ignoring '%s'
> policy",
> +         policy);
> +@@ -278,7 +287,6 @@ int sftp_tap_set_policy(const char *policy) {
> +     if (strcasecmp(tap_policies[i].policy, policy) =3D=3D 0) {
> +       copy_policy(&curr_policy, &(tap_policies[i]));
> +       set_policy_chance(&curr_policy);
> +-      set_policy_timer(&curr_policy);
> +       return 0;
> +     }
> +   }
> +@@ -286,3 +294,7 @@ int sftp_tap_set_policy(const char *policy) {
> +   errno =3D ENOENT;
> +   return -1;
> + }
> ++
> ++void sftp_tap_start_policy(void) {
> ++  set_policy_timer(&curr_policy);
> ++}
> +diff --git a/contrib/mod_sftp/tap.h b/contrib/mod_sftp/tap.h
> +index 4a4c065d2..312223595 100644
> +--- a/contrib/mod_sftp/tap.h
> ++++ b/contrib/mod_sftp/tap.h
> +@@ -1,6 +1,6 @@
> + /*
> +  * ProFTPD - mod_sftp traffic analysis protection
> +- * Copyright (c) 2008-2016 TJ Saunders
> ++ * Copyright (c) 2008-2013 TJ Saunders
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -63,4 +63,7 @@ int sftp_tap_send_packet(void);
> +  */
> + int sftp_tap_set_policy(const char *);
> +
> ++/* Sets the configured TAP policy in motion. */
> ++void sftp_tap_start_policy(void);
> ++
> + #endif /* MOD_SFTP_TAP_H */
> +diff --git a/doc/contrib/mod_sftp.html b/doc/contrib/mod_sftp.html
> +index 60c3436fa..cfc639d05 100644
> +--- a/doc/contrib/mod_sftp.html
> ++++ b/doc/contrib/mod_sftp.html
> +@@ -1186,6 +1186,19 @@ The currently implemented options are:
> +     <code>proftpd-1.3.7rc4</code>.
> +   </li>
> +
> ++  <p>
> ++  <li><code>NoStrictKex</code><br>
> ++    <p>
> ++    By default, <code>mod_sftp</code> will honor/support the OpenSSH
> ++    "strict KEX" mode extension, "kex-strict-c-v00@openssh.com" and
> ++    "kex-strict-s-v00@openssh.com".  Use this option to disable support
> for
> ++    these custom OpenSSH extensions.
> ++
> ++    <p>
> ++    <b>Note</b> that this option first appeared in
> ++    <code>proftpd-1.3.9rc1</code>.
> ++  </li>
> ++
> +   <p>
> +   <li><code>OldProtocolCompat</code><br>
> +     <p>
> +@@ -2642,7 +2655,7 @@ deal with this issue, then, you can hopefully
> upgrade to ProFTPD 1.3.6 or later,
> + <p>
> + <hr>
> + <font size=3D2><b><i>
> +-&copy; Copyright 2008-2021 TJ Saunders<br>
> ++&copy; Copyright 2008-2023 TJ Saunders<br>
> +  All Rights Reserved<br>
> + </i></b></font>
> + <hr>
> +diff --git a/tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm
> b/tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm
> +index b4bdf516b..8c2be5465 100644
> +--- a/tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm
> ++++ b/tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm
> +@@ -87,6 +87,11 @@ my $TESTS =3D {
> +     test_class =3D> [qw(forking ssh2)],
> +   },
> +
> ++  ssh2_ext_kex_strict_terrapin_issue1760 =3D> {
> ++    order =3D> ++$order,
> ++    test_class =3D> [qw(bug forking ssh2)],
> ++  },
> ++
> +   ssh2_hostkey_rsa =3D> {
> +     order =3D> ++$order,
> +     test_class =3D> [qw(forking ssh2)],
> +@@ -3885,6 +3890,218 @@ EOC
> +   unlink($log_file);
> + }
> +
> ++sub ssh2_ext_kex_strict_terrapin_issue1760 {
> ++  my $self =3D shift;
> ++  my $tmpdir =3D $self->{tmpdir};
> ++  my $setup =3D test_setup($tmpdir, 'sftp');
> ++
> ++  my $rsa_host_key =3D
> File::Spec->rel2abs('t/etc/modules/mod_sftp/ssh_host_rsa_key');
> ++  my $dsa_host_key =3D
> File::Spec->rel2abs('t/etc/modules/mod_sftp/ssh_host_dsa_key');
> ++
> ++  my $rsa_priv_key =3D
> File::Spec->rel2abs('t/etc/modules/mod_sftp/test_rsa_key');
> ++  my $rsa_pub_key =3D
> File::Spec->rel2abs('t/etc/modules/mod_sftp/test_rsa_key.pub');
> ++  my $rsa_rfc4716_key =3D
> File::Spec->rel2abs('t/etc/modules/mod_sftp/authorized_rsa_keys');
> ++
> ++  my $authorized_keys =3D File::Spec->rel2abs("$tmpdir/.authorized_keys=
");
> ++  unless (copy($rsa_rfc4716_key, $authorized_keys)) {
> ++    die("Can't copy $rsa_rfc4716_key to $authorized_keys: $!");
> ++  }
> ++
> ++  my $ssh_config =3D File::Spec->rel2abs("$tmpdir/ssh.conf");
> ++  if (open(my $fh, "> $ssh_config")) {
> ++    print $fh <<EOC;
> ++HostKeyAlgorithms rsa-sha2-256
> ++IdentityAgent none
> ++PubkeyAcceptedKeyTypes rsa-sha2-256
> ++EOC
> ++    unless (close($fh)) {
> ++      die("Can't write $ssh_config: $!");
> ++    }
> ++
> ++  } else {
> ++    die("Can't open $ssh_config: $!");
> ++  }
> ++
> ++  my $batch_file =3D File::Spec->rel2abs("$tmpdir/sftp-batch.conf");
> ++  if (open(my $fh, "> $batch_file")) {
> ++    print $fh "ls -l\n";
> ++
> ++    unless (close($fh)) {
> ++      die("Can't write $batch_file: $!");
> ++    }
> ++
> ++  } else {
> ++    die("Can't open $batch_file: $!");
> ++  }
> ++
> ++  my $config =3D {
> ++    PidFile =3D> $setup->{pid_file},
> ++    ScoreboardFile =3D> $setup->{scoreboard_file},
> ++    SystemLog =3D> $setup->{log_file},
> ++    TraceLog =3D> $setup->{log_file},
> ++    Trace =3D> 'ssh2:30 sftp:20 scp:20',
> ++
> ++    AuthUserFile =3D> $setup->{auth_user_file},
> ++    AuthGroupFile =3D> $setup->{auth_group_file},
> ++    AuthOrder =3D> 'mod_auth_file.c',
> ++
> ++    IfModules =3D> {
> ++      'mod_delay.c' =3D> {
> ++        DelayEngine =3D> 'off',
> ++      },
> ++
> ++      'mod_sftp.c' =3D> [
> ++        "SFTPEngine on",
> ++        "SFTPLog $setup->{log_file}",
> ++
> ++        "SFTPHostKey $rsa_host_key",
> ++        "SFTPHostKey $dsa_host_key",
> ++
> ++        "SFTPAuthorizedUserKeys file:~/.authorized_keys",
> ++      ],
> ++    },
> ++  };
> ++
> ++  my ($port, $config_user, $config_group) =3D
> config_write($setup->{config_file},
> ++    $config);
> ++
> ++  # Open pipes, for use between the parent and child processes.
> Specifically,
> ++  # the child will indicate when it's done with its test by writing a
> message
> ++  # to the parent.
> ++  my ($rfh, $wfh);
> ++  unless (pipe($rfh, $wfh)) {
> ++    die("Can't open pipe: $!");
> ++  }
> ++
> ++  require Net::SSH2;
> ++
> ++  my $ex;
> ++
> ++  # Fork child
> ++  $self->handle_sigchld();
> ++  defined(my $pid =3D fork()) or die("Can't fork: $!");
> ++  if ($pid) {
> ++    eval {
> ++      # We use OpenSSH-9.6p1 to test our "strict KEX" Terrapin
> mitigations.
> ++      my $sftp =3D '/Users/tj/local/openssh-9.6p1/bin/sftp';
> ++
> ++      my @cmd =3D (
> ++        $sftp,
> ++        '-F',
> ++        $ssh_config,
> ++        '-oBatchMode=3Dyes',
> ++        '-oCheckHostIP=3Dno',
> ++        '-oCompression=3Dyes',
> ++        "-oPort=3D$port",
> ++        "-oIdentityFile=3D$rsa_priv_key",
> ++        '-oPubkeyAuthentication=3Dyes',
> ++        '-oStrictHostKeyChecking=3Dno',
> ++        '-oUserKnownHostsFile=3D/dev/null',
> ++        '-vvv',
> ++        '-b',
> ++        $batch_file,
> ++        "$setup->{user}\@127.0.0.1",
> ++      );
> ++
> ++      my $sftp_rh =3D IO::Handle->new();
> ++      my $sftp_wh =3D IO::Handle->new();
> ++      my $sftp_eh =3D IO::Handle->new();
> ++
> ++      $sftp_wh->autoflush(1);
> ++
> ++      sleep(1);
> ++
> ++      local $SIG{CHLD} =3D 'DEFAULT';
> ++
> ++      # Make sure that the perms on the priv key are what OpenSSH wants
> ++      unless (chmod(0400, $rsa_priv_key)) {
> ++        die("Can't set perms on $rsa_priv_key to 0400: $!");
> ++      }
> ++
> ++      if ($ENV{TEST_VERBOSE}) {
> ++        print STDERR "Executing: ", join(' ', @cmd), "\n";
> ++      }
> ++
> ++      my $sftp_pid =3D open3($sftp_wh, $sftp_rh, $sftp_eh, @cmd);
> ++      waitpid($sftp_pid, 0);
> ++      my $exit_status =3D $?;
> ++
> ++      # Restore the perms on the priv key
> ++      unless (chmod(0644, $rsa_priv_key)) {
> ++        die("Can't set perms on $rsa_priv_key to 0644: $!");
> ++      }
> ++
> ++      my ($res, $errstr);
> ++      if ($exit_status >> 8 =3D=3D 0) {
> ++        $errstr =3D join('', <$sftp_eh>);
> ++        $res =3D 0;
> ++
> ++      } else {
> ++        $errstr =3D join('', <$sftp_eh>);
> ++        if ($ENV{TEST_VERBOSE}) {
> ++          print STDERR "Stderr: $errstr\n";
> ++        }
> ++
> ++        $res =3D 1;
> ++      }
> ++
> ++      unless ($res =3D=3D 0) {
> ++        die("Can't list files on server: $errstr");
> ++      }
> ++    };
> ++    if ($@) {
> ++      $ex =3D $@;
> ++    }
> ++
> ++    $wfh->print("done\n");
> ++    $wfh->flush();
> ++
> ++  } else {
> ++    eval { server_wait($setup->{config_file}, $rfh) };
> ++    if ($@) {
> ++      warn($@);
> ++      exit 1;
> ++    }
> ++
> ++    exit 0;
> ++  }
> ++
> ++  # Stop server
> ++  server_stop($setup->{pid_file});
> ++  $self->assert_child_ok($pid);
> ++
> ++  eval {
> ++    if (open(my $fh, "< $setup->{log_file}")) {
> ++      my $ok =3D 0;
> ++
> ++      while (my $line =3D <$fh>) {
> ++        chomp($line);
> ++
> ++        if ($ENV{TEST_VERBOSE}) {
> ++          print STDERR "# $line\n";
> ++        }
> ++
> ++        if ($line =3D~ /client signaled strict KEX support/) {
> ++          $ok =3D 1;
> ++          last;
> ++        }
> ++      }
> ++
> ++      close($fh);
> ++
> ++      $self->assert($ok, test_msg("Did not see expected 'strict KEX'
> TraceLog message"));
> ++
> ++    } else {
> ++      die("Can't read $setup->{log_file}: $!");
> ++    }
> ++  };
> ++  if ($@) {
> ++    $ex =3D $@;
> ++  }
> ++
> ++  test_cleanup($setup->{log_file}, $ex);
> ++}
> ++
> + sub ssh2_hostkey_rsa {
> +   my $self =3D shift;
> +   my $tmpdir =3D $self->{tmpdir};
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> index ec38fb54e1..036c01482a 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://
> github.com/proftpd/proftpd.git;branch=3D${BRANCH};protocol=3Dhttps
> <http://github.com/proftpd/proftpd.git;branch=3D$%7BBRANCH%7D;protocol=3D=
https>
>             file://proftpd.service \
>             file://CVE-2023-51713.patch \
>             file://CVE-2024-57392.patch \
> +           file://CVE-2023-48795.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.43.0
>
>

--000000000000eec2440641957b8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,<br><br></div><div>Please ignore this patch. =
This particular patch was intended for the `scarthgap` branch, not `master`=
. I have already sent a separate patch for `scarthgap`.</div><div><br></div=
><div>Thanks,</div><div>Vijay</div><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 20, 2025 at 5:00=
=E2=80=AFPM Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com">vanusu=
ri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Upstream-Status: Backport from <a href=3D"https://github.com/p=
roftpd/proftpd/commit/bcec15efe6c53dac40420731013f1cd2fd54123b" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/proftpd/proftpd/commit/bcec15e=
fe6c53dac40420731013f1cd2fd54123b</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../proftpd/files/CVE-2023-48795.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7=
51 ++++++++++++++++++<br>
=C2=A0.../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.bb" rel=
=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A02 files changed, 752 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-=
2023-48795.patch<br>
<br>
diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.p=
atch b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch<b=
r>
new file mode 100644<br>
index 0000000000..39def781fb<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch<br=
>
@@ -0,0 +1,751 @@<br>
+From bcec15efe6c53dac40420731013f1cd2fd54123b Mon Sep 17 00:00:00 2001<br>
+From: TJ Saunders &lt;<a href=3D"mailto:tj@castaglia.org" target=3D"_blank=
">tj@castaglia.org</a>&gt;<br>
+Date: Tue, 19 Dec 2023 18:55:58 -0800<br>
+Subject: [PATCH] Issue #1760: Implement the &quot;strict KEX&quot; mitigat=
ions for the<br>
+ Terrapin SSH protocol attack (CVE-2023-48795).<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/proftpd/proftpd/c=
ommit/bcec15efe6c53dac40420731013f1cd2fd54123b" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/proftpd/proftpd/commit/bcec15efe6c53dac40420=
731013f1cd2fd54123b</a>]<br>
+CVE: CVE-2023-48795<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ contrib/mod_sftp/kex.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 124 ++++++++--<br>
+ contrib/mod_sftp/mod_sftp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
+ contrib/mod_sftp/<a href=3D"http://mod_sftp.h.in" rel=3D"noreferrer" targ=
et=3D"_blank">mod_sftp.h.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
+ contrib/mod_sftp/packet.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +<br>
+ contrib/mod_sftp/packet.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
+ contrib/mod_sftp/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 ++-<br>
+ contrib/mod_sftp/tap.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
+ doc/contrib/mod_sftp.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-<br>
+ tests/t/lib/ProFTPD/Tests/Modules/<a href=3D"http://mod_sftp.pm" rel=3D"n=
oreferrer" target=3D"_blank">mod_sftp.pm</a> | 217 ++++++++++++++++++<br>
+ 9 files changed, 380 insertions(+), 37 deletions(-)<br>
+<br>
+diff --git a/contrib/mod_sftp/kex.c b/contrib/mod_sftp/kex.c<br>
+index 754bd9e87..c1caa1c27 100644<br>
+--- a/contrib/mod_sftp/kex.c<br>
++++ b/contrib/mod_sftp/kex.c<br>
+@@ -149,6 +149,13 @@ static struct sftp_kex *kex_first_kex =3D NULL;<br>
+ static struct sftp_kex *kex_rekey_kex =3D NULL;<br>
+ static int kex_sent_kexinit =3D FALSE;<br>
+ <br>
++/* Using strict kex?=C2=A0 Note that we maintain this value here, rather =
than<br>
++ * in the sftp_kex struct, so that any &quot;use strict KEX&quot; flag se=
t via the<br>
++ * first KEXINIT is used through any subsequent KEXINITs.<br>
++ */<br>
++static int use_strict_kex =3D FALSE;<br>
++static int kex_done_first_kex =3D FALSE;<br>
++<br>
+ /* Diffie-Hellman group moduli */<br>
+ <br>
+ static const char *dh_group1_str =3D<br>
+@@ -1593,6 +1600,16 @@ static const char *get_kexinit_exchange_list(pool *=
p) {<br>
+=C2=A0 =C2=A0 =C2=A0res =3D pstrcat(p, res, *res ? &quot;,&quot; : &quot;&=
quot;, pstrdup(p, &quot;ext-info-s&quot;), NULL);<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 if (!(sftp_opts &amp; SFTP_OPT_NO_STRICT_KEX)) {<br>
++=C2=A0 =C2=A0 /* Indicate support for OpenSSH&#39;s custom &quot;strict K=
EX&quot; mode extension,<br>
++=C2=A0 =C2=A0 =C2=A0* but only if we have not done/completed our first KE=
X.<br>
++=C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 if (kex_done_first_kex =3D=3D FALSE) {<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D pstrcat(p, res, *res ? &quot;,&quot; : &quot=
;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pstrdup(p, &quot;<a href=3D"mailto:kex-strict=
-s-v00@openssh.com" target=3D"_blank">kex-strict-s-v00@openssh.com</a>&quot=
;), NULL);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0return res;<br>
+ }<br>
+ <br>
+@@ -2174,6 +2191,21 @@ static int get_session_names(struct sftp_kex *kex, =
int *correct_guess) {<br>
+=C2=A0 =C2=A0 =C2=A0pr_trace_msg(trace_channel, 20, &quot;client %s EXT_IN=
FO support&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kex-&gt;use_ext_info ? &quot;signaled&quot; : &=
quot;did not signal&quot; );<br>
+ <br>
++=C2=A0 =C2=A0 if (!(sftp_opts &amp; SFTP_OPT_NO_STRICT_KEX)) {<br>
++=C2=A0 =C2=A0 =C2=A0 /* Did the client indicate &quot;strict kex&quot; su=
pport (Issue 1760)?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that we only check for this if it is ou=
r first KEXINIT.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* The &quot;strict kex&quot; extension is igno=
red in any subsequent KEXINITs, as<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* for rekeys.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 if (kex_done_first_kex =3D=3D FALSE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 use_strict_kex =3D sftp_misc_namelist_contain=
s(kex-&gt;pool,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_list, &quot;<a href=3D"mailto:k=
ex-strict-c-v00@openssh.com" target=3D"_blank">kex-strict-c-v00@openssh.com=
</a>&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_trace_msg(trace_channel, 20, &quot;client =
%s strict KEX support&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_strict_kex ? &quot;signaled&quot; =
: &quot;did not signal&quot; );<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0(void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;no shared key exchange algorithm found (c=
lient sent &#39;%s&#39;, server sent &quot;<br>
+@@ -4406,7 +4438,6 @@ static int handle_kex_ecdh(struct ssh2_packet *pkt, =
struct sftp_kex *kex) {<br>
+=C2=A0 =C2=A0destroy_pool(pkt-&gt;pool);<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+-<br>
+ #endif /* PR_USE_OPENSSL_ECC */<br>
+ <br>
+ static struct ssh2_packet *read_kex_packet(pool *p, struct sftp_kex *kex,=
<br>
+@@ -4457,6 +4488,10 @@ static struct ssh2_packet *read_kex_packet(pool *p,=
 struct sftp_kex *kex,<br>
+=C2=A0 =C2=A0 =C2=A0/* Per RFC 4253, Section 11, DEBUG, DISCONNECT, IGNORE=
, and UNIMPLEMENTED<br>
+=C2=A0 =C2=A0 =C2=A0 * messages can occur at any time, even during KEX.=C2=
=A0 We have to be prepared<br>
+=C2=A0 =C2=A0 =C2=A0 * for this, and Do The Right Thing(tm).<br>
++=C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0* However, due to the Terrapin attack, if we are usin=
g a &quot;strict KEX&quot;<br>
++=C2=A0 =C2=A0 =C2=A0* mode, then only DISCONNECT messages can occur durin=
g KEX; DEBUG,<br>
++=C2=A0 =C2=A0 =C2=A0* IGNORE, and UNIMPLEMENTED messages will lead to dis=
connecting.<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0mesg_type =3D sftp_ssh2_packet_get_mesg_type(pkt);<br>
+@@ -4485,35 +4520,43 @@ static struct ssh2_packet *read_kex_packet(pool *p=
, struct sftp_kex *kex,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0switch (mesg_type) {<br>
+-=C2=A0 =C2=A0 =C2=A0 case SFTP_SSH2_MSG_DEBUG:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_handle_debug(pkt);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_response_set_pool(NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkt =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+-<br>
++=C2=A0 =C2=A0 =C2=A0 /* DISCONNECT messages are always allowed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case SFTP_SSH2_MSG_DISCONNECT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sftp_ssh2_packet_handle_disconnect(pkt);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_response_set_pool(NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkt =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 case SFTP_SSH2_MSG_DEBUG:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (use_strict_kex =3D=3D FALSE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_handle_debug(pkt);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_response_set_pool(NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkt =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case SFTP_SSH2_MSG_IGNORE:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_handle_ignore(pkt);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_response_set_pool(NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkt =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (use_strict_kex =3D=3D FALSE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_handle_ignore(pkt);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_response_set_pool(NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkt =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case SFTP_SSH2_MSG_UNIMPLEMENTED:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_handle_unimplemented(pkt);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_response_set_pool(NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkt =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (use_strict_kex =3D=3D FALSE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_handle_unimplemented(=
pkt);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_response_set_pool(NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkt =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* For any other message type, it&#39;s =
considered a protocol error. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) pr_log_writefile(sftp_logfd, MOD_=
SFTP_VERSION,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;received %s (%d) unexpectedly, d=
isconnecting&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_get_mesg_type_desc(me=
sg_type), mesg_type);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;received %s (%d) unexpectedly%s,=
 disconnecting&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sftp_ssh2_packet_get_mesg_type_desc(me=
sg_type), mesg_type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_strict_kex ? &quot; during strict =
KEX&quot; : &quot;&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_response_set_pool(NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destroy_kex(kex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destroy_pool(pkt-&gt;pool);<br>
+@@ -4534,7 +4577,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0 * initial connect (kex_first_kex not null), or because we<br=
>
+=C2=A0 =C2=A0 * are in a server-initiated rekeying (kex_rekey_kex not null=
).<br>
+=C2=A0 =C2=A0 */<br>
+-=C2=A0 if (kex_first_kex) {<br>
++=C2=A0 if (kex_first_kex !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0kex =3D kex_first_kex;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* We need to assign the client/server versions, which=
 this struct<br>
+@@ -4543,7 +4586,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0 =C2=A0kex-&gt;client_version =3D kex_client_version;<br>
+=C2=A0 =C2=A0 =C2=A0kex-&gt;server_version =3D kex_server_version;<br>
+ <br>
+-=C2=A0 } else if (kex_rekey_kex) {<br>
++=C2=A0 } else if (kex_rekey_kex !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0kex =3D kex_rekey_kex;<br>
+ <br>
+=C2=A0 =C2=A0} else {<br>
+@@ -4579,6 +4622,24 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 if (use_strict_kex =3D=3D TRUE &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 kex_done_first_kex =3D=3D FALSE) {<br>
++=C2=A0 =C2=A0 uint32_t client_seqno;<br>
++<br>
++=C2=A0 =C2=A0 client_seqno =3D sftp_ssh2_packet_get_client_seqno();<br>
++=C2=A0 =C2=A0 if (client_seqno !=3D 1) {<br>
++=C2=A0 =C2=A0 =C2=A0 /* Receiving any messages other than a KEXINIT as th=
e first client<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* message indicates the possibility of the Ter=
rapin attack being<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* conducted (Issue 1760).=C2=A0 Thus we discon=
nect the client in such<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* cases.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;strict KEX&#39; violation, as KEXI=
NIT was not the first message; disconnecting&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 destroy_kex(kex);<br>
++=C2=A0 =C2=A0 =C2=A0 SFTP_DISCONNECT_CONN(SFTP_SSH2_DISCONNECT_BY_APPLICA=
TION, NULL);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0/* Once we have received the client KEXINIT message, we can c=
ompare what we<br>
+=C2=A0 =C2=A0 * want to send against what we already received from the cli=
ent.<br>
+=C2=A0 =C2=A0 *<br>
+@@ -4637,7 +4698,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0destroy_pool(pkt-&gt;pool);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if (!kex_sent_kexinit) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (kex_sent_kexinit =3D=3D FALSE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkt =3D sftp_ssh2_packet_create(kex_pool=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D write_kexinit(pkt, kex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res &lt; 0) {<br>
+@@ -4660,7 +4721,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 if (!kex_sent_kexinit) {<br>
++=C2=A0 =C2=A0 if (kex_sent_kexinit =3D=3D FALSE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pkt =3D sftp_ssh2_packet_create(kex_pool);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D write_kexinit(pkt, kex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (res &lt; 0) {<br>
+@@ -4785,7 +4846,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0 =C2=A0NULL, 1, SFTP_SSH2_MSG_NEWKEYS);<br>
+ <br>
+=C2=A0 =C2=A0/* If we didn&#39;t send our NEWKEYS message earlier, do it n=
ow. */<br>
+-=C2=A0 if (!sent_newkeys) {<br>
++=C2=A0 if (sent_newkeys =3D=3D FALSE) {<br>
+=C2=A0 =C2=A0 =C2=A0struct ssh2_packet *pkt2;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0pr_trace_msg(trace_channel, 9, &quot;sending NEWKEYS m=
essage to client&quot;);<br>
+@@ -4809,6 +4870,11 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0 =C2=A0destroy_pool(pkt2-&gt;pool);<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 if (use_strict_kex =3D=3D TRUE) {<br>
++=C2=A0 =C2=A0 sftp_ssh2_packet_reset_client_seqno();<br>
++=C2=A0 =C2=A0 sftp_ssh2_packet_reset_server_seqno();<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0/* Last but certainly not least, set up the keys for encrypti=
on and<br>
+=C2=A0 =C2=A0 * authentication, based on H and K.<br>
+=C2=A0 =C2=A0 */<br>
+@@ -4828,6 +4894,9 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0destroy_pool(pkt-&gt;pool);<br>
+=C2=A0 =C2=A0cmd =3D NULL;<br>
+ <br>
++=C2=A0 /* We&#39;ve now completed our KEX, possibly our first. */<br>
++=C2=A0 kex_done_first_kex =3D TRUE;<br>
++<br>
+=C2=A0 =C2=A0/* If extension negotiation has not been disabled, AND if we =
have not<br>
+=C2=A0 =C2=A0 * received a service request, AND if the client sent &quot;e=
xt-info-c&quot;, THEN<br>
+=C2=A0 =C2=A0 * send our EXT_INFO.=C2=A0 We do not want send this during r=
ekeys.<br>
+@@ -4864,6 +4933,12 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {<br>
+=C2=A0 =C2=A0 =C2=A0cmd =3D NULL;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 /* Only start the TAP timer after we have completed our first KEX.=
<br>
++=C2=A0 =C2=A0* Otherwise, we risk sending &quot;illegal&quot; packets pri=
or to, or during,<br>
++=C2=A0 =C2=A0* a &quot;strict KEX&quot; session (Issue 1760).<br>
++=C2=A0 =C2=A0*/<br>
++=C2=A0 sftp_tap_start_policy();<br>
++<br>
+=C2=A0 =C2=A0/* Reset this flag for the next time through. */<br>
+=C2=A0 =C2=A0kex_sent_kexinit =3D FALSE;<br>
+ <br>
+@@ -4893,7 +4968,7 @@ int sftp_kex_free(void) {<br>
+=C2=A0 =C2=A0 =C2=A0destroy_kex(rekey_kex);<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 if (kex_pool) {<br>
++=C2=A0 if (kex_pool !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0destroy_pool(kex_pool);<br>
+=C2=A0 =C2=A0 =C2=A0kex_pool =3D NULL;<br>
+=C2=A0 =C2=A0}<br>
+@@ -5065,7 +5140,7 @@ int sftp_kex_send_first_kexinit(void) {<br>
+=C2=A0 =C2=A0struct ssh2_packet *pkt;<br>
+=C2=A0 =C2=A0int res;<br>
+ <br>
+-=C2=A0 if (!kex_pool) {<br>
++=C2=A0 if (kex_pool =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0kex_pool =3D make_sub_pool(sftp_pool);<br>
+=C2=A0 =C2=A0 =C2=A0pr_pool_tag(kex_pool, &quot;Kex Pool&quot;);<br>
+=C2=A0 =C2=A0}<br>
+@@ -5100,4 +5175,3 @@ int sftp_kex_send_first_kexinit(void) {<br>
+=C2=A0 =C2=A0destroy_pool(pkt-&gt;pool);<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+-<br>
+diff --git a/contrib/mod_sftp/mod_sftp.c b/contrib/mod_sftp/mod_sftp.c<br>
+index b84b1a77b..2406ea611 100644<br>
+--- a/contrib/mod_sftp/mod_sftp.c<br>
++++ b/contrib/mod_sftp/mod_sftp.c<br>
+@@ -1,6 +1,6 @@<br>
+ /*<br>
+=C2=A0 * ProFTPD - mod_sftp<br>
+- * Copyright (c) 2008-2020 TJ Saunders<br>
++ * Copyright (c) 2008-2023 TJ Saunders<br>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify<br>
+=C2=A0 * it under the terms of the GNU General Public License as published=
 by<br>
+@@ -1411,8 +1411,9 @@ MODRET set_sftpoptions(cmd_rec *cmd) {<br>
+=C2=A0 =C2=A0config_rec *c;<br>
+=C2=A0 =C2=A0unsigned long opts =3D 0UL;<br>
+ <br>
+-=C2=A0 if (cmd-&gt;argc-1 =3D=3D 0)<br>
++=C2=A0 if (cmd-&gt;argc-1 =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0CONF_ERROR(cmd, &quot;wrong number of parameters&quot;=
);<br>
++=C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0CHECK_CONF(cmd, CONF_ROOT|CONF_VIRTUAL|CONF_GLOBAL);<br>
+ <br>
+@@ -1476,6 +1477,9 @@ MODRET set_sftpoptions(cmd_rec *cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0} else if (strcmp(cmd-&gt;argv[i], &quot;NoExtensionNe=
gotiation&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0opts |=3D SFTP_OPT_NO_EXT_INFO;<br>
+ <br>
++=C2=A0 =C2=A0 } else if (strcmp(cmd-&gt;argv[i], &quot;NoStrictKex&quot;)=
 =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 opts |=3D SFTP_OPT_NO_STRICT_KEX;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CONF_ERROR(cmd, pstrcat(cmd-&gt;tmp_pool, &quot=
;: unknown SFTPOption &#39;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;argv[i], &quot;&#39;&quot;, NULL=
));<br>
+diff --git a/contrib/mod_sftp/<a href=3D"http://mod_sftp.h.in" rel=3D"nore=
ferrer" target=3D"_blank">mod_sftp.h.in</a> b/contrib/mod_sftp/<a href=3D"h=
ttp://mod_sftp.h.in" rel=3D"noreferrer" target=3D"_blank">mod_sftp.h.in</a>=
<br>
+index 065981c31..adcf71276 100644<br>
+--- a/contrib/mod_sftp/<a href=3D"http://mod_sftp.h.in" rel=3D"noreferrer"=
 target=3D"_blank">mod_sftp.h.in</a><br>
++++ b/contrib/mod_sftp/<a href=3D"http://mod_sftp.h.in" rel=3D"noreferrer"=
 target=3D"_blank">mod_sftp.h.in</a><br>
+@@ -131,6 +131,7 @@<br>
+ #define SFTP_OPT_IGNORE_SFTP_SET_XATTRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00x04000<br>
+ #define SFTP_OPT_INCLUDE_SFTP_TIMES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x08000<br>
+ #define SFTP_OPT_NO_EXT_INFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x10000<br>
++#define SFTP_OPT_NO_STRICT_KEX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x040000<br>
+ <br>
+ /* mod_sftp service flags */<br>
+ #define SFTP_SERVICE_FL_SFTP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0001<br>
+diff --git a/contrib/mod_sftp/packet.c b/contrib/mod_sftp/packet.c<br>
+index b0067ea80..d8c97e92b 100644<br>
+--- a/contrib/mod_sftp/packet.c<br>
++++ b/contrib/mod_sftp/packet.c<br>
+@@ -1742,6 +1742,18 @@ int sftp_ssh2_packet_rekey_set_size(off_t size) {<b=
r>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
++uint32_t sftp_ssh2_packet_get_client_seqno(void) {<br>
++=C2=A0 return packet_client_seqno;<br>
++}<br>
++<br>
++void sftp_ssh2_packet_reset_client_seqno(void) {<br>
++=C2=A0 packet_client_seqno =3D 0;<br>
++}<br>
++<br>
++void sftp_ssh2_packet_reset_server_seqno(void) {<br>
++=C2=A0 packet_server_seqno =3D 0;<br>
++}<br>
++<br>
+ int sftp_ssh2_packet_send_version(void) {<br>
+=C2=A0 =C2=A0if (!sent_version_id) {<br>
+=C2=A0 =C2=A0 =C2=A0int res;<br>
+diff --git a/contrib/mod_sftp/packet.h b/contrib/mod_sftp/packet.h<br>
+index a424e9b25..fe538cbd7 100644<br>
+--- a/contrib/mod_sftp/packet.h<br>
++++ b/contrib/mod_sftp/packet.h<br>
+@@ -1,6 +1,6 @@<br>
+ /*<br>
+=C2=A0 * ProFTPD - mod_sftp packet IO<br>
+- * Copyright (c) 2008-2020 TJ Saunders<br>
++ * Copyright (c) 2008-2023 TJ Saunders<br>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify<br>
+=C2=A0 * it under the terms of the GNU General Public License as published=
 by<br>
+@@ -107,6 +107,13 @@ int sftp_ssh2_packet_rekey_reset(void);<br>
+ int sftp_ssh2_packet_rekey_set_seqno(uint32_t);<br>
+ int sftp_ssh2_packet_rekey_set_size(off_t);<br>
+ <br>
++/* These are used for implementing the &quot;strict KEX&quot; mitigations=
 of the Terrapin<br>
++ * attack (Issue 1760).<br>
++ */<br>
++uint32_t sftp_ssh2_packet_get_client_seqno(void);<br>
++void sftp_ssh2_packet_reset_client_seqno(void);<br>
++void sftp_ssh2_packet_reset_server_seqno(void);<br>
++<br>
+ int sftp_ssh2_packet_send_version(void);<br>
+ int sftp_ssh2_packet_set_poll_timeout(int);<br>
+ int sftp_ssh2_packet_set_version(const char *);<br>
+diff --git a/contrib/mod_sftp/tap.c b/contrib/mod_sftp/tap.c<br>
+index 95f388e43..7eaf959e2 100644<br>
+--- a/contrib/mod_sftp/tap.c<br>
++++ b/contrib/mod_sftp/tap.c<br>
+@@ -1,6 +1,6 @@<br>
+ /*<br>
+=C2=A0 * ProFTPD - mod_sftp traffic analysis protection<br>
+- * Copyright (c) 2008-2016 TJ Saunders<br>
++ * Copyright (c) 2008-2023 TJ Saunders<br>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify<br>
+=C2=A0 * it under the terms of the GNU General Public License as published=
 by<br>
+@@ -149,7 +149,6 @@ static void set_policy_chance(struct sftp_tap_policy *=
policy) {<br>
+ }<br>
+ <br>
+ static void set_policy_timer(struct sftp_tap_policy *policy) {<br>
+-<br>
+=C2=A0 =C2=A0/* Start a timer which checks the last times we received and =
sent packets.<br>
+=C2=A0 =C2=A0 * From there, we may want to inject a TAP message, depending=
 on the<br>
+=C2=A0 =C2=A0 * policy.<br>
+@@ -177,6 +176,16 @@ int sftp_tap_send_packet(void) {<br>
+=C2=A0 =C2=A0int rnd;<br>
+=C2=A0 =C2=A0unsigned int chance;<br>
+ <br>
++=C2=A0 /* Due to chances of violating client-side &quot;strict KEX&quot; =
Terrapin<br>
++=C2=A0 =C2=A0* mitigations, we will not send packets if we are in the mid=
dle of a KEX.<br>
++=C2=A0 =C2=A0*/<br>
++=C2=A0 if (!(sftp_sess_state &amp; SFTP_SESS_STATE_HAVE_KEX) ||<br>
++=C2=A0 =C2=A0 =C2=A0 (sftp_sess_state &amp; SFTP_SESS_STATE_REKEYING)) {<=
br>
++=C2=A0 =C2=A0 pr_trace_msg(trace_channel, 11,<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;unwilling to send TAP packet during KEX&quot;)=
;<br>
++=C2=A0 =C2=A0 return 0;<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0if (!sftp_interop_supports_feature(SFTP_SSH2_FEAT_IGNORE_MSG)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0pr_trace_msg(trace_channel, 3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unable to send TAP packet: IGNORE not sup=
ported by client&quot;);<br>
+@@ -205,7 +214,7 @@ int sftp_tap_send_packet(void) {<br>
+=C2=A0 =C2=A0 =C2=A0struct ssh2_packet *pkt;<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int max_datalen =3D 8192;<br>
+ <br>
+-=C2=A0 =C2=A0 if (curr_policy.max_datalen) {<br>
++=C2=A0 =C2=A0 if (curr_policy.max_datalen &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0max_datalen =3D curr_policy.max_datalen;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -246,15 +255,15 @@ int sftp_tap_send_packet(void) {<br>
+ int sftp_tap_set_policy(const char *policy) {<br>
+=C2=A0 =C2=A0register unsigned int i;<br>
+ <br>
+-=C2=A0 if (tap_pool) {<br>
++=C2=A0 if (tap_pool !=3D NULL) {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* Special case: IFF the existing policy is &#39;none&=
#39; AND the given<br>
+=C2=A0 =C2=A0 =C2=A0 * policy is &#39;rogaway&#39;, just return.=C2=A0 The=
 &#39;none&#39; policy must have been<br>
+=C2=A0 =C2=A0 =C2=A0 * explicitly configured, and it should override the a=
utomatic use of<br>
+=C2=A0 =C2=A0 =C2=A0 * the &#39;rogaway&#39; policy.<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 if (strncmp(curr_policy.policy, &quot;none&quot;, 5) =3D=3D=
 0 &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 strncasecmp(policy, &quot;rogaway&quot;, 8) =
=3D=3D 0) {<br>
++=C2=A0 =C2=A0 if (strcasecmp(curr_policy.policy, &quot;none&quot;) =3D=3D=
 0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 strcasecmp(policy, &quot;rogaway&quot;) =3D=
=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) pr_log_writefile(sftp_logfd, MOD_SFTP_VE=
RSION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;none&#39; traffic policy expl=
icitly configured, ignoring &#39;%s&#39; policy&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0policy);<br>
+@@ -278,7 +287,6 @@ int sftp_tap_set_policy(const char *policy) {<br>
+=C2=A0 =C2=A0 =C2=A0if (strcasecmp(tap_policies[i].policy, policy) =3D=3D =
0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0copy_policy(&amp;curr_policy, &amp;(tap_policie=
s[i]));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set_policy_chance(&amp;curr_policy);<br>
+-=C2=A0 =C2=A0 =C2=A0 set_policy_timer(&amp;curr_policy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+@@ -286,3 +294,7 @@ int sftp_tap_set_policy(const char *policy) {<br>
+=C2=A0 =C2=A0errno =3D ENOENT;<br>
+=C2=A0 =C2=A0return -1;<br>
+ }<br>
++<br>
++void sftp_tap_start_policy(void) {<br>
++=C2=A0 set_policy_timer(&amp;curr_policy);<br>
++}<br>
+diff --git a/contrib/mod_sftp/tap.h b/contrib/mod_sftp/tap.h<br>
+index 4a4c065d2..312223595 100644<br>
+--- a/contrib/mod_sftp/tap.h<br>
++++ b/contrib/mod_sftp/tap.h<br>
+@@ -1,6 +1,6 @@<br>
+ /*<br>
+=C2=A0 * ProFTPD - mod_sftp traffic analysis protection<br>
+- * Copyright (c) 2008-2016 TJ Saunders<br>
++ * Copyright (c) 2008-2013 TJ Saunders<br>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify<br>
+=C2=A0 * it under the terms of the GNU General Public License as published=
 by<br>
+@@ -63,4 +63,7 @@ int sftp_tap_send_packet(void);<br>
+=C2=A0 */<br>
+ int sftp_tap_set_policy(const char *);<br>
+ <br>
++/* Sets the configured TAP policy in motion. */<br>
++void sftp_tap_start_policy(void);<br>
++<br>
+ #endif /* MOD_SFTP_TAP_H */<br>
+diff --git a/doc/contrib/mod_sftp.html b/doc/contrib/mod_sftp.html<br>
+index 60c3436fa..cfc639d05 100644<br>
+--- a/doc/contrib/mod_sftp.html<br>
++++ b/doc/contrib/mod_sftp.html<br>
+@@ -1186,6 +1186,19 @@ The currently implemented options are:<br>
+=C2=A0 =C2=A0 =C2=A0&lt;code&gt;proftpd-1.3.7rc4&lt;/code&gt;.<br>
+=C2=A0 =C2=A0&lt;/li&gt;<br>
+ <br>
++=C2=A0 &lt;p&gt;<br>
++=C2=A0 &lt;li&gt;&lt;code&gt;NoStrictKex&lt;/code&gt;&lt;br&gt;<br>
++=C2=A0 =C2=A0 &lt;p&gt;<br>
++=C2=A0 =C2=A0 By default, &lt;code&gt;mod_sftp&lt;/code&gt; will honor/su=
pport the OpenSSH<br>
++=C2=A0 =C2=A0 &quot;strict KEX&quot; mode extension, &quot;<a href=3D"mai=
lto:kex-strict-c-v00@openssh.com" target=3D"_blank">kex-strict-c-v00@openss=
h.com</a>&quot; and<br>
++=C2=A0 =C2=A0 &quot;<a href=3D"mailto:kex-strict-s-v00@openssh.com" targe=
t=3D"_blank">kex-strict-s-v00@openssh.com</a>&quot;.=C2=A0 Use this option =
to disable support for<br>
++=C2=A0 =C2=A0 these custom OpenSSH extensions.<br>
++<br>
++=C2=A0 =C2=A0 &lt;p&gt;<br>
++=C2=A0 =C2=A0 &lt;b&gt;Note&lt;/b&gt; that this option first appeared in<=
br>
++=C2=A0 =C2=A0 &lt;code&gt;proftpd-1.3.9rc1&lt;/code&gt;.<br>
++=C2=A0 &lt;/li&gt;<br>
++<br>
+=C2=A0 =C2=A0&lt;p&gt;<br>
+=C2=A0 =C2=A0&lt;li&gt;&lt;code&gt;OldProtocolCompat&lt;/code&gt;&lt;br&gt=
;<br>
+=C2=A0 =C2=A0 =C2=A0&lt;p&gt;<br>
+@@ -2642,7 +2655,7 @@ deal with this issue, then, you can hopefully upgrad=
e to ProFTPD 1.3.6 or later,<br>
+ &lt;p&gt;<br>
+ &lt;hr&gt;<br>
+ &lt;font size=3D2&gt;&lt;b&gt;&lt;i&gt;<br>
+-&amp;copy; Copyright 2008-2021 TJ Saunders&lt;br&gt;<br>
++&amp;copy; Copyright 2008-2023 TJ Saunders&lt;br&gt;<br>
+=C2=A0 All Rights Reserved&lt;br&gt;<br>
+ &lt;/i&gt;&lt;/b&gt;&lt;/font&gt;<br>
+ &lt;hr&gt;<br>
+diff --git a/tests/t/lib/ProFTPD/Tests/Modules/<a href=3D"http://mod_sftp.=
pm" rel=3D"noreferrer" target=3D"_blank">mod_sftp.pm</a> b/tests/t/lib/ProF=
TPD/Tests/Modules/<a href=3D"http://mod_sftp.pm" rel=3D"noreferrer" target=
=3D"_blank">mod_sftp.pm</a><br>
+index b4bdf516b..8c2be5465 100644<br>
+--- a/tests/t/lib/ProFTPD/Tests/Modules/<a href=3D"http://mod_sftp.pm" rel=
=3D"noreferrer" target=3D"_blank">mod_sftp.pm</a><br>
++++ b/tests/t/lib/ProFTPD/Tests/Modules/<a href=3D"http://mod_sftp.pm" rel=
=3D"noreferrer" target=3D"_blank">mod_sftp.pm</a><br>
+@@ -87,6 +87,11 @@ my $TESTS =3D {<br>
+=C2=A0 =C2=A0 =C2=A0test_class =3D&gt; [qw(forking ssh2)],<br>
+=C2=A0 =C2=A0},<br>
+ <br>
++=C2=A0 ssh2_ext_kex_strict_terrapin_issue1760 =3D&gt; {<br>
++=C2=A0 =C2=A0 order =3D&gt; ++$order,<br>
++=C2=A0 =C2=A0 test_class =3D&gt; [qw(bug forking ssh2)],<br>
++=C2=A0 },<br>
++<br>
+=C2=A0 =C2=A0ssh2_hostkey_rsa =3D&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0order =3D&gt; ++$order,<br>
+=C2=A0 =C2=A0 =C2=A0test_class =3D&gt; [qw(forking ssh2)],<br>
+@@ -3885,6 +3890,218 @@ EOC<br>
+=C2=A0 =C2=A0unlink($log_file);<br>
+ }<br>
+ <br>
++sub ssh2_ext_kex_strict_terrapin_issue1760 {<br>
++=C2=A0 my $self =3D shift;<br>
++=C2=A0 my $tmpdir =3D $self-&gt;{tmpdir};<br>
++=C2=A0 my $setup =3D test_setup($tmpdir, &#39;sftp&#39;);<br>
++<br>
++=C2=A0 my $rsa_host_key =3D File::Spec-&gt;rel2abs(&#39;t/etc/modules/mod=
_sftp/ssh_host_rsa_key&#39;);<br>
++=C2=A0 my $dsa_host_key =3D File::Spec-&gt;rel2abs(&#39;t/etc/modules/mod=
_sftp/ssh_host_dsa_key&#39;);<br>
++<br>
++=C2=A0 my $rsa_priv_key =3D File::Spec-&gt;rel2abs(&#39;t/etc/modules/mod=
_sftp/test_rsa_key&#39;);<br>
++=C2=A0 my $rsa_pub_key =3D File::Spec-&gt;rel2abs(&#39;t/etc/modules/mod_=
sftp/test_rsa_key.pub&#39;);<br>
++=C2=A0 my $rsa_rfc4716_key =3D File::Spec-&gt;rel2abs(&#39;t/etc/modules/=
mod_sftp/authorized_rsa_keys&#39;);<br>
++<br>
++=C2=A0 my $authorized_keys =3D File::Spec-&gt;rel2abs(&quot;$tmpdir/.auth=
orized_keys&quot;);<br>
++=C2=A0 unless (copy($rsa_rfc4716_key, $authorized_keys)) {<br>
++=C2=A0 =C2=A0 die(&quot;Can&#39;t copy $rsa_rfc4716_key to $authorized_ke=
ys: $!&quot;);<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 my $ssh_config =3D File::Spec-&gt;rel2abs(&quot;$tmpdir/ssh.conf&q=
uot;);<br>
++=C2=A0 if (open(my $fh, &quot;&gt; $ssh_config&quot;)) {<br>
++=C2=A0 =C2=A0 print $fh &lt;&lt;EOC;<br>
++HostKeyAlgorithms rsa-sha2-256<br>
++IdentityAgent none<br>
++PubkeyAcceptedKeyTypes rsa-sha2-256<br>
++EOC<br>
++=C2=A0 =C2=A0 unless (close($fh)) {<br>
++=C2=A0 =C2=A0 =C2=A0 die(&quot;Can&#39;t write $ssh_config: $!&quot;);<br=
>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 } else {<br>
++=C2=A0 =C2=A0 die(&quot;Can&#39;t open $ssh_config: $!&quot;);<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 my $batch_file =3D File::Spec-&gt;rel2abs(&quot;$tmpdir/sftp-batch=
.conf&quot;);<br>
++=C2=A0 if (open(my $fh, &quot;&gt; $batch_file&quot;)) {<br>
++=C2=A0 =C2=A0 print $fh &quot;ls -l\n&quot;;<br>
++<br>
++=C2=A0 =C2=A0 unless (close($fh)) {<br>
++=C2=A0 =C2=A0 =C2=A0 die(&quot;Can&#39;t write $batch_file: $!&quot;);<br=
>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 } else {<br>
++=C2=A0 =C2=A0 die(&quot;Can&#39;t open $batch_file: $!&quot;);<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 my $config =3D {<br>
++=C2=A0 =C2=A0 PidFile =3D&gt; $setup-&gt;{pid_file},<br>
++=C2=A0 =C2=A0 ScoreboardFile =3D&gt; $setup-&gt;{scoreboard_file},<br>
++=C2=A0 =C2=A0 SystemLog =3D&gt; $setup-&gt;{log_file},<br>
++=C2=A0 =C2=A0 TraceLog =3D&gt; $setup-&gt;{log_file},<br>
++=C2=A0 =C2=A0 Trace =3D&gt; &#39;ssh2:30 sftp:20 scp:20&#39;,<br>
++<br>
++=C2=A0 =C2=A0 AuthUserFile =3D&gt; $setup-&gt;{auth_user_file},<br>
++=C2=A0 =C2=A0 AuthGroupFile =3D&gt; $setup-&gt;{auth_group_file},<br>
++=C2=A0 =C2=A0 AuthOrder =3D&gt; &#39;mod_auth_file.c&#39;,<br>
++<br>
++=C2=A0 =C2=A0 IfModules =3D&gt; {<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;mod_delay.c&#39; =3D&gt; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DelayEngine =3D&gt; &#39;off&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 },<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;mod_sftp.c&#39; =3D&gt; [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SFTPEngine on&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SFTPLog $setup-&gt;{log_file}&quot;,<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SFTPHostKey $rsa_host_key&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SFTPHostKey $dsa_host_key&quot;,<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SFTPAuthorizedUserKeys file:~/.authoriz=
ed_keys&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 ],<br>
++=C2=A0 =C2=A0 },<br>
++=C2=A0 };<br>
++<br>
++=C2=A0 my ($port, $config_user, $config_group) =3D config_write($setup-&g=
t;{config_file},<br>
++=C2=A0 =C2=A0 $config);<br>
++<br>
++=C2=A0 # Open pipes, for use between the parent and child processes.=C2=
=A0 Specifically,<br>
++=C2=A0 # the child will indicate when it&#39;s done with its test by writ=
ing a message<br>
++=C2=A0 # to the parent.<br>
++=C2=A0 my ($rfh, $wfh);<br>
++=C2=A0 unless (pipe($rfh, $wfh)) {<br>
++=C2=A0 =C2=A0 die(&quot;Can&#39;t open pipe: $!&quot;);<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 require Net::SSH2;<br>
++<br>
++=C2=A0 my $ex;<br>
++<br>
++=C2=A0 # Fork child<br>
++=C2=A0 $self-&gt;handle_sigchld();<br>
++=C2=A0 defined(my $pid =3D fork()) or die(&quot;Can&#39;t fork: $!&quot;)=
;<br>
++=C2=A0 if ($pid) {<br>
++=C2=A0 =C2=A0 eval {<br>
++=C2=A0 =C2=A0 =C2=A0 # We use OpenSSH-9.6p1 to test our &quot;strict KEX&=
quot; Terrapin mitigations.<br>
++=C2=A0 =C2=A0 =C2=A0 my $sftp =3D &#39;/Users/tj/local/openssh-9.6p1/bin/=
sftp&#39;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 my @cmd =3D (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $sftp,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-F&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ssh_config,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-oBatchMode=3Dyes&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-oCheckHostIP=3Dno&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-oCompression=3Dyes&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-oPort=3D$port&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-oIdentityFile=3D$rsa_priv_key&quot;,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-oPubkeyAuthentication=3Dyes&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-oStrictHostKeyChecking=3Dno&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-oUserKnownHostsFile=3D/dev/null&#39;,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-vvv&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-b&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $batch_file,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$setup-&gt;{user}\@<a href=3D"http://12=
7.0.0.1" rel=3D"noreferrer" target=3D"_blank">127.0.0.1</a>&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 );<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 my $sftp_rh =3D IO::Handle-&gt;new();<br>
++=C2=A0 =C2=A0 =C2=A0 my $sftp_wh =3D IO::Handle-&gt;new();<br>
++=C2=A0 =C2=A0 =C2=A0 my $sftp_eh =3D IO::Handle-&gt;new();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 $sftp_wh-&gt;autoflush(1);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 sleep(1);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 local $SIG{CHLD} =3D &#39;DEFAULT&#39;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 # Make sure that the perms on the priv key are what =
OpenSSH wants<br>
++=C2=A0 =C2=A0 =C2=A0 unless (chmod(0400, $rsa_priv_key)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;Can&#39;t set perms on $rsa_priv_ke=
y to 0400: $!&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ($ENV{TEST_VERBOSE}) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 print STDERR &quot;Executing: &quot;, join(&#=
39; &#39;, @cmd), &quot;\n&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 my $sftp_pid =3D open3($sftp_wh, $sftp_rh, $sftp_eh,=
 @cmd);<br>
++=C2=A0 =C2=A0 =C2=A0 waitpid($sftp_pid, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 my $exit_status =3D $?;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 # Restore the perms on the priv key<br>
++=C2=A0 =C2=A0 =C2=A0 unless (chmod(0644, $rsa_priv_key)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;Can&#39;t set perms on $rsa_priv_ke=
y to 0644: $!&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 my ($res, $errstr);<br>
++=C2=A0 =C2=A0 =C2=A0 if ($exit_status &gt;&gt; 8 =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $errstr =3D join(&#39;&#39;, &lt;$sftp_eh&gt;=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $res =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $errstr =3D join(&#39;&#39;, &lt;$sftp_eh&gt;=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($ENV{TEST_VERBOSE}) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print STDERR &quot;Stderr: $errstr\n&q=
uot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $res =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 unless ($res =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;Can&#39;t list files on server: $er=
rstr&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 };<br>
++=C2=A0 =C2=A0 if ($@) {<br>
++=C2=A0 =C2=A0 =C2=A0 $ex =3D $@;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 $wfh-&gt;print(&quot;done\n&quot;);<br>
++=C2=A0 =C2=A0 $wfh-&gt;flush();<br>
++<br>
++=C2=A0 } else {<br>
++=C2=A0 =C2=A0 eval { server_wait($setup-&gt;{config_file}, $rfh) };<br>
++=C2=A0 =C2=A0 if ($@) {<br>
++=C2=A0 =C2=A0 =C2=A0 warn($@);<br>
++=C2=A0 =C2=A0 =C2=A0 exit 1;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 exit 0;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 # Stop server<br>
++=C2=A0 server_stop($setup-&gt;{pid_file});<br>
++=C2=A0 $self-&gt;assert_child_ok($pid);<br>
++<br>
++=C2=A0 eval {<br>
++=C2=A0 =C2=A0 if (open(my $fh, &quot;&lt; $setup-&gt;{log_file}&quot;)) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 my $ok =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 while (my $line =3D &lt;$fh&gt;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 chomp($line);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($ENV{TEST_VERBOSE}) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print STDERR &quot;# $line\n&quot;;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($line =3D~ /client signaled strict KEX su=
pport/) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ok =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 close($fh);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 $self-&gt;assert($ok, test_msg(&quot;Did not see exp=
ected &#39;strict KEX&#39; TraceLog message&quot;));<br>
++<br>
++=C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 die(&quot;Can&#39;t read $setup-&gt;{log_file}: $!&q=
uot;);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 };<br>
++=C2=A0 if ($@) {<br>
++=C2=A0 =C2=A0 $ex =3D $@;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 test_cleanup($setup-&gt;{log_file}, $ex);<br>
++}<br>
++<br>
+ sub ssh2_hostkey_rsa {<br>
+=C2=A0 =C2=A0my $self =3D shift;<br>
+=C2=A0 =C2=A0my $tmpdir =3D $self-&gt;{tmpdir};<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-networking/recipes-daemons/proftpd/<a href=3D"http://prof=
tpd_1.3.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a> b=
/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.b=
b" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
index ec38fb54e1..036c01482a 100644<br>
--- a/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3=
.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
+++ b/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3=
.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
@@ -17,6 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/prof=
tpd/proftpd.git;branch=3D$%7BBRANCH%7D;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/proftpd/proftpd.git;branch=3D${BRANCH};protoc=
ol=3Dhttps</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://proftpd.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-51713.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-57392.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-48795.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000eec2440641957b8d--

