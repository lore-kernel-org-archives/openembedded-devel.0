Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 415E06012C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:24:32 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id ys16so5116348lbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=FneXlGP5Fa060sDqooYWu7mdASSC2iIv1rVk2tCZfFg=;
	b=CJ4btfaLoLcisr3Be88URdgN792p+P0H35lMndJTKIYeC9vsGiL3HAyv3AS4L6UESy
	n1gkDAhHp0hjC9aoKhehByKKnJCtjgzQUq4i222ktzqNJB46rVG/xLJRd+g97pH/9Fxr
	H/qU8ewZJNddF4rotnFF2laJmRO9kInwEs/trJdI6gnRpRX+H7jErr8szc0fQFL7aaEP
	aSuj8XA6OEDKa63aAMv98il2l0HHGIHF4Xyd8FpUywTalyjkXWefZwenxekmChk5vcAd
	N29YGWUVRDQ86V6V0153qplI/5quaSR5nE2uKH5DUcTojRQnv8soi7SeJm6qqTq2KN9b
	Gf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=FneXlGP5Fa060sDqooYWu7mdASSC2iIv1rVk2tCZfFg=;
	b=VUzX+gARY9EN91p4XfJ6K7Y+mDXWswXI3bB7+4TJ+Xp1jPcO15zrselY0j7vEXANI7
	+3nXdLmvVO7DlAYdSGTul68za1tIdsLiPitALRNZwWYpTf+VAjm9gr2Kn9c+Zfs6x5rN
	7WwhLxu+jjLbt7iqFjXgLdV4BHXDy5YGHW0UuZDpjngzYQaMAHgMT18OCYZWKVAGR3eZ
	UMAzEpuR9C/jQ3EWFScLY00Uge2Lwy1GdcbXefgE32na7dB9Dgq91eeGNlusRaoniPLz
	m4TjwtPCFPJmESgZk5XksNw2zXLeN8E1h1SPZSgMyuRQbVaNnRtQUvIBfWpDFheQz7f7
	1urQ==
X-Gm-Message-State: AOPr4FU6dGvty4GaZMePjAXyqBdSsJPVHw2KJ5rVXavY/WHAycwDXRYKcZg6ft8Od7D2zQ==
X-Received: by 10.112.145.68 with SMTP id ss4mr3172258lbb.33.1461140671689;
	Wed, 20 Apr 2016 01:24:31 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	l124sm856957lfg.40.2016.04.20.01.24.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 01:24:30 -0700 (PDT)
Date: Wed, 20 Apr 2016 10:24:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: Joe MacDonald <joe_macdonald@mentor.com>
Message-ID: <20160420082429.GB3520@ad.chargestorm.se>
Mail-Followup-To: Joe MacDonald <joe_macdonald@mentor.com>,
	mark.asselstine@windriver.com, rehsack@gmail.com,
	openembedded-devel@lists.openembedded.org
References: <20160419142059.GB5970@mentor.com>
	<1461080229-23859-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1461080229-23859-1-git-send-email-joe_macdonald@mentor.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: mark.asselstine@windriver.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3] dnsmasq: get systemd only working again
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
X-List-Received-Date: Wed, 20 Apr 2016 08:24:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Joe MacDonald <joe_macdonald@mentor.com> [160419 17:36]:

> From: Mark Asselstine <mark.asselstine@windriver.com>

> The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
> [dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
> dnsmasq runtime. No sysvinit scripts are included in systemd only
> builds (and should not be) and the dnsmasq executable has not moved to
> /usr/sbin.

> Reverting to the previous version of the systemd service file. If
> folks want the local dnsmasq instance to be queried before going to
> an external DNS they should add 'nameserver 127.0.0.1' to
> /etc/resolv.conf. Or submit a change which will work with systemd.

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---

> The previous one should've been v2, so I've named this one v3 explicitly.
> After reading more of the systemd documentation I think this approach in
> the service file is the current best option available.  It would certainly
> be cleaner to store the pidfile name in an environment variable but it
> turns out on further inspection that if you pass a varaible to PIDFile,
> you get errors (that you only see when the service is stopped, not while
> it is running) indicating essentially that it is falling back to the
> "guess the MAINPID value" behaviour.  So this seems to be the way we're
> supposed to do this type of thing now.

> -J.

>  .../recipes-support/dnsmasq/dnsmasq.inc            |  9 ++--
>  .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62 ++++++++++++++++++++++

This file, dnsmasq-resolvconf-helper, isn't include in SRC_URI, neither
in do_install(). However it is referenced in the dnsmasq.service, which
leads to:

Apr 08 11:07:27 ccu dnsmasq[384]: started, version 2.75 cachesize 150
Apr 08 11:07:27 ccu dnsmasq[384]: compile time options: IPv6 GNU-getopt no-DBus no-i18n no-IDN DHCP DHCPv6 no-Lua TFTP no-conntrack ipset auth no-DNSSEC loop- detect inotify
Apr 08 11:07:27 ccu dnsmasq-dhcp[384]: DHCP, IP range 192.168.7.1 -- 192.168.7.1, lease time 2m
Apr 08 11:07:27 ccu dnsmasq[384]: [[0;1;39mno servers found in /etc/resolv.conf, will retry[[0m
Apr 08 11:07:27 ccu dnsmasq[384]: read /etc/hosts - 2 addresses Apr 08 11:07:27 ccu systemd[386]: [[0;1;31mdnsmasq.service: Failed at
step EXEC spawning /usr/bin/dnsmasq-resolvconf-helper: No such file or directory[[0m
Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Control process exited, code=exited status=203[[0m
Apr 08 11:07:27 ccu systemd[1]: [[0;1;31mFailed to start DNS forwarder and DHCP server.[[0m
Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Unit entered failed state.[[0m
Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Failed with result 'exit-code'.[[0m


Thus, with the following patch amended, I'm happy with this patch!

Cheers,
Anders

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index df58e5c..db54658 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -11,6 +11,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq.service \
+           file://dnsmasq-resolvconf-helper \
 "

 inherit pkgconfig update-rc.d systemd
@@ -54,7 +55,7 @@ do_install () {
     install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system

     install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
-
+    install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}/dnsmasq-resolvconf-helper
     if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/



-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

