Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AC1E7D0AB
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 21:34:53 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.8026.1695332086013086260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 14:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGPRmOMQ;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-57129417cecso816044eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 14:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695332085; x=1695936885; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9IyyznjDtwypDdmM0AfYZxpSmb2Cpz2+bopT+fgNls=;
        b=JGPRmOMQMMgcypAeMycXdY4DRJzvpoSXvwpmAjS3aQkkxm+MvftNEYhqd53t9sPaJR
         SyP04orALNlxCbx4OzZclSeH7n5+DDhN1MIJgn1MZfBQVsRhSYuTOICC2dVK8fG7hFh7
         q4HA/XDoE1t1D9ge9A/L+teQKb3keoJMUA0FJAoLXgfrJNXcLvdr/KDcXmuufrmeqqDC
         iUiWxY7Rl/oKag68Low9NxqGoJ5DTafnfkAevgafkFAItx4HtEfhUCEKtDl5vXx1YFbf
         hXkQCNXlENQysuDx8Vt8gK9YB8J7cwWlYftF2iJWgoaxFyn6diT9L1E40x6Cxk2XR2qD
         NCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695332085; x=1695936885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9IyyznjDtwypDdmM0AfYZxpSmb2Cpz2+bopT+fgNls=;
        b=BcXzok+EwmWy6CeBNmkgndT9qxSp1cY1kSGe2Ugd8x+7WxU+SPC92WhAcfAeflKaHx
         9TBvPchTc9ehNB3mqXjgpoeJDBPSKxADQgp2pRinI87ioMGe+Oqa7WqhkBObKn5yOjDG
         bYgPW+L7KQZlDYc5xaQ9sTPoR7RKxtDQl6XO2XtemdeffnpaCj1Xt/YC6+y5ZN4bXZg8
         YCCo6GyKQRqHrA9jCSkKmDv5gbVcIDchHknQP2g+u4RKJFsTTcQs/CjcCVjeTqAi3xh8
         2yQqgHMyCVqj6nP1uDOTYrAteTmhU4b0S0BBLIiOCDDeIA9PmDyF8VOI946FK3By/Nci
         OBsg==
X-Gm-Message-State: AOJu0YzYYt9SFw0zWTC8mkdIeINGLngkuOOEdyHR9eWy+fUumqdth27w
	k8WpNjmwdFZLTUXLRWRteVZVzyE8j1c9gFEEM4o=
X-Google-Smtp-Source: AGHT+IH99sRZR02QXrEYuWepGLcY/zhjZMRqrxvWwQqQuJs4GX3uOJAc60O8B7Pj2PWHNKYmc6tIJbwBFVERmrHXLqU=
X-Received: by 2002:a05:6870:1606:b0:1b4:4c6d:765c with SMTP id
 b6-20020a056870160600b001b44c6d765cmr576242oae.26.1695332084978; Thu, 21 Sep
 2023 14:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230921091109.6998-1-jonas.gorski@bisdn.de>
In-Reply-To: <20230921091109.6998-1-jonas.gorski@bisdn.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Sep 2023 14:34:18 -0700
Message-ID: <CAMKF1so8xbfMejCfV_2O8LjX6PyGqHZ_1Ooso6=6PeChsPV9mw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] frr: upgrade 8.4.4 -> 9.0.1
To: Jonas Gorski <jonas.gorski@bisdn.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 21:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105042

seeing a build error on AB

 | vtysh/vtysh_cmd.c:9:8: error: 'VTYSH_LIB' undeclared here (not in a
function); did you mean 'VTYSH_RIPD'?
  |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd_vtysh=
,
  |       |        ^~~~~~~~~
  | ./lib/command.h:250:27: note: in definition of macro 'DEFUN_CMD_ELEMENT=
'
  |   250 |                 .daemon =3D dnum,
                    \
  |       |                           ^~~~
  | ./lib/command.h:320:9: note: in expansion of macro 'DEFSH_ATTR'
  |   320 |         DEFSH_ATTR(daemon, cmdname, cmdstr, helpstr, 0)
  |       |         ^~~~~~~~~~
  | vtysh/vtysh_cmd.c:9:1: note: in expansion of macro 'DEFSH'
  |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd_vtysh=
,
  |       | ^~~~~
  | make[1]: *** [Makefile:10563: vtysh/vtysh_cmd.o] Error 1
  | make[1]: Leaving directory
'/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-li=
nux/frr/9.0.1/git'


See
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3155/step=
s/15/logs/stdio

On Thu, Sep 21, 2023 at 2:11=E2=80=AFAM Jonas Gorski <jonas.gorski@bisdn.de=
> wrote:
>
> Upgrade FRR to 9.0.1:
>
> * drop all existing patches since they are included in 9.0.1
> * add a patch fixing (harmless) error messages in log
> * license files moved to doc/licenses
> * protobuf-c-native (for protoc) and protobuf-c are now needed
>
> Changelogs:
> https://github.com/FRRouting/frr/releases/tag/frr-9.0.1
> https://github.com/FRRouting/frr/commit/31ed3dd753d62b5d8916998bc32814007=
e91364b
> https://github.com/FRRouting/frr/releases/tag/frr-9.0
> https://github.com/FRRouting/frr/commit/2863e7efbcd0cbfbd41d3be04c660d77d=
f65d0ea
>
> Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ---
> v1 -> v2:
>  * actually include the new patch
>
>  ...check-for-python-x.y-emded.pc-not-py.patch |  33 ------
>  ...-make-quiet-actually-suppress-output.patch |  58 ++++++++++
>  .../frr/frr/CVE-2023-3748.patch               |  54 ---------
>  .../frr/frr/CVE-2023-41358.patch              | 106 ------------------
>  .../frr/frr/CVE-2023-41360.patch              |  35 ------
>  .../frr/{frr_8.4.4.bb =3D> frr_9.0.1.bb}        |  15 +--
>  6 files changed, 64 insertions(+), 237 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-m4-ax_=
python.m4-check-for-python-x.y-emded.pc-not-py.patch
>  create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-tools-=
make-quiet-actually-suppress-output.patch
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-37=
48.patch
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41=
358.patch
>  delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41=
360.patch
>  rename meta-networking/recipes-protocols/frr/{frr_8.4.4.bb =3D> frr_9.0.=
1.bb} (91%)
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.=
m4-check-for-python-x.y-emded.pc-not-py.patch b/meta-networking/recipes-pro=
tocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.pa=
tch
> deleted file mode 100644
> index 872a67c7840b..000000000000
> --- a/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-chec=
k-for-python-x.y-emded.pc-not-py.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From a82d704b1ec6ece47b01d12e0e067d4b62b10894 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Wed, 9 Nov 2022 20:24:45 +0100
> -Subject: [PATCH] m4/ax_python.m4: check for python-x.y-emded.pc, not
> - python-x.y.pc
> -
> -Only the embed version includes necessary linker flags to link
> -with libpython.
> -
> -Upstream-Status: Backport
> -[https://github.com/FRRouting/frr/commit/a82d704b1ec6ece47b01d12e0e067d4=
b62b10894]
> -
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - m4/ax_python.m4 | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/m4/ax_python.m4 b/m4/ax_python.m4
> -index 91d12b99b..f5e603b96 100644
> ---- a/m4/ax_python.m4
> -+++ b/m4/ax_python.m4
> -@@ -206,7 +206,7 @@ AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
> -     AC_MSG_CHECKING([whether pkg-config python-${tryver} is available])
> -     unset PYTHON_CFLAGS
> -     unset PYTHON_LIBS
> --    pkg=3D"python-${tryver}"
> -+    pkg=3D"python-${tryver}-embed"
> -     pkg=3D"${pkg%-}"
> -     _PKG_CONFIG([PYTHON_CFLAGS], [cflags], [${pkg}])
> -     _PKG_CONFIG([PYTHON_LIBS], [libs], [${pkg}])
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr/0001-tools-make-qu=
iet-actually-suppress-output.patch b/meta-networking/recipes-protocols/frr/=
frr/0001-tools-make-quiet-actually-suppress-output.patch
> new file mode 100644
> index 000000000000..3e93cf3c474c
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/0001-tools-make-quiet-act=
ually-suppress-output.patch
> @@ -0,0 +1,58 @@
> +From 312d5ee1592f8c5b616d330233d1de2643f759e2 Mon Sep 17 00:00:00 2001
> +From: Jonas Gorski <jonas.gorski@bisdn.de>
> +Date: Thu, 14 Sep 2023 17:04:16 +0200
> +Subject: [PATCH] tools: make --quiet actually suppress output
> +
> +When calling daemon_stop() with --quiet and e.g. the pidfile is empty,
> +it won't return early since while "$fail" is set, "$2" is "--quiet", so
> +the if condition isn't met and it will continue executing, resulting
> +in error messages in the log:
> +
> +> Sep 14 14:48:33 localhost watchfrr[2085]: [YFT0P-5Q5YX] Forked backgro=
und command [pid 2086]: /usr/lib/frr/watchfrr.sh restart all
> +> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh:=
 line 216: kill: `': not a pid or valid job spec
> +> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh:=
 line 216: kill: `': not a pid or valid job spec
> +> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh:=
 line 216: kill: `': not a pid or valid job spec
> +
> +Fix this by moving the --quiet check into the block to log_failure_msg()=
,
> +and also add the check to all other invocations of log_*_msg() to make
> +--quiet properly suppress output.
> +
> +Fixes: 19a99d89f088 ("tools: suppress unuseful warnings during restartin=
g frr")
> +Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> +Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/312d5=
ee1592f8c5b616d330233d1de2643f759e2]
> +---
> + tools/frrcommon.sh.in | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/tools/frrcommon.sh.in b/tools/frrcommon.sh.in
> +index f1f70119097e..00b63a78e2bc 100755
> +--- a/tools/frrcommon.sh.in
> ++++ b/tools/frrcommon.sh.in
> +@@ -207,8 +207,8 @@ daemon_stop() {
> +       [ -z "$fail" -a -z "$pid" ] && fail=3D"pid file is empty"
> +       [ -n "$fail" ] || kill -0 "$pid" 2>/dev/null || fail=3D"pid $pid =
not running"
> +
> +-      if [ -n "$fail" ] && [ "$2" !=3D "--quiet" ]; then
> +-              log_failure_msg "Cannot stop $dmninst: $fail"
> ++      if [ -n "$fail" ]; then
> ++              [ "$2" =3D "--quiet" ] || log_failure_msg "Cannot stop $d=
mninst: $fail"
> +               return 1
> +       fi
> +
> +@@ -220,11 +220,11 @@ daemon_stop() {
> +               [ $(( cnt -=3D 1 )) -gt 0 ] || break
> +       done
> +       if kill -0 "$pid" 2>/dev/null; then
> +-              log_failure_msg "Failed to stop $dmninst, pid $pid still =
running"
> ++              [ "$2" =3D "--quiet" ] || log_failure_msg "Failed to stop=
 $dmninst, pid $pid still running"
> +               still_running=3D1
> +               return 1
> +       else
> +-              log_success_msg "Stopped $dmninst"
> ++              [ "$2" =3D "--quiet" ] || log_success_msg "Stopped $dmnin=
st"
> +               rm -f "$pidfile"
> +               return 0
> +       fi
> +--
> +2.42.0
> +
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patc=
h b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
> deleted file mode 100644
> index 4a8a7e1afdd8..000000000000
> --- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From e61593f2ded104c4c7f01eb93e2b404e93e0c560 Mon Sep 17 00:00:00 2001
> -From: harryreps <harryreps@gmail.com>
> -Date: Fri, 3 Mar 2023 23:17:14 +0000
> -Subject: [PATCH] babeld: fix #11808 to avoid infinite loops
> -
> -Replacing continue in loops to goto done so that index of packet buffer
> -increases.
> -
> -Signed-off-by: harryreps <harryreps@gmail.com>
> -
> -CVE: CVE-2023-3748
> -
> -Upstream-Status: Backport
> -[https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c443=
3fb5523d0]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - babeld/message.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/babeld/message.c b/babeld/message.c
> -index 7d45d91bf..2bf233796 100644
> ---- a/babeld/message.c
> -+++ b/babeld/message.c
> -@@ -439,7 +439,7 @@ parse_packet(const unsigned char *from, struct inter=
face *ifp,
> -                       debugf(BABEL_DEBUG_COMMON,
> -                              "Received Hello from %s on %s that does no=
t have all 0's in the unused section of flags, ignoring",
> -                              format_address(from), ifp->name);
> --                      continue;
> -+                      goto done;
> -               }
> -
> -               /*
> -@@ -451,7 +451,7 @@ parse_packet(const unsigned char *from, struct inter=
face *ifp,
> -                       debugf(BABEL_DEBUG_COMMON,
> -                              "Received Unicast Hello from %s on %s that=
 FRR is not prepared to understand yet",
> -                              format_address(from), ifp->name);
> --                      continue;
> -+                      goto done;
> -               }
> -
> -               DO_NTOHS(seqno, message + 4);
> -@@ -469,7 +469,7 @@ parse_packet(const unsigned char *from, struct inter=
face *ifp,
> -                       debugf(BABEL_DEBUG_COMMON,
> -                              "Received hello from %s on %s should be ig=
nored as that this version of FRR does not know how to properly handle inte=
rval =3D=3D 0",
> -                              format_address(from), ifp->name);
> --                      continue;
> -+                      goto done;
> -               }
> -
> -               changed =3D update_neighbour(neigh, seqno, interval);
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.pat=
ch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
> deleted file mode 100644
> index 59633ef69911..000000000000
> --- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From 9efd9a47db4f13ebf88c2ffe14301d7441bcb40d Mon Sep 17 00:00:00 2001
> -From: Donatas Abraitis <donatas@opensourcerouting.org>
> -Date: Tue, 22 Aug 2023 22:52:04 +0300
> -Subject: [PATCH 1/2] bgpd: Do not process NLRIs if the attribute length =
is
> - zero
> -
> -```
> -3  0x00007f423aa42476 in __GI_raise (sig=3Dsig@entry=3D11) at ../sysdeps=
/posix/raise.c:26
> -4  0x00007f423aef9740 in core_handler (signo=3D11, siginfo=3D0x7fffc414d=
eb0, context=3D<optimized out>) at lib/sigevent.c:246
> -5  <signal handler called>
> -6  0x0000564dea2fc71e in route_set_aspath_prepend (rule=3D0x564debd66d50=
, prefix=3D0x7fffc414ea30, object=3D0x7fffc414e400)
> -    at bgpd/bgp_routemap.c:2258
> -7  0x00007f423aeec7e0 in route_map_apply_ext (map=3D<optimized out>, pre=
fix=3Dprefix@entry=3D0x7fffc414ea30,
> -    match_object=3Dmatch_object@entry=3D0x7fffc414e400, set_object=3Dset=
_object@entry=3D0x7fffc414e400, pref=3Dpref@entry=3D0x0) at lib/routemap.c:=
2690
> -8  0x0000564dea2d277e in bgp_input_modifier (peer=3Dpeer@entry=3D0x7f423=
8f59010, p=3Dp@entry=3D0x7fffc414ea30, attr=3Dattr@entry=3D0x7fffc414e770,
> -    afi=3Dafi@entry=3DAFI_IP, safi=3Dsafi@entry=3DSAFI_UNICAST, rmap_nam=
e=3Drmap_name@entry=3D0x0, label=3D0x0, num_labels=3D0, dest=3D0x564debdd51=
30)
> -    at bgpd/bgp_route.c:1772
> -9  0x0000564dea2df762 in bgp_update (peer=3Dpeer@entry=3D0x7f4238f59010,=
 p=3Dp@entry=3D0x7fffc414ea30, addpath_id=3Daddpath_id@entry=3D0,
> -    attr=3D0x7fffc414eb50, afi=3Dafi@entry=3DAFI_IP, safi=3D<optimized o=
ut>, safi@entry=3DSAFI_UNICAST, type=3D9, sub_type=3D0, prd=3D0x0, label=3D=
0x0,
> -    num_labels=3D0, soft_reconfig=3D0, evpn=3D0x0) at bgpd/bgp_route.c:4=
374
> -10 0x0000564dea2e2047 in bgp_nlri_parse_ip (peer=3D0x7f4238f59010, attr=
=3Dattr@entry=3D0x7fffc414eb50, packet=3D0x7fffc414eaf0)
> -    at bgpd/bgp_route.c:6249
> -11 0x0000564dea2c5a58 in bgp_nlri_parse (peer=3Dpeer@entry=3D0x7f4238f59=
010, attr=3Dattr@entry=3D0x7fffc414eb50,
> -    packet=3Dpacket@entry=3D0x7fffc414eaf0, mp_withdraw=3Dmp_withdraw@en=
try=3Dfalse) at bgpd/bgp_packet.c:339
> -12 0x0000564dea2c5d66 in bgp_update_receive (peer=3Dpeer@entry=3D0x7f423=
8f59010, size=3Dsize@entry=3D109) at bgpd/bgp_packet.c:2024
> -13 0x0000564dea2c901d in bgp_process_packet (thread=3D<optimized out>) a=
t bgpd/bgp_packet.c:2933
> -14 0x00007f423af0bf71 in event_call (thread=3Dthread@entry=3D0x7fffc414e=
e40) at lib/event.c:1995
> -15 0x00007f423aebb198 in frr_run (master=3D0x564deb73c670) at lib/libfrr=
.c:1213
> -16 0x0000564dea261b83 in main (argc=3D<optimized out>, argv=3D<optimized=
 out>) at bgpd/bgp_main.c:505
> -```
> -
> -With the configuration:
> -
> -```
> -frr version 9.1-dev-MyOwnFRRVersion
> -frr defaults traditional
> -hostname ip-172-31-13-140
> -log file /tmp/debug.log
> -log syslog
> -service integrated-vtysh-config
> -!
> -debug bgp keepalives
> -debug bgp neighbor-events
> -debug bgp updates in
> -debug bgp updates out
> -!
> -router bgp 100
> - bgp router-id 9.9.9.9
> - no bgp ebgp-requires-policy
> - bgp bestpath aigp
> - neighbor 172.31.2.47 remote-as 200
> - !
> - address-family ipv4 unicast
> -  neighbor 172.31.2.47 default-originate
> -  neighbor 172.31.2.47 route-map RM_IN in
> - exit-address-family
> -exit
> -!
> -route-map RM_IN permit 10
> - set as-path prepend 200
> -exit
> -!
> -```
> -
> -The issue is that we try to process NLRIs even if the attribute length i=
s 0.
> -
> -Later bgp_update() will handle route-maps and a crash occurs because all=
 the
> -attributes are NULL, including aspath, where we dereference.
> -
> -According to the RFC 4271:
> -
> -A value of 0 indicates that neither the Network Layer
> -         Reachability Information field nor the Path Attribute field is
> -         present in this UPDATE message.
> -
> -But with a fuzzed UPDATE message this can be faked. I think it's reasona=
ble
> -to skip processing NLRIs if both update_len and attribute_len are 0.
> -
> -Reported-by: Iggy Frankovic <iggyfran@amazon.com>
> -Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> -
> -Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/28ccc=
24d38df1d51ed8a563507e5d6f6171fdd38]
> -
> -CVE: CVE-2023-41358
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - bgpd/bgp_packet.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
> -index ec54943f3..3c2e73c59 100644
> ---- a/bgpd/bgp_packet.c
> -+++ b/bgpd/bgp_packet.c
> -@@ -1951,7 +1951,7 @@ static int bgp_update_receive(struct peer *peer, b=
gp_size_t size)
> -       /* Network Layer Reachability Information. */
> -       update_len =3D end - stream_pnt(s);
> -
> --      if (update_len) {
> -+      if (update_len && attribute_len) {
> -               /* Set NLRI portion to structure. */
> -               nlris[NLRI_UPDATE].afi =3D AFI_IP;
> -               nlris[NLRI_UPDATE].safi =3D SAFI_UNICAST;
> ---
> -2.35.5
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.pat=
ch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
> deleted file mode 100644
> index 8ee3985b428b..000000000000
> --- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 9ecacf2176d2bac4b90e17d49facb8712c1b467a Mon Sep 17 00:00:00 2001
> -From: Donatas Abraitis <donatas@opensourcerouting.org>
> -Date: Sun, 20 Aug 2023 22:15:27 +0300
> -Subject: [PATCH 2/2] bgpd: Don't read the first byte of ORF header if we=
 are
> - ahead of stream
> -
> -Reported-by: Iggy Frankovic iggyfran@amazon.com
> -Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> -
> -Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/9b855=
a692e68e0d16467e190b466b4ecb6853702]
> -
> -CVE: CVE-2023-41360
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - bgpd/bgp_packet.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
> -index 3c2e73c59..f1d0e54c0 100644
> ---- a/bgpd/bgp_packet.c
> -+++ b/bgpd/bgp_packet.c
> -@@ -2375,7 +2375,8 @@ static int bgp_route_refresh_receive(struct peer *=
peer, bgp_size_t size)
> -                                * and 7 bytes of ORF Address-filter entr=
y from
> -                                * the stream
> -                                */
> --                              if (*p_pnt & ORF_COMMON_PART_REMOVE_ALL) =
{
> -+                              if (p_pnt < p_end &&
> -+                                  *p_pnt & ORF_COMMON_PART_REMOVE_ALL) =
{
> -                                       if (bgp_debug_neighbor_events(pee=
r))
> -                                               zlog_debug(
> -                                                       "%pBP rcvd Remove=
-All pfxlist ORF request",
> ---
> -2.35.5
> -
> diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta-ne=
tworking/recipes-protocols/frr/frr_9.0.1.bb
> similarity index 91%
> rename from meta-networking/recipes-protocols/frr/frr_8.4.4.bb
> rename to meta-networking/recipes-protocols/frr/frr_9.0.1.bb
> index 826b6878065c..b656d91a97c0 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_9.0.1.bb
> @@ -6,18 +6,15 @@ HOMEPAGE =3D "https://frrouting.org/"
>  SECTION =3D "net"
>
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> -                    file://COPYING-LGPLv2.1;md5=3D4fbd65380cdd2559510790=
08b364516c"
> +LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
> +                    file://doc/licenses/LGPL-2.1;md5=3D4fbd65380cdd25595=
1079008b364516c"
>
> -SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/8.4 \
> +SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/9.0 \
>             file://frr.pam \
> -           file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not=
-py.patch \
> -           file://CVE-2023-3748.patch \
> -           file://CVE-2023-41358.patch \
> -           file://CVE-2023-41360.patch \
> +           file://0001-tools-make-quiet-actually-suppress-output.patch \
>             "
>
> -SRCREV =3D "45e36c0c00a517ad1606135b18c5753e210cfc0d"
> +SRCREV =3D "31ed3dd753d62b5d8916998bc32814007e91364b"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "frr-(?P<pver>\d+(\.\d+)+)$"
>
> @@ -28,7 +25,7 @@ S =3D "${WORKDIR}/git"
>  inherit autotools-brokensep python3native pkgconfig useradd systemd
>
>  DEPENDS:class-native =3D "bison-native elfutils-native"
> -DEPENDS:class-target =3D "bison-native json-c readline c-ares libyang fr=
r-native"
> +DEPENDS:class-target =3D "bison-native json-c readline c-ares libyang fr=
r-native protobuf-c-native protobuf-c"
>
>  RDEPENDS:${PN}:class-target =3D "iproute2 python3-core bash"
>
> --
> 2.42.0
>
>
> --
> BISDN GmbH
> K=C3=B6rnerstra=C3=9Fe 7-10
> 10785 Berlin
> Germany
>
>
> Phone:
> +49-30-6108-1-6100
>
>
> Managing Directors:
> Dr.-Ing. Hagen Woesner, Andreas
> K=C3=B6psel
>
>
> Commercial register:
> Amtsgericht Berlin-Charlottenburg HRB 141569
> B
> VAT ID No: DE283257294
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105040): https://lists.openembedded.org/g/openembedde=
d-devel/message/105040
> Mute This Topic: https://lists.openembedded.org/mt/101496370/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

