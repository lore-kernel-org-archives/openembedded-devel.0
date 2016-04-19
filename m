Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5836067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 04:39:08 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id g184so5000803lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 21:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=shf86TgBBSNq5WwuKEMvtVWGitChiNkrrQXSvLMTTqE=;
	b=m6PZU9BiVtazuATtM7z/770mxw+rIVFCv8cID58r/EEIjnyWOqezt0hgv64ZJsI4Nk
	LCgOKWMcBL9tplVCdc78W8vjj58IlkRgrSp/HXpXeetZxJhClcyYvmv0E+kpxepVY/y/
	mFg31P2BvP5xkSVEsjLmWhKyCAhbni6fELaKP+UpFWEf+1ezouxhT0T2ZGmdKodmVZeL
	W+49Z0/baXbEqrWrH0WM+0v5I3479lq+aQWlVpCKePbYhj8gU0cU98IpWkVK38duAvoK
	fKBMaZdgLBc+/ANED2Krqofb8UAozsHPk0cHFG78aBbjyR47+WcF1S/WNVnB3z2qCgUm
	oJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=shf86TgBBSNq5WwuKEMvtVWGitChiNkrrQXSvLMTTqE=;
	b=A9oyPu5kG0/CUfmNuJD0g9malWIYGlxtRUMBs9p8hUqL5GFepr0z3/wCgqmSSoImeI
	BSz2v+kgbtsF6zeN1ZlbLYmgAGsh9OjXDFZvFRgPF4NE86RwW4SXxKKwXUUeX03+E/6C
	dFS4U6H84nM3DSMB7rMo0WcCJldNl1Lq6jYz3vx8Q/Ym4eg+3GJ87io89Lq1zTaXXgAg
	L7iqrzF7BW8Atg5vhEI56UT1toqadqpvV1U+cfbf4gRH96/CRU8ZspMPn203BK5LQgXu
	kW0dA8dfzHAr/TkhZZbYwi+5sTDqZUho3m5N8vWCdVVcxfXDg29NCnwRQ6/AAC0B4JnU
	2RGQ==
X-Gm-Message-State: AOPr4FXqiUTUXetpQ6UedPhNFGhPc6h2+++kuQMZVB5NGe34vB6xKzczHMhT+xR55XnnYQ==
X-Received: by 10.25.22.19 with SMTP id m19mr395805lfi.118.1461040747506;
	Mon, 18 Apr 2016 21:39:07 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	h94sm5501559lfi.39.2016.04.18.21.39.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2016 21:39:06 -0700 (PDT)
Date: Tue, 19 Apr 2016 06:39:05 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160419043905.GA8041@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1461011676-31707-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1461011676-31707-1-git-send-email-mark.asselstine@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH] dnsmasq: get systemd only working again
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
X-List-Received-Date: Tue, 19 Apr 2016 04:39:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Mark Asselstine <mark.asselstine@windriver.com> [160418 22:34]:

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
> ---

Acked-by: Anders Darander <anders@chargestorm.se>

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

