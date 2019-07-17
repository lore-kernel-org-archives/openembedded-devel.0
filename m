Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADE67ECA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 06:56:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id p17so23439168wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 23:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=9Rl9Ua3MbR3Oe8weEwdZx93mMGux+yqo9Rai+S0eysg=;
	b=CvodgTCw7NlMmvJ/Aoc6dn9gom/c/n+zEBE3xcAnfk6eD9ptDRvXXViX3HBquPz2vH
	YLPwpJl0Te3/kII7QsfBi4nzsPYje+DLohKbjgMElQMW3ORLAQ0uXiQ/NJUhF9WaZnNh
	/bxyNNPosuGIrdKJE3D7KZg5CWdSighkOp/hpoWfFYVjDYQwUIe01mX4Jsvptf0rNKWy
	HJoOvnFtN9O+cIx2UjaZQLhR5sTsdGpt7GoagIVSF3diPY/HCHE/o09t27+rToJiEuwO
	kdHwDz+hDtb9qeKAfNQd2flpj0Eazfdrr3zAwdTjzoygSzmnvF3ZUwmpBI08x6QFFyua
	U2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9Rl9Ua3MbR3Oe8weEwdZx93mMGux+yqo9Rai+S0eysg=;
	b=dHow9drnut3XlEjSMJIUtSpnyUgjmBp/p+pQpxvBzpEeZiR+3d7RTYJK1mevYq/WmA
	iTlRo3cnjvndnnTDdT56NcbPRiuajI3JR7hKu2fYpzAgpHFZSl+pLOOFIO1tNXJQmZol
	VxcEg6iL48Uhx1AvySgF+HRa7qM10wodKC1Z34JZdQClDOuGAKCMKZdAKA98m57Krkqs
	NuwbzmNSJMKVvzjE5RI7e/KH3AzZ6J4e8KlmCRnTtE6xBA923113JmJPy76mEoxZM2xP
	HPTOEeY56A1vpLJekGAQqlGUzX9iSul2x9/9aFezXVwuFkBfB1fKs2JD/0KPK6owmvq0
	IbZg==
X-Gm-Message-State: APjAAAUFUspCgMwkzwkDuLTWzph9PWDn9tlOEe2qUf6eROGMvOscY/7Z
	/8NmLscS18IKpkqz54Dy03XDzZYbKkc=
X-Google-Smtp-Source: APXvYqyThuqKNYzTWl7/XwkgyXe+d5aWa+7KtAJYOnrywpDMInIosvNOemCF/n6Hi/o17UjF1RbF7A==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr23512730wre.241.1563346571009;
	Tue, 16 Jul 2019 23:56:11 -0700 (PDT)
Received: from [128.224.124.141] ([89.121.200.102])
	by smtp.googlemail.com with ESMTPSA id
	k63sm29150467wmb.2.2019.07.16.23.56.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jul 2019 23:56:09 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190716171213.7862-1-beniaminsandu@gmail.com>
	<CAMKF1srzgyhLcON-ruzi7KWeX_kzWJiBzxkpe1LHQEPtXnJEhQ@mail.gmail.com>
From: Ben <beniaminsandu@gmail.com>
Message-ID: <87494f07-feae-f9aa-fb86-0769e547a524@gmail.com>
Date: Wed, 17 Jul 2019 09:56:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1srzgyhLcON-ruzi7KWeX_kzWJiBzxkpe1LHQEPtXnJEhQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jul 2019 06:56:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks, will send a v2.

On 7/17/19 7:46 AM, Khem Raj wrote:
> fails to build on mips
>
> https://errors.yoctoproject.org/Errors/Details/252371/
>
> On Tue, Jul 16, 2019 at 10:12 AM Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>> ---
>>   ...add-yocto-compatible-startup-scripts.patch | 78 +++++++++++++++++++
>>   .../recipes-support/unbound/unbound_1.9.2.bb  | 43 ++++++++++
>>   2 files changed, 121 insertions(+)
>>   create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
>>   create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>>
>> diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
>> new file mode 100644
>> index 000000000..46f6a7b3f
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
>> @@ -0,0 +1,78 @@
>> +From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001
>> +From: Beniamin Sandu <beniaminsandu@gmail.com>
>> +Date: Tue, 16 Jul 2019 19:59:23 +0300
>> +Subject: [PATCH] contrib: add yocto compatible startup scripts
>> +
>> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>> +---
>> + contrib/unbound.init       | 10 +++++-----
>> + contrib/unbound.service.in |  4 ++--
>> + 2 files changed, 7 insertions(+), 7 deletions(-)
>> + mode change 100644 => 100755 contrib/unbound.init
>> +
>> +diff --git a/contrib/unbound.init b/contrib/unbound.init
>> +old mode 100644
>> +new mode 100755
>> +index cccadecc..4eba752b
>> +--- a/contrib/unbound.init
>> ++++ b/contrib/unbound.init
>> +@@ -19,11 +19,11 @@
>> + ### END INIT INFO
>> +
>> + # Source function library.
>> +-. /etc/rc.d/init.d/functions
>> ++. /etc/init.d/functions
>> +
>> + exec="/usr/sbin/unbound"
>> + prog="unbound"
>> +-config="/var/unbound/unbound.conf"
>> ++config="/etc/unbound/unbound.conf"
>> + pidfile="/var/unbound/unbound.pid"
>> + rootdir="/var/unbound"
>> +
>> +@@ -61,7 +61,7 @@ start() {
>> +     fi;
>> +
>> +     # if not running, start it up here
>> +-    daemon $exec
>> ++    daemonize $exec
>> +     retval=$?
>> +     echo
>> +     [ $retval -eq 0 ] && touch $lockfile
>> +@@ -71,7 +71,7 @@ start() {
>> + stop() {
>> +     echo -n $"Stopping $prog: "
>> +     # stop it here, often "killproc $prog"
>> +-    killproc -p $pidfile $prog
>> ++    killproc $prog
>> +     retval=$?
>> +     echo
>> +     [ $retval -eq 0 ] && rm -f $lockfile
>> +@@ -99,7 +99,7 @@ force_reload() {
>> +
>> + rh_status() {
>> +     # run checks to determine if the service is running or use generic status
>> +-    status -p $pidfile $prog
>> ++    status $prog
>> + }
>> +
>> + rh_status_q() {
>> +diff --git a/contrib/unbound.service.in b/contrib/unbound.service.in
>> +index 95976dd9..0e7f79a9 100644
>> +--- a/contrib/unbound.service.in
>> ++++ b/contrib/unbound.service.in
>> +@@ -10,9 +10,9 @@ WantedBy=multi-user.target
>> +
>> + [Service]
>> + ExecReload=/bin/kill -HUP $MAINPID
>> +-ExecStart=@UNBOUND_SBIN_DIR@/unbound
>> ++ExecStart=@UNBOUND_SBIN_DIR@/unbound -d
>> + NotifyAccess=main
>> +-Type=notify
>> ++Type=simple
>> + CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE
>> + MemoryDenyWriteExecute=true
>> + NoNewPrivileges=true
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>> new file mode 100644
>> index 000000000..5f9bacc31
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>> @@ -0,0 +1,43 @@
>> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
>> +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
>> +       features including enhanced security (DNSSEC) validation, Internet Protocol \
>> +       Version 6 (IPv6), and a client resolver library API as an integral part of the \
>> +       architecture"
>> +
>> +HOMEPAGE = "https://www.unbound.net/"
>> +SECTION = "net"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
>> +
>> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
>> +       file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
>> +"
>> +SRCREV="ee06aaaad99dc4d6b73f915d98f05c506885b98a"
>> +
>> +inherit autotools pkgconfig systemd update-rc.d
>> +
>> +DEPENDS = "openssl libevent libtool-native bison-native expat"
>> +RDEPENDS_${PN} = "bash openssl-bin daemonize"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
>> +               --with-ssl=${STAGING_EXECPREFIXDIR}"
>> +
>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd', d)}"
>> +PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
>> +PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
>> +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
>> +
>> +do_install_append() {
>> +       install -d ${D}${systemd_unitdir}/system
>> +       install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
>> +
>> +       install -d ${D}${sysconfdir}/init.d
>> +       install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
>> +}
>> +
>> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>> +
>> +INITSCRIPT_NAME = "unbound"
>> +INITSCRIPT_PARAMS = "defaults"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

