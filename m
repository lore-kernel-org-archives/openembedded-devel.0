Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDC47570D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 12:28:49 +0000 (UTC)
Received: by lfaz124 with SMTP id z124so45807119lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm_se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=wulZiALk1nVqc3Ia9YfDHUdUWysKBOxXbWesZ4xG+Us=;
	b=ouoxhj9vNr/94U5rPAMHSlE5PJnrWs0Dmbl62re9LdS4MlKHNBntEUyK2iZHZlyJ93
	eR/tL1icI0zc0PZgUgeORt2Qj3RDmAh1yGUzGfNGBfwbFHou8a6OFJbq9SM76KC0au8m
	RRJ7NtLSHj8V+XIZmAgEpVJ2cdAPKFZIVgqXZel8QJijn6UBSzvppRO7UjawlZCrJT2K
	D0Okfo64zj5NvcVjZuVSEFvF3J9vzYesxfOSuonOtj1MfBl26mfXiowupWhhbif0OyyL
	Mm1M6Hqx73XUEZDtU9iizy50EuurgwDaP6dfPpiSJNHWNhMUBJYMqz6GcI056frM4BoE
	ZyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=wulZiALk1nVqc3Ia9YfDHUdUWysKBOxXbWesZ4xG+Us=;
	b=VF9ZseRKoJ6+S2mPHT0Eai7PV6Ne8KWX7/XmNdG1QM3ricUXE9/tpZaqFdLAXLtmRU
	a/M9+p8fqvgTAz8GQD/ayi2FPX5ZTiRvR3L8Ves1cLlfHoYxIrwkLpHvsfMgMAuzhKc3
	+1TnegL/vKhUzmwB78r8MTzXB5gG48PNmARVAvHD6YOJGP6alxbe/0Z7P3dgmBn7tP6+
	of2QLmCMWIxtBOYsUmk9PwWN8SCj4o2DXI8q4mCfhMS4Ax82isETLo52C1G8+/Nz6/Gl
	AO+dUpWaQ3OUQyoWDGTp4tWi248RxUv3FaGYlMY5vMEL9ha1yC0AhPO/zGsJpEF/iQNi
	ChSA==
X-Gm-Message-State: ALoCoQmVH7yoFKpA/bhZxRmx9ubm4ukEmerKrLRkWrs1iXIrbv8DCXNaz1U2K8Hu2BZBs1GP03CT
X-Received: by 10.112.180.198 with SMTP id dq6mr8290132lbc.90.1445516928752;
	Thu, 22 Oct 2015 05:28:48 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	r194sm2351821lfg.5.2015.10.22.05.28.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 05:28:47 -0700 (PDT)
Date: Thu, 22 Oct 2015 14:28:46 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151022122846.GC14232@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <5628D280.10902@webthatworks.it>
MIME-Version: 1.0
In-Reply-To: <5628D280.10902@webthatworks.it>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: meta-toolchain-qt5, qttools-plugins and -nomake examples
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
X-List-Received-Date: Thu, 22 Oct 2015 12:28:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Ivan Sergio Borgonovo <mail@webthatworks.it> [151022 14:13]:

> I think I've been able to find all and only the packages that should be
> conditionally added to RDEPENDS in packagegroup-qt5-toolchain-target.bb from
> opengl.

> I finally discovered why there was a problem with meta-toolchain-qt5 and
> qttools-plugins... qttools-plugins doesn't get build when

> -nomake examples

> Now I don't understand:
> - why nobody noticed this problem that doesn't seem related to opengl or
> x11. Was it hidden by something else that I should take care when trying to
> fix it? No one is actually baking meta-toolchain-qt5?...

Or in my case mostly been staled on an older release...

> - what should be considered a correct solution:
> * simply remove the package that doesn't really seem that useful in a
> toolchain (they should be example plugins for qtcreator)

That what work for me.

> * conditionally add it just if qt get build with examples [1]

Well, this would likely be harder, as one recipe can't access the
meta data from another recipe.

Though, you could likely get the same effect by moving qttools-plugins
from RDEPENDS to RRECOMMENDS. Then it'll be added if it exist, while you
won't get any errors if it doesn't exist. 

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

