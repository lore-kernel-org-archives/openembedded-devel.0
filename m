Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id B6300601A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 16:54:41 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id q99so5864926ota.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Nov 2017 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=tGIKS0uLi+OVS1zS7P/mWQ/YrPJ6qbj4/9PVp8BsBB4=;
	b=spDOSv89F7GMp2uUODxPnoI2NeBa2dO5HJGbYSMQJ1yZkz/LlTboMigSC3jJXFZKO0
	KG0MchZFlMt8ZkznYUdRK5SAhKSqLI+WtRRaFhDWspm2qhxkAacL3xkyPsB05tm7YxUg
	IdQMnwnlH8QNeh6J4Lo+QJPM4shMybhYM//dg0GAeGOIMMsU0pknTqlb6nl+48nUNvp2
	m12rNl1SZZtjfhmySdR+DEx0ImLclNtHzTrj9rM5dV1/FI/CxhglLiJdFWiYtGBZ3Css
	hDnApYmL5OKG9O87lzgk9l0dsJNiL5e11o0vsgRKPKAIn4cSJzmdpaN+JwAA4SrJ6j7A
	Qvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=tGIKS0uLi+OVS1zS7P/mWQ/YrPJ6qbj4/9PVp8BsBB4=;
	b=BZe3tTP39QLPxuAEgHZc9lBJNZFhVJQjhSgRsmNk3wi+ZwHZ1uxeNbVCDS7KSUKxBX
	7o/5d/34WOMmDRNUWDJlMYKLs6zRPsoBgvXTzqTegSdAZImrmgUUlKBw1gtUUHJsmVaX
	4hounZ/6XFMcT/SLQBUY+4knDhN/2Nsn7734kzihnQcYvPEGvHEzDvTkE+ioZetNdbnw
	257aft+56GOHeb7vRtXnx9hJlMSYZPlS2xU5ueZoNyBnMHYuxwekPtnNJ/EUD4aHDBf5
	keB/F1VpYyuWbIJj0/nH3OLlWHKvGUPCPyknb+SnJeUNftNMddSba4nBrPSDMRUsg7Iw
	WF7Q==
X-Gm-Message-State: AJaThX6UbhOTWimb+qyt1T4Dp2Ovrr+FojiRZbjByPMXqIpoH+OFO7js
	7PR1D2VYUuyaln8NVSaLhmSDsICZ
X-Google-Smtp-Source: AGs4zMaNNKrlzXjE32R+vGf3l14FdmVlcQr8UnaIugd02vvSk//HGBdB/x7aMQM5+reLTXr0paCHEw==
X-Received: by 10.157.44.71 with SMTP id f65mr712415otb.46.1510246482171;
	Thu, 09 Nov 2017 08:54:42 -0800 (PST)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178]) by smtp.gmail.com with ESMTPSA id
	f93sm3334394otb.46.2017.11.09.08.54.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 08:54:40 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id n74so5845447ota.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Nov 2017 08:54:40 -0800 (PST)
X-Received: by 10.157.21.59 with SMTP id u56mr736114otf.215.1510246479856;
	Thu, 09 Nov 2017 08:54:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Thu, 9 Nov 2017 08:54:39 -0800 (PST)
In-Reply-To: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
Date: Thu, 9 Nov 2017 14:54:39 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrE_NpWXKR8mZ=y3pa0A4DLd9a7iLE7dVK1RgoUVK1SuA@mail.gmail.com>
Message-ID: <CAP9ODKrE_NpWXKR8mZ=y3pa0A4DLd9a7iLE7dVK1RgoUVK1SuA@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Thu, 09 Nov 2017 16:54:41 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Raphael,

On Thu, Nov 9, 2017 at 2:28 PM, Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
> Like I said back in September, I'd like to merge the Chromium recipe
> I've been maintaining independently [1] since last year into the
> meta-browser layer so that more people can both benefit from it as well
> as help maintain it. Currently, the meta-browser recipe is still
> tracking Chromium 54 and ozone-wayland with Chromium 53, whereas my
> recipe tracks the latest stable releases (it's currently at
> 62.0.3202.89).

First, I'd like to thank you for all this amazing work. Chromium is
indeed a giant project and its proper integration has some specific
challenges by itself...

...
> I'd like people to look at my commits and let me know if there's any big
> issue that would prevent those changes from landing into meta-browser.
> If everything's OK, I'd then start sending the patches to the list (or
> pull requests on GitHub, whichever is preferred).

I went through all the commits, one by one. There are few that might
need minor adjustments (as for example the removal of cups support
which should be moved to a PACKAGECONFIG) but in general, they are all
good. You did a great job making it very granular and well documented
:-)

I think this is huge enough that using a pull request so we can track
comments and progress makes sense. Do you mind creating one?

I think we will end picking individual commits on the beginning to
reduce the delta and keep going until we have the bump done. Do you
think it is a good way to handle this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

