Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504CFD2E00B
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 06:36:29 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.297.1764916581004614323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 22:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HWPRQkon;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-787ff3f462bso31881387b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 22:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764916580; x=1765521380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EqUE2H7IKkFIv4IXg3O1CRc++EI1H7jnQjfOK88Ur4M=;
        b=HWPRQkonhI1kZsi8T279GK+wr1L1dHNv1JNPbJFewzwKBZrhJeiVuGBTf99G7rrRnP
         UECFVsAHnFJY0M+CWuPWlVZoSH0giapTjaAe2nKzyDPNFlzlP7KpBY/mu3H6yZ0ZaW6E
         QwOZ2wTLEUGOb8SRdFWWOusTvMCYHP2MhZhyG46eOA6Nb0a2kZrr9xAijRAdkTR3f0P0
         YswFcTykSjteNJkes0Z8VdMfw+1YZoW3XbiOXSdxuMe3S9pWW/IPGL+8bTwFqorSYyFv
         cdy9jHcMHK7dwHxXm6qbIeLJ/1iJzce74fazl+7BKmwzqtpsAD/lSIMhmQui7pYtFYJy
         rvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764916580; x=1765521380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqUE2H7IKkFIv4IXg3O1CRc++EI1H7jnQjfOK88Ur4M=;
        b=ARFkNYAAkZlhsP2DPzPzyduX652GC9CSPQX5HmULL9ReizvTCv3b4Fj7bj3RL34DC1
         71euZUEJNutiPtiOzFAMuqQSxxBZpPOTTwyXElvq63MNnFEEkMr+S/jzwwJbYVAhtael
         Gn9B/Ktvs/ycc+PVKQ5oHXBhrfLBxZtaXsi+sCHSQV9XVaAZiEKqo7YPWmvXWKAYoaoi
         GtDkwA5Ca9qNaf20z7cDLMlb8JBYgh5aRUp4ImP/T2MIV5fOOaEfj3Owvf4lryZl50Xf
         Ij9AnmPz7o1lAcGGZiOmulLvPkmNwdiu23M0rgYs/xGpJP7YObbKOVsjBXjPqRAfodyo
         CanA==
X-Gm-Message-State: AOJu0YxC8nmCG9YXywGckSjCgl8SoMIwVCpLxox5VceTQokVxoXl1V+x
	XdQugZWeqCUZMlnBzZZQwau8WzgRGLHQq7Nui7RFZ/KE3YZA+UW7WInppU4dX2Ztx6qXF2OmHaW
	8IRBCmJ6J76PSRuvY3lVhjGqe0LhcKl5jj1ds
X-Gm-Gg: ASbGnctRJcV4tKTZ86qpurz242SDKykWw3mpnHXgXmq6IM0dNYkqp9LYcZZeCpsF36w
	s+ifxMx9Rd6tJY5UT1QVdTZSd/BWMgAUg65bp8YdSrWgX8sNOx+6cL+1USsI6QliSAnlDcrrCIY
	RSe/jpRZ4dqLr8SqeuUi2ETpAoFvCaDG7eslVI2Rq5qjidrsgV+gEKcSCPUoJs8ByqVQXgvuC/N
	n5yuBxs5YeNZzpiBaFWHswFLswcHmT0Ugty3p7ozGrGmotJLQBK9uP5dHKdMxpdv8Qsbhdu2xfp
	e1vMKelbZEZkx/HIVoa5YVlHWkhDdl8FpgklUxx2ryjprM2xrGCksoMY4yiCPHKbuFMBWOhxJXj
	YO/o0klkNP9MyWKBvzHxHEyMaTsMr3GWo/MSZKy3PVVY/7g==
X-Google-Smtp-Source: AGHT+IHxLPe5YY1fOx79zA/+W81b2zvQr/Kv4DdTJ2LYZ00oBDVvuFjRsGwb54RCbhsCr3VZ+rJ+R4xVQdOt72UORtc=
X-Received: by 2002:a05:690c:110:b0:789:509a:1c4d with SMTP id
 00721157ae682-78c171bcbb1mr50729357b3.15.1764916579978; Thu, 04 Dec 2025
 22:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20251205063116.2046197-1-vanusuri@mvista.com>
In-Reply-To: <20251205063116.2046197-1-vanusuri@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Dec 2025 22:35:53 -0800
X-Gm-Features: AWmQ_blnjyuqUVpajkt-jmTBsVm4F7xkMk0ijd6nHVoUJ6p50ANB6ecdRPOizH0
Message-ID: <CAMKF1speHDn2PGGDQo1wRZoycSdcRC=JgF-p8ESWOVmuViOcbQ@mail.gmail.com>
Subject: Re: [oe][meta-networking][patch] net-snmp: Fix systemstats_linux
 unexpected header length
To: vanusuri@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ced52706452ea972"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 06:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122336

--000000000000ced52706452ea972
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

if this is meant for master then please rebase it on top of latest master
or master-next and resend please.

On Thu, Dec 4, 2025 at 10:31=E2=80=AFPM Vijay Anusuri via lists.openembedde=
d.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> currently system journal contains:
>
> snmpd[10442]: systemstats_linux: unexpected header length in
> /proc/net/snmp. 237 !=3D 224
>
> Backport a patch to fix this issue.
>
> Upstream-Status: Backport [
> https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4=
425dab0982c
> ]
>
> Reference: https://github.com/net-snmp/net-snmp/issues/786
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...-compatibility-parsing-proc-net-snmp.patch | 122 ++++++++++++++++++
>  .../net-snmp/net-snmp_5.9.4.bb                |   1 +
>  2 files changed, 123 insertions(+)
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-co=
mpatibility-parsing-proc-net-snmp.patch
>
> diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-=
compatibility-parsing-proc-net-snmp.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-=
compatibility-parsing-proc-net-snmp.patch
> new file mode 100644
> index 0000000000..2d9c310e39
> --- /dev/null
> +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-=
compatibility-parsing-proc-net-snmp.patch
> @@ -0,0 +1,122 @@
> +From 49d60ba57f4b462df7dc5fd5b38b4425dab0982c Mon Sep 17 00:00:00 2001
> +From: Philippe Troin <phil+github-commits@fifi.org>
> +Date: Sat, 3 Feb 2024 10:30:30 -0800
> +Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
> +
> +Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
> +This breaks the hard-coded assumptions about the Ip line length.
> +Add compatibility to parse Linux 6.7 Ip header while keep support
> +for previous versions.
> +
> +Upstream-Status: Backport [
> https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4=
425dab0982c
> ]
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
> + 1 file changed, 37 insertions(+), 9 deletions(-)
> +
> +diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> +index 49e0a34d5c..f04e828a94 100644
> +--- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> ++++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> +@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)
> + }
> +
> + /*
> +-  /proc/net/snmp
> ++  /proc/net/snmp - Linux 6.6 and lower
> +
> +   Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors
> ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscar=
ds
> OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails
> FragCreates
> +   Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322 1 25992=
0
> 0 0
> +@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)
> +
> +   Udp: InDatagrams NoPorts InErrors OutDatagrams
> +   Udp: 1491094 122 0 1466178
> ++*
> ++  /proc/net/snmp - Linux 6.7 and higher
> ++
> ++  Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors
> ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscar=
ds
> OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails
> FragCreates OutTransmits
> ++  Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 7264
> 3632 0 3548 0 7096 44961424
> ++
> ++  Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds
> InParmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps
> InTimestampReps InAddrMasks InAddrMaskReps OutMsgs OutErrors
> OutRateLimitGlobal OutRateLimitHost OutDestUnreachs OutTimeExcds
> OutParmProbs OutSrcQuenchs OutRedirects OutEchos OutEchoReps OutTimestamp=
s
> OutTimestampReps OutAddrMasks OutAddrMaskReps
> ++  Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 572
> 16610 484 0 0 0 59957 66905 0 0 0 0
> ++
> ++  IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutType11
> ++  IcmpMsg: 29953 17589 66905 66905 16610 59957 484
> ++
> ++  Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens
> AttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs
> OutRsts InCsumErrors
> ++  Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 8
> 7442 0
> ++
> ++  Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors
> SndbufErrors InCsumErrors IgnoredMulti MemErrors
> ++  Udp: 2257832 1422 0 2252835 0 0 0 84 0
> ++
> ++  UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors
> SndbufErrors InCsumErrors IgnoredMulti MemErrors
> ++  UdpLite: 0 0 0 0 0 0 0 0 0
> + */
> +
> +
> +@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container, u_in=
t
> load_flags)
> +     FILE           *devin;
> +     char            line[1024];
> +     netsnmp_systemstats_entry *entry =3D NULL;
> +-    int             scan_count;
> ++    int             scan_count, expected_scan_count;
> +     char           *stats, *start =3D line;
> +     int             len;
> +-    unsigned long long scan_vals[19];
> ++    unsigned long long scan_vals[20];
> +
> +     DEBUGMSGTL(("access:systemstats:container:arch", "load v4 (flags
> %x)\n",
> +                 load_flags));
> +@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container, u_in=
t
> load_flags)
> +      */
> +     NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin));
> +     len =3D strlen(line);
> +-    if (224 !=3D len) {
> ++    switch (len) {
> ++    case 224:
> ++      expected_scan_count =3D 19;
> ++      break;
> ++    case 237:
> ++      expected_scan_count =3D 20;
> ++      break;
> ++    default:
> +         fclose(devin);
> +         snmp_log(LOG_ERR, "systemstats_linux: unexpected header length
> in /proc/net/snmp."
> +-                 " %d !=3D 224\n", len);
> ++                 " %d not in { 224, 237 } \n", len);
> +         return -4;
> +     }
> +
> +@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container, u_in=
t
> load_flags)
> +         memset(scan_vals, 0x0, sizeof(scan_vals));
> +         scan_count =3D sscanf(stats,
> +                             "%llu %llu %llu %llu %llu %llu %llu %llu
> %llu %llu"
> +-                            "%llu %llu %llu %llu %llu %llu %llu %llu
> %llu",
> ++                            "%llu %llu %llu %llu %llu %llu %llu %llu
> %llu %llu",
> +                             &scan_vals[0],&scan_vals[1],&scan_vals[2],
> +                             &scan_vals[3],&scan_vals[4],&scan_vals[5],
> +                             &scan_vals[6],&scan_vals[7],&scan_vals[8],
> +                             &scan_vals[9],&scan_vals[10],&scan_vals[11]=
,
> +                             &scan_vals[12],&scan_vals[13],&scan_vals[14=
],
> +                             &scan_vals[15],&scan_vals[16],&scan_vals[17=
],
> +-                            &scan_vals[18]);
> ++                            &scan_vals[18],&scan_vals[19]);
> +         DEBUGMSGTL(("access:systemstats", "  read %d values\n",
> scan_count));
> +
> +-        if(scan_count !=3D 19) {
> ++        if(scan_count !=3D expected_scan_count) {
> +             snmp_log(LOG_ERR,
> +                      "error scanning systemstats data (expected %d, got
> %d)\n",
> +-                     19, scan_count);
> ++                     expected_scan_count, scan_count);
> +             netsnmp_access_systemstats_entry_free(entry);
> +             return -4;
> +         }
> +@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int
> load_flags)
> +         entry->stats.HCOutFragFails.high =3D scan_vals[17] >> 32;
> +         entry->stats.HCOutFragCreates.low =3D scan_vals[18] & 0xfffffff=
f;
> +         entry->stats.HCOutFragCreates.high =3D scan_vals[18] >> 32;
> ++        /* entry->stats. =3D scan_vals[19]; / * OutTransmits */
> +
> +         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCINRECEIVES] =3D 1=
;
> +         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_INHDRERRORS] =3D 1;
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> index f9572a1869..4b24520019 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> @@ -28,6 +28,7 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>
> file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
>             file://0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch \
>             file://0001-Android-Fix-the-build.patch \
> +
>  file://0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch \
>            "
>  SRC_URI[sha256sum] =3D
> "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122335):
> https://lists.openembedded.org/g/openembedded-devel/message/122335
> Mute This Topic: https://lists.openembedded.org/mt/116626611/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ced52706452ea972
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">if this is meant for master then please rebase it on top o=
f latest master or master-next and resend please.</div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Dec 4, 2025 at 10:31=E2=80=AFPM Vijay Anusuri via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"m=
ailto:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">c=
urrently system journal contains:<br>
<br>
snmpd[10442]: systemstats_linux: unexpected header length in /proc/net/snmp=
. 237 !=3D 224<br>
<br>
Backport a patch to fix this issue.<br>
<br>
Upstream-Status: Backport [<a href=3D"https://github.com/net-snmp/net-snmp/=
commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7d=
c5fd5b38b4425dab0982c</a>]<br>
<br>
Reference: <a href=3D"https://github.com/net-snmp/net-snmp/issues/786" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/net-snmp/net-snmp/issu=
es/786</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0...-compatibility-parsing-proc-net-snmp.patch | 122 +++++++++++++++++=
+<br>
=C2=A0.../net-snmp/<a href=3D"http://net-snmp_5.9.4.bb" rel=3D"noreferrer" =
target=3D"_blank">net-snmp_5.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 123 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch<br>
<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-L=
inux-6.7-compatibility-parsing-proc-net-snmp.patch b/meta-networking/recipe=
s-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-compatibility-parsing-proc=
-net-snmp.patch<br>
new file mode 100644<br>
index 0000000000..2d9c310e39<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.=
7-compatibility-parsing-proc-net-snmp.patch<br>
@@ -0,0 +1,122 @@<br>
+From 49d60ba57f4b462df7dc5fd5b38b4425dab0982c Mon Sep 17 00:00:00 2001<br>
+From: Philippe Troin &lt;<a href=3D"mailto:phil%2Bgithub-commits@fifi.org"=
 target=3D"_blank">phil+github-commits@fifi.org</a>&gt;<br>
+Date: Sat, 3 Feb 2024 10:30:30 -0800<br>
+Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp<br>
+<br>
+Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.<br>
+This breaks the hard-coded assumptions about the Ip line length.<br>
+Add compatibility to parse Linux 6.7 Ip header while keep support<br>
+for previous versions.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/net-snmp/net-snmp=
/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7d=
c5fd5b38b4425dab0982c</a>]<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ .../ip-mib/data_access/systemstats_linux.c=C2=A0 =C2=A0 | 46 ++++++++++++=
+++----<br>
+ 1 file changed, 37 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent=
/mibgroup/ip-mib/data_access/systemstats_linux.c<br>
+index 49e0a34d5c..f04e828a94 100644<br>
+--- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c<br>
++++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c<br>
+@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)<br>
+ }<br>
+ <br>
+ /*<br>
+-=C2=A0 /proc/net/snmp<br>
++=C2=A0 /proc/net/snmp - Linux 6.6 and lower<br>
+ <br>
+=C2=A0 =C2=A0Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors=
 ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscard=
s OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails=
 FragCreates<br>
+=C2=A0 =C2=A0Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322=
 1 259920 0 0<br>
+@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)<br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0Udp: InDatagrams NoPorts InErrors OutDatagrams<br>
+=C2=A0 =C2=A0Udp: 1491094 122 0 1466178<br>
++*<br>
++=C2=A0 /proc/net/snmp - Linux 6.7 and higher<br>
++<br>
++=C2=A0 Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors Forw=
Datagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards Out=
NoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails Frag=
Creates OutTransmits<br>
++=C2=A0 Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 726=
4 3632 0 3548 0 7096 44961424<br>
++<br>
++=C2=A0 Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds InPa=
rmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps InTimestam=
pReps InAddrMasks InAddrMaskReps OutMsgs OutErrors OutRateLimitGlobal OutRa=
teLimitHost OutDestUnreachs OutTimeExcds OutParmProbs OutSrcQuenchs OutRedi=
rects OutEchos OutEchoReps OutTimestamps OutTimestampReps OutAddrMasks OutA=
ddrMaskReps<br>
++=C2=A0 Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 5=
72 16610 484 0 0 0 59957 66905 0 0 0 0<br>
++<br>
++=C2=A0 IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutTyp=
e11<br>
++=C2=A0 IcmpMsg: 29953 17589 66905 66905 16610 59957 484<br>
++<br>
++=C2=A0 Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens A=
ttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs OutRsts=
 InCsumErrors<br>
++=C2=A0 Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 =
8 7442 0<br>
++<br>
++=C2=A0 Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors Sndbuf=
Errors InCsumErrors IgnoredMulti MemErrors<br>
++=C2=A0 Udp: 2257832 1422 0 2252835 0 0 0 84 0<br>
++<br>
++=C2=A0 UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors Sn=
dbufErrors InCsumErrors IgnoredMulti MemErrors<br>
++=C2=A0 UdpLite: 0 0 0 0 0 0 0 0 0<br>
+ */<br>
+ <br>
+ <br>
+@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container, u_int =
load_flags)<br>
+=C2=A0 =C2=A0 =C2=A0FILE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*devin;<b=
r>
+=C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line[102=
4];<br>
+=C2=A0 =C2=A0 =C2=A0netsnmp_systemstats_entry *entry =3D NULL;<br>
+-=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_cou=
nt;<br>
++=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_cou=
nt, expected_scan_count;<br>
+=C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*stats, *=
start =3D line;<br>
+=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len=
;<br>
+-=C2=A0 =C2=A0 unsigned long long scan_vals[19];<br>
++=C2=A0 =C2=A0 unsigned long long scan_vals[20];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0DEBUGMSGTL((&quot;access:systemstats:container:arch&qu=
ot;, &quot;load v4 (flags %x)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load_flags))=
;<br>
+@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container, u_int =
load_flags)<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin)=
);<br>
+=C2=A0 =C2=A0 =C2=A0len =3D strlen(line);<br>
+-=C2=A0 =C2=A0 if (224 !=3D len) {<br>
++=C2=A0 =C2=A0 switch (len) {<br>
++=C2=A0 =C2=A0 case 224:<br>
++=C2=A0 =C2=A0 =C2=A0 expected_scan_count =3D 19;<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 237:<br>
++=C2=A0 =C2=A0 =C2=A0 expected_scan_count =3D 20;<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(devin);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snmp_log(LOG_ERR, &quot;systemstats_linu=
x: unexpected header length in /proc/net/snmp.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; %d !=
=3D 224\n&quot;, len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; %d n=
ot in { 224, 237 } \n&quot;, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -4;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container, u_int =
load_flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(scan_vals, 0x0, sizeof(scan_vals)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_count =3D sscanf(stats,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%llu %llu %llu %llu %llu %llu %llu %ll=
u %llu %llu&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%llu %llu %llu %llu %llu %llu %llu %llu %llu=
&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%llu %llu %llu %llu %llu %llu %llu %llu %llu=
 %llu&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;scan_vals[0],&amp;scan_vals[1],&amp;sca=
n_vals[2],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;scan_vals[3],&amp;scan_vals[4],&amp;sca=
n_vals[5],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;scan_vals[6],&amp;scan_vals[7],&amp;sca=
n_vals[8],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;scan_vals[9],&amp;scan_vals[10],&amp;sc=
an_vals[11],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;scan_vals[12],&amp;scan_vals[13],&amp;s=
can_vals[14],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;scan_vals[15],&amp;scan_vals[16],&amp;s=
can_vals[17],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;scan_vals[18]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;scan_vals[18],&amp;scan_vals[19]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEBUGMSGTL((&quot;access:systemstats&quo=
t;, &quot;=C2=A0 read %d values\n&quot;, scan_count));<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(scan_count !=3D 19) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(scan_count !=3D expected_scan_count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snmp_log(LOG_ERR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;error scanning systemstats data (expected %d, got %d)\n&quot;,<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A019, scan_count);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0expected_scan_count, scan_count);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netsnmp_access_systemstats=
_entry_free(entry);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int lo=
ad_flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;stats.HCOutFragFails.high =3D =
scan_vals[17] &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;stats.HCOutFragCreates.low =3D=
 scan_vals[18] &amp; 0xffffffff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;stats.HCOutFragCreates.high =
=3D scan_vals[18] &gt;&gt; 32;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* entry-&gt;stats. =3D scan_vals[19]; / * Ou=
tTransmits */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;stats.columnAvail[IPSYSTEMSTAT=
STABLE_HCINRECEIVES] =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;stats.columnAvail[IPSYSTEMSTAT=
STABLE_INHDRERRORS] =3D 1;<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://n=
et-snmp_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a=
> b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp_5=
.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a><br>
index f9572a1869..4b24520019 100644<br>
--- a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a><br>
+++ b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a><br>
@@ -28,6 +28,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/net-snmp/net-snmp=
-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0011-ac_add_search_path.m4=
-keep-consistent-between-32bit-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0012-Fix-configuration-of-=
NETSNMP_FD_MASK_TYPE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Android-Fix-the-build=
.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-Linux-6.7-compati=
bility-parsing-proc-net-snmp.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8b4de01391e74e3c7014beb43961a2d6d6fa03ac=
c34280b9585f4930745b0544&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122335): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122335" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122335</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116626611/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116626611/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ced52706452ea972--

