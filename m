Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.1859.1605913301834012176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 15:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wd5+3ODy;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id w14so9306357pfd.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 15:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=5BtH16xEC0xAKn5rmoujZTwOM+BDLWuI1zexexqkDNA=;
        b=Wd5+3ODyJKRZI7Ik+GPNYb/a0EzQGAnP4EORpSEb2WR0hrJ/1RWr1SqLfLP92WNHF8
         jlMm9/3+MdNlOMZOCDtkBvi63uWHfhF7tjP2xMb2wGZZJtKUI53x4e5XmoLsqWmU/pxv
         kto9H1x75q7MWdikGiJzM0fWyYm7wg+GQXkMgsgREdykiMzoZLCu3+cGIUUluBUjtM92
         tTIxRlkCR+h55QcvKDjbLGMArrtXzC5yYnxPxDcj1MAs6X1EiVnLVPSacV3JIdsYMm+1
         UPFM1zC0QxY6E4U+pYW5UkUIQf0QNhdcQ5ZSTYsjCeCC7LHcqjlJWFwJCeVvbWPwHJ6K
         RQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5BtH16xEC0xAKn5rmoujZTwOM+BDLWuI1zexexqkDNA=;
        b=Yj6YLYI+MGbTLfVuw2jgRUw3s9wxBX+yNSuYn5XNhagUOGTmDL7gNG9H31/M2xvJCs
         jTgS5A9wf17n0H+3Hpmnucu2I/lyQAXdC0R1ihN9DFdqBDdB3vpgEce9QQrTOS+AOtfR
         Y6noZi0aEGZuTwxi7Ycc0OxBMlAiYVwg7RpbUeUhspp9Riwn3N/uN6WHpkenkMRrWic4
         q5so2rnnc0c1bQDhIR/SBRbCOjscaAxAbTpUqraNfiplmtUmzxc9MW/d6FLqNMe1+/zj
         A3V84+8DENBSQfA7M9YvATJiNTLHv3UkhFFi3EZhqjYqinSHDfnMegG59lNCJS7XdmfZ
         u7gQ==
X-Gm-Message-State: AOAM530p3AUlcgCfPc9e34gNM1mdn9TnZckeqnJP/e0UQoxPW9HLG2ob
	SLWaNinuoRLrcHl441nvqbD17AmLU15Kvg==
X-Google-Smtp-Source: ABdhPJy0ds1ioecVMUQl334xC8VXyO6n7SvIVSW16laioo+kn7b/syzSK8/Mwo4jU5zA/I+pWM6Mlg==
X-Received: by 2002:a63:461b:: with SMTP id t27mr18310532pga.122.1605913300784;
        Fri, 20 Nov 2020 15:01:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::b756? ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id 145sm4262315pga.11.2020.11.20.15.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 15:01:40 -0800 (PST)
Subject: Re: [oe] [meta-networking][PATCH] unbound: convert to git based recipe and upgrade to 1.12.0
To: Beni <beniaminsandu@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201120222750.2809675-1-beniaminsandu@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <1929eb13-bf80-2806-bcbe-2423ce86faa0@gmail.com>
Date: Fri, 20 Nov 2020 15:01:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201120222750.2809675-1-beniaminsandu@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/20/20 2:27 PM, Beni wrote:
> We eliminate the need to rename the recipe file with every
> upgrade and also get better change history
> 

actually having version numbers in recipe name are helpful, or writing 
version specific bbappends, so lets keep the version string in recipe name.

> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>   ...rib-add-yocto-compatible-init-script.patch | 78 +++++++++++++++++++
>   ...add-yocto-compatible-startup-scripts.patch | 78 -------------------
>   .../{unbound_1.9.4.bb => unbound_git.bb}      |  6 +-
>   3 files changed, 82 insertions(+), 80 deletions(-)
>   create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
>   delete mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
>   rename meta-networking/recipes-support/unbound/{unbound_1.9.4.bb => unbound_git.bb} (92%)
> 
> diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> new file mode 100644
> index 000000000..7168a352f
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> @@ -0,0 +1,78 @@
> +From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Fri, 20 Nov 2020 23:00:20 +0200
> +Subject: [PATCH] contrib: add yocto compatible init script
> +
> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> +---
> + contrib/unbound.init | 20 ++++++++++----------
> + 1 file changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/contrib/unbound.init b/contrib/unbound.init
> +index c5bb52bb..4eba752b 100644
> +--- a/contrib/unbound.init
> ++++ b/contrib/unbound.init
> +@@ -19,11 +19,11 @@
> + ### END INIT INFO
> +
> + # Source function library.
> +-. /etc/rc.d/init.d/functions
> ++. /etc/init.d/functions
> +
> + exec="/usr/sbin/unbound"
> + prog="unbound"
> +-config="/var/unbound/unbound.conf"
> ++config="/etc/unbound/unbound.conf"
> + pidfile="/var/unbound/unbound.pid"
> + rootdir="/var/unbound"
> +
> +@@ -54,14 +54,14 @@ start() {
> + 	[ -e ${rootdir}/dev/log ] || touch ${rootdir}/dev/log
> + 	mount --bind -n /dev/log ${rootdir}/dev/log >/dev/null 2>&1;
> +     fi;
> +-    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
> ++    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
> + 	[ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev ;
> +-	[ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev/urandom
> +-	mount --bind -n /dev/urandom ${rootdir}/dev/urandom >/dev/null 2>&1;
> ++	[ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/random
> ++	mount --bind -n /dev/random ${rootdir}/dev/random >/dev/null 2>&1;
> +     fi;
> +
> +     # if not running, start it up here
> +-    daemon $exec
> ++    daemonize $exec
> +     retval=$?
> +     echo
> +     [ $retval -eq 0 ] && touch $lockfile
> +@@ -71,15 +71,15 @@ start() {
> + stop() {
> +     echo -n $"Stopping $prog: "
> +     # stop it here, often "killproc $prog"
> +-    killproc -p $pidfile $prog
> ++    killproc $prog
> +     retval=$?
> +     echo
> +     [ $retval -eq 0 ] && rm -f $lockfile
> +     if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/log' /proc/mounts; then
> + 	umount ${rootdir}/dev/log >/dev/null 2>&1
> +     fi;
> +-    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
> +-	umount ${rootdir}/dev/urandom >/dev/null 2>&1
> ++    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
> ++	umount ${rootdir}/dev/random >/dev/null 2>&1
> +     fi;
> +     return $retval
> + }
> +@@ -99,7 +99,7 @@ force_reload() {
> +
> + rh_status() {
> +     # run checks to determine if the service is running or use generic status
> +-    status -p $pidfile $prog
> ++    status $prog
> + }
> +
> + rh_status_q() {
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> deleted file mode 100644
> index 46f6a7b3f..000000000
> --- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Tue, 16 Jul 2019 19:59:23 +0300
> -Subject: [PATCH] contrib: add yocto compatible startup scripts
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> - contrib/unbound.init       | 10 +++++-----
> - contrib/unbound.service.in |  4 ++--
> - 2 files changed, 7 insertions(+), 7 deletions(-)
> - mode change 100644 => 100755 contrib/unbound.init
> -
> -diff --git a/contrib/unbound.init b/contrib/unbound.init
> -old mode 100644
> -new mode 100755
> -index cccadecc..4eba752b
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
> -@@ -61,7 +61,7 @@ start() {
> -     fi;
> -
> -     # if not running, start it up here
> --    daemon $exec
> -+    daemonize $exec
> -     retval=$?
> -     echo
> -     [ $retval -eq 0 ] && touch $lockfile
> -@@ -71,7 +71,7 @@ start() {
> - stop() {
> -     echo -n $"Stopping $prog: "
> -     # stop it here, often "killproc $prog"
> --    killproc -p $pidfile $prog
> -+    killproc $prog
> -     retval=$?
> -     echo
> -     [ $retval -eq 0 ] && rm -f $lockfile
> -@@ -99,7 +99,7 @@ force_reload() {
> -
> - rh_status() {
> -     # run checks to determine if the service is running or use generic status
> --    status -p $pidfile $prog
> -+    status $prog
> - }
> -
> - rh_status_q() {
> -diff --git a/contrib/unbound.service.in b/contrib/unbound.service.in
> -index 95976dd9..0e7f79a9 100644
> ---- a/contrib/unbound.service.in
> -+++ b/contrib/unbound.service.in
> -@@ -10,9 +10,9 @@ WantedBy=multi-user.target
> -
> - [Service]
> - ExecReload=/bin/kill -HUP $MAINPID
> --ExecStart=@UNBOUND_SBIN_DIR@/unbound
> -+ExecStart=@UNBOUND_SBIN_DIR@/unbound -d
> - NotifyAccess=main
> --Type=notify
> -+Type=simple
> - CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE
> - MemoryDenyWriteExecute=true
> - NoNewPrivileges=true
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb b/meta-networking/recipes-support/unbound/unbound_git.bb
> similarity index 92%
> rename from meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> rename to meta-networking/recipes-support/unbound/unbound_git.bb
> index 6200214ac..eeaf85344 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_git.bb
> @@ -10,9 +10,11 @@ LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
>   
>   SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
> -	file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
> +	file://0001-contrib-add-yocto-compatible-init-script.patch \
>   "
> -SRCREV="b60c4a472c856f0a98120b7259e991b3a6507eb5"
> +
> +PV = "1.12.0"
> +SRCREV="52b04806f4236c37acd10179ab465a54adc7e86a"
>   
>   inherit autotools pkgconfig systemd update-rc.d
>   
> 
> 
> 
> 
> 
