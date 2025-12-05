Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681D5D2E011
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 07:05:59 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.550.1764918350798255050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 23:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CP/WiXYK;
 spf=pass (domain: mvista.com, ip: 209.85.208.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso2922133a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 23:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1764918349; x=1765523149; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Pi4DcUAuY46IFZrhIuF9JdeSh96KSQDtvroSj+gTd4=;
        b=CP/WiXYKbkGdsDnRJJHFcFcyyB9tzSRCDwd5JQVX2RuxP3hHAg0YwiZqUOL9gL9M5b
         aJNOaav8X+2b5L5OouQ6j0rlCwqeBw1H+4oHg5JN8qM2DEr0fmRvcc3+KfJZ4wqwMXfF
         032YSZ9IgA0krYlODuHdnQ57b+E6rjiomhUYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764918349; x=1765523149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Pi4DcUAuY46IFZrhIuF9JdeSh96KSQDtvroSj+gTd4=;
        b=Cg/MXsvHVFkh/GdIHroptQbPRwn4UrUPBdYYjIu8XxaHn1w5J0uJcXbY5bfw1nr1qr
         ojVMvZXCc0x5phQkT0xYfwY4owrfINoCLwlMoqGrfYm5HW/38zyUTmDvzkQXqSk4nPjL
         OLFxwutK4nr6zx3UPuNnEkqx5SRqrywQ+FxMIZh5Ia8X2LT9XcPIc3YlS/irZboMVQ7H
         eRuQ3z0W7a64ba6IIZvz/O+2alpIq8MGdYJ7moPgTnUjPwMyKrK03cmycGdoJj+9Uk1D
         CYpRDzZUyBCcGJ9xQTVFGg/m6iqeUzzCi4XkYOj/49ZWcWAyRWV+WZn7hkHxVLunPPFZ
         69uw==
X-Gm-Message-State: AOJu0Yyfy+4aL2xoZIbu1bGXg7HxX7rpkmK4agZ6Bh96mFuZRS6l3miY
	XRn7L6D8QDpwu/FEg2cEjQskXKVn/xnE4prZMbz560kqggdOOHiGZ3fNWYli0t1jkFvsVH8D2oj
	LeMHdVXQEhdNoJ/O7O8Xs7nq0Q1r0XYLlTgcrbcl91Q==
X-Gm-Gg: ASbGncuutFUMLoEijZ0gcIdG3BYdD/XPBfQO0eLoGplwYYRQxs3zBsY81AR3rAlGiBZ
	hQkey4ZulIQBQG/bYDF7TbK4YUM5QJxzH+9+yfpEhu+/GT8a73uzls3ke/t9rLqSJBW8Rb9S35F
	IGfPPCeBVSV7SvX0HJ6LhGw9eeTLFvnThESKjMbS9LKgzetLeflsmWImFZUhUkeq2VYygqrzoLr
	W8bJBpMjkbHSkrCdk7qwhj7FHbO+js5REOYptc90ZpXI8TtFQgYmTCNEbUpiu6NNwjgs4M+6w60
	YQvLp0/bLjGsKqzD09VguOS67w==
X-Google-Smtp-Source: AGHT+IGB3SkEfj3c3ddxt73GoGWf6JCiCA25aU6UCSDprrgAtGey/OSF78VjvTVot16r0lqTsY6DuzcZ3V1qs2hs2eQ=
X-Received: by 2002:a05:6402:3550:b0:647:b4cf:b4ff with SMTP id
 4fb4d7f45d1cf-647b4cfb87cmr3803150a12.17.1764918348369; Thu, 04 Dec 2025
 23:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20251205063116.2046197-1-vanusuri@mvista.com> <CAMKF1speHDn2PGGDQo1wRZoycSdcRC=JgF-p8ESWOVmuViOcbQ@mail.gmail.com>
In-Reply-To: <CAMKF1speHDn2PGGDQo1wRZoycSdcRC=JgF-p8ESWOVmuViOcbQ@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 5 Dec 2025 12:35:36 +0530
X-Gm-Features: AQt7F2qyrBCl8J-atJ9k9xScbeGVJfmf-ELTXBgfzoVUv5he-qh3pQozAwvduGw
Message-ID: <CANQUz1_Y6q8kZWcMqm0jtrgXypfw9dbiVPRbLMPL_XeMe-k9_g@mail.gmail.com>
Subject: Re: [oe][meta-networking][patch] net-snmp: Fix systemstats_linux
 unexpected header length
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000365cac06452f13cc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 07:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122337

--000000000000365cac06452f13cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

This patch is intended for the *scarthgap* branch. The issue has already
been addressed in *master* by the following commit:

https://git.openembedded.org/meta-openembedded/commit/?id=3D8147a884c68d8fd=
d89939a8443a902b65297520c

Thanks & Regards,
Vijay

On Fri, Dec 5, 2025 at 12:06=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> if this is meant for master then please rebase it on top of latest master
> or master-next and resend please.
>
> On Thu, Dec 4, 2025 at 10:31=E2=80=AFPM Vijay Anusuri via lists.openembed=
ded.org
> <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
>
>> currently system journal contains:
>>
>> snmpd[10442]: systemstats_linux: unexpected header length in
>> /proc/net/snmp. 237 !=3D 224
>>
>> Backport a patch to fix this issue.
>>
>> Upstream-Status: Backport [
>> https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b=
4425dab0982c
>> ]
>>
>> Reference: https://github.com/net-snmp/net-snmp/issues/786
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  ...-compatibility-parsing-proc-net-snmp.patch | 122 ++++++++++++++++++
>>  .../net-snmp/net-snmp_5.9.4.bb                |   1 +
>>  2 files changed, 123 insertions(+)
>>  create mode 100644
>> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-c=
ompatibility-parsing-proc-net-snmp.patch
>>
>> diff --git
>> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7=
-compatibility-parsing-proc-net-snmp.patch
>> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7=
-compatibility-parsing-proc-net-snmp.patch
>> new file mode 100644
>> index 0000000000..2d9c310e39
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7=
-compatibility-parsing-proc-net-snmp.patch
>> @@ -0,0 +1,122 @@
>> +From 49d60ba57f4b462df7dc5fd5b38b4425dab0982c Mon Sep 17 00:00:00 2001
>> +From: Philippe Troin <phil+github-commits@fifi.org>
>> +Date: Sat, 3 Feb 2024 10:30:30 -0800
>> +Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
>> +
>> +Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
>> +This breaks the hard-coded assumptions about the Ip line length.
>> +Add compatibility to parse Linux 6.7 Ip header while keep support
>> +for previous versions.
>> +
>> +Upstream-Status: Backport [
>> https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b=
4425dab0982c
>> ]
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
>> + 1 file changed, 37 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
>> b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
>> +index 49e0a34d5c..f04e828a94 100644
>> +--- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
>> ++++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
>> +@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)
>> + }
>> +
>> + /*
>> +-  /proc/net/snmp
>> ++  /proc/net/snmp - Linux 6.6 and lower
>> +
>> +   Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors
>> ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDisca=
rds
>> OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFail=
s
>> FragCreates
>> +   Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322 1
>> 259920 0 0
>> +@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)
>> +
>> +   Udp: InDatagrams NoPorts InErrors OutDatagrams
>> +   Udp: 1491094 122 0 1466178
>> ++*
>> ++  /proc/net/snmp - Linux 6.7 and higher
>> ++
>> ++  Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors
>> ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDisca=
rds
>> OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFail=
s
>> FragCreates OutTransmits
>> ++  Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 7264
>> 3632 0 3548 0 7096 44961424
>> ++
>> ++  Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds
>> InParmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps
>> InTimestampReps InAddrMasks InAddrMaskReps OutMsgs OutErrors
>> OutRateLimitGlobal OutRateLimitHost OutDestUnreachs OutTimeExcds
>> OutParmProbs OutSrcQuenchs OutRedirects OutEchos OutEchoReps OutTimestam=
ps
>> OutTimestampReps OutAddrMasks OutAddrMaskReps
>> ++  Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 572
>> 16610 484 0 0 0 59957 66905 0 0 0 0
>> ++
>> ++  IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutType1=
1
>> ++  IcmpMsg: 29953 17589 66905 66905 16610 59957 484
>> ++
>> ++  Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens
>> AttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs
>> OutRsts InCsumErrors
>> ++  Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 8
>> 7442 0
>> ++
>> ++  Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors
>> SndbufErrors InCsumErrors IgnoredMulti MemErrors
>> ++  Udp: 2257832 1422 0 2252835 0 0 0 84 0
>> ++
>> ++  UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors
>> SndbufErrors InCsumErrors IgnoredMulti MemErrors
>> ++  UdpLite: 0 0 0 0 0 0 0 0 0
>> + */
>> +
>> +
>> +@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container,
>> u_int load_flags)
>> +     FILE           *devin;
>> +     char            line[1024];
>> +     netsnmp_systemstats_entry *entry =3D NULL;
>> +-    int             scan_count;
>> ++    int             scan_count, expected_scan_count;
>> +     char           *stats, *start =3D line;
>> +     int             len;
>> +-    unsigned long long scan_vals[19];
>> ++    unsigned long long scan_vals[20];
>> +
>> +     DEBUGMSGTL(("access:systemstats:container:arch", "load v4 (flags
>> %x)\n",
>> +                 load_flags));
>> +@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container,
>> u_int load_flags)
>> +      */
>> +     NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin));
>> +     len =3D strlen(line);
>> +-    if (224 !=3D len) {
>> ++    switch (len) {
>> ++    case 224:
>> ++      expected_scan_count =3D 19;
>> ++      break;
>> ++    case 237:
>> ++      expected_scan_count =3D 20;
>> ++      break;
>> ++    default:
>> +         fclose(devin);
>> +         snmp_log(LOG_ERR, "systemstats_linux: unexpected header length
>> in /proc/net/snmp."
>> +-                 " %d !=3D 224\n", len);
>> ++                 " %d not in { 224, 237 } \n", len);
>> +         return -4;
>> +     }
>> +
>> +@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container,
>> u_int load_flags)
>> +         memset(scan_vals, 0x0, sizeof(scan_vals));
>> +         scan_count =3D sscanf(stats,
>> +                             "%llu %llu %llu %llu %llu %llu %llu %llu
>> %llu %llu"
>> +-                            "%llu %llu %llu %llu %llu %llu %llu %llu
>> %llu",
>> ++                            "%llu %llu %llu %llu %llu %llu %llu %llu
>> %llu %llu",
>> +                             &scan_vals[0],&scan_vals[1],&scan_vals[2],
>> +                             &scan_vals[3],&scan_vals[4],&scan_vals[5],
>> +                             &scan_vals[6],&scan_vals[7],&scan_vals[8],
>> +                             &scan_vals[9],&scan_vals[10],&scan_vals[11=
],
>> +
>>  &scan_vals[12],&scan_vals[13],&scan_vals[14],
>> +
>>  &scan_vals[15],&scan_vals[16],&scan_vals[17],
>> +-                            &scan_vals[18]);
>> ++                            &scan_vals[18],&scan_vals[19]);
>> +         DEBUGMSGTL(("access:systemstats", "  read %d values\n",
>> scan_count));
>> +
>> +-        if(scan_count !=3D 19) {
>> ++        if(scan_count !=3D expected_scan_count) {
>> +             snmp_log(LOG_ERR,
>> +                      "error scanning systemstats data (expected %d, go=
t
>> %d)\n",
>> +-                     19, scan_count);
>> ++                     expected_scan_count, scan_count);
>> +             netsnmp_access_systemstats_entry_free(entry);
>> +             return -4;
>> +         }
>> +@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int
>> load_flags)
>> +         entry->stats.HCOutFragFails.high =3D scan_vals[17] >> 32;
>> +         entry->stats.HCOutFragCreates.low =3D scan_vals[18] & 0xffffff=
ff;
>> +         entry->stats.HCOutFragCreates.high =3D scan_vals[18] >> 32;
>> ++        /* entry->stats. =3D scan_vals[19]; / * OutTransmits */
>> +
>> +         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCINRECEIVES] =3D =
1;
>> +         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_INHDRERRORS] =3D 1=
;
>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.b=
b
>> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> index f9572a1869..4b24520019 100644
>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> @@ -28,6 +28,7 @@ SRC_URI =3D
>> "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>>
>> file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
>>             file://0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch =
\
>>             file://0001-Android-Fix-the-build.patch \
>> +
>>  file://0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch \
>>            "
>>  SRC_URI[sha256sum] =3D
>> "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
>>
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#122335):
>> https://lists.openembedded.org/g/openembedded-devel/message/122335
>> Mute This Topic: https://lists.openembedded.org/mt/116626611/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000365cac06452f13cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Khem,<br><br>This patch is intended for the <=
em>scarthgap</em> branch. The issue has already been addressed in <em>maste=
r</em> by the following commit:<br><br><a href=3D"https://git.openembedded.=
org/meta-openembedded/commit/?id=3D8147a884c68d8fdd89939a8443a902b65297520c=
">https://git.openembedded.org/meta-openembedded/commit/?id=3D8147a884c68d8=
fdd89939a8443a902b65297520c</a><br><br></div>Thanks &amp; Regards,<br></div=
>Vijay</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Dec 5, 2025 at 12:06=E2=80=AFPM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr">if this is meant for master then please rebase it on top of latest ma=
ster or master-next and resend please.</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 4, 2025 at 10:31=E2=80=AF=
PM Vijay Anusuri via <a href=3D"http://lists.openembedded.org" target=3D"_b=
lank">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.co=
m@lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">currently system journal contains:<br>
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
</blockquote></div>

--000000000000365cac06452f13cc--

