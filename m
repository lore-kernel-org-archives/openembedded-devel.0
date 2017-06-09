Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 74B0678289
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:58:30 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id o83so27786327lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jun 2017 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:cc:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=y3fdfaVi7EfRVFR1ZVnsgZgUM9h3YN5OtJScN92tkAw=;
	b=tK+4VhI94/db9Tgr+sfxRFWKd0odWDoMHQv48mOFrXrVNk9QBpV8oyuNkkkXFkPyUA
	k5LkugKkcjb6IXnX5jZcj5corplif6vl/Q67cUxDwvb/LkdfVZw8swai0CUSysKcTRFT
	rojHahW8ZasU1vLk9Ji+0PexKzWDNTdAKkJU6Q72CiZmvALbgRMS+28q7UKMcZ+Ip5bG
	qBe54gpB0QthJMiBXeDAWBQ/lDNcJMDvnjr/hlaD8gz6GVJs3g3Q/NTWiPHjtLV5IXkP
	nhgltGnV7Oym5jGHmfxBtADmteSKkEYIIZLkQFLiNmWunuICVzw8oqAlNPAnaJphSojG
	8lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=y3fdfaVi7EfRVFR1ZVnsgZgUM9h3YN5OtJScN92tkAw=;
	b=Ofl7MRyn7obxnm1l0//B9WkBqvYcZHfO9viz9i91o2XCuVeGOEGgpXfsy7t/oTCa96
	T/Jk7A70b7yKSbHK6KUemF9BxNGRUd+rFWZJUnC8jrBSTYGhpRLYN5EXFUH5gZMB9th6
	4oQeDhKmb1K6uSyZxRxECdGPZ5yl+/2c1+71kst4Q6B9X1bzE6WoQxWod8ZaLKyambRo
	LhyAeqaQCrS6UOplLlFGVG+ZYpaznZFoU9Hg4BRFV6zLrQnl38T09ZUdeEvBSgWkSPzq
	D0Y048q/J9X27MTAb6tSkliMhWN0cU8DIFvkg39ZIJpXX3mPsBVHcWbK3njBMMzu+1H6
	EGFA==
X-Gm-Message-State: AODbwcDqUssX1Q+eQzjXl1TwY8SHmaSvbrGnW9deJb4qAxyVP4yIbABx
	KZsfrUA8wbisCNmW
X-Received: by 10.46.0.77 with SMTP id 74mr5907973lja.109.1497002310556;
	Fri, 09 Jun 2017 02:58:30 -0700 (PDT)
Received: from [10.9.21.51] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	r15sm154199ljd.44.2017.06.09.02.58.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 02:58:29 -0700 (PDT)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
	<CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
	<CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
	<CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <68f3ba42-b21d-9745-646a-258490464584@gmail.com>
Date: Fri, 9 Jun 2017 12:58:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Fri, 09 Jun 2017 09:58:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I could not say.
The origin bugreport that changed this for QtWebEngine was 
https://bugreports.qt.io/browse/QTBUG-59504

On 09.06.2017 11:16, Martin Jansa wrote:
> Then why does it work for chromium which used to have the same issue?
> 
> On Fri, Jun 9, 2017 at 7:15 AM, Samuli Piippo <samuli.piippo@gmail.com 
> <mailto:samuli.piippo@gmail.com>> wrote:
> 
>     That's done on purpose, the tools are built with same bitness as the
>     target.
>     This is why you need to have gcc-multilib available on the build host.
> 
>     On Thu, Jun 8, 2017 at 10:50 PM, Martin Jansa
>     <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>      > Still passes incorrect -m32 when building host tools on 64bit
>     when the
>      > target is 32bit e.g. qemux86
>      >
>      > http://errors.yoctoproject.org/Errors/Details/144181/
>     <http://errors.yoctoproject.org/Errors/Details/144181/>
>      >
>      > On Thu, Jun 8, 2017 at 2:53 PM, Martin Jansa
>     <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>      >>
>      >> Thanks, will include v3 in next build.
>      >>
>      >> Full report with v2 included:
>      >>
>      >>
>     http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113073.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113073.html>
>      >>
>      >> There is another issue in qtwebview, which should have the same
>      >> restriction as qtwebengine otherwise for qemuarm it causes:
>      >>
>      >>     * ERROR: Nothing PROVIDES 'qtwebengine' (but
>      >>
>     /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtwebview_git.bb
>     <http://qtwebview_git.bb>
>      >> DEPENDS on or otherwise requires it)
>      >>     * ERROR: qtwebengine was skipped: incompatible with machine
>     qemuarm
>      >> (not in COMPATIBLE_MACHINE)
>      >>     * ERROR: Required build target 'meta-world-pkgdata' has no
>     buildable
>      >> providers.
>      >>
>      >>
>      >>
>      >> On Thu, Jun 8, 2017 at 2:47 PM, Samuli Piippo
>     <samuli.piippo@gmail.com <mailto:samuli.piippo@gmail.com>>
>      >> wrote:
>      >>>
>      >>> Patch updated to fix build issues with qtlocation and
>     qtremoteobjects
>      >>>
>      >>> On 08.06.2017 15:30, Samuli Piippo wrote:
>      >>>>
>      >>>> * adapt QtWebEngine recipe to use GN instead of GYP
>      >>>> * add QtRemoteObjects and QtWebView as a new Qt modules
>      >>>> * update available QtBase configure arguments
>      >>>> * remove obsolete patches
>      >>>> * patch all .pc files to remove build paths
>      >>>> * include generated QML cache files in packages
>      >>>> * the patch "configure paths for target qmake properly" could not
>      >>>>    be applied anymore and support must be done differently
>      >>>>
>      >>>> * QtWebEngine now requires gcc-multilib to be installed
>      >>>>    on the host system
>      >>>>
>      >>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io
>     <mailto:samuli.piippo@qt.io>>
>      >>>> ---
>      >>>
>      >>>
>      >>> --
>      >>> _______________________________________________
>      >>> Openembedded-devel mailing list
>      >>> Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>      >>>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>      >>
>      >>
>      >
> 
> 


