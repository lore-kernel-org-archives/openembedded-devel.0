Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4855D607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:29:19 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u8so5189191lbk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=BscuQO1DHQOzy4qOIskn5ThxpJ4vrgDsETCCaODGXd8=;
	b=zFCFxUKfdzjMsY+fNnyhQ8f4UnUWp+kMqDAFW+2xmayBJwph46J+zCIYi6eyaVqiTi
	JLBHH2+1zawcWGYlYJ7ma8x/BCnMjMi7eFzK+f3tFKmAP9hsRg26VWIEene/bZEZbHWP
	Ik9WWA0BZd21FEc8PfXdUEYKKXXlyVm6ZvTS2vMRTIfkpq/LovsDsYm4SmWKqL036MVz
	V9peOTdZsqG/bIi/hkZrq+V9gZTbn9iVZBXksHx8o7uky1DpGkjfVPX048+bvT4UUWBa
	ev1Pg/cbjn31JlDQFqRaFd1muT3o2RPSbKZsxwFPq/qV3gwREhluy7T8W8mFymvokdsu
	7/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=BscuQO1DHQOzy4qOIskn5ThxpJ4vrgDsETCCaODGXd8=;
	b=THR3TRLBkDTcXYXJzppvA99MVkX2f2/VEBk53B+/0S/D/U+EbGiFduKsHRuq2ATQp0
	n/pvKR7YBhT4FRBTv1+qMl+fgZRDazej3HaeFzBwArKGcKrysXTWjMkEyvHY3yrfCKew
	wKgn++GEStMm3lOpLcpbSJ3BFuKrevD58Xl1RZh0RlnPDpkM8wVO6nFCJEzYALStIbV6
	nhJqGGaoYIbctg1il+ScZY2zZ92v8Gs//gWSnTkjMLnYd8vwcldP5zMRS+/1YpXlP8zu
	8L347OZ960+F9aPOy3Jz8JpO5fbMwbKka+2UJJtlOz3i5m/rZJuX1A9yawb5IbdrOAeS
	BpWw==
X-Gm-Message-State: AOPr4FXJ+jpxN0ZF5FdhNn5yNYmkfLsmT/gTGxjWIjmbYIOOb1LWLfk6zvBXhq2gcgf/pQ==
X-Received: by 10.112.227.71 with SMTP id ry7mr3045408lbc.78.1461140960210;
	Wed, 20 Apr 2016 01:29:20 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id lw1sm866260lbc.15.2016.04.20.01.29.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 01:29:19 -0700 (PDT)
Date: Wed, 20 Apr 2016 10:29:17 +0200
From: Anders Darander <anders@chargestorm.se>
To: Joe MacDonald <joe_macdonald@mentor.com>, mark.asselstine@windriver.com,
	rehsack@gmail.com, openembedded-devel@lists.openembedded.org
Message-ID: <20160420082917.GC3520@ad.chargestorm.se>
Mail-Followup-To: Joe MacDonald <joe_macdonald@mentor.com>,
	mark.asselstine@windriver.com, rehsack@gmail.com,
	openembedded-devel@lists.openembedded.org
References: <20160419142059.GB5970@mentor.com>
	<1461080229-23859-1-git-send-email-joe_macdonald@mentor.com>
	<20160420082429.GB3520@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20160420082429.GB3520@ad.chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 20 Apr 2016 08:29:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Anders Darander <anders@chargestorm.se> [160420 10:24]:

> * Joe MacDonald <joe_macdonald@mentor.com> [160419 17:36]:

> > From: Mark Asselstine <mark.asselstine@windriver.com>

> > The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
> > [dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
> > dnsmasq runtime. No sysvinit scripts are included in systemd only
> > builds (and should not be) and the dnsmasq executable has not moved to
> > /usr/sbin.

> > Reverting to the previous version of the systemd service file. If
> > folks want the local dnsmasq instance to be queried before going to
> > an external DNS they should add 'nameserver 127.0.0.1' to
> > /etc/resolv.conf. Or submit a change which will work with systemd.

> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---

> > The previous one should've been v2, so I've named this one v3 explicitly.
> > After reading more of the systemd documentation I think this approach in
> > the service file is the current best option available.  It would certainly
> > be cleaner to store the pidfile name in an environment variable but it
> > turns out on further inspection that if you pass a varaible to PIDFile,
> > you get errors (that you only see when the service is stopped, not while
> > it is running) indicating essentially that it is falling back to the
> > "guess the MAINPID value" behaviour.  So this seems to be the way we're
> > supposed to do this type of thing now.

> > -J.

> >  .../recipes-support/dnsmasq/dnsmasq.inc            |  9 ++--
> >  .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62 ++++++++++++++++++++++

> This file, dnsmasq-resolvconf-helper, isn't include in SRC_URI, neither
> in do_install(). However it is referenced in the dnsmasq.service, which
> leads to:

> Apr 08 11:07:27 ccu dnsmasq[384]: started, version 2.75 cachesize 150
> Apr 08 11:07:27 ccu dnsmasq[384]: compile time options: IPv6 GNU-getopt no-DBus no-i18n no-IDN DHCP DHCPv6 no-Lua TFTP no-conntrack ipset auth no-DNSSEC loop- detect inotify
> Apr 08 11:07:27 ccu dnsmasq-dhcp[384]: DHCP, IP range 192.168.7.1 -- 192.168.7.1, lease time 2m
> Apr 08 11:07:27 ccu dnsmasq[384]: [[0;1;39mno servers found in /etc/resolv.conf, will retry[[0m
> Apr 08 11:07:27 ccu dnsmasq[384]: read /etc/hosts - 2 addresses Apr 08 11:07:27 ccu systemd[386]: [[0;1;31mdnsmasq.service: Failed at
> step EXEC spawning /usr/bin/dnsmasq-resolvconf-helper: No such file or directory[[0m

This is the actual issue, the dnsmasq.service file will unconditionally
execute dnsmasq-resolvconf-helper, while it's only installed if the
PACKAGECONFIG resolved is set.

Could you add the line 

ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start

to dnsmasq.service conditionally on the PACKAGECONFIG resolved? (Using sed
 is an option).

> Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Control process exited, code=exited status=203[[0m
> Apr 08 11:07:27 ccu systemd[1]: [[0;1;31mFailed to start DNS forwarder and DHCP server.[[0m
> Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Unit entered failed state.[[0m
> Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Failed with result 'exit-code'.[[0m


> Thus, with the following patch amended, I'm happy with this patch!

No, I was slightly wrong...

> Cheers,
> Anders

> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> index df58e5c..db54658 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -11,6 +11,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
>             file://init \
>             file://dnsmasq.conf \
>             file://dnsmasq.service \
> +           file://dnsmasq-resolvconf-helper \
>  "

>  inherit pkgconfig update-rc.d systemd
> @@ -54,7 +55,7 @@ do_install () {
>      install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system

>      install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
> -
> +    install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}/dnsmasq-resolvconf-helper

This line should obviously not be here, as you're actually installing
dnsmasq-resolvconf-helper, if the PACKAGECONFIG resolved is set.

>      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
>          install -d ${D}${sysconfdir}/dbus-1/system.d
>          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

