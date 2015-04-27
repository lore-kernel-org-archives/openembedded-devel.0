Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0031C73D5A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 04:53:22 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so71223541lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Apr 2015 21:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=BkU/QVWGdijN+Lw3EXP95A6mrg5IElzj1TCUUOz6dDs=;
	b=T4vZ8szgb+2XcbDHoWHYMEEYma0DUu9c4aXYNMHCOr5oRLuIQvYofQHi2hT7SdJI4d
	/BssXUE0xgymGKId9/XIZlJYTgVKJEDJfiXuYyjXDyiwEqVlrOXbZqFmF1QkhfAXd9dS
	m5FTqKiWjd46+veLgLImlc0VuygvZz4eIVh6CUaAy2ONUtK+Ud9Q6sVunQ4Glzpf8Jjh
	PGhaSly8sH6RYnqasgP/scX9OYXDfNkrm17GwRFwLKKlN+tYnMYzeORYHhz/qqhKoaC1
	TXqRNMP75ea7iFoICtc6hGeQ73CACwxsrRfiCnsIHw0NhNCgDGh8RKcckl5hhm0OFo1C
	SBbg==
X-Gm-Message-State: ALoCoQkvxc0PHGpvPwb10Ti5YMmg6tbrI1mKgRl6wWLzXoumetqFBWzXIqpNqFOs0ctf4FSOnVp6
X-Received: by 10.152.43.74 with SMTP id u10mr8474428lal.90.1430110402421;
	Sun, 26 Apr 2015 21:53:22 -0700 (PDT)
Received: from ad.chargestorm.se (c-89-160-69-55.cust.bredband2.com.
	[89.160.69.55])
	by mx.google.com with ESMTPSA id zf3sm4486302lbb.2.2015.04.26.21.53.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Apr 2015 21:53:21 -0700 (PDT)
Date: Mon, 27 Apr 2015 06:53:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150427045319.GA6712@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend: update according to bluez4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 04:53:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Cristian Iorga <cristian.iorga@intel.com> [150424 17:45]:

> bluez4 recipe has been updated with proper systemd
> support, so update meta-systemd append accordingly.
> Also update to the right directory structure.

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../recipes-connectivity/bluez/bluez4_4.101.bbappend                 | 5 -----
>  1 file changed, 5 deletions(-)
>  rename meta-systemd/{oe-core => meta-oe}/recipes-connectivity/bluez/bluez4_4.101.bbappend (51%)

Like Martin asked on you V2, why do you keep this as a bbappend, instead
of adding this directly to the recipe?

If you look at meta-systemd today, you'll see that there's only a minor
number of recipes from oe-core, that's being appended. All the other
recipes that previously where appended to from meta-systemd, has got
their systemd support directly in their own recipes.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

