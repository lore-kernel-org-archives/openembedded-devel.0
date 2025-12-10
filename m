Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C9BD3C93C
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:39:33 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1824.1765388368652854828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bs9uu10g;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3e0f19a38d0so36298fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388368; x=1765993168; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3CT02Oc42WFAlcb4uHytec22bHe6iqvAcOIGH5sVUo=;
        b=Bs9uu10g6HZ0g2ynNmqiaRkq7gIzeoJnf27CRZXUg14RzbdF03c467BUkhGopHF4Cc
         p5PuUPicHT6ptz9reFHJZAxCrdPy1px39HLbG6Xa48QQnNMswLFYcTrVgaunyG7OrRRa
         dXeRZHhLATAjucxvObn544fr061YMesVMufCA1pM17Eam1aD8ZLVjp8t8g/obvVGHrS/
         yFT0cjeOA09bbdBN1s3TaBAV+3rbCDlOkJglS8K4BE8qGnmN0UiU6D7e4khu16Up3aja
         xsyGC8cui2hzIkODymMOIE9d1Z1L5wAkUErKk1IFFOLPcEaDzFpNvMr0lIqfROLHqsfn
         SNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388368; x=1765993168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x3CT02Oc42WFAlcb4uHytec22bHe6iqvAcOIGH5sVUo=;
        b=Oni2J0T7lrUQp16GYduhfDQ6ng4RNwTbwzcncWO93NzulKxrThgGmkb9s+97qnAcg2
         0sasPnP8RDUTkfUpwVNqbbZFMOPDIQxo5diX1p4oYIhi3qVwd2F0SVrwKJxxlQPQaamH
         jhEVX7cEp1YtXMOECOvPU2rmXwKu8qZ7ToUs1M3wwVF1dOD69kXioXfoVu3PZSSGWz5J
         99NBNUYt6+NaRe+zHjtpwlPDe5XpkLu+Cp6zuvwxFt1vxIN1rRiaBZaf+WPSDGFY53I2
         bTauOFCxdfRf/rHbS1Y6zc7PSOx+QRRLpdfKcui+QbjOLLXuDroygsbJmT14rDi2DEyu
         4rkg==
X-Gm-Message-State: AOJu0Yxufxxy9L8TVNAavqj3MfxujyF5fucxyPGIuwuKuHo1Yk3myKc2
	pxfYr3jeG6purazyCiZteln9N/He+XqvdbVZzGbygt6JlqhDzd7PtvDzKIiWImsds0erplt8xtp
	0eV1VeDan7bYgnBepRE1jUR/gfKIRIMc=
X-Gm-Gg: AY/fxX4IpH4PeWUk8HKXz+y5MDGN4XdtsugD0ifekR4Mw9kqfAOPshHKTYfuGEiGhjo
	ufGzpM4krAMryHz5lD29v4sgVveR6SVjV/UEIj+uEJErPBzWNS9BLNYGJphmuee/6u7PJeAoooX
	NAGI/N3s+m2G9093iEsyKoJYCVbdWVHYWLEYL9XkyDf92re2j8vqaA12+T9/bdShtvGt5LAQ7gw
	Bnl+UP8BJMARzovNxA7u01EJUHLgpS7WliQnTOsdlszecoiDwotk78EqPaTC0Tl12Aw2OYT
X-Google-Smtp-Source: AGHT+IFxqdhlMtme7AyWt7o548wgkRQEr1nAY5HUtX0wp+eJtuolVzQMicEgQGPaurgaBkarNrdDoBfTl/4HHit+1SM=
X-Received: by 2002:a05:6870:8454:b0:3e7:eba1:fdd with SMTP id
 586e51a60fabf-3f5bd9e05b9mr1945937fac.15.1765388367476; Wed, 10 Dec 2025
 09:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20251208190019.3119238-1-ankur.tyagi85@gmail.com> <CA+s=J=zhypE4Kp+_QMtMORT+HdbphOsh_o86=JHhctanCctXBg@mail.gmail.com>
In-Reply-To: <CA+s=J=zhypE4Kp+_QMtMORT+HdbphOsh_o86=JHhctanCctXBg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 11 Dec 2025 06:39:15 +1300
X-Gm-Features: AQt7F2polLWREZsffB2jE1BpUy1FA9632bXkGFqNKPOcxU1Qy6N5b_x_NtL7KW0
Message-ID: <CADySD0HpqjEZuh2Bur8d80aJBTbDuK0_3uKZz8Nm3em7YmrtXw@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH 2/2] proftpd: Fix CVE-2023-48795
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Vijay Anusuri <vanusuri@mvista.com>, Gyorgy Sarvari <skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122565

Sorry Anuj, I have now sent v2.

On Wed, Dec 10, 2025 at 7:56=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> This doesn't apply:
>
> patching file contrib/mod_sftp/kex.c
> Hunk #2 succeeded at 1585 (offset -15 lines).
> Hunk #3 succeeded at 2176 (offset -15 lines).
> Hunk #4 succeeded at 4423 (offset -15 lines).
> Hunk #5 succeeded at 4473 (offset -15 lines).
> Hunk #6 succeeded at 4505 (offset -15 lines).
> Hunk #7 succeeded at 4562 (offset -15 lines).
> Hunk #8 succeeded at 4571 (offset -15 lines).
> Hunk #9 succeeded at 4607 (offset -15 lines).
> Hunk #10 succeeded at 4683 (offset -15 lines).
> Hunk #11 succeeded at 4706 (offset -15 lines).
> Hunk #12 succeeded at 4831 (offset -15 lines).
> Hunk #13 succeeded at 4855 (offset -15 lines).
> Hunk #14 succeeded at 4879 (offset -15 lines).
> Hunk #15 succeeded at 4918 (offset -15 lines).
> Hunk #16 succeeded at 4953 (offset -15 lines).
> Hunk #17 succeeded at 5125 (offset -15 lines).
> Hunk #18 succeeded at 5160 (offset -15 lines).
> patching file contrib/mod_sftp/mod_sftp.c
> Hunk #1 FAILED at 1.
> Hunk #2 succeeded at 1415 (offset 4 lines).
> Hunk #3 succeeded at 1481 (offset 4 lines).
> 1 out of 3 hunks FAILED -- rejects in file contrib/mod_sftp/mod_sftp.c
> patching file contrib/mod_sftp/mod_sftp.h.in
> Hunk #1 succeeded at 143 (offset 12 lines).
> patching file contrib/mod_sftp/packet.c
> patching file contrib/mod_sftp/packet.h
> patching file contrib/mod_sftp/tap.c
> patching file contrib/mod_sftp/tap.h
> patching file doc/contrib/mod_sftp.html
> patching file tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm
> Patch CVE-2023-48795.patch does not apply (enforce with -f)
>
>
> On Tue, Dec 9, 2025 at 3:00=E2=80=AFAM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport from https://github.com/proftpd/proftpd/commi=
t/bcec15efe6c53dac40420731013f1cd2fd54123b
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > (cherry picked from commit 6c8ae54fc345fb6249f1cc92ed769d451ddc12b5)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../proftpd/files/CVE-2023-48795.patch        | 751 ++++++++++++++++++
> >  .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
> >  2 files changed, 752 insertions(+)
> >  create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2=
023-48795.patch
> >
> > diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2023-487=
95.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.pat=
ch
> > new file mode 100644
> > index 0000000000..39def781fb
> > --- /dev/null
> > +++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patc=
h
> > @@ -0,0 +1,751 @@
> > +From bcec15efe6c53dac40420731013f1cd2fd54123b Mon Sep 17 00:00:00 2001
> > +From: TJ Saunders <tj@castaglia.org>
> > +Date: Tue, 19 Dec 2023 18:55:58 -0800
> > +Subject: [PATCH] Issue #1760: Implement the "strict KEX" mitigations f=
or the
> > + Terrapin SSH protocol attack (CVE-2023-48795).
> > +
> > +Upstream-Status: Backport [https://github.com/proftpd/proftpd/commit/b=
cec15efe6c53dac40420731013f1cd2fd54123b]
> > +CVE: CVE-2023-48795
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + contrib/mod_sftp/kex.c                        | 124 ++++++++--
> > + contrib/mod_sftp/mod_sftp.c                   |   8 +-
> > + contrib/mod_sftp/mod_sftp.h.in                |   1 +
> > + contrib/mod_sftp/packet.c                     |  12 +
> > + contrib/mod_sftp/packet.h                     |   9 +-
> > + contrib/mod_sftp/tap.c                        |  26 ++-
> > + contrib/mod_sftp/tap.h                        |   5 +-
> > + doc/contrib/mod_sftp.html                     |  15 +-
> > + tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm | 217 +++++++++++++++++=
+
> > + 9 files changed, 380 insertions(+), 37 deletions(-)
> > +
> > +diff --git a/contrib/mod_sftp/kex.c b/contrib/mod_sftp/kex.c
> > +index 754bd9e87..c1caa1c27 100644
> > +--- a/contrib/mod_sftp/kex.c
> > ++++ b/contrib/mod_sftp/kex.c
> > +@@ -149,6 +149,13 @@ static struct sftp_kex *kex_first_kex =3D NULL;
> > + static struct sftp_kex *kex_rekey_kex =3D NULL;
> > + static int kex_sent_kexinit =3D FALSE;
> > +
> > ++/* Using strict kex?  Note that we maintain this value here, rather t=
han
> > ++ * in the sftp_kex struct, so that any "use strict KEX" flag set via =
the
> > ++ * first KEXINIT is used through any subsequent KEXINITs.
> > ++ */
> > ++static int use_strict_kex =3D FALSE;
> > ++static int kex_done_first_kex =3D FALSE;
> > ++
> > + /* Diffie-Hellman group moduli */
> > +
> > + static const char *dh_group1_str =3D
> > +@@ -1593,6 +1600,16 @@ static const char *get_kexinit_exchange_list(po=
ol *p) {
> > +     res =3D pstrcat(p, res, *res ? "," : "", pstrdup(p, "ext-info-s")=
, NULL);
> > +   }
> > +
> > ++  if (!(sftp_opts & SFTP_OPT_NO_STRICT_KEX)) {
> > ++    /* Indicate support for OpenSSH's custom "strict KEX" mode extens=
ion,
> > ++     * but only if we have not done/completed our first KEX.
> > ++     */
> > ++    if (kex_done_first_kex =3D=3D FALSE) {
> > ++      res =3D pstrcat(p, res, *res ? "," : "",
> > ++        pstrdup(p, "kex-strict-s-v00@openssh.com"), NULL);
> > ++    }
> > ++  }
> > ++
> > +   return res;
> > + }
> > +
> > +@@ -2174,6 +2191,21 @@ static int get_session_names(struct sftp_kex *k=
ex, int *correct_guess) {
> > +     pr_trace_msg(trace_channel, 20, "client %s EXT_INFO support",
> > +       kex->use_ext_info ? "signaled" : "did not signal" );
> > +
> > ++    if (!(sftp_opts & SFTP_OPT_NO_STRICT_KEX)) {
> > ++      /* Did the client indicate "strict kex" support (Issue 1760)?
> > ++       *
> > ++       * Note that we only check for this if it is our first KEXINIT.
> > ++       * The "strict kex" extension is ignored in any subsequent KEXI=
NITs, as
> > ++       * for rekeys.
> > ++       */
> > ++      if (kex_done_first_kex =3D=3D FALSE) {
> > ++        use_strict_kex =3D sftp_misc_namelist_contains(kex->pool,
> > ++          client_list, "kex-strict-c-v00@openssh.com");
> > ++        pr_trace_msg(trace_channel, 20, "client %s strict KEX support=
",
> > ++          use_strict_kex ? "signaled" : "did not signal" );
> > ++      }
> > ++    }
> > ++
> > +   } else {
> > +     (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> > +       "no shared key exchange algorithm found (client sent '%s', serv=
er sent "
> > +@@ -4406,7 +4438,6 @@ static int handle_kex_ecdh(struct ssh2_packet *p=
kt, struct sftp_kex *kex) {
> > +   destroy_pool(pkt->pool);
> > +   return 0;
> > + }
> > +-
> > + #endif /* PR_USE_OPENSSL_ECC */
> > +
> > + static struct ssh2_packet *read_kex_packet(pool *p, struct sftp_kex *=
kex,
> > +@@ -4457,6 +4488,10 @@ static struct ssh2_packet *read_kex_packet(pool=
 *p, struct sftp_kex *kex,
> > +     /* Per RFC 4253, Section 11, DEBUG, DISCONNECT, IGNORE, and UNIMP=
LEMENTED
> > +      * messages can occur at any time, even during KEX.  We have to b=
e prepared
> > +      * for this, and Do The Right Thing(tm).
> > ++     *
> > ++     * However, due to the Terrapin attack, if we are using a "strict=
 KEX"
> > ++     * mode, then only DISCONNECT messages can occur during KEX; DEBU=
G,
> > ++     * IGNORE, and UNIMPLEMENTED messages will lead to disconnecting.
> > +      */
> > +
> > +     mesg_type =3D sftp_ssh2_packet_get_mesg_type(pkt);
> > +@@ -4485,35 +4520,43 @@ static struct ssh2_packet *read_kex_packet(poo=
l *p, struct sftp_kex *kex,
> > +     }
> > +
> > +     switch (mesg_type) {
> > +-      case SFTP_SSH2_MSG_DEBUG:
> > +-        sftp_ssh2_packet_handle_debug(pkt);
> > +-        pr_response_set_pool(NULL);
> > +-        pkt =3D NULL;
> > +-        break;
> > +-
> > ++      /* DISCONNECT messages are always allowed. */
> > +       case SFTP_SSH2_MSG_DISCONNECT:
> > +         sftp_ssh2_packet_handle_disconnect(pkt);
> > +         pr_response_set_pool(NULL);
> > +         pkt =3D NULL;
> > +         break;
> > +
> > ++      case SFTP_SSH2_MSG_DEBUG:
> > ++        if (use_strict_kex =3D=3D FALSE) {
> > ++          sftp_ssh2_packet_handle_debug(pkt);
> > ++          pr_response_set_pool(NULL);
> > ++          pkt =3D NULL;
> > ++          break;
> > ++        }
> > ++
> > +       case SFTP_SSH2_MSG_IGNORE:
> > +-        sftp_ssh2_packet_handle_ignore(pkt);
> > +-        pr_response_set_pool(NULL);
> > +-        pkt =3D NULL;
> > +-        break;
> > ++        if (use_strict_kex =3D=3D FALSE) {
> > ++          sftp_ssh2_packet_handle_ignore(pkt);
> > ++          pr_response_set_pool(NULL);
> > ++          pkt =3D NULL;
> > ++          break;
> > ++        }
> > +
> > +       case SFTP_SSH2_MSG_UNIMPLEMENTED:
> > +-        sftp_ssh2_packet_handle_unimplemented(pkt);
> > +-        pr_response_set_pool(NULL);
> > +-        pkt =3D NULL;
> > +-        break;
> > ++        if (use_strict_kex =3D=3D FALSE) {
> > ++          sftp_ssh2_packet_handle_unimplemented(pkt);
> > ++          pr_response_set_pool(NULL);
> > ++          pkt =3D NULL;
> > ++          break;
> > ++        }
> > +
> > +       default:
> > +         /* For any other message type, it's considered a protocol err=
or. */
> > +         (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> > +-          "received %s (%d) unexpectedly, disconnecting",
> > +-          sftp_ssh2_packet_get_mesg_type_desc(mesg_type), mesg_type);
> > ++          "received %s (%d) unexpectedly%s, disconnecting",
> > ++          sftp_ssh2_packet_get_mesg_type_desc(mesg_type), mesg_type,
> > ++          use_strict_kex ? " during strict KEX" : "");
> > +         pr_response_set_pool(NULL);
> > +         destroy_kex(kex);
> > +         destroy_pool(pkt->pool);
> > +@@ -4534,7 +4577,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +    * initial connect (kex_first_kex not null), or because we
> > +    * are in a server-initiated rekeying (kex_rekey_kex not null).
> > +    */
> > +-  if (kex_first_kex) {
> > ++  if (kex_first_kex !=3D NULL) {
> > +     kex =3D kex_first_kex;
> > +
> > +     /* We need to assign the client/server versions, which this struc=
t
> > +@@ -4543,7 +4586,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +     kex->client_version =3D kex_client_version;
> > +     kex->server_version =3D kex_server_version;
> > +
> > +-  } else if (kex_rekey_kex) {
> > ++  } else if (kex_rekey_kex !=3D NULL) {
> > +     kex =3D kex_rekey_kex;
> > +
> > +   } else {
> > +@@ -4579,6 +4622,24 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +     return -1;
> > +   }
> > +
> > ++  if (use_strict_kex =3D=3D TRUE &&
> > ++      kex_done_first_kex =3D=3D FALSE) {
> > ++    uint32_t client_seqno;
> > ++
> > ++    client_seqno =3D sftp_ssh2_packet_get_client_seqno();
> > ++    if (client_seqno !=3D 1) {
> > ++      /* Receiving any messages other than a KEXINIT as the first cli=
ent
> > ++       * message indicates the possibility of the Terrapin attack bei=
ng
> > ++       * conducted (Issue 1760).  Thus we disconnect the client in su=
ch
> > ++       * cases.
> > ++       */
> > ++      (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> > ++        "'strict KEX' violation, as KEXINIT was not the first message=
; disconnecting");
> > ++      destroy_kex(kex);
> > ++      SFTP_DISCONNECT_CONN(SFTP_SSH2_DISCONNECT_BY_APPLICATION, NULL)=
;
> > ++    }
> > ++  }
> > ++
> > +   /* Once we have received the client KEXINIT message, we can compare=
 what we
> > +    * want to send against what we already received from the client.
> > +    *
> > +@@ -4637,7 +4698,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +
> > +       destroy_pool(pkt->pool);
> > +
> > +-      if (!kex_sent_kexinit) {
> > ++      if (kex_sent_kexinit =3D=3D FALSE) {
> > +         pkt =3D sftp_ssh2_packet_create(kex_pool);
> > +         res =3D write_kexinit(pkt, kex);
> > +         if (res < 0) {
> > +@@ -4660,7 +4721,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +       }
> > +     }
> > +
> > +-    if (!kex_sent_kexinit) {
> > ++    if (kex_sent_kexinit =3D=3D FALSE) {
> > +       pkt =3D sftp_ssh2_packet_create(kex_pool);
> > +       res =3D write_kexinit(pkt, kex);
> > +       if (res < 0) {
> > +@@ -4785,7 +4846,7 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +     NULL, 1, SFTP_SSH2_MSG_NEWKEYS);
> > +
> > +   /* If we didn't send our NEWKEYS message earlier, do it now. */
> > +-  if (!sent_newkeys) {
> > ++  if (sent_newkeys =3D=3D FALSE) {
> > +     struct ssh2_packet *pkt2;
> > +
> > +     pr_trace_msg(trace_channel, 9, "sending NEWKEYS message to client=
");
> > +@@ -4809,6 +4870,11 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +     destroy_pool(pkt2->pool);
> > +   }
> > +
> > ++  if (use_strict_kex =3D=3D TRUE) {
> > ++    sftp_ssh2_packet_reset_client_seqno();
> > ++    sftp_ssh2_packet_reset_server_seqno();
> > ++  }
> > ++
> > +   /* Last but certainly not least, set up the keys for encryption and
> > +    * authentication, based on H and K.
> > +    */
> > +@@ -4828,6 +4894,9 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +   destroy_pool(pkt->pool);
> > +   cmd =3D NULL;
> > +
> > ++  /* We've now completed our KEX, possibly our first. */
> > ++  kex_done_first_kex =3D TRUE;
> > ++
> > +   /* If extension negotiation has not been disabled, AND if we have n=
ot
> > +    * received a service request, AND if the client sent "ext-info-c",=
 THEN
> > +    * send our EXT_INFO.  We do not want send this during rekeys.
> > +@@ -4864,6 +4933,12 @@ int sftp_kex_handle(struct ssh2_packet *pkt) {
> > +     cmd =3D NULL;
> > +   }
> > +
> > ++  /* Only start the TAP timer after we have completed our first KEX.
> > ++   * Otherwise, we risk sending "illegal" packets prior to, or during=
,
> > ++   * a "strict KEX" session (Issue 1760).
> > ++   */
> > ++  sftp_tap_start_policy();
> > ++
> > +   /* Reset this flag for the next time through. */
> > +   kex_sent_kexinit =3D FALSE;
> > +
> > +@@ -4893,7 +4968,7 @@ int sftp_kex_free(void) {
> > +     destroy_kex(rekey_kex);
> > +   }
> > +
> > +-  if (kex_pool) {
> > ++  if (kex_pool !=3D NULL) {
> > +     destroy_pool(kex_pool);
> > +     kex_pool =3D NULL;
> > +   }
> > +@@ -5065,7 +5140,7 @@ int sftp_kex_send_first_kexinit(void) {
> > +   struct ssh2_packet *pkt;
> > +   int res;
> > +
> > +-  if (!kex_pool) {
> > ++  if (kex_pool =3D=3D NULL) {
> > +     kex_pool =3D make_sub_pool(sftp_pool);
> > +     pr_pool_tag(kex_pool, "Kex Pool");
> > +   }
> > +@@ -5100,4 +5175,3 @@ int sftp_kex_send_first_kexinit(void) {
> > +   destroy_pool(pkt->pool);
> > +   return 0;
> > + }
> > +-
> > +diff --git a/contrib/mod_sftp/mod_sftp.c b/contrib/mod_sftp/mod_sftp.c
> > +index b84b1a77b..2406ea611 100644
> > +--- a/contrib/mod_sftp/mod_sftp.c
> > ++++ b/contrib/mod_sftp/mod_sftp.c
> > +@@ -1,6 +1,6 @@
> > + /*
> > +  * ProFTPD - mod_sftp
> > +- * Copyright (c) 2008-2020 TJ Saunders
> > ++ * Copyright (c) 2008-2023 TJ Saunders
> > +  *
> > +  * This program is free software; you can redistribute it and/or modi=
fy
> > +  * it under the terms of the GNU General Public License as published =
by
> > +@@ -1411,8 +1411,9 @@ MODRET set_sftpoptions(cmd_rec *cmd) {
> > +   config_rec *c;
> > +   unsigned long opts =3D 0UL;
> > +
> > +-  if (cmd->argc-1 =3D=3D 0)
> > ++  if (cmd->argc-1 =3D=3D 0) {
> > +     CONF_ERROR(cmd, "wrong number of parameters");
> > ++  }
> > +
> > +   CHECK_CONF(cmd, CONF_ROOT|CONF_VIRTUAL|CONF_GLOBAL);
> > +
> > +@@ -1476,6 +1477,9 @@ MODRET set_sftpoptions(cmd_rec *cmd) {
> > +     } else if (strcmp(cmd->argv[i], "NoExtensionNegotiation") =3D=3D =
0) {
> > +       opts |=3D SFTP_OPT_NO_EXT_INFO;
> > +
> > ++    } else if (strcmp(cmd->argv[i], "NoStrictKex") =3D=3D 0) {
> > ++      opts |=3D SFTP_OPT_NO_STRICT_KEX;
> > ++
> > +     } else {
> > +       CONF_ERROR(cmd, pstrcat(cmd->tmp_pool, ": unknown SFTPOption '"=
,
> > +         cmd->argv[i], "'", NULL));
> > +diff --git a/contrib/mod_sftp/mod_sftp.h.in b/contrib/mod_sftp/mod_sft=
p.h.in
> > +index 065981c31..adcf71276 100644
> > +--- a/contrib/mod_sftp/mod_sftp.h.in
> > ++++ b/contrib/mod_sftp/mod_sftp.h.in
> > +@@ -131,6 +131,7 @@
> > + #define SFTP_OPT_IGNORE_SFTP_SET_XATTRS               0x04000
> > + #define SFTP_OPT_INCLUDE_SFTP_TIMES           0x08000
> > + #define SFTP_OPT_NO_EXT_INFO                  0x10000
> > ++#define SFTP_OPT_NO_STRICT_KEX                        0x040000
> > +
> > + /* mod_sftp service flags */
> > + #define SFTP_SERVICE_FL_SFTP          0x0001
> > +diff --git a/contrib/mod_sftp/packet.c b/contrib/mod_sftp/packet.c
> > +index b0067ea80..d8c97e92b 100644
> > +--- a/contrib/mod_sftp/packet.c
> > ++++ b/contrib/mod_sftp/packet.c
> > +@@ -1742,6 +1742,18 @@ int sftp_ssh2_packet_rekey_set_size(off_t size)=
 {
> > +   return 0;
> > + }
> > +
> > ++uint32_t sftp_ssh2_packet_get_client_seqno(void) {
> > ++  return packet_client_seqno;
> > ++}
> > ++
> > ++void sftp_ssh2_packet_reset_client_seqno(void) {
> > ++  packet_client_seqno =3D 0;
> > ++}
> > ++
> > ++void sftp_ssh2_packet_reset_server_seqno(void) {
> > ++  packet_server_seqno =3D 0;
> > ++}
> > ++
> > + int sftp_ssh2_packet_send_version(void) {
> > +   if (!sent_version_id) {
> > +     int res;
> > +diff --git a/contrib/mod_sftp/packet.h b/contrib/mod_sftp/packet.h
> > +index a424e9b25..fe538cbd7 100644
> > +--- a/contrib/mod_sftp/packet.h
> > ++++ b/contrib/mod_sftp/packet.h
> > +@@ -1,6 +1,6 @@
> > + /*
> > +  * ProFTPD - mod_sftp packet IO
> > +- * Copyright (c) 2008-2020 TJ Saunders
> > ++ * Copyright (c) 2008-2023 TJ Saunders
> > +  *
> > +  * This program is free software; you can redistribute it and/or modi=
fy
> > +  * it under the terms of the GNU General Public License as published =
by
> > +@@ -107,6 +107,13 @@ int sftp_ssh2_packet_rekey_reset(void);
> > + int sftp_ssh2_packet_rekey_set_seqno(uint32_t);
> > + int sftp_ssh2_packet_rekey_set_size(off_t);
> > +
> > ++/* These are used for implementing the "strict KEX" mitigations of th=
e Terrapin
> > ++ * attack (Issue 1760).
> > ++ */
> > ++uint32_t sftp_ssh2_packet_get_client_seqno(void);
> > ++void sftp_ssh2_packet_reset_client_seqno(void);
> > ++void sftp_ssh2_packet_reset_server_seqno(void);
> > ++
> > + int sftp_ssh2_packet_send_version(void);
> > + int sftp_ssh2_packet_set_poll_timeout(int);
> > + int sftp_ssh2_packet_set_version(const char *);
> > +diff --git a/contrib/mod_sftp/tap.c b/contrib/mod_sftp/tap.c
> > +index 95f388e43..7eaf959e2 100644
> > +--- a/contrib/mod_sftp/tap.c
> > ++++ b/contrib/mod_sftp/tap.c
> > +@@ -1,6 +1,6 @@
> > + /*
> > +  * ProFTPD - mod_sftp traffic analysis protection
> > +- * Copyright (c) 2008-2016 TJ Saunders
> > ++ * Copyright (c) 2008-2023 TJ Saunders
> > +  *
> > +  * This program is free software; you can redistribute it and/or modi=
fy
> > +  * it under the terms of the GNU General Public License as published =
by
> > +@@ -149,7 +149,6 @@ static void set_policy_chance(struct sftp_tap_poli=
cy *policy) {
> > + }
> > +
> > + static void set_policy_timer(struct sftp_tap_policy *policy) {
> > +-
> > +   /* Start a timer which checks the last times we received and sent p=
ackets.
> > +    * From there, we may want to inject a TAP message, depending on th=
e
> > +    * policy.
> > +@@ -177,6 +176,16 @@ int sftp_tap_send_packet(void) {
> > +   int rnd;
> > +   unsigned int chance;
> > +
> > ++  /* Due to chances of violating client-side "strict KEX" Terrapin
> > ++   * mitigations, we will not send packets if we are in the middle of=
 a KEX.
> > ++   */
> > ++  if (!(sftp_sess_state & SFTP_SESS_STATE_HAVE_KEX) ||
> > ++      (sftp_sess_state & SFTP_SESS_STATE_REKEYING)) {
> > ++    pr_trace_msg(trace_channel, 11,
> > ++      "unwilling to send TAP packet during KEX");
> > ++    return 0;
> > ++  }
> > ++
> > +   if (!sftp_interop_supports_feature(SFTP_SSH2_FEAT_IGNORE_MSG)) {
> > +     pr_trace_msg(trace_channel, 3,
> > +       "unable to send TAP packet: IGNORE not supported by client");
> > +@@ -205,7 +214,7 @@ int sftp_tap_send_packet(void) {
> > +     struct ssh2_packet *pkt;
> > +     unsigned int max_datalen =3D 8192;
> > +
> > +-    if (curr_policy.max_datalen) {
> > ++    if (curr_policy.max_datalen > 0) {
> > +       max_datalen =3D curr_policy.max_datalen;
> > +     }
> > +
> > +@@ -246,15 +255,15 @@ int sftp_tap_send_packet(void) {
> > + int sftp_tap_set_policy(const char *policy) {
> > +   register unsigned int i;
> > +
> > +-  if (tap_pool) {
> > ++  if (tap_pool !=3D NULL) {
> > +
> > +     /* Special case: IFF the existing policy is 'none' AND the given
> > +      * policy is 'rogaway', just return.  The 'none' policy must have=
 been
> > +      * explicitly configured, and it should override the automatic us=
e of
> > +      * the 'rogaway' policy.
> > +      */
> > +-    if (strncmp(curr_policy.policy, "none", 5) =3D=3D 0 &&
> > +-        strncasecmp(policy, "rogaway", 8) =3D=3D 0) {
> > ++    if (strcasecmp(curr_policy.policy, "none") =3D=3D 0 &&
> > ++        strcasecmp(policy, "rogaway") =3D=3D 0) {
> > +       (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> > +         "'none' traffic policy explicitly configured, ignoring '%s' p=
olicy",
> > +         policy);
> > +@@ -278,7 +287,6 @@ int sftp_tap_set_policy(const char *policy) {
> > +     if (strcasecmp(tap_policies[i].policy, policy) =3D=3D 0) {
> > +       copy_policy(&curr_policy, &(tap_policies[i]));
> > +       set_policy_chance(&curr_policy);
> > +-      set_policy_timer(&curr_policy);
> > +       return 0;
> > +     }
> > +   }
> > +@@ -286,3 +294,7 @@ int sftp_tap_set_policy(const char *policy) {
> > +   errno =3D ENOENT;
> > +   return -1;
> > + }
> > ++
> > ++void sftp_tap_start_policy(void) {
> > ++  set_policy_timer(&curr_policy);
> > ++}
> > +diff --git a/contrib/mod_sftp/tap.h b/contrib/mod_sftp/tap.h
> > +index 4a4c065d2..312223595 100644
> > +--- a/contrib/mod_sftp/tap.h
> > ++++ b/contrib/mod_sftp/tap.h
> > +@@ -1,6 +1,6 @@
> > + /*
> > +  * ProFTPD - mod_sftp traffic analysis protection
> > +- * Copyright (c) 2008-2016 TJ Saunders
> > ++ * Copyright (c) 2008-2013 TJ Saunders
> > +  *
> > +  * This program is free software; you can redistribute it and/or modi=
fy
> > +  * it under the terms of the GNU General Public License as published =
by
> > +@@ -63,4 +63,7 @@ int sftp_tap_send_packet(void);
> > +  */
> > + int sftp_tap_set_policy(const char *);
> > +
> > ++/* Sets the configured TAP policy in motion. */
> > ++void sftp_tap_start_policy(void);
> > ++
> > + #endif /* MOD_SFTP_TAP_H */
> > +diff --git a/doc/contrib/mod_sftp.html b/doc/contrib/mod_sftp.html
> > +index 60c3436fa..cfc639d05 100644
> > +--- a/doc/contrib/mod_sftp.html
> > ++++ b/doc/contrib/mod_sftp.html
> > +@@ -1186,6 +1186,19 @@ The currently implemented options are:
> > +     <code>proftpd-1.3.7rc4</code>.
> > +   </li>
> > +
> > ++  <p>
> > ++  <li><code>NoStrictKex</code><br>
> > ++    <p>
> > ++    By default, <code>mod_sftp</code> will honor/support the OpenSSH
> > ++    "strict KEX" mode extension, "kex-strict-c-v00@openssh.com" and
> > ++    "kex-strict-s-v00@openssh.com".  Use this option to disable suppo=
rt for
> > ++    these custom OpenSSH extensions.
> > ++
> > ++    <p>
> > ++    <b>Note</b> that this option first appeared in
> > ++    <code>proftpd-1.3.9rc1</code>.
> > ++  </li>
> > ++
> > +   <p>
> > +   <li><code>OldProtocolCompat</code><br>
> > +     <p>
> > +@@ -2642,7 +2655,7 @@ deal with this issue, then, you can hopefully up=
grade to ProFTPD 1.3.6 or later,
> > + <p>
> > + <hr>
> > + <font size=3D2><b><i>
> > +-&copy; Copyright 2008-2021 TJ Saunders<br>
> > ++&copy; Copyright 2008-2023 TJ Saunders<br>
> > +  All Rights Reserved<br>
> > + </i></b></font>
> > + <hr>
> > +diff --git a/tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm b/tests/t/l=
ib/ProFTPD/Tests/Modules/mod_sftp.pm
> > +index b4bdf516b..8c2be5465 100644
> > +--- a/tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm
> > ++++ b/tests/t/lib/ProFTPD/Tests/Modules/mod_sftp.pm
> > +@@ -87,6 +87,11 @@ my $TESTS =3D {
> > +     test_class =3D> [qw(forking ssh2)],
> > +   },
> > +
> > ++  ssh2_ext_kex_strict_terrapin_issue1760 =3D> {
> > ++    order =3D> ++$order,
> > ++    test_class =3D> [qw(bug forking ssh2)],
> > ++  },
> > ++
> > +   ssh2_hostkey_rsa =3D> {
> > +     order =3D> ++$order,
> > +     test_class =3D> [qw(forking ssh2)],
> > +@@ -3885,6 +3890,218 @@ EOC
> > +   unlink($log_file);
> > + }
> > +
> > ++sub ssh2_ext_kex_strict_terrapin_issue1760 {
> > ++  my $self =3D shift;
> > ++  my $tmpdir =3D $self->{tmpdir};
> > ++  my $setup =3D test_setup($tmpdir, 'sftp');
> > ++
> > ++  my $rsa_host_key =3D File::Spec->rel2abs('t/etc/modules/mod_sftp/ss=
h_host_rsa_key');
> > ++  my $dsa_host_key =3D File::Spec->rel2abs('t/etc/modules/mod_sftp/ss=
h_host_dsa_key');
> > ++
> > ++  my $rsa_priv_key =3D File::Spec->rel2abs('t/etc/modules/mod_sftp/te=
st_rsa_key');
> > ++  my $rsa_pub_key =3D File::Spec->rel2abs('t/etc/modules/mod_sftp/tes=
t_rsa_key.pub');
> > ++  my $rsa_rfc4716_key =3D File::Spec->rel2abs('t/etc/modules/mod_sftp=
/authorized_rsa_keys');
> > ++
> > ++  my $authorized_keys =3D File::Spec->rel2abs("$tmpdir/.authorized_ke=
ys");
> > ++  unless (copy($rsa_rfc4716_key, $authorized_keys)) {
> > ++    die("Can't copy $rsa_rfc4716_key to $authorized_keys: $!");
> > ++  }
> > ++
> > ++  my $ssh_config =3D File::Spec->rel2abs("$tmpdir/ssh.conf");
> > ++  if (open(my $fh, "> $ssh_config")) {
> > ++    print $fh <<EOC;
> > ++HostKeyAlgorithms rsa-sha2-256
> > ++IdentityAgent none
> > ++PubkeyAcceptedKeyTypes rsa-sha2-256
> > ++EOC
> > ++    unless (close($fh)) {
> > ++      die("Can't write $ssh_config: $!");
> > ++    }
> > ++
> > ++  } else {
> > ++    die("Can't open $ssh_config: $!");
> > ++  }
> > ++
> > ++  my $batch_file =3D File::Spec->rel2abs("$tmpdir/sftp-batch.conf");
> > ++  if (open(my $fh, "> $batch_file")) {
> > ++    print $fh "ls -l\n";
> > ++
> > ++    unless (close($fh)) {
> > ++      die("Can't write $batch_file: $!");
> > ++    }
> > ++
> > ++  } else {
> > ++    die("Can't open $batch_file: $!");
> > ++  }
> > ++
> > ++  my $config =3D {
> > ++    PidFile =3D> $setup->{pid_file},
> > ++    ScoreboardFile =3D> $setup->{scoreboard_file},
> > ++    SystemLog =3D> $setup->{log_file},
> > ++    TraceLog =3D> $setup->{log_file},
> > ++    Trace =3D> 'ssh2:30 sftp:20 scp:20',
> > ++
> > ++    AuthUserFile =3D> $setup->{auth_user_file},
> > ++    AuthGroupFile =3D> $setup->{auth_group_file},
> > ++    AuthOrder =3D> 'mod_auth_file.c',
> > ++
> > ++    IfModules =3D> {
> > ++      'mod_delay.c' =3D> {
> > ++        DelayEngine =3D> 'off',
> > ++      },
> > ++
> > ++      'mod_sftp.c' =3D> [
> > ++        "SFTPEngine on",
> > ++        "SFTPLog $setup->{log_file}",
> > ++
> > ++        "SFTPHostKey $rsa_host_key",
> > ++        "SFTPHostKey $dsa_host_key",
> > ++
> > ++        "SFTPAuthorizedUserKeys file:~/.authorized_keys",
> > ++      ],
> > ++    },
> > ++  };
> > ++
> > ++  my ($port, $config_user, $config_group) =3D config_write($setup->{c=
onfig_file},
> > ++    $config);
> > ++
> > ++  # Open pipes, for use between the parent and child processes.  Spec=
ifically,
> > ++  # the child will indicate when it's done with its test by writing a=
 message
> > ++  # to the parent.
> > ++  my ($rfh, $wfh);
> > ++  unless (pipe($rfh, $wfh)) {
> > ++    die("Can't open pipe: $!");
> > ++  }
> > ++
> > ++  require Net::SSH2;
> > ++
> > ++  my $ex;
> > ++
> > ++  # Fork child
> > ++  $self->handle_sigchld();
> > ++  defined(my $pid =3D fork()) or die("Can't fork: $!");
> > ++  if ($pid) {
> > ++    eval {
> > ++      # We use OpenSSH-9.6p1 to test our "strict KEX" Terrapin mitiga=
tions.
> > ++      my $sftp =3D '/Users/tj/local/openssh-9.6p1/bin/sftp';
> > ++
> > ++      my @cmd =3D (
> > ++        $sftp,
> > ++        '-F',
> > ++        $ssh_config,
> > ++        '-oBatchMode=3Dyes',
> > ++        '-oCheckHostIP=3Dno',
> > ++        '-oCompression=3Dyes',
> > ++        "-oPort=3D$port",
> > ++        "-oIdentityFile=3D$rsa_priv_key",
> > ++        '-oPubkeyAuthentication=3Dyes',
> > ++        '-oStrictHostKeyChecking=3Dno',
> > ++        '-oUserKnownHostsFile=3D/dev/null',
> > ++        '-vvv',
> > ++        '-b',
> > ++        $batch_file,
> > ++        "$setup->{user}\@127.0.0.1",
> > ++      );
> > ++
> > ++      my $sftp_rh =3D IO::Handle->new();
> > ++      my $sftp_wh =3D IO::Handle->new();
> > ++      my $sftp_eh =3D IO::Handle->new();
> > ++
> > ++      $sftp_wh->autoflush(1);
> > ++
> > ++      sleep(1);
> > ++
> > ++      local $SIG{CHLD} =3D 'DEFAULT';
> > ++
> > ++      # Make sure that the perms on the priv key are what OpenSSH wan=
ts
> > ++      unless (chmod(0400, $rsa_priv_key)) {
> > ++        die("Can't set perms on $rsa_priv_key to 0400: $!");
> > ++      }
> > ++
> > ++      if ($ENV{TEST_VERBOSE}) {
> > ++        print STDERR "Executing: ", join(' ', @cmd), "\n";
> > ++      }
> > ++
> > ++      my $sftp_pid =3D open3($sftp_wh, $sftp_rh, $sftp_eh, @cmd);
> > ++      waitpid($sftp_pid, 0);
> > ++      my $exit_status =3D $?;
> > ++
> > ++      # Restore the perms on the priv key
> > ++      unless (chmod(0644, $rsa_priv_key)) {
> > ++        die("Can't set perms on $rsa_priv_key to 0644: $!");
> > ++      }
> > ++
> > ++      my ($res, $errstr);
> > ++      if ($exit_status >> 8 =3D=3D 0) {
> > ++        $errstr =3D join('', <$sftp_eh>);
> > ++        $res =3D 0;
> > ++
> > ++      } else {
> > ++        $errstr =3D join('', <$sftp_eh>);
> > ++        if ($ENV{TEST_VERBOSE}) {
> > ++          print STDERR "Stderr: $errstr\n";
> > ++        }
> > ++
> > ++        $res =3D 1;
> > ++      }
> > ++
> > ++      unless ($res =3D=3D 0) {
> > ++        die("Can't list files on server: $errstr");
> > ++      }
> > ++    };
> > ++    if ($@) {
> > ++      $ex =3D $@;
> > ++    }
> > ++
> > ++    $wfh->print("done\n");
> > ++    $wfh->flush();
> > ++
> > ++  } else {
> > ++    eval { server_wait($setup->{config_file}, $rfh) };
> > ++    if ($@) {
> > ++      warn($@);
> > ++      exit 1;
> > ++    }
> > ++
> > ++    exit 0;
> > ++  }
> > ++
> > ++  # Stop server
> > ++  server_stop($setup->{pid_file});
> > ++  $self->assert_child_ok($pid);
> > ++
> > ++  eval {
> > ++    if (open(my $fh, "< $setup->{log_file}")) {
> > ++      my $ok =3D 0;
> > ++
> > ++      while (my $line =3D <$fh>) {
> > ++        chomp($line);
> > ++
> > ++        if ($ENV{TEST_VERBOSE}) {
> > ++          print STDERR "# $line\n";
> > ++        }
> > ++
> > ++        if ($line =3D~ /client signaled strict KEX support/) {
> > ++          $ok =3D 1;
> > ++          last;
> > ++        }
> > ++      }
> > ++
> > ++      close($fh);
> > ++
> > ++      $self->assert($ok, test_msg("Did not see expected 'strict KEX' =
TraceLog message"));
> > ++
> > ++    } else {
> > ++      die("Can't read $setup->{log_file}: $!");
> > ++    }
> > ++  };
> > ++  if ($@) {
> > ++    $ex =3D $@;
> > ++  }
> > ++
> > ++  test_cleanup($setup->{log_file}, $ex);
> > ++}
> > ++
> > + sub ssh2_hostkey_rsa {
> > +   my $self =3D shift;
> > +   my $tmpdir =3D $self->{tmpdir};
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb =
b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
> > index 312fe24387..9bfe9aed03 100644
> > --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
> > +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
> > @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/proftpd/proftpd.git;bra=
nch=3D${BRANCH};protocol=3Dhttps
> >             file://proftpd.service \
> >             file://CVE-2023-51713.patch \
> >             file://CVE-2024-57392.patch \
> > +           file://CVE-2023-48795.patch \
> >             "
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#122386): https://lists.openembedded.org/g/openembed=
ded-devel/message/122386
> > Mute This Topic: https://lists.openembedded.org/mt/116681442/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

