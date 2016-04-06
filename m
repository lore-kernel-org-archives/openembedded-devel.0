Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id DC4C27665F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 13:01:18 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id bc4so29205832lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=XZIzbAz9QPhTHYRZPXm2sVAXZlF1GoR1jrU8/actvSQ=;
	b=PPbuU2T/OOdLw68YRkH0+qvAtPTxQghme/YhFHmF2mPv6z3kE64tOGV+Rj372YtILF
	mK6C5o5s2TBnLQwYVighPtrm2ig18fbWoyrTIB5xqKbOnjoT2p/b/NgVVtO7/kKZcSiV
	CPtEH3cIJCQCYqzlbyv6kEcAAqs+fmJpeYg9He3lK7x41Hpufzs1fT59ltNyTHVzMsU/
	kNCY46ilpwd1dl12OPAPBLokDvHkHhMv+eO6eO7GAjdPPqvsv9iR5HKRLUoJY+aoYHZ3
	4HhjmDzNY0TYrfbHVHwztMkyTvWnWA8gqcVbZW2wlayzmvERIHEdcpVBoCQEvUZPInUm
	lTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=XZIzbAz9QPhTHYRZPXm2sVAXZlF1GoR1jrU8/actvSQ=;
	b=R13vvBPuSRlQdFOL231d1BOPeVY6ZA65x9ylQD/T57NGhGfXqBz+FDweBeZ5l+e1zv
	LidZGasdG7ru2z2LKy88Dzr0YBcBC7Nozd0afBG9pK/WTJLM0Pc5rPj4de4bGh/EXdJj
	PkToo5EMEYo5xnHlAoqAjd7Nib1rCEL5dUerNb/MysH/zF2SC5pu0oM53+56QNYxHAcL
	YQ2Z6tmaqjCTqu1akLuN53RJpX2dBBiA+7Dcp8+SKB373Imu66/CNWwzMYXr3AoClmBg
	pBtJi93PykXdat/fJaKsOPPyNPZWCltX9k0Y4no3/bsCC058xpfQFROGtJoCue+7SK9N
	l3lQ==
X-Gm-Message-State: AD7BkJIzMIFsrQ6HF5F26GNflRCCY15duJwU4690CsIDZFsTEu6kHGF+aWjoMj7uo7VzCg==
X-Received: by 10.112.130.74 with SMTP id oc10mr11692984lbb.14.1459947678156; 
	Wed, 06 Apr 2016 06:01:18 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id nv8sm458644lbb.7.2016.04.06.06.01.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2016 06:01:17 -0700 (PDT)
Date: Wed, 6 Apr 2016 15:01:15 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160406130115.GB8709@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <0527D863-997F-476E-B6EE-FEA9BDD96B0F@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0527D863-997F-476E-B6EE-FEA9BDD96B0F@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH] dnsmasq: steal resolvconf support from Ubuntu
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
X-List-Received-Date: Wed, 06 Apr 2016 13:01:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hm, unfortunately I didn't notice before this went in.

* Jens Rehsack <rehsack@gmail.com> [160228 13:35]:

> Add support for resolvconf integration as done in Ubuntu. This implies
> updates of start-scripts, resolvconf plugin (on nameserver update ...),
> populate-volatiles control file for saved nameserver list.

> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---

snip...

> diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> index 549e15e..c3637e1 100644
> --- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> +++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> @@ -5,8 +5,11 @@ After=network.target
>  [Service]
>  Type=forking
>  PIDFile=/run/dnsmasq.pid
> -ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
> -ExecReload=/bin/kill -HUP $(/bin/cat /run/dnsmasq.pid)
> +ExecStartPre=/usr/sbin/dnsmasq --test
> +ExecStart=/etc/init.d/dnsmasq systemd-exec
> +ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf

This breaks on systemd-only distros. On those, the init scripts gets
removed during installation.

When patching out that removal, I'm also seeing that dnsmasq dies after
a few minuts.


Cheers,
Anders

> +ExecStopPre=/etc/init.d/dnsmasq systemd-stop-resolvconf
> +ExecReload=/bin/kill -HUP $MAINPID

>  [Install]
>  WantedBy=multi-user.target

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

