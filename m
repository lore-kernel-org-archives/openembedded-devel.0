Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEA27E26B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2019 13:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46RBST1RsYzT3;
	Sun,  8 Sep 2019 15:08:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567948121;
	bh=vSKUtB0KZ4OuBAZFjy/OEy02GXXlwgDHYTZoJUccwGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5z55BZY47VrnnJB03LsxbDgSailN5g38JNiQVEI7gWwhMqXW+/dM6U+ZvGW8wADZ
	07CWhNIAVRKiq2aKq7khBv1e1UC9ezhx1cIJB2TD2FiCX8bgC5HcS+FL1vQhLe5VVC
	Zw6BBknyLZ7i00la68BtAH1JotmicTZPZp90ozqVSDAoQDy7y7n/LiA+6Q0XuketVF
	V6qJshPZT7WZziYwSFwWHRWHPqdTBcrlTD5OVEQReuTm9Up+I2fnzh9Re0ejvsbiBW
	ftogfRinGLOHI6I+2zIUOhaTTV3t2UZ/PtJAaA/cu7yIGptARU2HMdSIr5Czf89GKm
	pgsS0giIyUZgn1qh/2pfAQg0fJdb00kW4a9cAPu5OxLEGDADba9ubNKP0jsjx9eGNc
	HOLmqLNJBtwZhNDhsTSD6QKEl43Owuvosfv5rvYZYZffcE2uurT8MvMmjDRNDRFP/J
	AJGvUYynxh2+UH8cYSK0WF1s0dDa2WsNaltRuhPQhS+S0EisFe9Du5DGlFhbgtOrPW
	5z610sC9Ne85/etTQZuA1meGSGWhHGF3iznJwWimSX7ZLAXeAmI/Pk/LAxLHrU8PZY
	7iD/AvW8wj7Xotl7n1ToNKrvDQpXCL6qjeMy516/U1/yl9SATdvx2zstnDXOjNCsCE
	mdAqvOnqOMtE/uMezMvhW+bU=
Date: Sun, 8 Sep 2019 16:08:38 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190908130838.GA17080@localhost>
References: <20190906212513.16415-1-raj.khem@gmail.com>
	<c74a44cc-b085-e526-eabb-bb56441a5362@gmail.com>
	<20190907102106.GA26201@localhost>
	<CAMKF1soYXXaF6GacgUJn0HQyYDgiY_QShxbN3RB6z0OWS2xgTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soYXXaF6GacgUJn0HQyYDgiY_QShxbN3RB6z0OWS2xgTg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ltrace: Fix build on mips
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
X-List-Received-Date: Sun, 08 Sep 2019 13:08:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Sep 07, 2019 at 07:36:04AM -0700, Khem Raj wrote:
> On Sat, Sep 7, 2019 at 3:21 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Fri, Sep 06, 2019 at 05:12:24PM -0700, akuster808 wrote:
> > > On 9/6/19 2:25 PM, Khem Raj wrote:
> > > > Newer kernel UAPI headers for mips have moved these needed defines
> > > > around
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > warrior too?
> > >...
> >
> > No, this is not a problem with the UAPI headers in warrior.
> 
> anything that's using kernel 5.0+ UAPI headers has this problem and
> warrior is using 5.0
> for linux-libc headers. see [1]
> 
> [1] https://github.com/torvalds/linux/commit/9bcbf97c62931f27ab2c52f0848dec0cd48aee78

Thanks for correcting me, I was looking at the wrong commit.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


