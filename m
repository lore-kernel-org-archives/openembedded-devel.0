Return-Path: <asselsm@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id B34A060796
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:26:17 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x190so24136306vka.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to;
	bh=dlZiVFFyE/wG59O4DXl/P8pnEDQbivdOYZ0/cK88kc0=;
	b=Jl/og/mvdIoKwnXCVHUD4dj37+Q24rQsLufAzkNlDNE1tFN71FLpVV4r5rhIo+oPJA
	zO36fYxP6uszqUcyvTl/2Skm7Wen/3FRdEGZQHb5ArreYTb1yxTwXuBop/WyV2hLhGir
	eXYSai8kV/wsauMvtUiR8oHNLURCYsLxzaAzu7p0BBMF3bBRgdScRVxPWcl8ZDjbu7Ze
	Yos4HTSafs4ZvMAM83HiypLdabEP3M3rfSqmYWLgqn9tZcLdPYjIlPcm02m4VZDcYblu
	QwkAXBwpbYcJ7EvesHNko0LKXVjgNDusziiqFXei7fhCGuWM5qtSH91zsD6GR15OrDx/
	LCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to;
	bh=dlZiVFFyE/wG59O4DXl/P8pnEDQbivdOYZ0/cK88kc0=;
	b=WK3QlcpSJZ6ajU5JgHjAAGBm616xVckpl4BF1R/9OnfT2ACmn8hATTKzxQke60wdPS
	3e9rt6Hk3Te9smSq2c6aviy7BfTUMZIg8911yjrWB69YncnyOPfOk/kUjhRAB6STo16R
	EcJrJVVTwyanDoVasZ85xOJZZlAJfLHa2Qk4+PNUA9stpc+Xl0Qz+GTQlHW73uXjSC0Q
	JndbcK4F/dRFlq6qZGiSxBPAeURgcLVpeRUJPxPk52nNelgUDsMR1I/p89rX5HkfTyiT
	nJ1R7yt/gLeA/gb0GnP7ogpMnZJH3OaEPQ8ZmP2NzeQ5IlDIxp7cDHphAjaGCQXKEnwG
	azOA==
X-Gm-Message-State: AOPr4FUbXhIsQ5jcBcxozHDs3Ka1h41Fs6+OOkTqQhw22UQVYpeSgKgMNu+eyj7L9IEGfxpJA/a4Hez/26ydoQ==
MIME-Version: 1.0
X-Received: by 10.176.6.102 with SMTP id f93mr17343187uaf.59.1461007578468;
	Mon, 18 Apr 2016 12:26:18 -0700 (PDT)
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.176.65.229 with HTTP; Mon, 18 Apr 2016 12:26:18 -0700 (PDT)
In-Reply-To: <20160406130115.GB8709@ad.chargestorm.se>
References: <0527D863-997F-476E-B6EE-FEA9BDD96B0F@gmail.com>
	<20160406130115.GB8709@ad.chargestorm.se>
Date: Mon, 18 Apr 2016 15:26:18 -0400
X-Google-Sender-Auth: 9bU75vvvLcs0MwOt4qeWQ4JouqA
Message-ID: <CAPuovELwVYMqV4EpRSC6+m0Mo-j4JTQ1mCkrO5mci+kJn9N3fA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 18 Apr 2016 19:26:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 6, 2016 at 9:01 AM, Anders Darander <anders@chargestorm.se> wrote:
> Hm, unfortunately I didn't notice before this went in.
>
> * Jens Rehsack <rehsack@gmail.com> [160228 13:35]:
>
>> Add support for resolvconf integration as done in Ubuntu. This implies
>> updates of start-scripts, resolvconf plugin (on nameserver update ...),
>> populate-volatiles control file for saved nameserver list.
>
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>
> snip...
>
>> diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
>> index 549e15e..c3637e1 100644
>> --- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
>> +++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
>> @@ -5,8 +5,11 @@ After=network.target
>>  [Service]
>>  Type=forking
>>  PIDFile=/run/dnsmasq.pid
>> -ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
>> -ExecReload=/bin/kill -HUP $(/bin/cat /run/dnsmasq.pid)
>> +ExecStartPre=/usr/sbin/dnsmasq --test
>> +ExecStart=/etc/init.d/dnsmasq systemd-exec
>> +ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf
>
> This breaks on systemd-only distros. On those, the init scripts gets
> removed during installation.
>
> When patching out that removal, I'm also seeing that dnsmasq dies after
> a few minuts.
>
>
> Cheers,
> Anders

This was obviously not tested with systemd. '/usr/sbin/dnsmasq' simply
doesn't exist and as Anders points out the init scripts are not
included in systemd builds. Would be great to see a fix for this. I
plan and sending something to at least get us back to working dnsmasq
with systemd builds.

Mark

>
>> +ExecStopPre=/etc/init.d/dnsmasq systemd-stop-resolvconf
>> +ExecReload=/bin/kill -HUP $MAINPID
>
>>  [Install]
>>  WantedBy=multi-user.target
>
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

