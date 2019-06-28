Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 94DB97E99F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 10:07:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45ZsrX2jc7z3l;
	Fri, 28 Jun 2019 12:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561716445;
	bh=1i5HAWgSpfEcDcqgyUVsBsJcRKmn5EDHBu92vC0V6mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICN08PWls82mqbTXH3EQi3BKiXBTL7IU9oyo2Ilnev+BQXYs58pFhYULKHgbUjuyS
	JrHynco3y7l9M/day4CMXAtidlRpugWJYBIJy1Gtz7qnQTdwvPTgOJl5/aK1kc/Ncx
	w75JxkeYWwjWCZpOsyNPdv6LSv5q5fi1GfSGLNyjiMGj2bAompT+rXx7sbEK041/Af
	akISbnTZu9iRehk6P00KQIAAEd3OD1JFFvzNe7TZUUgqi3IvwLdjVv8iiLpIZ0e24h
	DghvmDPBuLvXVG+cKnPmz0Uipb7fKOrfUkSsgDQTyNMrT/QKN7xnlISU6Pby4ntyTB
	tIoJADZrm1CIXegsbvIzxR1wB8/M2nb4slrCnFce1vFSu0GKbNgzGPCTbDpSofZ/WU
	y5ewMZDin0rqqDWCzdvhas3BS5Xhjc0eKcmZozCPeS0RXfO3A7z8EgMFUOyJd3ioay
	bKghLw5N3WtTSDfNM7cnovfGcrfy+7ER/3uq/Nay2V8a9UX3XD889kh5fRjdSZGlTI
	RtKG53mBAtfYzSwKtaEnaxQK8a1N0H1wLQF6WHZORxKytngFfqx5BFL4gSjLAfnsPJ
	xA52SJAu901BgPMzpq/HVFK953w4kCWYaJ39DXNWKZVQ+FVhHsQKtHcCnNKwNOI2vk
	KMl9DhL9m3e/qs9grEKodB5I=
Date: Fri, 28 Jun 2019 13:07:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190628100721.GB18526@localhost>
References: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkmanager: goodbye libnm-glib
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
X-List-Received-Date: Fri, 28 Jun 2019 10:07:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 27, 2019 at 09:47:49AM -0400, Hongxu Jia wrote:
> Since commit [061953143 networkmanager: Update to 1.18.0] applied,
> upstream disable libnm-glib by default. And in further networkmanager,
> upstream removes libnm-glib, libnm-glib-vpn, and libnm-util for good
>...

Any strong reason for removing this already now?

It's gone in 1.20 so removal then is clear, but if someone wants
to use it for legacy code with 1.18 this should stay possible as
long as <= 1.18 is shipped.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


