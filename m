Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1A2EE14C3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 17:54:03 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.5836.1694022838366598915
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 10:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=h1R32bg1;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-269304c135aso53428a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694022838; x=1694627638; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LoRtpDGC565lWAYVgV9qC7Ld0xuGmndp74eQ4cL2NsM=;
        b=h1R32bg1En5iJEV+8ZWXBrlWim8aT7FJ7+KQOg4rVQG735mECcHbVdMEQM7cD4zwEV
         juNGRnfvYiF418qXrZKpHEsPUNBQ6x8s8v74EZM8iXNvD0BnCqsUVBIvz9SVkEtfWixk
         7bcagDyQ162MCP1dAlolctfUM2nfBzwtNuKWPYDC3xwzO9b7JNrogr4pIJbrkQ2H1zXI
         lbUeCOrbcJaAgdZup1X7HssgCzCLirCZgAXh9r89xVuAfmzxExCbA+uvYfkjZJhDlW/y
         N5zFr28SZmWxwsa5dy8qMDiIQqc/yg6e8eJ8tUep+DbW6YWp0939HYHmOxUiwWdUSznq
         PL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694022838; x=1694627638;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoRtpDGC565lWAYVgV9qC7Ld0xuGmndp74eQ4cL2NsM=;
        b=V6gtwtyub6vF1Yc/MQ67uhvIikCk1Ny4n17jbuKuY0QMcr24YjtFTQcw4jwEzlxKcX
         CV66nJhOKLSMLz25QW2e/5AgyjPD/DJLYVC8a/cmKe6NJk7/JwOj8KbvU1UDZSMjOYms
         VPvRfoN5926iY12n5HjrUyZ1s/kRCQaM8ok8zI2JCA+78AKtmZBEwufpy4+4f3xQFsxe
         9U+MbiUkd0/EnsdSte1F7wxWOPo0z9PReMoJFqsemyo+L9Wdr+jixGio4wsatBunD8Ae
         V8wPzkNWefeg4B2LTsINJC3C9biqKmP88l4c5h4ZuvkHRPDVYGy634sAcgjeIpqDy5hd
         K1sw==
X-Gm-Message-State: AOJu0YyFMoVsk+HY/qiMxMqN8faVOc1oeXLs15vpoBO5ACb2ic9d7Tzu
	Omhvi1Vj8a7StwoknowMI1X/vAX4lwOq8G/y8i7k556jNJc=
X-Google-Smtp-Source: AGHT+IHv6JX6wYsdwrxtnw2FyPS7yDRve2RFcdRGdLTmMVizh0Q4d/T3n6YDONiZC074y5wWdHSQDH4beyt8doiukZ8=
X-Received: by 2002:a17:90a:e00b:b0:26d:2130:f63c with SMTP id
 u11-20020a17090ae00b00b0026d2130f63cmr16465505pjy.23.1694022837563; Wed, 06
 Sep 2023 10:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230901090433.1770836-1-beniaminsandu@gmail.com>
In-Reply-To: <20230901090433.1770836-1-beniaminsandu@gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Wed, 6 Sep 2023 20:53:46 +0300
Message-ID: <CABQJdOGB-Ru+4JfoePD9L2DAwNiiC=SX230z8BaHvO7uqfs6KA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: upgrade 1.17.1 -> 1.18.0
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 17:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104783

Unless there is an issue with my patch, I suggest you take mine in,
instead of this one
http://cgit.openembedded.org/meta-openembedded/commit/meta-networking?h=master-next&id=c7f303796b611700f30833da8b5479272304e610,
as it's also removing the extra patch that we have been keeping for
the init script.

On Fri, 1 Sept 2023 at 12:04, Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  ...rib-add-yocto-compatible-init-script.patch | 80 -------------------
>  .../{unbound_1.17.1.bb => unbound_1.18.0.bb}  |  8 +-
>  2 files changed, 3 insertions(+), 85 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
>  rename meta-networking/recipes-support/unbound/{unbound_1.17.1.bb => unbound_1.18.0.bb} (87%)
>
> diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> deleted file mode 100644
> index 7bcf97261..000000000
> --- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Fri, 20 Nov 2020 23:00:20 +0200
> -Subject: [PATCH] contrib: add yocto compatible init script
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - contrib/unbound.init | 20 ++++++++++----------
> - 1 file changed, 10 insertions(+), 10 deletions(-)
> -
> -diff --git a/contrib/unbound.init b/contrib/unbound.init
> -index c5bb52bb..4eba752b 100644
> ---- a/contrib/unbound.init
> -+++ b/contrib/unbound.init
> -@@ -19,11 +19,11 @@
> - ### END INIT INFO
> -
> - # Source function library.
> --. /etc/rc.d/init.d/functions
> -+. /etc/init.d/functions
> -
> - exec="/usr/sbin/unbound"
> - prog="unbound"
> --config="/var/unbound/unbound.conf"
> -+config="/etc/unbound/unbound.conf"
> - pidfile="/var/unbound/unbound.pid"
> - rootdir="/var/unbound"
> -
> -@@ -54,14 +54,14 @@ start() {
> -       [ -e ${rootdir}/dev/log ] || touch ${rootdir}/dev/log
> -       mount --bind -n /dev/log ${rootdir}/dev/log >/dev/null 2>&1;
> -     fi;
> --    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
> -+    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
> -       [ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev ;
> --      [ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev/urandom
> --      mount --bind -n /dev/urandom ${rootdir}/dev/urandom >/dev/null 2>&1;
> -+      [ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/random
> -+      mount --bind -n /dev/random ${rootdir}/dev/random >/dev/null 2>&1;
> -     fi;
> -
> -     # if not running, start it up here
> --    daemon $exec
> -+    daemonize $exec
> -     retval=$?
> -     echo
> -     [ $retval -eq 0 ] && touch $lockfile
> -@@ -71,15 +71,15 @@ start() {
> - stop() {
> -     echo -n $"Stopping $prog: "
> -     # stop it here, often "killproc $prog"
> --    killproc -p $pidfile $prog
> -+    killproc $prog
> -     retval=$?
> -     echo
> -     [ $retval -eq 0 ] && rm -f $lockfile
> -     if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/log' /proc/mounts; then
> -       umount ${rootdir}/dev/log >/dev/null 2>&1
> -     fi;
> --    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
> --      umount ${rootdir}/dev/urandom >/dev/null 2>&1
> -+    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
> -+      umount ${rootdir}/dev/random >/dev/null 2>&1
> -     fi;
> -     return $retval
> - }
> -@@ -99,7 +99,7 @@ force_reload() {
> -
> - rh_status() {
> -     # run checks to determine if the service is running or use generic status
> --    status -p $pidfile $prog
> -+    status $prog
> - }
> -
> - rh_status_q() {
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
> similarity index 87%
> rename from meta-networking/recipes-support/unbound/unbound_1.17.1.bb
> rename to meta-networking/recipes-support/unbound/unbound_1.18.0.bb
> index ff3d879ea..179af8050 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
> @@ -9,10 +9,8 @@ SECTION = "net"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
>
> -SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
> -       file://0001-contrib-add-yocto-compatible-init-script.patch \
> -"
> -SRCREV = "90831af981221bbce1cd7b15055562336760e484"
> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master"
> +SRCREV = "3795e374107ac7a5a977c516e144a3cd9b0da998"
>
>  inherit autotools pkgconfig systemd update-rc.d
>
> @@ -39,7 +37,7 @@ do_install:append() {
>         install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
>
>         install -d ${D}${sysconfdir}/init.d
> -       install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
> +       install -m 0755 ${S}/contrib/unbound.init_yocto ${D}${sysconfdir}/init.d/unbound
>  }
>
>  SYSTEMD_SERVICE:${PN} = "${BPN}.service"
> --
> 2.25.1
>

