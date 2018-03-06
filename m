Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id B131A78A4F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 15:14:35 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id r26so8364025pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 07:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=jAGckw0hYik/q50+Q1gp+ozy69RMhUVydXRSINADPvg=;
	b=sBVjE6V6YYFIKnfB4/a/FN2H6MG/BGw2WgU11DMH4N3SscFc5r8HOZeyC5IHIkbksG
	oEDqh2t49GfBkp9Am+Y0g/hIiDxDiu6PmkIl8vAFmKY3m6I7XtT7QtquCPv4/tjeWyTs
	X8fHukXc9nPfbZEyG2JW2rQmQGlYi+vGux0o5r5WZaovy8YnuWnYAlvAzSJAGBXHn3q9
	RyZMHzh28Zx0pVg1LXFCl9ovJeaB0R0trD6al6E5GTqj8V9zpgDjitV5hoJH9Yf7p2fJ
	xgGpw+s/ZnW3+ZdPztUYkVjmmKGLvLYngVlW62QYLH8KvvARuWsfvyPL06xjmLsRqhBq
	GgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=jAGckw0hYik/q50+Q1gp+ozy69RMhUVydXRSINADPvg=;
	b=udWjJ9dhsZhxtWQGhhkeNnsWzs4fN0bS2yPPISCdqdA+zmgJO7bZpvGapAtPUoNdHC
	L5SOPh3jSjuoVWQ2GC27SspdyDPntYqHS49Gcbh5UeEQWcEL0o9q8wNYFR4lcwUVyoGt
	/kzJUV9KLwPjYVXJZYcoOwl7dlshQz3Zs18EtJ9xNJK7wMmJ0wUe4e7naA3vNahq40JY
	qXa2tP9z52zNJ84czEGm5otvyNbwpeEug1/xxyO1wiaTmjPxUzl4F8JV3aQ2peCXa9zB
	g3HN+C7VLw3AYTRT/WNBn2rol4TWeOMGnvCsX0dkoo5guYCNzcbsVTJjaj/HVjurKM4c
	aZpA==
X-Gm-Message-State: APf1xPD8YTnY1x62Sd5vkpfriiIRbAI/Mvqg2pqRYeW9WQKFK/z1ykiU
	qkOPIOnfWsQDzQGZNs3GxIXnxw==
X-Google-Smtp-Source: AG47ELuUNawT1MxC3sCunNlb5ERg7pzDK3v3Jj6Kp16jdrVkRbs0my19/aDHs+q8+FNaUb0u6H5ibw==
X-Received: by 10.101.71.202 with SMTP id f10mr15120178pgs.91.1520349275316;
	Tue, 06 Mar 2018 07:14:35 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:19f8:73b2:93e:af3a?
	([2601:202:4000:1184:19f8:73b2:93e:af3a])
	by smtp.gmail.com with ESMTPSA id
	a138sm30631344pfd.47.2018.03.06.07.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 07:14:34 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
	<1520301312-29879-2-git-send-email-akuster808@gmail.com>
	<CA+chaQdRsH54+GBVbW_FmaVoBz0Ry=CORNi5-uzy-gnBDHN3gg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0431b9be-ba51-3581-b5ca-7cc8a0884cd7@gmail.com>
Date: Tue, 6 Mar 2018 07:14:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdRsH54+GBVbW_FmaVoBz0Ry=CORNi5-uzy-gnBDHN3gg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/4] xorgxrdp: require x11 and pam in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Mar 2018 15:14:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 03/06/2018 01:16 AM, Martin Jansa wrote:
> Duplicates:
> https://patchwork.openembedded.org/patch/147412/
> +
> https://patchwork.openembedded.org/patch/148545/
>
> But ok.
>
> BTW: The first one is "StateMaster Next, archived", but it isn't in:
> http://git.openembedded.org/openembedded-core/log/?h=master-next
> something might be a bit off with your scripts.
Go them this time. I had to apply them to master first then cherry pick
to the stagging/master-next

- armin
>
> Regards,
>
> On Tue, Mar 6, 2018 at 2:55 AM, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb> | 4 +++-
>      1 file changed, 3 insertions(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     index 0c779b5..e86ebb5 100644
>     --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>     <http://xorgxrdp_0.2.5.bb>
>     @@ -4,10 +4,12 @@ LICENSE = "X11"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
>      "
>
>     -inherit autotools pkgconfig
>     +inherit distro_features_check autotools pkgconfig
>
>      DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
>
>     +REQUIRED_DISTRO_FEATURES = "x11 pam"
>     +
>      SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git
>     <http://github.com/neutrinolabs/xorgxrdp.git> \
>                 "
>
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


