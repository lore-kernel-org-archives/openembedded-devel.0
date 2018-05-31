Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 29A6F74ED2
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 16:23:19 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id w23-v6so2348191qkb.8
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZmqyhaImisTV9lsAKTo2R8WDvyhbpSRfgdq1qAUtUG8=;
	b=UAb7bvEynpR1A3/mqibrY/5kdzV7NsJhtPfJWE2WSxXz0kz1y8Y+4zsZE0jkcdNDkD
	u6jIeVnsIoM5kN67eUiVfbWa7ys8YBAjM9DXJXIXd1JmvhfGHPNNbp8CxBUh8qqQL0mK
	NS3YZZiZzWnkF6qYlGzs7wqz3iSsPFUO4DEP3vFWEzpvHQe+BMeGZ+ciXf1c447Ukqor
	TuaCzZidsMBKNOEWAGV5per+IUA+SxD4SwH7Y+AKDk34INjzv3/OeS8KVHI+DCNrndvK
	ExXPdS8AP5QpS5KSDc+MgQdASomuUkb+9eB2+wgDrlmFdGT88KsjCLMMgEaAOvAxH2rD
	5w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZmqyhaImisTV9lsAKTo2R8WDvyhbpSRfgdq1qAUtUG8=;
	b=ghZ1JujyC1zm6pjQGkLvPLDmYKNxP0BuIiHyRPuCdedeqn0rfPoDKi21EUwrlxRmWP
	9HkXP7TNawWRJcCxzeAOAOYfOdAyXPgzoABeCUnPomQS+GFzJP6raaYBMN2b/IE+Tfgj
	Zc+8QH4fhuihOZ5DCSIKyI9H4K1XQ5l8twm/xODRhpavMycv/xqXNvYMhxqaFln4hlwn
	xa+HZYnPuxVP6zyA6+7gAcC/E9zrQH30dhMes+9udjZ+qYKEfkKRg2hbqDdYiPPWXWmE
	C7IJah9DHFL91/LmvwYxOOCYgmgIjOnvReq0+ABp6MCr3QqaHfgHRm+bhmf/qFCE708Y
	yOxA==
X-Gm-Message-State: APt69E1kn+vgHFTmH43bydUAIkxHCl4frOU0Ts2JBCWUgZxxyCdN/Rm+
	pMsmRRxVTldLndN7hOSgo6g8+9kBPbh8QDxpH/Q=
X-Google-Smtp-Source: ADUXVKIADythVV20QErglj4sReSvzJUEP9wvTkteAc2JqW8rk6WRFW8/YyL+9lWaaaRUKRSuKgqPKSy61Mgx5+CXeuw=
X-Received: by 2002:a37:bdc5:: with SMTP id
	n188-v6mr6376684qkf.12.1527783800595; 
	Thu, 31 May 2018 09:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Thu, 31 May 2018 09:22:50
	-0700 (PDT)
In-Reply-To: <D3AF589C68C3694A8188BC776DB93B48A2F29163@BPXM17GP.gisp.nec.co.jp>
References: <D3AF589C68C3694A8188BC776DB93B48A2F29163@BPXM17GP.gisp.nec.co.jp>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2018 09:22:50 -0700
Message-ID: <CAMKF1spvfsKcn3PgXZdtaY9gKyhahDC8Ac++YorA5s4fufitxA@mail.gmail.com>
To: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] telnetd:Fix deadlock on cleanup
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
X-List-Received-Date: Thu, 31 May 2018 16:23:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 10:49 PM, Seiichi Ishitsuka
<ishitsuka.sc@ncos.nec.co.jp> wrote:
>> Please check will latest master, if you can reporduce the issue with master then we can revive this discussion on the patch.
>
> I was able to reproduce this issue on qemux86 with the latest version.
>
> Build Configuration:
> BB_VERSION           = "1.37.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "i586-poky-linux"
> MACHINE              = "qemux86"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.5"
> TUNE_FEATURES        = "m32 i586"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "master:719d068bde55ef29a3468bc0779d4cb0c11e8c1d"
> meta-oe
> meta-python
> meta-networking      = "master:bb57bac845f3cd1634862fa9868bc8e294ba74a9"
>

OK Please revive/refresh the patch and send out to ml for discussion

> How to reproduce:
>
> 1. telnet from host(192.168.7.1) to qemux86(192.168.7.2)
>
> $ cat ./telnetd.sh
>  #!/bin/sh
>
>  HOST="192.168.7.2"
>  USER="root"
>
>  while :
>  do
>    expect -c "
>    set timeout 10
>    spawn telnet $HOST
>    expect login:\  ; send \"$USER\r\"
>    expect \"# \" ; send \"exit\r\"
>  "> /dev/null
>  done
>
> $ ./telnetd.sh &
> $ ./telnetd.sh &
>
> 2. Check process status on qemux86
>
> root       325     1  0 04:41 ?        00:00:01 /usr/sbin/xinetd -pidfile /var/r
> root      3328   325  0 04:43 ?        00:00:00 in.telnetd: 192.168.7.1
> root      3330  3328  0 04:43 ?        00:00:00 [sh] <defunct>
> root      3374   325  0 04:43 ?        00:00:00 in.telnetd: 192.168.7.1
> root      3376  3374  0 04:43 ?        00:00:00 [sh] <defunct>
> root      3417   306  0 04:44 ttyS0    00:00:00 ps -ef
>
> -> Found defunct sh and in.telnetd(waiting futex).
>
> root@qemux86:~# strace -p 3328
> strace: Process 3328 attached
> futex(0x45055a18, FUTEX_WAIT_PRIVATE, 2, NULL^Cstrace: Process 3328 detached
>  <detached ...>
>
> root@qemux86:~# strace -p 3374
> strace: Process 3374 attached
> futex(0x45055a18, FUTEX_WAIT_PRIVATE, 2, NULL^Cstrace: Process 3374 detached
>  <detached ...>
>
> Best regards,
> Seiichi Ishitsuka
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

