Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2375E77155
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:26:21 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id t196so55123372lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=uSyU0/neFIHvrmGmC736e6fhmGIVKrkdJSjPBhFuBws=;
	b=htT92TLjZN2028rRze/BxYRTfzt6s7vnlQ1Bvrz1Kq/TVb0yeYkYQ2B7SafS+fA7mL
	aq2+Xf/yGyc8Sen4dsCPnHh1F8JnlybMoCv6bclwaJnzdSLz8twBELQbnoFbtGpHjWo6
	whwVFSUy1/KU4MBMM/K6OYFekb8kCNYC/DB8gAcW6Uq6QFEzTjp3CbF7Ys8csIllQKdT
	AaFcfFd++n2OpKfYIIIoNAWajGgjpV4lJRXuVK+lgV9HwLWKK6AnIMG5AUsDD9lUWLwR
	XSI5LnND294+F7KR+2n3+5cszzcdaEwsCO+Xi/30FJsUVVXhhtZgf59kPypIYlCOfmdR
	7EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=uSyU0/neFIHvrmGmC736e6fhmGIVKrkdJSjPBhFuBws=;
	b=dD44DSxGiKz3Mcu0LOGkiZB8eUQ9LpGqhjEnDb6zBd51eX1Qx2zqfIDYPOSoG6I6UM
	AkvESYc7nNcda5WqzkU17+NZb0Xe2DpFffyWGpBeaVeq5z0i5MLrwmR7H+X35nP3FbY2
	APjZF3JNAj31L1nze+HExauaS5PuY6PK1o6+MiNLIpzqgUhV285NS9StSx8iX9r53+W7
	QoWM/9WCsXTBySR3cgC/UCV2IHK3KSzuLHXnHwszoR5aFOQrw2oObp3J92QBZE/Kz3ds
	GCGGaNHQO1jxY0XfU0S0pW0xAL9f+X/TVQBUXfXc1aD9/jGba0uzDuaodEdcv1hesQRs
	xCLA==
X-Gm-Message-State: AIkVDXI8E0RLI5yEmsZbSAsec/H+DAiEpzwQ3O7bRgfeU4epuo0HT/gW49JwGIlxyBhthA==
X-Received: by 10.46.7.18 with SMTP id 18mr6910439ljh.30.1482157582612;
	Mon, 19 Dec 2016 06:26:22 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	s127sm3837971lja.31.2016.12.19.06.26.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Dec 2016 06:26:21 -0800 (PST)
Date: Mon, 19 Dec 2016 15:26:20 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161219142620.4hpmfdo3w3kk2zlu@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
	<CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
	<CAJ86T=XDvJk93+Jc4-v5H+3nTSFJ1KcQbyeUt8yvhJwfTA=pnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XDvJk93+Jc4-v5H+3nTSFJ1KcQbyeUt8yvhJwfTA=pnA@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161126 (1.7.1)
Subject: Re: [meta-oe][PATCH] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 14:26:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Andre McCurdy <armccurdy@gmail.com> [161219 15:12]:

> On Mon, Dec 19, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> > On Mon, Dec 19, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> Please don't use github archives.

> What's the recommended way to fetch from a git tag which doesn't sit
> on a branch?

Use nobranch=1, see eg
meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

