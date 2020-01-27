Return-Path: <prvs=288f39d4d=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id E7BBC7FE55
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580137078; x=1611673078;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=YlXnL0h31Rf7LCUEmvHcFT/HcB6iCra+iIdgO62HiUw=;
	b=WQCZwzBf8Dh7E6cpy2dxl/HiTE0zbn1zHpYELT18VbQtvltrIL1Tit0d
	58lrgs1GKjO5nIiXS9GqwKtDCdHWn5LgZkKU8hQK2Ma8rZArII6kdvW07
	lTIQquYu5oDgH3dkcGMwNqljg7GuAq7h46GpPVW5AEpJoCSbONaTOcMUR
	v30Ky4yGJTVqWNvDY+Ga8EMkonzvouNEkdVEsaJH9wrI7511fFZWc8QG+
	pd0teDKqUrZJeDLxs/ZjwF8c34ycE2GCWODed981jFGdD9lJRR91q2fHM
	fAGJLGRy5Ra3fgw/kEZzyRy9iIfSBPipkVPHGolWt/36igt7H+WyIoOWl w==;
IronPort-SDR: xJwUmG2UM2jrZ0VT+qZIkIO7D6H/U9lxoexPmKQG9bqkSsD1QOUuwtrmOeImlFtncyqwofqdyf
	k8ffuXwQTYiZ5DjuinM2ESOYMJz0OF1o+dtmBzmL6+54YRYDpl9K9XN3N5NRiKm8jIN6aZlEJM
	JPbPRJpXqXjdRIVVFEmcmAQC/gbkeM+sxzIsRKbRDj+vz1Yxd4pvmCcbqrnO+Gghy2XJSEbujy
	vaZRZTg6F4FtlAnoIc5NQrlXf8OCtxbYYdyxUKqgHjoYH42YywT7gXDaRwqE7+vg/UbmbK5hPm
	5yc=
X-IronPort-AV: E=Sophos;i="5.70,370,1574118000"; 
   d="scan'208";a="2501726"
Date: Mon, 27 Jan 2020 15:57:58 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200127145758.GA603314@pcleri>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<c43cf573-d876-8a4a-d978-fc4b2303e747@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c43cf573-d876-8a4a-d978-fc4b2303e747@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 0/4] openjdk-8: update to jdk8u242ga
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
X-List-Received-Date: Mon, 27 Jan 2020 14:57:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2020 at 03:10:04PM +0100, Jacob Kroon wrote:
> On 1/27/20 12:24 PM, Richard Leitner wrote:
> > This series updates Openjdk 8 to the latest "ga" release 242.
> > 
> > Successful testing has been done on a fedora-31 build host for
> > qemuarm64, qemux86-64, qemuarm32 and armv7a.
> > 
> 
> <cut>
> 
> I don't know if it is related to my setup, but "bitbake openjre-8" insists
> on rebuilding itself every time I run it, and I don't see any sstate cache
> being generated for it.

I just tried to reproduce it, but neither for armv7a nor for aarch64
openjre-8 is rebuiled on the latest poky/oe-core master when nothing was
changed in meta-java.

So in your case it also rebuilds if you call "bitbake openjre-8"
directly one-after-another without any change to the layers?

regards;rl

> 
> /Jacob

