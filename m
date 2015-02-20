Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD0373335
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 15:31:48 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id bs8so3709967wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=hZd2/OEUAKTq4YzhsL/Xx3ed8VD6NT63aXCoSWGnMUY=;
	b=k5kBmt/atqhVjYZUyXi1K8PyVc3Oo0zlUukSKHZwmPXSjB0ft/xCTn0/hetTEvKC7u
	VfH0LbLnaaYE3w0xtRyLk9UdGuprwrO7v8+5avq+MJwB+JUNeLTVfoaU4xBZrZZs5K/5
	2Xd9xhWe/PmG/iW+Nd/ocafAtGN0fc4h1X5w0Bap66iFwh4qaBIoykzXRd0xHDgPwZt5
	GPt8s8Fczq/QE/5o8MbvCy85d2f/FSaNnt+TSGZGayGmZmKSVM36pRBzLt/npSGyCku1
	rY1kFFRgpC21kBBBaxDDxMmzFBN3yViAU98BOL4HcLRy36QgW5zCF5oUajrSRbf2puB0
	Wgpg==
X-Received: by 10.194.120.132 with SMTP id lc4mr20518264wjb.92.1424446309447; 
	Fri, 20 Feb 2015 07:31:49 -0800 (PST)
Received: from [192.168.50.198] (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id m4sm42534624wjb.25.2015.02.20.07.31.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 07:31:48 -0800 (PST)
Message-ID: <54E75371.8030500@gmail.com>
Date: Fri, 20 Feb 2015 16:32:01 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1424160094-5937-1-git-send-email-sven.ebenfeld@gmail.com>
	<20150220134113.GD2322@jama>
In-Reply-To: <20150220134113.GD2322@jama>
Subject: Re: [meta-oe][PATCH v2] stunnel: Update to version 5.10
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
X-List-Received-Date: Fri, 20 Feb 2015 15:31:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Am 20.02.2015 um 14:41 schrieb Martin Jansa:
>> +EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
>> +
>> +PACKAGECONFIG ??= "systemd"
> 
> Please respect systemd in DISTRO_FEATURES, otherwise you cause this
> error in "bitbake world"
> ERROR: Nothing PROVIDES 'systemd' (but build/meta-oe/meta-networking/recipes-support/stunnel/stunnel_5.10.bb DEPENDS on or otherwise requires it)
> ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES
> 

I've sent an updated patch that considers if systemd is in DISTRO_FEATURES

>> +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"

